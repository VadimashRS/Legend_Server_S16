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

 Date: 04/01/2022 00:16:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pentagram_type
-- ----------------------------
DROP TABLE IF EXISTS `pentagram_type`;
CREATE TABLE `pentagram_type` (
  `index` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rate` tinyint unsigned NOT NULL,
  `option_1` tinyint unsigned NOT NULL,
  `option_2` tinyint unsigned NOT NULL,
  `option_3` tinyint unsigned NOT NULL,
  `option_4` tinyint unsigned NOT NULL,
  `option_5` tinyint unsigned NOT NULL,
  `option_6` tinyint unsigned NOT NULL,
  `option_7` tinyint unsigned NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pentagram_type
-- ----------------------------
BEGIN;
INSERT INTO `pentagram_type` VALUES (6344, 'Muren\'s Book of Magic', 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6345, 'Scroll of Etramu', 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6346, 'Lorencia Knights\' Iron Shield', 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6347, 'Iron Shield of the Magic', 1, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6348, 'Hero Elixir', 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6349, 'Brave Hero Elixir', 1, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6350, 'Gladiator\'s Dagger', 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6351, 'Merciless Gladiator\'s Dagger', 1, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6352, 'Kundun\'s Madness Blade', 2, 26, 24, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6353, 'Kundun\'s Magic Spell Scroll', 2, 27, 24, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6354, 'Empire Guardians\' Stronghold', 2, 26, 27, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6355, 'Ancient Icarus Scroll', 2, 27, 28, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6356, 'Arca\'s Prophecy', 3, 41, 24, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6357, 'Antonia\'s Sword', 3, 41, 42, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6358, 'Kundun\'s Seal Scroll', 3, 41, 43, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6359, 'Pentagram for Beginners', 1, 1, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6360, 'Iron Shield (Bound)', 1, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6361, 'Thoughtful Sage\'s Jewel', 1, 5, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6362, 'Magic Scroll (Attributable)', 2, 27, 24, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6450, 'Runedil\'s Goldentune Harp', 2, 34, 21, 29, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6451, 'Lemuria\'s Orb', 2, 34, 22, 30, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6452, 'Norrwen\'s Bloodstring Lyra', 2, 23, 24, 25, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6643, '1st Goldentune Harp(Rare)', 2, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6644, '1st Brilliant Orb(Rare)', 2, 61, 63, 66, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6645, '1st Bloodstring Lyra(Rare)', 2, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6646, '1st Arcana Book of Prophesies(Unique)', 3, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6647, '1st Antonias\' Sword(Unique)', 3, 67, 68, 0, 0, 0, 0, 0);
INSERT INTO `pentagram_type` VALUES (6648, '1st Kundun\'s Sealed Book(Unique)', 3, 0, 0, 0, 0, 0, 0, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
