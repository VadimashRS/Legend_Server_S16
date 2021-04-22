/*
 Navicat Premium Data Transfer

 Source Server         : Lgd-Server Test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 135.125.191.26:3306
 Source Schema         : characters

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 26/03/2021 02:55:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_buff
-- ----------------------------
DROP TABLE IF EXISTS `account_buff`;
CREATE TABLE `account_buff`  (
  `account_id` int UNSIGNED NOT NULL,
  `buff` smallint UNSIGNED NOT NULL,
  `effect_1` tinyint UNSIGNED NOT NULL,
  `value_1` int NOT NULL,
  `effect_2` tinyint UNSIGNED NOT NULL,
  `value_2` int NOT NULL,
  `effect_3` tinyint UNSIGNED NOT NULL,
  `value_3` int NOT NULL,
  `duration` bigint NOT NULL,
  `flags` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`account_id`, `buff`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_cash_shop_gift
-- ----------------------------
DROP TABLE IF EXISTS `account_cash_shop_gift`;
CREATE TABLE `account_cash_shop_gift`  (
  `account_id` int UNSIGNED NOT NULL,
  `product` int UNSIGNED NOT NULL,
  `option` int UNSIGNED NOT NULL,
  `serial` int UNSIGNED NOT NULL,
  `serial_cash_shop` int UNSIGNED NOT NULL,
  `server` smallint UNSIGNED NOT NULL,
  `date` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_cash_shop_item
-- ----------------------------
DROP TABLE IF EXISTS `account_cash_shop_item`;
CREATE TABLE `account_cash_shop_item`  (
  `account_id` int UNSIGNED NOT NULL,
  `product` int UNSIGNED NOT NULL,
  `option` int UNSIGNED NOT NULL,
  `serial` int UNSIGNED NOT NULL,
  `serial_cash_shop` int UNSIGNED NOT NULL,
  `server` smallint UNSIGNED NOT NULL,
  `gift` tinyint UNSIGNED NOT NULL,
  `date` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data`  (
  `account_id` int UNSIGNED NOT NULL,
  `vip_status` int NULL DEFAULT NULL,
  `vip_duration` bigint NULL DEFAULT NULL,
  `expanded_warehouse` tinyint UNSIGNED NULL DEFAULT NULL,
  `expanded_warehouse_time` bigint NULL DEFAULT NULL,
  `special_character` smallint UNSIGNED NULL DEFAULT NULL,
  `credits` int UNSIGNED NULL DEFAULT NULL,
  `web_credits` int UNSIGNED NULL DEFAULT NULL,
  `current_character` int UNSIGNED NULL DEFAULT NULL,
  `current_type` tinyint UNSIGNED NULL DEFAULT NULL,
  `current_ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `current_mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `current_diskserial` int UNSIGNED NULL DEFAULT NULL,
  `current_server` smallint UNSIGNED NULL DEFAULT NULL,
  `cash_shop_discount_wc` tinyint UNSIGNED NULL DEFAULT NULL,
  `cash_shop_discount_gp` tinyint UNSIGNED NULL DEFAULT NULL,
  `cash_shop_discount_date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for account_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `account_warehouse`;
CREATE TABLE `account_warehouse`  (
  `account_id` int UNSIGNED NOT NULL,
  `money` int UNSIGNED NULL DEFAULT NULL,
  `password` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for arka_war_data
-- ----------------------------
DROP TABLE IF EXISTS `arka_war_data`;
CREATE TABLE `arka_war_data`  (
  `id` tinyint UNSIGNED NOT NULL,
  `guild` int UNSIGNED NOT NULL,
  `attribute` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `guild`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_siege_data
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_data`;
CREATE TABLE `castle_siege_data`  (
  `owner` int UNSIGNED NOT NULL,
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  `tax_hunt` int NULL DEFAULT NULL,
  `tax_chaos` tinyint UNSIGNED NULL DEFAULT NULL,
  `tax_store` tinyint UNSIGNED NULL DEFAULT NULL,
  `hunt_allowed` tinyint NULL DEFAULT NULL,
  `money` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_siege_guild
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_guild`;
CREATE TABLE `castle_siege_guild`  (
  `guild` int UNSIGNED NOT NULL,
  `side` tinyint UNSIGNED NOT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`guild`, `side`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_siege_npc
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_npc`;
CREATE TABLE `castle_siege_npc`  (
  `npc` smallint UNSIGNED NOT NULL,
  `id` tinyint UNSIGNED NULL DEFAULT NULL,
  `defense_level` tinyint UNSIGNED NULL DEFAULT NULL,
  `regen_level` tinyint UNSIGNED NULL DEFAULT NULL,
  `life_level` tinyint UNSIGNED NULL DEFAULT NULL,
  `life` int NULL DEFAULT NULL,
  PRIMARY KEY (`npc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for castle_siege_registered_guild
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_registered_guild`;
CREATE TABLE `castle_siege_registered_guild`  (
  `guild` int UNSIGNED NOT NULL,
  `marks` int UNSIGNED NULL DEFAULT NULL,
  `register_id` int UNSIGNED NULL DEFAULT NULL,
  `level` smallint UNSIGNED NULL DEFAULT NULL,
  `level_master` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guild`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chaos_castle_survival_hall_of_fame
-- ----------------------------
DROP TABLE IF EXISTS `chaos_castle_survival_hall_of_fame`;
CREATE TABLE `chaos_castle_survival_hall_of_fame`  (
  `char_id` int UNSIGNED NOT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chaos_castle_survival_ranking
-- ----------------------------
DROP TABLE IF EXISTS `chaos_castle_survival_ranking`;
CREATE TABLE `chaos_castle_survival_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `score` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_buff
-- ----------------------------
DROP TABLE IF EXISTS `character_buff`;
CREATE TABLE `character_buff`  (
  `char_id` int UNSIGNED NOT NULL,
  `buff` smallint UNSIGNED NOT NULL,
  `effect_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `value_1` int NULL DEFAULT NULL,
  `effect_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `value_2` int NULL DEFAULT NULL,
  `effect_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `value_3` int NULL DEFAULT NULL,
  `duration` bigint NULL DEFAULT NULL,
  `flags` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `buff`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_chat_block
-- ----------------------------
DROP TABLE IF EXISTS `character_chat_block`;
CREATE TABLE `character_chat_block`  (
  `char_id` int UNSIGNED NOT NULL,
  `blocked` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_date
-- ----------------------------
DROP TABLE IF EXISTS `character_date`;
CREATE TABLE `character_date`  (
  `char_id` int UNSIGNED NOT NULL,
  `id` int UNSIGNED NOT NULL,
  `date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_deleted
-- ----------------------------
DROP TABLE IF EXISTS `character_deleted`;
CREATE TABLE `character_deleted`  (
  `account_id` int UNSIGNED NOT NULL,
  `char_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_event_count
-- ----------------------------
DROP TABLE IF EXISTS `character_event_count`;
CREATE TABLE `character_event_count`  (
  `char_id` int UNSIGNED NOT NULL,
  `event_id` tinyint UNSIGNED NOT NULL,
  `count` tinyint UNSIGNED NULL DEFAULT NULL,
  `day` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`char_id`, `event_id`, `day`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_friend
-- ----------------------------
DROP TABLE IF EXISTS `character_friend`;
CREATE TABLE `character_friend`  (
  `char_id` int UNSIGNED NOT NULL,
  `friend_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`char_id`, `friend_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_gameoption
-- ----------------------------
DROP TABLE IF EXISTS `character_gameoption`;
CREATE TABLE `character_gameoption`  (
  `char_id` int UNSIGNED NOT NULL,
  `game_option` tinyint UNSIGNED NULL DEFAULT NULL,
  `chat_window` tinyint UNSIGNED NULL DEFAULT NULL,
  `q_key` tinyint UNSIGNED NULL DEFAULT NULL,
  `w_key` tinyint UNSIGNED NULL DEFAULT NULL,
  `e_key` tinyint UNSIGNED NULL DEFAULT NULL,
  `r_key` tinyint UNSIGNED NULL DEFAULT NULL,
  `qwer_level` int NULL DEFAULT NULL,
  `skill_bind_0` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_1` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_2` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_3` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_4` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_5` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_6` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_7` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_8` smallint UNSIGNED NULL DEFAULT NULL,
  `skill_bind_9` smallint UNSIGNED NULL DEFAULT NULL,
  `extra_data` bigint UNSIGNED NULL DEFAULT NULL,
  `change_skin` tinyint UNSIGNED NULL DEFAULT NULL,
  `additional_options` smallint UNSIGNED NULL DEFAULT NULL,
  `button_bind_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `button_bind_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `button_bind_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `button_bind_4` tinyint UNSIGNED NULL DEFAULT NULL,
  `button_bind_5` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_gens
-- ----------------------------
DROP TABLE IF EXISTS `character_gens`;
CREATE TABLE `character_gens`  (
  `char_id` int UNSIGNED NOT NULL,
  `family` tinyint UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  `contribution` int NULL DEFAULT NULL,
  `reward_date` bigint NULL DEFAULT NULL,
  `join_date` bigint NULL DEFAULT NULL,
  `left_date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `family`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_gens_kill
-- ----------------------------
DROP TABLE IF EXISTS `character_gens_kill`;
CREATE TABLE `character_gens_kill`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `killed_id` int UNSIGNED NULL DEFAULT NULL,
  `count` int UNSIGNED NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_helper
-- ----------------------------
DROP TABLE IF EXISTS `character_helper`;
CREATE TABLE `character_helper`  (
  `char_id` int UNSIGNED NOT NULL,
  `option_flag_1` int UNSIGNED NULL DEFAULT NULL,
  `option_flag_2` int UNSIGNED NULL DEFAULT NULL,
  `item_pick_flag` tinyint UNSIGNED NULL DEFAULT NULL,
  `hunting_range` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_pick_range` tinyint UNSIGNED NULL DEFAULT NULL,
  `distance` smallint UNSIGNED NULL DEFAULT NULL,
  `attack_skill_1` smallint UNSIGNED NULL DEFAULT NULL,
  `attack_sec_skill_1` smallint UNSIGNED NULL DEFAULT NULL,
  `attack_sec_skill_2` smallint UNSIGNED NULL DEFAULT NULL,
  `attack_sec_delay_1` smallint UNSIGNED NULL DEFAULT NULL,
  `attack_sec_delay_2` smallint UNSIGNED NULL DEFAULT NULL,
  `buff_skill_1` smallint UNSIGNED NULL DEFAULT NULL,
  `buff_skill_2` smallint UNSIGNED NULL DEFAULT NULL,
  `buff_skill_3` smallint UNSIGNED NULL DEFAULT NULL,
  `time_space_casting` smallint UNSIGNED NULL DEFAULT NULL,
  `percent_autopot` tinyint UNSIGNED NULL DEFAULT NULL,
  `percent_autoheal` tinyint UNSIGNED NULL DEFAULT NULL,
  `percent_partyheal` tinyint UNSIGNED NULL DEFAULT NULL,
  `percent_drainlife` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_list` smallint UNSIGNED NULL DEFAULT NULL,
  `buff_item_1` smallint UNSIGNED NULL DEFAULT NULL,
  `buff_item_2` smallint UNSIGNED NULL DEFAULT NULL,
  `buff_item_3` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_hunting_record
-- ----------------------------
DROP TABLE IF EXISTS `character_hunting_record`;
CREATE TABLE `character_hunting_record`  (
  `char_id` int UNSIGNED NOT NULL,
  `world` smallint UNSIGNED NOT NULL,
  `year` smallint UNSIGNED NULL DEFAULT NULL,
  `month` tinyint UNSIGNED NULL DEFAULT NULL,
  `day` tinyint UNSIGNED NULL DEFAULT NULL,
  `level` int UNSIGNED NULL DEFAULT NULL,
  `duration` int UNSIGNED NULL DEFAULT NULL,
  `damage` bigint UNSIGNED NULL DEFAULT NULL,
  `elemental_damage` bigint UNSIGNED NULL DEFAULT NULL,
  `healing` int UNSIGNED NULL DEFAULT NULL,
  `killed_count` int UNSIGNED NULL DEFAULT NULL,
  `earned_experience` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `world`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_info
-- ----------------------------
DROP TABLE IF EXISTS `character_info`;
CREATE TABLE `character_info`  (
  `guid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `authority` tinyint UNSIGNED NULL DEFAULT NULL,
  `race` tinyint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slot` tinyint NULL DEFAULT NULL,
  `level` smallint NULL DEFAULT NULL,
  `level_master` smallint NULL DEFAULT NULL,
  `level_majestic` smallint NULL DEFAULT NULL,
  `experience` bigint NULL DEFAULT NULL,
  `experience_master` bigint NULL DEFAULT NULL,
  `experience_majestic` bigint NULL DEFAULT NULL,
  `points` int NULL DEFAULT NULL,
  `points_master` int NULL DEFAULT NULL,
  `points_majestic` int NULL DEFAULT NULL,
  `strength` int UNSIGNED NULL DEFAULT NULL,
  `agility` int UNSIGNED NULL DEFAULT NULL,
  `vitality` int UNSIGNED NULL DEFAULT NULL,
  `energy` int UNSIGNED NULL DEFAULT NULL,
  `leadership` int UNSIGNED NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint NULL DEFAULT NULL,
  `world_y` smallint NULL DEFAULT NULL,
  `direction` tinyint UNSIGNED NULL DEFAULT NULL,
  `money` int UNSIGNED NULL DEFAULT NULL,
  `life` int NULL DEFAULT NULL,
  `mana` int NULL DEFAULT NULL,
  `shield` int NULL DEFAULT NULL,
  `stamina` int NULL DEFAULT NULL,
  `add_fruit_points` int NULL DEFAULT NULL,
  `dec_fruit_points` int NULL DEFAULT NULL,
  `expanded_inventory` tinyint UNSIGNED NULL DEFAULT NULL,
  `mute_time` bigint NULL DEFAULT NULL,
  `admin_flags` int UNSIGNED NULL DEFAULT NULL,
  `pk_level` tinyint UNSIGNED NULL DEFAULT 3,
  `pk_count` int NULL DEFAULT NULL,
  `pk_points` int NULL DEFAULT NULL,
  `first_time` tinyint UNSIGNED NULL DEFAULT 1,
  `santa_claus_gift` bigint NULL DEFAULT NULL,
  `personal_store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `personal_store_open` tinyint NULL DEFAULT NULL,
  `goblin_points` int UNSIGNED NULL DEFAULT NULL,
  `last_use` bigint NULL DEFAULT NULL,
  `kick_time` bigint NULL DEFAULT NULL,
  `post_count` int NULL DEFAULT NULL,
  `post_day` tinyint UNSIGNED NULL DEFAULT NULL,
  `post_month` tinyint UNSIGNED NULL DEFAULT NULL,
  `ruud_money` int UNSIGNED NULL DEFAULT NULL,
  `hunting_log_visible` tinyint UNSIGNED NULL DEFAULT NULL,
  `create_date` bigint NULL DEFAULT NULL,
  `online` tinyint NULL DEFAULT NULL,
  `server_code` smallint UNSIGNED NULL DEFAULT 3,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_item_delay
-- ----------------------------
DROP TABLE IF EXISTS `character_item_delay`;
CREATE TABLE `character_item_delay`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `item` smallint UNSIGNED NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_jewel_bingo
-- ----------------------------
DROP TABLE IF EXISTS `character_jewel_bingo`;
CREATE TABLE `character_jewel_bingo`  (
  `char_id` int UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `box` tinyint UNSIGNED NULL DEFAULT NULL,
  `count` tinyint UNSIGNED NULL DEFAULT NULL,
  `jewel` tinyint UNSIGNED NULL DEFAULT NULL,
  `score1` int NULL DEFAULT NULL,
  `score2` int NULL DEFAULT NULL,
  `score3` int NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_jewel_bingo_grid
-- ----------------------------
DROP TABLE IF EXISTS `character_jewel_bingo_grid`;
CREATE TABLE `character_jewel_bingo_grid`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `slot` tinyint UNSIGNED NULL DEFAULT NULL,
  `value` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_kick
-- ----------------------------
DROP TABLE IF EXISTS `character_kick`;
CREATE TABLE `character_kick`  (
  `char_id` int UNSIGNED NOT NULL,
  `character_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_labyrinth
-- ----------------------------
DROP TABLE IF EXISTS `character_labyrinth`;
CREATE TABLE `character_labyrinth`  (
  `char_id` int UNSIGNED NOT NULL,
  `stage` tinyint UNSIGNED NULL DEFAULT NULL,
  `id` tinyint UNSIGNED NULL DEFAULT NULL,
  `level` smallint UNSIGNED NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  `killed_monsters` int NULL DEFAULT NULL,
  `earned_experience` bigint NULL DEFAULT NULL,
  `completed_missions` int NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL,
  `goblin_state` tinyint UNSIGNED NULL DEFAULT NULL,
  `day_first` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_labyrinth_level
-- ----------------------------
DROP TABLE IF EXISTS `character_labyrinth_level`;
CREATE TABLE `character_labyrinth_level`  (
  `char_id` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_labyrinth_zone
-- ----------------------------
DROP TABLE IF EXISTS `character_labyrinth_zone`;
CREATE TABLE `character_labyrinth_zone`  (
  `char_id` int UNSIGNED NOT NULL,
  `idx` tinyint UNSIGNED NOT NULL,
  `subidx` tinyint UNSIGNED NOT NULL,
  `mission_id_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `mission_id_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `mission_id_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `mission_id_4` tinyint UNSIGNED NULL DEFAULT NULL,
  `mission_id_5` tinyint UNSIGNED NULL DEFAULT NULL,
  `mission_count_1` int NULL DEFAULT NULL,
  `mission_count_2` int NULL DEFAULT NULL,
  `mission_count_3` int NULL DEFAULT NULL,
  `mission_count_4` int NULL DEFAULT NULL,
  `mission_count_5` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `idx`, `subidx`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_mail
-- ----------------------------
DROP TABLE IF EXISTS `character_mail`;
CREATE TABLE `character_mail`  (
  `id` int UNSIGNED NOT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `from_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direction` tinyint UNSIGNED NULL DEFAULT NULL,
  `action` tinyint UNSIGNED NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `window_guid` int UNSIGNED NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL,
  `opened` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_majestic_stats
-- ----------------------------
DROP TABLE IF EXISTS `character_majestic_stats`;
CREATE TABLE `character_majestic_stats`  (
  `char_id` int UNSIGNED NOT NULL,
  `id` tinyint UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_majestic_tree
-- ----------------------------
DROP TABLE IF EXISTS `character_majestic_tree`;
CREATE TABLE `character_majestic_tree`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `section` tinyint UNSIGNED NULL DEFAULT NULL,
  `id` smallint UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_mini_bomb
-- ----------------------------
DROP TABLE IF EXISTS `character_mini_bomb`;
CREATE TABLE `character_mini_bomb`  (
  `char_id` int UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` smallint UNSIGNED NULL DEFAULT NULL,
  `total_score` int NULL DEFAULT NULL,
  `cdate` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_mini_bomb_grid
-- ----------------------------
DROP TABLE IF EXISTS `character_mini_bomb_grid`;
CREATE TABLE `character_mini_bomb_grid`  (
  `char_id` int UNSIGNED NOT NULL,
  `cell` tinyint UNSIGNED NULL DEFAULT NULL,
  `value` tinyint UNSIGNED NULL DEFAULT NULL,
  `status` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_monster_soul
-- ----------------------------
DROP TABLE IF EXISTS `character_monster_soul`;
CREATE TABLE `character_monster_soul`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` int UNSIGNED NULL DEFAULT NULL,
  `id` int UNSIGNED NOT NULL,
  `amount` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_mu_roomy
-- ----------------------------
DROP TABLE IF EXISTS `character_mu_roomy`;
CREATE TABLE `character_mu_roomy`  (
  `char_id` int UNSIGNED NOT NULL,
  `playing` tinyint UNSIGNED NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` smallint UNSIGNED NULL DEFAULT NULL,
  `card_count` tinyint UNSIGNED NULL DEFAULT NULL,
  `special_card_count` tinyint UNSIGNED NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_mu_roomy_deck
-- ----------------------------
DROP TABLE IF EXISTS `character_mu_roomy_deck`;
CREATE TABLE `character_mu_roomy_deck`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `slot` tinyint UNSIGNED NULL DEFAULT NULL,
  `color` tinyint UNSIGNED NULL DEFAULT NULL,
  `number` tinyint UNSIGNED NULL DEFAULT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `play_slot` tinyint UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_numeric_baseball
-- ----------------------------
DROP TABLE IF EXISTS `character_numeric_baseball`;
CREATE TABLE `character_numeric_baseball`  (
  `char_id` int UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `number_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `number_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `number_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `numbers` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `strikes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_quest_evo
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_evo`;
CREATE TABLE `character_quest_evo`  (
  `char_id` int UNSIGNED NOT NULL,
  `id` tinyint UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `kill_count_1` int NULL DEFAULT NULL,
  `kill_count_2` int NULL DEFAULT NULL,
  `kill_count_3` int NULL DEFAULT NULL,
  `kill_count_4` int NULL DEFAULT NULL,
  `kill_count_5` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_quest_guided
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_guided`;
CREATE TABLE `character_quest_guided`  (
  `char_id` int UNSIGNED NOT NULL,
  `quest` smallint UNSIGNED NOT NULL,
  `count` int NULL DEFAULT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `quest`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_quest_mu
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_mu`;
CREATE TABLE `character_quest_mu`  (
  `char_id` int UNSIGNED NOT NULL,
  `quest_id` smallint UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `objective` smallint UNSIGNED NULL DEFAULT NULL,
  `date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `quest_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_restriction
-- ----------------------------
DROP TABLE IF EXISTS `character_restriction`;
CREATE TABLE `character_restriction`  (
  `char_id` int UNSIGNED NOT NULL,
  `restriction` int UNSIGNED NULL DEFAULT NULL,
  `time` bigint NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_score
-- ----------------------------
DROP TABLE IF EXISTS `character_score`;
CREATE TABLE `character_score`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_skill
-- ----------------------------
DROP TABLE IF EXISTS `character_skill`;
CREATE TABLE `character_skill`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `skill` smallint UNSIGNED NOT NULL,
  `skill_level` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `skill`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_statistics
-- ----------------------------
DROP TABLE IF EXISTS `character_statistics`;
CREATE TABLE `character_statistics`  (
  `char_id` int UNSIGNED NOT NULL,
  `statistic_id` int UNSIGNED NOT NULL,
  `count` bigint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `statistic_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_warp_favorite_list
-- ----------------------------
DROP TABLE IF EXISTS `character_warp_favorite_list`;
CREATE TABLE `character_warp_favorite_list`  (
  `char_id` int UNSIGNED NOT NULL,
  `slot` tinyint UNSIGNED NULL DEFAULT NULL,
  `data` smallint UNSIGNED NULL DEFAULT NULL,
  `warp_id` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for crywolf_data
-- ----------------------------
DROP TABLE IF EXISTS `crywolf_data`;
CREATE TABLE `crywolf_data`  (
  `state` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_arka_war_kill
-- ----------------------------
DROP TABLE IF EXISTS `event_arka_war_kill`;
CREATE TABLE `event_arka_war_kill`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_rank` tinyint UNSIGNED NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_01` int UNSIGNED NULL DEFAULT NULL,
  `guild_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_id` int UNSIGNED NULL DEFAULT NULL,
  `killer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_rank` tinyint UNSIGNED NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_02` int UNSIGNED NULL DEFAULT NULL,
  `guild_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint NULL DEFAULT NULL,
  `world_y` smallint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_arka_war_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_arka_war_ranking`;
CREATE TABLE `event_arka_war_ranking`  (
  `guild_id_01` int UNSIGNED NULL DEFAULT NULL,
  `guild_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_02` int UNSIGNED NULL DEFAULT NULL,
  `guild_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `character_count` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_castle_siege_kill
-- ----------------------------
DROP TABLE IF EXISTS `event_castle_siege_kill`;
CREATE TABLE `event_castle_siege_kill`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_rank` tinyint UNSIGNED NULL DEFAULT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_01` int UNSIGNED NULL DEFAULT NULL,
  `guild_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_id` int UNSIGNED NULL DEFAULT NULL,
  `killer_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `killer_rank` tinyint UNSIGNED NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id_02` int UNSIGNED NULL DEFAULT NULL,
  `guild_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint NULL DEFAULT NULL,
  `world_y` smallint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_castle_siege_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_castle_siege_ranking`;
CREATE TABLE `event_castle_siege_ranking`  (
  `guild_id` int UNSIGNED NOT NULL,
  `guild_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `character_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_castle_siege_time
-- ----------------------------
DROP TABLE IF EXISTS `event_castle_siege_time`;
CREATE TABLE `event_castle_siege_time`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_rank` tinyint UNSIGNED NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `guild_id` int UNSIGNED NULL DEFAULT NULL,
  `guild_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `time` int UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_dungeon_instance
-- ----------------------------
DROP TABLE IF EXISTS `event_dungeon_instance`;
CREATE TABLE `event_dungeon_instance`  (
  `char_id` int UNSIGNED NOT NULL,
  `id` tinyint UNSIGNED NULL DEFAULT NULL,
  `time` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_jewel_bingo_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_jewel_bingo_ranking`;
CREATE TABLE `event_jewel_bingo_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `score1` int NULL DEFAULT NULL,
  `score2` int NULL DEFAULT NULL,
  `score3` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_labyrinth_league
-- ----------------------------
DROP TABLE IF EXISTS `event_labyrinth_league`;
CREATE TABLE `event_labyrinth_league`  (
  `category` tinyint UNSIGNED NOT NULL,
  `char_id` int UNSIGNED NOT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_class` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `league_score` int NULL DEFAULT NULL,
  `time` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `category`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_labyrinth_schedule
-- ----------------------------
DROP TABLE IF EXISTS `event_labyrinth_schedule`;
CREATE TABLE `event_labyrinth_schedule`  (
  `server` smallint UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `start_date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`server`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_mini_bomb_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_mini_bomb_ranking`;
CREATE TABLE `event_mini_bomb_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `state` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` smallint UNSIGNED NULL DEFAULT NULL,
  `bombs_founded` tinyint UNSIGNED NULL DEFAULT NULL,
  `bombs_failed` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_mu_roomy_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_mu_roomy_ranking`;
CREATE TABLE `event_mu_roomy_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` smallint UNSIGNED NULL DEFAULT NULL,
  `remain_card` tinyint UNSIGNED NULL DEFAULT NULL,
  `remain_special_card` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_numeric_baseball_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_numeric_baseball_ranking`;
CREATE TABLE `event_numeric_baseball_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_race_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_race_ranking`;
CREATE TABLE `event_race_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `race` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `race`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_ranking`;
CREATE TABLE `event_ranking`  (
  `event_id` tinyint UNSIGNED NOT NULL,
  `event_ground` tinyint UNSIGNED NULL DEFAULT NULL,
  `char_id` int UNSIGNED NOT NULL,
  `score` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_ranking_labyrinth
-- ----------------------------
DROP TABLE IF EXISTS `event_ranking_labyrinth`;
CREATE TABLE `event_ranking_labyrinth`  (
  `char_id` int UNSIGNED NOT NULL,
  `level` smallint UNSIGNED NULL DEFAULT NULL,
  `stage` tinyint UNSIGNED NULL DEFAULT NULL,
  `index` tinyint UNSIGNED NULL DEFAULT NULL,
  `killed_monsters` int NULL DEFAULT NULL,
  `earned_experience` bigint NULL DEFAULT NULL,
  `completed_missions` int NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_scramble_ranking
-- ----------------------------
DROP TABLE IF EXISTS `event_scramble_ranking`;
CREATE TABLE `event_scramble_ranking`  (
  `char_id` int UNSIGNED NOT NULL,
  `word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shuffle_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_stage
-- ----------------------------
DROP TABLE IF EXISTS `event_stage`;
CREATE TABLE `event_stage`  (
  `event_id` tinyint UNSIGNED NOT NULL,
  `stage` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gen_ranking
-- ----------------------------
DROP TABLE IF EXISTS `gen_ranking`;
CREATE TABLE `gen_ranking`  (
  `family` tinyint UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `ranking` int NULL DEFAULT NULL,
  `char_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`family`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_list
-- ----------------------------
DROP TABLE IF EXISTS `guild_list`;
CREATE TABLE `guild_list`  (
  `guid` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emblem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hostil` int UNSIGNED NULL DEFAULT NULL,
  `alliance` int UNSIGNED NULL DEFAULT NULL,
  `notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_matching
-- ----------------------------
DROP TABLE IF EXISTS `guild_matching`;
CREATE TABLE `guild_matching`  (
  `guild_id` int UNSIGNED NOT NULL,
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interest_type` tinyint UNSIGNED NULL DEFAULT NULL,
  `level_range` tinyint UNSIGNED NULL DEFAULT NULL,
  `class_type` smallint UNSIGNED NULL DEFAULT NULL,
  `board_number` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_members
-- ----------------------------
DROP TABLE IF EXISTS `guild_members`;
CREATE TABLE `guild_members`  (
  `guild_id` int UNSIGNED NOT NULL,
  `char_id` int UNSIGNED NOT NULL,
  `id` tinyint UNSIGNED NULL DEFAULT NULL,
  `ranking` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`, `char_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for guild_score
-- ----------------------------
DROP TABLE IF EXISTS `guild_score`;
CREATE TABLE `guild_score`  (
  `guild_id` int UNSIGNED NOT NULL,
  `score` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`guild_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_data
-- ----------------------------
DROP TABLE IF EXISTS `item_data`;
CREATE TABLE `item_data`  (
  `id` int UNSIGNED NOT NULL,
  `box` tinyint UNSIGNED NOT NULL,
  `slot` int UNSIGNED NOT NULL,
  `entry` smallint UNSIGNED NULL DEFAULT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `serial` int UNSIGNED NULL DEFAULT NULL,
  `serial_cash_shop` int UNSIGNED NULL DEFAULT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  `durability` tinyint UNSIGNED NULL DEFAULT NULL,
  `durability_state` int NULL DEFAULT NULL,
  `skill` tinyint UNSIGNED NULL DEFAULT NULL,
  `luck` tinyint UNSIGNED NULL DEFAULT NULL,
  `option` tinyint UNSIGNED NULL DEFAULT NULL,
  `excellent` tinyint UNSIGNED NULL DEFAULT NULL,
  `ancient` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_380` tinyint UNSIGNED NULL DEFAULT NULL,
  `harmony` tinyint UNSIGNED NULL DEFAULT NULL,
  `socket_1` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_2` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_3` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_4` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_5` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_bonus` tinyint UNSIGNED NULL DEFAULT NULL,
  `locked` tinyint UNSIGNED NULL DEFAULT NULL,
  `data_1` int NULL DEFAULT NULL,
  `data_2` int NULL DEFAULT NULL,
  `data_3` int NULL DEFAULT NULL,
  `personal_store_price` int UNSIGNED NULL DEFAULT NULL,
  `personal_store_job` smallint UNSIGNED NULL DEFAULT NULL,
  `personal_store_jos` smallint UNSIGNED NULL DEFAULT NULL,
  `personal_store_joc` smallint UNSIGNED NULL DEFAULT NULL,
  `expire_date` bigint NULL DEFAULT NULL,
  `flags` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `box`, `slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_data_test
-- ----------------------------
DROP TABLE IF EXISTS `item_data_test`;
CREATE TABLE `item_data_test`  (
  `id` int UNSIGNED NOT NULL,
  `box` tinyint UNSIGNED NOT NULL,
  `slot` int UNSIGNED NOT NULL,
  `entry` smallint UNSIGNED NOT NULL,
  `server` smallint UNSIGNED NOT NULL,
  `serial` int UNSIGNED NOT NULL,
  `serial_cash_shop` int UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NOT NULL,
  `durability` tinyint UNSIGNED NOT NULL,
  `durability_state` int NOT NULL DEFAULT 0,
  `skill` tinyint UNSIGNED NOT NULL,
  `luck` tinyint UNSIGNED NOT NULL,
  `option` tinyint UNSIGNED NOT NULL,
  `excellent` tinyint UNSIGNED NOT NULL,
  `ancient` tinyint UNSIGNED NOT NULL,
  `option_380` tinyint UNSIGNED NOT NULL,
  `harmony` tinyint UNSIGNED NOT NULL,
  `socket_1` smallint UNSIGNED NOT NULL,
  `socket_2` smallint UNSIGNED NOT NULL,
  `socket_3` smallint UNSIGNED NOT NULL,
  `socket_4` smallint UNSIGNED NOT NULL,
  `socket_5` smallint UNSIGNED NOT NULL,
  `socket_bonus` tinyint UNSIGNED NOT NULL,
  `locked` tinyint UNSIGNED NOT NULL,
  `data_1` int NOT NULL DEFAULT 0,
  `data_2` int NOT NULL DEFAULT 0,
  `data_3` int NOT NULL DEFAULT 0,
  `personal_store_price` int UNSIGNED NOT NULL,
  `personal_store_job` smallint UNSIGNED NOT NULL,
  `personal_store_jos` smallint UNSIGNED NOT NULL,
  `personal_store_joc` smallint UNSIGNED NOT NULL,
  `expire_date` bigint NOT NULL DEFAULT 0,
  `flags` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `box`, `slot`) USING BTREE,
  UNIQUE INDEX `DupeInv`(`server`, `serial`, `serial_cash_shop`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `box`(`box`) USING BTREE,
  INDEX `slot`(`slot`) USING BTREE,
  INDEX `idx_id_and_box`(`id`, `box`) USING BTREE,
  INDEX `idx_id_and_box_and_slot`(`id`, `box`, `slot`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for item_pentagram_data
-- ----------------------------
DROP TABLE IF EXISTS `item_pentagram_data`;
CREATE TABLE `item_pentagram_data`  (
  `id` int UNSIGNED NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `index` tinyint UNSIGNED NULL DEFAULT NULL,
  `attribute` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_type` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_index` smallint UNSIGNED NULL DEFAULT NULL,
  `item_level` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_index_rank_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_level_rank_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_index_rank_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_level_rank_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_index_rank_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_level_rank_3` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_index_rank_4` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_level_rank_4` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_index_rank_5` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_level_rank_5` tinyint UNSIGNED NULL DEFAULT NULL,
  `serial_server` smallint UNSIGNED NULL DEFAULT NULL,
  `serial` int UNSIGNED NULL DEFAULT NULL,
  `flags` int UNSIGNED NULL DEFAULT NULL,
  `data_1` int NULL DEFAULT NULL,
  `data_2` int NULL DEFAULT NULL,
  `data_3` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_recovery
-- ----------------------------
DROP TABLE IF EXISTS `item_recovery`;
CREATE TABLE `item_recovery`  (
  `char_id` int UNSIGNED NOT NULL,
  `item` smallint UNSIGNED NOT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  `durability` tinyint UNSIGNED NULL DEFAULT NULL,
  `skill` tinyint UNSIGNED NULL DEFAULT NULL,
  `luck` tinyint UNSIGNED NULL DEFAULT NULL,
  `option` tinyint UNSIGNED NULL DEFAULT NULL,
  `excellent` tinyint UNSIGNED NULL DEFAULT NULL,
  `ancient` tinyint UNSIGNED NULL DEFAULT NULL,
  `harmony` tinyint UNSIGNED NULL DEFAULT NULL,
  `option_380` tinyint UNSIGNED NULL DEFAULT NULL,
  `socket_1` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_2` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_3` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_4` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_5` smallint UNSIGNED NULL DEFAULT NULL,
  `socket_bonus` tinyint UNSIGNED NULL DEFAULT NULL,
  `data_1` int NULL DEFAULT NULL,
  `data_2` int NULL DEFAULT NULL,
  `data_3` int NULL DEFAULT NULL,
  `serial_server` smallint UNSIGNED NULL DEFAULT NULL,
  `serial` int UNSIGNED NULL DEFAULT NULL,
  `serial_cash_shop` int UNSIGNED NULL DEFAULT NULL,
  `flags` int UNSIGNED NULL DEFAULT NULL,
  `id` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`char_id`, `item`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for monster_respawn
-- ----------------------------
DROP TABLE IF EXISTS `monster_respawn`;
CREATE TABLE `monster_respawn`  (
  `server` smallint UNSIGNED NOT NULL,
  `guid` smallint UNSIGNED NOT NULL,
  `date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`server`, `guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for party
-- ----------------------------
DROP TABLE IF EXISTS `party`;
CREATE TABLE `party`  (
  `guid` smallint UNSIGNED NOT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for party_member
-- ----------------------------
DROP TABLE IF EXISTS `party_member`;
CREATE TABLE `party_member`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `party` smallint UNSIGNED NULL DEFAULT NULL,
  `member` int UNSIGNED NULL DEFAULT NULL,
  `position` tinyint UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for serial_check
-- ----------------------------
DROP TABLE IF EXISTS `serial_check`;
CREATE TABLE `serial_check`  (
  `server` smallint UNSIGNED NOT NULL,
  `serial` int UNSIGNED NOT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disk_serial` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`serial`, `server`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for server_signal
-- ----------------------------
DROP TABLE IF EXISTS `server_signal`;
CREATE TABLE `server_signal`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `signal` smallint UNSIGNED NULL DEFAULT NULL,
  `data_1` int NULL DEFAULT NULL,
  `data_2` int NULL DEFAULT NULL,
  `data_3` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tormented_square_survival_hall_of_fame
-- ----------------------------
DROP TABLE IF EXISTS `tormented_square_survival_hall_of_fame`;
CREATE TABLE `tormented_square_survival_hall_of_fame`  (
  `char_id_1` int UNSIGNED NOT NULL,
  `char_name_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_2` int UNSIGNED NULL DEFAULT NULL,
  `char_name_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`char_id_1`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tormented_square_survival_ranking
-- ----------------------------
DROP TABLE IF EXISTS `tormented_square_survival_ranking`;
CREATE TABLE `tormented_square_survival_ranking`  (
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `ranking` int NULL DEFAULT NULL,
  `char_id_1` int UNSIGNED NULL DEFAULT NULL,
  `char_name_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_2` int UNSIGNED NULL DEFAULT NULL,
  `char_name_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tormented_square_survival_team
-- ----------------------------
DROP TABLE IF EXISTS `tormented_square_survival_team`;
CREATE TABLE `tormented_square_survival_team`  (
  `char_id_1` int UNSIGNED NULL DEFAULT NULL,
  `char_id_2` int UNSIGNED NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `enter_count` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
