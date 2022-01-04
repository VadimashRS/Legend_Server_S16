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

 Date: 04/01/2022 23:19:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pentagram_option
-- ----------------------------
DROP TABLE IF EXISTS `pentagram_option`;
CREATE TABLE `pentagram_option` (
  `index` tinyint unsigned NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `value` smallint unsigned NOT NULL,
  `type_1` tinyint NOT NULL DEFAULT '-1',
  `rank_1` tinyint NOT NULL DEFAULT '-1',
  `level_1` tinyint NOT NULL DEFAULT '-1',
  `type_2` tinyint NOT NULL DEFAULT '-1',
  `rank_2` tinyint NOT NULL DEFAULT '-1',
  `level_2` tinyint NOT NULL DEFAULT '-1',
  `type_3` tinyint NOT NULL DEFAULT '-1',
  `rank_3` tinyint NOT NULL DEFAULT '-1',
  `level_3` tinyint NOT NULL DEFAULT '-1',
  `type_4` tinyint NOT NULL DEFAULT '-1',
  `rank_4` tinyint NOT NULL DEFAULT '-1',
  `level_4` tinyint NOT NULL DEFAULT '-1',
  `type_5` tinyint NOT NULL DEFAULT '-1',
  `rank_5` tinyint NOT NULL DEFAULT '-1',
  `level_5` tinyint NOT NULL DEFAULT '-1',
  PRIMARY KEY (`index`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pentagram_option
-- ----------------------------
BEGIN;
INSERT INTO `pentagram_option` VALUES (1, 'Pentagram Damage/Defense +5%%', 5, 0, 1, 0, 1, 1, 0, 2, 1, 0, 3, 1, 0, -1, -1, 0);
INSERT INTO `pentagram_option` VALUES (2, 'Pentagram Damage +10%%', 10, 0, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (3, 'Pentagram Defense +10%%', 10, 0, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (4, 'Elemental Critical Damage Rate +10%%', 10, 0, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (5, 'Ertel of Blessings Rank 1 Option Effect Increase +35', 35, 0, 1, 0, 1, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (21, 'Pentagram Damage +10%%', 10, 0, 2, 0, 2, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (22, 'Pentagram Defense +10%%', 10, 1, 2, 0, 3, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (23, 'Elemental Critical Damage Rate +5%%', 5, 1, 1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (24, 'Elemental Critical Damage Rate +10%%', 10, 0, 2, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (25, 'Elemental Critical Damage Rate +25%%', 25, 0, 3, 0, 1, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (26, 'Elemental Attribute Defense +5%%', 5, 0, 3, 0, 1, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (27, 'Elemental Attribute Damage +1%%', 1, 0, 3, 0, 1, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (28, '%s, %s elemental attack complete evasion chance +5%%', 5, 1, 2, 0, 2, 1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (29, 'Pentagram Damage +30', 30, 0, 3, 0, 2, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (30, 'Pentagram Damage +30', 30, 1, 3, 0, 3, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (31, 'Ertel of Nobility +20 Rank 1 Option Effect Increase (Unused Option)', 20, 2, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (32, 'Divine Ertel Rank 1 Option Effect Increase +20 (Unused Option)', 20, 3, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (33, 'Brilliant Ertel Rank 1 Option Effect Increase +20 (Unused Option)', 20, 4, 1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (34, 'Pentagram Damage/Defense +5%%', 5, 0, 1, 7, 1, 1, 7, 4, 1, 7, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (41, 'Ignore Elemental Defense +5%%', 5, 1, 3, 6, 2, 3, 6, 3, 3, 6, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (42, 'Elemental Attribute Defense +5%%', 5, 0, 3, 5, 1, 3, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (43, 'Elemental Attribute Damage +1%%', 1, 0, 3, 5, 1, 3, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (61, 'Pentagram DMG and DEF+5%%', 5, 0, 1, 7, 4, 1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (62, 'Increase Pentagram DMG +10%%', 10, 0, 2, 0, 2, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (63, 'Increase Pentagram DEF +10%%', 10, 1, 2, 0, 3, 2, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (64, 'Elemental Critical DMG Rate +5%%', 5, 1, 1, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (65, 'Elemental Critical DMG Rate +10%%', 10, 0, 2, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (66, 'Elemental Critical DMG Rate +25%%', 25, 0, 3, 0, 1, 3, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (67, 'Elemental DMG Perfect Dodge Rate +5%%', 5, 1, 3, 6, 2, 3, 6, 3, 3, 6, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (68, 'DEF Added to Elemental DEF +5%%', 5, 0, 3, 5, 1, 3, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1);
INSERT INTO `pentagram_option` VALUES (69, 'DMG Added to Elemental DMG +1%%', 1, 0, 3, 5, 1, 3, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
