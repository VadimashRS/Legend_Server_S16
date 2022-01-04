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

 Date: 04/01/2022 21:15:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for item_harmony_enhancement
-- ----------------------------
DROP TABLE IF EXISTS `item_harmony_enhancement`;
CREATE TABLE `item_harmony_enhancement` (
  `type` tinyint unsigned NOT NULL,
  `id` tinyint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value_1` int NOT NULL,
  `value_2` int NOT NULL,
  `value_3` int NOT NULL,
  `value_4` int NOT NULL,
  `separation_value` tinyint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_harmony_enhancement
-- ----------------------------
BEGIN;
INSERT INTO `item_harmony_enhancement` VALUES (1, 1, 'Increase strength stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 2, 'Increase agility stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 3, 'Increase energy stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 4, 'Increase ATK success rate', 179, 299, 499, 500, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 5, 'ATK Increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 6, 'Crit DMG Increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 7, 'Excellent DMG increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 8, 'Skillpower Increase', 7, 17, 34, 35, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 9, 'Increase item durability', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (1, 10, 'SD Reduction Rate Increase', 2, 5, 9, 10, 2);
INSERT INTO `item_harmony_enhancement` VALUES (1, 11, 'Convert 5% of Mana to Attack', 9, 22, 44, 45, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 1, 'Increase strength stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 2, 'Increase agility stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 3, 'Increase energy stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 4, 'Increase ATK Success rate', 179, 299, 499, 500, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 5, 'Wizardry Increase', 19, 42, 79, 80, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 6, 'Crit DMG Increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 7, 'Excellent DMG increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 8, 'Skillpower Increase', 7, 17, 34, 35, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 9, 'Increase item durability', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (2, 10, 'SD Reduction Rate Increase', 2, 5, 9, 10, 2);
INSERT INTO `item_harmony_enhancement` VALUES (2, 11, 'Convert 5% of MP to Wizardry', 20, 44, 84, 85, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 1, 'Increase stamina stats', 2, 5, 9, 10, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 2, 'Increase DEF', 10, 25, 49, 50, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 4, 'Max AG increase', 27, 54, 99, 100, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 5, 'Max HP increase', 27, 54, 99, 100, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 6, 'Max MP Increase', 27, 54, 99, 100, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 7, 'HP auto Increase', 2, 5, 9, 10, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 8, 'MP auto Increase', 2, 5, 9, 10, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 9, 'DMG Reduction Increase', 10, 25, 49, 50, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 10, 'Increase item durability', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (3, 11, 'SD Ratio Increase', 1, 2, 4, 5, 2);
INSERT INTO `item_harmony_enhancement` VALUES (3, 13, 'Convert 10% of MP to HP', 31, 64, 119, 120, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 1, 'Increase strength stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 2, 'Increase agility stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 3, 'Increase energy stats', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 4, 'Increase ATK success rate', 179, 299, 499, 500, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 5, 'Curse Increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 6, 'Crit DMG Increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 7, 'Excellent DMG increase', 8, 20, 39, 40, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 8, 'Skillpower Increase', 7, 17, 34, 35, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 9, 'Increase item durability', 6, 15, 29, 30, 1);
INSERT INTO `item_harmony_enhancement` VALUES (4, 10, 'SD Reduction Rate Increase', 2, 5, 9, 10, 2);
INSERT INTO `item_harmony_enhancement` VALUES (4, 11, 'Convert 5% of MP to Curse', 9, 22, 44, 45, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
