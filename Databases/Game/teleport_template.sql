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

 Date: 28/04/2021 00:22:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for teleport_template
-- ----------------------------
DROP TABLE IF EXISTS `teleport_template`;
CREATE TABLE `teleport_template` (
  `id` tinyint unsigned NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zen` int unsigned NOT NULL,
  `min_level` smallint NOT NULL DEFAULT '0',
  `gate` smallint unsigned NOT NULL,
  `monster` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of teleport_template
-- ----------------------------
BEGIN;
INSERT INTO `teleport_template` VALUES (1, 'Arena', 2000, 1, 50, 65535);
INSERT INTO `teleport_template` VALUES (48, 'Event square', 20000, 1, 503, 65535);
INSERT INTO `teleport_template` VALUES (44, 'LorenMarket', 10000, 1, 333, 65535);
INSERT INTO `teleport_template` VALUES (2, 'Lorencia', 2000, 10, 17, 7);
INSERT INTO `teleport_template` VALUES (3, 'Noria', 2000, 10, 27, 32);
INSERT INTO `teleport_template` VALUES (31, 'Elbeland', 2000, 10, 267, 418);
INSERT INTO `teleport_template` VALUES (32, 'Elbeland2', 2500, 10, 268, 422);
INSERT INTO `teleport_template` VALUES (43, 'Elbeland3', 3000, 10, 269, 425);
INSERT INTO `teleport_template` VALUES (4, 'Devias', 2000, 10, 22, 24);
INSERT INTO `teleport_template` VALUES (5, 'Devias2', 2500, 10, 72, 19);
INSERT INTO `teleport_template` VALUES (6, 'Devias3', 3000, 10, 73, 20);
INSERT INTO `teleport_template` VALUES (7, 'Devias4', 3500, 10, 74, 20);
INSERT INTO `teleport_template` VALUES (8, 'Dungeon', 3000, 30, 2, 11);
INSERT INTO `teleport_template` VALUES (9, 'Dungeon2', 3500, 40, 6, 13);
INSERT INTO `teleport_template` VALUES (10, 'Dungeon3', 4000, 40, 10, 8);
INSERT INTO `teleport_template` VALUES (11, 'Atlans', 4000, 50, 49, 45);
INSERT INTO `teleport_template` VALUES (12, 'Atlans2', 4500, 80, 75, 52);
INSERT INTO `teleport_template` VALUES (13, 'Atlans3', 5000, 90, 76, 48);
INSERT INTO `teleport_template` VALUES (14, 'LostTower', 5000, 50, 42, 39);
INSERT INTO `teleport_template` VALUES (15, 'LostTower2', 5500, 50, 31, 34);
INSERT INTO `teleport_template` VALUES (16, 'LostTower3', 6000, 50, 33, 41);
INSERT INTO `teleport_template` VALUES (17, 'LostTower4', 6500, 50, 35, 37);
INSERT INTO `teleport_template` VALUES (18, 'LostTower5', 7000, 50, 37, 40);
INSERT INTO `teleport_template` VALUES (19, 'LostTower6', 7500, 70, 39, 35);
INSERT INTO `teleport_template` VALUES (20, 'LostTower7', 8000, 70, 41, 35);
INSERT INTO `teleport_template` VALUES (21, 'Tarkan', 8000, 140, 57, 57);
INSERT INTO `teleport_template` VALUES (22, 'Tarkan2', 8500, 160, 77, 61);
INSERT INTO `teleport_template` VALUES (50, 'Ferea', 50000, 400, 509, 730);
INSERT INTO `teleport_template` VALUES (25, 'Aida1', 8500, 150, 119, 306);
INSERT INTO `teleport_template` VALUES (27, 'Aida2', 8500, 380, 140, 550);
INSERT INTO `teleport_template` VALUES (23, 'Icarus', 10000, 160, 63, 70);
INSERT INTO `teleport_template` VALUES (28, 'KanturuRuins1', 9000, 160, 138, 353);
INSERT INTO `teleport_template` VALUES (29, 'KanturuRuins2', 9000, 160, 141, 350);
INSERT INTO `teleport_template` VALUES (45, 'KanturuRuins3', 15000, 380, 334, 556);
INSERT INTO `teleport_template` VALUES (30, 'KanturuRelics', 12000, 300, 139, 360);
INSERT INTO `teleport_template` VALUES (46, 'Karutan1', 13000, 280, 335, 574);
INSERT INTO `teleport_template` VALUES (47, 'Karutan2', 14000, 380, 344, 576);
INSERT INTO `teleport_template` VALUES (34, 'Raklion', 15000, 380, 287, 458);
INSERT INTO `teleport_template` VALUES (33, 'PeaceSwamp', 15000, 380, 273, 449);
INSERT INTO `teleport_template` VALUES (49, 'Acheron', 50000, 300, 417, 591);
INSERT INTO `teleport_template` VALUES (42, 'Vulcanus', 15000, 300, 294, 490);
INSERT INTO `teleport_template` VALUES (24, 'ValleyOfLoren', 10000, 10, 103, 65535);
INSERT INTO `teleport_template` VALUES (51, 'NixiesLake', 50000, 700, 522, 744);
INSERT INTO `teleport_template` VALUES (26, 'Crywolf', 15000, 10, 118, 65535);
INSERT INTO `teleport_template` VALUES (52, 'Deep Dungeon 1', 50000, 770, 561, 767);
INSERT INTO `teleport_template` VALUES (53, 'Deep Dungeon 2', 50000, 770, 562, 772);
INSERT INTO `teleport_template` VALUES (54, 'Deep Dungeon 3', 50000, 770, 563, 773);
INSERT INTO `teleport_template` VALUES (55, 'Deep Dungeon 4', 50000, 770, 564, 769);
INSERT INTO `teleport_template` VALUES (56, 'Deep Dungeon 5', 50000, 770, 565, 777);
INSERT INTO `teleport_template` VALUES (57, 'Swamp Of Darkness', 50000, 800, 567, 788);
INSERT INTO `teleport_template` VALUES (58, 'Kubera Mine', 50000, 850, 591, 810);
INSERT INTO `teleport_template` VALUES (59, 'Atlans(Abyss) 1', 50000, 1000, 617, 832);
INSERT INTO `teleport_template` VALUES (60, 'Atlans(Abyss) 2', 50000, 1020, 618, 834);
INSERT INTO `teleport_template` VALUES (61, 'Atlans(Abyss) 3', 50000, 1030, 619, 836);
INSERT INTO `teleport_template` VALUES (62, 'Scorched Canyon', 50000, 1050, 620, 846);
INSERT INTO `teleport_template` VALUES (63, 'Scarlet Icarus', 50000, 1070, 631, 861);
INSERT INTO `teleport_template` VALUES (64, 'Temple of Arnil', 50000, 1100, 634, 867);
INSERT INTO `teleport_template` VALUES (65, 'Ashen Aida', 50000, 1130, 643, 875);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
