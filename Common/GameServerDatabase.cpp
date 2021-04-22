/*
 * Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

void GameServerDatabaseConnection::DoPrepareStatements()
{
	if (!m_reconnecting)
		m_stmts.resize(QUERY_SRVCFG_MAX);

    PrepareStatement(QUERY_SRVCFG_EVENT_MANAGER_SELECT, "SELECT * FROM event_manager WHERE server = ? AND (exclusive_server = -1 OR exclusive_server = ?)", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_EVENT_SEASON_MANAGER_SELECT, "SELECT * FROM event_season_manager", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_MONSTER_SELECT, "SELECT * FROM monster WHERE disabled = 0 AND server = ?", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_MONSTER_SELECT_GUID, "SELECT * FROM monster WHERE disabled = 0 AND server = ? AND guid >= ?", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_MONSTER_RESPAWN_LOCATION_SELECT, "SELECT * FROM monster_respawn_location WHERE server = ?", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_NOTICE_SELECT, "SELECT * FROM notice WHERE server = ?", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_MISC_NON_PK_TIME_SELECT, "SELECT * FROM misc_non_pk_time WHERE server = ?", CONNECTION_SYNCH);
	PrepareStatement(QUERY_SRVCFG_MONSTER_DISABLE, "UPDATE monster SET disabled = 1 WHERE server = ? AND guid = ?", CONNECTION_ASYNC);
	PrepareStatement(QUERY_SRVCFG_MONSTER_ADD, "INSERT IGNORE INTO monster (server, guid, id, world, x1, y1, x2, y2, direction, spawn_distance, move_distance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", CONNECTION_ASYNC);
	PrepareStatement(QUERY_SRVCFG_MONSTER_MAX_GUID, "SELECT MAX(i.guid) FROM monster i where i.server = ?", CONNECTION_SYNCH);

	PrepareStatement(QUERY_GAME_INSERT_QUEST, "INSERT INTO quest_mu (id, name, server, day, template_type_1, chapter, category, importance, start_type, start_sub_type, level_min, level_max, repeat_cycle, precedence_quest, start_item_type, start_item_index, check_gens, zen, required_class_dark_wizard, required_class_dark_knight, required_class_fairy_elf, required_class_magic_gladiator, required_class_dark_lord, required_class_summoner, required_class_rage_fighter, required_class_grow_lancer, required_class_rune_wizard, required_class_slayer, required_class_gun_crusher, add_class, template_type_2, objective_type, objective_main_type, objective_main_sub_type, target_number, target_max_level, drop_rate, gate_id, map_id, x, y, reward_experience, reward_zen, reward_gens_points, reward_item_type_1, reward_item_index_1, reward_item_count_1, reward_item_type_2, reward_item_index_2, reward_item_count_2, reward_item_type_3, reward_item_index_3, reward_item_count_3, reward_type, reward_sub_type, reward_number)"
		"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", CONNECTION_ASYNC);
}