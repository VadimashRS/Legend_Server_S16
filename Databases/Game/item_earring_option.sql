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

 Date: 27/04/2021 00:58:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_earring_option
-- ----------------------------
DROP TABLE IF EXISTS `item_earring_option`;
CREATE TABLE `item_earring_option` (
  `id` tinyint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_earring_option
-- ----------------------------
BEGIN;
INSERT INTO `item_earring_option` VALUES (0, 'Power increase', 1);
INSERT INTO `item_earring_option` VALUES (1, 'Increased agility', 1);
INSERT INTO `item_earring_option` VALUES (2, 'Energy increase', 1);
INSERT INTO `item_earring_option` VALUES (3, 'tamina increase', 1);
INSERT INTO `item_earring_option` VALUES (4, 'Increased leadership', 1);
INSERT INTO `item_earring_option` VALUES (5, 'Increased minimum attack power', 1);
INSERT INTO `item_earring_option` VALUES (6, 'Maximum Attack Power Increase', 1);
INSERT INTO `item_earring_option` VALUES (7, 'Horsepower increase', 2);
INSERT INTO `item_earring_option` VALUES (8, 'Damage increase', 2);
INSERT INTO `item_earring_option` VALUES (9, 'Attack speed increase', 1);
INSERT INTO `item_earring_option` VALUES (10, 'Defense increase', 1);
INSERT INTO `item_earring_option` VALUES (11, 'Maximum life increase', 1);
INSERT INTO `item_earring_option` VALUES (12, 'Max Mana Increase', 1);
INSERT INTO `item_earring_option` VALUES (13, 'Maximum AG increase', 1);
INSERT INTO `item_earring_option` VALUES (14, 'AG automatic recovery increased', 1);
INSERT INTO `item_earring_option` VALUES (15, 'Critical Damage Rate Increase', 2);
INSERT INTO `item_earring_option` VALUES (16, 'Critical Damage Increase', 1);
INSERT INTO `item_earring_option` VALUES (17, 'Increased Excellent Damage Rate', 2);
INSERT INTO `item_earring_option` VALUES (18, 'Excellent damage increase', 1);
INSERT INTO `item_earring_option` VALUES (19, 'Skill attack power increase', 1);
INSERT INTO `item_earring_option` VALUES (20, 'Double Damage Rate', 2);
INSERT INTO `item_earring_option` VALUES (21, 'Ignore enemy defense', 2);
INSERT INTO `item_earring_option` VALUES (22, 'Increases defense when equipped with a shield', 2);
INSERT INTO `item_earring_option` VALUES (23, 'Increase Attack/Magic Power', 1);
INSERT INTO `item_earring_option` VALUES (24, 'All stats increase', 1);
INSERT INTO `item_earring_option` VALUES (26, 'Attack power increase', 1);
INSERT INTO `item_earring_option` VALUES (27, 'Horsepower increase', 1);
INSERT INTO `item_earring_option` VALUES (28, 'Mastery attack power/horsepower increase', 1);
INSERT INTO `item_earring_option` VALUES (29, 'Mastery Excellent Damage Increase', 1);
INSERT INTO `item_earring_option` VALUES (30, 'Master Re-Critical Damage Increase', 1);
INSERT INTO `item_earring_option` VALUES (31, 'Mastery Damage Increase', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
