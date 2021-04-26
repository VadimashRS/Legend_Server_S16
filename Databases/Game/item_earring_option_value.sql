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

 Date: 27/04/2021 00:59:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_earring_option_value
-- ----------------------------
DROP TABLE IF EXISTS `item_earring_option_value`;
CREATE TABLE `item_earring_option_value` (
  `id` tinyint unsigned NOT NULL,
  `group` tinyint unsigned NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`,`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_earring_option_value
-- ----------------------------
BEGIN;
INSERT INTO `item_earring_option_value` VALUES (0, 0, 200);
INSERT INTO `item_earring_option_value` VALUES (0, 1, 400);
INSERT INTO `item_earring_option_value` VALUES (0, 2, 600);
INSERT INTO `item_earring_option_value` VALUES (0, 3, 800);
INSERT INTO `item_earring_option_value` VALUES (1, 0, 17);
INSERT INTO `item_earring_option_value` VALUES (1, 1, 19);
INSERT INTO `item_earring_option_value` VALUES (1, 2, 21);
INSERT INTO `item_earring_option_value` VALUES (1, 3, 23);
INSERT INTO `item_earring_option_value` VALUES (2, 0, 4);
INSERT INTO `item_earring_option_value` VALUES (2, 1, 5);
INSERT INTO `item_earring_option_value` VALUES (2, 2, 6);
INSERT INTO `item_earring_option_value` VALUES (2, 3, 7);
INSERT INTO `item_earring_option_value` VALUES (3, 0, 10);
INSERT INTO `item_earring_option_value` VALUES (3, 1, 10);
INSERT INTO `item_earring_option_value` VALUES (3, 2, 10);
INSERT INTO `item_earring_option_value` VALUES (3, 3, 10);
INSERT INTO `item_earring_option_value` VALUES (4, 0, 20);
INSERT INTO `item_earring_option_value` VALUES (4, 1, 0);
INSERT INTO `item_earring_option_value` VALUES (4, 2, 2);
INSERT INTO `item_earring_option_value` VALUES (4, 3, 4);
INSERT INTO `item_earring_option_value` VALUES (5, 0, 7);
INSERT INTO `item_earring_option_value` VALUES (5, 1, 7);
INSERT INTO `item_earring_option_value` VALUES (5, 2, 7);
INSERT INTO `item_earring_option_value` VALUES (5, 3, 7);
INSERT INTO `item_earring_option_value` VALUES (6, 0, 35);
INSERT INTO `item_earring_option_value` VALUES (6, 1, 1);
INSERT INTO `item_earring_option_value` VALUES (6, 2, 3);
INSERT INTO `item_earring_option_value` VALUES (6, 3, 5);
INSERT INTO `item_earring_option_value` VALUES (7, 0, 1);
INSERT INTO `item_earring_option_value` VALUES (7, 1, 2);
INSERT INTO `item_earring_option_value` VALUES (7, 2, 3);
INSERT INTO `item_earring_option_value` VALUES (7, 3, 4);
INSERT INTO `item_earring_option_value` VALUES (8, 3, 6);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
