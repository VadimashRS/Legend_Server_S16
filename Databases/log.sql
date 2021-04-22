/*
 Navicat Premium Data Transfer

 Source Server         : Lgd-Server Test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 135.125.191.26:3306
 Source Schema         : log

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 26/03/2021 02:56:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for antihack
-- ----------------------------
DROP TABLE IF EXISTS `antihack`;
CREATE TABLE `antihack`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_bag_serial
-- ----------------------------
DROP TABLE IF EXISTS `item_bag_serial`;
CREATE TABLE `item_bag_serial`  (
  `serial` int UNSIGNED NULL DEFAULT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint NULL DEFAULT NULL,
  `world_y` smallint NULL DEFAULT NULL,
  `instance` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_boss_kill
-- ----------------------------
DROP TABLE IF EXISTS `log_boss_kill`;
CREATE TABLE `log_boss_kill`  (
  `boss_index` smallint UNSIGNED NULL DEFAULT NULL,
  `boss_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `boss_id` tinyint UNSIGNED NULL DEFAULT NULL,
  `character_id` int UNSIGNED NULL DEFAULT NULL,
  `character_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `damage` bigint NULL DEFAULT NULL,
  `damage_reflect` bigint NULL DEFAULT NULL,
  `damage_debuff` bigint NULL DEFAULT NULL,
  `damage_elemental` bigint NULL DEFAULT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `first_hit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_cash_shop
-- ----------------------------
DROP TABLE IF EXISTS `log_cash_shop`;
CREATE TABLE `log_cash_shop`  (
  `server_id` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dest_char` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `package_id` int UNSIGNED NULL DEFAULT NULL,
  `product_id` int UNSIGNED NULL DEFAULT NULL,
  `option_id` int UNSIGNED NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price_type` tinyint UNSIGNED NULL DEFAULT NULL,
  `price` int UNSIGNED NULL DEFAULT NULL,
  `gift` tinyint UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_errtel_pentagram
-- ----------------------------
DROP TABLE IF EXISTS `log_errtel_pentagram`;
CREATE TABLE `log_errtel_pentagram`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `blessing_spirit` tinyint UNSIGNED NULL DEFAULT NULL,
  `result` tinyint UNSIGNED NULL DEFAULT NULL,
  `pentagram_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `errtel_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_item_buy
-- ----------------------------
DROP TABLE IF EXISTS `log_item_buy`;
CREATE TABLE `log_item_buy`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_item_create
-- ----------------------------
DROP TABLE IF EXISTS `log_item_create`;
CREATE TABLE `log_item_create`  (
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `interface_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint NULL DEFAULT NULL,
  `world_y` smallint NULL DEFAULT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `serial` int UNSIGNED NULL DEFAULT NULL,
  `serial_shop` int UNSIGNED NULL DEFAULT NULL,
  `item` smallint UNSIGNED NULL DEFAULT NULL,
  `level` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_item_drop
-- ----------------------------
DROP TABLE IF EXISTS `log_item_drop`;
CREATE TABLE `log_item_drop`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_item_loot
-- ----------------------------
DROP TABLE IF EXISTS `log_item_loot`;
CREATE TABLE `log_item_loot`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_item_sell
-- ----------------------------
DROP TABLE IF EXISTS `log_item_sell`;
CREATE TABLE `log_item_sell`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_jewel_drop
-- ----------------------------
DROP TABLE IF EXISTS `log_jewel_drop`;
CREATE TABLE `log_jewel_drop`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `jewel_type` tinyint UNSIGNED NULL DEFAULT NULL,
  `jewel_index` smallint UNSIGNED NULL DEFAULT NULL,
  `jewel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `x` smallint NULL DEFAULT NULL,
  `y` smallint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_jewel_mix
-- ----------------------------
DROP TABLE IF EXISTS `log_jewel_mix`;
CREATE TABLE `log_jewel_mix`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `mix_type` tinyint UNSIGNED NULL DEFAULT NULL,
  `mix_id` tinyint UNSIGNED NULL DEFAULT NULL,
  `mix_level` tinyint UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_level_up
-- ----------------------------
DROP TABLE IF EXISTS `log_level_up`;
CREATE TABLE `log_level_up`  (
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level_normal` smallint UNSIGNED NULL DEFAULT NULL,
  `level_master` smallint UNSIGNED NULL DEFAULT NULL,
  `level_majestic` smallint UNSIGNED NULL DEFAULT NULL,
  `world` smallint UNSIGNED NULL DEFAULT NULL,
  `world_x` smallint NULL DEFAULT NULL,
  `world_y` smallint NULL DEFAULT NULL,
  `event_ground` tinyint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_mix
-- ----------------------------
DROP TABLE IF EXISTS `log_mix`;
CREATE TABLE `log_mix`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mix_id` smallint UNSIGNED NULL DEFAULT NULL,
  `mix_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` int NULL DEFAULT NULL,
  `cost` int UNSIGNED NULL DEFAULT NULL,
  `result` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_data_before` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_data_after` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_personal_store
-- ----------------------------
DROP TABLE IF EXISTS `log_personal_store`;
CREATE TABLE `log_personal_store`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id_01` int UNSIGNED NULL DEFAULT NULL,
  `account_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_01` int UNSIGNED NULL DEFAULT NULL,
  `char_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id_02` int UNSIGNED NULL DEFAULT NULL,
  `account_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_02` int UNSIGNED NULL DEFAULT NULL,
  `char_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `offstore` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_pvp
-- ----------------------------
DROP TABLE IF EXISTS `log_pvp`;
CREATE TABLE `log_pvp`  (
  `char_id_1` int UNSIGNED NULL DEFAULT NULL,
  `char_name_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_class_1` tinyint UNSIGNED NULL DEFAULT NULL,
  `char_stat_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_set_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_2` int UNSIGNED NULL DEFAULT NULL,
  `char_name_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_class_2` tinyint UNSIGNED NULL DEFAULT NULL,
  `char_stat_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_set_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skill` smallint UNSIGNED NULL DEFAULT NULL,
  `hp_damage` int NULL DEFAULT NULL,
  `sd_damage` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_trade
-- ----------------------------
DROP TABLE IF EXISTS `log_trade`;
CREATE TABLE `log_trade`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id_01` int UNSIGNED NULL DEFAULT NULL,
  `account_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_01` int UNSIGNED NULL DEFAULT NULL,
  `char_name_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_id_02` int UNSIGNED NULL DEFAULT NULL,
  `account_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id_02` int UNSIGNED NULL DEFAULT NULL,
  `char_name_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` int UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mix_recovery
-- ----------------------------
DROP TABLE IF EXISTS `mix_recovery`;
CREATE TABLE `mix_recovery`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reward_dungeon
-- ----------------------------
DROP TABLE IF EXISTS `reward_dungeon`;
CREATE TABLE `reward_dungeon`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `account_id` int UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `player_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reward_labyrinth_of_dimensions
-- ----------------------------
DROP TABLE IF EXISTS `reward_labyrinth_of_dimensions`;
CREATE TABLE `reward_labyrinth_of_dimensions`  (
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `char_id` int UNSIGNED NULL DEFAULT NULL,
  `char_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` tinyint UNSIGNED NULL DEFAULT NULL,
  `rank` int NULL DEFAULT NULL,
  `item_data` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
