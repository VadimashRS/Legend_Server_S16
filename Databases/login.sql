/*
 Navicat Premium Data Transfer

 Source Server         : Lgd-Server Test
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 135.125.191.26:3306
 Source Schema         : login

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 26/03/2021 02:56:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `guid` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `blocked` tinyint UNSIGNED NULL DEFAULT NULL,
  `security_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `golden_channel` bigint NULL DEFAULT NULL,
  `facebook_status` tinyint UNSIGNED NULL DEFAULT NULL,
  `secured` tinyint UNSIGNED NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`guid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_allowed
-- ----------------------------
DROP TABLE IF EXISTS `accounts_allowed`;
CREATE TABLE `accounts_allowed`  (
  `account_id` int UNSIGNED NOT NULL,
  `guid` int UNSIGNED NULL DEFAULT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_banned
-- ----------------------------
DROP TABLE IF EXISTS `accounts_banned`;
CREATE TABLE `accounts_banned`  (
  `account_id` int UNSIGNED NOT NULL,
  `guid` int UNSIGNED NULL DEFAULT NULL,
  `unban_date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_disconnect
-- ----------------------------
DROP TABLE IF EXISTS `accounts_disconnect`;
CREATE TABLE `accounts_disconnect`  (
  `account_id` int UNSIGNED NOT NULL,
  `server` smallint UNSIGNED NULL DEFAULT NULL,
  `masive` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_security
-- ----------------------------
DROP TABLE IF EXISTS `accounts_security`;
CREATE TABLE `accounts_security`  (
  `account_id` int UNSIGNED NOT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `disk_serial` int UNSIGNED NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_status
-- ----------------------------
DROP TABLE IF EXISTS `accounts_status`;
CREATE TABLE `accounts_status`  (
  `account_id` int UNSIGNED NOT NULL,
  `server_group` smallint UNSIGNED NULL DEFAULT NULL,
  `current_server` smallint UNSIGNED NULL DEFAULT NULL,
  `start_server` smallint UNSIGNED NULL DEFAULT NULL,
  `dest_server` smallint NULL DEFAULT NULL,
  `dest_world` smallint NULL DEFAULT NULL,
  `dest_x` smallint NULL DEFAULT NULL,
  `dest_y` smallint NULL DEFAULT NULL,
  `warp_time` int UNSIGNED NULL DEFAULT NULL,
  `warp_auth_1` int UNSIGNED NULL DEFAULT NULL,
  `warp_auth_2` int UNSIGNED NULL DEFAULT NULL,
  `warp_auth_3` int UNSIGNED NULL DEFAULT NULL,
  `warp_auth_4` int UNSIGNED NULL DEFAULT NULL,
  `last_ip` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL,
  `last_mac` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL,
  `last_online` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NULL DEFAULT NULL,
  `online` tinyint NULL DEFAULT NULL,
  `disk_serial` int UNSIGNED NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_validation
-- ----------------------------
DROP TABLE IF EXISTS `accounts_validation`;
CREATE TABLE `accounts_validation`  (
  `account_id` int UNSIGNED NOT NULL,
  `disk_serial` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for accounts_warning
-- ----------------------------
DROP TABLE IF EXISTS `accounts_warning`;
CREATE TABLE `accounts_warning`  (
  `account_id` int UNSIGNED NOT NULL,
  `disk_serial` int UNSIGNED NULL DEFAULT NULL,
  `block_date` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for block_diskserial
-- ----------------------------
DROP TABLE IF EXISTS `block_diskserial`;
CREATE TABLE `block_diskserial`  (
  `disk_serial` int UNSIGNED NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`disk_serial`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for block_ip
-- ----------------------------
DROP TABLE IF EXISTS `block_ip`;
CREATE TABLE `block_ip`  (
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ip`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for block_mac
-- ----------------------------
DROP TABLE IF EXISTS `block_mac`;
CREATE TABLE `block_mac`  (
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mac`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for character_notification
-- ----------------------------
DROP TABLE IF EXISTS `character_notification`;
CREATE TABLE `character_notification`  (
  `server_group` smallint UNSIGNED NOT NULL,
  `char_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `facebook_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `notification_data` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`server_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for item_serial
-- ----------------------------
DROP TABLE IF EXISTS `item_serial`;
CREATE TABLE `item_serial`  (
  `server` smallint UNSIGNED NOT NULL,
  `serial` int UNSIGNED NULL DEFAULT NULL,
  `serial_shop` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`server`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for master_pc
-- ----------------------------
DROP TABLE IF EXISTS `master_pc`;
CREATE TABLE `master_pc`  (
  `disk_serial` int UNSIGNED NOT NULL,
  `mac` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`disk_serial`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for server_list
-- ----------------------------
DROP TABLE IF EXISTS `server_list`;
CREATE TABLE `server_list`  (
  `server` smallint UNSIGNED NOT NULL,
  `code` smallint UNSIGNED NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `port` smallint UNSIGNED NULL DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` tinyint UNSIGNED NULL DEFAULT NULL,
  `online` tinyint UNSIGNED NULL DEFAULT NULL,
  `default_world` smallint UNSIGNED NULL DEFAULT NULL,
  `default_x` smallint NULL DEFAULT NULL,
  `default_y` smallint NULL DEFAULT NULL,
  `type` tinyint UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`server`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for world_server
-- ----------------------------
DROP TABLE IF EXISTS `world_server`;
CREATE TABLE `world_server`  (
  `server` smallint UNSIGNED NOT NULL,
  `world` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`server`, `world`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
