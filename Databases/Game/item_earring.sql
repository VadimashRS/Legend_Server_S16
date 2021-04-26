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

 Date: 19/04/2021 19:58:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_earring
-- ----------------------------
DROP TABLE IF EXISTS `item_earring`;
CREATE TABLE `item_earring` (
  `type` tinyint unsigned NOT NULL,
  `index` smallint unsigned NOT NULL,
  `group` tinyint unsigned NOT NULL,
  `link` tinyint unsigned NOT NULL,
  `option_1` tinyint unsigned NOT NULL,
  `value_1` tinyint unsigned NOT NULL,
  `option_2` tinyint unsigned NOT NULL,
  `value_2` tinyint unsigned NOT NULL,
  `option_3` tinyint unsigned NOT NULL,
  `value_3` tinyint unsigned NOT NULL,
  `option_4` tinyint unsigned NOT NULL,
  `value_4` tinyint unsigned NOT NULL,
  `option_5` tinyint unsigned NOT NULL,
  `value_5` tinyint unsigned NOT NULL,
  `rate_1` tinyint unsigned NOT NULL,
  `rate_2` tinyint unsigned NOT NULL,
  `rate_3` tinyint unsigned NOT NULL,
  `rate_4` tinyint unsigned NOT NULL,
  `rate_5` tinyint unsigned NOT NULL,
  PRIMARY KEY (`type`,`index`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of item_earring
-- ----------------------------
BEGIN;
INSERT INTO `item_earring` VALUES (12, 449, 1, 1, 19, 1, 23, 4, 18, 6, 16, 6, 11, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 450, 2, 2, 19, 1, 28, 4, 29, 6, 30, 6, 11, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 451, 3, 3, 19, 1, 28, 4, 29, 6, 30, 6, 11, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 452, 4, 4, 19, 1, 28, 4, 29, 6, 30, 6, 11, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 457, 1, 9, 9, 5, 17, 2, 15, 2, 14, 3, 12, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 458, 2, 10, 9, 5, 17, 2, 15, 2, 14, 3, 12, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 459, 3, 11, 9, 5, 17, 2, 15, 2, 14, 3, 12, 0, 100, 30, 5, 0, 0);
INSERT INTO `item_earring` VALUES (12, 460, 4, 12, 9, 5, 17, 2, 15, 2, 14, 3, 12, 0, 100, 30, 5, 0, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
