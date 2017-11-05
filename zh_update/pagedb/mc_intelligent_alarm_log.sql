/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mycms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-06 01:53:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mc_intelligent_alarm_log
-- ----------------------------
DROP TABLE IF EXISTS `mc_intelligent_alarm_log`;
CREATE TABLE `mc_intelligent_alarm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `operate` varchar(16) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  `alarm_id` int(11) DEFAULT NULL,
  `operate_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mc_intelligent_alarm_log
-- ----------------------------
INSERT INTO `mc_intelligent_alarm_log` VALUES ('311', null, '2017-11-06 01:21:57', '2017-11-06 01:21:57', null, null, 'add', '2017-11-06 01:22:01', '1', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('312', null, '2017-11-06 01:25:24', '2017-11-06 01:25:24', null, null, 'add', '2017-11-06 01:25:30', '230', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('313', 'TongEASY', '2017-11-06 01:28:33', '2017-11-06 01:28:33', null, null, 'add', '2017-11-06 01:28:38', '231', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('314', 'TE', '2017-11-06 01:29:22', '2017-11-06 01:29:22', null, null, 'add', '2017-11-06 01:29:25', '232', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('315', 'TE', '2017-11-06 01:29:29', '2017-11-06 01:29:29', '十分顺丰速递', 'admin', 'add', '2017-11-06 01:33:38', '233', '::1');
