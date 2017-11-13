/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3400
Source Database       : xtsgldb

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-11-13 14:15:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mc_cloud_check
-- ----------------------------
DROP TABLE IF EXISTS `mc_cloud_check`;
CREATE TABLE `mc_cloud_check` (
  `cloudid` int(11) NOT NULL AUTO_INCREMENT,
  `nodename` varchar(200) NOT NULL,
  `sendfile` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `check_time` datetime NOT NULL,
  `save_filename` varchar(200) NOT NULL,
  `recv_filename` varchar(200) NOT NULL,
  `userid` int(11) NOT NULL,
  `check_status` varchar(20) NOT NULL,
  PRIMARY KEY (`cloudid`),
  UNIQUE KEY `id` (`cloudid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of mc_cloud_check
-- ----------------------------
INSERT INTO `mc_cloud_check` VALUES ('1', '66', '66', '66', '2017-11-13 10:55:56', './Public/gtpCheck/66/send/gtp_search_20171113105556.txt', './Public/gtpCheck/66/recv/gtp_recv_20171113105556.txt', '1', '0');
INSERT INTO `mc_cloud_check` VALUES ('2', '77', '777', '777', '2017-11-13 11:22:34', './Public/gtpCheck/77/send/gtp_search_20171113112234.txt', './Public/gtpCheck/77/recv/gtp_recv_20171113112234.txt', '1', '0');
INSERT INTO `mc_cloud_check` VALUES ('3', 'yy', 'yy', 'yy', '2017-11-13 11:25:43', './Public/gtpCheck/yy/send/gtp_search_20171113112543.txt', './Public/gtpCheck/yy/recv/gtp_recv_20171113112543.txt', '1', '0');
