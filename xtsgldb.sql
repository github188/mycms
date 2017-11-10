/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3400
Source Database       : xtsgldb

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-11-10 17:17:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for check_file_result
-- ----------------------------
DROP TABLE IF EXISTS `check_file_result`;
CREATE TABLE `check_file_result` (
  `filename` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `result` text,
  `indate` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_file_result
-- ----------------------------
INSERT INTO `check_file_result` VALUES ('test20170911153827', '15', '2017-09-01 15:34:19', '2017-09-11 15:34:19', 'check finished.<br><br>', '2017-09-11 15:38:27', 'Y');
INSERT INTO `check_file_result` VALUES ('20170912091553', '16', '2017-09-11 09:15:31', '2017-09-12 09:15:31', '20886219068184120156_20170910.csv.zip from ZH_WXSMZF_01 to ZH_WKSDQS_01 is still failed:-3<br>20886219068184120156_20170910.csv.zip.digest from ZH_WXSMZF_01 to ZH_WKSDQS_01 is still failed:-3<br>918_application_all_20170910.xls from ZH_REPORT_01 to FH_1900_JXKH_01 is still failed:-3<br><br>', '2017-09-12 09:15:53', 'Y');
INSERT INTO `check_file_result` VALUES ('20170912172457', '17', '2017-09-11 17:17:39', '2017-09-11 23:17:39', 'check finished.<br><br>', '2017-09-12 17:24:57', 'Y');
INSERT INTO `check_file_result` VALUES ('20170914102803', '18', '2017-09-14 10:27:00', '2017-09-14 10:27:33', 'check finished.<br><br>', '2017-09-14 10:28:03', 'Y');
INSERT INTO `check_file_result` VALUES ('20170914214112', '19', '2017-09-18 21:40:03', '2017-09-14 21:40:03', 'check finished.<br><br>', '2017-09-14 21:41:12', 'Y');
INSERT INTO `check_file_result` VALUES ('20170914214251', '20', '2017-09-14 18:00:25', '2017-09-14 21:40:25', null, '2017-09-14 21:42:51', 'Y');
INSERT INTO `check_file_result` VALUES ('20170914214506', '21', '2017-09-14 21:42:03', '2017-09-14 21:42:03', null, '2017-09-14 21:45:06', 'Y');
INSERT INTO `check_file_result` VALUES ('20170921092221', '22', '2017-09-20 18:22:08', '2017-09-21 09:22:08', '956_application_all_20170919.xls from ZH_REPORT_01 to FH_5600_JXKH_01 is still failed:-3<br>COREFLOW-VOUCHER_9988_20170920.TXT from ZH_ZCTG_01 to ZH_REPORT_01 is still failed:-3<br>DEPOSIT_ACCT_MSG_20170921.TXT from ZH_ZCTG_01 to ZH_FINANCE_01 is still failed:-3<br><br>', '2017-09-21 09:22:21', 'Y');
INSERT INTO `check_file_result` VALUES ('20170921111920', '23', '2017-09-21 11:18:46', '2017-09-21 11:18:46', 'check finished.<br><br>', '2017-09-21 11:19:20', 'Y');
INSERT INTO `check_file_result` VALUES ('20170921112016', '24', '2017-09-21 09:18:52', '2017-09-21 11:18:52', '20886219068184120156_20170920.csv.zip from ZH_WXSMZF_01 to ZH_WKSDQS_01 is still failed:-3<br>DEPOSIT_ACCT_MSG_20170921.TXT from ZH_ZCTG_01 to ZH_FINANCE_01 is still failed:-3<br>20886219068184120156_20170920.csv.zip.digest from ZH_WXSMZF_01 to ZH_WKSDQS_01 is still failed:-3<br><br>', '2017-09-21 11:20:16', 'Y');
INSERT INTO `check_file_result` VALUES ('20171013092937', '25', '2017-10-13 09:27:04', '2017-10-13 09:27:04', 'check finished.<br><br>', '2017-10-13 09:29:37', 'Y');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `classname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `url` varchar(500) DEFAULT NULL,
  `is_show` int(11) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`classid`),
  UNIQUE KEY `classid` (`classid`) USING BTREE,
  UNIQUE KEY `classname` (`classname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('15', null, '短信报警', 'sms', null, null, null, null);
INSERT INTO `class` VALUES ('16', null, '云检查/处理', 'cloud', './Cloud', null, 'fa-cloud', null);

-- ----------------------------
-- Table structure for click_action_log
-- ----------------------------
DROP TABLE IF EXISTS `click_action_log`;
CREATE TABLE `click_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `click_num` int(11) NOT NULL DEFAULT '1',
  `ip` varchar(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `caseid` int(11) NOT NULL,
  `year` int(5) NOT NULL,
  `month` int(2) NOT NULL,
  `date` int(2) NOT NULL,
  `hour` int(2) NOT NULL,
  `datetime` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of click_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cloud_check
-- ----------------------------
DROP TABLE IF EXISTS `cloud_check`;
CREATE TABLE `cloud_check` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cloud_check
-- ----------------------------

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hapend_date` date NOT NULL,
  `jifang` varchar(100) NOT NULL,
  `huanjing` varchar(100) NOT NULL,
  `yewu` varchar(200) NOT NULL,
  `e_type` varchar(20) NOT NULL,
  `e_pinpai` varchar(20) NOT NULL,
  `e_xinghao` varchar(50) NOT NULL,
  `codeid` varchar(20) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `yujing` varchar(20) NOT NULL,
  `buwei` varchar(20) NOT NULL,
  `istingji` varchar(20) NOT NULL,
  `syears` varchar(10) NOT NULL,
  `chuli` varchar(50) NOT NULL,
  `result` varchar(500) NOT NULL,
  `huifu_date` varchar(20) NOT NULL,
  `in_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('21', '2017-05-05', '中金421', '测试/准生产', '请问', '存储', 'IBM', 'Power 750 Express', '06D47ET', '102.200.129.46', '巡检', '内存', '停机更换', '2', '2132', '12312', '2017-5-5\r\n', '2017-06-30 17:13:54');
INSERT INTO `equipment` VALUES ('22', '2017-05-10', '中金433', '测试/准生产', '士大夫', '小型机', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '3', '343', '34', '2017-05-30\r\n', '2017-06-30 17:13:54');
INSERT INTO `equipment` VALUES ('23', '2017-05-05', '中金421', '测试/准生产', '魏汝稳', 'PC服务器', '华为', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '2', '23', '23', '2017-5-5\r\n', '2017-06-30 17:13:54');
INSERT INTO `equipment` VALUES ('24', '2017-05-05', '中金421', '测试/准生产,灾备,生产', '魏汝稳', 'PC服务器', '华为', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '2', '23', '23', '2017-5-5', '2017-06-30 17:13:54');
INSERT INTO `equipment` VALUES ('25', '2017-05-05', '中金421', '测试/准生产,灾备,生产', '魏汝稳', 'PC服务器', '华为', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '2', '23', '23', '2017-5-5\r\n', '2017-07-04 09:51:23');
INSERT INTO `equipment` VALUES ('28', '2017-07-06', '中金433', '生产', '综合信息管理系统', 'PC服务器', 'IBM', '-[8737INC]-', '06EPNE5', '102.144.3.26', '监控', 'CPU', '已经宕机', '2', 'sfdx', 'dsf', '2017-7-6', '2017-07-06 09:39:06');
INSERT INTO `equipment` VALUES ('29', '2017-07-11', '101', '生产', 'VMware', 'PC服务器', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '在线更换', '7', 'ui', 'gy', '2017-7-11', '2017-07-11 09:34:12');
INSERT INTO `equipment` VALUES ('30', '2017-07-12', '101', '生产', 'VMware', '存储', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '7', 'ewe', 'qweqweqwe', '2017-7-12', '2017-07-12 15:06:12');
INSERT INTO `equipment` VALUES ('31', '2017-07-12', '101', '生产', 'VMware', '存储', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '7', 'ewe', 'qweqweqwew', '2017-7-12', '2017-07-12 15:06:16');
INSERT INTO `equipment` VALUES ('32', '2017-07-12', '101', '生产', 'VMware', '存储', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '7', 'ewew', 'qweqweqwew', '2017-7-12', '2017-07-12 15:06:18');
INSERT INTO `equipment` VALUES ('33', '2017-07-12', '101', '生产', 'VMware', '存储', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '7', 'ewew', 'qweqweqweww', '2017-7-12', '2017-07-12 15:06:21');
INSERT INTO `equipment` VALUES ('35', '2017-07-14', '101', '开发', 'VMware', '小型机', '华为', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '风扇', '停机更换', '7', 'ewewww', 'qweqweqweww', '2017-7-14', '2017-07-14 10:48:18');
INSERT INTO `equipment` VALUES ('37', '2017-07-14', '中金727', '生产', 'VMware', 'PC服务器', 'EMC', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '电源', '停机更换', '7', 'ewewwwww', 'qweqweqweww', '2017-7-14', '2017-07-14 10:49:33');
INSERT INTO `equipment` VALUES ('38', '2017-07-12', '101', '生产', 'VMware', '存储', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '7', 'ewewwwwww', 'qweqweqweww', '2017-7-12', '2017-07-12 15:06:40');
INSERT INTO `equipment` VALUES ('40', '2017-07-19', '101', '生产', 'VMware', '存储', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '风扇', '停机更换', '7', 'e', 'qweqweqweww2', '2017-7-19', '2017-07-19 11:15:50');
INSERT INTO `equipment` VALUES ('43', '2017-07-14', '101', '生产', 'VMware', 'PC服务器', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '硬盘', '在线更换', '7', 'ewewwwwww', 'q', '2017-7-14', '2017-07-14 10:21:23');
INSERT INTO `equipment` VALUES ('44', '2017-07-12', '101', '生产', 'VMware', 'PC服务器', 'IBM', 'System x3850 X5 -[7143TNH]-', '06M8820', '109.200.5.8', '监控', '内存', '停机更换', '6', '6', '6', '2017-7-12', '2017-07-12 17:05:27');

-- ----------------------------
-- Table structure for equipment_class
-- ----------------------------
DROP TABLE IF EXISTS `equipment_class`;
CREATE TABLE `equipment_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `e_class` varchar(20) NOT NULL,
  `e_name` varchar(50) NOT NULL,
  `in_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of equipment_class
-- ----------------------------
INSERT INTO `equipment_class` VALUES ('3', 'jifang', '中金421', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('4', 'jifang', '中金422', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('5', 'jifang', '中金433', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('6', 'jifang', '中金434', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('7', 'jifang', '中金725', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('8', 'jifang', '中金726', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('9', 'jifang', '中金727', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('10', 'jifang', '中金736', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('11', 'jifang', '西三旗', '2017-04-21 15:11:12');
INSERT INTO `equipment_class` VALUES ('12', 'huanjing', '测试/准生产', '2017-04-21 15:14:43');
INSERT INTO `equipment_class` VALUES ('13', 'huanjing', '灾备', '2017-04-21 15:14:43');
INSERT INTO `equipment_class` VALUES ('14', 'huanjing', '生产', '2017-04-21 15:14:43');
INSERT INTO `equipment_class` VALUES ('15', 'e_type', '小型机', '2017-04-21 15:17:39');
INSERT INTO `equipment_class` VALUES ('16', 'e_type', 'PC服务器', '2017-04-21 15:17:39');
INSERT INTO `equipment_class` VALUES ('17', 'e_type', '存储', '2017-04-21 15:17:39');
INSERT INTO `equipment_class` VALUES ('18', 'e_type', '其它', '2017-04-21 15:17:39');
INSERT INTO `equipment_class` VALUES ('19', 'e_pinpai', 'IBM', '2017-04-21 15:20:02');
INSERT INTO `equipment_class` VALUES ('20', 'e_pinpai', '华为', '2017-04-21 15:20:02');
INSERT INTO `equipment_class` VALUES ('21', 'e_pinpai', '联想', '2017-04-21 15:20:02');
INSERT INTO `equipment_class` VALUES ('22', 'e_pinpai', '浪潮', '2017-04-21 15:20:02');
INSERT INTO `equipment_class` VALUES ('23', 'e_pinpai', 'EMC', '2017-04-21 15:20:02');
INSERT INTO `equipment_class` VALUES ('24', 'yujing', '巡检', '2017-04-21 15:21:07');
INSERT INTO `equipment_class` VALUES ('25', 'yujing', '监控', '2017-04-21 15:21:07');
INSERT INTO `equipment_class` VALUES ('26', 'buwei', 'CPU', '2017-04-21 15:22:47');
INSERT INTO `equipment_class` VALUES ('27', 'buwei', '内存', '2017-04-21 15:22:47');
INSERT INTO `equipment_class` VALUES ('28', 'buwei', '硬盘', '2017-04-21 15:22:47');
INSERT INTO `equipment_class` VALUES ('29', 'buwei', '电源', '2017-04-21 15:22:47');
INSERT INTO `equipment_class` VALUES ('30', 'buwei', '风扇', '2017-04-21 15:22:47');
INSERT INTO `equipment_class` VALUES ('31', 'buwei', '其它', '2017-04-21 15:22:47');
INSERT INTO `equipment_class` VALUES ('32', 'istingji', '在线更换', '2017-04-21 15:23:53');
INSERT INTO `equipment_class` VALUES ('33', 'istingji', '停机更换', '2017-04-21 15:23:53');
INSERT INTO `equipment_class` VALUES ('34', 'istingji', '已经宕机', '2017-04-21 15:23:53');
INSERT INTO `equipment_class` VALUES ('44', 'e_pinpai', 'Cisco', '2017-05-04 11:56:24');
INSERT INTO `equipment_class` VALUES ('45', 'huanjing', '开发', '2017-05-04 17:02:35');
INSERT INTO `equipment_class` VALUES ('47', 'jifang', '1510库房', '2017-05-05 11:36:09');
INSERT INTO `equipment_class` VALUES ('49', 'e_pinpai', 'Inspur', '2017-05-11 10:31:42');
INSERT INTO `equipment_class` VALUES ('51', 'e_pinpai', 'To', '2017-07-06 09:19:41');
INSERT INTO `equipment_class` VALUES ('52', 'jifang', '101', '2017-07-11 09:33:14');

-- ----------------------------
-- Table structure for equipment_monitor
-- ----------------------------
DROP TABLE IF EXISTS `equipment_monitor`;
CREATE TABLE `equipment_monitor` (
  `serialnumber` varchar(128) NOT NULL DEFAULT '',
  `hostname` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `manufacturername` varchar(64) DEFAULT NULL,
  `hx_appname` varchar(255) DEFAULT NULL,
  `hx_businessip` varchar(255) DEFAULT NULL,
  `hx_otherip` varchar(128) DEFAULT NULL,
  `hx_room` varchar(64) DEFAULT NULL,
  `hx_systemenvironment` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of equipment_monitor
-- ----------------------------
INSERT INTO `equipment_monitor` VALUES ('06-2DADH', '', '', '', '', '137.58.1.133', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06-2DC9H', '', '', '', '', '137.58.1.33', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06-5F4F6', '', '', '', '南京分行特色业务系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06-5F506', '', '', '', '南京分行特色业务系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06-8A8FH', '', '', '', '南京分行特色业务系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0604D9T', 'gylweb2', 'Power 720 Express', 'IBM', '供应链金融系统', '102.200.128.167', '102.80.192.18', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0604DAT', 'hxb2cif6', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.91', '172.16.128.169,192.168.254.184', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0604DBT', 'hxb2papp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.93', '172.16.128.184,192.168.254.186', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0604DCT', 'enbdb2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.192.175', '10.1.9.2,192.168.254.175,172.16.128.234,172.16.128.232,169.254.87.65', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0604DDT', 'hxb2tapp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.103', '172.16.128.205,192.168.254.162', '422', '');
INSERT INTO `equipment_monitor` VALUES ('0604FCT', 'gylyydb2', 'Power 720 Express', 'IBM', '', '102.200.192.78', '102.101.5.33,192.101.5.35,169.254.82.112,102.101.5.35', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06050BT', 'cmsdb2', 'Power 720 Express', 'IBM', '合规管理', '102.200.128.147', '102.144.2.17,102.144.2.20,192.144.2.19,169.254.156.146,102.144.2.19', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06050DT', 'fxqdb2', 'Power 720 Express', 'IBM', '人行反洗钱系统', '102.200.128.141', '102.80.13.17,192.80.13.19,169.254.50.164,102.80.13.19', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060511T', 'gylapp1', 'Power 720 Express', 'IBM', '供应链金融系统', '102.80.18.8', '102.200.128.164', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060512T', 'gylyydb1', 'Power 720 Express', 'IBM', '', '102.200.192.77', '102.101.5.32,192.101.5.34,169.254.93.158,102.101.5.36,102.101.5.34', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060516T', 'fxqap1', 'Power 720 Express', 'IBM', '人行反洗钱系统', '102.200.128.138', '102.80.13.8', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060518T', 'cmsdb1', 'Power 720 Express', 'IBM', '合规管理', '102.200.128.146', '102.144.2.16,192.144.2.18,169.254.44.241,102.144.2.18', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06051BT', 'gyldb2', 'Power 720 Express', 'IBM', '供应链金融系统', '102.200.128.169', '102.80.18.25,192.80.18.27,169.254.229.70,102.80.18.27', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06051FT', 'gyldb1', 'Power 720 Express', 'IBM', '供应链金融系统', '102.200.128.168', '102.80.18.24,192.80.18.26,169.254.199.143,102.80.18.28,102.80.18.26', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060529T', 'hgglapp2', 'Power 720 Express', 'IBM', '合规管理', '102.200.128.125', '102.144.2.10', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06052BT', 'fxqdb1', 'Power 720 Express', 'IBM', '人行反洗钱系统', '102.200.128.140', '102.80.13.16,192.80.13.18,169.254.131.155,102.80.13.20,102.80.13.18', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06052ET', 'fxqap2', 'Power 720 Express', 'IBM', '人行反洗钱系统', '102.200.128.139', '102.80.13.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060530T', 'hgglapp1', 'Power 720 Express', 'IBM', '合规管理', '102.200.128.124', '102.144.2.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06053CT', 'gylweb1', 'Power 720 Express', 'IBM', '供应链金融系统', '102.200.128.166', '102.80.192.17', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06053DT', 'gylapp2', 'Power 720 Express', 'IBM', '供应链金融系统', '102.80.18.9', '102.200.128.165', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06053FT', 'hxb1eapp1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.106', '172.16.128.208,192.168.254.165,192.168.161.20', '422', '');
INSERT INTO `equipment_monitor` VALUES ('060540T', 'hxb2bapp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.96', '172.16.128.189,192.168.254.189', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060543T', 'hxb2eapp1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.94', '172.16.128.187,192.168.254.187,192.168.161.22', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060544T', 'dzpjdb1', 'Power 740 Express', 'IBM', '票据综合管理系统', '102.200.129.21', '102.80.214.18,102.80.14.16,192.80.214.18', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060547T', 'dzpjdb2', 'Power 740 Express', 'IBM', '票据综合管理系统', '102.200.129.22', '102.80.214.19,192.80.214.19', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060548T', 'hxb2papp1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.92', '172.16.128.183,192.168.254.185', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060549T', 'hxb1eapp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.107', '172.16.128.209,192.168.254.166,192.168.161.21', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06054AT', 'enbdb1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.192.174', '10.1.9.1,192.168.254.174,172.16.128.235,172.16.128.233,172.16.128.231,169.254.73.236', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06054DT', 'hxb2cif5', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.90', '172.16.128.168,192.168.254.183', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060551T', 'hxb2tapp1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.102', '172.16.128.204,192.168.254.161', '422', '');
INSERT INTO `equipment_monitor` VALUES ('060553T', 'hxb2eapp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.95', '172.16.128.188,192.168.254.188,192.168.161.23', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0608DA6', 'qyzx1', 'Power 550', 'IBM', '企业征信', '102.200.128.154', '102.80.216.10,102.80.16.8,192.80.216.10', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0608E16', 'qyzx2', 'Power 550', 'IBM', '企业征信', '102.200.128.155', '102.80.216.11,192.80.216.11', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0608E46', 'netapp02', 'Power 550', 'IBM', 'B2B网上支付系统', '108.201.1.37', '172.16.128.134,192.168.254.201', '422', '');
INSERT INTO `equipment_monitor` VALUES ('0608EA6', 'netapp01', 'Power 550', 'IBM', 'B2B网上支付系统', '108.201.1.36', '172.16.128.133,192.168.254.200', '422', '');
INSERT INTO `equipment_monitor` VALUES ('0608EB6', 'netweb02', 'Power 720 Express', 'IBM', 'B2B网上支付系统', '102.198.10.10', '', '422', '');
INSERT INTO `equipment_monitor` VALUES ('0608F46', 'localhost', 'Power 550', 'IBM', 'B2B网上支付系统', '108.201.1.31', '172.16.64.43', '', '');
INSERT INTO `equipment_monitor` VALUES ('06090D6', 'localhost', 'Power 550', 'IBM', 'B2B网上支付系统', '108.201.1.39', '172.16.128.136,192.168.254.203', '', '');
INSERT INTO `equipment_monitor` VALUES ('06090F6', 'localhost', 'Power 550', 'IBM', 'B2B网上支付系统', '108.201.1.38', '172.16.128.135,192.168.254.202', '', '');
INSERT INTO `equipment_monitor` VALUES ('06091B6', 'localhost', 'Power 550', 'IBM', 'B2B网上支付系统', '102.198.10.11', '', '422', '');
INSERT INTO `equipment_monitor` VALUES ('060CACR', 'zhqztj1', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.21', '110.121.204.42,192.121.204.42', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CB2R', 'zhqzap1', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.13', '110.121.4.16', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CB3R', 'zhqztx1', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.11', '110.121.204.9,192.121.204.9', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CB8R', 'zhqztj2', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.22', '110.121.204.43,192.121.204.43', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CBFR', 'zhqzap4', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.16', '110.121.4.19', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CC2R', 'zhqzap3', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.15', '110.121.4.18', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CC6R', 'zhqzap2', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.14', '110.121.4.17', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060CD0R', 'zhqztx2', 'Power 740 Express', 'IBM', '前置A系统', '110.200.2.12', '110.121.204.10,110.121.4.8,192.121.204.10', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('060F1CT', 'grzx1', 'Power 740 Express', 'IBM', '个人征信', '102.200.3.104', '102.198.204.54,102.198.4.52,192.198.204.54', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060F1FT', 'b2bdb1', 'Power 740 Express', 'IBM', 'B2B网上支付系统', '108.201.192.204', '10.1.254.1,172.16.128.151,192.168.254.204,10.1.255.1', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060F23T', 'grzx2', 'Power 740 Express', 'IBM', '个人征信', '102.200.3.105', '102.198.204.55,192.198.204.55', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060F25T', 'b2bdb2', 'Power 740 Express', 'IBM', 'B2B网上支付系统', '108.201.192.205', '10.1.254.2,192.168.254.205,10.1.255.2', '433', '');
INSERT INTO `equipment_monitor` VALUES ('060F26T', 'czdcmsap1', 'Power 740 Express', 'IBM', '村镇信贷管理', '102.200.3.106', '102.64.1.170', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('060F2DT', 'czwypap2', 'Power 740 Express', 'IBM', '', '', '172.16.133.11,192.168.253.15', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06122CR', 'zhqzdb1', 'Power 750 Express', 'IBM', '前置A系统', '110.200.2.17', '110.121.4.24,192.121.204.26,169.254.89.168,110.121.4.28,110.121.4.26', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('061234R', 'zhqzdb2', 'Power 750 Express', 'IBM', '前置A系统', '110.200.2.18', '110.121.4.25,192.121.204.27,169.254.219.111,110.121.4.27', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('061691R', 'ickms1', '8202-E4B', 'IBM', '金融IC卡密钥管理', '102.200.2.206', '102.64.15.40', '421', '');
INSERT INTO `equipment_monitor` VALUES ('061698R', 'hxkjkdb2', '8202-E4B', 'IBM', '集中银联前置系统', '102.200.2.211', '102.64.14.61,192.64.14.63,169.254.39.223,102.64.14.63', '421', '');
INSERT INTO `equipment_monitor` VALUES ('0616DER', 'nbradb2', '8202-E4B', 'IBM', 'RA系统', '108.201.192.223', '10.1.2.2,192.168.254.222,172.16.128.201,172.16.128.199,172.16.128.197,169.254.10.72', '422', '');
INSERT INTO `equipment_monitor` VALUES ('0616DFR', 'swiftsaa1', '8202-E4B', 'IBM', 'SWIFT系统', '102.200.3.76', '102.64.233.13,192.64.233.13,102.64.33.12', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0616E5R', 'swiftsaa2', '8202-E4B', 'IBM', 'SWIFT系统', '102.200.3.77', '102.64.233.14,192.64.233.14', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0616ECR', 'nbradb1', '8202-E4B', 'IBM', 'RA系统', '108.201.192.222', '10.1.2.1,192.168.254.223,172.16.128.198,172.16.128.196,169.254.77.3', '422', '');
INSERT INTO `equipment_monitor` VALUES ('061974T', 'hxcxdy2', 'Power 750 Express', 'IBM', '数据抽取与报表系统', '102.200.3.61', '102.179.1.32,192.179.201.35,102.179.201.35', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('061975T', 'jzrpap1', 'Power 750 Express', 'IBM', '数据抽取与报表系统', '102.200.3.62', '102.179.1.15,192.179.201.38,102.179.201.38', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06197CT', 'hxcxdy1', 'Power 750 Express', 'IBM', '数据抽取与报表系统', '102.200.3.60', '102.179.201.34,192.179.201.34', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('061984T', 'jzrpap2', 'Power 750 Express', 'IBM', '数据抽取与报表系统', '102.200.3.63', '102.179.201.39,192.179.201.39', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('061CE76', 'dangan1', 'Power 550', 'IBM', '档案管理', '102.200.2.74', '102.129.209.13,192.129.209.13,192.128.0.11', '422', '');
INSERT INTO `equipment_monitor` VALUES ('061CF26', 'dangan2', 'Power 550', 'IBM', '档案管理', '102.200.2.75', '102.129.209.14,192.129.209.14,192.128.0.12,102.129.9.11', '422', '');
INSERT INTO `equipment_monitor` VALUES ('061D405', 'ysgx2', 'Power 550', 'IBM', '银税信息共享', '102.200.2.195', '102.64.224.13,192.64.224.13', '421', '');
INSERT INTO `equipment_monitor` VALUES ('061D415', 'ysgx1', 'Power 550', 'IBM', '银税信息共享', '102.200.2.194', '102.64.224.12,192.64.224.12,102.64.24.10', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06210FH', 'b2bserver1', 'p5 550', 'IBM', '村镇作业调度', '110.200.1.113', '110.200.3.21,192.200.3.23', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('062577T', 'whmm1', 'Power 720 Express', 'IBM', '个人外汇买卖', '102.200.128.190', '102.80.235.18,192.80.235.18', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062578T', 'dzpjap2', 'Power 740 Express', 'IBM', '票据综合管理系统', '102.200.129.20', '102.80.214.11,192.80.214.11', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062579T', 'cataapp4', 'Power 720 Express', 'IBM', '支付融资系统', '102.200.3.201', '102.200.3.201', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06257AT', 'zhglxx2', 'Power 740 Express', 'IBM', '综合信息管理系统', '102.200.128.161', '102.144.3.10,192.144.3.11,169.254.140.102,102.144.3.11', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06257BT', 'zhglxx1', 'Power 740 Express', 'IBM', '综合信息管理系统', '102.200.128.160', '102.144.3.12,192.144.3.9,169.254.137.139,102.144.3.9,102.144.3.8', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06257CT', 'sjgddb3', 'Power 740 Express', 'IBM', '数据归档系统', '102.200.128.206', '102.80.11.32,169.254.138.179,192.80.11.34,102.80.11.36,102.80.11.34', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06257DT', 'netweb05', 'Power 720 Express', 'IBM', 'B2B网上支付系统', '108.201.1.42', '172.16.64.45', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06257ET', 'dzpjap1', 'Power 740 Express', 'IBM', '票据综合管理系统', '102.200.129.19', '102.80.214.10,102.80.14.8,192.80.214.10', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06257FT', 'zwrzgkydb2', 'Power 740 Express', 'IBM', '指纹授权系统', '102.200.129.135', '102.81.5.33,192.81.5.35,169.254.64.40,102.81.5.35', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062581T', 'zwrzgkydb1', 'Power 740 Express', 'IBM', '指纹授权系统', '102.200.129.134', '102.81.5.32,192.81.5.34,169.254.231.27,102.81.5.36,102.81.5.34', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062586T', 'sjgddb4', 'Power 740 Express', 'IBM', '数据归档系统', '102.200.128.207', '102.80.11.33,169.254.143.232,192.80.11.35,102.80.11.35', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062587T', 'gdhs1', 'Power 720 Express', 'IBM', '', '102.200.128.198', '102.80.205.18,102.80.5.8,192.80.205.18', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062588T', 'cccti2', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.128.181', '102.80.19.13', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062589T', 'sjckgjydzbcxdb2', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.163.40', '102.96.250.65,192.96.250.67,169.254.62.51,102.96.250.67', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06258AT', 'kjysap1', 'Power 720 Express', 'IBM', '会计要素管理', '102.200.192.71', '102.101.4.16,102.200.196.30', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06258CT', 'hxb2web1', 'Power 720 Express', 'IBM', '网上银行系统', '108.201.1.88', '172.16.64.101', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062591T', 'ccweb2', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.128.183', '102.80.19.17', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0625D9T', 'dcmsap1', 'Power 740 Express', 'IBM', '信贷管理系统', '102.200.128.186', '110.17.1.21', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0625DBT', 'kjysdb2', 'Power 720 Express', 'IBM', '会计要素管理', '102.200.192.74', '102.101.4.33,192.101.4.35,169.254.207.227,102.101.4.35', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0625DET', 'sjckgjydzbcxdb1', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.163.39', '102.96.250.64,192.96.250.66,169.254.183.252,102.96.250.68,102.96.250.66', '434', '');
INSERT INTO `equipment_monitor` VALUES ('0625E9T', 'dcmsap2', 'Power 740 Express', 'IBM', '信贷管理系统', '102.200.128.187', '110.17.1.22', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0625EDT', 'cccti1', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.128.180', '102.80.19.12', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0625F4T', 'whmm2', 'Power 720 Express', 'IBM', '个人外汇买卖', '102.200.128.191', '102.80.235.19,102.80.35.16,192.80.235.19', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0625F9T', 'gdhs2', 'Power 720 Express', 'IBM', '公积金系统', '102.200.128.199', '102.80.205.19,192.80.205.19', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0625FCT', 'hxb2web2', 'Power 720 Express', 'IBM', '网上银行系统', '108.201.1.89', '172.16.64.102', '433', '');
INSERT INTO `equipment_monitor` VALUES ('0625FDT', 'ccweb1', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.128.182', '102.80.19.16', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062600T', 'dcmsrun2', 'Power 720 Express', 'IBM', '信贷管理系统', '102.200.128.189', '110.17.201.39,192.17.201.39', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06260DT', 'whpj2', 'Power 720 Express', 'IBM', '外汇牌价系统', '102.200.128.79', '102.80.206.10,102.80.6.8,192.80.206.10', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062612T', 'cataapp3', 'Power 720 Express', 'IBM', '支付融资系统', '108.201.4.20', '102.200.3.200', '422', '');
INSERT INTO `equipment_monitor` VALUES ('062614T', 'dcmsdb2', 'Power 740 Express', 'IBM', '信贷管理系统', '102.200.128.185', '110.17.1.16,192.17.1.16,169.254.134.60,110.17.1.18', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062616T', 'dcmsrun1', 'Power 720 Express', 'IBM', '信贷管理系统', '102.200.128.188', '110.17.1.40,192.17.201.38,110.17.201.38', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062618T', 'whpj1', 'Power 720 Express', 'IBM', '外汇牌价系统', '102.200.128.78', '102.80.206.9,192.80.206.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06261DT', 'netweb04', 'Power 750 Express', 'IBM', 'B2B网上支付系统', '108.201.1.41', '172.16.64.43', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06261ET', 'dcmsdb1', 'Power 740 Express', 'IBM', '信贷管理系统', '102.200.128.184', '110.17.1.15,110.17.1.19,192.17.1.15,169.254.36.236,110.17.1.17', '433', '');
INSERT INTO `equipment_monitor` VALUES ('062681T', 'sjshjr2', 'Power 740 Express', 'IBM', '', '', '172.16.67.11', '', '');
INSERT INTO `equipment_monitor` VALUES ('062683T', 'sjjrjr2', 'Power 740 Express', 'IBM', '手机银行系统', '108.201.67.9', '172.16.67.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06276ER', 'sfhc1', '8202-E4B', 'IBM', '公安部身份核验', '102.200.2.161', '102.64.220.13,102.64.20.11,192.64.220.13', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062774R', 'sfhc2', '8202-E4B', 'IBM', '公安部身份核验', '102.200.2.162', '102.64.220.14,192.64.220.14', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062778R', 'nbuhf1', '8202-E4B', 'IBM', '数据恢复', '102.200.2.166', '', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062781R', 'xsq_sjfz_a', '8202-E4B', 'IBM', '数据恢复', '102.200.2.163', '', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062788R', 'nbuhf2', '8202-E4B', 'IBM', '数据恢复', '102.200.2.167', '', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06278BR', 'zj_hf_11g_a', '8202-E4B', 'IBM', '数据恢复', '102.200.2.165', '', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062790R', 'zj_hf_10g_a', '8202-E4B', 'IBM', '数据恢复', '102.200.2.164', '', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062DEER', 'whkzw2', '8202-E4B', 'IBM', '外汇卡', '102.200.2.199', '102.64.21.11,192.64.221.14,102.64.221.14', '422', '');
INSERT INTO `equipment_monitor` VALUES ('062DF9R', 'whkzw1', '8202-E4B', 'IBM', '外汇卡', '102.200.2.198', '102.64.221.13,192.64.221.13', '422', '');
INSERT INTO `equipment_monitor` VALUES ('062DFBR', 'whkxf2', '8202-E4B', 'IBM', '外汇卡', '102.200.2.201', '102.64.21.21,192.64.221.24,102.64.221.24', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062E00R', 'czra1', '8202-E4B', 'IBM', '', '', '10.1.3.13,192.168.253.12,172.16.133.33,172.16.133.31,169.254.242.62', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062E07R', 'whkxf1', '8202-E4B', 'IBM', '外汇卡', '102.200.2.200', '102.64.221.23,192.64.221.23', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('062F9CR', 'bancs01', 'Power 780', 'IBM', '核心高可用', '109.200.8.26', '192.168.2.26,172.16.2.26,102.81.2.18', '4-1', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('063541T', 'zbxmsjcj1', 'Power 720 Express', 'IBM', '资本数据采集', '102.200.128.195', '102.80.220.10,102.80.20.8,192.80.220.10', '433', '');
INSERT INTO `equipment_monitor` VALUES ('063547T', 'gtpm2', 'Power 720 Express', 'IBM', '文件传输系统', '102.200.128.214', '102.80.212.67,192.80.212.67', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06354BT', 'zbxmsjcj2', 'Power 720 Express', 'IBM', '资本数据采集', '102.200.128.196', '102.80.220.11,192.80.220.11', '433', '');
INSERT INTO `equipment_monitor` VALUES ('064265T', 'edzfmgap2', '', '', '第二代支付系统', '102.200.160.39', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('064268T', 'kjysdb1', 'Power 720 Express', 'IBM', '会计要素管理', '102.200.192.73', '102.101.4.32,192.101.4.34,169.254.102.171,102.101.4.36,102.101.4.34', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06426AT', 'edzfmgdb1', '', '', '第二代支付系统', '102.200.160.40', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06426CT', 'hxb1web1', 'Power 720 Express', 'IBM', '网上银行系统', '108.201.1.98', '172.16.64.104', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06426ET', 'edzfmgdb2', '', '', '第二代支付系统', '102.200.160.41', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('064270T', 'ealogserver', 'Power 720 Express', 'IBM', '', '', '172.16.72.26,192.168.254.149', '', '');
INSERT INTO `equipment_monitor` VALUES ('064271T', 'hxb1web2', 'Power 720 Express', 'IBM', '网上银行系统', '108.201.1.99', '172.16.64.105', '422', '');
INSERT INTO `equipment_monitor` VALUES ('064272T', 'edzfmgap1', '', '', '第二代支付系统', '102.200.160.38', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('064273T', 'kjysap2', 'Power 720 Express', 'IBM', '会计要素管理', '102.200.192.72', '102.101.4.17,102.200.196.31', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06465AR', 'gjjsdb2', 'Power 750 Express', 'IBM', '国际结算系统', '102.200.2.193', '102.64.28.18,192.64.228.19,169.254.232.39,102.64.28.19', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06466AR', 'gjjsdb1', 'Power 750 Express', 'IBM', '国际结算系统', '102.200.2.192', '102.64.28.16,192.64.228.17,169.254.99.247,102.64.28.20,102.64.28.17', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0647DCR', 'swiftsag2', '8202-E4B', 'IBM', 'SWIFT系统', '102.200.3.75', '102.64.33.9', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0647DER', 'swiftsag1', '8202-E4B', 'IBM', 'SWIFT系统', '102.200.3.74', '102.64.33.8', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0648E86', 'hx2khis1', 'Power 550', 'IBM', '2K历史数据查询', '102.200.128.74', '102.80.204.9,102.80.4.8,192.80.204.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0648E96', 'hx2khis2', 'Power 550', 'IBM', '2K历史数据查询', '102.200.128.75', '102.80.204.10,192.80.204.10', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0653B5R', 'czra2', '8202-E4B', 'IBM', '', '', '10.1.3.14,192.168.253.13,172.16.133.35,172.16.133.34,172.16.133.32,169.254.132.173', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0653B6R', 'czzx1', '8202-E4B', 'IBM', '村镇个人企业征信', '102.200.2.184', '102.64.201.17,192.64.201.17', '421', '');
INSERT INTO `equipment_monitor` VALUES ('0653BAR', 'czwyap2', '8202-E4B', 'IBM', '', '', '172.16.133.9,192.168.253.9', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0653CDR', 'czwyap1', '8202-E4B', 'IBM', '', '', '172.16.133.8,192.168.253.8', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0653CER', 'czwydb1', '8202-E4B', 'IBM', '', '', '10.1.3.9,192.168.253.10,172.16.133.23,172.16.133.21,169.254.25.13', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0653D9R', 'czwydb2', '8202-E4B', 'IBM', '', '', '10.1.3.10,192.168.253.11,172.16.133.25,172.16.133.24,172.16.133.22,169.254.151.191', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0653DAR', 'czzx2', '8202-E4B', 'IBM', '村镇个人企业征信', '102.200.2.185', '102.64.201.18,102.64.1.15,192.64.201.18', '421', '');
INSERT INTO `equipment_monitor` VALUES ('0653E9H', 'nbuhf156', 'p5 550', 'IBM', '数据恢复', '102.200.3.156', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06540AH', 'nbuhf155', 'p5 550', 'IBM', '数据恢复', '102.200.3.155', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0655D4T', 'hxbacrm2', 'Power 750 Express', 'IBM', '对公CRM', '102.200.160.15', '102.96.1.18,192.96.1.19,169.254.82.94,102.96.1.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0655D5T', 'hxbacrm1', 'Power 750 Express', 'IBM', '对公CRM', '102.200.160.14', '102.96.1.16,192.96.1.17,169.254.51.182,102.96.1.20,102.96.1.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06568CT', 'hxbocrm2', 'Power 750 Express', 'IBM', '对公CRM', '102.200.160.17', '102.96.1.26,192.96.1.27,169.254.237.255,102.96.1.27', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065690T', 'hxbccrm1', 'Power 750 Express', 'IBM', '对公CRM', '102.200.160.12', '102.96.1.8,102.96.1.12,192.96.1.9,169.254.36.35,102.96.1.9', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065691T', 'hxbccrm2', 'Power 750 Express', 'IBM', '对公CRM', '102.200.160.13', '102.96.1.10,192.96.1.11,169.254.40.8,102.96.1.11', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065698T', 'hxbocrm1', 'Power 750 Express', 'IBM', '对公CRM', '102.200.160.16', '102.96.1.24,192.96.1.25,169.254.119.188,102.96.1.28,102.96.1.25', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06587BT', 'hxbcrmweb2', 'Power 740 Express', 'IBM', '对公CRM', '102.200.160.19', '102.96.1.31', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06587CT', 'hxb1web6', 'Power 720 Express', 'IBM', '网上银行系统', '108.201.1.101', '172.16.66.74', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06587DT', 'hxbcrmweb1', 'Power 740 Express', 'IBM', '对公CRM', '102.200.160.18', '102.96.1.30', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065881T', 'hxb1web5', 'Power 720 Express', 'IBM', '网上银行系统', '108.201.1.100', '172.16.66.73', '422', '');
INSERT INTO `equipment_monitor` VALUES ('065885T', 'sjcqpt1', 'Power 750 Express', 'IBM', '数据抽取与报表系统', '102.200.128.174', '102.80.201.66,192.80.201.66', '433', '');
INSERT INTO `equipment_monitor` VALUES ('065886T', 'sjcqpt2', 'Power 750 Express', 'IBM', '数据抽取与报表系统', '102.200.128.175', '102.80.201.67,102.80.1.64,192.80.201.67', '433', '');
INSERT INTO `equipment_monitor` VALUES ('065887T', 'sjshap1', 'Power 740 Express', 'IBM', '', '', '172.16.68.10,192.168.252.10', '', '');
INSERT INTO `equipment_monitor` VALUES ('065888T', 'sjjrap1', 'Power 740 Express', 'IBM', '手机银行系统', '108.201.194.8', '172.16.68.8,192.168.252.8', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06588AT', 'sjlog', 'Power 720 Express', 'IBM', '手机银行系统', '108.201.194.16', '172.16.68.16,192.168.252.16', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06588BT', 'sjdb2', 'Power 740 Express', 'IBM', '手机银行系统', '108.201.194.18', '10.1.7.2,192.168.252.18,172.16.68.23,172.16.68.21,169.254.207.227', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06588CT', 'sjjrap5', 'Power 720 Express', 'IBM', '', '', '172.16.68.14,192.168.252.14', '', '');
INSERT INTO `equipment_monitor` VALUES ('06588DT', 'sjjrap6', 'Power 720 Express', 'IBM', '', '', '172.16.68.15,192.168.252.15', '', '');
INSERT INTO `equipment_monitor` VALUES ('06588FT', 'zctgdb2', 'Power 720 Express', 'IBM', '资产托管系统', '102.200.192.133', '102.101.14.33,102.101.14.36,192.101.14.35,169.254.41.212,102.101.14.35', '725', '');
INSERT INTO `equipment_monitor` VALUES ('065891T', 'sjmg2', 'Power 720 Express', 'IBM', '手机银行系统', '108.201.194.13', '172.16.68.13,192.168.252.13', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065892T', 'sjdb1', 'Power 740 Express', 'IBM', '手机银行系统', '108.201.194.17', '10.1.7.1,192.168.252.17,172.16.68.24,172.16.68.22,172.16.68.20,169.254.11.210', '433', '');
INSERT INTO `equipment_monitor` VALUES ('065893T', 'sjjrap2', 'Power 740 Express', 'IBM', '手机银行系统', '108.201.194.9', '172.16.68.9,192.168.252.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065894T', 'sjshap2', 'Power 740 Express', 'IBM', '', '', '172.16.68.11,192.168.252.11', '', '');
INSERT INTO `equipment_monitor` VALUES ('065895T', 'zctgdb1', 'Power 720 Express', 'IBM', '资产托管系统', '102.200.192.132', '102.101.14.32,192.101.14.34,169.254.149.229,102.101.14.34', '725', '');
INSERT INTO `equipment_monitor` VALUES ('065896T', 'sjmg1', 'Power 720 Express', 'IBM', '手机银行系统', '108.201.194.12', '172.16.68.12,192.168.252.12', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065899T', 'netweb02', 'Power 750 Express', 'IBM', 'B2B网上支付系统', '108.201.1.40', '172.16.64.42', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06589AT', 'zfmmdb4', 'Power 720 Express', 'IBM', '支付密码系统', '102.200.129.120', '102.80.25.29,102.80.25.32,192.80.25.31,169.254.81.162,102.80.25.31', '433', '');
INSERT INTO `equipment_monitor` VALUES ('065C4C4', 'dzgz1', 'Power 550', 'IBM', '国债系统', '110.200.1.183', '110.198.15.11,192.198.215.13,110.198.215.13', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('065C684', 'dzgz2', 'Power 550', 'IBM', '国债系统', '110.200.1.184', '110.198.215.14,192.198.215.14', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('066709H', 'cv-beaihf', 'p5 550', 'IBM', '数据恢复', '110.200.2.37', '110.161.1.12,192.195.1.10', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06705AT', 'zwsq2', '9179-MHC', 'IBM', '指纹授权系统', '102.200.132.15', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06705CT', 'zwsq1', '9179-MHC', 'IBM', '指纹授权系统', '102.200.132.14', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06737DR', 'v-max_console', 'Power 720 Express', 'IBM', 'EMC VMAX存储', '109.200.3.14', '192.168.1.11', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06738CR', 'nim_master', 'Power 720 Express', 'IBM', 'NBU', '109.200.3.183', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0674EBR', 'cipspmtsqz2', '8202-E4B', 'IBM', '人民币跨境支付系统', '102.200.163.106', '102.97.5.33', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06767CT', 'glap1', 'Power 750 Express', 'IBM', '总账系统', '102.200.129.45', '102.200.130.36,102.80.26.16', '433', '');
INSERT INTO `equipment_monitor` VALUES ('067B0CH', 'b2bweb1', 'p5 550', 'IBM', 'B2B网上支付系统', '108.201.1.28', '172.16.66.72', '422', '');
INSERT INTO `equipment_monitor` VALUES ('068239T', 'hxb1mapp1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.108', '172.16.128.210,192.168.254.167', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06823AT', 'hxb1mapp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.109', '172.16.128.211,192.168.254.168', '422', '');
INSERT INTO `equipment_monitor` VALUES ('068A7CH', 'beaijkap1', '9133-55A', 'IBM', 'BEAI系统', '102.200.132.38', '102.81.17.8', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('068A87H', 'beaijkap2', '9133-55A', 'IBM', 'BEAI系统', '102.200.132.39', '102.81.17.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691B8R', 'epayweb02', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.71', '172.16.64.21', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691BBR', 'cipspmtsqzby1', 'Power 720 Express', 'IBM', '人民币跨境支付系统', '102.200.163.107', '102.97.5.34', '434', '');
INSERT INTO `equipment_monitor` VALUES ('0691C2R', 'epayweb03', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.74', '172.16.66.20', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691C3R', 'epaysftp01', '8202-E4C', '', '华夏E商宝系统', '102.198.10.24', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691C4R', 'epaysftp02', '8202-E4C', '', '华夏E商宝系统', '102.198.10.25', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691CER', 'epayweb01', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.70', '172.16.64.20', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691CFR', 'epayweb04', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.75', '172.16.66.21', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0691D0R', 'cipspmtsqzby2', 'Power 720 Express', 'IBM', '人民币跨境支付系统', '102.200.163.108', '102.97.5.35', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06920FR', 'epaydb02', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.192.193', '10.1.5.2,192.168.254.193,172.16.132.24,172.16.132.22,169.254.171.63', '422', '');
INSERT INTO `equipment_monitor` VALUES ('069210R', 'epayapp03', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.78', '172.16.132.13,192.168.254.226', '422', '');
INSERT INTO `equipment_monitor` VALUES ('069211R', 'epaydb01', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.192.192', '10.1.5.1,192.168.254.192,172.16.132.25,172.16.132.23,172.16.132.21,169.254.124.17', '422', '');
INSERT INTO `equipment_monitor` VALUES ('069212T', 'szshwyweb1', '', '', '网上银行', '109.17.2.16', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069213T', 'szshwyweb4', '', '', '网上银行', '109.17.2.19', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069214T', 'hxbcif6', 'Power 750 Express', 'IBM', '网上银行系统', '109.200.6.60', '172.16.128.169', '10-11', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069215R', 'epayapp01', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.76', '172.16.132.11,192.168.254.224', '422', '');
INSERT INTO `equipment_monitor` VALUES ('069215T', 'hxb1web5', 'Power 750 Express', 'IBM', '网上银行系统', '109.200.6.47', '172.16.66.73', '10-12', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069216T', 'nbradb1', 'Power 750 Express', 'IBM', 'RA系统', '109.200.6.43', '172.16.128.196,192.16.128.196', '10-14', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069217T', 'cscifdb2', 'Power 750 Express', 'IBM', 'Call Center系统', '109.200.6.77', '', '10-14', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069218T', 'hxbcif5', 'Power 750 Express', 'IBM', '网上银行系统', '109.200.6.59', '172.16.128.168', '10-12', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069219R', 'epayapp02', 'Power 720 Express', 'IBM', '华夏E商宝系统', '108.201.1.77', '172.16.132.12,192.168.254.225', '422', '');
INSERT INTO `equipment_monitor` VALUES ('069219T', 'b2bweb1', 'Power 750 Express', 'IBM', 'B2B网上支付系统', '109.200.6.72', '172.16.66.71', '10-15', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06921AT', 'gtpm1', 'Power 750 Express', 'IBM', '文件传输系统', '109.200.6.4', '102.80.12.64', '10-15', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06921BT', 'epayweb03', 'Power 750 Express', 'IBM', '华夏E商宝系统', '109.200.6.110', '172.16.66.20', '10-11', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06953A5', 'zydd1', 'Power 550', 'IBM', '作业调度', '110.200.1.210', '110.200.203.13,192.200.203.13,110.200.3.11', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('06958B5', 'zydd2', 'Power 550', 'IBM', '作业调度', '110.200.1.211', '110.200.203.14,192.200.203.14', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('06979EP', 'zwrzgkydb1', 'Power 780', 'IBM', '指纹授权系统', '110.200.6.26', '102.81.5.32,192.81.5.34,169.254.101.52,102.81.5.34', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('0697A8P', 'beaiap04', 'Power 780', 'IBM', '灾备BEAI系统', '110.200.6.25', '102.81.4.35,192.81.3.35', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06989A6', 'sfrpdb1', 'Power 550', 'IBM', '第三方存管系统', '110.200.2.146', '102.96.4.27,192.96.4.29,169.254.147.218,102.96.4.31,102.96.4.29', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069B22P', 'hrweb2', 'Power 750 Express', 'IBM', '人力资源管理', '102.200.2.149', '102.129.11.13', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069B29P', 'hrdb1', 'Power 750 Express', 'IBM', '人力资源管理', '102.200.2.152', '102.129.11.31,192.129.11.33,169.254.44.92,102.129.11.33', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('069E1FH', 'czgrzxcx1', 'p5 550', 'IBM', '村镇个人征信查询', '102.200.2.23', '102.64.201.73,192.64.201.73', '421', '');
INSERT INTO `equipment_monitor` VALUES ('069E27H', 'czgrzxcx2', 'p5 550', 'IBM', '村镇个人征信查询', '102.200.2.24', '102.64.201.74,102.64.1.71,192.64.201.74', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06A15AH', 'cv-hxhf', 'p5 550', 'IBM', '数据恢复', '110.200.2.36', '110.161.1.11', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06A1E5G', 'b2bweb2', 'System p5 520 Express', 'IBM', 'B2B网上支付系统', '108.201.1.27', '172.16.66.71', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06A206G', '', '', '', '分行特色业务系统', '124.1.1.64', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06A283T', 'lctz2', 'Power 720 Express', 'IBM', '理财投资管理', '102.200.3.69', '102.64.32.10,192.64.32.11,169.254.208.37,102.64.32.12,102.64.32.11', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06A284T', 'gtpm1', 'Power 720 Express', 'IBM', '文件传输系统', '102.200.128.213', '102.80.212.66,102.80.12.64,192.80.212.66', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06A285T', 'lctz1', 'Power 720 Express', 'IBM', '理财投资管理', '102.200.3.68', '102.64.32.8,192.64.32.9,169.254.178.208,102.64.32.9', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06A287T', 'zfmmdb3', 'Power 720 Express', 'IBM', '支付密码系统', '102.200.129.119', '102.80.25.28,192.80.25.30,169.254.212.208,102.80.25.30', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06A2F56', 'sfrpdb2', 'Power 550', 'IBM', '第三方存管系统', '110.200.2.147', '102.96.4.28,192.96.4.30,169.254.57.32,102.96.4.30', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06A31B6', 'sfweb1', 'Power 550', 'IBM', '第三方存管系统', '110.200.2.140', '102.96.4.18', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06A3CDT', 'czwytap1', 'Power 740 Express', 'IBM', '', '', '172.16.133.12,192.168.253.16', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AAHM2', '', '', 'IBM', '', '137.1.1.242', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AANC1', '', '', 'IBM', '', '137.1.1.242', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AB285', '', '', '', '冠字号码查询系统', '124.1.1.63', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AM486', 'wxyhdb1', 'System x3850 X5 -[71435AO]-', 'IBM', '', '', '10.1.8.1,192.168.252.19,172.16.68.64,172.16.68.62,172.16.68.60,169.254.103.250', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AM493', 'wxyhdb2', 'System x3850 X5 -[71435AO]-', 'IBM', '', '', '10.1.8.2,192.168.252.20,172.16.68.63,172.16.68.61,169.254.109.94', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AW711', '', '', '', '网管系统', '124.192.1.2', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AWLXF', 'tjwxdb2', 'IBM System x3650 M4: -[79159B3]-', 'IBM', '', '', '10.1.8.6,192.168.252.22,172.16.68.77,172.16.68.75,169.254.127.37', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AWLXG', 'tjwxdb1', 'IBM System x3650 M4: -[79159B3]-', 'IBM', '', '', '10.1.8.5,192.168.252.21,172.16.68.78,172.16.68.76,172.16.68.74,169.254.95.120,169.254.140.184', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06AX917', '', '', '', '网管系统', '124.192.1.2', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06B1BA5', 'sfweb2', 'Power 550', 'IBM', '第三方存管系统', '110.200.2.141', '102.96.4.19', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06B1BB5', 'beaiwl2', 'Power 550', 'IBM', '支付融资/财税库行/银关通外联前置', '102.200.2.51', '108.201.204.99,192.201.204.99,192.168.18.101,108.201.4.97', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06B1BC5', 'cataapp3', 'Power 550', 'IBM', '支付融资系统', '102.200.3.200', '102.200.2.52', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06B1BE5', 'hxcatadb1', 'Power 550', 'IBM', '支付融资系统', '102.200.2.54', '108.201.4.11,192.201.4.13,108.201.4.13', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06B1BF5', 'hxcatadb2', 'Power 550', 'IBM', '支付融资系统', '102.200.2.55', '108.201.4.12,192.201.4.14,108.201.4.14', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06B1C35', 'hxcataapp2', 'Power 550', 'IBM', '支付融资系统', '102.200.2.53', '108.201.4.193', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06B1D55', 'beaiwl1', 'Power 550', 'IBM', '支付融资/财税库行/银关通外联前置', '102.200.2.50', '108.201.204.98,192.201.204.98,192.168.18.100', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06B48EP', 'esbdb1', 'Power 750 Express', 'IBM', '前置B系统', '102.200.129.10', '102.81.1.18,169.254.187.192,102.81.201.18,102.81.1.24,102.81.1.20', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06B490P', 'esbdb2', 'Power 750 Express', 'IBM', '前置B系统', '102.200.129.11', '102.81.1.19,169.254.81.78,102.81.201.19,102.81.1.21', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06B81AR', 'grzxcx2', 'Power 740 Express', 'IBM', '个人征信查询', '102.200.3.65', '102.198.204.35,102.198.4.32,192.198.204.35', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA646', 'pcrmmfb', 'System x3850 X5 -[714386T]-', 'IBM', '个人CRM系统', '102.200.160.82', '102.96.5.36,192.96.5.38,169.254.95.120,169.254.251.66,102.96.5.38', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA647', 'pcrmmfa', 'System x3850 X5 -[714386T]-', 'IBM', '个人CRM系统', '102.200.160.81', '102.96.5.35,102.96.5.39,192.96.5.37,169.254.95.120,169.254.20.168,102.96.5.37', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA648', 'pcmmdmdb2', 'System x3850 X5 -[714386T]-', 'IBM', '', '', '10.1.8.14,192.168.252.26,172.16.71.27,172.16.71.25,169.254.95.120,169.254.172.130', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA649', 'pcmmdmdb1', 'System x3850 X5 -[714386T]-', 'IBM', '', '', '10.1.8.13,192.168.252.25,172.16.71.28,172.16.71.26,172.16.71.24,169.254.95.120,169.254.131.104', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA654', 'vmware62', 'System x3850 X5 -[714388T]-', 'IBM', '虚拟化', '102.200.135.69', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA655', 'vmware55', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.62', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA656', 'vmware58', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.65', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA657', 'brpm02', 'System x3850 X5 -[714388T]-', 'IBM', '自动化项目', '102.200.129.102', '102.200.130.45,102.80.24.24', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA658', 'vmware54', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.61', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA659', 'vmware59', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.66', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA660', 'vmware57', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.64', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA661', 'vmware56', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.63', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA662', 'vmware61', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.68', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BA663', 'vmware60', 'System x3850 X5 -[714388T]-', 'IBM', '', '102.200.135.67', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BDB6R', 'bancs02', 'Power 780', 'IBM', '灾备核心系统', '110.200.6.17', '102.81.2.19,102.81.2.17,102.81.2.22,192.81.3.17,192.81.2.19,169.254.148.19,102.81.3.17', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BDBAR', 'bancs01', 'Power 780', 'IBM', '灾备核心系统', '110.200.6.16', '102.81.2.16,192.81.3.16,192.81.2.18,169.254.224.145,102.81.3.16,102.81.2.18', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BEAZT', '', '', '', '生产网防病毒系统', '124.1.192.16', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BERCM', '', '', '', '影像培训环境1', '124.1.192.52', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BERDA', '', '', '', '影像培训环境2', '124.1.192.53', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BEROA', '', '', '', '自助回单柜打印系统', '124.1.1.67', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF5A6', 'czqzdb2', 'Power 550', 'IBM', '村镇前置A', '102.200.3.47', '102.64.1.149,192.64.1.151,169.254.229.150,102.64.1.151', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF5E6', 'czzhqztx1', 'Power 550', 'IBM', '村镇前置A', '102.200.3.44', '102.64.1.144,192.64.201.146,102.64.201.146', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF5F6', 'czzhqzap2', 'Power 550', 'IBM', '村镇前置A', '102.200.3.49', '102.64.1.155', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF616', 'czqzdb1', 'Power 550', 'IBM', '村镇前置A', '102.200.3.46', '102.64.1.148,192.64.1.150,169.254.156.43,102.64.1.152,102.64.1.150', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF626', 'czzhqztx2', 'Power 550', 'IBM', '村镇前置A', '102.200.3.45', '102.64.201.147,192.64.201.147', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF636', 'czzhqzap1', 'Power 550', 'IBM', '村镇前置A', '102.200.3.48', '102.64.1.154', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF899', 'vmware63', 'System x3850 X5 -[714375P]-', 'IBM', '', '102.200.135.70', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BF901', 'sjyhtsapp2', 'System x3850 X5', '', '手机银行系统', '108.201.67.19', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH404', 'armsap2', 'System x3850 X5 -[71437V6]-', 'IBM', '影像流系统', '102.200.160.92', '102.97.2.41', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH405', 'nbgldb1', 'System x3850 X5 -[71437V6]-', 'IBM', '影像流系统', '102.200.160.131', '102.97.2.106,102.97.2.110,192.97.2.108,169.254.23.189,102.97.2.108', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH406', 'guidangap2', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.114', '102.97.2.65', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH413', 'nbgl2', 'System x3850 X5 -[71437V6]-', 'IBM', '影像流系统', '102.200.160.90', '102.97.2.39', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH416', 'armsap1', 'System x3850 X5 -[71437V6]-', 'IBM', '影像流系统', '102.200.160.91', '102.97.2.40', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH419', 'absap3', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.105', '102.97.2.56', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH422', 'absap2', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.104', '102.97.2.55', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH425', 'absap14', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '110.200.2.135', '110.190.1.21', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH426', 'absap13', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '110.200.2.134', '110.190.1.20', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH427', 'absap9', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '110.200.2.130', '110.190.1.16', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH428', 'absap10', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '110.200.2.131', '110.190.1.17', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH429', 'nbgl1', 'System x3850 X5 -[71437V6]-', 'IBM', '影像流系统', '102.200.160.89', '102.97.2.38', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH432', 'absap6', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.108', '102.97.2.59', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH434', 'absap4', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.106', '102.97.2.57', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH437', 'absap5', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.107', '102.97.2.58', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH440', 'absap8', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.110', '102.97.2.61', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH441', 'absap7', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.109', '102.97.2.60', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH443', 'absap1', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.103', '102.97.2.54', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BH448', 'absap12', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '110.200.2.133', '110.190.1.19', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH450', 'absap11', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '110.200.2.132', '110.190.1.18', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BH452', 'guidangap1', 'System x3850 X5 -[71437V5]-', 'IBM', '影像流系统', '102.200.160.113', '102.97.2.64', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06BWPGN', '', '', '', '影像传输与缓存', '124.1.1.78', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BWPGT', '', '', '', '影像切割', '124.1.1.86', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BWPGV', '', '', '', '影像切割', '124.1.1.83', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BWPGW', '', '', '', '批量验印', '124.1.192.50', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BWPGX', '', '', '', '批量验印', '124.1.192.51', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06BWPHB', '', '', '', '影像传输与缓存', '124.1.1.79', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C125R', 'grzxcx1', 'Power 740 Express', 'IBM', '个人征信查询', '102.200.3.64', '102.198.204.34,192.198.204.34', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C16BT', 'sfdb1', 'Power 740 Express', 'IBM', '第三方存管系统', '102.200.160.64', '102.96.4.22,192.96.4.24,169.254.35.133,102.96.4.24', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C16CT', 'sfap1', 'Power 720 Express', 'IBM', '第三方存管系统', '102.200.160.58', '102.200.164.16,102.96.4.16', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C16DT', 'sfrpdb1', 'Power 720 Express', 'IBM', '第三方存管系统', '102.200.160.66', '102.96.4.27,192.96.4.29,169.254.36.19,102.96.4.29', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C16FT', 'sfap2', 'Power 720 Express', 'IBM', '第三方存管系统', '102.200.160.59', '102.200.164.17,102.96.4.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C170T', 'sfweb1', 'Power 720 Express', 'IBM', '第三方存管系统', '102.200.160.60', '102.200.164.38,102.96.4.18', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C171T', 'sfrpdb2', 'Power 720 Express', 'IBM', '第三方存管系统', '102.200.160.67', '102.96.4.28,102.96.4.31,192.96.4.30,169.254.229.16,102.96.4.30', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C172T', 'sfdb2', 'Power 740 Express', 'IBM', '第三方存管系统', '102.200.160.65', '102.96.4.23,192.96.4.25,169.254.8.70,102.96.4.26,102.96.4.25', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C173T', 'sfweb2', 'Power 720 Express', 'IBM', '第三方存管系统', '102.200.160.61', '102.200.164.39,102.96.4.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C64FT', 'edzfdb2', 'Power 750 Express', 'IBM', '第二代支付', '110.200.6.37', '102.97.1.43,192.97.1.43', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C650T', 'edzfdb1', 'Power 750 Express', 'IBM', '第二代支付', '110.200.6.36', '102.97.1.42,192.97.1.42', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C656T', 'edzfap2', '9179-MHC', '', '第二代支付系统', '102.200.160.35', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C658T', 'edzfap1', '9179-MHC', '', '第二代支付系统', '102.200.160.34', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C8B6G', 'wbzf1', 'p5 550', 'IBM', '境内跨行外币支付', '110.200.1.133', '110.198.206.13,192.198.206.13', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C8D7R', 'hxbebatb1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.60', '172.16.128.159,192.168.254.211', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06C8DCG', 'wbzf2', 'p5 550', 'IBM', '境内跨行外币支付', '110.200.1.134', '110.198.206.14,192.198.206.14,110.198.6.11', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06C90FR', 'hxbhq1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.59', '172.16.128.153,192.168.254.210', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06C91AR', 'gjjsapp2', 'Power 740 Express', 'IBM', '国际结算系统', '102.200.2.191', '102.64.28.11', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06C928R', 'hxb1papp1', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.104', '172.16.128.206,192.168.254.163', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06C943R', 'nbu2', 'Power 720 Express', 'IBM', '数据备份系统', '102.200.2.236', '192.200.2.236', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06C966R', 'hxb1papp2', 'Power 740 Express', 'IBM', '网上银行系统', '108.201.1.105', '172.16.128.207,192.168.254.164', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06C96CR', 'nbu1', 'Power 720 Express', 'IBM', '数据备份系统', '102.200.2.239', '192.200.2.235', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06C975R', 'gjjsapp1', 'Power 740 Express', 'IBM', '国际结算系统', '102.200.2.190', '102.64.28.10', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06CA72T', 'nbuhf134', '8408-E8D', 'IBM', '数据恢复', '102.200.3.134', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06CA73T', 'nbuhf135', '8408-E8D', 'IBM', '数据恢复', '102.200.3.135', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06CBCCT', 'tms2', 'Power 720 Express', 'IBM', 'TMS项目', '102.200.3.111', '102.64.214.73,192.64.214.73', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06CBCDT', 'tms1', 'Power 720 Express', 'IBM', 'TMS项目', '102.200.3.110', '102.64.214.72,102.64.14.70,192.64.214.72', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06CC47R', 'nbdb4', 'Power 750 Express', 'IBM', '', '', '10.1.6.2,192.168.254.191,172.16.128.164,172.16.128.162,169.254.81.77', '', '');
INSERT INTO `equipment_monitor` VALUES ('06CC4AR', 'nbdb3', 'Power 750 Express', 'IBM', '', '', '10.1.6.1,192.168.254.190,172.16.128.167,172.16.128.163,172.16.128.161,169.254.162.78', '', '');
INSERT INTO `equipment_monitor` VALUES ('06CDBB5', 'dxrepapp2', 'Power 550', 'IBM', '村镇数据抽取与报表', '102.200.2.12', '102.64.201.14,102.64.1.11,192.64.201.14', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06CDBF5', 'dxrepapp1', 'Power 550', 'IBM', '村镇数据抽取与报表', '102.200.2.11', '102.64.201.13,192.64.201.13', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06CDD45', 'dxrepdb1', 'Power 550', 'IBM', '村镇数据抽取与报表', '102.200.2.13', '102.64.201.23,192.64.201.23', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06CDD85', 'dxrepdb2', 'Power 550', 'IBM', '村镇数据抽取与报表', '102.200.2.14', '102.64.201.24,102.64.1.21,192.64.201.24', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06D058R', 'khfxtjbs2', 'Power 740 Express', 'IBM', '新版客户风险统计报送', '102.200.3.51', '102.64.29.17,192.64.29.19,169.254.248.1,102.64.29.19', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D05BR', 'hxccag2', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.128.179', '102.80.219.11,102.80.19.8,192.80.219.11', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06D05CR', 'gdhs1', 'Power 720 Express', 'IBM', '个贷核算和公积金系统', '102.200.128.76', '102.80.205.9,192.80.205.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D060R', 'hxccag1', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.128.178', '102.80.219.10,192.80.219.10', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06D061R', 'gdhs2', 'Power 720 Express', 'IBM', '个贷核算和公积金系统', '102.200.128.77', '102.80.205.10,192.80.205.10', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D062R', 'khfxtjbs1', 'Power 740 Express', 'IBM', '客户风险统计报送', '102.200.3.50', '102.64.29.16,102.64.29.20,192.64.29.18,169.254.125.62,102.64.29.18', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D1B6T', 'hxcataapp2', '8205-E6D', 'IBM', '支付融资系统', '102.200.3.205', '108.201.4.19,192.201.4.19', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06D1B7T', 'hxcataapp1', '8205-E6D', 'IBM', '支付融资系统', '102.200.3.204', '108.201.4.18,192.201.4.18', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06D245R', '', '', '', '分行特色业务系统', '124.1.192.24', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D24AR', '', '', '', '分行特色业务系统', '124.1.192.23', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D385G', 'czxdimg1', 'p5 550', 'IBM', '村镇信贷管理', '102.200.2.72', '102.64.201.164,192.64.201.164', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D38EG', 'czxdimg2', 'p5 550', 'IBM', '村镇信贷管理', '102.200.2.73', '102.64.1.162,192.64.201.165,102.64.201.165', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D3C9R', 'zhqzap4', 'Power 750 Express', 'IBM', '前置A系统', '102.200.132.31', '110.121.1.138', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D3CDR', 'zhqzap3', 'Power 750 Express', 'IBM', '前置A系统', '102.200.132.30', '110.121.1.137', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D3FAR', 'zhqzdb1', 'Power 750 Express', 'IBM', '前置A系统', '102.200.132.32', '110.121.1.141,110.121.1.145,192.121.201.143,169.254.27.125,110.121.1.143', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D3FBR', 'topsdb1', 'Power 750 Express', 'IBM', '自助设备前置', '110.200.6.103', '102.64.13.21,192.64.213.23,169.254.254.143,102.64.13.25,102.64.13.23', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D401R', 'ebpsap2', 'Power 750 Express', 'IBM', '网上支付跨行清算外联通讯网关', '110.200.2.155', '102.97.4.17', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D403R', 'zhqztx1', 'Power 750 Express', 'IBM', '前置A系统', '102.200.132.26', '110.121.201.133,192.121.201.133', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D406R', 'shzfmm2', 'Power 750 Express', 'IBM', '支付密码系统', '110.200.2.115', '110.120.2.13,192.120.2.13', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D409R', 'zhqzdb2', 'Power 750 Express', 'IBM', '前置A系统', '102.200.132.33', '110.121.1.142,192.121.201.144,169.254.90.203,110.121.1.144', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D40DR', 'zhqztx2', 'Power 750 Express', 'IBM', '前置A系统', '102.200.132.27', '110.121.201.134,110.121.1.131,192.121.201.134', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D40FR', 'shzfmm1', 'Power 750 Express', 'IBM', '支付密码系统', '110.200.2.114', '110.120.2.10,192.120.2.12,110.120.2.14,110.120.2.12,110.120.2.11', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D47ET', 'zzzf2', 'Power 750 Express', 'IBM', 'TPOS/转账支付', '102.200.129.50', '102.80.227.19,102.80.27.16,192.80.227.19', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06D89DT', 'hxsmsdb1', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.44', '102.96.3.16,192.96.3.18,169.254.63.41,102.96.3.18', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D89FT', 'hxsmsdb2', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.45', '102.96.3.17,192.96.3.19,169.254.71.240,102.96.3.20,102.96.3.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D8A0T', 'hxsmsby1', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.50', '102.96.3.28', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D8A1T', 'hxsmsby2', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.51', '102.96.3.29', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D8AAT', 'hxsmsapp2', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.47', '102.96.3.23', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D8ABT', 'hxsmsfile1', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.48', '102.96.203.26,192.96.203.26', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D8ACT', 'hxsmsapp1', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.46', '102.96.3.22', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06D8ADT', 'hxsmsfile2', 'Power 720 Express', 'IBM', '短信平台系统', '102.200.160.49', '102.96.203.27,192.96.203.27,102.96.3.24', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06DAF5R', 'sjgd2', 'Power 720 Express', 'IBM', '数据归档系统', '102.200.128.117', '102.80.11.21,169.254.10.187,102.80.211.23,102.80.11.23', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06DEPGW', '', '', '', '青岛同城票交（影像）', '124.1.192.47', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06DEPHX', '', '', '', '日照同城票交（影像）', '124.1.192.49', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06DEPLC', '', '', '', '日照同城票交（影像）', '124.1.192.48', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06DERXL', '', '', '', '青岛同城票交（影像）', '124.1.192.46', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E0E9P', 'nbraap1', '8202-E4B', 'IBM', 'RA系统', '108.201.192.220', '172.16.128.193,192.168.254.220', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06E0EFP', 'sjzb1', '8202-E4B', 'IBM', '数据准备系统', '102.200.2.127', '102.64.15.30', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E0F0P', 'hxkjkap1', '8202-E4B', 'IBM', '华夏卡集中监控系统', '102.200.2.208', '102.200.7.49,102.64.14.50', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06E0F4P', '', '', '', '南京分行综合管理信息系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E0F9P', '', '', '', '南京分行综合管理信息系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E0FAP', 'hxkjkdb1', '8202-E4B', 'IBM', '集中银联前置系统', '102.200.2.210', '102.64.14.59,192.64.14.62,169.254.90.132,102.64.14.62,102.64.14.60', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06E0FEP', 'ylqzjk1', '8202-E4B', 'IBM', '集中银联前置系统', '102.200.2.123', '102.200.7.36,192.64.214.23,102.64.214.23', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E100P', 'ickms2', '8202-E4B', 'IBM', '金融IC卡密钥管理', '102.200.2.207', '102.64.15.41', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E10DP', 'sjzb2', '8202-E4B', 'IBM', '数据准备系统', '102.200.2.128', '102.64.15.31', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E110P', 'hxkjkap2', '8202-E4B', 'IBM', '华夏卡集中监控系统', '102.200.2.209', '102.200.7.50,102.64.14.51', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06E11FP', 'ylqzjk2', '8202-E4B', 'IBM', '集中银联前置系统', '102.200.2.124', '102.200.7.37,102.64.14.21,192.64.214.24,102.64.214.24', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E120P', 'topsap1', '8202-E4B', 'IBM', '集中式自助设备前置系统', '102.200.2.93', '102.200.7.32,102.64.13.15', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E122P', 'topsap2', '8202-E4B', 'IBM', '集中式自助设备前置系统', '102.200.2.94', '102.200.7.33,102.64.13.12', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E123P', 'nbraap2', '8202-E4B', 'IBM', 'RA系统', '108.201.192.221', '172.16.128.194,192.168.254.221', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06E124P', 'topsap3', '8202-E4B', 'IBM', '集中式自助设备前置系统', '102.200.2.95', '102.200.7.34,102.64.13.13', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E126P', 'topsap4', '8202-E4B', 'IBM', '集中式自助设备前置系统', '102.200.2.96', '102.200.7.35,102.64.13.14', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06E36D4', 'kjys2', 'Power 550', 'IBM', '会计要素管理', '102.200.2.31', '102.64.202.14', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06E3824', 'kjys1', 'Power 550', 'IBM', '会计要素管理', '102.200.2.30', '102.64.202.13,192.64.202.13', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06EB33T', 'pcrmodb2', '8205-E6D', 'IBM', '个人CRM系统', '102.200.160.72', '102.200.164.23,192.96.5.21,169.254.6.129,102.96.5.22,102.96.5.21,102.96.5.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB34T', 'pcrmodb1', '8205-E6D', 'IBM', '个人CRM系统', '102.200.160.71', '102.200.164.22,192.96.5.20,169.254.254.177,102.96.5.20,102.96.5.18', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB37T', 'pmtsqzby2', '', '', '第二代支付系统', '102.200.160.57', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB3BT', 'pmtsqzby1', '', '', '第二代支付系统', '102.200.160.56', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB3DT', 'pcrmapp1', 'Power 720 Express', 'IBM', '个人CRM系统', '102.200.160.69', '102.200.164.20,102.96.5.16', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB3ET', 'hjdb1', 'Power 720 Express', 'IBM', '黄金买卖系统', '102.200.192.69', '102.101.3.64,102.101.3.68,192.101.3.66,169.254.109.227,102.101.3.66', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB3FT', 'hjdb2', 'Power 720 Express', 'IBM', '黄金买卖系统', '102.200.192.70', '102.101.3.65,192.101.3.67,169.254.231.204,102.101.3.67', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB40T', 'xykhlqsap2', 'Power 720 Express', 'IBM', '信用卡互联与清算', '102.200.160.176', '102.96.9.17,192.96.9.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06EB42T', 'xykhlqsap1', 'Power 720 Express', 'IBM', '信用卡互联与清算', '102.200.160.175', '102.96.9.16,192.96.9.16', '434', '');
INSERT INTO `equipment_monitor` VALUES ('06EB43T', 'pcrmapp2', 'Power 720 Express', 'IBM', '个人CRM系统', '102.200.160.70', '102.200.164.21,102.96.5.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB93T', 'pcrmedb2', '8408-E8D', 'IBM', '个人CRM系统', '102.200.160.74', '102.200.164.19,192.96.5.26,169.254.203.37,102.96.5.27,102.96.5.26,102.96.5.24', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EB94T', 'pcrmedb1', '8408-E8D', 'IBM', '个人CRM系统', '102.200.160.73', '102.200.164.18,192.96.5.25,169.254.159.74,102.96.5.25,102.96.5.23', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06ED4E4', 'wmsweb2', 'Power 550', 'IBM', '财富管理', '102.200.2.40', '102.64.5.12', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06ED514', 'wmsweb1', 'Power 550', 'IBM', '财富管理', '102.64.5.11', '102.200.2.39', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06ED524', 'wmsbat2', 'Power 550', 'IBM', '财富管理', '102.200.2.42', '102.64.205.24,192.64.205.24', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06ED534', 'wmsdb1', 'Power 550', 'IBM', '', '102.64.5.43', '102.200.2.45,192.64.5.43,102.64.5.41', '', '');
INSERT INTO `equipment_monitor` VALUES ('06ED554', 'wmsbat1', 'Power 550', 'IBM', '财富管理', '102.64.5.21', '102.200.2.41,192.64.205.23,102.64.205.23', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06ED584', 'wmsrpt2', 'Power 550', 'IBM', '财富管理', '102.64.5.31', '102.200.2.44,192.64.205.34,102.64.205.34', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06ED5D4', 'wmsrpt1', 'Power 550', 'IBM', '财富管理', '102.200.2.43', '102.64.205.33,192.64.205.33', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06ED5F4', 'wmsdb2', 'Power 550', 'IBM', '财富管理', '102.200.2.46', '102.64.5.42,192.64.5.44,102.64.5.44', '422', '');
INSERT INTO `equipment_monitor` VALUES ('06EDFCT', 'icmappap1', 'Power 720 Express', 'IBM', '金融IC卡多应用', '102.200.3.114', '102.64.15.72', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EDFET', 'icmappap2', 'Power 720 Express', 'IBM', '金融IC卡多应用', '102.200.3.115', '102.64.15.73', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE01T', 'icmappby1', 'Power 720 Express', 'IBM', '金融IC卡多应用', '102.200.3.116', '102.64.15.74', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE02T', 'icmappby2', 'Power 720 Express', 'IBM', '金融IC卡多应用', '102.200.3.117', '102.64.15.75', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE2CR', 'fundap1', 'Power 750 Express', 'IBM', '基金系统', '109.200.8.125', '102.96.7.18', '2-4', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE2ER', 'sfweb', 'Power 750 Express', 'IBM', '第三方存管系统', '109.200.8.5', '102.96.4.18', '2-4', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE30R', 'bancs04', 'Power 780', 'IBM', '核心高可用', '109.200.8.29', '102.81.2.21,172.16.2.29', '4-6', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE31R', 'nbdb4', 'Power 750 Express', 'IBM', '网上银行系统', '109.200.6.54', '172.16.128.164,172.16.128.162,169.254.49.167,10.1.21.2', '2-6', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE32R', 'yddzxj1', 'Power 750 Express', 'IBM', '金融IC卡业务系统', '109.200.8.110', '102.64.15.10', '2-6', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE36R', 'edzfdb1', 'Power 750 Express', 'IBM', '二代支付系统', '109.200.8.200', '102.97.1.44,192.97.1.42,102.97.1.42,102.97.1.40,169.254.151.51', '2-5', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE38R', 'vmax', 'Power 780', 'IBM', 'EMC VMAX存储', '109.200.5.242', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE39R', 'bancs02', 'Power 780', 'IBM', '核心高可用', '109.200.8.27', '172.16.2.27,192.168.2.27,102.81.2.19', '4-3', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE3AR', 'nbusjhf', 'Power 750 Express', 'IBM', 'NBU', '109.200.5.232', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE3CR', 'zjywdb2', 'Power 750 Express', 'IBM', '资金业务系统', '109.200.3.110', '102.96.8.21,102.96.8.22,102.96.8.19,192.96.8.21,169.254.237.70', '2-7', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE3ER', 'zjywdb1', 'Power 750 Express', 'IBM', '资金业务系统', '109.200.3.109', '102.96.8.18,169.254.53.167,192.96.8.20,102.96.8.20', '2-7', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE3FR', 'epayweb02', 'Power 750 Express', 'IBM', '华夏E商宝系统', '109.200.6.109', '172.16.64.21', '2-11', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE40R', 'hjdb2', 'Power 750 Express', 'IBM', '黄金买卖系统', '109.200.8.236', '192.101.3.67,102.101.3.67,102.101.3.65,169.254.205.130', '2-5', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE41R', 'ydqz1ap4', 'Power 780', 'IBM', '综合前置系统', '109.200.7.25', '110.121.1.138', '6-10', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE43R', 'zfmmsrv1', 'Power 750 Express', 'IBM', '支付密码系统', '109.200.3.97', '192.80.25.22,102.80.25.22', '2-3', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE44R', 'zwrzgkydb2', 'Power 750 Express', 'IBM', '指纹授权系统', '109.200.3.154', '102.81.5.35,192.81.5.35', '2-3', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE45R', 'ydylqzap2', 'Power 750 Express', 'IBM', '银联前置系统', '109.200.8.100', '102.64.14.12', '2-2', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE46R', 'ydqz1ap1', 'Power 780', 'IBM', '综合前置系统', '109.200.7.22', '110.121.1.135', '6-9', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE48R', 'ylqzdb1', 'Power 750 Express', 'IBM', '银联前置系统', '109.200.8.96', '169.254.220.92,102.64.14.35,192.64.14.33,102.64.14.31,102.64.14.33', '2-2', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EE4CR', 'hxb2eapp2', 'Power 750 Express', 'IBM', '网上银行系统', '109.200.6.52', '172.16.128.188', '2-11', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EF1AR', 'kfdb1', 'Power 740 Express', 'IBM', 'Call Center系统', '102.200.129.41', '102.80.19.20,192.80.19.20', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06EF22R', 'sjjrjr1', 'Power 740 Express', 'IBM', '手机银行系统', '108.201.67.8', '172.16.67.8', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EF28R', 'kfdb2', 'Power 740 Express', 'IBM', 'Call Center系统', '102.200.129.42', '102.80.19.21,192.80.19.21', '433', '');
INSERT INTO `equipment_monitor` VALUES ('06EF38R', 'sjshjr1', 'Power 740 Express', 'IBM', '', '', '172.16.67.10', '', '');
INSERT INTO `equipment_monitor` VALUES ('06EH587', '', '', 'IBM', '', '137.1.1.51', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EH591', '', '', 'IBM', '', '137.1.1.52', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EH593', '', '', 'IBM', '', '137.1.1.50', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EH599', '', '', 'IBM', '', '137.1.1.53', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06ENBG5', '', '', '', '办公网桌面管控系统', '124.1.192.20', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06ENBH6', '', '', '', '生产网桌面管控系统', '124.1.192.19', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06ENBL9', '', '', '', '互联网桌面管控系统', '192.168.18.5', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNE5', 'portalweb02', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.26', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNE6', 'portalweb03', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.27', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNE7', 'portalweb04', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.28', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNE8', 'portal07', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.29', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNE9', 'portal08', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.30', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF0', 'portal01', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.17', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF1', 'portal02', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.18', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF3', 'portal04', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.20', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF4', 'portal05', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.21', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF5', 'portal06', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.22', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF6', 'portalsrv01', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.23', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF7', 'portalsrv02', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.24', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EPNF8', 'portalweb01', '-[8737INC]-', 'IBM', '综合信息管理系统', '102.144.3.25', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EWM96', 'DCMS-AUTH-2', '', '', '信贷管理系统', '102.200.128.220', '110.17.1.41', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06EWN75', 'DCMS-AUTH-1', '', '', '信贷管理系统', '102.200.128.219', '110.17.1.41', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F0FFP', 'topsdb1', 'Power 740 Express', 'IBM', '集中式自助设备前置系统', '102.200.2.97', '102.64.13.23,102.64.13.21,192.64.13.23,169.254.80.240,102.64.13.25', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F100P', 'dzxj2', 'Power 740 Express', 'IBM', '金融IC卡系统', '102.200.2.203', '102.64.15.11', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06F101P', 'topsdb2', 'Power 740 Express', 'IBM', '集中式自助设备前置系统', '102.200.2.98', '102.64.13.24,192.64.13.24,169.254.200.88,102.64.13.26', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F103P', 'dzxj1', 'Power 740 Express', 'IBM', '金融IC卡系统', '102.200.2.202', '102.64.15.10', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06F1559', 'x3850-22', 'System x3850 X5 -[7143XEN]-', 'IBM', 'VMware', '109.200.5.22', '10.1.1.22', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F1561', 'x3850-01', 'System x3850 X5 -[7143XEN]-', 'IBM', 'VMware', '109.200.5.251', '10.1.1.251', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F1562', 'x3850-21', 'System x3850 X5 -[7143XEN]-', 'IBM', 'VMware', '109.200.5.21', '10.1.1.21', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F1565', 'itmnetsms1', 'System x3850 X5 -[7143XEN]-', 'IBM', 'ITM监控', '109.200.3.4', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F22C4', 'sjhf7184', 'Power 550', 'IBM', '数据恢复', '102.200.192.184', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F703P', 'ylqzdb1', 'Power 750 Express', 'IBM', '集中银联前置系统', '102.200.2.125', '102.64.14.33,192.64.14.33,169.254.76.205,102.64.14.35', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F705P', 'ylqzap3', 'P7 750', 'IBM', '集中银联前置系统', '102.64.14.13', '', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F708P', 'dzxjdb1', 'Power 750 Express', 'IBM', '金融IC卡系统', '102.200.2.204', '102.64.15.20,192.64.15.22,169.254.231.130,102.64.15.24,102.64.15.22', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06F71CP', 'dzxjdb2', 'Power 750 Express', 'IBM', '金融IC卡系统', '102.200.2.205', '102.64.15.21,192.64.15.23,169.254.203.93,102.64.15.23', '421', '');
INSERT INTO `equipment_monitor` VALUES ('06F71DP', 'ylqzap1', 'Power 750 Express', 'IBM', '集中银联前置系统', '102.200.2.121', '102.64.14.11', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F722P', 'ylqzdb2', 'Power 750 Express', 'IBM', '集中银联前置系统', '102.200.2.126', '102.64.14.31,192.64.14.34,169.254.183.105,102.64.14.36,102.64.14.34', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F728P', 'ebpsap1', 'Power 750 Express', 'IBM', '网上支付跨行清算外联通讯网关', '110.200.2.154', '102.97.4.16', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06F72AP', 'ylqzap2', 'Power 750 Express', 'IBM', '集中银联前置系统', '102.200.2.122', '102.64.14.12', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06FBF6R', 'czdcmsap2', 'Power 740 Express', 'IBM', '村镇信贷管理', '102.200.3.107', '102.64.1.171', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06FFDC4', 'sjhf7183', 'Power 550', 'IBM', '数据恢复', '102.200.192.183', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06FLD63', '', '', '', '内部管理系统', '116.40.1.24', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06GPWR0', '', '', '', '电子同城票据交换系统', '116.160.1.89', '', '', '测试');
INSERT INTO `equipment_monitor` VALUES ('06GRCB9', '', '', '', '电子同城票据交换系统', '116.40.1.64', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('06H6150', '', '', 'IBM', '', '137.1.1.214', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06HKKL6', '', '', '', '电子同城票据交换系统', '116.40.1.63', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06K6170', 'archive-host2', 'System x3850 X5 -[7143S7H]-', 'IBM', '数据归档系统', '102.200.128.137', '102.80.11.9', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06kmdz1', '', '', '', '分行办公自动化系统', '192.168.254.9', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('06knzt6', '', '', '', '客户经理绩效管理系统', '116.40.1.23', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06knzt8', '', '', '', '客户经理绩效管理系统', '116.40.1.46', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('06knzt9', '', '', '', '网管平台主机', '116.192.1.3', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('06knzv1', '', '', '', '网管平台主机', '116.192.1.2', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06KNZWS', '', '', '', '无', '116.40.1.59', '', '', '测试');
INSERT INTO `equipment_monitor` VALUES ('06KZAA0', 'czwyweb2', 'System x3650 M4 -[7915OOG]-', 'IBM', '', '', '169.254.95.120,172.16.64.81', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06KZAA1', 'zj-emczc-1', 'System x3650 M4 -[7915OOG]-', 'IBM', '数据备份系统', '102.200.128.94', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06L3241', 'vmware25', 'System x3850 X5 -[7143TUA]-', 'IBM', '', '102.200.135.32', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06L3242', 'ZJBSK03', '', '', '柜面系统', '102.81.12.18', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06L3246', 'vmware16', 'System x3850 X5 -[7143TUA]-', 'IBM', '虚拟化', '102.200.135.23', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06L3247', 'ZJBSK02', '', '', '柜面系统', '102.81.12.17', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06L3255', 'ZJBSK04', '', '', '柜面系统', '102.81.12.19', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06L3256', 'vmware22', 'System x3850 X5 -[7143TUA]-', 'IBM', '虚拟化', '102.200.135.29', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06LGTE3', '', '', '', '电子同城票据交换系统', '116.40.1.62', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06M6000', 'vmware41', 'System x3850 X5 -[7143T4U]-', 'IBM', '', '102.200.135.48', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M6565', 'ydrm6', 'System x3850 X5 -[7143TOH]-', 'IBM', 'ITM监控', '109.200.5.196', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M6593', 'x3850-29', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.29', '10.1.1.29', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M6595', 'x3850-27', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.27', '10.1.1.27', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8815', 'zctgkfptwx1', 'System x3850 X5 -[7143TNH]-', 'IBM', '资产托管客服电子化平台', '109.200.8.63', '102.101.14.20', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8817', 'dzgzjy2', 'System x3850 X5 -[7143TNH]-', 'IBM', '电子国债', '109.200.8.49', '102.96.15.19', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8818', 'x3850-03', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.3', '10.1.1.3', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8819', 'x3850-06', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.6', '10.1.1.6', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8820', 'x3850-08', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.8', '10.1.1.8', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8821', 'x3850-12', '-[7143TNH]-', 'IBM', 'VMware', '109.200.5.12', '10.1.1.12', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8824', 'hjnwtx2', 'System x3850 X5 -[7143TNH]-', 'IBM', '黄金交易', '109.200.8.231', '102.101.3.17', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8825', 'x3850-07', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.7', '10.1.1.7', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8826', 'omnibus2', 'System x3850 X5 -[7143TNH]-', 'IBM', 'ITM监控', '109.200.3.8', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8827', 'x3850-11', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.11', '10.1.1.11', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8828', 'x3850-13', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.13', '10.1.1.13', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8830', 'itm-screen-7', 'System x3850 X5 -[7143TNH]-', 'IBM', 'ITM监控', '109.200.3.228', '192.168.122.1', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8831', 'itm-screen-1', 'System x3850 X5 -[7143TNH]-', 'IBM', 'ITM监控', '109.200.3.222', '192.168.122.1', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8832', 'ydhub1', 'System x3850 X5 -[7143TNH]-', 'IBM', 'ITM监控', '109.200.5.189', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8833', 'x3850-16', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.16', '10.1.1.16', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8834', 'x3850-28', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.28', '10.1.1.28', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8835', 'x3850-02', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.2', '10.1.1.2', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8836', 'x3850-25', 'System x3850 X5 -[7143TNH]-', 'IBM', 'VMware', '109.200.5.25', '10.1.1.25', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8837', 'oceanstordj01', '-[7143TPH]-', 'IBM', '华为存储', '109.200.3.149', '109.200.3.148', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8839', 'x3850-51', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.51', '192.200.5.51', '102', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8840', 'x3850-34', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.34', '10.1.1.34', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8842', 'flspjxtdb2', 'System x3850 X5 -[7143TPH]-', 'IBM', '非零售内评', '109.200.3.206', '102.101.8.40,102.101.8.41,169.254.253.138,102.101.8.38,192.101.8.40', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8843', 'hjfk1', 'System x3850 X5 -[7143TPH]-', 'IBM', '黄金交易', '109.200.8.232', '102.101.3.20', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8844', 'x3850-39', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.39', '', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8845', 'x3850-31', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.31', '10.1.1.31', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8846', 'x3850-49', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.49', '192.200.5.49', '102', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8847', 'x3850-32', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.32', '10.1.1.32', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8848', 'lsclbb1', 'System x3850 X5 -[7143TPH]-', 'IBM', '零售内评', '109.200.3.143', '102.101.8.18', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8849', 'x3850-48', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.48', '192.200.5.48', '102', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8850', 'x3850-26', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.26', '10.1.1.26', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8852', 'hjjy2', 'System x3850 X5 -[7143TPH]-', 'IBM', '黄金交易', '109.200.8.229', '102.101.3.33', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8855', 'lspjxtdb1', 'System x3850 X5 -[7143TPH]-', 'IBM', '零售内评', '109.200.3.145', '192.101.8.34,102.101.8.32,169.254.141.33,102.101.8.34', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8858', 'x3850-30', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.30', '10.1.1.30', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8859', 'x3850-50', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.50', '192.200.5.50', '102', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8860', 'x3850-35', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.35', '10.1.1.35', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8861', 'x3850-43', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.43', '10.1.1.43', '102', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8863', 'fjtweb2', 'System x3850 X5 -[7143TPH]-', 'IBM', '门户网站', '109.200.5.72', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06M8864', 'x3850-33', 'System x3850 X5 -[7143TPH]-', 'IBM', 'VMware', '109.200.5.33', '10.1.1.33', '101', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06P7604', '', '', '', '客户经理绩效考核系统', '124.1.1.24', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06P7606', '', '', '', '客户经理绩效考核系统', '124.1.1.25', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06pgcw9', '', '', '', '外网终端服务器', '116.40.2.102', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('06PGHG1', 'czwyweb1', 'System x3650 M4 : -[7915O6H]-', 'IBM', '', '', '169.254.95.120,172.16.64.80', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4078', 'zfmmapp1', 'IBM 3850 x5', 'IBM', '支付密码系统', '102.200.129.127', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4087', 'zfmmapp2', '3850 x5', 'IBM', '支付密码系统', '102.200.129.128', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4094', 'vmware12', 'System x3850 X5 -[7143UYW]-', 'IBM', '虚拟化', '102.200.135.19', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4113', 'vmware10', 'System x3850 X5 -[7143UYW]-', 'IBM', '虚拟化', '102.200.135.17', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4119', 'vmware07', 'System x3850 X5 -[7143UYW]-', 'IBM', '虚拟化', '102.200.135.14', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4172', 'vmware09', 'System x3850 X5 -[7143UYW]-', 'IBM', '虚拟化', '102.200.135.16', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4180', 'vmware14', 'System x3850 X5 -[7143UYW]-', 'IBM', '', '102.200.135.21', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4183', 'vmware08', 'System x3850 X5 -[7143UYW]-', 'IBM', '虚拟化', '102.200.135.15', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06R4187', 'vmware13', 'System x3850 X5 -[7143UYW]-', 'IBM', '', '102.200.135.20', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06RF935', '', '', '', '文件传输系统', '32.17.224.37', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06TG554', '', '', 'IBM', '', '137.1.1.213', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06trec7', '', '', '', '业务网终端服务器主机', '116.40.2.101', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06tree2', '', '', '', '集中后督系统', '116.40.2.100', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06V2420', 'vmware38', 'System x3850 X5 -[7143VCV]-', 'IBM', '', '102.200.135.45', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06V2421', 'vmware37', 'System x3850 X5 -[7143VCV]-', 'IBM', '', '102.200.135.44', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06WBEL1', 'hxsmsjk', 'X3650 M4', 'IBM', '短信平台系统', '102.200.160.52', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06WBEL4', 'vmware44', 'System x3650 M4: -[7915R3Y]-', 'IBM', '虚拟化', '102.200.135.51', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06WEYB1', '', '', 'IBM', '', '137.129.1.12', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06wxbb4', '', '', '', 'SEP12 互联', '32.17.224.52', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06WYAR6', '', '', '', 'SEP12 互联服务', '192.168.0.9', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06x7999', '', '', '', '抵质押品二维码管理系统', '124.1.1.34', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06XHN34', '', '', 'IBM', '', '137.1.1.211', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06XHP65', '', '', 'IBM', '', '137.1.1.210', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06XNVLD', '', '', '', '银企对账系统', '116.40.1.165', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('06XNWC2', '', '', '', '银企对账系统', '116.40.1.166', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06Y0934', 'sftxqz2', 'X3850', 'IBM', '第三方存管系统', '102.200.160.63', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06Y0937', 'sftxqz1', 'X3850', 'IBM', '第三方存管系统', '102.200.160.62', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06z9280', '', '', '', '办公网SEP服务', '192.168.0.9', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('06ZBDF8', '', '', '', '影像切割后台管理', '124.1.1.98', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('06ZYWE6', '', '', 'IBM', '', '137.129.1.11', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('1000327', 'ebpsszqmap1', '', '', 'BEAI系统', '102.64.6.13', '102.64.6.11', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('1000427', 'ebpsszqmap2', '', '', 'BEAI系统', '102.64.6.12', '102.64.6.11', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('103DC92', 'fxqdb1', 'System p p570', 'IBM', '结售汇/外汇门户', '110.200.1.143', '110.199.203.23,192.199.203.23', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('103DCB2', 'fxqdb2', 'System p p570', 'IBM', '结售汇/外汇门户', '110.200.1.144', '110.199.203.24,192.199.203.24,110.199.3.21', '西三旗机房', '');
INSERT INTO `equipment_monitor` VALUES ('1053CFR', 'cipspmtsqz1', '8202-E4B', 'IBM', '人民币跨境支付系统', '102.200.163.105', '102.97.5.32', '434', '');
INSERT INTO `equipment_monitor` VALUES ('10A940H', 'nbnfs1', 'p5 550', 'IBM', '', '', '172.16.128.243,192.168.254.160', '', '');
INSERT INTO `equipment_monitor` VALUES ('10A943H', 'nbuhf153', 'p5 550', 'IBM', '数据恢复', '102.200.3.153', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('10DAE3R', 'sjgd1', 'Power 720 Express', 'IBM', '数据归档系统', '102.200.128.116', '102.80.11.20,169.254.129.207,102.80.211.22,102.80.11.24,102.80.11.22', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('10DAF9R', 'htgldb1', 'Power 720 Express', 'IBM', '合同管理系统', '102.200.3.30', '102.129.216.18,192.129.216.18', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('10DAFFR', 'htgldb2', 'Power 720 Express', 'IBM', '合同管理系统', '102.200.3.31', '102.129.16.16,192.129.216.19,102.129.216.19', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E2000310', 'vmware47', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '', '102.200.135.54', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E2000311', 'vmware46', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '', '102.200.135.53', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E2000312', 'vmware45', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '', '102.200.135.52', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E2000313', 'vmware52', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '', '102.200.135.59', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E2000315', 'vmware50', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '', '102.200.135.57', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E2000316', 'vmware49', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '', '102.200.135.56', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000700', 'dzgztx3', 'RH5885V2', '华为', '国债系统', '102.200.163.125', '102.96.15.32 102.96.15.34', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000701', 'ZCTGPT1', '', '', '资产托管系统', '102.200.163.30', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000703', 'esbwwcs1', 'PC SERVER', '华为', '华夏E商宝系统', '108.201.63.24', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000707', 'vmware83', 'Tecal RH5885 V2', 'HUAWEI TECHNOLOGIES CO.,LTD.', '虚拟化', '102.200.5.17', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000715', 'dzgztx4', 'RH5885V2', '华为', '国债系统', '102.200.163.126', '102.96.15.33 102.96.15.34', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000717', 'hxsmsmas2', 'RH5885 V2', 'Tecal', '短信平台系统', '102.96.3.34', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000718', 'ZCTGJX1', '', '', '资产托管系统', '102.200.163.31', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000729', 'hxsmsgw2', 'RH5885 V2', 'Tecal', '短信平台系统', '102.96.3.32', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000730', 'hxsmsmas1', 'RH5885 V2', 'Tecal', '短信平台系统', '102.96.3.33', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102310MSM10E6000737', 'LCJJTXQZ2', '', '', '理财系统/基金代销', '102.200.163.35', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GEV10G1000831', 'khsjfxrds5', 'RH5885 V3', 'Huawei Technologies Co., Ltd.', '客户数据分析', '102.200.192.218', '102.101.18.39', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GEV10G1000832', 'khsjfxrds6', 'RH5885 V3', 'Huawei Technologies Co., Ltd.', '客户数据分析', '102.200.192.219', '102.101.18.40', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000012', 'khsjfxrds3', 'RH5885 V3', 'To be filled by O.E.M.', '客户数据分析', '102.200.192.216', '102.101.18.37', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000016', 'sjkgxpt8', 'RH5885 V3', 'To be filled by O.E.M.', 'x86共享数据库', '102.200.192.213', '102.101.18.65,192.101.18.65,102.200.196.73,102.101.18.67', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000023', 'sjkgxpt7', 'RH5885 V3', 'To be filled by O.E.M.', 'x86共享数据库', '102.200.192.212', '102.101.18.64,192.101.18.64,102.200.196.72,102.101.18.68,102.101.18.66', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000027', 'dsfwxtdb1', 'RH5885 V3', 'To be filled by O.E.M.', '电商服务系统', '102.200.193.43', '102.101.27.16,192.101.27.16,169.254.82.24,102.101.27.18', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000035', 'khsjfxrds2', 'RH5885 V3', 'To be filled by O.E.M.', '客户数据分析', '102.200.192.215', '102.101.18.36', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000037', 'lylxdb2', 'RH5885 V3', 'To be filled by O.E.M.', '录音录像系统', '102.200.193.98', '102.101.32.17,192.101.32.17,169.254.101.72,102.101.32.19', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000042', 'zpjyczdb1', 'RH5885 V3', 'To be filled by O.E.M.', '诈骗交易处置系统', '102.200.193.65', '102.101.28.18,192.101.28.18,169.254.21.193,102.101.28.22,102.101.28.20', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000043', 'khsjfxrds4', 'RH5885 V3', 'To be filled by O.E.M.', '客户数据分析', '102.200.192.217', '102.101.18.38', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000050', 'lylxdb1', 'RH5885 V3', 'To be filled by O.E.M.', '录音录像系统', '102.200.193.97', '102.101.32.16,192.101.32.16,169.254.226.162,102.101.32.20,102.101.32.18', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000052', 'khsjfxrds1', 'RH5885 V3', 'To be filled by O.E.M.', '客户数据分析', '102.200.192.214', '102.101.18.35', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000053', 'zpjyczdb2', 'RH5885 V3', 'To be filled by O.E.M.', '', '102.200.193.66', '102.101.28.19,192.101.28.19,169.254.225.81,102.101.28.21', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311GYX10G2000060', 'dsfwxtdb2', 'RH5885 V3', 'To be filled by O.E.M.', '电商服务系统', '102.200.193.44', '102.101.27.17,192.101.27.17,169.254.34.175,102.101.27.20,102.101.27.19', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000105', 'vmware734', 'RH5885 V3', 'Huawei', '虚拟化', '102.200.195.51', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000106', 'vmware736', 'RH5885 V3', 'Huawei', '', '102.200.195.53', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000115', 'vmware733', 'RH5885 V3', 'Huawei', '虚拟化', '102.200.195.50', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000116', 'vmware742', 'RH5885 V3', 'Huawei', '', '102.200.195.59', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000118', 'vmware740', 'RH5885 V3', 'Huawei', '', '102.200.195.57', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000119', 'vmware732', 'RH5885 V3', 'Huawei', '虚拟化', '102.200.195.49', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000120', 'vmware737', 'RH5885 V3', 'Huawei', '', '102.200.195.54', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000121', 'vmware735', 'RH5885 V3', 'Huawei', '虚拟化', '102.200.195.52', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000122', 'vmware739', 'RH5885 V3', 'Huawei', '', '102.200.195.56', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000123', 'vmware741', 'RH5885 V3', 'Huawei', '', '102.200.195.58', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000130', 'vmware738', 'RH5885 V3', 'Huawei', '', '102.200.195.55', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10G7000131', 'vmware743', 'RH5885 V3', 'Huawei', '', '102.200.195.60', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC001985', 'vmware744', 'RH5885 V3', 'Huawei', '', '102.200.195.64', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC001988', 'vmware749', 'RH5885 V3', 'Huawei', '', '102.200.195.69', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC001990', 'vmware745', 'RH5885 V3', 'Huawei', '', '102.200.195.65', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC001996', 'vmware747', 'RH5885 V3', 'Huawei', '', '102.200.195.67', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC001998', 'vmware746', 'RH5885 V3', 'Huawei', '', '102.200.195.66', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC002002', 'vmware751', 'RH5885 V3', 'Huawei', '', '102.200.195.71', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC002004', 'vmware748', 'RH5885 V3', 'Huawei', '', '102.200.195.68', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2102311JWG10GC002005', 'vmware750', 'RH5885 V3', 'Huawei', '', '102.200.195.70', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('210D2FV', 'zfmmsrv1', '8408-E8D', 'IBM', '支付密码系统', '102.200.129.71', '102.80.199.43,102.80.199.44,192.120.1.18,169.254.143.124,102.80.199.45', '433', '');
INSERT INTO `equipment_monitor` VALUES ('210D30V', 'zfmmsrv2', '8408-E8D', 'IBM', '支付密码系统', '102.200.129.72', '102.80.199.46,102.80.199.47,192.120.1.19,169.254.143.20', '433', '');
INSERT INTO `equipment_monitor` VALUES ('211602V', 'ldap2', 'Power 720 Express', 'IBM', '影像集中处理', '102.200.160.102', '102.97.2.53', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211607V', 'cipsap1', 'Power 720 Express', 'IBM', '人民币跨境支付系统', '102.200.163.109', '102.97.5.36,192.97.5.36', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211609V', 'sjgddb1', 'Power 720 Express', 'IBM', '影像集中处理', '102.200.160.129', '102.97.2.101,192.97.2.103,169.254.137.29,102.97.2.103', '434', '');
INSERT INTO `equipment_monitor` VALUES ('21160AV', 'sjgddb2', 'Power 720 Express', 'IBM', '影像集中处理', '102.200.160.130', '102.97.2.102,102.97.2.105,192.97.2.104,169.254.156.54,102.97.2.104', '434', '');
INSERT INTO `equipment_monitor` VALUES ('21160FV', 'cipsap2', 'Power 720 Express', 'IBM', '人民币跨境支付系统', '102.200.163.110', '102.97.5.37,192.97.5.37', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211615V', 'cipsmgap2', 'Power 720 Express', 'IBM', '人民币跨境支付系统', '102.200.163.112', '102.97.205.39,192.97.205.39', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211626V', 'yxjzmq5', 'Power 720 Express', 'IBM', '', '102.200.160.137', '102.97.2.50', '', '');
INSERT INTO `equipment_monitor` VALUES ('21162FV', 'yxjzmq6', 'Power 720 Express', 'IBM', '', '102.200.160.138', '102.97.2.51', '', '');
INSERT INTO `equipment_monitor` VALUES ('211640V', 'ldap1', 'Power 720 Express', 'IBM', '影像集中处理', '102.200.160.101', '102.97.2.52', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211643V', 'cipsmgap1', 'Power 720 Express', 'IBM', '人民币跨境支付系统', '102.200.163.111', '102.97.205.38,192.97.205.38,102.97.5.40', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211648V', 'lctzgldb2', 'Power 720 Express', 'IBM', '理财投资管理', '102.200.192.193', '102.101.19.33,192.101.19.35,102.101.19.35', '725', '');
INSERT INTO `equipment_monitor` VALUES ('21164EV', 'lctzgldb1', 'Power 720 Express', 'IBM', '理财投资管理', '102.200.192.192', '102.101.19.32,102.101.19.36,192.101.19.34,102.101.19.34', '725', '');
INSERT INTO `equipment_monitor` VALUES ('211A3AV', 'sjjxap2', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.96', '102.97.2.45,192.97.2.45', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A3BV', 'absdb2', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.126', '102.97.2.92,102.97.2.95,192.97.2.94,169.254.178.84,102.97.2.94', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A3CV', 'jzyydb2', '8205-E6D', 'IBM', '', '102.200.160.128', '102.97.2.100,192.97.2.99,169.254.190.139,102.97.2.99,102.97.2.97', '', '');
INSERT INTO `equipment_monitor` VALUES ('211A3DV', 'jzyydb1', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.127', '102.97.2.96,102.97.2.100,192.97.2.98,169.254.83.185,102.97.2.98', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A3EV', 'yxjzmq4', '8205-E6D', 'IBM', '', '102.200.160.100', '102.97.2.49', '', '');
INSERT INTO `equipment_monitor` VALUES ('211A3FV', 'sjjxap1', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.95', '102.97.2.44,192.97.2.44', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A40V', 'yxjzmq2', '8205-E6D', 'IBM', '', '110.200.2.129', '110.190.1.9', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211A41V', 'yxjzmq1', '8205-E6D', 'IBM', '', '110.200.2.128', '110.190.1.8', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211A42V', 'absdb1', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.125', '102.97.2.91,192.97.2.93,169.254.12.229,102.97.2.93', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A43V', 'yanyinap2', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.98', '102.97.2.47', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A44V', 'sjfxap2', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.94', '102.97.2.43', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A45V', 'yxjzmq3', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.99', '102.97.2.48', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A46V', 'yanyinap1', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.97', '102.97.2.46', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A47V', 'sjfxap1', '8205-E6D', 'IBM', '影像集中处理', '102.200.160.93', '102.97.2.42', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A48V', 'fnpeap2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.88', '102.200.164.133,102.97.2.37', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A49V', 'bpcap2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.84', '102.200.164.129,102.97.2.33', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211A4BV', 'fnceap2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.86', '102.200.160.86,102.97.2.35,102.200.164.131', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A4CV', 'bpcap1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.83', '102.200.164.128,102.97.2.32', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211A4DV', 'fnpeap1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.87', '102.200.164.132,102.97.2.36', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A4FV', 'yxjzdb2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.116', '102.97.2.67,192.97.2.69,169.254.103.211,102.97.2.69', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A50V', 'fnceap1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.85', '102.200.160.85,102.97.2.34,102.200.164.130', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211A53V', 'yxjzdb1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.115', '102.97.2.66,192.97.2.68,169.254.197.62,102.97.2.70,102.97.2.68', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A55V', 'sjjxdb2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.124', '102.97.2.89,192.97.2.89', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A56V', 'sjjxdb1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.123', '102.97.2.88,192.97.2.88', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A57V', 'evtdb1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.135', '102.97.2.116,192.97.2.118,169.254.194.205,102.97.2.118', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A58V', 'pedb2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.118', '102.97.2.72,192.97.2.74,169.254.97.219,102.97.2.74', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A59V', 'pedb1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.117', '102.97.2.71,192.97.2.73,169.254.188.174,102.97.2.75,102.97.2.73', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A5AV', 'cedb1', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.119', '102.97.2.76,192.97.2.78,169.254.141.241,102.97.2.80,102.97.2.78', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A5BV', 'cedb2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.120', '102.97.2.77,192.97.2.79,169.254.31.177,102.97.2.79', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A6EV', 'nlcjjjydb1', '8408-E8D', 'IBM', '理财系统,基金代销,银保通,中间业务', '102.200.160.161', '102.96.7.37,192.96.7.39,169.254.187.17,102.96.7.41,102.96.7.39', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A70V', 'dcmsap3', '8408-E8D', 'IBM', '信贷管理系统', '102.200.163.71', '102.97.199.171', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A71V', 'lclap2', '8408-E8D', 'IBM', '理财系统,基金代销,银保通,中间业务', '102.200.160.154', '102.200.164.25,102.96.7.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A72V', 'nlcjjrpdb1', '8408-E8D', 'IBM', '理财系统,基金代销,银保通,中间业务', '102.200.160.165', '102.96.7.47,102.96.7.51,192.96.7.49,169.254.96.2,102.96.7.49', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211A73V', 'easjapp1', '8205-E6D', 'IBM', '', '', '172.16.72.22,192.168.161.34,192.168.254.158', '', '');
INSERT INTO `equipment_monitor` VALUES ('211A75V', 'easjapp2', '8205-E6D', 'IBM', '', '', '172.16.72.23,192.168.161.35,192.168.254.159', '', '');
INSERT INTO `equipment_monitor` VALUES ('211E3AV', 'wlyywgdb1', 'Power 720 Express', 'IBM', '外联应用网关系统', '102.200.160.230', '102.96.248.24,192.96.248.26,169.254.186.10,102.96.248.28,102.96.248.26', '434', '');
INSERT INTO `equipment_monitor` VALUES ('211E3BV', 'wzdb1', '8202-E4D', '', '网站门户系统', '108.201.200.128', '172.16.147.155,169.254.178.100,172.16.147.151,10.1.11.1,172.16.147.153', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211E3CV', 'wzdb2', '8202-E4D', '', '网站门户系统', '108.201.200.129', '10.1.11.2,172.16.147.152,172.16.147.154,169.254.9.51', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('211E3DV', 'sjckgjzbcxdb1', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.160.194', '102.96.6.37,102.96.6.41,192.96.6.39,169.254.212.83,102.96.6.39', '434', '');
INSERT INTO `equipment_monitor` VALUES ('212E34V', 'eaweb1', 'Power 720 Express', 'IBM', '', '', '172.16.64.32', '', '');
INSERT INTO `equipment_monitor` VALUES ('212E3EV', 'eaapp1', 'Power 720 Express', 'IBM', '', '', '172.16.72.16,192.168.161.32,192.168.254.150', '', '');
INSERT INTO `equipment_monitor` VALUES ('212E50V', 'eaweb2', 'Power 720 Express', 'IBM', '', '', '172.16.64.33', '', '');
INSERT INTO `equipment_monitor` VALUES ('212E51V', 'eaapp2', 'Power 720 Express', 'IBM', '', '', '172.16.72.17,192.168.161.33,192.168.254.151', '', '');
INSERT INTO `equipment_monitor` VALUES ('212F3BV', 'xykhlqsdb1', '8408-E8D', 'IBM', '', '102.200.160.177', '102.96.9.18,192.96.9.20,169.254.239.103,102.96.9.22,102.96.9.20', '', '');
INSERT INTO `equipment_monitor` VALUES ('212F3CV', 'czzwdb1', '8408-E8D', 'IBM', '村镇指纹授权系统', '102.200.6.27', '102.64.1.72,192.64.1.74,169.254.122.223,102.64.1.74', '421', '');
INSERT INTO `equipment_monitor` VALUES ('212F3DV', 'zjywap2', '8408-E8D', 'IBM', '资金业务系统', '102.200.160.172', '102.200.164.31,102.96.8.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('212F40V', 'sfdb2', '8408-E8D', 'IBM', '第三方存管系统', '110.200.2.145', '102.96.4.25,192.96.4.25', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('212F41V', 'sjjh2', '8408-E8D', 'IBM', '数据交换', '102.200.160.184', '102.96.6.17,192.96.6.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('212F42V', 'p2pwjcs2', '8408-E8D', 'IBM', '', '', '10.1.14.2,192.168.252.34,10.1.15.2', '', '');
INSERT INTO `equipment_monitor` VALUES ('212F43V', 'bancsdg2', '8408-E8D', 'IBM', '核心系统,借记卡系统', '102.200.162.20', '102.81.203.23,192.81.203.23', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('212F44V', 'zbglap1', '8408-E8D', 'IBM', '资本管理', '102.200.160.179', '102.200.164.53,102.96.11.16', '434', '');
INSERT INTO `equipment_monitor` VALUES ('212F45V', 'czlcgkyap2', '8408-E8D', 'IBM', '村镇理财', '102.200.6.23', '102.200.7.39,102.64.1.247', '421', '');
INSERT INTO `equipment_monitor` VALUES ('212F46V', 'czlcgkyap1', '8408-E8D', 'IBM', '村镇理财', '102.200.6.22', '102.200.7.38,102.64.1.246', '421', '');
INSERT INTO `equipment_monitor` VALUES ('212F47V', 'otpap1', '8408-E8D', 'IBM', '', '108.201.192.206', '172.16.72.64,192.168.254.206', '', '');
INSERT INTO `equipment_monitor` VALUES ('212F48V', 'jshdb2', '8408-E8D', 'IBM', '', '102.80.31.20', '102.200.129.66,102.80.31.16,192.80.31.19,169.254.44.44,102.80.31.19,102.80.31.17', '', '');
INSERT INTO `equipment_monitor` VALUES ('212F4AV', 'zdhdb1', '8408-E8D', 'IBM', '自动化项目', '102.200.129.95', '102.80.24.16,192.80.24.18,169.254.63.165,102.80.24.18', '433', '');
INSERT INTO `equipment_monitor` VALUES ('212F4BV', 'czzwdb2', '8408-E8D', 'IBM', '村镇指纹授权系统', '102.200.6.28', '102.64.1.73,192.64.1.75,169.254.69.189,102.64.1.76,102.64.1.75', '421', '');
INSERT INTO `equipment_monitor` VALUES ('212F4CV', 'sfap1', '8408-E8D', 'IBM', '第三方存管系统', '110.200.2.138', '102.96.4.16', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('212F4DV', 'sjjrjr3', '8408-E8D', 'IBM', '手机银行系统', '108.201.67.12', '172.16.67.12', '433', '');
INSERT INTO `equipment_monitor` VALUES ('212F4EV', 'sjjrjr4', '8408-E8D', 'IBM', '手机银行系统', '108.201.67.13', '172.16.67.13', '433', '');
INSERT INTO `equipment_monitor` VALUES ('21336BV', 'emapp2', 'Power 720 Express', 'IBM', '', '', '172.16.72.21,192.168.254.155', '', '');
INSERT INTO `equipment_monitor` VALUES ('21336DV', 'esapp1', 'Power 720 Express', 'IBM', '', '', '172.16.72.18,192.168.254.152,192.168.161.18', '', '');
INSERT INTO `equipment_monitor` VALUES ('21336FV', 'emapp1', 'Power 720 Express', 'IBM', '', '', '172.16.72.20,192.168.254.154', '', '');
INSERT INTO `equipment_monitor` VALUES ('213371V', 'esapp2', 'Power 720 Express', 'IBM', '', '', '172.16.72.19,192.168.254.153,192.168.161.19', '', '');
INSERT INTO `equipment_monitor` VALUES ('21339EV', 'sjckgjzbcxdb2', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.160.195', '102.96.6.38,192.96.6.40,169.254.229.40,102.96.6.40', '434', '');
INSERT INTO `equipment_monitor` VALUES ('21339FV', 'wlyywgdb2', 'Power 720 Express', 'IBM', '外联应用网关系统', '102.200.160.231', '102.96.248.25,192.96.248.27,169.254.215.73,102.96.248.27', '434', '');
INSERT INTO `equipment_monitor` VALUES ('2133A0V', 'kfcifdb1', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.129.43', '102.80.219.24,102.80.19.23,192.80.219.24', '433', '');
INSERT INTO `equipment_monitor` VALUES ('2133A1V', 'kfcifdb2', 'Power 720 Express', 'IBM', 'Call Center系统', '102.200.129.44', '102.80.219.25,192.80.219.25', '433', '');
INSERT INTO `equipment_monitor` VALUES ('213656V', 'rulesdb2', '8408-E8D', 'IBM', '影像集中处理', '102.200.160.134', '102.97.2.112,192.97.2.114,169.254.45.142,102.97.2.114', '434', '');
INSERT INTO `equipment_monitor` VALUES ('213704V', 'bancsdg1', '8408-E8D', 'IBM', '核心系统,借记卡系统', '102.200.162.19', '102.81.203.22,192.81.203.22,102.81.3.20', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('213705V', 'bancs01', 'Power 780', 'IBM', '核心系统,借记卡系统', '102.200.133.18', '102.81.202.26,192.81.202.26,102.81.3.18', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('213707V', 'bancs04', 'Power 780', 'IBM', '核心系统,借记卡系统', '102.200.162.17', '102.81.2.21,192.81.3.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('213708V', 'bancs02', 'Power 780', 'IBM', '核心系统,借记卡系统', '102.200.162.16', '102.81.2.17,192.81.3.17,192.81.2.19,169.254.198.106,102.81.3.17,102.81.2.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630660', 'khsjfxgl3', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.175', '102.101.18.18,102.101.20.18', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630662', 'vmware91', 'NF8460M3', 'Inspur', '虚拟化', '102.200.161.26', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630663', 'dzypdb2', 'NF8460M3', 'Inspur', '抵质押品', '102.200.163.84', '102.96.19.25,192.96.19.27,169.254.53.143,102.96.19.27', '434', '');
INSERT INTO `equipment_monitor` VALUES ('214630664', 'khsjfxsj6', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.181', '102.101.18.24,102.101.20.24', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630665', 'hjbp2', '', '', '黄金买卖系统', '102.200.192.65', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630666', 'khsjfxsj1', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.176', '102.101.18.19,102.101.20.19,102.101.18.28', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630669', 'khsjfxsj5', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.180', '102.101.18.23,102.101.20.23', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630671', 'znkfsip2', 'NF8460M3', 'Inspur', 'Call Center系统', '102.200.192.40', '102.101.1.25,102.101.1.41', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630673', 'khsjfxsj2', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.177', '102.101.18.20,102.101.20.20', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630674', 'khsjfxgl2', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.174', '102.101.18.17,102.101.20.17', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630676', 'hjjy1', 'NF8460M3', 'Inspur', '黄金买卖系统', '102.200.192.67', '102.101.3.32,102.200.196.28', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630678', 'vmware92', 'NF8460M3', 'Inspur', '虚拟化', '102.200.161.27', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630679', 'khsjfxsj4', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.179', '102.101.18.22,102.101.20.22', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630681', 'odsdb1', 'NF8460M3', 'Inspur', '数据抽取与报表系统', '102.200.163.117', '102.96.6.84,192.96.6.86,169.254.46.248,102.96.6.86', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630682', 'dzypdb1', 'NF8460M3', 'Inspur', '抵质押品', '102.200.163.83', '102.96.19.24,192.96.19.26,169.254.135.232,102.96.19.28,102.96.19.26', '434', '');
INSERT INTO `equipment_monitor` VALUES ('214630683', 'vmware93', 'NF8460M3', 'Inspur', '', '102.200.161.28', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630684', 'khsjfxsj3', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.178', '102.101.18.21,102.101.20.21', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630685', 'hjbp1', '', '', '黄金买卖系统', '102.200.192.64', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630686', 'khsjfxgl1', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.173', '102.101.18.16,102.101.20.27,102.101.20.26,102.101.20.16,102.101.18.27,102.101.18.26', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630689', 'vmware94', 'NF8460M3', 'Inspur', '', '102.200.161.29', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630690', 'kjfxjcapp2', 'NF8460M3', 'Inspur', '会计风险监测', '102.200.192.81', '102.101.6.19,102.200.196.33', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630691', 'hjbp3', '', '', '黄金买卖系统', '102.200.192.66', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630692', 'vmware706', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.22', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630693', 'dzhptapp3', 'NF8460M3', 'Inspur', '电子化培训系统', '102.200.192.104', '102.101.10.18,102.200.196.64', '725', '');
INSERT INTO `equipment_monitor` VALUES ('214630694', 'irbtdb2', 'NF8460M3', 'Inspur', '智能机器人系统', '102.200.163.28', '102.96.249.65,192.96.249.67,169.254.223.183,102.96.249.67', '434', '');
INSERT INTO `equipment_monitor` VALUES ('214630695', 'irbtdb1', 'NF8460M3', 'Inspur', '智能机器人系统', '102.200.163.27', '102.96.249.64,102.96.249.68,192.96.249.66,169.254.249.187,102.96.249.66', '434', '');
INSERT INTO `equipment_monitor` VALUES ('214630696', 'czmhfxqdb2', 'NF8460M3', 'Inspur', '村镇反洗钱', '102.200.6.19', '102.64.1.234,192.64.1.236,169.254.129.29,102.64.1.236', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630697', 'khsjfxsj7', 'NF8460M3', 'Inspur', '客户数据分析', '102.200.192.182', '102.101.18.25,102.101.20.25', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('214630698', 'czmhfxqdb1', 'NF8460M3', 'Inspur', '村镇反洗钱', '102.200.6.18', '102.64.1.233,192.64.1.235,169.254.39.99,102.64.1.237,102.64.1.235', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2147E8V', 'lclap4', '8408-E8D', 'IBM', '理财系统,基金代销,银保通,中间业务', '102.200.160.156', '102.200.164.27,102.96.7.19', '434', '');
INSERT INTO `equipment_monitor` VALUES ('2147E9V', 'dcmsap4', '8408-E8D', 'IBM', '信贷管理系统', '102.200.163.72', '102.97.199.172', '434', '');
INSERT INTO `equipment_monitor` VALUES ('215205713', 'yqhadoop4', 'NF8460M3', 'Inspur', '舆情信息系统', '102.200.192.139', '102.150.2.21', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205714', 'dbgxpt2', 'NF8460M3', 'Inspur', 'Call Center系统', '102.200.192.44', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205715', 'yqhadoop3', 'NF8460M3', 'Inspur', '舆情信息系统', '102.200.192.138', '102.150.2.20', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205717', 'yqhadoop2', 'NF8460M3', 'Inspur', '舆情信息系统', '102.200.192.137', '102.150.2.19', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205718', 'yqhadoop5', 'NF8460M3', 'Inspur', '舆情信息系统', '102.200.192.140', '102.150.2.22', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205719', 'yqhadoop1', 'NF8460M3', 'Inspur', '舆情信息系统', '102.200.192.136', '102.150.2.18', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205720', 'dbgxpt1', 'NF8460M3', 'Inspur', 'Call Center系统', '102.200.192.43', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205733', 'vmware713', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.29', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205734', 'sjkgxpt6', 'NF8460M3', 'Inspur', 'x86共享数据库', '102.200.192.111', '102.101.7.33,192.101.7.35,169.254.29.6,102.101.7.35', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205737', 'sjkgxpt4', 'NF8460M3', 'Inspur', 'x86共享数据库', '102.200.192.109', '102.101.10.33,192.101.10.35,169.254.168.183,102.101.10.35', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205738', 'vmware712', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.28', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205739', 'vmware721', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.38', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205741', 'vmware726', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.43', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205742', 'lspjxtdb2', 'NF8460M3', 'Inspur', '零售内评系统', '102.200.192.95', '102.101.8.33,192.101.8.35,169.254.6.107,102.101.8.35', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205743', 'flspjxtdb2', 'NF8460M3', 'Inspur', '零售非零售内评系统', '102.200.192.97', '102.101.8.38,192.101.8.40,169.254.4.246,102.101.8.40', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205744', 'vmware717', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.33', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205745', 'lspjxtdb1', 'NF8460M3', 'Inspur', '零售内评系统', '102.200.192.94', '102.101.8.32,192.101.8.34,169.254.80.104,102.101.8.36,102.101.8.34', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205747', 'vmware727', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.44', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205748', 'hjfk1', 'NF8460M3', 'Inspur', '黄金买卖系统', '102.200.192.61', '102.101.3.20,102.101.3.22,192.101.3.20', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205750', 'p2papp2', 'NF8460M3', 'Inspur', 'P2P资金存管', '102.200.193.45', '102.101.26.23,102.200.196.88', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205753', 'vmware725', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.42', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205755', 'vmware724', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.41', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205757', 'vmware720', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.37', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205758', 'vmware723', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.40', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205759', 'flspjxtdb1', 'NF8460M3', 'Inspur', '零售非零售内评系统', '102.200.192.96', '102.101.8.37,192.101.8.39,169.254.129.213,102.101.8.41,102.101.8.39', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205760', 'vmware709', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.25', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205761', 'vmware711', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.27', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205763', 'vmware708', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.24', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205764', 'sjkgxpt3', 'NF8460M3', 'Inspur', 'x86共享数据库', '102.200.192.108', '102.101.10.32,192.101.10.34,169.254.127.26,102.101.10.36,102.101.10.34', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205765', 'xqfxdb1', 'NF8460M3', 'Inspur', '人行反洗钱系统', '102.200.192.151', '102.101.16.32,192.101.16.34,169.254.56.83,102.101.16.36,102.101.16.34', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205766', 'xqfxdb2', 'NF8460M3', 'Inspur', '人行反洗钱系统', '102.200.192.152', '102.101.16.33,192.101.16.35,169.254.149.123,102.101.16.35', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205769', 'vmware714', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.30', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205770', 'vmware716', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.32', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205773', 'vmware89', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.10', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205775', 'vmware710', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.26', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205776', 'hjfk2', 'NF8460M3', 'Inspur', '黄金买卖系统', '102.200.192.62', '102.101.3.21,192.101.3.21', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205781', 'vmware88', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.9', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205782', 'vmware722', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.39', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205785', 'sjkgxpt5', 'NF8460M3', 'Inspur', 'x86共享数据库', '102.200.192.110', '102.101.7.32,192.101.7.34,169.254.39.61,102.101.7.36,102.101.7.34', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205786', 'vmware90', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.11', '', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205788', 'vmware718', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.34', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205790', 'vmware715', 'NF8460M3', 'Inspur', '虚拟化', '102.200.195.31', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('215205792', 'p2papp1', 'NF8460M3', 'Inspur', '支付融资系统', '102.200.163.137', '102.101.26.22,102.200.196.87', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('216504V', 'sjcksjjhzskdb1', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.160.192', '102.96.6.32,192.96.6.34,169.254.33.94,102.96.6.36,102.96.6.34', '434', '');
INSERT INTO `equipment_monitor` VALUES ('216505V', 'sjcksjjhzskdb2', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.160.193', '102.96.6.33,192.96.6.35,169.254.77.70,102.96.6.35', '434', '');
INSERT INTO `equipment_monitor` VALUES ('216506V', 'sjcksjgkdb1', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.160.198', '102.96.6.47,192.96.6.49,169.254.49.232,102.96.6.51,102.96.6.49', '434', '');
INSERT INTO `equipment_monitor` VALUES ('216507V', 'sjcksjgkdb2', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.160.199', '102.96.6.48,192.96.6.50,169.254.3.243,102.96.6.50', '434', '');
INSERT INTO `equipment_monitor` VALUES ('216509V', 'sjckzzj2', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.163.114', '102.96.6.101,192.96.6.103,169.254.21.198,102.96.6.104,102.96.6.103', '434', '');
INSERT INTO `equipment_monitor` VALUES ('21650AV', 'sjckzzj1', 'Power 720 Express', 'IBM', '数据仓库系统', '102.200.163.113', '102.96.6.100,192.96.6.102,169.254.189.213,102.96.6.102', '434', '');
INSERT INTO `equipment_monitor` VALUES ('21650CV', 'bancs01', 'Power 720 Express', 'IBM', '核心系统,借记卡系统', '102.200.6.16', '102.64.1.228,192.64.201.230,192.64.1.230,169.254.119.119,102.64.1.230', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('21650DV', 'bancs02', 'Power 720 Express', 'IBM', '村镇核心', '102.200.6.17', '102.64.1.229,192.64.201.231,192.64.1.231,169.254.22.130,102.64.1.232,102.64.1.231', '421', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('21BA1ET', '', '', '', '分行办公自动化系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('21BA22T', '', '', '', '分行办公自动化系统', '', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('2321-10768824', '', '', '', '短信平台', '116.40.1.123', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('492600259', 'ebpsszqmap3', '', '', 'BEAI系统', '102.64.6.14', '102.64.6.11', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('65-6B20E', '', '', '', '分行特色业务系统', '124.1.200.18', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('659250', '', '', '', '办公网SEP服务器', '116.60.1.22', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('659261', '', '', '', '业务网SEP服务', '116.60.1.21', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('6BVZMA', '', '', '联想', '', '137.120.1.235', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('6BVZMF', '', '', '联想', '', '137.102.1.245', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('6BVZMH', '', '', 'IBM', '', '137.121.1.132', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('6BVZML', '', '', '联想', '', '137.120.1.236', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('6BVZMZ', '', '', '联想', '', '137.102.1.246', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('6BVZNE', '', '', 'IBM', '', '137.121.1.133', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('6CU249TL6F', '', '', '', '电话录音系统', '124.1.1.29', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('7804288', '', '', '', '冠字号系统', '116.40.1.52', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('7804289', '', '', '', '冠字号系统', '116.40.1.54', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('7804290', '', '', '', '冠字号系统', '无', '', '', '未用');
INSERT INTO `equipment_monitor` VALUES ('7945I05', '', '', 'IBM', '', '137.1.1.29', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('800302010000411', '', '', '奇智', '', '137.1.1.115', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84064BW', 'nbnfs1', 'Power 780', 'IBM', '网上银行系统', '110.200.6.170', '172.16.128.243', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DADW', 'hxccag1', '8408-E8D', 'IBM', 'Call Center系统', '110.200.6.118', '102.80.19.8,192.80.219.10,102.80.219.10', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DAEW', 'cipspmtsqz1', '8408-E8D', 'IBM', '人民币跨境支付系统', '110.200.6.207', '110.198.16.16', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DB1W', 'otpap1', '8408-E8D', 'IBM', '网上银行系统', '110.200.6.149', '172.16.72.64', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DB2W', 'hxccag2', '8408-E8D', 'IBM', 'Call Center系统', '110.200.6.119', '102.80.219.11,192.80.219.11', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DB5W', 'sjdb2', '8408-E8D', 'IBM', '手机银行系统', '109.200.7.51', '10.1.7.2,172.16.68.23', '10-2', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DB6W', 'otpdb2', '8408-E8D', 'IBM', '网上银行系统', '110.200.6.152', '10.1.12.2,172.16.72.69,172.16.72.67,169.254.145.172', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DB7W', 'ickms2', '8408-E8D', 'IBM', '密钥管理系统', '110.200.6.110', '102.64.15.41', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DB9W', 'sjlog', '8408-E8D', 'IBM', '手机银行系统', '109.200.7.49', '172.16.68.16', '10-2', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DBAW', 'xykhlqsap2', '8408-E8D', 'IBM', '信用卡互联与清算', '109.200.8.39', '102.96.9.17,192.96.9.17', '10-6', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('840DBCW', 'otpap1', '8408-E8D', 'IBM', '动态口令系统（OTP）', '109.200.3.124', '172.16.72.64', '10-6', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('841CC4W', 'sjkbfyj4', '8205-E6D', 'IBM', '数据恢复', '102.200.192.226', '102.150.1.128', '725', '');
INSERT INTO `equipment_monitor` VALUES ('841CC7W', 'sjkbfyj3', '8205-E6D', 'IBM', '数据恢复', '102.200.163.135', '102.148.1.130', '434', '');
INSERT INTO `equipment_monitor` VALUES ('843284V', 'essjapp1', 'Power 720 Express', 'IBM', '', '', '172.16.72.24,192.168.161.36,192.168.254.176', '', '');
INSERT INTO `equipment_monitor` VALUES ('843285V', 'essjapp2', 'Power 720 Express', 'IBM', '', '', '172.16.72.25,192.168.161.37,192.168.254.177', '', '');
INSERT INTO `equipment_monitor` VALUES ('845B17V', 'catadb3', '8205-E6D', 'IBM', '支付融资系统', '102.200.3.217', '169.254.134.215,108.201.4.41,108.201.4.39,108.201.4.37,192.201.4.39', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('845B18V', 'cataapp4', '8205-E6D', 'IBM', '支付融资系统', '102.200.3.216', '102.200.7.47,108.201.4.21', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('845B19V', 'sjckbbjsdb2', '8205-E6D', 'IBM', '数据仓库系统', '102.200.160.219', '102.96.6.65,192.96.6.67,169.254.3.140,102.96.6.67', '434', '');
INSERT INTO `equipment_monitor` VALUES ('845B1AV', 'zbgldb2', '8205-E6D', 'IBM', '', '102.200.160.182', '102.200.164.56,192.96.11.21,169.254.252.144,102.96.11.21,102.96.11.19', '', '');
INSERT INTO `equipment_monitor` VALUES ('845B1BV', 'zbgldb1', '8205-E6D', 'IBM', '资本管理', '102.200.160.181', '102.200.164.55,192.96.11.20,169.254.222.208,102.96.11.20,102.96.11.18', '434', '');
INSERT INTO `equipment_monitor` VALUES ('845B1CV', 'sjckbbjsdb1', '8205-E6D', 'IBM', '数据仓库系统', '102.200.160.218', '102.96.6.64,192.96.6.66,169.254.166.176,102.96.6.68,102.96.6.66', '434', '');
INSERT INTO `equipment_monitor` VALUES ('84A092V', 'bancs01', 'Power 780', 'IBM', '核心系统,借记卡系统', '102.200.133.16', '102.81.2.16,192.81.3.16,192.81.2.18,169.254.147.17,102.81.3.16,102.81.2.22,102.81.2.18', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84A093V', 'p2pzjcgdb1', 'Power 780', 'IBM', 'P2P资金存管', '102.200.163.136', '102.101.26.16,192.101.26.16,169.254.151.255,102.101.26.20,102.101.26.18', '434', '');
INSERT INTO `equipment_monitor` VALUES ('84A095V', 'p2pzjcgdb2', 'Power 780', 'IBM', 'P2P资金存管', '102.200.193.42', '102.101.26.17,192.101.26.17,169.254.144.8,102.101.26.19', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84A098V', 'beaidb02', 'Power 780', 'IBM', 'BEAI系统', '102.200.162.32', '102.81.3.33,192.81.4.19,169.254.246.91,102.81.4.19,102.81.4.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84A099V', 'cygldb2', 'Power 780', 'IBM', '创意管理系统', '102.200.193.106', '102.150.6.17,102.150.6.20,192.150.6.17,169.254.169.98,102.150.6.19', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84A1BBV', 'mapdb4', '8408-E8D', 'IBM', '管理会计', '102.200.163.70', '102.200.164.89,192.96.12.44,169.254.57.210,102.96.12.44,102.96.12.40', '434', '');
INSERT INTO `equipment_monitor` VALUES ('84A1BCV', 'xdyxfndb2', '8408-E8D', 'IBM', '信贷管理系统', '102.200.192.243', '102.101.8.67,192.101.8.67,169.254.171.199,102.101.8.71', '725', '');
INSERT INTO `equipment_monitor` VALUES ('84A1BDV', 'dcmsdb1', '8408-E8D', 'IBM', '信贷管理系统', '102.200.163.63', '102.97.199.166,192.17.1.66,169.254.247.39,102.97.199.170,102.97.199.168', '434', '');
INSERT INTO `equipment_monitor` VALUES ('84A1BEV', 'xgjdgdb1', '8408-E8D', 'IBM', '国际结算系统', '102.200.192.100', '102.101.9.32,102.101.9.36,192.101.8.34,169.254.97.163,102.101.9.34', '725', '');
INSERT INTO `equipment_monitor` VALUES ('84A1BFV', 'fdmdb1', '8408-E8D', 'IBM', '管理会计', '102.200.163.65', '102.96.12.32,192.96.12.34,169.254.141.76,102.96.12.36,102.96.12.34', '434', '');
INSERT INTO `equipment_monitor` VALUES ('84A1C0V', 'sjckfxjsdb2', '8408-E8D', 'IBM', '数据仓库系统', '102.200.160.236', '102.96.6.75,192.96.6.77,169.254.51.161,102.96.6.77', '434', '');
INSERT INTO `equipment_monitor` VALUES ('84A9A4V', 'cygldb1', 'Power 780', 'IBM', '创意管理系统', '102.200.193.105', '102.150.6.16,192.150.6.16,169.254.96.67,102.150.6.18', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84A9A6V', 'beaiap02', 'Power 780', 'IBM', 'BEAI系统', '102.200.133.34', '102.81.4.33,192.81.3.33', '433', '');
INSERT INTO `equipment_monitor` VALUES ('84D30FV', 'sjjrjr5', '8205-E6D', 'IBM', '', '', '172.16.67.50', '', '');
INSERT INTO `equipment_monitor` VALUES ('84D310V', 'sjjrjr6', '8205-E6D', 'IBM', '', '', '172.16.67.51', '', '');
INSERT INTO `equipment_monitor` VALUES ('84EB0EV', 'fxcrmdb2', '8408-E8D', 'IBM', '个人CRM系统', '102.200.192.225', '102.101.22.21,192.101.22.21,102.101.22.23', '725', '');
INSERT INTO `equipment_monitor` VALUES ('84EB10V', 'fxcrmdb1', '8408-E8D', 'IBM', '个人CRM系统', '102.200.192.224', '102.101.22.20,192.101.22.20,102.101.22.24,102.101.22.22', '725', '');
INSERT INTO `equipment_monitor` VALUES ('84F47EV', 'bancs04', 'Power 780', 'IBM', '灾备核心系统', '110.200.6.19', '102.81.2.21,192.81.3.19', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84F47FV', 'hxsmsapp1', 'Power 780', 'IBM', '灾备短信平台系统', '110.200.6.66', '102.96.3.22', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84F480V', 'epaydb02', 'Power 780', 'IBM', '华夏E商宝系统', '110.200.6.148', '10.1.5.2,172.16.132.24,172.16.132.22,169.254.66.146', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84F482V', 'hxsmsapp2', 'Power 780', 'IBM', '灾备短信平台系统', '110.200.6.67', '102.96.3.23', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84F483V', 'hxb2cif5', 'Power 780', 'IBM', '网上银行系统', '110.200.6.163', '172.16.128.168', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84F484V', 'sjdb1', 'Power 780', 'IBM', '手机银行系统', '110.200.6.143', '10.1.7.1,172.16.68.24,172.16.68.22,172.16.68.20,169.254.223.205', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('84F485V', 'beaidb01', 'Power 780', 'IBM', '灾备BEAI系统', '110.200.6.20', '102.81.3.32,192.81.4.18,102.81.4.18', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('916100T', '', '', '', '办公网终端服务', '', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99A1911', 'swiftswp1', '', '', 'SWIFT系统', '102.64.33.16', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A1920', 'gkapp1', 'System x3850 X5 -[7145I18]-', 'IBM', 'EMC监控', '102.200.2.219', '', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A1948', '', '', '', '业务网终端服务', '32.17.224.138', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99a5532', '', '', '', '支票影像系统', '116.40.1.47', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99A9746', 'gjjsyxdc1', '', '', '国际结算系统', '102.64.28.26', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A9748', 'gjjsyxdc2', '', '', '国际结算系统', '102.64.28.27', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A9753', 'gjjsyxdb2', '', '', '国际结算系统', '102.64.28.34', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A9757', 'gjjsyxapp1', '', '', '国际结算系统', '102.64.28.28', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A9758', 'gjjsyxdb1', '', '', '国际结算系统', '102.64.28.33', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99A9760', 'gjjsyxapp2', '', '', '国际结算系统', '102.64.28.29', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99B0457', '', '', '', '支付密码器网关', '124.1.1.44', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99B0666', '', '', '', '支付密码器网关', '124.1.1.43', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99b0886', '', '', '', '', '116.40.1.51', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99B1711', '', '', '', '同城票据交换系统', '124.1.200.12', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99B4575', '', '', '', '汽车金融系统', '116.40.1.77', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99B4641', '', '', '', '分行OA系统', '124.1.128.6', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99B8955', '', '', '', '分行考评系统', '32.17.224.147', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99B9243', '', '', '', 'WSUS', '192.168.0.48', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99c1982', '', '', '', '分行办公自动化系统', '192.168.254.5', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99C9101', '', '', '', '文件传输系统', '124.1.1.39', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99C9114', '', '', '', '分行OA系统', '124.1.128.5', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99C9121', '', '', '', '综合创利系统', '124.1.128.34', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99C9126', '', '', '', '综合创利系统', '124.1.128.33', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99CDDTA', '', '', '', '无', '116.160.1.88', '', '', '测试');
INSERT INTO `equipment_monitor` VALUES ('99CDDVH', '', '', '', 'BANCSLINK开发系统', '116.160.1.149', '', '', '开发');
INSERT INTO `equipment_monitor` VALUES ('99d3118', '', '', '', '分行绩效', '116.60.1.86', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99D8373', '', '', '', '电子化培训平台', '124.1.128.8', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99e0962', '', '', '', '地址导航系统', '32.17.224.51', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99E0963', '', '', '', '无', '116.40.1.30', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99G5701', '', '', '', '无', '无', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99G7768', '', '', 'IBM', '', '137.1.1.28', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99G8818', '', '', '', '事后监督系统', '124.1.1.59', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99G8848', '', '', '', '事后监督系统', '124.1.1.61', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99G8856', '', '', '', '事后监督系统', '124.1.1.60', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99GTA98', '', '', '联想', '', '137.1.1.76', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99H1810', 'vmware29', 'System x3650 M3 -[7945M5E]-', 'IBM', '虚拟化', '102.200.135.36', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99H3711', '', '', '', '无', '32.17.224.111', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99H4071', '', '', '', 'VRV业务-办公', '116.60.1.25', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99H4105', '', '', '', '支票影像系统', '116.40.1.195', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99H4188', '', '', '', '综合管理系统', '116.40.1.217', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99H5698', '', '', '', '支票影像系统', '116.160.1.98', '', '', '测试');
INSERT INTO `equipment_monitor` VALUES ('99H5704', '', '', '', '业务网日志服务', '32.17.224.136', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99h5705', '', '', '', '分行交易监控系统', '116.40.1.163', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99H5708', '', '', '', '人力资源培训系统', '116.60.1.18', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99H5713', '', '', '', '灾备数据备份系统', '116.40.2.110', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99H5715', '', '', '', '圈存系统', '32.17.224.213', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99H9086', '', '', '', '同城票据交换系统', '124.1.1.6', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99HH494', '', '', '', '业务网SEP服务', '116.102.1.10', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99HHA95', '', '', 'IBM', '', '137.102.1.3', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99K3037', '', '', '', '综合管理系统', '无', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99K3050', '', '', '', '圈存系统', '32.17.224.214', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99K3079', '', '', '', '外汇卡系统', '116.40.1.40', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99KH947', '', '', '', '综合管理系统', '116.40.1.218', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99KL111', '', '', '', '业务网日志服务器', '192.168.0.7', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99KZR62', '', '', '联想', '', '137.120.1.12', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99LDL95', '', '', 'IBM', '', '58.1.239.222', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99N3450', '', '', '', '同城票据交换系统', '124.1.1.7', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99P5868', '', '', '', '考试系统及测评系统', '124.1.128.4', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99P7058', '', '', '', '外网终端服务', '192.168.0.4', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99R1410', '', '', '', '手工同城票据交换系统', '116.160.1.87', '', '', '测试');
INSERT INTO `equipment_monitor` VALUES ('99t9105', '', '', '', '业务网SEP服务器', '116.40.1.195', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99t9383', '', '', '', 'VRV业务', '116.129.1.174', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99t9600', '', '', '', '支票影像系统', '116.40.1.190', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99T9643', '', '', '', '文件传输系统', '32.17.224.36', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99t9807', '', '', '', '外网终端服务器', '116.40.1.132', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99t9817', '', '', '', '办公网SEP服务器', '116.40.1.133', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99t9820', '', '', '', '业务网终端服务器主机', '116.40.1.131', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99t9935', '', '', '', '支票影像系统', '116.40.1.191', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99t9936', '', '', '', 'VRV业务', '116.40.1.174', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99TFDVO', '', '', '联想', '', '137.192.1.3', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99TFDVZ', '', '', '联想', '', '137.192.1.2', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99W5617', '', '', '', '会计影像系统', '116.40.1.147', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('99W6349', '', '', '', '会计影像系统', '116.40.1.148', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('99X3936', '', '', 'IBM', '', '137.58.1.219', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99X3955', '', '', '联想', '', '137.120.1.22', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99X4261', '', '', '联想', '', '137.120.1.20', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99X4703', '', '', '联想', '', '137.120.1.21', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99X4839', '', '', 'IBM', '', '137.1.1.219', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99X4899', '', '', '联想', '', '137.120.1.23', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99Y2829', '', '', 'IBM', '', '137.1.192.93', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('99Y2905', '', '', 'IBM', '', '137.1.192.91', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('BDF110346C', 'hxbweb-db2', '', '', '网站门户系统', '108.201.147.142', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('BDF110346E', 'hxbweb-db1', '', '', '网站门户系统', '108.201.147.141', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('C82500933k31070', '', '', '奇智', '', '137.1.1.114', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN7150151N', '', '', '', '分行集中式自助银行前置系统', '124.1.1.14', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN721209HY', '', '', '', '分行集中式自助银行前置系统', '124.1.1.10', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN72120D0N', '', '', '', '分行集中式自助银行前置系统', '124.1.1.12', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN761201GW', '', '', '联想', '', '58.1.239.234', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN76240181', '', '', '', '防火墙日志系统', '48.1.224.122', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN7649042Y', '', '', '联想', '', '137.120.1.11', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN76490437', '', '', '联想', '', '192.168.239.218', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CN771201S6', '', '', '联想', '', '137.1.1.129', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG016S371', '', '', '', '瘦客户机服务器', '124.1.128.28', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG016S372', '', '', '', '瘦客户机服务器', '124.1.128.29', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG241SFV8', '', '', '', '支票影像系统', '124.1.1.18', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG241SFV9', 'HPDL380G7', '', '', '日照同城票交系统', '124.1.1.21', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG241SFW7', '', '', '', '支票影像系统', '124.1.1.17', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG243TH5F', 'HPDL380G7', '', '', '日照同城票交系统', '124.1.1.20', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG243TH5Z', 'HPDL380G7', '', '', '日照同城票交系统', '124.1.1.26', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG651S1KM', '', '', '', '分行OA系统', '124.1.128.7', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG704SZCM', '', '', '', '一体化运维平台', '124.1.1.32', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG712S0C0', '', '', '', '网管系统', '124.192.1.2', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG715S1FJ', '', '', '', '支票影像系统', '124.1.1.74', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG715S1GD', '', '', '', '支票影像系统', '124.1.1.73', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG715SOPN', '', '', '', '网管平台', '116.192.1.12', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('CNG732S0P8', '', '', '', 'windows补丁系统', '124.1.192.9', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG732SOP7', '', '', '', '会计综合管理系统', '124.1.1.31', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG750S3D6', '', '', '', '会计综合管理系统', '124.1.1.30', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S1D2', '', '', '联想', '', '137.1.1.188', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S1HP', '', '', '联想', '', '137.58.1.6', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2JS', '', '', '', '文件传输系统', '124.1.1.40', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2JT', '', '', '', '瘦客户机服务器', '124.1.128.25', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2JV', '', '', '', '外汇卡前置', '124.1.1.50', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2KJ', '', '', '', '外汇卡前置', '124.1.1.49', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2KM', '', '', '', '瘦客户机服务器', '124.1.128.20', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2KV', '', '', '', '瘦客户机服务器', '124.1.128.21', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2L0', '', '', '', '电子验印系统', '124.1.1.51', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2L2', '', '', '', '瘦客户机服务器', '124.1.128.23', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2LC', '', '', '', '瘦客户机服务器', '124.1.128.24', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG804S2LT', '', '', '', '瘦客户机服务器', '124.1.128.22', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG808S125', '', '', '联想', '', '137.192.1.88', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG808S12J', '', '', '联想', '', '192.168.1.228', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG815S3C5', '', '', '', '网络日志系统', '48.1.224.151', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG816S1ND', '', '', '', '电子验印系统', '124.1.1.38', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG920S2F4', '', '', '', '总行OA系统', '124.129.1.11', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG920S2FB', '', '', '', '总行OA系统', '124.129.1.12', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG929S3JB', '', '', '', '分行集中式自助银行前置系统', '124.1.200.17', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG929S3K1', '', '', '', '网络督查日志系统', '192.168.18.12', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG942S18T', '', '', '', '互联网防病毒系统', '192.168.1.6', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG942S18V', '', '', '', '办公网防病毒系统', '124.102.1.6', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG942S3BF', '', '', '', '特色业务管理机', '124.1.1.15', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('CNG942S3BG', '', '', '', '特色业务管理机', '124.1.1.66', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('D6FMMY1', '', '', '', '淳化市场MIS POS', '116.40.1.20', '', '', '备份');
INSERT INTO `equipment_monitor` VALUES ('D6FNCV4', '', '', '', '网管平台冷备机', '116.40.1.21', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('D6PGCP6', '', '', '', '自助回单服务', '116.40.1.71', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('D6XAW23', '', '', '', '', '116.40.1.25', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('D6XNXR2', '', '', '', '', '116.40.1.78', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('DSY0123', 'portal03', 'IBM Flex System x240 -[8737AC1]-', 'IBM', '综合信息管理系统', '102.144.3.19', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('J31B0BR', '', '', 'IBM', '', '137.1.1.63', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('J320N68', '', '', '', '', '124.1.192.54', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('J324VWC', '', '', '', '', '124.1.192.56', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('J324VWD', '', '', '', '', '124.1.192.55', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NA15158321', '', '', 'IBM', '', '137.1.192.90', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NA15158322', '', '', '联想', '', '137.120.1.16', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NA15158325', '', '', '联想', '', '137.105.1.112', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC00482809', '', '', 'IBM', '', '137.1.192.94', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC00956444', '', '', '联想', '', '137.1.1.84', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01231897', '', '', '联想', '', '137.60.1.27', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01231898', '', '', '联想', '', '137.1.1.151', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01312126', '', '', '联想', '', '137.60.1.28', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01356242', '', '', '联想', '', '137.1.1.48', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01359995', '', '', '联想', '', '137.1.1.47', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01379354', '', '', '联想', '', '137.1.1.46', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01379420', '', '', '联想', '', '137.1.1.18', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01409678', '', '', 'IBM', '', '137.1.1.38', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01894685', '', '', '联想', '', '137.120.1.13', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('NC01894687', '', '', '联想', '', '137.120.1.16', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('O6WHGT4', '', '', '', '自助填单系统', '116.40.1.78', '', '', '生产');
INSERT INTO `equipment_monitor` VALUES ('SA04413991', '', '', '联想', '', '137.120.1.50', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA08201491', '', '', '联想', '', '137.120.1.13', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA12826871', '', '', '联想', '', '137.105.1.111', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA13546909', '', '', '联想', '', '137.120.1.80', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA13546916', '', '', '联想', '', '137.120.1.52', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA13546945', '', '', '联想', '', '无IP', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA13546968', '', '', '联想', '', '137.120.1.15', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SA5300651', '', '', '联想', '', '137.1.1.77', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SJY0362140', 'beaiygtjmap2', 'SJY36', '', 'BEAI系统', '102.81.18.11', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('SJY360120013', 'beaiygtjmap1', 'SJY36', '', 'BEAI系统', '102.81.18.10', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 06 3d c9 a5 f2 19-4b 20 cf 2b dc 4f f4 eb', 'sjyhwebjr2', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.131', '172.16.67.131', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 07 bf b8 d3 76 6c-f4 12 2f ba 25 bc 6e 0e', 'sjyhapp2', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.131', '172.16.68.131,192.168.252.50', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 08 08 cf 15 76 e2-59 6e 03 27 7c 4c 62 87', 'sjyhpic1', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.140', '172.16.67.140', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 08 e1 2f de 89 23-3b c9 c2 11 08 08 fe f0', 'wx-interceptor-d', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.82', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 09 b6 e0 e8 7b 18-64 a3 84 01 2e 5d c2 84', 'wx-outweb-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.67.43', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 0a 8b 3d 19 a8 ca-c1 42 04 12 db 59 a1 7b', 'wx-mng-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.56', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 0c 12 db c2 e9 45-de 8a 45 49 7f 8c a5 65', 'tjwx-app-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.69', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 0d ea 43 c2 3b 16-5a 3b 22 81 0f 77 02 cd', 'wx-fhtx2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.97,192.168.252.32', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 0e bc 0e 55 c3 57-45 fd 4d 93 ed 46 4e f8', 'znzxkfweb1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.32', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 0f 1a 73 8f b9 f6-44 09 b4 ef 70 48 73 19', 'tjwx-timer-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '10.1.8.37,172.16.68.73,172.16.68.71', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 12 51 62 ba 8c 32-8a 1f 1b 01 e6 97 ea 69', 'zctgkfptweb2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.81', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 16 b0 cf db dc c3-9e b8 d2 2e de 7c c4 5f', 'mposmppdl1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.24', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 1c 30 cb 58 42 6a-9b c6 27 5f 76 84 00 ca', 'dsxtweb2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.65', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 1e 79 a2 55 18 87-9e 6a f8 1f 32 4e 9f d6', 'dsxtweb7', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.68', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 29 9c 01 1b ec 4a-a1 ff 9c a3 10 88 e1 fe', 'sjyhapp7', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.136', '172.16.68.136,192.168.252.55', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 2b ef 05 58 b5 01-c3 5e 88 23 22 ef 54 43', 'wx-interceptor-f', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.84', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 2e c1 11 d2 1b 54-fc 39 57 69 d7 bb 8b 62', 'sjyhwebjr6', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.135', '172.16.67.135', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 2f a1 ca 27 e6 9f-68 1d 9a 15 3c f2 86 4b', 'wx-gateway-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.50', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 33 2a ba e0 82 35-f1 d9 f2 88 cd 2a db 0b', 'sjyhapp6', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.135', '172.16.68.135,192.168.252.54', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 35 5c f1 c3 72 26-63 6f d7 5f 1d 2b cb 0b', 'sjyhmem4', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.145', '172.16.68.145,192.168.252.64', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 38 0e 3a e4 48 6e-9c 87 56 0b 08 5d 65 d5', 'wx-interceptor-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.79', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 39 34 48 0d 99 b9-f6 b9 bb 35 f8 75 fe 1d', 'sjyhcj1', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.142', '172.16.67.142', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 39 ae bc a5 ad eb-7c 21 40 7b 80 ef 5c 06', 'sjyhwebjr3', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.132', '172.16.67.132', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 3c 8b 12 fd 1f ce-02 f7 c7 d1 41 a9 61 0f', 'sjyhcj2', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.143', '172.16.67.143', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 41 9e 19 92 76 07-d4 e7 13 59 1b 39 fb d6', 'bjwx-timer-1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.94', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 45 14 f1 aa 82 3a-7b 73 ee c7 7a ba 20 9c', 'sjyhpic2', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.141', '172.16.67.141', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 49 cb 49 d1 b5 d1-02 f2 4c 64 be 5d 14 90', 'wx-promoteweb-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.87', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 4c 95 cc 11 61 b9-be a4 4a 02 18 d5 35 2b', 'dsxtweb8', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.69', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 50 e3 70 e9 8f 7e-fd bc 55 fa 10 6f 5e c7', 'wx-interceptor-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.80', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 51 a2 de 4c de 29-75 3a 41 6d d7 ea f8 7c', 'sjyhapp3', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.132', '172.16.68.132,192.168.252.51', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 54 d1 61 f6 bb 0c-c0 4b e4 19 0a a8 d9 e9', 'sjyhapp5', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.134', '172.16.68.134,192.168.252.53', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 55 36 1d 1c a1 86-fc f9 36 6f f1 eb 78 7f', 'sjyhapp10', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.139', '172.16.68.139,192.168.252.58', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 57 0f 8d a0 f3 3f-d9 a2 ae e3 ee 1f f6 f8', 'sjyhmg2', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.141', '172.16.68.141,192.168.252.60', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 59 ad b3 a9 fd bb-a5 ac 85 4d e8 eb 28 63', 'sjyhwebjr10', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.139', '172.16.67.139', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 5c 4f 46 4b 71 11-65 05 75 11 9a 5b ec 57', 'sjyhmem2', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.143', '172.16.68.143,192.168.252.62', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 5c 6e fb ed 12 f0-aa 5d 51 fc ed c5 0d 8c', 'wx-gateway-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.51', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 5c a8 2f 3a 0f 29-0b ed 07 50 66 7c e5 cb', 'czgrwyweb2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.64.83', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 5d 0b b2 79 90 35-b7 9b 26 4c fe 2a b4 f5', 'mposmppdl2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.25', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 5e 3f 87 70 f0 04-cc ef 52 c8 d6 55 73 a7', 'sjyhapp9', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.138', '172.16.68.138,192.168.252.57', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 5f a3 18 c9 72 bb-8b 9e aa dc b8 66 92 eb', 'wx-promoteweb-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.85', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 61 50 c1 a1 58 6f-6e 79 90 8b 32 b1 35 f5', 'wx-timer-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '10.1.8.33,172.16.68.65,172.16.68.66', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 66 f1 28 91 8b 8d-99 30 3e e9 25 a7 ab ea', 'sjyhmg1', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.140', '172.16.68.140,192.168.252.59', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 69 1b d9 60 20 4e-f1 f9 8e 72 67 8e 1d de', 'zctgkfptweb1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.80', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 6c 37 c4 02 0c c8-ae 79 25 85 d7 4b df f6', 'wx-redis-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.90', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 6e 78 14 45 b3 ab-70 28 e8 a3 c3 b4 6a 00', 'sjyhwebjr1', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.130', '172.16.67.130', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 71 88 40 f4 cf 07-12 71 2a 5e 4a f6 47 e8', 'wx-promoteweb-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.86', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 72 00 c2 e7 83 54-a8 1e d0 49 7d 7d cb f4', 'wx-interceptor-e', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.83', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 72 89 32 35 7f f6-cf a2 27 5b 2e 29 ac e2', 'sjyhapp8', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.137', '172.16.68.137,192.168.252.56', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 7a c5 ed b2 77 e3-da 3d f7 0a e5 08 49 51', 'yqzq1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.63.32', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 7c 18 95 cc f1 56-8d 84 47 d8 cc 95 2f ee', 'tjwx-app-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.70', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 7c 9d 18 b0 94 1b-d0 74 15 c4 65 6c e3 c8', 'bjwx-timer-2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.95', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 7c a9 ae c0 aa df-52 54 1b 66 97 54 8d c9', 'wx-inweb-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.67.40', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 7d a6 89 02 9e fd-17 d1 0f 98 5b 9d ea 12', 'hjwwtx1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.40', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 84 8a 3e 23 e4 47-f1 19 dd cf d4 b1 e2 ca', 'wx-inweb-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.67.42', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 89 ca 5d dc 70 a4-91 22 4f ec 1b 33 b3 9e', 'sjyhmem3', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.144', '172.16.68.144,192.168.252.63', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 8a 51 57 af d8 d2-a0 84 4b 9c 88 18 a7 66', 'tjwx-timer-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '10.1.8.36,172.16.68.72', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 8a 93 37 02 2a 31-0a ab 0f 37 70 78 a5 ad', 'esbwwcs1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.63.24', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 92 01 c9 4b 09 3a-fe b1 5b c0 68 81 95 43', 'wx-pwxweb-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.53', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 94 99 cc 29 8b 20-b7 66 07 1b e3 94 17 47', 'dsxttp2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.71', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 99 a6 f0 0e e9 6a-d6 66 4f 1c 3d d9 95 d0', 'sjyhwebjr7', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.136', '172.16.67.136', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 9e ec 42 a3 17 e7-1e f8 40 4e bc 3b 6a f8', 'czgrwyweb1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.64.82', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 a2 a5 9b fc 70 51-10 47 9f 31 e5 c8 05 b5', 'wx-mng-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.57', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 a4 42 e5 33 ea ab-aa 8a 24 e5 64 9b e9 94', 'wx-fhtx1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.96,192.168.252.31', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 a5 9a d7 f2 69 79-2a 86 88 81 a3 e0 dd b3', 'wx-promoteweb-d', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.88', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 ab fa 3b 90 9f ec-f4 6b 40 ba 27 4e b1 1a', 'wx-redis-a', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.89', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 ad 40 ba 6c 1f 0b-78 30 f1 ed 0f cc b3 cd', 'sjyhwebjr9', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.138', '172.16.67.138', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 b0 da 43 af b1 04-a7 e2 5d 45 70 5e 9b d0', 'sjyhapp1', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.130', '172.16.68.130,192.168.252.49', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 b2 23 f2 7b 41 bc-6a 52 08 ad 6d c1 16 0d', 'dsxtweb1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.64', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 b7 f2 4a ce 13 b8-c9 c7 ff 3f 33 10 8d 8b', 'wx-pwxweb-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.55', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 bd 68 6f 43 dd 74-55 46 14 d5 40 9f f3 8a', 'wx-interceptor-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.81', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 be 74 84 f3 e7 3c-a4 ae 86 3a 86 1d 92 08', 'sjyhwebjr4', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.133', '172.16.67.133', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 c7 68 b3 d8 c1 37-ad 7d fa d8 0c 7e f4 e1', 'sjyhapp4', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.133', '172.16.68.133,192.168.252.52', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 cc 04 a2 80 5c ed-a3 1a 32 76 7d 77 5d 92', 'sjyhmem1', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.68.142', '172.16.68.142,192.168.252.61', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 cc 0a 19 e6 ef bd-37 96 2b ca a5 34 6d 5c', 'sjyhwebjr5', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.134', '172.16.67.134', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 d1 c9 c5 ec db 9d-28 0b 36 20 1f e2 0b 32', 'sjyhwebjr8', 'VMware Virtual Platform', 'VMware, Inc.', '手机银行系统', '108.201.67.137', '172.16.67.137', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 d7 b5 85 54 8e d0-cd 2e ec 18 71 49 94 0e', 'hjwwtx2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.41', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 dc 29 d6 b4 3d 69-4a 08 64 28 62 d3 94 fc', 'dsxtweb4', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.67', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 e3 aa 63 a8 d2 c8-9d 26 bc ee 61 38 a1 2e', 'wx-gateway-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.52', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 e5 43 ca 14 c5 80-1a 15 66 d2 c2 8a e1 24', 'wx-inweb-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.67.41', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 e7 ec 02 b7 94 aa-40 d7 fd cd f7 e8 d1 85', 'znzxkfweb2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.33', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 e8 60 89 2c 21 a7-ae e1 fa 4a ed 03 d3 c9', 'dsxtweb3', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.66', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 ea 73 18 c3 78 03-9c ea 1b 2a f2 a4 b4 e4', 'wx-outweb-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.67.44', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 ea d6 13 c8 25 83-09 ce 0d c7 28 16 f9 a1', 'wx-redis-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.91', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 ea e2 15 da 0b dc-2d bf 90 a9 59 bb 00 fb', 'bjwx-app-1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.92', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 f3 34 3d 94 d3 e3-6a fe 48 3e 9a ff 90 2e', 'bjwx-app-2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.93', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 f6 44 c8 7f f9 a4-71 fc 55 df 13 ab 50 0e', 'wx-timer-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '10.1.8.34,172.16.68.67', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 f7 b8 3d f3 3b 52-2b da d3 39 5c 66 25 60', 'dsxttp1', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.62.70', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 fa e6 ae ad 47 57-9a 90 a4 c1 aa ba f1 ba', 'yqzq2', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.63.33', '', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 fc 13 14 b2 00 93-6f db 9c ce c9 46 b0 73', 'wx-outweb-c', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.67.45', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 18 fd 54 3a 62 01 47-0c 27 2b 58 61 ab 04 e8', 'wx-pwxweb-b', 'VMware Virtual Platform', 'VMware, Inc.', '', '', '172.16.68.54', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 00 99 af 64 d0 a2-3d ff d4 36 6a 67 5a 54', 'omnibus1', 'VMware Virtual Platform', 'VMware, Inc.', '一体化运维管理系统', '102.80.8.30', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 01 07 5e 96 0c 10-5d 96 e1 ce c6 8b 54 90', 'irbtengineb', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.23', '102.96.249.19', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 06 53 6c 4b 0f 65-e8 44 4e ff dd df 62 8e', 'wlapp6', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.227', '102.200.164.95,102.96.248.21', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 07 1f 68 bb 07 91-94 b4 17 06 f4 fb 83 eb', 'czzwapp2', 'VMware Virtual Platform', 'VMware, Inc.', '村镇指纹授权系统', '102.200.6.26', '102.64.1.250', '422', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 0a 02 34 d3 b0 a4-54 67 29 00 92 f4 83 26', 'irbtmanageb', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.26', '102.96.249.22', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 13 fc ed df 5e b2-a4 a9 01 0a a6 aa 50 3a', 'czzpjyapp2', 'VMware Virtual Platform', 'VMware, Inc.', '村镇诈骗系统', '102.200.6.36', '102.200.7.54,102.64.1.85', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 1b a0 84 d6 0a a0-6f 7b 39 49 94 53 87 7a', 'wlyywggk1', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.228', '102.96.248.22', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 21 f1 f1 b9 9e 4c-fa 16 ab 95 f1 19 ec 6b', 'czzpjyweb1', 'VMware Virtual Platform', 'VMware, Inc.', '村镇诈骗系统', '102.200.6.33', '102.200.7.51,102.64.1.82', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 23 16 94 cd e9 28-72 a1 70 c3 61 55 d7 1c', 'czzwapp1', 'VMware Virtual Platform', 'VMware, Inc.', '村镇指纹授权系统', '102.200.6.25', '102.64.1.249', '422', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 2a cf fc 78 8f 69-c0 ac bb 8c c3 80 ff 23', 'zfrzaqkkapp2', 'VMware Virtual Platform', 'VMware, Inc.', '支付融资系统', '102.200.3.214', '108.201.4.111', '422', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 34 82 7b a0 59 0f-24 e1 c3 71 08 ed a4 6b', 'dzypapp2', 'VMware Virtual Platform', 'VMware, Inc.', '抵质押品', '102.200.163.82', '102.200.164.68,102.96.19.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 39 4a 00 ec 13 a3-2f 9c c9 eb b6 7d 95 09', 'irbtenginea', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.22', '102.96.249.18', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 43 af 27 f7 3b 3d-e9 c9 ae 4c 4a 0c f2 df', 'dzypapp1', 'VMware Virtual Platform', 'VMware, Inc.', '抵质押品', '102.200.163.81', '102.200.164.67,102.96.19.16', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 4e 06 d5 8f f4 0f-c7 03 66 ef 3a 24 cf f3', 'glkjbb2', 'VMware Virtual Platform', 'VMware, Inc.', '管理会计', '102.200.163.98', '102.200.164.66,102.96.12.49', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 54 29 fe 77 44 2d-7a d7 2c 95 f6 c3 ce 92', 'zfrzaqkkapp1', 'VMware Virtual Platform', 'VMware, Inc.', '支付融资系统', '102.200.3.213', '108.201.4.110', '422', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 55 c7 15 be 63 39-32 26 28 44 26 e5 e4 be', 'qysjgkap2', 'VMware Virtual Platform', 'VMware, Inc.', '数据管控', '102.200.163.143', '102.200.164.97,102.96.6.110', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 58 45 79 c6 6a 92-00 be 84 5a 95 d9 0b 20', 'wlapp4', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.225', '102.200.164.93,102.96.248.19', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 5a 97 5f c8 c9 f4-fd 40 47 83 5c 7f 0b 0b', 'mbondapp01', 'VMware Virtual Platform', 'VMware, Inc.', '国债系统', '102.200.163.89', '102.96.15.16', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 5a 9f b1 3b 3b d6-f5 6e be 62 10 e2 b4 6a', 'czfxqmh1', 'VMware Virtual Platform', 'VMware, Inc.', '村镇银行门户和反洗钱系统', '102.200.6.20', '102.200.7.40,102.64.1.238', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 5c 59 4a 4d bc 7a-e6 de b5 3a cd bd 70 b2', 'wlmq1', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.163.127', '102.96.248.32', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 5d 06 26 73 e2 0c-05 62 71 8a 56 d0 67 b1', 'bbptapp1', 'VMware Virtual Platform', 'VMware, Inc.', '综合报表系统', '102.200.163.122', '102.200.164.77,102.96.6.29', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 5f 0c 73 b3 8a 33-9e 7c 55 49 4a eb 5a 84', 'wlyywggk2', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.229', '102.96.248.23', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 5f 58 e3 53 f5 0c-e2 d0 bd 72 4c 71 25 2a', 'irbtmanagea', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.25', '102.96.249.21', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 61 59 d0 4a 82 54-ee 14 78 1c e9 62 3d 69', 'east2app1', 'VMware Virtual Platform', 'VMware, Inc.', '合规风险监测', '102.200.163.131', '102.200.164.84,102.96.6.107', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 62 61 b5 07 75 ad-a0 59 5a 79 63 c3 98 4d', 'bbptapp3', 'VMware Virtual Platform', 'VMware, Inc.', '综合报表系统', '102.200.163.124', '102.200.164.79,102.96.6.31', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 68 17 2d 45 88 8b-7b 90 22 75 3b f1 f3 89', 'htglapp2', 'VMware Virtual Platform', 'VMware, Inc.', '合同管理系统', '102.200.163.75', '102.200.164.76,102.96.18.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 69 ad 8d 5c 61 4a-da bc 3c a0 7b f4 f8 59', 'mbondapp02', 'VMware Virtual Platform', 'VMware, Inc.', '国债系统', '102.200.163.90', '102.96.15.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 6a 8d de d7 6d 19-25 bd e3 92 90 45 b5 da', 'htglapp1', 'VMware Virtual Platform', 'VMware, Inc.', '合同管理系统', '102.200.163.74', '102.200.164.75,102.96.18.16', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 70 59 39 d9 1c 38-62 18 7c 94 b4 6d dc bb', 'bbptapp2', 'VMware Virtual Platform', 'VMware, Inc.', '综合报表系统', '102.200.163.123', '102.200.164.78,102.96.6.30', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 74 8b 21 02 7b 0d-43 ef a7 68 6a 95 64 a7', 'sjcklhcx1', 'VMware Virtual Platform', 'VMware, Inc.', '数据仓库系统', '102.200.163.100', '102.200.164.73,102.96.6.96', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 7f a8 58 12 ed 0e-f7 47 f7 60 16 ee b2 92', 'mposmppap1', 'VMware Virtual Platform', 'VMware, Inc.', 'MPOS系统', '102.200.163.50', '102.200.164.86,102.96.251.16', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 83 85 f9 7c 92 cf-63 78 9c 56 5f 99 a6 7b', 'east2app2', 'VMware Virtual Platform', 'VMware, Inc.', '合规风险监测', '102.200.163.132', '102.200.164.85,102.96.6.108', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 84 e9 01 e7 c1 e4-c1 d8 67 e3 42 45 1d 51', 'qysjgkap1', 'VMware Virtual Platform', 'VMware, Inc.', '数据管控', '102.200.163.142', '102.200.164.96,102.96.6.109', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 8c f4 19 d0 54 66-46 60 91 2e 06 0d 50 4d', 'mposmppap4', 'VMware Virtual Platform', 'VMware, Inc.', 'MPOS系统', '102.200.163.53', '102.96.251.19,102.200.164.99', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 94 7d 66 88 a3 a0-ff dc 22 54 43 7b 85 1f', 'irbtenginec', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.24', '102.96.249.20', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 94 8d d4 f7 a3 22-c7 dc 9e f7 01 bc 84 d9', 'eastsjzlap1', 'VMware Virtual Platform', 'VMware, Inc.', 'EAST数据质量校验系统', '102.200.163.145', '102.96.6.111', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 94 a0 da 8f 83 5c-70 3d 83 23 eb 21 1d c6', 'czzpjyapp1', 'VMware Virtual Platform', 'VMware, Inc.', '村镇诈骗系统', '102.200.6.35', '102.200.7.53,102.64.1.84', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 96 7d ce 45 62 cd-34 af 1e 9c e3 ff 87 6b', 'irbtfronta', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.20', '102.96.249.16', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 98 84 98 6e eb 20-aa c0 6d df 46 fe 24 b9', 'glkjbb1', 'VMware Virtual Platform', 'VMware, Inc.', '管理会计', '102.200.163.97', '102.200.164.65,102.96.12.48', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 9b 08 eb 16 ce 61-b9 e9 19 db 46 46 69 29', 'czfxqmh2', 'VMware Virtual Platform', 'VMware, Inc.', '村镇银行门户和反洗钱系统', '102.200.6.21', '102.200.7.41,102.64.1.239', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c 9b 73 e3 5c 11 e2-a4 21 73 bf f0 99 8a 1a', 'wlapp3', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.224', '102.200.164.92,102.96.248.18', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c a0 c1 f1 b9 65 ab-f1 65 96 60 28 49 3e 50', 'omnibus2', 'VMware Virtual Platform', 'VMware, Inc.', '一体化运维管理系统', '102.80.8.31', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c a2 92 65 76 47 d8-f5 cd aa 69 40 84 83 73', 'sjckdd3', 'VMware Virtual Platform', 'VMware, Inc.', '数据仓库系统', '102.200.163.115', '102.96.6.25', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c aa 7a 2a 2a 5f 8b-49 87 0e 6a cb 18 c1 c8', 'bondapp02', 'VMware Virtual Platform', 'VMware, Inc.', '国债系统', '102.200.163.92', '102.200.164.58,102.96.15.19', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c ac 50 d1 b9 6f 50-79 d8 68 6d b3 9b 92 10', 'wlmq2', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.163.128', '102.96.248.33', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c b3 b5 bf 52 f9 9a-d5 9c 27 c6 db 2a 3f 04', 'znzxkfapp1', 'VMware Virtual Platform', 'VMware, Inc.', 'Call Center系统', '102.200.163.78', '102.96.249.32', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c b6 28 db 19 4b 93-fb 7e 5b 70 49 fa d1 80', 'lclweb3', 'VMware Virtual Platform', 'VMware, Inc.', '理财系统,基金代销,银保通,中间业务', '102.200.163.47', '102.200.164.34,102.96.7.28', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c b6 34 9e 2a 10 5d-ef b5 c3 a0 45 73 2e 0d', 'sjcklhcx2', 'VMware Virtual Platform', 'VMware, Inc.', '数据仓库系统', '102.200.163.101', '102.200.164.74,102.96.6.97', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c bb d2 79 73 21 71-9f 3a ac 70 52 3c 88 14', 'czbancsjk', 'VMware Virtual Platform', 'VMware, Inc.', '一体化运维管理系统', '102.80.8.53', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c c8 81 6d 40 45 be-c2 29 cb 92 09 c3 e1 58', 'czzpjyweb2', 'VMware Virtual Platform', 'VMware, Inc.', '村镇诈骗系统', '102.200.6.34', '102.200.7.52,102.64.1.83', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c ca 2b f7 af 1f 9e-ec ae 5c 6e 72 b6 45 ef', 'eventcenter', 'VMware Virtual Platform', 'VMware, Inc.', '一体化运维管理系统', '102.80.8.57', '', '433', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c ce 16 ca 4e 8a 75-09 94 15 76 d0 24 4b 87', 'glkjapp1', 'VMware Virtual Platform', 'VMware, Inc.', '管理会计', '102.200.163.95', '102.200.164.63,102.96.12.46', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c ce e2 d0 f8 03 c4-a3 8f e1 ea 3a 19 d6 9f', 'wlapp1', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.222', '102.200.164.90,102.96.248.16', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c d1 02 10 18 71 61-4a de 5c 1d d7 c0 69 67', 'wlapp5', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.226', '102.200.164.94,102.96.248.20', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c d3 fe 1a e8 bf a6-9d 64 8b f4 88 c8 f1 84', 'mposmppap2', 'VMware Virtual Platform', 'VMware, Inc.', 'MPOS系统', '102.200.163.51', '102.200.164.87,102.96.251.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c e2 3f a4 6d fc f9-75 be a7 33 bd bc 1b 74', 'bondapp01', 'VMware Virtual Platform', 'VMware, Inc.', '国债系统', '102.200.163.91', '102.200.164.57,102.96.15.18', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c e5 2b 6a b6 68 4f-65 6f c0 99 1d 05 4a 00', 'irbtfrontb', 'VMware Virtual Platform', 'VMware, Inc.', '智能机器人系统', '102.200.163.21', '102.96.249.17', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c e8 ac 3f 96 fe 98-6f a2 45 a1 5c 1a 27 71', 'wlapp2', 'VMware Virtual Platform', 'VMware, Inc.', '外联应用网关系统', '102.200.160.223', '102.200.164.91,102.96.248.17', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c ed 5f d3 69 b8 47-c6 77 f4 02 78 3d c7 4a', 'mposmppap3', 'VMware Virtual Platform', 'VMware, Inc.', 'MPOS系统', '102.200.163.52', '102.96.251.18,102.200.164.98', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c f0 cf ad a9 cb 64-31 b6 63 a1 f8 37 7e 80', 'lclweb4', 'VMware Virtual Platform', 'VMware, Inc.', '理财系统,基金代销,银保通,中间业务', '102.200.163.48', '102.200.164.35,102.96.7.29', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 1c fc 27 64 92 02 bd-9d 1a c2 0e 7c 4c d3 04', 'glkjapp2', 'VMware Virtual Platform', 'VMware, Inc.', '管理会计', '102.200.163.96', '102.200.164.64,102.96.12.47', '434', '');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c 00 03 e5 e3 a6 d6-19 e8 70 6b af 40 47 e1', 'tops1.localdomain', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.1.31', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c 48 67 4f 11 71 5e-be a7 34 d1 b7 57 5e 37', 'jxkh', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.1.70', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c 66 bb 35 75 c9 89-82 d1 2b 9e 1a cb fc 71', 'fhlylx', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.1.64', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c 74 07 20 ad 3f d3-ed 56 f3 ee 81 96 2f 18', 'sent', 'VMware Virtual Platform', 'VMware, Inc.', '支付融资系统', '149.1.1.45', '', '725', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c 8f 67 ae ad 48 87-d2 ea d4 77 8c 06 40 9c', 'oaserver', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.128.11', '149.1.128.14', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c 9c fe 3e 71 04 84-be 1e 36 d2 da 97 78 9e', 'jxkh', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.1.71', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c a9 3a c8 6a 32 28-ab 83 79 ff 21 21 59 7c', 'hxbhk_64', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.192.2', '192.168.122.1', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c f5 13 c2 08 14 60-a8 ed 9c 97 b5 45 58 34', 'tops2.localdomain', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.1.32', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 2c fc 6c 11 f5 ed a1-0c 15 dc d5 26 3d 29 58', 'oaserver', 'VMware Virtual Platform', 'VMware, Inc.', '', '149.1.128.12', '149.1.128.16', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 05 45 25 e6 9b ee-9b d4 1a c1 20 b5 dd c0', 'sjyhapp5', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.195', '172.16.68.134', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 09 88 d2 97 eb f1-f2 04 3f 4e fb c9 38 80', 'sjyhapp10', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.200', '172.16.68.139', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 0d 68 bb e1 50 7c-53 6d 20 43 b8 65 e9 23', 'xsqhjjy1', 'VMware Virtual Platform', 'VMware, Inc.', '黄金买卖系统', '110.200.2.166', '102.101.3.32,110.200.130.64', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 0f 02 61 23 7f 1d-fc cb d7 10 66 86 02 dd', 'sjyhmem2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.204', '172.16.68.143', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 0f 82 e4 0a c6 38-ec c9 5b a8 4e 16 16 94', 'sjyhapp8', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.198', '172.16.68.137', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 17 d6 05 f3 1c ce-8b d0 d1 d3 5d 8a 3c 63', 'sjyhmem4', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.206', '172.16.68.145', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 1a ec 95 5e 35 02-9f 32 99 82 b1 fa a8 6f', 'sjyhxxts2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.137', '172.16.67.17', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 21 a1 28 29 61 75-6f c0 48 10 b7 e4 34 3e', 'sjyhtsapp1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.138', '172.16.67.18', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 22 14 08 b9 5c 15-52 6b 3f bb bd cf 1b d0', 'znzxkfweb1', 'VMware Virtual Platform', 'VMware, Inc.', 'Call Center系统', '110.200.6.179', '172.16.62.32', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 23 65 3c 37 0c 77-e5 ef e2 00 94 e7 03 25', 'xsqhjnwtx1', 'VMware Virtual Platform', 'VMware, Inc.', '黄金买卖系统', '110.200.2.158', '102.101.3.16', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 40 37 aa 4d cd de-88 3f 10 57 3a 31 cc 81', 'sjyhwebjr10', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.131', '172.16.67.139', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 41 7b b7 7e 63 e5-4c 8b 32 0a b9 c4 af c8', 'sjyhcj1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.134', '172.16.67.142', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 4a 27 05 c8 50 81-8a 9e 5b dc ac a1 87 77', 'sjyhwebjr2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.123', '172.16.67.131', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 4d 50 79 a9 55 37-fc da 55 b4 14 39 81 a3', 'sjyhcj2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.135', '172.16.67.143', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 51 7e fb 74 ec 88-63 55 84 45 2f b6 88 65', 'znzxkfapp1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备客服Call Center系统', '110.200.6.111', '102.96.249.32', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 6d f8 47 28 92 d3-c8 1c 4f f6 b9 b1 59 a4', 'sjyhwebjr1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.122', '172.16.67.130', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 6e 49 15 85 86 0a-63 a8 6e 7a a4 1d 06 8a', 'lclweb3', 'VMware Virtual Platform', 'VMware, Inc.', '理财-灾备', '110.200.6.75', '102.96.7.28', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 6e b8 57 47 74 6e-00 7c 05 df 82 fd 90 74', 'xsqhjjy2', 'VMware Virtual Platform', 'VMware, Inc.', '黄金买卖系统', '110.200.2.167', '102.101.3.33,110.200.130.65', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 84 87 8c 47 45 17-e1 cd 72 ba ac ef 68 9b', 'sjyhapp4', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.194', '172.16.68.133', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 87 b0 11 47 e9 ec-a2 26 c4 27 5e 51 04 ed', 'sjyhwebjr4', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.125', '172.16.67.133', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 90 87 85 f8 9e 98-ff 9b d3 98 f5 b7 54 be', 'sjyhapp1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.191', '172.16.68.130', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 91 79 f5 6c b9 c8-c0 74 ac e9 3e a5 a4 51', 'sjyhpic1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.132', '172.16.67.140', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 92 6f 7b 2c 33 49-a6 3a b0 76 fb 97 78 92', 'lclweb2', 'VMware Virtual Platform', 'VMware, Inc.', '理财-灾备', '110.200.6.74', '102.96.7.27', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 93 54 57 66 bb ca-a9 ea c1 5f cf 44 70 e9', 'sjyhapp2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.192', '172.16.68.131', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 93 c6 24 b2 7b d6-80 1e 38 df f0 c3 48 3b', 'sjyhwebjr5', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.126', '172.16.67.134', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 97 f3 86 5d a3 a7-7d 2f b0 8c 66 12 3a 9a', 'sjyhmg2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.202', '172.16.68.141', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 9f 14 15 e7 01 32-ba 65 c8 1a 1d 4b 1b fc', 'sjyhpic2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.133', '172.16.67.141', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 a1 a1 f3 cf 76 c1-ce df 3f 12 90 e6 ea ad', 'sjyhapp7', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.197', '172.16.68.136', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 a7 0d 5d 5b 66 3b-52 2f 0e 7e fc f7 2f 62', 'sjyhmg1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.201', '172.16.68.140', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 ad b1 02 26 c5 57-72 e7 b5 3c 00 cf e6 7c', 'sjyhwebjr7', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.128', '172.16.67.136', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 b1 ae ab 18 eb 1a-58 eb a6 89 f8 fa dc 1d', 'sjyhmem3', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.205', '172.16.68.144', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 b7 7f 3b bb 64 23-59 72 95 0c f8 9e b5 59', 'sjyhwebjr8', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.129', '172.16.67.137', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 b9 a5 94 b4 a9 07-1d 00 20 d1 ed e8 c2 5a', 'sjyhapp6', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.196', '172.16.68.135', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 b9 bb 12 0e 01 bf-42 ca 2e 34 9e 90 a6 71', 'sjyhapp9', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.199', '172.16.68.138', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 bb 14 57 41 7c 1f-d6 20 1b 9b 0b 28 fc 8c', 'lclweb1', 'VMware Virtual Platform', 'VMware, Inc.', '理财-灾备', '110.200.6.73', '102.96.7.26', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 bc 9a b5 e7 7d 9e-b8 b8 b5 81 25 e0 08 ad', 'sjyhwebjr9', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.130', '172.16.67.138', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 bd be 3e 58 c1 ad-60 4a fd 0d 9e 87 89 9f', 'sjyhtsapp2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.139', '172.16.67.19', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 c1 04 db 1c a5 d6-8d 50 32 1e fd be ea 99', 'hxzsk1', 'VMware Virtual Platform', 'VMware, Inc.', 'Call Center系统', '102.64.16.187', '110.200.6.175', '422', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 c5 fd 9e 5d dc 88-e4 fd e2 f7 56 f3 4e 7a', 'sjyhtsmng2', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.141', '172.16.68.28', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 c9 00 26 3f 70 d4-80 b6 ec 53 66 db ba 42', 'sjyhapp3', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.193', '172.16.68.132', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 cc 60 51 42 14 a5-e4 c1 99 45 b6 6e 0b 05', 'sjyhtsmng1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.140', '172.16.68.27', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 cf 74 3c a5 26 63-bf 74 34 80 08 0e 3f 93', 'xsqhjfk2', 'VMware Virtual Platform', 'VMware, Inc.', '黄金买卖系统', '110.200.2.163', '10.1.3.10,102.101.3.21', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 e4 02 15 14 93 e4-84 99 da 70 fe 91 10 13', 'znzxkfweb2', 'VMware Virtual Platform', 'VMware, Inc.', 'Call Center系统', '110.200.6.180', '172.16.62.33', '434', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 e7 01 88 99 2a ce-5c 9c 79 19 15 9b 8a 6e', 'sjyhxxts1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.136', '172.16.67.16', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 e8 43 d1 5b 81 fe-88 26 10 61 10 aa 6d 3e', 'sjyhwebjr3', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.124', '172.16.67.132', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 ea aa 8d 4c 4f 10-40 c1 f5 4f 62 c6 f8 c9', 'lclweb4', 'VMware Virtual Platform', 'VMware, Inc.', '理财-灾备', '110.200.6.76', '102.96.7.29', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 ec ce ba 97 23 4d-ff 27 3a 87 a0 c5 72 f2', 'xsqhjfk1', 'VMware Virtual Platform', 'VMware, Inc.', '黄金买卖系统', '110.200.2.162', '10.1.3.9,102.101.3.22,102.101.3.20', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 f0 79 ea 37 20 5d-c9 96 28 fd 8b a6 9f fd', 'sjyhwebjr6', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.127', '172.16.67.135', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 f2 34 87 0d 5d bc-ff 26 cc 92 ce b5 03 87', 'xsqhjnwtx2', 'VMware Virtual Platform', 'VMware, Inc.', '黄金买卖系统', '110.200.2.159', '102.101.3.17', '西三旗机房', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-42 35 fc 92 f7 1f 64 75-f6 e6 26 77 ff 07 20 5f', 'sjyhmem1', 'VMware Virtual Platform', 'VMware, Inc.', '同城灾备手机银行', '110.200.6.203', '172.16.68.142', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('VMware-56 4d 73 10 49 57 8b b4-f4 37 74 fc 15 be bf a1', 'orcl', 'VMware Virtual Platform', 'VMware, Inc.', '', '115.160.1.5', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('wt363cma02ew09030', 'beaijmap2', 'SJL05', '', 'BEAI系统', '110.19.1.165', '', '', '生产,灾备,准生产,开发,测试');
INSERT INTO `equipment_monitor` VALUES ('wt363cma02ew09039', 'beaijmap1', 'SJL05', '', 'BEAI系统', '110.19.1.166', '', '', '生产,灾备,准生产,开发,测试');

-- ----------------------------
-- Table structure for gtp_main_info
-- ----------------------------
DROP TABLE IF EXISTS `gtp_main_info`;
CREATE TABLE `gtp_main_info` (
  `nodename` varchar(48) DEFAULT NULL,
  `nodeip` char(15) DEFAULT NULL,
  `sysname` varchar(128) DEFAULT NULL,
  `apppeople` varchar(8) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gtp_main_info
-- ----------------------------
INSERT INTO `gtp_main_info` VALUES ('ZH_B2B_01        ', '108.201.1.37', 'B2B系统1机             ', '邬鹏', '13810322489');
INSERT INTO `gtp_main_info` VALUES ('ZH_B2B_02        ', '108.201.1.39', 'B2B系统2机           ', '邬鹏', '13810322490');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCSCLONE_01 ', '102.81.2.24', '核心克隆库 ', '董卫春', '13520515180');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCSCLONE_01 ', '102.81.2.24', '核心克隆库 ', '杨云', '13811591016');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_01      ', '102.81.2.19', '核心及核心卡2机            ', '董卫春', '13520515180');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_01      ', '102.81.2.19', '核心及核心卡2机            ', '杨云', '13811591016');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_02      ', '102.81.2.18', '核心及核心卡1机            ', '董卫春', '13520515180');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_02      ', '102.81.2.18', '核心及核心卡1机            ', '杨云', '13811591016');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_03      ', '102.81.2.20', '核心及核心卡3机         ', '董卫春', '13520515180');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_03      ', '102.81.2.20', '核心及核心卡3机         ', '杨云', '13811591016');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_04      ', '102.81.2.21', '核心及核心卡4机            ', '董卫春', '13520515180');
INSERT INTO `gtp_main_info` VALUES ('ZH_BANCS_04      ', '102.81.2.21', '核心及核心卡4机            ', '杨云', '13811591016');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAIJK_01     ', '102.81.17.8', 'BEAI监控系统', '刘家剑', '13426176932');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAIJK_01     ', '102.81.17.8', 'BEAI监控系统', '田海波', '13426170308');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_01       ', '102.81.4.32', '总行BEAI应用1机        ', '田海波', '13426170308');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_01       ', '102.81.4.32', '总行BEAI应用1机        ', '刘家剑', '13426176932');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_02       ', '102.81.4.33', '总行BEAI应用2机        ', '田海波', '13426170308');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_02       ', '102.81.4.33', '总行BEAI应用2机        ', '刘家剑', '13426176932');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_03       ', '102.81.4.34', '总行BEAI应用3机        ', '田海波', '13426170308');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_03       ', '102.81.4.34', '总行BEAI应用3机        ', '刘家剑', '13426176932');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_04       ', '102.81.4.35', '总行BEAI应用4机        ', '田海波', '13426170308');
INSERT INTO `gtp_main_info` VALUES ('ZH_BEAI_04       ', '102.81.4.35', '总行BEAI应用4机        ', '刘家剑', '13426176932');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_16        ', '102.81.12.16', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_17        ', '102.81.12.17', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_18        ', '102.81.12.18', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_19        ', '102.81.12.19', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_20        ', '102.81.12.20', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_21        ', '102.81.12.21', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_22        ', '102.81.12.22', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_23        ', '102.81.12.23', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_24        ', '102.81.12.24', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_25        ', '102.81.12.25', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_26        ', '102.81.12.26', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_27        ', '102.81.12.27', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_28        ', '102.81.12.28', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_29        ', '102.81.12.29', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_30        ', '102.81.12.30', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_31        ', '102.81.12.31', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_32        ', '102.81.12.32', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_33        ', '102.81.12.33', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_34        ', '102.81.12.34', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_35        ', '102.81.12.35', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_36        ', '102.81.12.36', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_37        ', '102.81.12.37', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_38        ', '102.81.12.38', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_39        ', '102.81.12.39', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_40        ', '102.81.12.40', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_41        ', '102.81.12.41', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_42        ', '102.81.12.42', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_43        ', '102.81.12.43', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_44        ', '102.81.12.44', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_45        ', '102.81.12.45', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_46        ', '102.81.12.46', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_47        ', '102.81.12.47', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_48        ', '102.81.12.48', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_49        ', '102.81.12.49', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_50        ', '102.81.12.50', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_51        ', '102.81.12.51', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_52        ', '102.81.12.52', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_53        ', '102.81.12.53', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_54        ', '102.81.12.54', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLK_55        ', '102.81.12.55', '总行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_BLZS_01', '102.101.23.89', '柜面助手系统04', '王鹏', '13651337780');
INSERT INTO `gtp_main_info` VALUES ('ZH_CATA_01       ', '108.201.4.18', '资金支付管理1机          ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_CATA_02       ', '108.201.4.19', '资金支付管理2机          ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_CATA_03       ', '108.201.4.20', '支付融资系统3机', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_CRM_01        ', '102.96.1.9', '新对公CRM系统            ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_CSKHZJ_01     ', '102.80.32.16', '总行财税库行          ', '宫可想', '13691572770');
INSERT INTO `gtp_main_info` VALUES ('ZH_CZFX_01       ', '102.101.7.16', '操作风险管理应用1机          ', '李思穆', '15810540126');
INSERT INTO `gtp_main_info` VALUES ('ZH_CZFX_02       ', '102.101.7.17', '操作风险管理应用2机          ', '李思穆', '15810540126');
INSERT INTO `gtp_main_info` VALUES ('ZH_CallCenter_01 ', '102.80.19.8', '客服AG应用服务器           ', '古伟', '13693396817');
INSERT INTO `gtp_main_info` VALUES ('ZH_CallCenter_02 ', '102.64.16.178', 'CallCenter系统', '古伟', '13693396817');
INSERT INTO `gtp_main_info` VALUES ('ZH_DCMSAP_01     ', '110.17.1.21', '信贷系统应用', '韩博', '13716645510');
INSERT INTO `gtp_main_info` VALUES ('ZH_DCMSAP_02     ', '110.17.1.22', '信贷系统应用', '韩博', '13716645510');
INSERT INTO `gtp_main_info` VALUES ('ZH_DCMSDB_01     ', '110.17.1.18', '信贷系统数据库             ', '韩博', '13716645510');
INSERT INTO `gtp_main_info` VALUES ('ZH_DFGZFTP_01    ', '102.81.13.16', '总行代发工资FTP1          ', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_DFGZFTP_02    ', '102.81.13.17', '总行代发工资FTP2          ', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_DFGZ_01       ', '102.81.13.26', '总行代发工资', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('ZH_DSFWXT_01     ', '102.101.27.24', '电商服务系统1机            ', '绍建波', '18610316121');
INSERT INTO `gtp_main_info` VALUES ('ZH_DSFWXT_02     ', '102.101.27.25', '电商服务系统2机            ', '绍建波', '18610316121');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZGZ_01       ', '102.96.15.18', '电子国债系统1机            ', '刘新密 ', '13717648667');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZGZ_02       ', '102.96.15.19', '电子国债系统2机            ', '刘新密 ', '13717648667');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZGZ_QZ_01    ', '102.96.15.34', '国债系统前置机             ', '刘新密 ', '13717648667');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZPJ_01       ', '102.80.14.8', '票据管理系统', '乔容', '13426422475');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZXJ_01       ', '102.64.15.30', '电子现金系统', '袁媛', '13810655921');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZYP_01       ', '102.96.19.16', '抵质押品管理系统1机          ', '刘效祥', '18610315132');
INSERT INTO `gtp_main_info` VALUES ('ZH_DZYP_02       ', '102.96.19.17', '抵质押品管理系统2机          ', '刘效祥', '18610315132');
INSERT INTO `gtp_main_info` VALUES ('ZH_EAST_01       ', '102.96.6.107', '监管标准化数据报送系统1机       ', '杨巍', '18146575542');
INSERT INTO `gtp_main_info` VALUES ('ZH_EAST_02       ', '102.96.6.108', '监管标准化数据报送系统2机       ', '杨巍', '18146575542');
INSERT INTO `gtp_main_info` VALUES ('ZH_EAST_DB_01    ', '102.96.6.100', '监管EAST数据库1机         ', '杨巍', '18146575542');
INSERT INTO `gtp_main_info` VALUES ('ZH_EDZF_01       ', '102.97.1.34', '总行二代支付系统            ', '汤波', '13810415146');
INSERT INTO `gtp_main_info` VALUES ('ZH_EDZF_02       ', '102.97.1.35', '总行二代支付系统            ', '汤波', '13810415146');
INSERT INTO `gtp_main_info` VALUES ('ZH_EDZF_GLD_01   ', '102.97.1.36', '总行二代支付系统管理端         ', '汤波', '13810415146');
INSERT INTO `gtp_main_info` VALUES ('ZH_ESBFTP_01     ', '102.198.10.24', 'E商宝FTP服务器 ', '邬鹏', '13810322489');
INSERT INTO `gtp_main_info` VALUES ('ZH_ESB_01        ', '108.201.1.76', '华夏E商宝系统             ', '邬鹏', '13810322489');
INSERT INTO `gtp_main_info` VALUES ('ZH_ESB_SFTP_01   ', '108.201.63.24', 'E商宝系统外网SFTP         ', '邬鹏', '13810322489');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_01    ', '102.96.7.16', '理财、基金、中间业务系统', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_01    ', '102.96.7.16', '理财、基金、中间业务系统', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_01    ', '102.96.7.16', '理财、基金、中间业务系统', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_02', '102.96.7.17', '理财、基金、中间业务系统', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_02', '102.96.7.17', '理财、基金、中间业务系统', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_02', '102.96.7.17', '理财、基金、中间业务系统', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_03   ', '102.96.7.18', '理财、基金、中间业务系统', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_03   ', '102.96.7.18', '理财、基金、中间业务系统', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_03   ', '102.96.7.18', '理财、基金、中间业务系统', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_04   ', '102.96.7.19', '理财、基金、中间业务系统', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_04   ', '102.96.7.19', '理财、基金、中间业务系统', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_04   ', '102.96.7.19', '理财、基金、中间业务系统', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_05  ', '102.96.7.20', '理财、基金、中间业务系统', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_05  ', '102.96.7.20', '理财、基金、中间业务系统', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_05  ', '102.96.7.20', '理财、基金、中间业务系统', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_06  ', '102.96.7.21', '理财、基金、中间业务系统', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_06  ', '102.96.7.21', '理财、基金、中间业务系统', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_06  ', '102.96.7.21', '理财、基金、中间业务系统', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FLSNP_01      ', '102.101.8.20', '非零售内评系统1机         ', '艾智军', '13520865277');
INSERT INTO `gtp_main_info` VALUES ('ZH_FLSNP_02      ', '102.101.8.21', '非零售内评系统2机         ', '艾智军', '13520865277');
INSERT INTO `gtp_main_info` VALUES ('ZH_FXQ_APP_01    ', '102.80.13.8', '反洗钱应用系统             ', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_FXQ_WEB_01    ', '110.199.3.16', '反洗钱系统web', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_GDHS_01       ', '102.80.5.8', '个贷公积金系统             ', '王永利', '13718862812');
INSERT INTO `gtp_main_info` VALUES ('ZH_GJJS_01       ', '102.64.28.10', '国际结算系统', '朱亮亮', '15011338608');
INSERT INTO `gtp_main_info` VALUES ('ZH_GJZBCX_01     ', '102.96.6.19', '关键指标查询系统1机          ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_GJZBCX_02     ', '102.96.6.20', '关键指标查询系统2机          ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_GJZBYD_01     ', '102.96.250.18', '关键指标查询移动版1机  ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_GJZBYD_02     ', '102.96.250.19', '关键指标查询移动版2机       ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_GLKJ_01       ', '102.96.12.37', '管理会计数据库1机           ', '代云松', '15810923264');
INSERT INTO `gtp_main_info` VALUES ('ZH_GLKJ_02       ', '102.96.12.38', '管理会计数据库2机           ', '代云松', '15810923264');
INSERT INTO `gtp_main_info` VALUES ('ZH_GLKJ_03       ', '102.96.12.39', '管理会计数据库3机           ', '代云松', '15810923264');
INSERT INTO `gtp_main_info` VALUES ('ZH_GLKJ_04       ', '102.96.12.40', '管理会计数据库4机           ', '代云松', '15810923264');
INSERT INTO `gtp_main_info` VALUES ('ZH_GL_01         ', '102.80.26.16', '总账系统  ', '徐智勇', '13910082012');
INSERT INTO `gtp_main_info` VALUES ('ZH_GL_02         ', '102.80.26.17', '总账系统  ', '徐智勇', '13910082012');
INSERT INTO `gtp_main_info` VALUES ('ZH_GMZS_01', '102.101.23.68', '柜面助手1机', '王鹏', '13651337780');
INSERT INTO `gtp_main_info` VALUES ('ZH_GMZS_02', '102.101.23.69', '柜面助手2机', '王鹏', '13651337780');
INSERT INTO `gtp_main_info` VALUES ('ZH_GMZS_03', '102.101.23.70', '柜面助手3机', '王鹏', '13651337780');
INSERT INTO `gtp_main_info` VALUES ('ZH_GMZS_04', '102.101.23.71', '柜面助手4机', '王鹏', '13651337780');
INSERT INTO `gtp_main_info` VALUES ('ZH_GOLD_01       ', '102.101.3.32', '黄金系统1机', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_GOLD_02       ', '102.101.3.33', '黄金系统2机', '姚颖', '13810554936');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRCRMWEB_01   ', '102.96.5.16', '个人CRM WEB/应用1机   ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRCRMWEB_02   ', '102.96.5.17', '个人CRM WEB/应用2机   ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRCRM_01      ', '102.96.5.25', '个人CRM 1机', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRCRM_02      ', '102.96.5.26', '个人CRM 2机            ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRCRM_YDZD_01 ', '102.96.5.37', '个人CRM移动终端1机         ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRCRM_YDZD_02 ', '102.96.5.38', '个人CRM移动终端2机         ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRZXCX_01     ', '102.198.4.32', '个人征信监管查询系统          ', '王永利', '13718862812');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRZX_01       ', '102.198.4.52', '总行个人征信系统            ', '王永利', '13718862812');
INSERT INTO `gtp_main_info` VALUES ('ZH_GYL_01        ', '102.80.18.8', '供应链金融系统             ', '荀竑', '13501283837');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXCXDY_01     ', '102.179.1.32', '核心查询打印系统            ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXKJZJK_01    ', '102.64.14.50', '华夏卡集中监控系统1机         ', '王记召', '15901547535');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXKJZJK_02    ', '102.64.14.51', '华夏卡集中监控系统2机         ', '王记召', '15901547535');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXZL_02   ', '102.144.128.10', '华夏租赁           ', '陈珺', '13611204880');
INSERT INTO `gtp_main_info` VALUES ('ZH_ICK_WLWG_01   ', '102.80.28.16', '总行IC卡外联网关系统         ', '邓西灿', '15801509177');
INSERT INTO `gtp_main_info` VALUES ('ZH_ITIL_TXZX_01  ', '102.150.5.21', 'ITIL通讯总线系统          ', '刘旭', '15810789721');
INSERT INTO `gtp_main_info` VALUES ('ZH_ITM_01        ', '102.80.8.19', '总行itm监控', '', '');
INSERT INTO `gtp_main_info` VALUES ('ZH_ITSM_01       ', '102.80.225.12', '总行ITSM系统1机          ', '刘旭', '15810789721');
INSERT INTO `gtp_main_info` VALUES ('ZH_ITSM_02       ', '102.80.225.16', 'ITSM系统2机            ', '刘旭', '15810789721');
INSERT INTO `gtp_main_info` VALUES ('ZH_JFJK_01       ', '103.2.4.70', '机房环境监控短信报警--环球      ', '刘旭', '15810789721');
INSERT INTO `gtp_main_info` VALUES ('ZH_JNWBZF_01     ', '110.198.6.11', '境内跨行外币支付系统          ', '朱亮亮', '15011338608');
INSERT INTO `gtp_main_info` VALUES ('ZH_JZYLQZ_01     ', '102.64.14.21', 'IC卡项目集中银联前置系统       ', '关杏元', '13810355807');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHJS_01       ', '102.96.6.71', '数据仓库客户集市数据库1', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHJS_02       ', '102.96.6.72', '数据仓库客户集市系统数据库    ', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHSJFX_01     ', '102.101.18.31', '客户数据分析系统1机          ', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHSJFX_02     ', '102.101.18.32', '客户数据分析系统2机          ', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHXQFX_01     ', '102.101.16.16', '反洗钱、客户洗钱风险评估应用1机   ', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHXQFX_02     ', '102.101.16.17', '反洗钱、客户洗钱风险评估应用2机   ', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_KJFXJK_WEB_01 ', '102.101.6.16', '会计业务风险监控Web', '高驰宇', '18600066320');
INSERT INTO `gtp_main_info` VALUES ('ZH_KJYS_01       ', '102.101.4.16', '会计要素系统1机            ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_KJYS_02       ', '102.101.4.17', '会计要素系统2机            ', '董效稳', '13683571755');
INSERT INTO `gtp_main_info` VALUES ('ZH_LCTZGL_01     ', '102.64.32.9', '理财投资管理系统            ', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_LCTZGL_02     ', '102.64.32.11', '理财投资管理系统            ', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_LCTZGL_03     ', '102.101.19.16', '理财投资管理系统3机          ', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_LCTZGL_04     ', '102.101.19.17', '理财投资管理系统4机          ', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_LSNP_01       ', '102.101.8.16', '零售内评系统应用1机          ', '王朝禄', '18618421112');
INSERT INTO `gtp_main_info` VALUES ('ZH_LSNP_02       ', '102.101.8.17', '零售内评系统应用2机          ', '王朝禄', '18618421112');
INSERT INTO `gtp_main_info` VALUES ('ZH_MIDWARE_01    ', '102.200.2.224', '中间件故障处理中心', '魏中伟', '13911822035');
INSERT INTO `gtp_main_info` VALUES ('ZH_MPP_01        ', '102.96.251.16', 'MPP系统1机             ', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_MPP_02        ', '102.96.251.17', 'MPP系统2机             ', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_NEW_BBPT_01   ', '102.96.6.29', '新综合报表系统应用1机         ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_NEW_BBPT_02   ', '102.96.6.30', '新综合报表系统应用2机         ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_NEW_BBPT_03   ', '102.96.6.31', '新综合报表系统应用3机         ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_FTP_01    ', '108.201.62.72', 'p2p外网文件服务器     ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_01   ', '102.101.26.22', 'p2p资金存管理1机      ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_02   ', '102.101.26.23', 'p2p资金存管理2机       ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_PORTAL_01     ', '102.144.3.24', '门户系统  ', '王志刚', '13911073832');
INSERT INTO `gtp_main_info` VALUES ('ZH_QYWY_01       ', '108.201.1.94', '企业网银1机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_QYWY_02       ', '108.201.1.95', '企业网银2机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_QYWY_03       ', '108.201.1.106', '企业网银3机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_QYWY_04       ', '108.201.1.107', '企业网银4机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_QYZX_01       ', '102.80.16.8', '企业征信系统', '王永利', '13718862812');
INSERT INTO `gtp_main_info` VALUES ('ZH_REPORT_01     ', '102.80.1.64', '数据抽取平台', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_REWS_01       ', '108.201.1.66', '反欺诈系统数据库        ', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_REWS_02       ', '108.201.1.65', '反欺诈系统数据库         ', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_RLZY_01       ', '102.129.11.22', '总行人力资源系统            ', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_RMBKJZF_01    ', '102.97.5.36', '人民币跨境支付系统         ', '柳小强', '13681401234');
INSERT INTO `gtp_main_info` VALUES ('ZH_RMBKJZF_02    ', '102.97.5.37', '人民币跨境支付系统           ', '柳小强', '13681401234');
INSERT INTO `gtp_main_info` VALUES ('ZH_ROUTE_01      ', '102.80.12.64', '总行应用间路由节点           ', '魏中伟', '13911822035');
INSERT INTO `gtp_main_info` VALUES ('ZH_SAS_01        ', '102.80.20.32', '总行SAS服务器            ', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFXGL_01     ', '102.101.2.20', '市场风险管理应用1机          ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFXGL_02     ', '102.101.2.21', '市场风险管理应用2机          ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFXGL_DB_01  ', '102.101.10.32', '市场风险管理系统数据库1机       ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFXGL_DB_02  ', '102.101.10.33', '市场风险管理系统数据库2机       ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFX_01       ', '102.101.2.16', '市场风险监控系统            ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFX_DMZ_01   ', '108.201.63.16', '市场风险监控DMZ区1机        ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SCFX_DMZ_02   ', '108.201.63.17', '市场风险监控DMZ区2机        ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SFCGZJ_01     ', '102.96.4.16', '总行三方存管系统主机          ', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_SFCGZJ_02     ', '102.96.4.17', '总行三方存管系统备机          ', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('ZH_SGBL_01       ', '102.101.2.18', '手工补录系统应用1机          ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SGBL_02       ', '102.101.2.19', '手工补录系统应用2机          ', '孙宏宇', '13810295055');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJCKDD_01     ', '102.96.6.23', '数据仓库调度1机         ', '程昭星', '18611118787');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJCKDD_02     ', '102.96.6.24', '数据仓库调度2机         ', '程昭星', '18611118787');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJFW_01       ', '102.80.12.8', '数据服务平台', '程昭星', '18611118787');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJGD_01       ', '102.80.11.8', '数据归档应用1机', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJGD_02       ', '102.80.11.9', '数据归档应用2机', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJJH_01       ', '102.96.6.16', '数据交换系统', '程昭星', '18611118787');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJJH_02       ', '102.96.6.17', '数据交换系统', '程昭星', '18611118787');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJYH_01       ', '108.201.68.12', '手机银行内管1机            ', '何学峰', '13701261575');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJYH_02       ', '108.201.68.140', '手机银行内管2机            ', '何学峰', '13701261575');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJYH_03       ', '108.201.68.141', '手机银行内管3机            ', '何学峰', '13701261575');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJYW_01       ', '102.80.9.26', '总行审计业务系统            ', '徐智勇', '13910082012');
INSERT INTO `gtp_main_info` VALUES ('ZH_SMSZJ_01      ', '102.96.3.24', '总行短信系统', '张轶清', '');
INSERT INTO `gtp_main_info` VALUES ('ZH_SWIFT_01      ', '102.64.33.12', 'SWIFT系统             ', '韩博', '13716645510');
INSERT INTO `gtp_main_info` VALUES ('ZH_TMS_01        ', '102.64.14.70', 'POS终端程序远程更新维护平台     ', '王记召', '15901547535');
INSERT INTO `gtp_main_info` VALUES ('ZH_TPAY_01       ', '102.80.27.16', '转账支付系统', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_TPOSWEB_01    ', '110.198.13.17', 'TPOS系统WEB1机  ', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_TPOSWEB_02    ', '110.198.13.18', 'TPOS系统WEB2机', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_TPOS_QZ_01    ', '102.64.31.8', 'TPOS系统1机            ', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_TPOS_QZ_02    ', '102.64.31.9', 'TPOS系统2机            ', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_TPOS_QZ_03    ', '102.64.31.10', 'TPOS系统3机', '胥刚', '15810537976');
INSERT INTO `gtp_main_info` VALUES ('ZH_TSM_01        ', '102.64.15.72', '总行TSM、IC卡多应用平台1机', '袁媛', '13810655921');
INSERT INTO `gtp_main_info` VALUES ('ZH_TSM_02        ', '102.64.15.73', '总行TSM、IC卡多应用平台 2机', '袁媛', '13810655921');
INSERT INTO `gtp_main_info` VALUES ('ZH_TYITZYGL_01', '102.101.13.16', '统一IT资源管理平台APP1机', '孙迎', '13681193734');
INSERT INTO `gtp_main_info` VALUES ('ZH_TYITZYGL_02', '102.101.13.17', '统一IT资源管理平台APP2机', '孙迎', '13681193734');
INSERT INTO `gtp_main_info` VALUES ('ZH_WGXNGL_01     ', '102.80.224.30', '网管性能管理系统            ', '王浩', '13910121455');
INSERT INTO `gtp_main_info` VALUES ('ZH_WG_01         ', '102.80.224.34', '网管系统  ', '王浩', '13910121455');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHCX_01       ', '110.199.2.62', '外汇查询系统', '荀竑', '13501283837');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHKZW_01      ', '102.64.21.11', '外汇卡系统  ', '荀竑', '13501283837');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHMM_01       ', '102.80.35.16', '总行外汇买卖系统            ', '荀竑', '13501283837');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHPJ_01       ', '102.80.6.8', '外汇牌价系统', '荀竑', '13501283837');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHQSDB_01     ', '102.80.23.20', '外汇清算系统数据库1机         ', '朱亮亮', '15011338608');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHQSDB_02     ', '102.80.23.21', '外汇清算系统数据库2机         ', '朱亮亮', '15011338608');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHQSZJ_01     ', '102.80.23.16', '外汇清算系统', '朱亮亮', '15011338608');
INSERT INTO `gtp_main_info` VALUES ('ZH_WHQSZJ_02     ', '102.80.23.17', '外汇清算系统', '朱亮亮', '15011338608');
INSERT INTO `gtp_main_info` VALUES ('ZH_WLCKPT_01     ', '102.101.28.32', '网络查控平台前置机           ', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_WLRZGL_01     ', '102.80.224.38', '总行网络日志管理系统          ', '王浩', '13910121455');
INSERT INTO `gtp_main_info` VALUES ('ZH_WLYYWG_01     ', '108.201.62.16', '外联应用网关通讯机           ', '邓西灿', '15801509177');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSBATZJ_01   ', '102.80.30.18', '财富系统批量服务器（新）        ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSBAT_01     ', '102.64.5.21', '财富系统批量服务器           ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSDBZJ_01    ', '102.80.30.28', '财富系统数据库主机（新）        ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSDBZJ_02    ', '102.80.30.29', '财富系统数据库备机（新）        ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSDB_01      ', '102.64.5.43', '财富管理系统数据库           ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSDB_02      ', '102.64.5.44', '财富管理系统数据库           ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WMSQZ_01      ', '108.201.69.4', '财富管理系统前置机           ', '田光涛', '13910048110');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXHG_01       ', '108.201.68.56', '总行微信后管系统            ', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXHG_02       ', '108.201.68.57', '总行微信后管2机            ', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXHIS_01      ', '108.201.67.40', '总行微信HIS系统3机         ', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXHIS_02      ', '108.201.67.41', '总行微信HIS2机           ', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXHIS_03      ', '108.201.67.42', '总行微信HIS系统3机         ', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXSMZF_01     ', '102.101.30.34', '微信扫码支付系统            ', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WXYH_01       ', '108.201.68.65', '总行微信银行', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_WYBAT_01      ', '108.201.1.60', '网银批量服务器1机          ', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_WYBAT_02      ', '108.201.1.96', '网银批量服务器2机           ', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_WY_01         ', '108.201.1.108', '网上银行内管系统            ', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_XYKHL_01      ', '102.96.9.16', '信用卡互联与清算应用1机        ', '王超', '13521962668');
INSERT INTO `gtp_main_info` VALUES ('ZH_XYKHL_02      ', '102.96.9.17', '信用卡互联与清算应用2机        ', '王超', '13521962668');
INSERT INTO `gtp_main_info` VALUES ('ZH_XYK_01        ', '106.32.2.221', '总行信用卡系统             ', '刘洋', '13124731366');
INSERT INTO `gtp_main_info` VALUES ('ZH_XYK_LSNP_01   ', '106.32.32.10', '信用卡零售内评系统应用1机       ', '刘洋', '13124731366');
INSERT INTO `gtp_main_info` VALUES ('ZH_XYK_LSNP_02   ', '106.32.32.11', '信用卡零售内评系统应用2机       ', '刘洋', '13124731366');
INSERT INTO `gtp_main_info` VALUES ('ZH_XYK_WLRZGL_01 ', '106.192.1.2', '总行信用卡中心网络日志管理   ', '刘洋', '13124731366');
INSERT INTO `gtp_main_info` VALUES ('ZH_YANYIN_01     ', '102.97.2.46', '总行验印系统1机            ', '胡斐', '15011325245');
INSERT INTO `gtp_main_info` VALUES ('ZH_YANYIN_02     ', '102.97.2.47', '总行验印系统2机            ', '胡斐', '15011325245');
INSERT INTO `gtp_main_info` VALUES ('ZH_YDZB_WG_01    ', '109.200.3.4', '异地灾备网管系统            ', '曹晨', '18662609059');
INSERT INTO `gtp_main_info` VALUES ('ZH_YQDZ_01       ', '102.96.16.18', '银企对账系统应用1机          ', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_YQDZ_02       ', '102.96.16.19', '银企对账系统应用2机          ', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_YQ_01         ', '102.150.2.32', '华夏银行舆情与市场分析   ', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('ZH_YTHJK_01      ', '102.80.8.25', '一体化监控系统             ', '陆海南', '13521508319');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXFXJK_01     ', '102.97.2.42', '总行影像风险监测1机        ', '高驰宇', '18600066320');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXFXJK_02     ', '102.97.2.43', '总行影像风险监测2机        ', '高驰宇', '18600066320');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXLQD_01      ', '102.97.2.60', '影像流前端 ', '刘玉伟', '18911785006');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXQP_01       ', '102.97.2.32', '总行影像切片系统1机          ', '刘玉伟', '18911785006');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXQP_02       ', '102.97.2.33', '总行影像切片系统2机          ', '刘玉伟', '18911785006');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZBGLDB_01     ', '102.96.11.18', '资本管理系统DB            ', '李思穆', '15810540126');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZBGLDB_02     ', '102.96.11.19', '资本管理系统DB            ', '李思穆', '15810540126');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZBSJCJ_01     ', '102.80.20.8', '资本数据采集', '赵聪', '15210380578');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZCFZ_01       ', '102.101.18.64', '资产负债管理系统1机          ', '李永德', '13488817743');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZCFZ_02       ', '102.101.18.65', '资产负债管理系统2机          ', '李永德', '13488817743');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZCTG_01       ', '102.101.14.16', '资产托管系统1机            ', '魏民', '13520958862');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZCTG_02       ', '102.101.14.17', '资产托管系统2机            ', '魏民', '13520958862');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZHSQ_01       ', '102.101.29.38', '智慧社区系统1机            ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZHSQ_02       ', '102.101.29.39', '智慧社区系统2机            ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZIJINZJ_01    ', '102.96.8.16', '资金系统  ', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZIJINZJ_02    ', '102.96.8.17', '资金系统  ', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZLGLXT_01     ', '103.160.224.18', '总行质量管理系统            ', '马源', '15210093671');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZPJYPT_01     ', '102.101.28.26', '诈骗交易处置平台1机          ', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZPJYPT_02     ', '102.101.28.27', '诈骗交易处置平台2机          ', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZSSXT_01      ', '102.64.4.24', '总行做市商系统1机           ', '刘阳', '13810686624');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZSSXT_02      ', '102.64.4.25', '总行做市商系统2机           ', '刘阳', '13810686624');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZXYH_01       ', '108.201.72.18', '直销银行系统  ', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZXYH_02       ', '108.201.72.19', '直销银行系统   ', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZYDD_01       ', '110.200.3.11', '作业调度系统', '刘涛', '15901096689');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZZBZ_01', '102.96.21.24', '自助报账系统1机', '徐智勇', '18515026196');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZZBZ_02', '102.96.21.25', '自助报账系统2机', '徐智勇', '18515026196');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZZSGL_01      ', '102.101.24.16', '增值税管理平台1机           ', '刘阳', '13810686624');
INSERT INTO `gtp_main_info` VALUES ('ZH_ZZSGL_02      ', '102.101.24.17', '增值税管理平台2机           ', '刘阳', '13810686625');
INSERT INTO `gtp_main_info` VALUES ('ZH_GTPM_01', '102.80.12.64', 'GTP管理控制台', '吕志亮', '13691236672');
INSERT INTO `gtp_main_info` VALUES ('ZH_GTPM_01', '102.80.12.64', 'GTP管理控制台', '魏中伟', '13911822035');
INSERT INTO `gtp_main_info` VALUES ('CZ_BANCS_01', '102.64.1.231', '村镇银行核心系统', '董卫春', '13520515180');
INSERT INTO `gtp_main_info` VALUES ('CZ_BANCS_01', '102.64.1.231', '村镇银行核心系统', '杨云', '13811591016');
INSERT INTO `gtp_main_info` VALUES ('CZ_BEAI_01', '102.64.1.41', '村镇银行BEAI系统', '刘家剑', '13426176932');
INSERT INTO `gtp_main_info` VALUES ('CZ_BEAI_01', '102.64.1.41', '村镇银行BEAI系统', '田海波', '13426170308');
INSERT INTO `gtp_main_info` VALUES ('CZ_BLK_01', '102.64.1.105', '村镇银行代发工资', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('CZ_BLK_02', '102.64.1.106', '村镇银行柜面系统', '宋文斌', '13651288359');
INSERT INTO `gtp_main_info` VALUES ('CZ_DCMS_01', '102.64.1.170', '村镇银行信贷应用1机', '韩博', '13716645510');
INSERT INTO `gtp_main_info` VALUES ('CZ_DCMS_02', '102.64.1.171', '村镇银行信贷应用2机', '韩博', '13716645510');
INSERT INTO `gtp_main_info` VALUES ('CZ_DZXJ_01', '102.64.1.182', '村镇银行电子现金系统', '袁媛', '13810655921');
INSERT INTO `gtp_main_info` VALUES ('CZ_EDZF_01', '102.64.1.186', '村镇银行二代支付系统', '汤波', '13810415146');
INSERT INTO `gtp_main_info` VALUES ('CZ_FINANCE_01', '102.64.1.246', '村镇银行新理财系统1机', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('CZ_FINANCE_02', '102.64.1.247', '村镇银行新理财系统2机', '杨涛', '13520529757');
INSERT INTO `gtp_main_info` VALUES ('CZ_FXQ_01', '102.64.1.238', '村镇反洗钱系统', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('CZ_GRWY_01', '108.201.133.10', '村镇银行个人网银1机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('CZ_GRWY_02', '108.201.133.11', '村镇银行个人网银2机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('CZ_JZYLQZ_01', '102.64.1.180', '村镇银行集中银联前置', '关杏元', '13810355807');
INSERT INTO `gtp_main_info` VALUES ('CZ_REPORT_01', '102.64.1.21', '村镇银行数据抽取平台', '刘忠坤', '13391919036');
INSERT INTO `gtp_main_info` VALUES ('CZ_SMS_01', '102.64.1.194', '村镇银行短信系统', '张轶清', '');
INSERT INTO `gtp_main_info` VALUES ('CZ_WY_01', '108.201.133.8', '村镇银行网银应用1机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('CZ_WY_02', '108.201.133.9', '村镇银行网银应用2机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('CZ_ZPJYPT_01', '102.64.1.84', '村镇银行诈骗交易处置平台1机', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('CZ_ZPJYPT_02', '102.64.1.85', '村镇银行诈骗交易处置平台2机', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('CQ_ROUTE_01', '129.17.2.182', '重庆路由节点', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('KC_HBZK', '101.201.13.98', '恒宝制卡系统', '丁伟铭   ', '13615296838');
INSERT INTO `gtp_main_info` VALUES ('KC_JBDZK', '101.201.13.97', '金邦达制卡系统', '邹创明', '13427799330');
INSERT INTO `gtp_main_info` VALUES ('KC_JBDZK', '101.201.13.97', '金邦达制卡系统', '刘清', '13709695418');
INSERT INTO `gtp_main_info` VALUES ('KC_TYZK', '101.201.13.100', '天喻制卡系统 ', '谈震', '15377592001');
INSERT INTO `gtp_main_info` VALUES ('KC_WQZK', '101.201.13.96', '握奇制卡厂', '李旭科', '13001064416');
INSERT INTO `gtp_main_info` VALUES ('KC_ZCZK', '101.201.13.99', '中超制卡系统', '李栋林', '13466345075');
INSERT INTO `gtp_main_info` VALUES ('DUTY', '129.17.2.86', '重庆运维监控客户机', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('DZTC', '129.17.2.66', '重庆电子同城系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('HJJK', '129.17.1.22', '重庆环境监控', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('JXKH', '129.17.1.24', '重庆绩效考核系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('OCR', '129.17.2.35', '重庆系统会计后督系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('SGTC', '129.17.2.186', '重庆手工同城系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('SJ', '129.102.1.30', '重庆运维审计系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('SJCX', '129.17.1.67', '重庆绩效数据平台', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('TSYW', '129.17.2.75', '重庆特色业务系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('WLRZGL', '129.192.1.2', '重庆网络日志管理', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('YXQP', '129.17.2.183', '重庆影像切片系统', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('ZABBIX', '129.17.2.184', 'ZABBIX Server', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('ZZHD', '129.17.2.154', '重庆自助回单机', '沈晓', '15825978806');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_DFGZ_01   ', '102.111.15.97', '北京代发工资', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_DZTC_01   ', '102.111.15.130', '北京电子同城', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_JXKH_01   ', '102.111.129.129', '北京绩效考核', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_SGTC_01   ', '102.111.15.128', '北京手工同城', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_SJXT_01   ', '111.15.1.8', '北京审计系统系统', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_TSYW_01   ', '102.111.15.20', '北京特色业务', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_WLRZGL_01 ', '111.192.1.2', '北京网络日志管理            ', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_WXGZH_01  ', '108.201.68.94', '北京微信公众号平台             ', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_YXQP_01   ', '102.111.15.134', '北京影像切片', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_HJJK_01  ', '111.192.1.15', '北京环境监控', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_JXKH_01', '32.17.224.36', '南京绩效考核1', '罗凯宁', '18915957102');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_SJ_01     ', '116.40.1.91', '南京审计系统  ', '罗凯宁', '18915957102');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_WLRZGL_01 ', '116.192.1.2', '南京网络日志管理            ', '罗凯宁', '18915957102');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_JXKH_01', '32.17.224.36', '南京绩效考核1 ', '毕然', '18913927746');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_SJ_01     ', '116.40.1.91', '南京审计系统  ', '毕然', '18913927746');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_WLRZGL_01 ', '116.192.1.2', '南京网络日志管理            ', '毕然', '18913927746');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_JXKH_01   ', '119.1.1.40', '杭州绩效考核', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_OCR_01    ', '119.1.135.2', '杭州事后监督', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_SGTC_01   ', '119.1.1.91', '杭州手工同城', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_SJ_01     ', '119.192.1.16', '杭州审计系统  ', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_TSYW_01   ', '119.201.254.131', '杭州特色业务', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_WLRZGL_01 ', '119.192.1.2', '杭州网络日志管理            ', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_YXQP_01   ', '119.1.1.80', '杭州影像流切片             ', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0469_SGTC_01   ', '119.1.1.96', '海宁手工同城', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0471_SGTC_01   ', '119.1.1.97', '义乌手工同城', '值班电话', '18958189910');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_JXKH_01   ', '119.1.1.40', '杭州绩效考核', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_OCR_01    ', '119.1.135.2', '杭州事后监督', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_SGTC_01   ', '119.1.1.91', '杭州手工同城', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_SJ_01     ', '119.192.1.16', '杭州审计系统  ', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_TSYW_01   ', '119.201.254.131', '杭州特色业务', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_WLRZGL_01 ', '119.192.1.2', '杭州网络日志管理            ', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_YXQP_01   ', '119.1.1.80', '杭州影像流切片             ', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0469_SGTC_01   ', '119.1.1.96', '海宁手工同城', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0471_SGTC_01   ', '119.1.1.97', '义乌手工同城', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_JXKH_01   ', '119.1.1.40', '杭州绩效考核', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_OCR_01    ', '119.1.135.2', '杭州事后监督', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_SGTC_01   ', '119.1.1.91', '杭州手工同城', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_SJ_01     ', '119.192.1.16', '杭州审计系统  ', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_TSYW_01   ', '119.201.254.131', '杭州特色业务', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_WLRZGL_01 ', '119.192.1.2', '杭州网络日志管理            ', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_YXQP_01   ', '119.1.1.80', '杭州影像流切片             ', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0469_SGTC_01   ', '119.1.1.96', '海宁手工同城', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0471_SGTC_01   ', '119.1.1.97', '义乌手工同城', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_DZTC_01   ', '30.1.224.99', '上海电子同城    ', '李建科 ', '13918969863');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_JXKH_01   ', '30.1.224.71', '上海绩效考核    ', '谢鹏', '13916135119');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_SGTC_01   ', '30.1.1.10', '上海手工同城    ', '李建科 ', '13918969863');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_SJ_01     ', '30.102.1.40', '上海审计系统      ', '李建科 ', '13918969863');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_TSYW_01   ', '30.1.224.80', '上海特色业务    ', '李建科 ', '13918969863');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_WLRZGL_01 ', '30.192.1.2', '上海网络日志管理  ', '李建科 ', '13918969863');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_YXQP_01   ', '30.1.1.20', '上海影像切片    ', '李建科 ', '13918969863');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_DZTC_01   ', '30.1.224.99', '上海电子同城    ', '郑卫华', '13901939290');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_SGTC_01   ', '30.1.1.10', '上海手工同城    ', '郑卫华', '13901939290');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_SJ_01     ', '30.102.1.40', '上海审计系统      ', '郑卫华', '13901939290');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_TSYW_01   ', '30.1.224.80', '上海特色业务    ', '郑卫华', '13901939290');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_WLRZGL_01 ', '30.192.1.2', '上海网络日志管理  ', '郑卫华', '13901939290');
INSERT INTO `gtp_main_info` VALUES ('FH_0500_YXQP_01   ', '30.1.1.20', '上海影像切片    ', '郑卫华', '13901939290');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_JXKH_01   ', '121.1.0.41', '济南绩效考核', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_SGTC_01   ', '121.1.0.113', '济南手工同城', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_SJ_01     ', '121.192.1.19', '济南审计系统  ', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_TSYW_01   ', '121.1.0.95', '济南特色业务', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_WLRZGL_01 ', '121.192.1.2', '济南网络日志管理            ', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_YXQP_01   ', '121.1.0.111', '济南影像切片', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_JXKH_01   ', '121.1.0.41', '济南绩效考核', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_SGTC_01   ', '121.1.0.113', '济南手工同城', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_SJ_01     ', '121.192.1.19', '济南审计系统  ', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_TSYW_01   ', '121.1.0.95', '济南特色业务', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_WLRZGL_01 ', '121.192.1.2', '济南网络日志管理            ', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_YXQP_01   ', '121.1.0.111', '济南影像切片', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_CZGK_01   ', '130.1.1.111', '昆明财政国库集中支付          ', '孙勇', '13888073243');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_DZTC_01   ', '130.1.1.175', '昆明电子同城', '冯焱霆', '13888227373');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_JXKH_01   ', '130.1.1.17', '昆明绩效考核', '赵文陶', '13888129947');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_JXKH_01   ', '130.1.1.17', '昆明绩效考核', '杨超', '13700603055');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_OCR_01    ', '130.1.17.122', '昆明事后监督', '杨超', '13700603055');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_SGTC_01   ', '130.1.1.173', '昆明手工同城', '冯焱霆', '13888227373');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_SJ_01     ', '130.1.192.5', '昆明审计系统  ', '冯焱霆', '13888227373');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_TSYW_01   ', '130.1.1.16', '昆明特色业务1机          ', '孙勇', '13888073243');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_TSYW_02   ', '130.1.1.41', '昆明特色业务2机', '孙勇', '13888073243');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_YXQP_01   ', '130.1.1.172', '昆明影像切片', '冯焱霆', '13888227373');
INSERT INTO `gtp_main_info` VALUES ('FH_0700_WLRZGL_01 ', '130.192.1.2', '昆明网络日志管理            ', '朱辉', '13888521967');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_HJJK_01 ', '137.1.1.28', '深圳环境监控', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_DKF_01    ', '137.58.1.142', '深圳代扣费系统 ', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_JXKH_01   ', '137.1.1.218', '深圳绩效考核', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_SJ_01     ', '137.1.1.113', '深圳审计系统  ', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_TSYW_01   ', '137.58.1.30', '深圳特色业务', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_WLRZGL_01 ', '137.192.1.2', '深圳网络日志管理            ', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0800_YXQP_01   ', '137.1.1.161', '深圳影像切片', '王睿', '13631664506');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_GJJ_01    ', '126.129.8.174', '广州公积金 ', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_JXKH_01   ', '126.129.6.106', '广州绩效考核', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_OCR_01    ', '126.129.6.174', '广州事后监督', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_SGTC_01   ', '126.1.1.76', '广州手工同城', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_SJ_01     ', '126.129.10.56', '广州审计系统  ', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_TSYW_01   ', '126.129.7.120', '广州特色业务', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_WLRZGL_01 ', '126.192.1.2', '广州网络日志管理            ', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_YXQP_01   ', '126.1.1.73', '广州影像切片', '邹建云', '13688878587');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_GJJ_01    ', '126.129.8.174', '广州公积金 ', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_JXKH_01   ', '126.129.6.106', '广州绩效考核', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_OCR_01    ', '126.129.6.174', '广州事后监督', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_SGTC_01   ', '126.1.1.76', '广州手工同城', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_SJ_01     ', '126.129.10.56', '广州审计系统  ', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_TSYW_01   ', '126.129.7.120', '广州特色业务', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_WLRZGL_01 ', '126.192.1.2', '广州网络日志管理            ', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_YXQP_01   ', '126.1.1.73', '广州影像切片', '巫宜聪 ', '13580541128');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_GJJ_01    ', '126.129.8.174', '广州公积金 ', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_JXKH_01   ', '126.129.6.106', '广州绩效考核', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_OCR_01    ', '126.129.6.174', '广州事后监督', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_SGTC_01   ', '126.1.1.76', '广州手工同城', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_SJ_01     ', '126.129.10.56', '广州审计系统  ', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_TSYW_01   ', '126.129.7.120', '广州特色业务', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_WLRZGL_01 ', '126.192.1.2', '广州网络日志管理            ', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_0900_YXQP_01   ', '126.1.1.73', '广州影像切片', '李文勇 ', '13825077250');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_ETC_01    ', '114.1.0.15', '沈阳ETC', '黄亮', '13109899469');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_GWK_01    ', '22.17.224.244', '沈阳公务卡 ', '黄亮', '13109899469');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_HJJK_01   ', '114.129.1.210', '沈阳环境监控', '黄亮', '13109899469');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_JXKH_01   ', '114.1.0.35', '沈阳绩效考核1机', '黄亮', '13109899469');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_JXKH_02   ', '114.1.0.37', '沈阳绩效考核2机', '黄亮', '13109899469');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_SGTC_01   ', '114.1.0.63', '沈阳手工同城', '黄亮', '13109899469');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_ETC_01    ', '114.1.0.15', '沈阳ETC ', '张刚', '13478198545');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_GWK_01    ', '22.17.224.244', '沈阳公务卡 ', '张刚', '13478198545');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_HJJK_01   ', '114.129.1.210', '沈阳环境监控', '张刚', '13478198545');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_JXKH_01   ', '114.1.0.35', '沈阳绩效考核1机', '张刚', '13478198545');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_JXKH_02   ', '114.1.0.37', '沈阳绩效考核2机', '张刚', '13478198545');
INSERT INTO `gtp_main_info` VALUES ('FH_1000_SGTC_01   ', '114.1.0.63', '沈阳手工同城', '张刚', '13478198545');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_HJJK_01 ', '125.1.192.101', '武汉环境监控', '陈明 ', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_JXKH_01   ', '125.1.1.197', '武汉绩效考核1机            ', '陈明 ', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_JXKH_01   ', '125.1.1.197', '武汉绩效考核1机            ', '赵之欣', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_JXKH_02   ', '125.1.1.23', '武汉绩效考核2机            ', '陈明 ', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_JXKH_02   ', '125.1.1.23', '武汉绩效考核2机            ', '赵之欣', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_JXKH_02   ', '125.1.1.23', '武汉绩效考核2机            ', '邓淦', '18671308200');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_JXKH_03 ', '125.1.1.27', '武汉绩效考核3机   ', '陈明 ', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_OCR_01    ', '125.1.129.21', '武汉事后监督', '陈明 ', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_OCR_01    ', '125.1.129.21', '武汉事后监督', '赵之欣', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SGTC_01   ', '125.1.1.72', '武汉手工同城', '张明亮  ', '15827368120');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SGTC_01   ', '125.1.1.72', '武汉手工同城', '赵之欣  ', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SGTC_01   ', '125.1.1.72', '武汉手工同城', '刘友权 ', '18995577789');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SGTC_01   ', '125.1.1.72', '武汉手工同城', '饶伟  ', '13871462629');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SGTC_01   ', '125.1.1.72', '武汉手工同城', '陈明', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SGTC_01   ', '125.1.1.72', '武汉手工同城', '陈硕 ', '18995577766');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SJ_01     ', '125.1.192.10', '武汉审计系统    ', '王声乾 ', '18672333273');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SJ_01     ', '125.1.192.10', '武汉审计系统    ', '刘友权 ', '18995577789');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_SJ_01     ', '125.1.192.10', '武汉审计系统    ', '赵之欣  ', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TCPJ_01   ', '125.1.1.144', '武汉同城票交', '张明亮  ', '15827368120');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TCPJ_01   ', '125.1.1.144', '武汉同城票交', '赵之欣  ', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TCPJ_01   ', '125.1.1.144', '武汉同城票交', '刘友权 ', '18995577789');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TCPJ_01   ', '125.1.1.144', '武汉同城票交', '饶伟  ', '13871462629');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TCPJ_01   ', '125.1.1.144', '武汉同城票交', '陈明', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TCPJ_01   ', '125.1.1.144', '武汉同城票交', '陈硕 ', '18995577766');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TSYW_01   ', '125.1.1.140', '武汉特色业务1机', '饶伟 ', '13871462629');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TSYW_01   ', '125.1.1.140', '武汉特色业务1机', '赵之欣  ', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TSYW_02   ', '125.1.1.150', '武汉特色业务2机', '饶伟 ', '13871462629');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_TSYW_02   ', '125.1.1.150', '武汉特色业务2机', '赵之欣  ', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_WLRZGL_01 ', '125.192.1.2', '武汉网络日志管理            ', '王声乾 ', '18672333273');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_WLRZGL_01 ', '125.192.1.2', '武汉网络日志管理            ', '赵之欣', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_YXQP_01   ', '125.1.1.70', '武汉影像切片', '赵之欣  ', '18995577650');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_YXQP_01   ', '125.1.1.70', '武汉影像切片', '刘友权 ', '18995577789');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_YXQP_01   ', '125.1.1.70', '武汉影像切片', '张明亮  ', '15827368120');
INSERT INTO `gtp_main_info` VALUES ('FH_1100_YXQP_01   ', '125.1.1.70', '武汉影像切片', '陈明', '18995577414');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_DZTC_01   ', '128.1.3.133', '成都电子同城', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_JXKH_01   ', '128.1.3.30', '成都绩效考核', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_OCR_01    ', '128.1.2.26', '成都事后监督', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_SGTC_01   ', '128.1.3.152', '成都手工同城', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_SJ_01     ', '128.1.192.188', '成都审计系统  ', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_TSYW_01   ', '128.1.3.105', '成都特色业务', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_WLRZGL_01 ', '128.192.1.2', '成都网络日志管理            ', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_YXQP_01   ', '128.1.3.154', '成都影像切片', '罗洋', '13548111090');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_DZTC_01   ', '128.1.3.133', '成都电子同城', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_JXKH_01   ', '128.1.3.30', '成都绩效考核', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_OCR_01    ', '128.1.2.26', '成都事后监督', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_SGTC_01   ', '128.1.3.152', '成都手工同城', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_SJ_01     ', '128.1.192.188', '成都审计系统  ', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_TSYW_01   ', '128.1.3.105', '成都特色业务', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_WLRZGL_01 ', '128.192.1.2', '成都网络日志管理            ', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1300_YXQP_01   ', '128.1.3.154', '成都影像切片', '值班电话', '13882104866');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_ETC_01    ', '132.1.1.210', '西安ETC', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_GWK_01    ', '132.1.1.52', '西安公务卡   ', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_JXKH_01   ', '132.1.1.146', '西安绩效考核', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_OCR_01    ', '132.1.1.36', '西安事后监督', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SGTC_01   ', '132.1.1.72', '西安手工同城', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SJ_01     ', '132.1.1.51', '西安审计系统  ', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_01   ', '132.1.1.85', '西安特色业务', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_YXQP_01   ', '132.1.1.74', '西安影像切片', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_WLRZGL_01 ', '132.192.1.2', '西安网络日志管理            ', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_ETC_01    ', '132.1.1.210', '西安ETC', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_GWK_01    ', '132.1.1.52', '西安公务卡   ', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_JXKH_01   ', '132.1.1.146', '西安绩效考核', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_OCR_01    ', '132.1.1.36', '西安事后监督', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SGTC_01   ', '132.1.1.72', '西安手工同城', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SJ_01     ', '132.1.1.51', '西安审计系统  ', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_01   ', '132.1.1.85', '西安特色业务', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_YXQP_01   ', '132.1.1.74', '西安影像切片', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_WLRZGL_01 ', '132.192.1.2', '西安网络日志管理            ', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_ETC_01    ', '132.1.1.210', '西安ETC', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_GWK_01    ', '132.1.1.52', '西安公务卡   ', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_JXKH_01   ', '132.1.1.146', '西安绩效考核', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_OCR_01    ', '132.1.1.36', '西安事后监督', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SGTC_01   ', '132.1.1.72', '西安手工同城', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SJ_01     ', '132.1.1.51', '西安审计系统  ', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_01   ', '132.1.1.85', '西安特色业务', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_YXQP_01   ', '132.1.1.74', '西安影像切片', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_WLRZGL_01 ', '132.192.1.2', '西安网络日志管理            ', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_ETC_01    ', '132.1.1.210', '西安ETC', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_GWK_01    ', '132.1.1.52', '西安公务卡   ', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_JXKH_01   ', '132.1.1.146', '西安绩效考核', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_OCR_01    ', '132.1.1.36', '西安事后监督', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SGTC_01   ', '132.1.1.72', '西安手工同城', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_SJ_01     ', '132.1.1.51', '西安审计系统  ', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_01   ', '132.1.1.85', '西安特色业务', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_YXQP_01   ', '132.1.1.74', '西安影像切片', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_WLRZGL_01 ', '132.192.1.2', '西安网络日志管理            ', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_EDZF_01   ', '133.15.1.56', '乌鲁木齐二代支付', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_JXKH_01   ', '133.15.1.75', '乌鲁木齐绩效考核', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_OCR_01    ', '133.15.1.53', '乌鲁木齐事后监督', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_SJ_01     ', '133.192.1.10', '乌鲁木齐审计系统', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_TSYW_01   ', '133.15.1.71', '乌鲁木齐特色业务            ', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_WLRZGL_01 ', '133.192.1.2', '乌鲁木齐网络日志管理          ', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_YXQP_01   ', '133.15.1.17', '乌鲁木齐影像切片            ', '李赞', '13150326759');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_EDZF_01   ', '133.15.1.56', '乌鲁木齐二代支付', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_JXKH_01   ', '133.15.1.75', '乌鲁木齐绩效考核', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_OCR_01    ', '133.15.1.53', '乌鲁木齐事后监督', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_SJ_01     ', '133.192.1.10', '乌鲁木齐审计系统', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_TSYW_01   ', '133.15.1.71', '乌鲁木齐特色业务            ', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_WLRZGL_01 ', '133.192.1.2', '乌鲁木齐网络日志管理          ', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1500_YXQP_01   ', '133.15.1.17', '乌鲁木齐影像切片            ', '李东英 ', '13999923159');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_JXKH_01   ', '112.1.1.88', '石家庄绩效考核 ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_OCR_01    ', '112.1.1.38', '石家庄事后监督1机', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_OCR_02    ', '112.1.1.114', '石家庄事后监督2机           ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_SGTC_01   ', '112.1.1.129', '石家庄手工同城             ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_SJ_01     ', '112.1.1.35', '石家庄审计系统 ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_TSYW_01   ', '112.1.1.13', '石家庄特色业务 ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_WLRZGL_01 ', '112.192.1.2', '石家庄网络日志管理           ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1600_YXQP_01   ', '112.1.1.126', '石家庄影像切片             ', '杨勇', '13315160588');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_DZTC_01   ', '113.1.3.42', '太原电子同城', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_JXKH_01   ', '113.1.3.25', '太原绩效考核', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_OCR_01    ', '113.1.3.15', '太原事后监督', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_SGTC_01   ', '113.1.3.141', '太原手工同城', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_SJ_01     ', '113.1.192.11', '太原审计系统  ', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_TSYW_01   ', '113.1.3.113', '太原特色业务', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_WLRZGL_01 ', '113.1.192.20', '太原网络日志管理            ', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_YXQP_01   ', '113.1.3.142', '太原影像切片', '郑鑫', '18734865860');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_DZTC_01   ', '113.1.3.42', '太原电子同城', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_JXKH_01   ', '113.1.3.25', '太原绩效考核', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_OCR_01    ', '113.1.3.15', '太原事后监督', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_SGTC_01   ', '113.1.3.141', '太原手工同城', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_SJ_01     ', '113.1.192.11', '太原审计系统  ', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_TSYW_01   ', '113.1.3.113', '太原特色业务', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_WLRZGL_01 ', '113.1.192.20', '太原网络日志管理            ', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1700_YXQP_01   ', '113.1.3.142', '太原影像切片', '赵劲焰 ', '15234076382');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_JXKH_01   ', '115.1.1.19', '大连绩效考核', '宋阳', '13478423277');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_SGTC_01   ', '115.1.1.159', '大连手工同城', '宋阳', '13478423277');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_SJ_01     ', '115.192.1.189', '大连审计系统  ', '宋阳', '13478423277');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_TSYW_01   ', '115.1.1.10', '大连特色业务', '宋阳', '13478423277');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_WLRZGL_01 ', '115.192.1.2', '大连网络日志管理            ', '宋阳', '13478423277');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_YXQP_01   ', '115.1.1.161', '大连影像切片', '宋阳', '13478423277');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_JXKH_01   ', '115.1.1.19', '大连绩效考核', '来金', '13840894840');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_OCR_01    ', '115.129.33.99', '大连事后监督', '孙军', '15604112755');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_SGTC_01   ', '115.1.1.159', '大连手工同城', '来金', '13840894840');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_SJ_01     ', '115.192.1.189', '大连审计系统  ', '来金', '13840894840');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_TSYW_01   ', '115.1.1.10', '大连特色业务', '来金', '13840894840');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_WLRZGL_01 ', '115.192.1.2', '大连网络日志管理            ', '来金', '13840894840');
INSERT INTO `gtp_main_info` VALUES ('FH_1800_YXQP_01   ', '115.1.1.161', '大连影像切片', '来金', '13840894840');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_JXKH_01   ', '120.16.1.55', '温州绩效考核1机            ', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_JXKH_02   ', '120.16.1.43', '温州绩效考核2机            ', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_OCR_01    ', '120.16.1.81', '温州事后监督', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_SJ_01     ', '120.16.1.79', '温州审计系统  ', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_TCPJ_01   ', '120.16.1.38', '温州同城票交', '伍希凡', '13858841151');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_TSYW_01   ', '120.16.1.67', '温州特色业务', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_WLRZGL_01 ', '120.192.1.2', '温州网络日志管理            ', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_YXQP_01   ', '120.16.1.39', '温州影像切片', '周立秋', '13758825256');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_JXKH_01   ', '124.1.1.39', '青岛绩效考核', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_OCR_01    ', '124.1.1.61', '青岛事后监督', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_SGTC_01   ', '124.1.1.92', '青岛手工同城', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_SJ_01     ', '124.1.192.10', '青岛审计系统  ', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_TOPS_01   ', '124.1.1.9', '青岛TOPS', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_TSYW_01   ', '124.1.1.36', '青岛特色业务', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_WLRZGL_01 ', '124.192.1.2', '青岛网络日志管理            ', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_YXQP_01   ', '124.1.1.83', '青岛影像切片  ', '李海涛', '15092093085');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_JXKH_01   ', '124.1.1.39', '青岛绩效考核', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_OCR_01    ', '124.1.1.61', '青岛事后监督', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_SGTC_01   ', '124.1.1.92', '青岛手工同城', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_SJ_01     ', '124.1.192.10', '青岛审计系统  ', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_TOPS_01   ', '124.1.1.9', '青岛TOPS', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_TSYW_01   ', '124.1.1.36', '青岛特色业务', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_WLRZGL_01 ', '124.192.1.2', '青岛网络日志管理            ', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_YXQP_01   ', '124.1.1.83', '青岛影像切片  ', '杜勇', '15066199936');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_JXKH_01   ', '124.1.1.39', '青岛绩效考核', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_OCR_01    ', '124.1.1.61', '青岛事后监督', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_SGTC_01   ', '124.1.1.92', '青岛手工同城', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_SJ_01     ', '124.1.192.10', '青岛审计系统  ', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_TOPS_01   ', '124.1.1.9', '青岛TOPS', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_TSYW_01   ', '124.1.1.36', '青岛特色业务', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_WLRZGL_01 ', '124.192.1.2', '青岛网络日志管理            ', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2000_YXQP_01   ', '124.1.1.83', '青岛影像切片  ', '李明  ', '13864228826');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_JXKH_01   ', '134.15.1.56', '呼和浩特绩效考核', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_01    ', '134.15.1.29', '呼和浩特事后监督1机', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SGTC_01   ', '134.15.1.84', '呼和浩特手工同城            ', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SJ_01     ', '134.192.1.3', '呼和浩特审计系统', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_TSYW_01   ', '134.15.1.73', '呼和浩特特色业务            ', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_YXQP_01   ', '134.15.1.86', '呼和浩特影像切片            ', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_WLRZGL_01 ', '134.192.1.2', '呼和浩特网络日志管理          ', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_JXKH_01   ', '134.15.1.56', '呼和浩特绩效考核', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_01    ', '134.15.1.29', '呼和浩特事后监督1机', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SGTC_01   ', '134.15.1.84', '呼和浩特手工同城            ', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SJ_01     ', '134.192.1.3', '呼和浩特审计系统', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_TSYW_01   ', '134.15.1.73', '呼和浩特特色业务            ', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_YXQP_01   ', '134.15.1.86', '呼和浩特影像切片            ', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_WLRZGL_01 ', '134.192.1.2', '呼和浩特网络日志管理          ', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_JXKH_01   ', '134.15.1.56', '呼和浩特绩效考核', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_01    ', '134.15.1.29', '呼和浩特事后监督1机', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SGTC_01   ', '134.15.1.84', '呼和浩特手工同城            ', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SJ_01     ', '134.192.1.3', '呼和浩特审计系统', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_TSYW_01   ', '134.15.1.73', '呼和浩特特色业务            ', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_YXQP_01   ', '134.15.1.86', '呼和浩特影像切片            ', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_WLRZGL_01 ', '134.192.1.2', '呼和浩特网络日志管理          ', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_JXKH_01   ', '134.15.1.56', '呼和浩特绩效考核', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_01    ', '134.15.1.29', '呼和浩特事后监督1机', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SGTC_01   ', '134.15.1.84', '呼和浩特手工同城            ', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_SJ_01     ', '134.192.1.3', '呼和浩特审计系统', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_TSYW_01   ', '134.15.1.73', '呼和浩特特色业务            ', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_YXQP_01   ', '134.15.1.86', '呼和浩特影像切片            ', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_WLRZGL_01 ', '134.192.1.2', '呼和浩特网络日志管理          ', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_DZTC_01', '119.201.254.137', '杭州电子同城	', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('FH_0400_DZTC_01', '119.201.254.137', '杭州电子同城', '朱萧峰', '13958194947');
INSERT INTO `gtp_main_info` VALUES ('FH_0200_BJZF_01', '102.111.15.54', '北京代付易', '田燚', '13671286771');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_HJJK_01', '121.192.1.56', '济南环境监控', '王贵廷', '13705310377');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_02', '134.15.1.89', '呼和浩特事后监督2机', '刘鑫', '18504713577');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_02', '134.15.1.89', '呼和浩特事后监督2机', '牟楠', '18104848863');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_02', '134.15.1.89', '呼和浩特事后监督2机', '孙吉胜', '13337100515');
INSERT INTO `gtp_main_info` VALUES ('FH_2100_OCR_02', '134.15.1.89', '呼和浩特事后监督2机', '王曦', '18686089680');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_HJJK_01', '136.102.1.22', '福州环境监控', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_01   ', '136.120.1.205', '福州绩效考核1机 ', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_02   ', '136.120.1.204', '福州绩效考核2机     ', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_OCR_01    ', '136.120.1.30', '福州后督  ', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_SJ_01     ', '136.102.1.100', '福州审计系统  ', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_TSYW_01   ', '136.120.1.66', '福州特色业务', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_WLRZGL_01 ', '136.192.1.2', '福州网络日志管理            ', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_YXQP_01   ', '136.120.1.71', '福州影像切片', '江南', '13635260237');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_HJJK_01', '136.102.1.22', '福州环境监控', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_01   ', '136.120.1.205', '福州绩效考核1机 ', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_02   ', '136.120.1.204', '福州绩效考核2机     ', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_OCR_01    ', '136.120.1.30', '福州后督  ', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_SJ_01     ', '136.102.1.100', '福州审计系统  ', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_TSYW_01   ', '136.120.1.66', '福州特色业务', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_WLRZGL_01 ', '136.192.1.2', '福州网络日志管理            ', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_YXQP_01   ', '136.120.1.71', '福州影像切片', '刘林涛', '13600856063');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_HJJK_01', '136.102.1.22', '福州环境监控', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_01   ', '136.120.1.205', '福州绩效考核1机 ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_02   ', '136.120.1.204', '福州绩效考核2机       ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_OCR_01    ', '136.120.1.30', '福州后督  ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_SJ_01     ', '136.102.1.100', '福州审计系统  ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_TSYW_01   ', '136.120.1.66', '福州特色业务', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_WLRZGL_01 ', '136.192.1.2', '福州网络日志管理            ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_YXQP_01   ', '136.120.1.71', '福州影像切片', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_HJJK_01', '136.102.1.22', '福州环境监控', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_01   ', '136.120.1.205', '福州绩效考核1机 ', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_02   ', '136.120.1.204', '福州绩效考核2机          ', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_OCR_01    ', '136.120.1.30', '福州后督  ', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_SJ_01     ', '136.102.1.100', '福州审计系统  ', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_TSYW_01   ', '136.120.1.66', '福州特色业务', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_WLRZGL_01 ', '136.192.1.2', '福州网络日志管理            ', '沈陈志 ', '13799721055');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_YXQP_01   ', '136.120.1.71', '福州影像切片', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_HJJK_01', '136.102.1.22', '福州环境监控', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_01   ', '136.120.1.205', '福州绩效考核1机 ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_02   ', '136.120.1.204', '福州绩效考核2机        ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_OCR_01    ', '136.120.1.30', '福州后督  ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_SJ_01     ', '136.102.1.100', '福州审计系统  ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_TSYW_01   ', '136.120.1.66', '福州特色业务', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_WLRZGL_01 ', '136.192.1.2', '福州网络日志管理            ', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_YXQP_01   ', '136.120.1.71', '福州影像切片', '刘思凌', '18960895577');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_HJJK_01', '136.102.1.22', '福州环境监控', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_01   ', '136.120.1.205', '福州绩效考核1机 ', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_JXKH_02   ', '136.120.1.204', '福州绩效考核2机          ', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_OCR_01    ', '136.120.1.30', '福州后督  ', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_SJ_01     ', '136.102.1.100', '福州审计系统  ', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_TSYW_01   ', '136.120.1.66', '福州特色业务', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_WLRZGL_01 ', '136.192.1.2', '福州网络日志管理            ', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2200_YXQP_01   ', '136.120.1.71', '福州影像切片', '陶大青', '13960781660');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_ETC_01    ', '135.120.1.25', '天津ETC ', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_JXKH_01   ', '135.120.1.20', '天津绩效考核', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_OCR_01    ', '135.120.1.43', '天津事后监督', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_SGTC_01   ', '135.120.1.81', '天津手工同城', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_SJ_01     ', '135.120.1.72', '天津审计系统  ', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_TSYW_01   ', '135.120.1.108', '天津特色业务', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_WLRZGL_01 ', '135.192.1.2', '天津网络日志管理            ', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_YXQP_01   ', '135.120.1.84', '天津影像切片', '严华', '18902170658');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_DFGZ_01   ', '118.118.1.8', '苏州代发工资', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_DZTC_01   ', '118.118.1.170', '苏州电子同城', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_JXKH_01   ', '118.118.1.231', '苏州绩效考核', '唐闻瑜', '18913569163');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_OCR_01    ', '118.118.1.132', '苏州事后监督', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_SJ_01     ', '118.192.1.7', '苏州审计系统  ', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_TSYW_01   ', '118.118.1.10', '苏州特色业务', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_WLRZGL_01 ', '118.192.1.2', '苏州网络日志管理            ', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2400_YXQP_01   ', '118.118.1.150', '苏州影像切片', '张明', '18913569167');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_DZTC_01   ', '117.1.1.91', '无锡电子同城   ', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_JXKH_01   ', '117.1.128.132', '无锡绩效考核', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_OCR_01    ', '117.1.1.45', '无锡事后监督', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_SJ_01     ', '117.1.192.35', '无锡审计系统  ', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_TSYW_01   ', '117.1.1.130', '无锡特色业务1机            ', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_TSYW_02   ', '117.1.1.18', '无锡特色业务2机       ', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_WLRZGL_01 ', '117.192.1.2', '无锡网络日志管理            ', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2500_YXQP_01   ', '117.1.1.92', '无锡影像切片', '殷华', '13812547348');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_JXKH_01   ', '123.1.1.99', '烟台绩效考核', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_JXKH_01   ', '123.1.1.99', '烟台绩效考核', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_JXKH_01   ', '123.1.1.99', '烟台绩效考核', '林凯辉', '18660597893');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_SGTC_01   ', '121.1.0.114', '烟台手工同城', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_SGTC_01   ', '121.1.0.114', '烟台手工同城', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_WLRZ_01   ', '121.192.1.46', '烟台网络日志管理            ', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_2600_WLRZ_01   ', '121.192.1.46', '烟台网络日志管理            ', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_2700_JXKH_01   ', '122.120.1.19', '聊城绩效考核', '康延军', '13863568576');
INSERT INTO `gtp_main_info` VALUES ('FH_2700_SGTC_01   ', '121.1.0.115', '聊城手工同城', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_2700_SGTC_01   ', '121.1.0.115', '聊城手工同城', '值班电话', '15615512623');
INSERT INTO `gtp_main_info` VALUES ('FH_2800_JXKH_01   ', '130.200.1.30', '玉溪绩效考核    ', '张云峰', '13330584222');
INSERT INTO `gtp_main_info` VALUES ('FH_2800_OCR_01    ', '130.1.17.210', '玉溪后督  ', '杨超', '13700603055');
INSERT INTO `gtp_main_info` VALUES ('FH_2800_WLRZGL_01 ', '130.200.192.2', '玉溪网络日志管理            ', '杨超', '13700603055');
INSERT INTO `gtp_main_info` VALUES ('FH_2900_JXKH_01   ', '138.102.1.180', '宁波绩效考核', '孙洋', '18857496865');
INSERT INTO `gtp_main_info` VALUES ('FH_2900_OCR_01    ', '138.102.1.55', '宁波事后监督', '孙洋', '18857496865');
INSERT INTO `gtp_main_info` VALUES ('FH_2900_SJ_01     ', '138.102.192.45', '宁波审计系统  ', '孙洋', '18857496865');
INSERT INTO `gtp_main_info` VALUES ('FH_2900_TCPJ_01   ', '138.120.1.20', '宁波同城票交', '孙洋', '18857496865');
INSERT INTO `gtp_main_info` VALUES ('FH_2900_WLRZGL_01 ', '138.102.192.10', '宁波网络日志管理            ', '孙洋', '18857496865');
INSERT INTO `gtp_main_info` VALUES ('FH_2900_YXQP_01   ', '138.120.1.122', '宁波影像切片             ', '孙洋', '18857496865');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_JXKH_01   ', '141.50.1.83', '南宁绩效考核', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_OCR_01    ', '141.20.20.42', '南宁事后监督', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_SJ_01     ', '141.102.1.24', '南宁审计系统  ', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TCPJ_01   ', '141.20.20.30', '南宁同城票交', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TSYW_01   ', '141.20.20.50', '南宁特色业务', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_WLRZGL_01 ', '141.192.1.2', '南宁网络日志管理            ', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_YXQP_01   ', '141.20.20.84', '南宁影像切片', '韦冠名', '18775383011');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_JXKH_01   ', '141.50.1.83', '南宁绩效考核', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_OCR_01    ', '141.20.20.42', '南宁事后监督', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_SJ_01     ', '141.102.1.24', '南宁审计系统  ', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TCPJ_01   ', '141.20.20.30', '南宁同城票交', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TSYW_01   ', '141.20.20.50', '南宁特色业务', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_WLRZGL_01 ', '141.192.1.2', '南宁网络日志管理            ', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_YXQP_01   ', '141.20.20.84', '南宁影像切片', '陆俊', '15278075759');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_JXKH_01   ', '141.50.1.83', '南宁绩效考核', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_OCR_01    ', '141.20.20.42', '南宁事后监督', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_SJ_01     ', '141.102.1.24', '南宁审计系统  ', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TCPJ_01   ', '141.20.20.30', '南宁同城票交', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TSYW_01   ', '141.20.20.50', '南宁特色业务', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_WLRZGL_01 ', '141.192.1.2', '南宁网络日志管理            ', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_YXQP_01   ', '141.20.20.84', '南宁影像切片', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_JXKH_01   ', '141.50.1.83', '南宁绩效考核', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_OCR_01    ', '141.20.20.42', '南宁事后监督', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_SJ_01     ', '141.102.1.24', '南宁审计系统  ', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TCPJ_01   ', '141.20.20.30', '南宁同城票交', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TSYW_01   ', '141.20.20.50', '南宁特色业务', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_WLRZGL_01 ', '141.192.1.2', '南宁网络日志管理            ', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_YXQP_01   ', '141.20.20.84', '南宁影像切片', '白坤为 ', '18077027843');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_DZTC_01   ', '139.100.1.41', '常州电子同城', '储云锋', '13584500692');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_JXKH_01   ', '139.100.1.53', '常州绩效考核', '储云锋', '13584500692');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_OCR_01    ', '139.100.1.120', '常州事后监督', '储云锋', '13584500692');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_SJ_01     ', '139.102.1.10', '常州审计系统  ', '储云锋', '13584500692');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_WLRZGL_01 ', '139.192.1.2', '常州网络日志管理            ', '储云锋', '13584500692');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_YXQP_01   ', '139.100.1.42', '常州影像切片', '储云锋', '13584500692');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_DZTC_01   ', '139.100.1.41', '常州电子同城', '徐晶', '15195039805');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_JXKH_01   ', '139.100.1.53', '常州绩效考核', '徐晶', '15195039805');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_OCR_01    ', '139.100.1.120', '常州事后监督', '徐晶', '15195039805');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_SJ_01     ', '139.102.1.10', '常州审计系统  ', '徐晶', '15195039805');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_WLRZGL_01 ', '139.192.1.2', '常州网络日志管理            ', '徐晶', '15195039805');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_YXQP_01   ', '139.100.1.42', '常州影像切片', '徐晶', '15195039805');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_DZTC_01   ', '139.100.1.41', '常州电子同城', '金迪  ', '13961426789');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_JXKH_01   ', '139.100.1.53', '常州绩效考核', '金迪  ', '13961426789');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_OCR_01    ', '139.100.1.120', '常州事后监督', '金迪  ', '13961426789');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_SJ_01     ', '139.102.1.10', '常州审计系统  ', '金迪  ', '13961426789');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_WLRZGL_01 ', '139.192.1.2', '常州网络日志管理            ', '金迪  ', '13961426789');
INSERT INTO `gtp_main_info` VALUES ('FH_3100_YXQP_01   ', '139.100.1.42', '常州影像切片', '金迪  ', '13961426789');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_JXKH_01   ', '140.120.1.32', '绍兴绩效考核', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_OCR_01    ', '140.120.1.33', '绍兴事后监督', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_SGTC_01   ', '140.120.1.100', '绍兴手工同城', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_SJ_01     ', '140.102.1.20', '绍兴审计系统  ', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_TSYW_01   ', '140.120.1.10', '绍兴特色业务一户通             ', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_WLRZGL_01 ', '140.192.1.2', '绍兴网络日志管理            ', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_YXQP_01   ', '140.120.1.101', '绍兴影像切片', '诸颀峰', '13588502714');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_JXKH_01   ', '143.1.0.20', '长沙绩效考核', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_OCR_01    ', '143.1.0.7', '长沙事后监督', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_SGTC_01   ', '143.1.0.106', '长沙手工同城', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_SJ_01     ', '143.1.192.17', '长沙审计系统  ', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_TSYW_01   ', '143.1.0.1', '长沙特色业务', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_WLRZGL_01 ', '143.1.192.1', '长沙网络日志管理            ', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_YXQP_01   ', '143.1.0.104', '长沙影像切片', '伍灵杰', '18890360752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_JXKH_01   ', '143.1.0.20', '长沙绩效考核', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_OCR_01    ', '143.1.0.7', '长沙事后监督', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_SGTC_01   ', '143.1.0.106', '长沙手工同城', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_SJ_01     ', '143.1.192.17', '长沙审计系统  ', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_TSYW_01   ', '143.1.0.1', '长沙特色业务', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_WLRZGL_01 ', '143.1.192.1', '长沙网络日志管理            ', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3400_YXQP_01   ', '143.1.0.104', '长沙影像切片', '陈思琪', '15802669752');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_DZTC_01   ', '145.1.0.39', '厦门电子同城', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_JXKH_01   ', '145.1.0.29', '厦门绩效考核', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_OCR_01    ', '145.1.0.32', '厦门事后监督', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_SJ_01     ', '145.1.192.8', '厦门审计系统  ', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_TSYW_01   ', '145.1.0.4', '厦门特色业务', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_YXQP_01   ', '145.1.0.47', '厦门影像切片', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_WLRZGL_01 ', '145.1.192.7', '厦门网络日志管理            ', '张绍东', '18559207988');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_DZTC_01   ', '145.1.0.39', '厦门电子同城', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_JXKH_01   ', '145.1.0.29', '厦门绩效考核', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_OCR_01    ', '145.1.0.32', '厦门事后监督', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_SJ_01     ', '145.1.192.8', '厦门审计系统  ', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_TSYW_01   ', '145.1.0.4', '厦门特色业务', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_YXQP_01   ', '145.1.0.47', '厦门影像切片', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_WLRZGL_01 ', '145.1.192.7', '厦门网络日志管理            ', '洪火炬', '13400616590');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_DZTC_01   ', '145.1.0.39', '厦门电子同城', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_JXKH_01   ', '145.1.0.29', '厦门绩效考核', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_OCR_01    ', '145.1.0.32', '厦门事后监督', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_SJ_01     ', '145.1.192.8', '厦门审计系统  ', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_TSYW_01   ', '145.1.0.4', '厦门特色业务', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_YXQP_01   ', '145.1.0.47', '厦门影像切片', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_WLRZGL_01 ', '145.1.192.7', '厦门网络日志管理            ', '崔砚', '18150376070');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_DZTC_01   ', '145.1.0.39', '厦门电子同城', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_JXKH_01   ', '145.1.0.29', '厦门绩效考核', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_OCR_01    ', '145.1.0.32', '厦门事后监督', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_SJ_01     ', '145.1.192.8', '厦门审计系统  ', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_TSYW_01   ', '145.1.0.4', '厦门特色业务', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_YXQP_01   ', '145.1.0.47', '厦门影像切片', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_WLRZGL_01 ', '145.1.192.7', '厦门网络日志管理            ', '雷庭忠', '13003928325');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_DZTC_01   ', '145.1.0.39', '厦门电子同城', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_JXKH_01   ', '145.1.0.29', '厦门绩效考核', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_OCR_01    ', '145.1.0.32', '厦门事后监督', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_SJ_01     ', '145.1.192.8', '厦门审计系统  ', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_TSYW_01   ', '145.1.0.4', '厦门特色业务', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_YXQP_01   ', '145.1.0.47', '厦门影像切片', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3500_WLRZGL_01 ', '145.1.192.7', '厦门网络日志管理            ', '值班电话', '18950196616');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_JXKH_01   ', '146.1.0.4', '长春绩效考核  ', '赵彦博', '18810535779');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_OCR_01    ', '146.1.0.56', '长春事后监督  ', '赵彦博', '18810535779');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_SGTC_01   ', '146.1.0.26', '长春手工同城', '赵彦博', '18810535779');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_SJ_01     ', '146.1.0.73', '长春审计系统  ', '赵彦博', '18810535779');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_WLRZGL_01 ', '146.1.192.24', '长春网络日志管理            ', '赵彦博', '18810535779');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_YXQP_01   ', '146.1.0.20', '长春影像流切片             ', '赵彦博', '18810535779');
INSERT INTO `gtp_main_info` VALUES ('FH_3800_OCR_01    ', '112.200.0.40', '保定事后监督', '李雷', '18631285978');
INSERT INTO `gtp_main_info` VALUES ('FH_4100_JXKH_01   ', '114.200.0.43', '鞍山绩效考核  ', '张冲', '13065465672');
INSERT INTO `gtp_main_info` VALUES ('FH_4100_OCR_01    ', '114.1.0.121', '鞍山事后监督  ', '陈浩', '15998257993');
INSERT INTO `gtp_main_info` VALUES ('FH_4100_SGTC_01   ', '114.1.0.64', '鞍山手工同城', '张冲', '13065465672');
INSERT INTO `gtp_main_info` VALUES ('FH_4100_WLRZGL_01 ', '114.200.192.8', '鞍山网络日志管理            ', '张冲', '13065465672');
INSERT INTO `gtp_main_info` VALUES ('FH_4152_SGTC_01   ', '114.1.0.66', '海城手工同城', '刘洋', '18640079199');
INSERT INTO `gtp_main_info` VALUES ('FH_4200_OCR_01    ', '112.201.0.36', '唐山事后监督', '边颖昭', '18833395005');
INSERT INTO `gtp_main_info` VALUES ('FH_4200_WLRZGL_01 ', '112.201.192.6', '唐山网络日志管理            ', '边颖昭', '18833395005');
INSERT INTO `gtp_main_info` VALUES ('FH_4300_SGTC_01   ', '121.1.0.116', '东营手工同城', '孔青', '18853161298');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_OCR_01    ', '151.1.1.61', '哈尔滨后督 ', '张越', '18503658885');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SGTC_01   ', '151.1.1.41', '哈尔滨手工同城             ', '张越', '18503658885');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_YXQP_01   ', '151.1.1.34', '哈尔滨影像切片             ', '张越', '18503658885');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_JXKH_01', '151.1.1.84', '哈尔滨绩效考核 ', '张越', '18503658885');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SZBPXT_01', '151.1.128.31', '哈尔滨数子标牌 ', '张越', '18503658885');
INSERT INTO `gtp_main_info` VALUES ('FH_8700_OCR_01    ', '114.1.0.96', '锦州事后监督', '赵湘', '13940291112');
INSERT INTO `gtp_main_info` VALUES ('FH_8700_SGTC_01   ', '114.1.0.69', '锦州手工同城', '赵湘', '13940291112');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_OCR_01    ', '152.1.0.9', '贵阳事后监督', '申骄', '18620662671');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_SJ_01     ', '152.1.192.122', '贵阳审计系统  ', '申骄', '18620662671');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_YXQP_01   ', '152.1.0.16', '贵阳影像切片', '申骄', '18620662671');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_JXKH_01', '152.1.0.21', '贵阳绩效考核', '申骄', '18620662671');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_OCR_01    ', '152.1.0.9', '贵阳事后监督', '陈程', '17784817523');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_SJ_01     ', '152.1.192.122', '贵阳审计系统  ', '陈程', '17784817523');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_YXQP_01   ', '152.1.0.16', '贵阳影像切片', '陈程', '17784817523');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_JXKH_01   ', '152.1.0.21', '贵阳绩效考核', '陈程', '17784817523');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_OCR_01    ', '152.1.0.9', '贵阳事后监督 ', '杨维夫', '18085000125');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_SJ_01     ', '152.1.192.122', '贵阳审计系统  ', '杨维夫', '18085000125');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_YXQP_01   ', '152.1.0.16', '贵阳影像切片', '杨维夫', '18085000125');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_JXKH_01   ', '152.1.0.21', '贵阳绩效考核', '杨维夫', '18085000125');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_OCR_01    ', '152.1.0.9', '贵阳事后监督', '王思逸', '18786110541');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_SJ_01     ', '152.1.192.122', '贵阳审计系统  ', '王思逸', '18786110541');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_YXQP_01   ', '152.1.0.16', '贵阳影像切片', '王思逸', '18786110541');
INSERT INTO `gtp_main_info` VALUES ('FH_8400_JXKH_01   ', '152.1.0.21', '贵阳绩效考核', '王思逸', '18786110541');
INSERT INTO `gtp_main_info` VALUES ('FH_9100_OCR_01    ', '144.1.2.34l', '芜湖事后监督', '完振升', '13865995952');
INSERT INTO `gtp_main_info` VALUES ('FH_8000_JXKH_01   ', '150.1.192.28', '银川绩效考核', '常昇', '18509515206');
INSERT INTO `gtp_main_info` VALUES ('FH_8000_SJ_01     ', '150.1.192.33', '银川审计系统  ', '常昇', '18509515206');
INSERT INTO `gtp_main_info` VALUES ('FH_8000_WLRZGL_01 ', '150.1.192.31', '银川网络日志管理', '常昇', '18509515206');
INSERT INTO `gtp_main_info` VALUES ('FH_8000_YXQP_01   ', '102.97.2.158', '银川影你切片', '常昇', '18509515206');
INSERT INTO `gtp_main_info` VALUES ('FH_5500_JXKH_01   ', '147.1.0.90', '郑州绩效考核', '王钦朋', '18637127800');
INSERT INTO `gtp_main_info` VALUES ('FH_5500_SGTC_01   ', '147.1.0.74', '郑州手工同城', '王钦朋', '18637127800');
INSERT INTO `gtp_main_info` VALUES ('FH_5500_SJ_01     ', '147.1.192.110', '郑州审计系统  ', '王钦朋', '18637127800');
INSERT INTO `gtp_main_info` VALUES ('FH_5500_TSYW_01   ', '147.1.0.11', '郑州特色业务', '王钦朋', '18637127800');
INSERT INTO `gtp_main_info` VALUES ('FH_5500_WLRZGL_01 ', '147.1.192.1', '郑州网络日志管理            ', '王钦朋', '18637127800');
INSERT INTO `gtp_main_info` VALUES ('FH_5500_YXQP_01   ', '147.1.0.71', '郑州影像切片', '王钦朋', '18637127800');
INSERT INTO `gtp_main_info` VALUES ('FH_7600_JXKH_01   ', '149.1.1.70', '海口绩效考核', '冯行动', '18189899233');
INSERT INTO `gtp_main_info` VALUES ('FH_7600_OCR_01    ', '149.1.1.80', '海口事后监督', '冯行动', '18189899233');
INSERT INTO `gtp_main_info` VALUES ('FH_7600_SJ_01     ', '149.1.192.193', '海口审计系统  ', '冯行动', '18189899233');
INSERT INTO `gtp_main_info` VALUES ('FH_7600_WLRZGL_01 ', '149.1.192.2', '海口网络日志管理', '冯行动', '18189899233');
INSERT INTO `gtp_main_info` VALUES ('FH_7600_YXQP_01   ', '102.97.2.155', '海口影像切片', '冯行动', '18189899233');
INSERT INTO `gtp_main_info` VALUES ('FH_8900_SGTC_01', '119.1.1.99', '金华手工同城	', '贾大众', '13858098059');
INSERT INTO `gtp_main_info` VALUES ('ZH_CATA_04', '108.201.4.21', '支付融资系统4机', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_KHSJFX_RDS_01', '102.101.18.40', '客户数据分析REDIS', '黄东红', '15970696931');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_02 ', '132.1.1.83', '西安特色业务', '扁剑', '18909260839');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_02 ', '132.1.1.83', '西安特色业务', '韩一耀', '15229247211');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_02 ', '132.1.1.83', '西安特色业务', '杜浩云', '13630238012');
INSERT INTO `gtp_main_info` VALUES ('FH_1400_TSYW_02 ', '132.1.1.83', '西安特色业务', '吴可嘉', '15802993997');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_03 ', '102.101.26.28', 'p2p资金存管理3机   ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_04', '102.101.26.29', 'p2p资金存管理4机  ', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_JKPT_DB_01', '102.80.8.66', '监控平台数据库1机', '陆海南', '13521508319');
INSERT INTO `gtp_main_info` VALUES ('ZH_JKPT_DB_02', '102.80.8.67', '监控平台数据库2机', '陆海南', '13521508319');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_ETC_01', '135.120.1.25', '天津ETC ', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_JXKH_01', '135.120.1.20', '天津绩效考核', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_OCR_01', '135.120.1.43', '天津事后监督', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_SGTC_01', '135.120.1.81', '天津手工同城', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_SJ_01', '135.120.1.72', '天津审计系统', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_TSYW_01', '135.120.1.108', '天津特色业务', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_WLRZGL_01', '135.192.1.2', '天津网络日志管理', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_2300_YXQP_01', '135.120.1.84', '天津影像切片', '呼越寒', '18920187275');
INSERT INTO `gtp_main_info` VALUES ('FH_5900_OCR_01', '143.206.0.7', '郴州分行事后监督', '刘畅', '18673504650');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXL_NGPT_02 ', '102.97.2.39', '影像集中处理系统内管平台B机', '樊嵘', '13401177479');
INSERT INTO `gtp_main_info` VALUES ('ZH_YXL_NGPT_01 ', '102.97.2.38', '影像集中处理系统内管平台A机', '樊嵘', '13401177479');
INSERT INTO `gtp_main_info` VALUES ('ZH_ITIL_TXZX_02', '102.150.5.18', 'ITIL通讯总线系统', '刘旭', '15810789721');
INSERT INTO `gtp_main_info` VALUES ('ZH_ITIL_TXZX_03', '102.150.5.19', 'ITIL通讯总线系统', '刘旭', '15810789721');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_OCR_01', '151.1.1.61', '哈尔滨后督', '吴继成', '18503658887');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SGTC_01', '151.1.1.41', '哈尔滨手工同城', '吴继成', '18503658887');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_YXQP_01', '151.1.1.34', '哈尔滨影像切片', '吴继成', '18503658887');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_JXKH_01', '151.1.1.84', '哈尔滨绩效考核', '吴继成', '18503658887');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SZBPXT_01', '151.1.128.31', '哈尔滨数子标牌', '吴继成', '18503658887');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SGTC_01', '151.1.1.41', '哈尔滨手工同城', '李得志', '18503658886');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_YXQP_01', '151.1.1.34', '哈尔滨影像切片', '李得志', '18503658886');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_JXKH_01', '151.1.1.84', '哈尔滨绩效考核', '李得志', '18503658886');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SZBPXT_01', '151.1.128.31', '哈尔滨数子标牌', '李得志', '18503658886');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_OCR_01', '151.1.1.61', '哈尔滨后督', '李得志', '18503658886');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SGTC_01', '151.1.1.41', '哈尔滨手工同城', '罗凯', '15774603779');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_YXQP_01', '151.1.1.34', '哈尔滨影像切片', '罗凯', '15774603779');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_JXKH_01', '151.1.1.84', '哈尔滨绩效考核', '罗凯', '15774603779');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_SZBPXT_01', '151.1.128.31', '哈尔滨数子标牌', '罗凯', '15774603779');
INSERT INTO `gtp_main_info` VALUES ('FH_8300_OCR_01', '151.1.1.61', '哈尔滨后督', '罗凯', '15774603779');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXZL_03', '102.144.128.14', '华夏租赁', '陈珺', '13611204880');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXZL_04', '102.144.128.15', '华夏租赁', '陈珺', '13611204880');
INSERT INTO `gtp_main_info` VALUES ('ZH_HXZL_05', '102.144.128.16', '华夏租赁', '陈珺', '13611204880');
INSERT INTO `gtp_main_info` VALUES ('FH_3000_TSYW_02', '141.1.3.11', '南宁分行特色业务2', '钟远盛', '15977712257');
INSERT INTO `gtp_main_info` VALUES ('FH_0600_OCR_02', '121.1.0.131', '济南事后监督', '李璧鲁', '15318805800');
INSERT INTO `gtp_main_info` VALUES ('ZH_CSHJ_SJZZ_01', '102.200.197.8', '测试环境数据中转', '孙存福', '13720016501');
INSERT INTO `gtp_main_info` VALUES ('FH_1900_DZTC_01', '120.16.1.118', '温州电子同城', '伍希凡', '13858841151');
INSERT INTO `gtp_main_info` VALUES ('FH_5100_OCR_01', '148.1.0.8', '	南昌后督系统', '雷建华', '18079174181');
INSERT INTO `gtp_main_info` VALUES ('FH_5100_TCPJ_01', '148.1.0.15', '南昌同城票交', '雷建华', '18079174181');
INSERT INTO `gtp_main_info` VALUES ('FH_5100_SJ_01', '148.1.192.13', '南昌审计系统', '朱训访', '13907913763');
INSERT INTO `gtp_main_info` VALUES ('FH_5100_WLRZGL_01', '148.1.192.6', '南昌网络日志管理', '朱训访', '13907913763');
INSERT INTO `gtp_main_info` VALUES ('FH_5100_TSYW_01', '148.1.0.45', '南昌特色业务', '易波', '18970050588');
INSERT INTO `gtp_main_info` VALUES ('FH_5100_YXQP_01', '148.1.1.5', '南昌影像切片', '易波', '18970050588');
INSERT INTO `gtp_main_info` VALUES ('ZH_TESTDATA_01', '103.160.163.243', '测试中转机', '王志民', '18611921630');
INSERT INTO `gtp_main_info` VALUES ('FH_5600_JXKH_01', '114.201.128.53', '营口分行绩效考核系统', '李旭', '18641789988');
INSERT INTO `gtp_main_info` VALUES ('ZH_CLOUD_APP_01', '103.160.103.163', '总行测试环境云平台', '陈大伟', '13810199747');
INSERT INTO `gtp_main_info` VALUES ('ZH_NEW_ZXYH_01', '108.201.72.88', '新直销银行内管1机', '张艺华', '13811350372');
INSERT INTO `gtp_main_info` VALUES ('ZH_NEW_ZXYH_02', '108.201.72.89', '新直销银行内管2机', '张艺华', '13811350372');
INSERT INTO `gtp_main_info` VALUES ('ZH_FXQ_01', '102.101.40.16', '新反洗钱应用1机', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_FXQ_02', '102.101.40.17', '新反洗钱应用2机', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_FXQ_MD_01', '108.201.63.36', '反洗钱名单服务器', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_EAAS_01', '102.101.45.8', '银行账户信息申报系统', '李鹏', '13301069089');
INSERT INTO `gtp_main_info` VALUES ('ZH_CATA_05', '108.201.4.110', '支付融资应用5机', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_CATA_06', '108.201.4.111', '支付融资应用6机', '王文浩', '15652650947');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_05', '102.101.26.47', 'p2p资金存管理5机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_06', '102.101.26.48', 'p2p资金存管理6机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_07', '102.101.26.49', 'p2p资金存管理7机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_08', '102.101.26.50', 'p2p资金存管理8机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_DSFW_TPXT_01', '108.201.62.70', '电商服务图片系统1机', '邵建波', '18610316121');
INSERT INTO `gtp_main_info` VALUES ('ZH_DSFW_TPXT_02', '108.201.62.71', '电商服务图片系统2机', '邵建波', '18610316121');
INSERT INTO `gtp_main_info` VALUES ('ZH_GJJS_02', '102.64.28.11', '国际结算', '李鹏', '13301069089');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_WEB_03', '102.96.7.28', '理财系统WEB 3机', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_WEB_04', '102.96.7.29', '理财系统WEB 4机', '杨小院', '15910707497');
INSERT INTO `gtp_main_info` VALUES ('ZH_YWYDT_03', '102.101.47.18', '业务预填单3机', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_YWYDT_02', '102.101.47.17', '业务预填单2机', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_YWYDT_01', '102.101.47.16', '业务预填单1机', '艾辉', '18610280983');
INSERT INTO `gtp_main_info` VALUES ('ZH_YQDZ_HDGL_02', '102.96.16.20', '银企对账系统回单管理应用1机', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_YQDZ_HDGL_01', '102.96.16.21', '银企对账系统回单管理应用2机', '张云', '15810545433');
INSERT INTO `gtp_main_info` VALUES ('ZH_DCMS_GSXJY_02', '102.101.52.16', '信贷高时效交易子系统1机', '王朝禄', '18618421112');
INSERT INTO `gtp_main_info` VALUES ('ZH_DCMS_GSXJY_01', '102.101.52.17', '信贷高时效交易子系统2机', '王朝禄', '18618421112');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRWY_01', '108.201.1.92', '个人网银系统2机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_WEB_01', '102.96.7.26', '理财系统WEB 1机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_FINANCE_WEB_02', '102.96.7.27', '理财系统WEB 2机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_GRWY_02', '108.201.1.104', '个人网银系统1机', '王兴安', '15011018143');
INSERT INTO `gtp_main_info` VALUES ('FH_3200_DZTC_01', '140.120.1.99', '绍兴电子同城', '崔周宏', '18106888866');
INSERT INTO `gtp_main_info` VALUES ('ZH_DSFW_YHD_01', '102.101.27.36', '电商服务系统银行端1机', '邵建波', '18610316121');
INSERT INTO `gtp_main_info` VALUES ('ZH_DSFW_YHD_02', '102.101.27.37', '电商服务系统银行端2机', '邵建波', '18610316121');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_WXBAT_01', '108.201.68.101', '南京微信银行批量服务器1机', '罗凯宁', '18915957102');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_WXBAT_02', '108.201.68.102', '南京微信银行批量服务器2机', '罗凯宁', '18915957102');
INSERT INTO `gtp_main_info` VALUES ('ZH_SJCQPT_01', '102.101.39.21', '新数据抽取平台', '刘忠坤', '18811633599');
INSERT INTO `gtp_main_info` VALUES ('ZH_JNWBZF_APP_01', '102.101.41.16', '境内外币支付APP1机', '李思穆', '13001069114');
INSERT INTO `gtp_main_info` VALUES ('ZH_JNWBZF_APP_02', '102.101.41.17', '境内外币支付APP2机', '李思穆', '13001069114');
INSERT INTO `gtp_main_info` VALUES ('FH_3700_TSYW_01', '146.1.0.81', '长春分行特色业务', '李英杰', '18088664075');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_JXKH_02', '116.1.1.2', '南京绩效考核2', '毕然', '18913927746');
INSERT INTO `gtp_main_info` VALUES ('FH_0300_JXKH_02', '116.1.1.2', '南京绩效考核2', '罗凯宁', '18915957102');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_09', '102.101.26.56', 'p2p资金存管理09机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_P2P_ZJCG_10', '102.101.26.57', 'p2p资金存管理10机', '罗小军', '13401167431');
INSERT INTO `gtp_main_info` VALUES ('ZH_ESB_WLBAT_01', '102.101.44.29', 'E商宝网联批处理服务器1机', '邬鹏', '13810322489');
INSERT INTO `gtp_main_info` VALUES ('ZH_ESB_WLBAT_02', '102.101.44.30', 'E商宝网联批处理服务器1机', '邬鹏', '13810322489');

-- ----------------------------
-- Table structure for intelligent_alarm
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_alarm`;
CREATE TABLE `intelligent_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `keywords` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intelligent_alarm
-- ----------------------------
INSERT INTO `intelligent_alarm` VALUES ('66', 'GTP', null, '2017-07-25 09:38:49', 'p2p资金存管理5机#ZH_P2P_ZJCG_05');
INSERT INTO `intelligent_alarm` VALUES ('68', 'GTP', null, '2017-07-25 09:38:49', 'IC卡项目集中银联前置系统#ZH_JZYLQZ_01');
INSERT INTO `intelligent_alarm` VALUES ('70', 'TE', '2017-08-03 13:18:11', '2017-08-03 13:18:11', null);
INSERT INTO `intelligent_alarm` VALUES ('71', 'GTP', '2017-08-16 00:00:00', '2017-08-31 00:00:00', '村镇银行个人网银柜面2机#czhxbs4');
INSERT INTO `intelligent_alarm` VALUES ('72', 'TE', '2017-08-09 16:32:01', '2017-08-09 16:32:01', '上海分行_外汇卡前置#shwhgl');
INSERT INTO `intelligent_alarm` VALUES ('73', 'GTP', null, '2017-08-19 10:29:12', '2000');

-- ----------------------------
-- Table structure for intelligent_alarm_log
-- ----------------------------
DROP TABLE IF EXISTS `intelligent_alarm_log`;
CREATE TABLE `intelligent_alarm_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intelligent_alarm_log
-- ----------------------------
INSERT INTO `intelligent_alarm_log` VALUES ('63', 'GTP', null, '2017-08-19 06:00:00', '2000', 'admin', 'add', '2017-08-18 10:43:31', '73', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('70', 'GTP', null, '2017-09-05 10:31:32', 'MPP系统1机#ZH_MPP_01', 'zzh', 'add', '2017-09-05 10:36:20', '9', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('71', 'MQ', '2017-09-05 10:37:18', '2017-09-05 10:37:18', '人民币跨境支付前置1机#QMUCAEA', 'zzh', 'add', '2017-09-05 10:40:57', '10', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('72', 'TE', '2017-09-05 10:39:48', '2017-09-05 10:39:48', 'E商宝应用服务器A机#sesba', 'zzh', 'add', '2017-09-05 10:43:19', '11', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('73', 'TE', '2017-09-05 10:49:30', '2017-09-05 10:49:30', 'BEAI高可用应用1机#beaiA', 'zzh', 'add', '2017-09-05 10:52:58', '12', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('74', 'TE', '2017-09-05 10:54:40', '2017-09-05 10:54:40', 'sss', 'zzh', 'add', '2017-09-05 10:58:05', '5', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('75', 'TE', '2017-09-05 10:55:00', '2017-09-05 10:55:00', 'E商宝应用服务器A机#sesba', 'zzh', 'add', '2017-09-05 10:58:26', '6', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('76', 'TE', '2017-09-05 10:54:40', '2017-09-05 10:54:40', 'sss', null, 'delete', '2017-09-05 10:58:42', null, '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('77', 'TE', '2017-09-05 10:55:00', '2017-09-05 10:55:00', 'E商宝应用服务器A机', 'zzh', 'edit', '2017-09-05 10:59:04', '6', '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('78', 'TE', '2017-09-05 10:55:00', '2017-09-05 10:55:00', 'E商宝应用服务器A机', null, 'delete', '2017-09-05 10:59:26', null, '103.2.4.15');
INSERT INTO `intelligent_alarm_log` VALUES ('79', 'GTP', '2017-09-11 21:00:00', '2017-09-11 22:01:18', '1500', 'admin', 'add', '2017-09-11 11:15:20', '15', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('80', 'TE', '2017-09-11 21:00:00', '2017-09-11 22:00:00', '1500#xjwhgl', 'admin', 'add', '2017-09-11 15:19:11', '16', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('81', 'GTP', '2017-09-11 17:00:00', '2017-09-12 09:00:00', '1300', 'admin', 'add', '2017-09-11 17:26:11', '17', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('82', 'TE', '2017-09-11 17:00:00', '2017-09-12 09:00:00', '1300#1301', 'admin', 'add', '2017-09-11 17:29:28', '18', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('83', 'GTP', '2017-09-13 15:00:00', '2017-09-14 02:00:00', '1000', 'admin', 'add', '2017-09-13 16:16:10', '20', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('84', 'TE', '2017-09-13 15:00:00', '2017-09-14 02:00:00', '1000', 'admin', 'add', '2017-09-13 16:18:53', '21', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('85', 'GTP', '2017-09-15 00:00:00', '2017-09-15 06:00:00', '0300', 'admin', 'add', '2017-09-13 16:21:41', '22', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('86', 'TE', '2017-09-15 00:00:00', '2017-09-15 06:00:00', '0300#0301', 'admin', 'add', '2017-09-13 16:24:13', '23', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('87', 'GTP', '2017-09-14 18:00:00', '2017-09-14 23:55:50', '0600', 'admin', 'add', '2017-09-13 16:26:47', '24', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('88', 'TE', '2017-09-14 18:00:00', '2017-09-14 23:55:50', '0600', 'admin', 'add', '2017-09-13 16:27:58', '25', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('89', 'GTP', '2017-09-14 07:00:00', '2017-09-14 18:00:00', '0600', 'admin', 'add', '2017-09-14 13:43:06', '27', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('90', 'TE', '2017-09-14 07:00:00', '2017-09-14 18:00:00', '0600', 'admin', 'add', '2017-09-14 13:44:01', '28', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('91', 'GTP', '2017-09-14 20:00:57', '2017-09-14 23:00:04', '0600', 'admin', 'add', '2017-09-14 13:45:36', '29', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('92', 'TE', '2017-09-14 20:00:57', '2017-09-14 23:00:04', '0600', 'admin', 'add', '2017-09-14 13:46:28', '30', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('93', 'GTP', '2017-09-15 20:00:50', '2017-09-16 04:00:00', '0600', 'admin', 'add', '2017-09-14 13:47:41', '31', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('94', 'TE', '2017-09-15 20:00:50', '2017-09-16 04:00:00', '0600', 'admin', 'add', '2017-09-14 13:48:40', '32', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('95', 'GTP', '2017-09-14 18:00:01', '2017-09-14 23:24:10', '3100', 'admin', 'add', '2017-09-14 17:16:48', '33', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('96', 'TE', '2017-09-14 18:00:01', '2017-09-14 23:24:10', '6400', 'admin', 'add', '2017-09-14 17:18:11', '34', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('97', 'GTP', '2017-09-14 19:30:00', '2017-09-15 00:00:33', '0900', 'admin', 'add', '2017-09-14 17:24:06', '35', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('98', 'TE', '2017-09-14 19:30:25', '2017-09-15 00:00:33', '0900#6109', 'admin', 'add', '2017-09-14 17:25:39', '36', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('99', 'GTP', '2017-09-15 20:30:12', '2017-09-15 23:00:00', '1900', 'admin', 'add', '2017-09-14 17:27:31', '37', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('100', 'TE', '2017-09-15 20:30:12', '2017-09-15 23:00:00', '1900', 'admin', 'add', '2017-09-14 17:29:46', '38', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('101', 'GTP', '2017-09-14 21:00:00', '2017-09-14 23:00:00', '6400', 'admin', 'add', '2017-09-14 17:34:15', '39', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('102', 'TE', '2017-09-14 21:00:00', '2017-09-14 23:00:00', '6400', 'admin', 'add', '2017-09-14 17:35:46', '40', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('103', 'GTP', '2017-09-14 21:00:00', '2017-09-14 23:00:00', '3100', 'admin', 'add', '2017-09-14 17:37:49', '41', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('104', 'GTP', '2017-09-14 18:34:06', '2017-09-14 22:34:06', null, 'admin', 'add', '2017-09-14 18:37:48', '42', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('105', 'TE', '2017-09-14 18:00:00', '2017-09-14 22:00:00', null, 'admin', 'add', '2017-09-14 18:38:13', '43', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('106', 'MQ', '2017-09-14 18:00:00', '2017-09-14 22:00:00', null, 'admin', 'add', '2017-09-14 18:38:34', '44', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('107', 'MQ', '2017-09-14 19:59:29', '2017-09-14 20:30:29', 'QMYXL+QMREP', 'admin', 'add', '2017-09-14 20:00:46', '45', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('108', 'GTP', '2017-09-15 19:30:12', '2017-09-15 23:55:18', '0600', 'admin', 'add', '2017-09-15 17:26:00', '46', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('109', 'TE', '2017-09-15 19:30:12', '2017-09-15 23:55:12', '0600', 'admin', 'add', '2017-09-15 17:27:40', '47', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('110', 'GTP', '2017-09-15 22:00:05', '2017-09-15 23:50:13', '1600', 'admin', 'add', '2017-09-15 17:29:47', '48', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('111', 'TE', '2017-09-15 22:00:05', '2017-09-15 23:50:13', '1600', 'admin', 'add', '2017-09-15 17:31:21', '49', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('112', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '2500', 'admin', 'add', '2017-09-18 17:20:14', '50', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('113', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '2500', 'admin', 'add', '2017-09-18 17:21:13', '51', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('114', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '5500', 'admin', 'add', '2017-09-18 17:22:14', '52', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('115', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '5500', 'admin', 'add', '2017-09-18 17:22:48', '53', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('116', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1300', 'admin', 'add', '2017-09-18 17:23:47', '54', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('117', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1300#1301', 'admin', 'add', '2017-09-18 17:24:35', '55', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('118', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '3200', 'admin', 'add', '2017-09-18 17:25:25', '56', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('119', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '6300#3200', 'admin', 'add', '2017-09-18 17:26:53', '57', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('120', 'GTP', '2017-09-18 18:30:53', '2017-09-18 23:59:01', '3100', 'admin', 'add', '2017-09-18 17:36:59', '58', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('121', 'TE', '2017-09-18 18:30:53', '2017-09-18 23:59:01', '6400', 'admin', 'add', '2017-09-18 17:38:21', '59', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('122', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '3500', 'admin', 'add', '2017-09-18 17:39:14', '60', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('123', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '678#6780#3501', 'admin', 'add', '2017-09-18 17:45:26', '61', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('124', 'GTP', '2017-09-19 17:00:31', '2017-09-19 21:00:38', '1000', 'admin', 'add', '2017-09-19 17:03:42', '62', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('125', 'TE', '2017-09-17 17:00:31', '2017-09-19 21:00:38', '1000', 'admin', 'add', '2017-09-19 17:05:10', '63', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('126', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '2900', 'admin', 'add', '2017-09-19 17:06:59', '64', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('127', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '6100#2900', 'admin', 'add', '2017-09-19 17:07:48', '65', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('128', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '3700', 'admin', 'add', '2017-09-19 17:08:59', '66', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('129', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '3700', 'admin', 'add', '2017-09-19 17:09:34', '67', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('130', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1900', 'admin', 'add', '2017-09-19 17:10:37', '68', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('131', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1900#1', 'admin', 'add', '2017-09-19 17:11:23', '69', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('132', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '0500', 'admin', 'add', '2017-09-19 17:12:14', '70', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('133', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1100', 'admin', 'add', '2017-09-19 17:14:20', '71', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('134', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1100#1101#058', 'admin', 'add', '2017-09-19 17:15:28', '72', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('135', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '3000', 'admin', 'add', '2017-09-19 17:16:33', '73', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('136', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '6200', 'admin', 'add', '2017-09-19 17:17:07', '74', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('137', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1800', 'admin', 'add', '2017-09-19 17:17:55', '75', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('138', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '1800', 'admin', 'add', '2017-09-19 17:18:35', '76', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('139', 'GTP', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '0700', 'admin', 'add', '2017-09-19 17:34:31', '77', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('140', 'TE', '2017-09-20 00:00:00', '2017-09-20 06:00:00', '0700#0701', 'admin', 'add', '2017-09-19 17:35:11', '78', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('141', 'GTP', '2017-09-20 21:00:00', '2017-09-20 23:55:00', '2400', 'admin', 'add', '2017-09-20 16:48:36', '79', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('142', 'TE', '2017-09-20 21:00:00', '2017-09-20 23:55:00', '2400', 'admin', 'add', '2017-09-20 16:49:15', '80', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('143', 'GTP', '2017-09-22 22:00:00', '2017-09-23 07:30:00', '0500', 'admin', 'add', '2017-09-20 16:50:57', '81', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('144', 'TE', '2017-09-22 22:00:00', '2017-09-23 07:30:00', '0500#0501#whgl', 'admin', 'add', '2017-09-20 16:53:34', '82', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('145', 'GTP', '2017-09-22 22:00:00', '2017-09-23 05:00:00', '3100', 'admin', 'add', '2017-09-20 16:55:08', '83', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('146', 'TE', '2017-09-22 22:00:00', '2017-09-23 05:00:00', '6400', 'admin', 'add', '2017-09-20 16:55:54', '84', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('147', 'GTP', '2017-09-30 20:00:00', '2017-10-01 18:00:00', '3100', 'admin', 'add', '2017-09-20 16:56:49', '85', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('148', 'TE', '2017-09-30 20:00:00', '2017-10-01 18:00:00', '6400', 'admin', 'add', '2017-09-20 16:57:26', '86', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('149', 'GTP', '2017-09-20 19:10:00', '2017-09-20 20:00:00', '1500', 'admin', 'add', '2017-09-20 16:59:31', '87', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('150', 'TE', '2017-09-20 19:10:00', '2017-09-20 20:00:00', '1500#whgl', 'admin', 'add', '2017-09-20 17:00:42', '88', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('151', 'GTP', '2017-09-21 09:10:03', '2017-09-21 20:00:00', '1300', 'admin', 'add', '2017-09-21 10:25:20', '89', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('152', 'TE', '2017-09-21 09:10:00', '2017-09-21 20:00:00', '1300#1301', 'admin', 'add', '2017-09-21 10:26:29', '90', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('153', 'GTP', '2017-09-21 22:00:00', '2017-09-22 02:00:00', '4700', 'admin', 'add', '2017-09-21 10:28:12', '91', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('154', 'TE', '2017-09-21 22:00:00', '2017-09-22 02:00:00', '4700#hfwhj', 'admin', 'add', '2017-09-21 10:29:15', '92', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('155', 'GTP', '2017-09-21 10:57:48', '2017-10-16 10:00:00', 'FH_0300_SJ_01', 'admin', 'add', '2017-09-21 11:00:37', '93', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('156', 'TE', '2017-09-21 11:00:00', '2017-10-16 10:00:00', 'FH_0300_SJ_01', 'admin', 'add', '2017-09-21 11:01:09', '94', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('157', 'TE', '2017-09-21 11:00:00', '2017-10-16 10:00:00', 'FH_0300_SJ_01', null, 'delete', '2017-09-21 11:07:38', null, '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('158', 'GTP', '2017-09-21 11:08:15', '2017-09-21 17:20:15', 'ZH_ZCTG_01+ZH_FINANCE_01', 'admin', 'add', '2017-09-21 11:09:40', '95', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('159', 'GTP', '2017-09-21 15:38:34', '2017-10-16 10:00:00', 'FH_0300_JXKH-02', 'admin', 'add', '2017-09-21 15:39:42', '96', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('160', 'GTP', '2017-09-21 15:40:00', '2017-10-16 10:00:00', 'FH_0300_JXKH_02', 'admin', 'add', '2017-09-21 15:40:52', '97', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('161', 'GTP', '2017-09-21 17:30:00', '2017-09-21 19:30:00', '8400', 'admin', 'add', '2017-09-21 15:43:06', '98', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('162', 'GTP', '2017-09-21 17:30:00', '2017-09-21 19:30:00', '8400', null, 'delete', '2017-09-21 15:44:19', null, '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('163', 'GTP', '2017-09-21 15:38:34', '2017-10-16 10:00:00', 'FH_0300_JXKH-02', null, 'delete', '2017-09-21 15:44:30', null, '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('164', 'GTP', '2017-09-21 17:30:00', '2017-09-21 18:30:00', '8400', 'admin', 'add', '2017-09-21 15:45:37', '99', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('165', 'GTP', '2017-09-21 18:00:00', '2017-09-21 19:30:00', '1900', 'admin', 'add', '2017-09-21 15:48:33', '100', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('166', 'TE', '2017-09-21 18:00:00', '2017-09-21 19:30:00', '1900#wzwhqz1', 'admin', 'add', '2017-09-21 15:50:03', '101', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('167', 'GTP', '2017-09-21 18:00:35', '2017-09-21 19:00:57', '1000', 'admin', 'add', '2017-09-21 17:21:57', '102', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('168', 'TE', '2017-09-21 18:00:35', '2017-09-21 19:00:57', '1000', 'admin', 'add', '2017-09-21 17:23:09', '103', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('169', 'GTP', '2017-09-21 18:00:56', '2017-09-22 06:00:05', '3000', 'admin', 'add', '2017-09-21 17:24:50', '104', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('170', 'TE', '2017-09-21 18:00:56', '2017-09-22 06:00:05', '6200', 'admin', 'add', '2017-09-21 17:25:53', '105', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('171', 'GTP', '2017-09-21 22:00:00', '2017-09-22 00:00:00', '3100', 'admin', 'add', '2017-09-21 17:26:51', '106', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('172', 'TE', '2017-09-21 22:00:00', '2017-09-22 00:00:00', '6400', 'admin', 'add', '2017-09-21 17:27:24', '107', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('173', 'TE', '2017-09-21 20:00:00', '2017-09-21 21:00:00', '1200#1201', 'admin', 'add', '2017-09-21 17:30:32', '108', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('174', 'GTP', '2017-09-21 20:00:00', '2017-09-21 21:00:00', '1200', 'admin', 'add', '2017-09-21 17:33:03', '109', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('175', 'GTP', '2017-09-22 08:36:51', '2017-09-22 17:20:51', 'ZH_ZCTG_01', 'admin', 'add', '2017-09-22 08:37:13', '112', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('176', 'GTP', '2017-09-22 18:00:00', '2017-09-23 23:00:00', '1000', 'admin', 'add', '2017-09-22 16:28:00', '113', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('177', 'TE', '2017-09-22 18:00:00', '2017-09-23 23:00:00', '1000', 'admin', 'add', '2017-09-22 16:29:06', '114', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('178', 'GTP', '2017-09-22 18:00:50', '2017-09-23 08:30:00', '1800', 'admin', 'add', '2017-09-22 16:31:44', '115', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('179', 'TE', '2017-09-22 18:00:50', '2017-09-23 08:30:00', '1800', 'admin', 'add', '2017-09-22 16:32:43', '116', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('180', 'GTP', '2017-09-22 20:00:40', '2017-09-23 06:00:46', '3100', 'admin', 'add', '2017-09-22 16:35:02', '117', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('181', 'TE', '2017-09-22 20:00:40', '2017-09-23 06:00:47', '6400', 'admin', 'add', '2017-09-22 16:36:00', '118', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('182', 'GTP', '2017-09-22 18:00:00', '2017-09-22 21:00:00', '0600', 'admin', 'add', '2017-09-22 16:37:10', '119', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('183', 'TE', '2017-09-22 18:00:00', '2017-09-22 21:00:00', '0600', 'admin', 'add', '2017-09-22 16:37:45', '120', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('184', 'GTP', '2017-09-22 19:30:00', '2017-09-23 00:00:00', '1500', 'admin', 'add', '2017-09-22 16:38:53', '121', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('185', 'TE', '2017-09-22 19:30:00', '2017-09-22 23:00:00', '1500#xjwhgl', 'admin', 'add', '2017-09-22 16:40:08', '122', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('186', 'GTP', '2017-09-22 19:30:00', '2017-09-23 00:00:00', '1500', null, 'delete', '2017-09-22 16:41:19', null, '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('187', 'GTP', '2017-09-22 19:30:00', '2017-09-22 23:00:00', '1500', 'admin', 'add', '2017-09-22 16:41:57', '123', '103.2.4.13');
INSERT INTO `intelligent_alarm_log` VALUES ('188', 'MQ', '2017-09-22 21:06:15', '2017-09-23 07:06:15', 'QM_304_000000#QMFXMB#QMUMBFEA', 'admin', 'add', '2017-09-22 21:14:38', '124', '103.2.4.34');
INSERT INTO `intelligent_alarm_log` VALUES ('189', 'GTP', '2017-09-25 21:00:52', '2017-09-25 23:00:06', '1400', 'admin', 'add', '2017-09-25 17:03:53', '125', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('190', 'TE', '2017-09-25 21:00:52', '2017-09-25 23:00:06', '1400#xawhyyb', 'admin', 'add', '2017-09-25 17:05:14', '126', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('191', 'GTP', '2017-09-25 19:45:00', '2017-09-26 05:00:00', '3100', 'admin', 'add', '2017-09-25 17:06:27', '127', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('192', 'TE', '2017-09-25 19:45:00', '2017-09-26 05:00:00', '6400', 'admin', 'add', '2017-09-25 17:07:19', '128', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('193', 'GTP', '2017-09-26 20:30:00', '2017-09-27 02:00:00', '1300', 'admin', 'add', '2017-09-25 17:08:52', '129', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('194', 'TE', '2017-09-26 20:30:00', '2017-09-27 00:00:00', null, 'admin', 'add', '2017-09-25 17:09:13', '130', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('195', 'TE', '2017-09-26 20:30:00', '2017-09-27 00:00:00', null, null, 'delete', '2017-09-25 17:09:54', null, '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('196', 'TE', '2017-09-26 20:30:00', '2017-09-27 02:00:00', '1300#1301', 'admin', 'add', '2017-09-25 17:11:01', '131', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('197', 'GTP', '2017-09-26 19:00:05', '2017-09-27 06:00:00', '3100', 'admin', 'add', '2017-09-26 18:13:38', '132', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('198', 'TE', '2017-09-26 19:00:05', '2017-09-27 06:00:00', '6400', 'admin', 'add', '2017-09-26 18:14:18', '133', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('199', 'GTP', '2017-09-27 19:00:05', '2017-09-27 23:00:55', '2000', 'admin', 'add', '2017-09-26 18:15:47', '134', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('200', 'TE', '2017-09-27 19:00:05', '2017-09-27 23:00:55', '2000#qdwhjzl', 'admin', 'add', '2017-09-26 18:16:35', '135', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('201', 'GTP', '2017-09-27 15:05:35', '2017-10-20 10:00:00', 'ZH_GL_01+ZH_TYITZYGL_01', 'admin', 'add', '2017-09-27 15:10:50', '136', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('202', 'GTP', '2017-09-27 15:07:02', '2017-10-20 10:00:00', 'ZH_GL_02+ZH_TYITZYGL_01', 'admin', 'add', '2017-09-27 15:11:12', '137', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('203', 'GTP', '2017-09-27 18:00:10', '2017-09-28 06:00:26', '3100', 'admin', 'add', '2017-09-27 17:10:53', '138', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('204', 'TE', '2017-09-27 18:00:10', '2017-09-28 06:00:26', '6400', 'admin', 'add', '2017-09-27 17:11:37', '139', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('205', 'GTP', '2017-09-27 23:30:00', '2017-09-28 04:00:00', '1300#1301', 'admin', 'add', '2017-09-27 17:12:51', '140', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('206', 'TE', '2017-09-27 23:30:00', '2017-09-28 04:00:00', '1300#1301', 'admin', 'add', '2017-09-27 17:13:42', '141', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('207', 'GTP', '2017-09-27 23:30:00', '2017-09-28 04:00:00', '1300#1301', null, 'delete', '2017-09-27 17:13:59', null, '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('208', 'GTP', '2017-09-27 23:30:00', '2017-09-28 04:00:00', '1300', 'admin', 'add', '2017-09-27 17:14:31', '142', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('209', 'GTP', '2017-09-28 22:00:00', '2017-09-29 02:00:00', '0400', 'admin', 'add', '2017-09-27 17:15:38', '143', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('210', 'TE', '2017-09-28 22:00:00', '2017-09-29 02:00:00', '0400#cpeshz', 'admin', 'add', '2017-09-27 17:16:53', '144', '103.2.4.46');
INSERT INTO `intelligent_alarm_log` VALUES ('211', 'GTP', '2017-09-28 19:00:00', '2017-09-28 20:00:26', '4700', 'admin', 'add', '2017-09-28 17:14:36', '145', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('212', 'TE', '2017-09-28 19:00:00', '2017-09-28 20:00:26', '4700#hfwhj', 'admin', 'add', '2017-09-28 17:15:23', '146', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('213', 'GTP', '2017-09-29 18:00:00', '2017-09-29 21:00:00', '0300', 'admin', 'add', '2017-09-28 17:16:37', '147', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('214', 'TE', '2017-09-29 18:00:00', '2017-09-29 21:00:00', '0300#0301', 'admin', 'add', '2017-09-28 17:17:15', '148', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('215', 'GTP', '2017-09-28 20:00:00', '2017-09-28 22:00:00', '3400', 'admin', 'add', '2017-09-28 17:18:10', '149', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('216', 'TE', '2017-09-28 20:00:00', '2017-09-28 22:00:00', '3400#cstc', 'admin', 'add', '2017-09-28 17:19:01', '150', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('217', 'GTP', '2017-09-27 15:07:02', '2017-10-20 10:00:00', 'ZH_GL_02+ZH_TYITZYGL_01', null, 'delete', '2017-09-29 10:35:48', null, '103.2.4.39');
INSERT INTO `intelligent_alarm_log` VALUES ('218', 'GTP', '2017-09-27 15:05:35', '2017-10-20 10:00:00', 'ZH_GL_01+ZH_TYITZYGL_01', null, 'delete', '2017-09-29 10:35:54', null, '103.2.4.39');
INSERT INTO `intelligent_alarm_log` VALUES ('219', 'GTP', '2017-09-29 18:00:37', '2017-09-29 19:11:47', '3700', 'admin', 'add', '2017-09-29 17:07:43', '151', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('220', 'TE', '2017-09-29 18:00:37', '2017-09-29 19:11:47', '3700', 'admin', 'add', '2017-09-29 17:08:31', '152', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('221', 'GTP', '2017-09-29 20:00:00', '2017-09-29 22:00:00', '5500', 'admin', 'add', '2017-09-29 17:09:47', '153', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('222', 'TE', '2017-09-29 20:00:00', '2017-09-29 22:00:00', '5500', 'admin', 'add', '2017-09-29 17:10:41', '154', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('223', 'GTP', '2017-09-30 17:30:26', '2017-10-04 00:00:49', '2000', 'admin', 'add', '2017-09-30 16:24:30', '155', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('224', 'TE', '2017-09-30 17:30:29', '2017-10-04 00:00:49', '2000#qdwhjzl', 'admin', 'add', '2017-09-30 16:25:36', '156', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('225', 'GTP', '2017-09-30 22:00:00', '2017-09-30 23:59:59', '1600', 'admin', 'add', '2017-09-30 16:26:50', '157', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('226', 'TE', '2017-09-30 22:00:00', '2017-09-30 23:59:59', '1600', 'admin', 'add', '2017-09-30 16:27:30', '158', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('227', 'GTP', '2017-10-07 18:00:00', '2017-10-08 08:00:00', '1300', 'admin', 'add', '2017-09-30 16:29:17', '159', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('228', 'TE', '2017-10-07 18:00:00', '2017-10-08 08:00:00', '1300#1301', 'admin', 'add', '2017-09-30 16:30:41', '160', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('229', 'GTP', '2017-09-30 20:00:41', '2017-10-01 08:00:39', '3100', 'admin', 'add', '2017-09-30 16:32:03', '161', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('230', 'TE', '2017-09-30 20:00:41', '2017-10-01 08:00:41', '6400', 'admin', 'add', '2017-09-30 16:32:44', '162', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('231', 'GTP', '2017-10-01 00:00:16', '2017-10-01 07:00:00', '0800', 'admin', 'add', '2017-09-30 16:37:35', '163', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('232', 'TE', '2017-10-01 00:00:12', '2017-10-01 07:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:38:48', '164', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('233', 'TE', '2017-10-01 08:30:00', '2017-10-01 18:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:40:30', '165', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('234', 'TE', '2017-10-01 20:00:00', '2017-10-01 23:59:59', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:42:12', '166', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('235', 'GTP', '2017-10-01 20:00:00', '2017-10-01 23:59:59', '0800', 'admin', 'add', '2017-09-30 16:43:38', '167', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('236', 'GTP', '2017-10-01 08:30:00', '2017-10-01 18:00:00', '0800', 'admin', 'add', '2017-09-30 16:44:41', '168', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('237', 'GTP', '2017-10-02 00:00:00', '2017-10-02 08:00:00', '0800', 'admin', 'add', '2017-09-30 16:46:06', '169', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('238', 'TE', '2017-10-02 00:00:00', '2017-10-02 08:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:46:45', '170', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('239', 'GTP', '2017-10-02 08:30:00', '2017-10-02 18:00:00', '0800', 'admin', 'add', '2017-09-30 16:47:29', '171', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('240', 'TE', '2017-10-02 08:30:00', '2017-10-02 18:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:47:59', '172', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('241', 'GTP', '2017-10-02 19:00:00', '2017-10-02 23:59:59', '0800', 'admin', 'add', '2017-09-30 16:48:42', '173', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('242', 'TE', '2017-10-02 19:00:00', '2017-10-02 23:59:59', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:49:14', '174', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('243', 'GTP', '2017-10-03 00:00:00', '2017-10-03 07:00:00', '0800', 'admin', 'add', '2017-09-30 16:50:48', '175', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('244', 'TE', '2017-10-03 00:00:00', '2017-10-03 07:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:51:18', '176', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('245', 'GTP', '2017-10-03 08:30:00', '2017-10-03 18:00:00', '8000', 'admin', 'add', '2017-09-30 16:51:50', '177', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('246', 'GTP', '2017-10-03 08:30:00', '2017-10-03 18:00:00', '8000', null, 'delete', '2017-09-30 16:52:01', null, '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('247', 'GTP', '2017-10-03 08:30:00', '2017-10-03 18:00:00', '0800', 'admin', 'add', '2017-09-30 16:52:53', '178', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('248', 'TE', '2017-10-03 08:30:00', '2017-10-03 18:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:53:19', '179', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('249', 'GTP', '2017-10-05 00:00:00', '2017-10-05 07:00:00', '0800', 'admin', 'add', '2017-09-30 16:54:21', '180', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('250', 'TE', '2017-10-05 00:00:00', '2017-10-05 07:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:54:51', '181', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('251', 'GTP', '2017-10-06 19:00:00', '2017-10-06 21:00:00', '0800', 'admin', 'add', '2017-09-30 16:55:40', '182', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('252', 'TE', '2017-10-06 19:00:00', '2017-10-06 21:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:56:10', '183', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('253', 'GTP', '2017-10-12 05:00:00', '2017-10-12 06:00:00', '0800', 'admin', 'add', '2017-09-30 16:57:11', '184', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('254', 'TE', '2017-10-12 05:00:00', '2017-10-12 06:00:00', '0800#0801#fcascli', 'admin', 'add', '2017-09-30 16:57:45', '185', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('255', 'GTP', '2017-10-09 08:48:30', '2017-10-10 08:30:00', 'KC_TYZK', 'admin', 'add', '2017-10-09 08:50:44', '186', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('256', 'TE', '2017-10-09 08:50:00', '2017-10-10 08:30:00', 'KC_TYZK', 'admin', 'add', '2017-10-09 08:51:28', '187', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('257', 'GTP', '2017-10-09 08:50:00', '2017-10-10 08:30:00', 'ZH_DZXJ_01', 'admin', 'add', '2017-10-09 08:52:44', '188', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('258', 'TE', '2017-10-09 08:50:00', '2017-10-10 08:30:00', 'ZH_DZXJ_01', 'admin', 'add', '2017-10-09 08:53:18', '189', '103.2.4.42');
INSERT INTO `intelligent_alarm_log` VALUES ('259', 'TE', '2017-10-09 08:50:00', '2017-10-10 08:30:00', 'ZH_DZXJ_01', null, 'delete', '2017-10-09 15:16:03', null, '103.2.4.39');
INSERT INTO `intelligent_alarm_log` VALUES ('260', 'TE', '2017-10-09 08:50:00', '2017-10-10 08:30:00', 'KC_TYZK', null, 'delete', '2017-10-09 15:16:20', null, '103.2.4.39');
INSERT INTO `intelligent_alarm_log` VALUES ('261', 'GTP', '2017-10-09 17:30:05', '2017-10-09 23:43:13', '2000', 'admin', 'add', '2017-10-09 15:19:16', '190', '103.2.4.39');
INSERT INTO `intelligent_alarm_log` VALUES ('262', 'TE', '2017-10-09 17:30:05', '2017-10-09 23:43:13', '2000#qdwhjzl', 'admin', 'add', '2017-10-09 15:20:17', '191', '103.2.4.39');
INSERT INTO `intelligent_alarm_log` VALUES ('263', 'GTP', '2017-10-11 18:00:00', '2017-10-11 22:00:00', '0300', 'admin', 'add', '2017-10-11 16:56:54', '192', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('264', 'TE', '2017-10-11 18:00:00', '2017-10-11 22:00:00', '0300#0301', 'admin', 'add', '2017-10-11 16:57:43', '193', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('265', 'GTP', '2017-10-11 19:00:56', '2017-10-11 22:00:35', '1400', 'admin', 'add', '2017-10-11 16:58:56', '194', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('266', 'TE', '2017-10-11 19:00:56', '2017-10-11 22:00:35', '1400#xawhyyb', 'admin', 'add', '2017-10-11 17:00:38', '195', '103.2.4.32');
INSERT INTO `intelligent_alarm_log` VALUES ('267', 'GTP', '2017-10-12 18:00:00', '2017-10-12 22:00:00', '0300', 'admin', 'add', '2017-10-12 17:09:50', '196', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('268', 'TE', '2017-10-12 18:00:00', '2017-10-12 22:00:00', '0300#0301', 'admin', 'add', '2017-10-12 17:11:06', '197', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('269', 'GTP', '2017-10-12 19:29:02', '2017-10-13 17:10:02', 'ZH_WY_01+ZH_ESB_WLBAT_01', 'admin', 'add', '2017-10-12 19:29:47', '201', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('270', 'GTP', null, '2017-10-13 17:10:00', 'ZH_ESB_WYBAT_01+ZH_BANCS_01', 'admin', 'add', '2017-10-12 19:32:09', '202', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('271', 'GTP', null, '2017-10-13 17:10:00', 'ZH_ESB_WLBAT_02+ZH_BANCS_01', 'admin', 'add', '2017-10-12 19:32:36', '203', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('272', 'GTP', null, '2017-10-13 17:10:00', 'ZH_ESB_WLBAT_01+ZH_REPORT_01', 'admin', 'add', '2017-10-12 19:32:57', '204', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('273', 'GTP', null, '2017-10-13 17:10:00', 'ZH_ESB_WLBAT_02+ZH_REPORT_01', 'admin', 'add', '2017-10-12 19:33:11', '205', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('274', 'GTP', null, '2017-10-13 17:10:00', 'ZH_ESB_WLBAT_01+ZH_XYK_01', 'admin', 'add', '2017-10-12 19:33:27', '206', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('275', 'GTP', null, '2017-10-13 17:10:00', 'ZH_ESB_WLBAT_02+ZH_XYK_01', 'admin', 'add', '2017-10-12 19:33:43', '207', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('276', 'GTP', null, '2017-10-13 17:10:02', 'ZH_WY_01+ZH_ESB_WLBAT_01', 'admin', 'edit', '2017-10-12 19:34:34', '201', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('277', 'GTP', null, '2017-10-23 17:10:02', 'ZH_WY_01+ZH_ESB_WLBAT_01', 'admin', 'edit', '2017-10-13 09:18:22', '201', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('278', 'GTP', null, '2017-10-16 17:10:00', 'ZH_ESB_WLBAT_01+ZH_XYK_01', 'admin', 'edit', '2017-10-13 09:18:43', '206', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('279', 'GTP', null, '2017-10-16 17:10:02', 'ZH_WY_01+ZH_ESB_WLBAT_01', 'admin', 'edit', '2017-10-13 09:18:54', '201', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('280', 'GTP', null, '2017-10-16 17:10:00', 'ZH_ESB_WLBAT_02+ZH_REPORT_01', 'admin', 'edit', '2017-10-13 09:19:03', '205', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('281', 'GTP', null, '2017-10-16 17:10:00', 'ZH_ESB_WLBAT_01+ZH_REPORT_01', 'admin', 'edit', '2017-10-13 09:19:10', '204', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('282', 'GTP', null, '2017-10-16 17:10:00', 'ZH_ESB_WLBAT_02+ZH_BANCS_01', 'admin', 'edit', '2017-10-13 09:19:21', '203', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('283', 'GTP', null, '2017-10-16 17:10:00', 'ZH_ESB_WYBAT_01+ZH_BANCS_01', 'admin', 'edit', '2017-10-13 09:19:31', '202', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('284', 'GTP', null, '2017-10-16 17:10:00', 'ZH_ESB_WLBAT_02+ZH_XYK_01', 'admin', 'edit', '2017-10-13 09:19:40', '207', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('285', 'GTP', null, '2017-10-16 17:10:00', 'ZH_WY_01+ZH_ESB_WLBAT_01', 'admin', 'edit', '2017-10-13 09:30:48', '201', '103.2.4.36');
INSERT INTO `intelligent_alarm_log` VALUES ('286', 'GTP', null, null, 'FH_0300_SJ_01', 'admin', 'add', '2017-10-19 15:50:56', '208', '103.2.4.50');
INSERT INTO `intelligent_alarm_log` VALUES ('287', 'GTP', '2017-10-25 19:30:00', '2017-10-25 20:30:00', '1200', 'admin', 'add', '2017-10-25 17:26:05', '209', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('288', 'TE', '2017-10-25 19:30:00', '2017-10-25 20:30:00', '1200#1201', 'admin', 'add', '2017-10-25 17:26:55', '210', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('289', 'GTP', '2017-10-25 22:00:00', '2017-10-25 22:30:00', '0500', 'admin', 'add', '2017-10-25 17:28:00', '211', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('290', 'TE', '2017-10-25 22:00:00', '2017-10-25 22:30:00', 'shwhgl#0500#0501', 'admin', 'add', '2017-10-25 17:29:13', '212', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('291', 'GTP', '2017-10-26 18:00:00', '2017-10-27 06:00:00', '5100', 'admin', 'add', '2017-10-26 10:12:13', '213', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('292', 'TE', '2017-10-26 18:00:00', '2017-10-27 06:00:00', '5100', 'admin', 'add', '2017-10-26 10:12:53', '214', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('293', 'GTP', '2017-10-26 10:00:00', '2017-10-26 12:00:00', '2100', 'admin', 'add', '2017-10-26 10:14:20', '215', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('294', 'GTP', '2017-10-26 18:00:00', '2017-10-26 22:00:00', '1100', 'admin', 'add', '2017-10-26 10:16:23', '216', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('295', 'TE', '2017-10-26 18:00:00', '2017-10-26 22:00:00', 'whwh058+1100+1101', 'admin', 'add', '2017-10-26 10:17:38', '217', '103.2.4.47');
INSERT INTO `intelligent_alarm_log` VALUES ('296', 'GTP', '2017-10-26 18:25:00', '2017-10-26 19:00:00', '0900', 'admin', 'add', '2017-10-26 17:17:52', '218', '103.2.4.43');
INSERT INTO `intelligent_alarm_log` VALUES ('297', 'TE', '2017-10-26 18:25:00', '2017-10-26 19:00:00', '0900+6109', 'admin', 'add', '2017-10-26 17:19:11', '219', '103.2.4.43');
INSERT INTO `intelligent_alarm_log` VALUES ('298', 'GTP', '2017-10-27 18:00:35', '2017-10-27 19:00:48', '1700', 'admin', 'add', '2017-10-26 17:20:38', '220', '103.2.4.43');
INSERT INTO `intelligent_alarm_log` VALUES ('299', 'TE', '2017-10-27 18:00:35', '2017-10-27 19:00:48', '1700+1701', 'admin', 'add', '2017-10-26 17:21:29', '221', '103.2.4.43');
INSERT INTO `intelligent_alarm_log` VALUES ('300', 'GTP', null, '2017-10-26 23:05:20', null, 'admin', 'add', '2017-10-26 18:13:52', '222', '103.2.4.34');
INSERT INTO `intelligent_alarm_log` VALUES ('301', 'TE', null, '2017-10-26 23:00:00', null, 'admin', 'add', '2017-10-26 18:14:01', '223', '103.2.4.34');
INSERT INTO `intelligent_alarm_log` VALUES ('302', 'MQ', null, '2017-10-26 23:00:00', null, 'admin', 'add', '2017-10-26 18:14:05', '224', '103.2.4.34');
INSERT INTO `intelligent_alarm_log` VALUES ('303', 'GTP', null, '2017-10-26 23:00:00', null, 'admin', 'edit', '2017-10-26 18:14:30', '222', '103.2.4.34');
INSERT INTO `intelligent_alarm_log` VALUES ('304', 'GTP', '2017-10-26 22:00:00', '2017-10-27 03:00:17', 'ZH_FINANCE_05', 'admin', 'add', '2017-10-26 21:32:38', '225', '103.2.4.34');
INSERT INTO `intelligent_alarm_log` VALUES ('305', 'GTP', '2017-10-27 09:36:35', '2017-10-27 12:00:00', '2100', 'admin', 'add', '2017-10-27 09:57:25', '226', '103.2.4.41');
INSERT INTO `intelligent_alarm_log` VALUES ('306', 'TE', null, '2017-11-10 10:38:30', '中金综合前置+交易结果为13', 'admin', 'add', '2017-10-27 10:47:54', '227', '103.2.4.37');
INSERT INTO `intelligent_alarm_log` VALUES ('307', 'GTP', '2017-10-27 18:00:00', '2017-10-27 19:00:00', '0700', 'admin', 'add', '2017-10-27 17:19:16', '228', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('308', 'TE', '2017-10-27 18:00:00', '2017-10-27 19:00:00', '0700+0701', 'admin', 'add', '2017-10-27 17:19:55', '229', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('309', 'GTP', '2017-10-28 22:04:15', '2017-10-28 23:55:23', '0400', 'admin', 'add', '2017-10-27 17:21:18', '230', '103.2.4.48');
INSERT INTO `intelligent_alarm_log` VALUES ('310', 'TE', '2017-10-28 22:04:15', '2017-10-28 23:55:23', 'cpeshz+0400', 'admin', 'add', '2017-10-27 17:22:59', '231', '103.2.4.48');

-- ----------------------------
-- Table structure for mc_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `mc_auth_access`;
CREATE TABLE `mc_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of mc_auth_access
-- ----------------------------
INSERT INTO `mc_auth_access` VALUES ('37', '53', 'index/setting/default', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('38', '53', 'index/menu/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('39', '53', 'index/menu/add', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('40', '53', 'index/user/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('41', '53', 'index/role/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('42', '53', 'index/auth/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('43', '2', 'index/setting/default', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('44', '2', 'index/menu/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('45', '2', 'index/menu/add', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('46', '2', 'index/user/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('47', '2', 'index/role/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('48', '2', 'index/auth/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('49', '3', 'index/tool/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('50', '3', 'index/tool/sms', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('51', '4', 'index/tool/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('52', '4', 'index/host/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('53', '4', 'index/tool/sms', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('54', '4', 'index/tool/gtp', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('55', '4', 'index/tool/file', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('56', '4', 'index/tool/chart', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('57', '4', 'index//', 'admin_url');

-- ----------------------------
-- Table structure for mc_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `mc_auth_rule`;
CREATE TABLE `mc_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) CHARACTER SET utf8mb4 NOT NULL COMMENT '规则所属module',
  `type` varchar(30) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of mc_auth_rule
-- ----------------------------
INSERT INTO `mc_auth_rule` VALUES ('2', '1', 'index', 'admin_url', 'index/Setting/default', '', '系统设置', '');
INSERT INTO `mc_auth_rule` VALUES ('3', '1', 'index', 'admin_url', 'index/Report/index', '', '系统巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('4', '1', 'index', 'admin_url', 'index/Menu/index', '', '后台菜单', '');
INSERT INTO `mc_auth_rule` VALUES ('5', '1', 'index', 'admin_url', 'index/User/index', '', '用户管理', '');
INSERT INTO `mc_auth_rule` VALUES ('6', '1', 'index', 'admin_url', 'index/Role/index', '', '角色管理', '');
INSERT INTO `mc_auth_rule` VALUES ('7', '1', 'index', 'admin_url', 'index/Auth/index', '', '权限管理', '');
INSERT INTO `mc_auth_rule` VALUES ('8', '1', 'index', 'admin_url', 'index/Menu/add', '', '新增菜单', '');
INSERT INTO `mc_auth_rule` VALUES ('9', '1', 'index', 'admin_url', 'index/Report/linux', '', 'Linu巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('10', '1', 'index', 'admin_url', 'index/Report/windows', '', 'Windows巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('11', '1', 'index', 'admin_url', 'index/Report/mq', '', 'MQ巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('12', '1', 'index', 'admin_url', 'index/Report/was', '', 'was巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('13', '1', 'index', 'admin_url', 'index/Report/oracle', '', 'Oracle巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('14', '1', 'index', 'admin_url', 'index/Host/index', '', '新上线主机添加', '');
INSERT INTO `mc_auth_rule` VALUES ('15', '1', 'index', 'admin_url', 'index/Tool/sms', '', '报警短信黑名单', '');
INSERT INTO `mc_auth_rule` VALUES ('16', '1', 'index', 'admin_url', 'index/Tool/gtp', '', 'GTP传输失败文件查询', '');
INSERT INTO `mc_auth_rule` VALUES ('17', '1', 'index', 'admin_url', 'index/Tool/file', '', '查询文件是否存在            ', '');
INSERT INTO `mc_auth_rule` VALUES ('18', '1', 'index', 'admin_url', 'index/Tool/chart', '', '设备故障信息统计', '');
INSERT INTO `mc_auth_rule` VALUES ('19', '1', 'index', 'admin_url', 'index/Tool/index', '', '系统工具', '');
INSERT INTO `mc_auth_rule` VALUES ('20', '1', 'index', 'admin_url', 'index/Link/index', '', '首页导航管理', '');
INSERT INTO `mc_auth_rule` VALUES ('21', '1', 'index', 'admin_url', 'index//', '', '首页导航', '');

-- ----------------------------
-- Table structure for mc_gtp_failfile
-- ----------------------------
DROP TABLE IF EXISTS `mc_gtp_failfile`;
CREATE TABLE `mc_gtp_failfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `strtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `result` text,
  `indate` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mc_gtp_failfile
-- ----------------------------
INSERT INTO `mc_gtp_failfile` VALUES ('1', '20171110122401', '2017-11-10 12:23:59', '2017-11-10 12:23:59', null, '2017-11-10 12:24:01', 'N');
INSERT INTO `mc_gtp_failfile` VALUES ('2', '20171110122426', '2017-11-10 12:24:25', '2017-11-10 12:24:25', null, '2017-11-10 12:24:26', 'N');
INSERT INTO `mc_gtp_failfile` VALUES ('3', '20171110122626', '2017-11-10 12:26:24', '2017-11-10 12:26:24', null, '2017-11-10 12:26:26', 'N');
INSERT INTO `mc_gtp_failfile` VALUES ('4', '20171110122628', '2017-11-10 12:26:27', '2017-11-10 12:26:27', null, '2017-11-10 12:26:28', 'N');
INSERT INTO `mc_gtp_failfile` VALUES ('5', '20171110122635', '2017-11-10 12:26:33', '2017-11-10 12:26:33', null, '2017-11-10 12:26:35', 'N');
INSERT INTO `mc_gtp_failfile` VALUES ('6', '20171110163236', '2017-11-10 16:32:32', '2017-11-10 16:32:31', null, '2017-11-10 16:32:36', 'N');
INSERT INTO `mc_gtp_failfile` VALUES ('8', '20171110170621', '2017-11-10 17:06:17', '2017-11-10 17:06:17', null, '2017-11-10 17:06:21', 'N');

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
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mc_intelligent_alarm_log
-- ----------------------------
INSERT INTO `mc_intelligent_alarm_log` VALUES ('311', 'TE', '2017-11-06 09:34:25', '2017-11-06 09:34:25', '666', 'admin', 'add', '2017-11-06 09:34:34', '229', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('312', 'TE', '2017-11-09 09:38:37', '2017-11-09 09:38:37', 'eeee', 'admin', 'add', '2017-11-09 09:45:21', '230', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('313', 'GTP', '2017-11-09 12:06:59', '2017-11-09 12:06:59', 'MPP系统1机#ZH_MPP_01', 'admin', 'add', '2017-11-09 12:07:24', '231', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('314', 'TE', '2017-11-10 15:33:05', '2017-11-10 15:33:05', 'fdsfdfd', 'admin', 'add', '2017-11-10 15:33:11', '232', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('315', 'TE', '2017-11-10 15:33:12', '2017-11-10 15:33:12', '44', 'admin', 'add', '2017-11-10 15:36:13', '233', '::1');
INSERT INTO `mc_intelligent_alarm_log` VALUES ('316', 'MQ', '2017-11-10 15:36:14', '2017-11-10 15:36:14', 'werwer', 'admin', 'add', '2017-11-10 15:37:04', '234', '::1');

-- ----------------------------
-- Table structure for mc_link
-- ----------------------------
DROP TABLE IF EXISTS `mc_link`;
CREATE TABLE `mc_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `link` varchar(255) NOT NULL DEFAULT '1' COMMENT '链接',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `picture` varchar(255) DEFAULT '' COMMENT '首页大图',
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '链接名称',
  `icon` varchar(20) DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='超级链接表';

-- ----------------------------
-- Records of mc_link
-- ----------------------------
INSERT INTO `mc_link` VALUES ('1', '0', '333', '1', '0', '', '33', '', '');
INSERT INTO `mc_link` VALUES ('2', '0', '1122', '1', '0', '', '1122', '', '');
INSERT INTO `mc_link` VALUES ('3', '0', '恶趣味请问', '1', '0', 'asda', '微软微软', '啊打算', '啊大苏打');

-- ----------------------------
-- Table structure for mc_menu
-- ----------------------------
DROP TABLE IF EXISTS `mc_menu`;
CREATE TABLE `mc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`pid`),
  KEY `model` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of mc_menu
-- ----------------------------
INSERT INTO `mc_menu` VALUES ('4', '0', '1', '1', '0', 'index', 'Setting', 'default', '', '系统设置', 'cog', '系统');
INSERT INTO `mc_menu` VALUES ('5', '0', '1', '1', '0', 'index', 'Report', 'index', '', '系统巡检', 'dashboard', '');
INSERT INTO `mc_menu` VALUES ('6', '4', '1', '1', '0', 'index', 'Menu', 'index', '', '后台菜单', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('7', '4', '1', '1', '0', 'index', 'User', 'index', '', '用户管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('8', '4', '1', '1', '0', 'index', 'Role', 'index', '', '角色管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('9', '4', '1', '1', '0', 'index', 'Auth', 'index', '', '权限管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('10', '6', '1', '0', '0', 'index', 'Menu', 'add', '', '新增菜单', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('11', '5', '1', '1', '0', 'index', 'Report', 'linux', '', 'Linu巡检', 'linux', '');
INSERT INTO `mc_menu` VALUES ('12', '5', '1', '1', '0', 'index', 'Report', 'windows', '', 'Windows巡检', 'windows', '');
INSERT INTO `mc_menu` VALUES ('13', '5', '1', '1', '0', 'index', 'Report', 'mq', '', 'MQ巡检', '', '');
INSERT INTO `mc_menu` VALUES ('14', '5', '1', '1', '0', 'index', 'Report', 'was', '', 'was巡检', '', '');
INSERT INTO `mc_menu` VALUES ('15', '5', '1', '1', '0', 'index', 'Report', 'oracle', '', 'Oracle巡检', '', '');
INSERT INTO `mc_menu` VALUES ('16', '21', '1', '1', '0', 'index', 'Host', 'index', '', '新上线主机添加', 'laptop', '');
INSERT INTO `mc_menu` VALUES ('17', '21', '1', '1', '0', 'index', 'Tool', 'sms', '', '报警短信黑名单', 'edit', '');
INSERT INTO `mc_menu` VALUES ('18', '21', '1', '1', '0', 'index', 'Tool', 'gtp', '', 'GTP传输失败文件查询', 'search', '');
INSERT INTO `mc_menu` VALUES ('19', '21', '1', '1', '0', 'index', 'Tool', 'file', '', '查询文件是否存在                     ', 'files-o', '');
INSERT INTO `mc_menu` VALUES ('20', '21', '1', '1', '0', 'index', 'Tool', 'chart', '', '设备故障信息统计', 'pie-chart', '');
INSERT INTO `mc_menu` VALUES ('21', '0', '1', '1', '0', 'index', 'Tool', 'index', '', '系统工具', '', '');
INSERT INTO `mc_menu` VALUES ('22', '4', '1', '1', '0', 'index', 'Link', 'index', '', '首页导航管理', '', '');
INSERT INTO `mc_menu` VALUES ('23', '0', '0', '1', '0', 'index', '', '', '', '首页导航', '', '');

-- ----------------------------
-- Table structure for mc_report_index_log
-- ----------------------------
DROP TABLE IF EXISTS `mc_report_index_log`;
CREATE TABLE `mc_report_index_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nodename` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `location_id` varchar(11) DEFAULT NULL COMMENT '"02"=> 西三旗，\r\n"03"=>亦庄中金，\r\n"07" =>东单，\r\n"99"=>所有地方',
  `os_type` varchar(11) DEFAULT NULL COMMENT 'AIX  1，\r\nSolaris  2，\r\nWindows  4，\r\nLinux	8',
  `apps` varchar(11) DEFAULT NULL COMMENT 'MQ=>1，\r\nWAS=>2，\r\nOracle=>4，\r\nTong=>8，\r\nInformix=>16，\r\nCV=>32，\r\nGTP=>64',
  `server_id` varchar(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
INSERT INTO `mc_report_index_log` VALUES ('11', '4343', '34343', '3', '1', '0', '34343', '1', '2017-11-10 15:39:40');
INSERT INTO `mc_report_index_log` VALUES ('12', '3242342', '34234234234', '3', '1', '0', '34234324', '1', '2017-11-10 15:40:55');
INSERT INTO `mc_report_index_log` VALUES ('13', '555', '555', '3', '1', '', 'tttt', '1', '2017-11-10 16:10:24');
INSERT INTO `mc_report_index_log` VALUES ('14', '444', 'ttttt', '3', '1', '', 'ttttttt', '1', '2017-11-10 16:11:19');

-- ----------------------------
-- Table structure for mc_role
-- ----------------------------
DROP TABLE IF EXISTS `mc_role`;
CREATE TABLE `mc_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  `list_order` float DEFAULT '0' COMMENT '排序',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_name` (`role_name`),
  UNIQUE KEY `role_name_2` (`role_name`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of mc_role
-- ----------------------------
INSERT INTO `mc_role` VALUES ('1', '0', '1', '1509174069', '0', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `mc_role` VALUES ('2', '0', '1', '1509174108', '0', '0', '普通管理员', '');
INSERT INTO `mc_role` VALUES ('3', '0', '1', '1509952678', '0', '0', '短信黑名单', '短信黑名单');
INSERT INTO `mc_role` VALUES ('4', '0', '1', '1510211293', '0', '0', 'ee', '');

-- ----------------------------
-- Table structure for mc_role_user
-- ----------------------------
DROP TABLE IF EXISTS `mc_role_user`;
CREATE TABLE `mc_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of mc_role_user
-- ----------------------------
INSERT INTO `mc_role_user` VALUES ('1', '1', '1');
INSERT INTO `mc_role_user` VALUES ('6', '4', '6');
INSERT INTO `mc_role_user` VALUES ('7', '3', '7');

-- ----------------------------
-- Table structure for mc_user
-- ----------------------------
DROP TABLE IF EXISTS `mc_user`;
CREATE TABLE `mc_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `user_logintimes` int(11) DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned DEFAULT '0' COMMENT '金币',
  `create_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`,`user_name`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `id` (`id`),
  KEY `user_login` (`user_name`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of mc_user
-- ----------------------------
INSERT INTO `mc_user` VALUES ('1', '1', '0', '0', '1510277710', '37', '0', '1508811133', '1', 'admin', '99c348ce96784563b08f4e36c11ec5ab', '超级管理员', '11@qq.com', '', '', '', '0.0.0.0', '', '15736744455', null);
INSERT INTO `mc_user` VALUES ('6', '1', '0', '0', '1510111026', '2', '0', '1510107246', '1', 'zz', 'ef6633c274bdbab575dd00e1ed6b483b', 'zz', '', '', '', '', '0.0.0.0', '', '', null);
INSERT INTO `mc_user` VALUES ('7', '1', '0', '0', '1510114509', '2', '0', '1510111095', '1', 'zzh', 'aa64395bec97fc114b420dd4e11f4f64', 'zzh', '', '', '', '', '0.0.0.0', '', '', null);

-- ----------------------------
-- Table structure for mc_user_token
-- ----------------------------
DROP TABLE IF EXISTS `mc_user_token`;
CREATE TABLE `mc_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of mc_user_token
-- ----------------------------
INSERT INTO `mc_user_token` VALUES ('1', '1', '1525829710', '1510277710', 'e0fc1ee64342d73ae0e202a6fe954c84d8e5a82e847534114f1fda405ce1d0ce', 'web');
INSERT INTO `mc_user_token` VALUES ('4', '2', '1525659563', '1510107563', 'bb806ab21a248ee02db9084d6b60dc928d73b695349493eaca37b3e6caa7ca48', 'web');
INSERT INTO `mc_user_token` VALUES ('5', '6', '1525663026', '1510111026', 'a0ae862895752267b4953ed80c5811633e79d20e3328ab6349d2b0675df70f37', 'web');
INSERT INTO `mc_user_token` VALUES ('6', '7', '1525666509', '1510114509', '86bb4678d1093e855ed0a0743f7863f1949903674ed1a6c5fb9fcbc298a061ca', 'web');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `realname` varchar(155) DEFAULT NULL,
  `nickname` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(2) DEFAULT '1',
  `power_level` int(11) DEFAULT NULL,
  `class_level` int(11) DEFAULT NULL,
  `class` varchar(200) DEFAULT NULL,
  `logintimes` int(11) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('87', '5200', null, null, '	临沂', 'a80ded91bea483ce789a844e14c83547', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('88', '5300', null, null, '	沧州', 'b13130d41d9fbde80e25d54a4ec64a3b', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('89', '5400', null, null, '	湖州', '18d5136e3b9584d643363473f5372086', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('90', '5500', null, null, '	郑州', '7759c83bbeb9ed036b5013b001e2ee09', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('91', '5600', null, null, '	营口', '1b2af0fc48b60dbcfe08734761cec298', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('92', '5700', null, null, '	长治', 'f1d8977103989c357182c085427d6048', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('93', '5900', null, null, '	郴州', '22db69d32cf0b42e8c7860ebc0711b56', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('94', '6200', null, null, '	日照', '39c85d676d1f018c789e2ee296f62deb', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('95', '6300', null, null, '	嘉兴', '4201854653ed6d4b3d36d50d9eb6ba13', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('96', '6400', null, null, '	舟山', '48e774f5f88c95b5dbfd47efe58561a9', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('97', '6600', null, null, '	潍坊', '36a9f4b069412726d71672116481f4d9', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('98', '6800', null, null, '	邯郸', 'e5c496195a3ca858cfba7a8ce1e92e6f', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('99', '7000', null, null, '	济宁', '069b07dba1d3ac14d16a1bb1ae1fadeb', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('100', '7100', null, null, '	上海自贸区同城票交系统\r', '0c5d4ad57a322e770d9a7bb70f61cf30', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('101', '7300', null, null, '	宜昌', '2eb2dfa72f04a7aa69d24118a9dc82c1', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('102', '7500', null, null, '	廊坊', '15ca1874b2223f7f8f2aac19864e9cab', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('103', '7600', null, null, '	海口', 'd1be8fa1ffff5c35d7cf70a902d14122', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('104', '7800', null, null, '	滨州', 'ac9b310aa58a099f4b4382966302408e', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('105', '8000', null, null, '	银川', '4f2d46b247d2613f83c8d16efcc0a843', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('106', '8300', null, null, '	哈尔滨', '0f3fd9a0fda73ff83191dba320971776', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('107', '8400', null, null, '	贵阳', '567f0961e9fd54e19a672404ea65d75a', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('108', '8700', null, null, '	锦州', 'ca807d65359ef132fd6c098279907429', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('109', '8900', null, null, '	金华', 'da5e10ee3fd927ab8fbe3c4f020ae975', '1', null, null, null, null, '2017-09-14 11:13:51', null);
INSERT INTO `user` VALUES ('110', '9500', null, null, '	西咸新区', '53accdae0f3ff3bd2cf0b6f1bb0ba14f', '1', null, null, null, null, '2017-09-14 11:13:51', null);

-- ----------------------------
-- Table structure for user_power
-- ----------------------------
DROP TABLE IF EXISTS `user_power`;
CREATE TABLE `user_power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `power_level` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `up_level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user_power
-- ----------------------------
INSERT INTO `user_power` VALUES ('15', '8', '3', '15', '0');
INSERT INTO `user_power` VALUES ('48', '40', '3', '15', '0');
INSERT INTO `user_power` VALUES ('49', '8', '31', '2', '0');
INSERT INTO `user_power` VALUES ('50', '8', '31', '3', '0');
INSERT INTO `user_power` VALUES ('51', '8', '31', '4', '0');
INSERT INTO `user_power` VALUES ('52', '8', '31', '5', '0');
INSERT INTO `user_power` VALUES ('53', '8', '31', '6', '0');
INSERT INTO `user_power` VALUES ('54', '8', '31', '7', '0');
INSERT INTO `user_power` VALUES ('55', '8', '23', '8', '0');
INSERT INTO `user_power` VALUES ('56', '8', '23', '9', '0');
