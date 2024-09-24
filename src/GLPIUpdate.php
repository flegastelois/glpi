<?php

/**
 * ---------------------------------------------------------------------
 *
 * GLPI - Gestionnaire Libre de Parc Informatique
 *
 * http://glpi-project.org
 *
 * @copyright 2015-2024 Teclib' and contributors.
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

use Glpi\Application\View\TemplateRenderer;
use Glpi\Toolbox\MarkdownRenderer;

class GLPIUpdate extends CommonGLPI
{
    public function getTabNameForItem(CommonGLPI $item, $withtemplate = 0)
    {
        return self::createTabEntry('GLPI Updates');
    }

    public static function getIcon()
    {
        return 'ti ti-reload';
    }

    public static function displayTabContentForItem(CommonGLPI $item, $tabnum = 1, $withtemplate = 0)
    {
        if ($item::class === Config::class) {
            self::showForConfig();
        }
        return true;
    }

    public static function showForConfig()
    {
        /** @var array $CFG_GLPI */
        global $CFG_GLPI;

        if (!Config::canUpdate()) {
            return false;
        }

        // Get Github releases
        $curl_error = null;
        $github_releases = self::getGithubReleases($curl_error, 10);

        if ($curl_error) {
            echo "<div class='alert alert-danger'>{$curl_error}</div>";
        }

        // Render release notes as HTML
        $md = new MarkdownRenderer();
        $md->disableHeadings();
        foreach ($github_releases as &$release) {
            $release['body_html'] = $md->render($release['body']);
        }

        // Check if the crontask checkupdate is enabled
        $check_update_cron_task = new CronTask();
        $check_update_cron_task->getFromDBbyName('CronTask', 'checkupdate');

        TemplateRenderer::getInstance()->display('pages/setup/general/glpiupdate.html.twig', [
            'config'            => $CFG_GLPI,
            'crontask_enabled'  => $check_update_cron_task->isEnabled(),
            'github_available'  => !empty($github_releases),
            'github_releases'   => $github_releases,
            'glpi_version'      => "GLPI " . GLPI_VERSION . " Copyright (C) 2015-" . GLPI_YEAR . " Teclib' and contributors",
            'is_up_to_date'     => self::isUpToDate(),
            'curl_error'        => $curl_error,
        ]);
    }

    /**
     * Check if GLPI is up to date
     *
     * @return bool
     **/
    public static function isUpToDate(): bool
    {
        $error = "";
        $releases = self::getGithubReleases($error, 1);
        $latest_version = $releases[0]['tag_name'] ?? '';

        if (!$latest_version) {
            return false;
        }

        $currentVersion = preg_replace('/^((\d+\.?)+).*$/', '$1', GLPI_VERSION);

        return version_compare($currentVersion, $latest_version, '<') ? $latest_version : true;
    }

    /**
     * Check if new version is available
     *
     * @return string
     **/
    public static function checkNewVersionAvailable()
    {
        $is_up_to_date = self::isUpToDate();

        if ($is_up_to_date !== true) {
            Config::setConfigurationValues('core', ['founded_new_version' => $is_up_to_date]);
            return sprintf(__('A new version is available: %s.'), $is_up_to_date);
        }

        return __('You have the latest available version');
    }

    /**
     * Get Github Releases sorted by tag_name
     *
     * @param string $curl_error will contains original curl error string if an error occurs
     * @param int $limit limit the number of releases to fetch
     *
     * @return array
     */
    public static function getGithubReleases(&$curl_error = null, $limit = null): array
    {
        $json_gh_releases = \Toolbox::callCurl(GLPI_GITHUB_API_RELEASE_URL, [], $curl_error, $curl_error);
        if (!$json_gh_releases || $curl_error) {
            return [];
        }

        // Filter out pre-releases
        $releases = array_filter(
            json_decode($json_gh_releases, true) ?? [],
            fn($release) => !$release['prerelease']
        );

        // Sort releases by tag_name
        usort($releases, function($a, $b) {
            return version_compare($b['tag_name'], $a['tag_name']);
        });

        if ($limit) {
            $releases = array_slice($releases, 0, $limit);
        }

        return $releases;
    }
}
