/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : mu_online_game

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 27/04/2021 00:58:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_earring_bonus
-- ----------------------------
DROP TABLE IF EXISTS `item_earring_bonus`;
CREATE TABLE `item_earring_bonus` (
  `id` tinyint unsigned NOT NULL,
  `link_1` tinyint unsigned NOT NULL,
  `link_2` tinyint unsigned NOT NULL,
  `option_1` tinyint unsigned NOT NULL,
  `value_1` tinyint unsigned NOT NULL,
  `option_2` tinyint unsigned NOT NULL,
  `value_2` tinyint unsigned NOT NULL,
  `option_3` tinyint unsigned NOT NULL,
  `value_3` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_earring_bonus
-- ----------------------------
BEGIN;
INSERT INTO `item_earring_bonus` VALUES (0, 1, 1, 21, 7, 24, 2, 0, 0);
INSERT INTO `item_earring_bonus` VALUES (1, 1, 1, 21, 7, 24, 2, 0, 0);
INSERT INTO `item_earring_bonus` VALUES (2, 1, 1, 21, 7, 24, 2, 0, 0);
INSERT INTO `item_earring_bonus` VALUES (3, 1, 1, 21, 7, 24, 2, 31, 8);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
