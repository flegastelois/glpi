/**
 * ---------------------------------------------------------------------
 *
 * GLPI - Gestionnaire Libre de Parc Informatique
 *
 * http://glpi-project.org
 *
 * @copyright 2015-2026 Teclib' and contributors.
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

import { expect, test } from '../../fixtures/glpi_fixture';
import { TicketPage } from '../../pages/TicketPage';
import { Profiles } from '../../utils/Profiles';
import { getWorkerEntityId } from '../../utils/WorkerEntities';

test('shows the pending end date field when pending is checked', async ({ profile, page, api }) => {
    await profile.set(Profiles.SuperAdmin);

    const ticket_id = await api.createItem('Ticket', {
        name: `Pending until field ${Date.now()}`,
        content: 'Test ticket',
        entities_id: getWorkerEntityId(),
    });

    const ticket = new TicketPage(page);
    await ticket.goto(ticket_id);
    await ticket.getButton('Answer').click();

    const followup_block = page.getByTestId('new-ITILFollowup-block');
    await followup_block.getByTestId('pending-checkbox').click();

    await expect(followup_block.getByLabel('Pending until')).toBeVisible();

    // The date must be readable and typable: the picker needs a usable width
    const box = await followup_block.getByLabel('Pending until').boundingBox();
    expect(box?.width).toBeGreaterThanOrEqual(150);
});

test('displays the pending end date in the timeline', async ({ profile, page, api }) => {
    await profile.set(Profiles.SuperAdmin);

    const ticket_id = await api.createItem('Ticket', {
        name: `Pending until badge ${Date.now()}`,
        content: 'Test ticket',
        entities_id: getWorkerEntityId(),
    });
    await api.createItem('ITILFollowup', {
        itemtype: 'Ticket',
        items_id: ticket_id,
        content: 'Waiting for the subscription start date',
        pending: 1,
        pending_until: '2037-12-31 14:30:00',
    });

    const ticket = new TicketPage(page);
    await ticket.goto(ticket_id);

    const badge = page.getByTestId('pending-until-badge').first();
    await expect(badge).toContainText('Pending until');
    // Date and time, in the default date format (YYYY-MM-DD)
    await expect(badge).toContainText('2037-12-31 14:30');
});

test('pre-fills the pending end date of a new followup from the pending ticket', async ({ profile, page, api }) => {
    await profile.set(Profiles.SuperAdmin);

    const ticket_id = await api.createItem('Ticket', {
        name: `Pending until prefill ${Date.now()}`,
        content: 'Test ticket',
        entities_id: getWorkerEntityId(),
    });
    await api.createItem('ITILFollowup', {
        itemtype: 'Ticket',
        items_id: ticket_id,
        content: 'Waiting for the subscription start date',
        pending: 1,
        pending_until: '2037-12-31 14:30:00',
    });

    const ticket = new TicketPage(page);
    await ticket.goto(ticket_id);
    await ticket.getButton('Answer').click();

    const followup_block = page.getByTestId('new-ITILFollowup-block');
    await expect(followup_block.getByLabel('Pending until')).toHaveValue(/2037-12-31/);
});
