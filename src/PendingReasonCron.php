<?php

/**
 * ---------------------------------------------------------------------
 *
 * GLPI - Gestionnaire Libre de Parc Informatique
 *
 * http://glpi-project.org
 *
 * @copyright 2015-2026 Teclib' and contributors.
 * @copyright 2003-2014 by the INDEPNET Development Team.
 * @licence   https://www.gnu.org/licenses/gpl-3.0.html
 *
 * ---------------------------------------------------------------------
 *
 * LICENSE
 *
 * This file is part of GLPI.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * ---------------------------------------------------------------------
 */

/**
 * @since 10.0.0
 */
class PendingReasonCron extends CommonDBTM
{
    public const TASK_NAME = 'pendingreason_autobump_autosolve';

    /**
     * Get task description
     *
     * @return string
     */
    public static function getTaskDescription(): string
    {
        return __("Send automated follow-ups on pending tickets, solve them if necessary and end pending periods that reached their end date");
    }

    /**
     * @param string $name
     *
     * @return array
     */
    public static function cronInfo($name)
    {
        return [
            'description' => self::getTaskDescription(),
        ];
    }

    /**
     * Run from cronTask
     *
     * @param CronTask $task
     *
     * @return int
     */
    public static function cronPendingreason_autobump_autosolve(CronTask $task)
    {
        global $DB;

        $config = Config::getConfigurationValues('core', ['system_user']);

        if (empty($config['system_user'])) {
            trigger_error("Missing system_user config", E_USER_WARNING);
            return 0;
        }

        $user = User::getById($config['system_user']);
        if (!$user) {
            trigger_error("Missing system_user user", E_USER_WARNING);
            return 0;
        }

        $targets = [
            Ticket::class,
            Change::class,
            Problem::class,
        ];

        $now = $_SESSION['glpi_currenttime'];

        $data = $DB->request([
            'SELECT' => 'id',
            'FROM'   => PendingReason_Item::getTable(),
            'WHERE'  => [
                'itemtype' => $targets,
                'OR'       => [
                    'pendingreasons_id' => ['>', 0],
                    'NOT'               => ['pending_until' => null],
                ],
            ],
        ]);

        foreach ($data as $row) {
            $pending_item = PendingReason_Item::getById($row['id']);
            $itemtype = $pending_item->fields['itemtype'];
            $item = $itemtype::getById($pending_item->fields['items_id']);
            if (!$item instanceof CommonITILObject || !$pending_item instanceof PendingReason_Item) {
                trigger_error("Failed to load item", E_USER_WARNING);
                continue;
            }

            if ($item->fields['status'] != CommonITILObject::WAITING) {
                PendingReason_Item::deleteForItem($item);
                continue;
            }

            $pending_until = $pending_item->getPendingUntilDate();
            if ($pending_until !== null && $now >= $pending_until) {
                if (self::endPendingPeriod($item, $pending_item, (int) $config['system_user'])) {
                    $task->addVolume(1);
                }
                continue;
            }

            // End date only, without pending reason: no automatic followup nor resolution
            if ((int) $pending_item->fields['pendingreasons_id'] === 0) {
                continue;
            }

            // Load pending reason
            $pending_reason = PendingReason::getById($pending_item->fields['pendingreasons_id']);
            if (!$pending_reason) {
                trigger_error("Failed to load PendingReason", E_USER_WARNING);
                continue;
            }

            $next_bump = $pending_item->getNextFollowupDate();
            $resolve = $pending_item->getAutoResolvedate();

            if ($next_bump && $now > $next_bump) {
                $template_id = $pending_reason->fields['itilfollowuptemplates_id'];

                // No template defined; can't bump
                if (!$template_id) {
                    continue;
                }

                $success = $pending_item->update([
                    'id'             => $pending_item->getID(),
                    'bump_count'     => $pending_item->fields['bump_count'] + 1,
                    'last_bump_date' => $_SESSION['glpi_currenttime'],
                ]);

                if (!$success) {
                    trigger_error("Can't bump, unable to update pending item", E_USER_WARNING);
                    continue;
                }

                $itilfup_template = ITILFollowupTemplate::getById(
                    $pending_reason->fields['itilfollowuptemplates_id']
                );
                $content = '';
                if ($itilfup_template instanceof ITILFollowupTemplate) {
                    $content = $itilfup_template->getRenderedContent($item);
                }

                // Add reminder (new ITILReminder)
                $reminder = new ITILReminder();
                $reminder->add([
                    'itemtype' => $item::class,
                    'items_id' => $item->getID(),
                    'pendingreasons_id' => $pending_reason->getID(),
                    'name' => $pending_reason->fields['name'],
                    'content' => $content,
                ]);
                $task->addVolume(1);

                // Send notification
                NotificationEvent::raiseEvent('auto_reminder', $item);
            } elseif ($resolve && $now > $resolve) {
                // Load solution template
                $solution_template = SolutionTemplate::getById($pending_reason->fields['solutiontemplates_id']);
                if (!$solution_template instanceof SolutionTemplate) {
                    trigger_error("Failed to load SolutionTemplate::{$pending_reason->fields['solutiontemplates_id']}", E_USER_WARNING);
                    continue;
                }

                // Add solution
                $solution = new ITILSolution();
                $solution->add([
                    'itemtype'             => $item::class,
                    'items_id'             => $item->getID(),
                    'solutiontypes_id'     => $solution_template->fields['solutiontypes_id'],
                    'content'              => $solution_template->getRenderedContent($item),
                    'users_id'             => $config['system_user'],
                    '_disable_auto_assign' => true,
                ]);
                $task->addVolume(1);
                NotificationEvent::raiseEvent('pendingreason_resolve', $item);
            }
        }

        return 1;
    }

    /**
     * End the pending period of an ITIL object whose end date is reached:
     * add a private followup and restore the status it had before being set as pending.
     *
     * @param CommonITILObject   $item
     * @param PendingReason_Item $pending_item
     * @param int                $system_user_id
     *
     * @return bool
     */
    private static function endPendingPeriod(
        CommonITILObject $item,
        PendingReason_Item $pending_item,
        int $system_user_id
    ): bool {
        $followup = new ITILFollowup();
        $followup_added = $followup->add([
            'itemtype'                        => $item::class,
            'items_id'                        => $item->getID(),
            'users_id'                        => $system_user_id,
            'is_private'                      => 1,
            'content'                         => '<p>' . htmlescape(sprintf(
                __('End of the pending period scheduled on %s.'),
                Html::convDateTime($pending_item->fields['pending_until'])
            )) . '</p>',
            // Status is restored below, do not let the followup compute it
            '_no_reopen'                      => true,
            '_do_not_compute_takeintoaccount' => true,
        ]);
        if (!$followup_added) {
            trigger_error("Failed to add end of pending period followup", E_USER_WARNING);
            return false;
        }

        $status = (int) $pending_item->fields['previous_status'];
        if (
            $status === 0
            || $status === CommonITILObject::WAITING
            || !$item::isStatusExists($status)
        ) {
            $status = $item::isStatusExists(CommonITILObject::ASSIGNED)
                ? CommonITILObject::ASSIGNED
                : CommonITILObject::INCOMING;
        }

        $updated = $item->update([
            'id'            => $item->getID(),
            'status'        => $status,
            '_disablenotif' => true,
        ]);
        if (!$updated) {
            trigger_error("Failed to restore status after end of pending period", E_USER_WARNING);
            return false;
        }

        // Leaving WAITING status already removes pending data, make sure nothing remains
        PendingReason_Item::deleteForItem($item);

        return true;
    }

    public static function getTypeName($nb = 0)
    {
        return __('Automatic followups / resolution / end of pending');
    }
}
