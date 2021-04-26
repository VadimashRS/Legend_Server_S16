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

 Date: 19/04/2021 20:30:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_earring_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `item_earring_upgrade`;
CREATE TABLE `item_earring_upgrade` (
  `id` tinyint unsigned NOT NULL,
  `rate` int NOT NULL DEFAULT '0',
  `type_1` tinyint unsigned NOT NULL,
  `index_1` smallint unsigned NOT NULL,
  `count_1` int NOT NULL DEFAULT '0',
  `type_2` tinyint unsigned NOT NULL,
  `index_2` smallint unsigned NOT NULL,
  `count_2` int NOT NULL DEFAULT '0',
  `type_3` tinyint unsigned NOT NULL,
  `index_3` smallint unsigned NOT NULL,
  `count_3` int NOT NULL DEFAULT '0',
  `zen` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of item_earring_upgrade
-- ----------------------------
BEGIN;
INSERT INTO `item_earring_upgrade` VALUES (0, 600000, 13, 510, 1, 0, 0, 0, 0, 0, 0, 1000000);
INSERT INTO `item_earring_upgrade` VALUES (1, 600000, 13, 510, 2, 0, 0, 0, 0, 0, 0, 1500000);
INSERT INTO `item_earring_upgrade` VALUES (2, 600000, 13, 510, 2, 0, 0, 0, 0, 0, 0, 2000000);
INSERT INTO `item_earring_upgrade` VALUES (3, 600000, 13, 510, 2, 0, 0, 0, 0, 0, 0, 2500000);
INSERT INTO `item_earring_upgrade` VALUES (4, 600000, 13, 510, 3, 0, 0, 0, 0, 0, 0, 3000000);
INSERT INTO `item_earring_upgrade` VALUES (5, 600000, 13, 510, 3, 0, 0, 0, 0, 0, 0, 3500000);
INSERT INTO `item_earring_upgrade` VALUES (6, 600000, 13, 510, 4, 0, 0, 0, 0, 0, 0, 4000000);
INSERT INTO `item_earring_upgrade` VALUES (7, 800000, 13, 510, 4, 0, 0, 0, 0, 0, 0, 4500000);
INSERT INTO `item_earring_upgrade` VALUES (8, 800000, 13, 510, 4, 0, 0, 0, 0, 0, 0, 5000000);
INSERT INTO `item_earring_upgrade` VALUES (9, 800000, 13, 510, 5, 0, 0, 0, 0, 0, 0, 5500000);
INSERT INTO `item_earring_upgrade` VALUES (10, 800000, 13, 510, 5, 0, 0, 0, 0, 0, 0, 6000000);
INSERT INTO `item_earring_upgrade` VALUES (11, 800000, 13, 510, 5, 0, 0, 0, 0, 0, 0, 6500000);
INSERT INTO `item_earring_upgrade` VALUES (12, 800000, 13, 510, 5, 0, 0, 0, 0, 0, 0, 7000000);
INSERT INTO `item_earring_upgrade` VALUES (13, 800000, 13, 510, 5, 0, 0, 0, 0, 0, 0, 7500000);
INSERT INTO `item_earring_upgrade` VALUES (14, 800000, 13, 510, 5, 0, 0, 0, 0, 0, 0, 8000000);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
