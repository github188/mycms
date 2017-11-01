/*
Navicat MySQL Data Transfer

Source Server         : localhost_3400
Source Server Version : 50624
Source Host           : localhost:3400
Source Database       : intelligent_alarm

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-11-01 15:47:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blacklist
-- ----------------------------
INSERT INTO `blacklist` VALUES ('1', 'TE', null, null, '客服系统+235');
INSERT INTO `blacklist` VALUES ('2', 'MQ', null, null, 'QM_TIPS_604100000010_01 DEADQ depth');
INSERT INTO `blacklist` VALUES ('3', 'MQ', null, null, 'QM_TIPS_604100000010_01 has been restored');
INSERT INTO `blacklist` VALUES ('4', 'GTP', null, null, 'ZH_WKSDQS_01');
INSERT INTO `blacklist` VALUES ('19', 'GTP', null, null, '总行应用间路由节点+总行柜面系统');
INSERT INTO `blacklist` VALUES ('208', 'GTP', null, null, 'FH_0300_SJ_01');
INSERT INTO `blacklist` VALUES ('227', 'TE', null, '2017-11-10 10:38:30', '中金综合前置+交易结果为13');

-- ----------------------------
-- Table structure for `blacklist_copy`
-- ----------------------------
DROP TABLE IF EXISTS `blacklist_copy`;
CREATE TABLE `blacklist_copy` (
  `type` varchar(16) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blacklist_copy
-- ----------------------------
INSERT INTO `blacklist_copy` VALUES ('TE', null, null, '客服系统+235');
INSERT INTO `blacklist_copy` VALUES ('MQ', null, null, 'QM_TIPS_604100000010_01 DEADQ depth');
INSERT INTO `blacklist_copy` VALUES ('MQ', null, null, 'QM_TIPS_604100000010_01 has been restored');
INSERT INTO `blacklist_copy` VALUES ('TE', '2017-08-11 20:51:43', '2017-08-12 08:59:00', null);
INSERT INTO `blacklist_copy` VALUES ('MQ', '2017-08-13 00:00:00', '2017-08-13 06:00:00', 'QMUCAEA');
INSERT INTO `blacklist_copy` VALUES ('MQ', '2017-08-13 00:00:00', '2017-08-13 06:00:00', 'QMUCAEB');
INSERT INTO `blacklist_copy` VALUES ('GTP', null, '2017-08-12 08:32:09', null);
INSERT INTO `blacklist_copy` VALUES ('MQ', null, '2017-08-12 08:52:20', null);
INSERT INTO `blacklist_copy` VALUES ('GTP', null, '2017-08-21 12:39:34', 'ZH_WG_01');

-- ----------------------------
-- Table structure for `whitelist`
-- ----------------------------
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist` (
  `type` varchar(16) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `phone` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whitelist
-- ----------------------------
INSERT INTO `whitelist` VALUES ('GTP', null, null, null, '魏中伟', '13911822035');
INSERT INTO `whitelist` VALUES ('GTP', null, null, null, '吕志亮', '13691236672');
INSERT INTO `whitelist` VALUES ('GTP', null, null, null, '沈凡', '18618267313');
INSERT INTO `whitelist` VALUES ('MQ', null, null, null, '杨光', '13911179820');
INSERT INTO `whitelist` VALUES ('MQ', null, null, null, '魏中伟', '13911822035');
INSERT INTO `whitelist` VALUES ('TE', null, null, 'xyk246#xyk146', '王宾', '18518692983');
INSERT INTO `whitelist` VALUES ('TE', null, null, '综合前置+文件不存在', '张冀越', '13699220462');
INSERT INTO `whitelist` VALUES ('TE', null, null, null, '魏中伟', '13911822035');
INSERT INTO `whitelist` VALUES ('TE', null, null, null, '周雪川', '13752097754');
INSERT INTO `whitelist` VALUES ('TE', null, null, null, '沈凡', '18618267313');
INSERT INTO `whitelist` VALUES ('TE', null, null, '6780', '洪火炬', '13400616590');
INSERT INTO `whitelist` VALUES ('TE', null, null, '6780', '雷廷中', '13003928325');
INSERT INTO `whitelist` VALUES ('TE', null, null, '6780', '林嘉龙', '13806034206');
INSERT INTO `whitelist` VALUES ('TE', null, null, '支付融资+size', '王文浩', '15652650947');
INSERT INTO `whitelist` VALUES ('TE', null, null, '网银+size', '王兴安', '15011018143');
INSERT INTO `whitelist` VALUES ('TE', null, null, '核心查询打印', '刘忠坤', '18811633599');
INSERT INTO `whitelist` VALUES ('TE', null, null, 'xyk246#xyk146', '李屹', '13910758840');

-- ----------------------------
-- Table structure for `whitelist_copy`
-- ----------------------------
DROP TABLE IF EXISTS `whitelist_copy`;
CREATE TABLE `whitelist_copy` (
  `type` varchar(16) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `phone` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of whitelist_copy
-- ----------------------------
INSERT INTO `whitelist_copy` VALUES ('GTP', null, null, null, '魏中伟', '13911822035');
INSERT INTO `whitelist_copy` VALUES ('GTP', null, null, null, '吕志亮', '13691236672');
INSERT INTO `whitelist_copy` VALUES ('GTP', null, null, null, '沈凡', '18618267313');
INSERT INTO `whitelist_copy` VALUES ('MQ', null, null, null, '杨光', '13911179820');
INSERT INTO `whitelist_copy` VALUES ('MQ', null, null, null, '魏中伟', '13911822035');
INSERT INTO `whitelist_copy` VALUES ('TE', null, null, 'xyk246#xyk146', '王宾', '18518692983');
INSERT INTO `whitelist_copy` VALUES ('TE', null, null, '综合前置+文件不存在', '张冀越', '13699220462');
INSERT INTO `whitelist_copy` VALUES ('TE', null, null, null, '魏中伟', '13911822035');
INSERT INTO `whitelist_copy` VALUES ('TE', null, null, null, '周雪川', '13752097754');
INSERT INTO `whitelist_copy` VALUES ('TE', null, null, null, '沈凡', '18618267313');
