/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mycms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-11-05 23:15:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mc_report_index_log
-- ----------------------------
DROP TABLE IF EXISTS `mc_report_index_log`;
CREATE TABLE `mc_report_index_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nodename` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL COMMENT '"02"=> 西三旗，\r\n"03"=>亦庄中金，\r\n"07" =>东单，\r\n"99"=>所有地方',
  `os_type` int(11) DEFAULT NULL COMMENT 'AIX  1，\r\nSolaris  2，\r\nWindows  4，\r\nLinux	8',
  `apps` int(11) DEFAULT NULL COMMENT 'MQ=>1，\r\nWAS=>2，\r\nOracle=>4，\r\nTong=>8，\r\nInformix=>16，\r\nCV=>32，\r\nGTP=>64',
  `server_id` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mc_report_index_log
-- ----------------------------
INSERT INTO `mc_report_index_log` VALUES ('1', '我认为', 'ddd', '3', '1', '3', '0', '1', '2017-11-05 12:53:13');
INSERT INTO `mc_report_index_log` VALUES ('2', '我认为', 'ddd', '3', '1', '3', '0', '1', '2017-11-05 12:53:29');
INSERT INTO `mc_report_index_log` VALUES ('3', 'e', 'e', '3', '1', '2', '0', '1', '2017-11-05 13:01:22');
INSERT INTO `mc_report_index_log` VALUES ('4', 'e', 'eee', '3', '1', '2', '0', '1', '2017-11-05 13:07:03');
INSERT INTO `mc_report_index_log` VALUES ('5', 'fff', 'fff', '3', '1', '94', '0', '1', '2017-11-05 13:07:17');
INSERT INTO `mc_report_index_log` VALUES ('6', '66', '66', '3', '1', '1', '666', '1', '2017-11-05 13:27:12');
INSERT INTO `mc_report_index_log` VALUES ('7', '系统名', 'aaaa', '3', null, '7', '444', '1', '2017-11-05 14:38:44');
INSERT INTO `mc_report_index_log` VALUES ('8', '系统名', 'aeeeaaa', '3', '1', '7', '444', '1', '2017-11-05 14:42:17');
INSERT INTO `mc_report_index_log` VALUES ('9', '中金CV服务器1', 'hxbackup1', '3', '4', '34', '17', '1', '2017-11-05 14:50:42');
INSERT INTO `mc_report_index_log` VALUES ('10', '中金CV服务器2', 'hxbackup2', '3', '4', '34', '18', '1', '2017-11-05 14:50:42');
