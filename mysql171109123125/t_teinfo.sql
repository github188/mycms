/*
Navicat MySQL Data Transfer

Source Server         : localhost_3400
Source Server Version : 50624
Source Host           : localhost:3400
Source Database       : hxtong

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-11-09 12:29:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_teinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_teinfo`;
CREATE TABLE `t_teinfo` (
  `sys_name` varchar(128) DEFAULT NULL,
  `sys_ver` varchar(128) DEFAULT NULL,
  `sys_ip` varchar(512) DEFAULT NULL,
  `user_name` char(20) DEFAULT NULL,
  `node_name` varchar(48) NOT NULL,
  `node_ver` varchar(48) DEFAULT NULL,
  `manager` char(20) DEFAULT NULL,
  `appmphone` char(20) DEFAULT NULL,
  `modtime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teinfo
-- ----------------------------
INSERT INTO `t_teinfo` VALUES ('E商宝应用服务器A机', 'AIX_6100-06-06-1140', '172.16.132.11:192.168.254.224', 'was', 'sesba', 'null', '邬鹏', '13810322489', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('E商宝应用服务器B机', 'AIX_6100-06-06-1140', '172.16.132.12:192.168.254.225', 'was', 'sesbb', 'null', '邬鹏', '13810322489', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('E商宝应用服务器C机', 'AIX_6100-06-06-1140', '172.16.132.13:192.168.254.226', 'was', 'sesbc', 'null', '邬鹏', '13810322489', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新国结系统应用服务器A机', 'AIX_6100-06-06-1140', '102.200.2.190:102.64.28.10', 'was', 'sgjjsa', 'null', '朱亮亮', '15011338608', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新国结系统应用服务器B机', 'AIX_6100-06-06-1140', '102.200.2.191:102.64.28.11', 'was', 'sgjjsb', 'null', '朱亮亮', '15011338608', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行个人网银应用1机', 'AIX_6100-07-09-1341', '172.16.133.10:192.168.253.14', 'was', 'czhxb3', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行个人网银应用2机', 'AIX_6100-07-09-1341', '172.16.133.11:192.168.253.15', 'was', 'czhxb4', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('外汇牌价系统1机', 'AIX_6100-07-06-1241', '192.80.206.9:102.80.6.8:102.80.206.9:102.200.128.78', 'whdj', 'yrdj', 'null', '荀竑', '13501283837', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行个人网银柜面1机', 'AIX_6100-07-09-1341', '172.16.133.12:192.168.253.16', 'tong', 'czhxbs3', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行个人网银柜面2机', 'AIX_6100-07-09-1341', '172.16.133.13:192.168.253.17', 'tong', 'czhxbs4', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行综合前置应用服务器3', 'AIX_6100-07-09-1341', '102.64.1.192:102.200.3.180', 'dcesb', 'cifeap3', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行综合前置应用服务器4', 'AIX_6100-07-09-1341', '102.64.1.193:102.200.3.181', 'dcesb', 'cifeap4', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('中金电子票据系统应用1机', 'AIX_6100-07-06-1241', '192.80.214.10:102.80.14.8:102.80.214.10:102.200.129.19', 'was', 'bbspts', 'null', '乔容', '13426422475', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('身份核查主机1', 'AIX_6100-06-06-1140', '102.64.20.11:102.64.220.13:192.64.220.13:102.200.2.161', 'was', 'pids', 'null', '乔蓉', '13426422475', '2017-06-09 10:21:00');
INSERT INTO `t_teinfo` VALUES ('个贷公积金系统A机', 'AIX_6100-06-06-1140', '192.80.205.18:102.200.128.198:102.80.5.8:102.80.205.18', 'pl', 'plas', 'null', '王永利', '13718862812', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('外卡收单服务器A机', 'AIX_6100-06-06-1140', '102.80.207.9:102.80.7.8:102.200.128.80', 'wksd', 'wksd', 'null', '荀竑', '13501283837', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('外汇卡账务2机', 'AIX_6100-06-06-1140', '102.64.221.14:102.64.21.11:102.200.2.199', 'fcas', 'fcas', 'null', '荀竑', '13501283837', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('中金核心查询打印系统', 'AIX_6100-07-06-1241', '102.200.3.60:192.179.201.34:102.179.1.32:102.179.201.34', 'was', 'crpsrv', 'null', '刘忠坤', '18811633599', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行网银应用服务器1机', 'AIX_6100-07-06-1241', '172.16.133.8:192.168.253.8', 'tong', 'czhxbs1', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行网银应用服务器1机', 'AIX_6100-07-06-1241', '172.16.133.8:192.168.253.8', 'was', 'czhxb1', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行网银应用服务器2机', 'AIX_6100-07-06-1241', '172.16.133.9:192.168.253.9', 'was', 'czhxb2', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行网银应用服务器2机', 'AIX_6100-07-06-1241', '172.16.133.9:192.168.253.9', 'tong', 'czhxbs2', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('客服系统应用服务器1机', 'AIX_6100-07-06-1241', '192.80.219.10:102.80.19.8:102.80.219.10:102.200.128.178', 'tong', 'ccag', 'null', '古伟', '13693396817', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('客服系统CTI服务器2机', 'AIX_6100-07-06-1241', '102.80.19.13:102.200.128.181', 'unify', 'tstcli3', 'null', '古伟', '13693396817', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行综合前置通讯机1', 'AIX_6100-07-06-1241', '102.200.3.44:192.64.201.146:102.64.1.144:102.64.201.146', 'esbcom', 'cifecom', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行综合前置通讯机1', 'AIX_6100-07-06-1241', '102.200.3.44:192.64.201.146:102.64.1.144:102.64.201.146', 'tongnb', 'czifenb', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行综合前置应用服务器1', 'AIX_6100-07-06-1241', '102.200.3.48:102.64.1.154', 'dcesb', 'cifeap1', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行综合前置应用服务器2', 'AIX_6100-07-06-1241', '102.200.3.49:102.64.1.155', 'dcesb', 'cifeap2', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银批量服务器2机', 'AIX_6100-07-06-1241', '172.16.128.189:192.168.254.189', 'was', 'hxbe7', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银第二集群CIF5机', 'AIX_6100-07-06-1241', '172.16.128.168:192.168.254.183', 'was', 'cis05', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银第二集群CIF6机', 'AIX_6100-07-06-1241', '172.16.128.169:192.168.254.184', 'was', 'cis06', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银第二集群个人网银应用服务器1机', 'AIX_6100-07-06-1241', '172.16.128.183:192.168.254.185', 'was', 'hxb5', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银第二集群个人网银应用服务器2机', 'AIX_6100-07-06-1241', '172.16.128.184:192.168.254.186', 'was', 'hxb6', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银第二集群企业网银应用服务器1机', 'AIX_6100-07-06-1241', '172.16.128.187:192.168.254.187', 'was', 'hxbe5', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银第二集群企业网银应用服务器2机', 'AIX_6100-07-06-1241', '172.16.128.188:192.168.254.188', 'was', 'hxbe6', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银批量服务器1机', 'AIX_6100-06-06-1140', '172.16.128.159:192.168.254.211', 'was', 'shxbb1', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('支付融资系统应用1机', 'AIX_7100-03-03-1415', '192.201.4.18:108.201.4.18:102.200.3.204', 'cata', 'cata_18', 'TE4602_P2_JDK16', '王文浩', '15652650947', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('支付融资系统应用2机', 'AIX_7100-03-03-1415', '192.201.4.19:108.201.4.19:102.200.3.205', 'cata', 'cata_19', 'TE4602_P2_JDK16', '王文浩', '15652650947', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('转账支付系统应用1机', 'AIX_7100-03-03-1415', '102.200.129.49:102.80.27.16:192.80.227.18:102.80.227.18', 'trspmt', 'tpay', 'TE4625_P1_AIX71_JDK16', '李元俊', '15810676267', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('客服系统web服务器1机', 'AIX_6100-07-06-1241', '102.80.19.16:102.200.128.182', 'unify', 'tstcli', 'null', '古伟', '13693396817', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('客服系统web服务器2机', 'AIX_6100-07-06-1241', '102.80.19.17:102.200.128.183', 'unify', 'tstcli2', 'null', '古伟', '13693396817', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('2K历史查询B机', 'AIX_6100-07-05-1228', '192.80.204.10:102.200.128.75:102.80.4.8:102.80.204.10', '2kywhis', '2kywhis', 'null', '李大伟', '13426170308', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新网银内管系统A机', 'AIX_6100-07-06-1241', '172.16.128.210:192.168.254.167', 'was', 'hxb108', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新网银内管系统B机', 'AIX_6100-07-06-1241', '172.16.128.211:192.168.254.168', 'was', 'hxb109', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银柜台服务1', 'AIX_6100-07-06-1241', '172.16.128.204:192.168.254.161', 'tong', 'hxbs3', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银柜台服务1', 'AIX_6100-07-06-1241', '172.16.128.204:192.168.254.161', 'enttong', 'hxbs5', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银柜台服务2', 'AIX_6100-07-06-1241', '172.16.128.205:192.168.254.162', 'enttong', 'hxbs6', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银柜台服务2', 'AIX_6100-07-06-1241', '172.16.128.205:192.168.254.162', 'tong', 'hxbs4', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银一集群个人网关服务1', 'AIX_6100-07-06-1241', '172.16.128.206:192.168.254.163', 'was', 'hxb104', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银一集群个人网关服务2', 'AIX_6100-07-06-1241', '172.16.128.207:192.168.254.164', 'was', 'hxb105', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银一集群企业银企服务1', 'AIX_6100-07-06-1241', '172.16.128.208:192.168.254.165', 'was', 'hxb106', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('网银一集群企业银企服务2', 'AIX_6100-07-06-1241', '172.16.128.209:192.168.254.166', 'was', 'hxb107', 'null', '王兴安', '15011018143', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('信贷系统应用服务器1机', 'AIX_6100-07-06-1241', '110.17.1.21:102.200.128.186', 'dcms', 'dcmssv1', 'null', '韩博', '13716645510', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('信贷系统应用服务器2机', 'AIX_6100-07-06-1241', '110.17.1.22:102.200.128.187', 'dcms', 'dcmssv2', 'null', '韩博', '13716645510', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新综合前置通讯机1', 'AIX_6100-06-11-1316', '192.121.204.9:110.121.4.8:110.121.204.9:110.200.2.11', 'esbcom', 'ifecom2', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新综合前置应用服务器1', 'AIX_6100-06-11-1316', '110.121.4.16:110.200.2.13', 'dcesb', 'ifeapp5', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新综合前置应用服务器2', 'AIX_6100-06-11-1316', '110.121.4.17:110.200.2.14', 'dcesb', 'ifeapp6', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新综合前置应用服务器3', 'AIX_6100-06-11-1316', '110.121.4.18:110.200.2.15', 'dcesb', 'ifeapp7', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('新综合前置应用服务器4', 'AIX_6100-06-11-1316', '110.121.4.19:110.200.2.16', 'dcesb', 'ifeapp8', 'null', '张冀越', '13699220462', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('外汇卡消费2', 'AIX_6100-06-06-1140', '102.64.221.24:102.64.21.21:102.200.2.201', 'huaxia', 'whkqz25', 'null', '荀竑', '13501283837', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行信贷系统应用服务器1机', 'AIX_6100-07-09-1341', '102.64.1.170:102.200.3.106', 'dcms', 'czdcms1', 'null', '韩博', '13716645510', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('村镇银行信贷系统应用服务器2机', 'AIX_6100-07-09-1341', '102.64.1.171:102.200.3.107', 'dcms', 'czdcms2', 'null', '韩博', '13716645510', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('大兴村镇报表应用A机', 'AIX_5300-07-05-0831', '102.200.2.11:102.64.201.13:102.64.1.11', 'report', 'report', 'null', '刘忠坤', '13391919036', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('大兴村镇BEAI应用A机', 'AIX_5300-10-01-0921', '192.64.201.43:102.64.1.41:102.64.201.43:102.200.2.17', 'beaiht', 'czbeai', 'null', '刘家剑', '13426176932', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('支付融资系统应用3机', 'AIX_6100-07-09-1341', '108.201.4.20:102.200.3.200', 'ynnt', 'ynnt_20', 'null', '王文浩', '15652650947', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('支付融资系统应用4机', 'AIX_6100-07-09-1341', '108.201.4.21:102.200.3.201', 'ynnt', 'ynnt_21', 'null', '王文浩', '15652650947', '2016-07-05 15:07:23');
INSERT INTO `t_teinfo` VALUES ('二代支付系统应用服务器1机', 'AIX_7100-03-02-1412', '192.97.1.34:102.97.1.34:102.200.160.34', 'zfxt', 'zfxtA', 'null', '汤波', '13810415146', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('二代支付系统应用服务器2机', 'AIX_7100-03-02-1412', '192.97.1.35:102.97.1.35:102.200.160.35', 'zfxt', 'zfxtB', 'null', '汤波', '13810415146', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置通讯机1', 'AIX_6100-06-11-1316', '110.121.1.131:110.121.201.133:102.200.132.26:192.121.201.133', 'tongnb', 'ifenb', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置通讯机1', 'AIX_6100-06-11-1316', '110.121.1.131:110.121.201.133:102.200.132.26:192.121.201.133', 'esbcom', 'ifecom', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置应用1', 'AIX_6100-06-11-1316', '110.121.1.135:102.200.132.28', 'dcesb', 'ifeapp1', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置应用2', 'AIX_6100-06-11-1316', '110.121.1.136:102.200.132.29', 'dcesb', 'ifeapp2', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置应用3', 'AIX_6100-06-11-1316', '110.121.1.137:102.200.132.30', 'dcesb', 'ifeapp3', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置应用4', 'AIX_6100-06-11-1316', '110.121.1.138:102.200.132.31', 'dcesb', 'ifeapp4', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置应用5', 'AIX_6100-06-11-1316', '110.121.1.160:102.200.132.42', 'dcesb', 'ifeapp9', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('中金综合前置应用6', 'AIX_6100-06-11-1316', '110.121.1.161:102.200.132.43', 'dcesb', 'ifeapp0', 'null', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行手机后台服务应用1机', 'AIX_7100-03-02-1412', '172.16.72.24:192.168.254.176', 'was', 'zxyh24', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行手机后台服务应用2机', 'AIX_7100-03-02-1412', '172.16.72.25:192.168.254.177', 'was', 'zxyh25', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行接入应用1机', 'AIX_7100-03-02-1412', '172.16.72.16:192.168.254.150', 'was', 'EA00', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行内管1机', 'AIX_7100-03-02-1412', '172.16.72.20:192.168.254.154', 'was', 'zxyh20', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行内管2机', 'AIX_7100-03-02-1412', '172.16.72.21:192.168.254.155', 'was', 'zxyh21', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行后台服务应用1机', 'AIX_7100-03-02-1412', '192.168.161.18:172.16.72.18:192.168.254.152', 'was', 'zxyh18', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('直销银行后台服务应用2机', 'AIX_7100-03-02-1412', '192.168.161.19:172.16.72.19:192.168.254.153', 'was', 'zxyh19', 'null', '王兴安', '15011018143', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('财税库行1机', 'AIX_6100-07-09-1341', '192.80.232.18:102.80.32.16:102.80.232.18:102.200.129.67', 'cskh', 'cssvr', 'null', '乔蓉', '13426422475', '2017-06-09 10:21:00');
INSERT INTO `t_teinfo` VALUES ('信用卡互联与清算应用服务器1机', 'AIX_7100-03-03-1415', '192.96.9.16:102.96.9.16:102.200.160.175', 'xykhl', 'xykhlA', 'TE4620_JDK16_32', '王超', '', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('信用卡互联与清算应用服务器2机', 'AIX_7100-03-03-1415', '192.96.9.17:102.96.9.17:102.200.160.176', 'xykhl', 'xykhlB', 'TE4620_JDK16_32', '王超', '', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('外联应用网关系统-应用服务器1', 'RHEL6.4', '102.96.248.16:102.200.160.222', 'eci', 'eciapp1', 'TE4622_JDK16_64', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('外联应用网关系统-应用服务器2', 'RHEL6.4', '102.96.248.17:102.200.160.223', 'eci', 'eciapp2', 'TE4622_JDK16_64', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('外联应用网关系统-应用服务器3', 'RHEL6.4', '102.96.248.18:102.200.160.224', 'eci', 'eciapp3', 'TE4622_JDK16_64', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('外联应用网关系统-应用服务器4', 'RHEL6.4', '102.96.248.19:102.200.160.225', 'eci', 'eciapp4', 'TE4622_JDK16_64', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('外联应用网关系统-应用服务器5', 'RHEL6.4', '102.96.248.20:102.200.160.226', 'eci', 'eciapp5', 'TE4622_JDK16_64', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('外联应用网关系统-应用服务器6', 'RHEL6.4', '102.96.248.21:102.200.160.227', 'eci', 'eciapp6', 'TE4622_JDK16_64', '张冀越', '13699220462', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('抵制押品系统-抵制押品应用1机', 'RHEL6.4', '102.200.164.67:102.200.163.81:102.96.19.16', 'ccms', 'ccmsap1', 'null', '刘效祥', '18610315132', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('抵制押品系统-抵制押品应用2机', 'RHEL6.4', '102.200.164.68:102.200.163.82:102.96.19.17', 'ccms', 'ccmsap2', 'null', '刘效祥', '18610315132', '2016-07-05 15:07:24');
INSERT INTO `t_teinfo` VALUES ('上海分行_外汇卡前置', 'null', 'null', 'null', 'shwhgl', 'null', '上海分行', '021-58824360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('上海分行_手工同城', 'null', 'null', 'null', 'tc0501', 'null', '上海分行', '021-58824360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('上海分行_支票影像', 'null', 'null', 'null', 'yx0500', 'null', '上海分行', '021-58824360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('上海分行_特色业务平台', 'null', 'null', 'null', 'ts0500', 'null', '上海分行', '021-58824360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('上海分行_电子同城', 'null', 'null', 'null', 'tc0500', 'null', '上海分行', '021-58824360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('东营分行_同城票据交换系统', 'null', 'null', 'null', 'dytc', 'null', '东营分行', '0546-8178913', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('临沂分行_同城票据交换系统', 'null', 'null', 'null', 'tc5250', 'null', '临沂分行', '0539-7205111', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('乌鲁木齐分行_同城票据交换系统', 'null', 'null', 'null', 'tc1500', 'null', '乌鲁木齐分行', '0991-2332309', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('乌鲁木齐分行_外汇卡系统', 'null', 'null', 'null', 'xjwhgl', 'null', '乌鲁木齐分行', '0991-2332309', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('乌鲁木齐分行_支票影像系统', 'null', 'null', 'null', 'yx1500', 'null', '乌鲁木齐分行', '0991-2332309', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('乌鲁木齐分行_特色业务系统', 'null', 'null', 'null', 'ts1500', 'null', '乌鲁木齐分行', '0991-2332309', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('北京分行_同城票交系统', 'null', 'null', 'null', 'bjtc', 'null', '张金平', '13701110789\r\n', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('北京分行_支票影像系统', 'null', 'null', 'null', 'yx0200', 'null', '张金平', '13701110789\r\n', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('北京分行_特色业务系统', 'null', 'null', 'null', 'special', 'null', '田  燚', '13671286771\r\n', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南京分行_手工同城票据交换系统', 'null', 'null', 'null', 'tc0300', 'null', '南京分行', '025-84789976', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南京分行_支票影像系统', 'null', 'null', 'null', 'yx0300', 'null', '南京分行', '025-84789976', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南京分行_特色业务系统', 'null', 'null', 'null', 'ts0300', 'null', '南京分行', '025-84789976', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南京分行_电子同城票据交换系统', 'null', 'null', 'null', 'tc0301', 'null', '南京分行', '025-84789976', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南宁分行_同城票据交换系统', 'null', 'null', 'null', 'tc6200', 'null', '南宁分行', '0771-2520846', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南宁分行_特色业务系统', 'null', 'null', 'null', 'ts6200', 'null', '南宁分行', '0771-2520846', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南昌分行_同城票据', 'null', 'null', 'null', 'tc5100', 'null', '南昌分行', '0791-86699037', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南昌分行_支票影像', 'null', 'null', 'null', 'yx5100', 'null', '南昌分行', '0791-86699037', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南昌分行_特色业务', 'null', 'null', 'null', 'ts5100', 'null', '南昌分行', '0791-86699037', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('南通分行_同城票据交换系统', 'null', 'null', 'null', 'ntyx', 'null', '南通分行', '0513-81128828', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('厦门分行_外汇卡系统', 'null', 'null', 'null', 'wks678', 'null', '厦门分行', '0592-2978652', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('厦门分行_手工同城系统', 'null', 'null', 'null', 'tc6780', 'null', '厦门分行', '0592-2978652', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('厦门分行_特色业务系统', 'null', 'null', 'null', 'ts6780', 'null', '厦门分行', '0592-2978652', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('厦门分行_电子同城系统', 'null', 'null', 'null', 'tc3501', 'null', '厦门分行', '0592-2978652', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('合肥分行_外汇卡', 'null', 'null', 'null', 'hfwhj', 'null', '合肥分行', '0551-65776088', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('合肥分行_支票影像系统', 'null', 'null', 'null', 'yx4700', 'null', '合肥分行', '0551-65776088', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('合肥分行_特色业务系统', 'null', 'null', 'null', 'ts4700', 'null', '合肥分行', '0551-65776088', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('呼和浩特_同城票交系统', 'null', 'null', 'null', 'tc2100', 'null', '呼和浩特分行', '0471-3361661', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('呼和浩特_支票影像系统', 'null', 'null', 'null', 'yx2100', 'null', '呼和浩特分行', '0471-3361661', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('呼和浩特_特色业务系统', 'null', 'null', 'null', 'ts2100', 'null', '呼和浩特分行', '0471-3361661', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('大连分行_同城票交', 'null', 'null', 'null', 'tc1800', 'null', '大连分行', '0411-82362970', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('大连分行_支票影像', 'null', 'null', 'null', 'yx1800', 'null', '大连分行', '0411-82362970', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('大连分行_特色业务', 'null', 'null', 'null', 'ts1800', 'null', '大连分行', '0411-82362970', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('天津分行_同城系统', 'null', 'null', 'null', 'tc2300', 'null', '天津分行', '022-58790926', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('天津分行_外汇卡系统', 'null', 'null', 'null', 'tjwh002', 'null', '天津分行', '022-58790926', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('天津分行_影像系统', 'null', 'null', 'null', 'yx2300', 'null', '天津分行', '022-58790926', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('天津分行_特色业务系统', 'null', 'null', 'null', 'ts2300', 'null', '天津分行', '022-58790926', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('太原分行_同城票交', 'null', 'null', 'null', 'tc1700', 'null', '太原分行', '0351-4125193', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('太原分行_手工同城', 'null', 'null', 'null', 'yx1700', 'null', '太原分行', '0351-4125193', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('太原分行_支票影像', 'null', 'null', 'null', 'tc1701', 'null', '太原分行', '0351-4125193', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('太原分行_特色业务', 'null', 'null', 'null', 'ts1700', 'null', '太原分行', '0351-4125193', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('宁波分行_同城票交', 'null', 'null', 'null', 'tc6100', 'null', '宁波分行', '0574-87972659', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('宁波分行_支票影像', 'null', 'null', 'null', 'yx2900', 'null', '宁波分行', '0574-87972659', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('常州分行_同城票交', 'null', 'null', 'null', 'tc6400', 'null', '常州分行', '0519-88179878', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('广州分行_广州东莞同城票交系统', 'null', 'null', 'null', 'tc0900', 'null', '广州分行', '020-38099503', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('广州分行_支票影像系统', 'null', 'null', 'null', 'yx0900', 'null', '广州分行', '020-38099503', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('广州分行_特色业务系统', 'null', 'null', 'null', 'ts0900', 'null', '广州分行', '020-38099503', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('广州分行_珠海佛山同城票交系统', 'null', 'null', 'null', 'tc6109', 'null', '广州分行', '020-38099503', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('广州分行_金融服务平台', 'null', 'null', 'null', 'jr0900', 'null', '广州分行', '020-38099503', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('徐州分行_同城票据交换系统', 'null', 'null', 'null', 'tc5000', 'null', '徐州分行', '0516-85619026', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('成都分行_手工同城', 'null', 'null', 'null', 'tc1300', 'null', '成都分行', '028-85180360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('成都分行_支票影像', 'null', 'null', 'null', 'yx1300', 'null', '成都分行', '028-85180360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('成都分行_特色业务系统', 'null', 'null', 'null', 'ts1300', 'null', '成都分行', '028-85180360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('成都分行_电子同城系统', 'null', 'null', 'null', 'tc1301', 'null', '成都分行', '028-85180360', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('扬州分行-同城票交系统', 'null', 'null', 'null', 'tc0367', 'null', 'null', 'null', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('无锡分行_同城交换系统', 'null', 'null', 'null', 'tc2500', 'null', '无锡分行', '0510-82762921', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('无锡分行_支票影像系统', 'null', 'null', 'null', 'yx2500', 'null', '无锡分行', '0510-82762921', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('无锡分行_特色业务系统', 'null', 'null', 'null', 'ts2500', 'null', '无锡分行', '0510-82762921', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('日照分行_同城票交', 'null', 'null', 'null', 'tc2001', 'null', '日照分行', '0633-8099713', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('昆明分行_手工同城', 'null', 'null', 'null', 'tc0700', 'null', '昆明分行', '0871-63154948', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('昆明分行_支票影像', 'null', 'null', 'null', 'yx0700', 'null', '昆明分行', '0871-63154948', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('昆明分行_特色业务', 'null', 'null', 'null', 'ts0700', 'null', '昆明分行', '0871-63154948', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('昆明分行_电子同城', 'null', 'null', 'null', 'tc0701', 'null', '昆明分行', '0871-63154948', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('杭州分行_同城系统', 'null', 'null', 'null', 'cpeshz', 'null', '杭州分行', '0571-87239251', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('杭州分行_支票影像', 'null', 'null', 'null', 'yx0400', 'null', '杭州分行', '0571-87239251', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('杭州分行_特色业务', 'null', 'null', 'null', 'ts0400', 'null', '杭州分行', '0571-87239251', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('武汉分行_同城票据交换系统（手工）', 'null', 'null', 'null', 'tc1100', 'null', '张明亮', '15827368120', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('武汉分行_同城票据交换系统（电子）', 'null', 'null', 'null', 'tc1101', 'null', '张明亮', '15827368120', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('武汉分行_外汇卡系统', 'null', 'null', 'null', 'whwh058', 'null', '武汉分行', '027-87266650', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('武汉分行_支票影像系统', 'null', 'null', 'null', 'yx1100', 'null', '张明亮', '15827368120', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('武汉分行_特色业务系统', 'null', 'null', 'null', 'ts1100', 'null', '饶伟', '13871462629\r\n', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('沈阳分行_公务卡', 'null', 'null', 'null', 'sy1000', 'null', '沈阳分行', '024-82900780', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('沈阳分行_同城票交', 'null', 'null', 'null', 'tc1000', 'null', '沈阳分行', '024-82900780', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('沈阳分行_支票影像', 'null', 'null', 'null', 'yx1000', 'null', '沈阳分行', '024-82900780', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('沈阳分行_特色业务', 'null', 'null', 'null', 'ts1000', 'null', '沈阳分行', '024-82900780', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('泰州分行_同城票据交换系统', 'null', 'null', 'null', 'tc6505', 'null', '泰州分行', '0523-86511553', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('济南分行_同城票据交换系统', 'null', 'null', 'null', 'tc0600', 'null', '济南分行', '0531-86024923', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('济南分行_支票影像系统', 'null', 'null', 'null', 'yx0600', 'null', '济南分行', '0531-86024923', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('济南分行_特色业务系统', 'null', 'null', 'null', 'ts0600', 'null', '济南分行', '0531-86024923', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('济宁分行_同城票据交换系统', 'null', 'null', 'null', 'tc7000', 'null', 'null', 'null', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('深圳分行_外汇卡系统', 'null', 'null', 'null', 'fcascli', 'null', '深圳分行', '0755-83989144', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('深圳分行_支票影像系统', 'null', 'null', 'null', 'yx0800', 'null', '王睿', '13631664506', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('深圳分行_特色业务系统', 'null', 'null', 'null', 'ts0800', 'null', '王睿', '13631664506', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('深圳分行_证券资金交收系统', 'null', 'null', 'null', 'sjs0800', 'null', '深圳分行', '0755-83989144', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('深圳分行_金融结算系统', 'null', 'null', 'null', 'tc0801', 'null', '王睿', '13631664506', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('温州分行_同城票交系统', 'null', 'null', 'null', 'tc1900', 'null', '温州分行', '0577-88998716', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('温州分行_外汇卡系统', 'null', 'null', 'null', 'wzwhqz1', 'null', '温州分行', '0577-88998716', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('温州分行_支票影像系统', 'null', 'null', 'null', 'yx1900', 'null', '温州分行', '0577-88998716', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('温州分行_特色业务系统', 'null', 'null', 'null', 'ts1900', 'null', '温州分行', '0577-88998716', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('潍坊支行_同城票据交换系统', 'null', 'null', 'null', 'tc0662', 'null', '潍坊分行', '5318-6024923', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('烟台分行_同城票据交换系统', 'null', 'null', 'null', 'tc2600', 'null', '烟台分行', '0535-6589096', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('烟台分行_支票影像系统', 'null', 'null', 'null', 'yx2600', 'null', '烟台分行', '0535-6589096', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('玉溪分行_支票影像', 'null', 'null', 'null', 'yx2800', 'null', '玉溪分行', '0877-2068786', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('盐城分行_同城票据交换系统', 'null', 'null', 'null', 'tc6050', 'null', '盐城分行', '0515-89850869', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('石家庄分行_同城票交系统', 'null', 'null', 'null', 'tc1600', 'null', '石家庄分行', '0311-87899141', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('石家庄分行_支票影像系统', 'null', 'null', 'null', 'yx1600', 'null', '石家庄分行', '0311-87899141', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('石家庄分行_特色业务系统', 'null', 'null', 'null', 'ts1600', 'null', '石家庄分行', '0311-87899141', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('福州分行_支票影像', 'null', 'null', 'null', 'yx2200', 'null', '福州分行', '0591-87626225', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('福州分行_特色业务', 'null', 'null', 'null', 'ts5900', 'null', '福州分行', '0591-87626225', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('绍兴分行_同城票交系统', 'null', 'null', 'null', 'tc6300', 'null', '绍兴分行', '0575-88580990', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('绍兴分行_特色业务', 'null', 'null', 'null', 'ts3200', 'null', '绍兴分行', '0575-88580990', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('聊城分行_同城票据交换系统', 'null', 'null', 'null', 'tc2700', 'null', '聊城分行', '0635-8205594', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('聊城分行_支票影像系统', 'null', 'null', 'null', 'yx2700', 'null', '聊城分行', '0635-8205594', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('苏州分行_同城票交系统', 'null', 'null', 'null', 'tcd2400', 'null', '苏州分行', '0512-67701045', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('苏州分行_支票影像系统', 'null', 'null', 'null', 'yx2400', 'null', '苏州分行', '0512-67701045', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('苏州分行_特色业务系统', 'null', 'null', 'null', 'ts2400', 'null', '苏州分行', '0512-67701045', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('营口分行-同城系统', 'null', 'null', 'null', 'tc5600', 'null', '营口分行', '0417-2980808', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('西安分行_公务卡', 'null', 'null', 'null', 'gwk1400', 'null', '西安分行', '029-872149008', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('西安分行_同城票交', 'null', 'null', 'null', 'tc1400', 'null', '扁剑', '18909260839\r\n', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('西安分行_外汇卡系统', 'null', 'null', 'null', 'xawhyyb', 'null', '西安分行', '029-872149008', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('西安分行_支票影像', 'null', 'null', 'null', 'yx1400', 'null', '扁剑', '18909260839', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('西安分行_特色业务平台', 'null', 'null', 'null', 'ts1400', 'null', '韩一耀', '15229247211', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('郑州分行_同城票交', 'null', 'null', 'null', 'tc5500', 'null', '王钦朋', '18637127800', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('郑州分行_外汇卡', 'null', 'null', 'null', 'wh5500', 'null', '王钦朋', '18637127800', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('重庆分行_同城票交', 'null', 'null', 'null', 'tc1200', 'null', '沈晓', '15825978806', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('重庆分行_支票影像', 'null', 'null', 'null', 'yx1200', 'null', '沈晓', '15825978806', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('重庆分行_特色业务', 'null', 'null', 'null', 'ts1200', 'null', '沈晓', '15825978806', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('重庆分行_电子同城', 'null', 'null', 'null', 'tc1201', 'null', '沈晓', '15825978806', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('镇江分行_同城票据交换系统', 'null', 'null', 'null', 'tc6500', 'null', '镇江分行', '0511-88910828', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('长春分行_同城票据交换系统', 'null', 'null', 'null', 'tc3700', 'null', '长春分行', '0431-81957696', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('长沙分行_同城票交系统', 'null', 'null', 'null', 'cstc', 'null', '伍灵杰', '18907540222', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('长沙分行_特色业务系统', 'null', 'null', 'null', 'ts3400', 'null', '伍灵杰', '18907540222', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('青岛分行_同城票交', 'null', 'null', 'null', 'tc2000', 'null', '杜勇', '15066199936', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('青岛分行_外汇卡', 'null', 'null', 'null', 'qdwhjzl', 'null', '杜勇', '15066199936', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('青岛分行_支票影像', 'null', 'null', 'null', 'yx2000', 'null', '杜勇', '15066199936', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('青岛分行_特色业务', 'null', 'null', 'null', 'ts2000', 'null', '杜勇', '15066199936', '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('鞍山分行_同城系统', 'null', 'null', 'null', 'astc', 'null', '鞍山分行', null, '2016-07-05 00:00:00');
INSERT INTO `t_teinfo` VALUES ('哈尔滨同城票交', 'null', 'null', 'null', 'tcs8300', 'null', '李毅', '15045479111', '2016-07-20 14:36:05');
INSERT INTO `t_teinfo` VALUES ('海口分行_特色业务', 'null', 'null', 'null', 'ts_7600', 'null', '冯行功', '18189899233', '2016-07-28 16:35:09');
INSERT INTO `t_teinfo` VALUES ('P2P存管应用1', 'RHEL65', '102.101.26.22', 'p2pst', 'p2psvr1', 'TE4625_P1_JDK16_64', '王文浩', '15652650947', '2016-07-28 16:37:25');
INSERT INTO `t_teinfo` VALUES ('P2P存管应用2', 'RHEL65', '102.101.26.23', 'p2pst', 'p2psvr2', 'TE4625_P1_JDK16_64', '王文浩', '15652650947', '2016-07-28 16:38:05');
INSERT INTO `t_teinfo` VALUES ('智慧社区1', 'RHEL65', '102.101.29.38', 'zhsq', 'zhsq1', 'TE4625_P1_JDK16_64', '王文浩', '15652650947', '2016-07-28 16:39:54');
INSERT INTO `t_teinfo` VALUES ('智慧社区2', 'RHEL65', '102.101.29.39', 'zhsq', 'zhsq2', 'TE4625_P1_JDK16_64', '王文浩', '15652650947', '2016-07-28 16:40:15');
INSERT INTO `t_teinfo` VALUES ('哈尔滨分行_手工同城系统', 'null', '151.1.1.41', 'null', 'tcs8300', 'null', '李毅', '15045479111', '2016-08-15 14:52:34');
INSERT INTO `t_teinfo` VALUES ('济南分行_手工同城系统', 'null', '121.1.0.113', 'null', 'tcs0600', 'null', '郭超', '18678778715', '2016-08-15 15:01:14');
INSERT INTO `t_teinfo` VALUES ('烟台分行_手工同城系统', 'null', '121.1.0.114', 'null', 'tcs2600', 'null', '郭超', '18678778715', '2016-08-15 15:02:14');
INSERT INTO `t_teinfo` VALUES ('聊城分行_手工同城系统', 'null', '121.1.0.115', 'null', 'tcs2700', 'null', '郭超', '18678778715', '2016-08-15 15:03:25');
INSERT INTO `t_teinfo` VALUES ('东营分行_手工同城系统', 'null', '121.1.0.116', 'null', 'tcs4300', 'null', '郭超', '18678778715', '2016-08-15 15:04:52');
INSERT INTO `t_teinfo` VALUES ('临沂分行_手工同城系统', 'null', '121.1.0.117', 'null', 'tcs5200', 'null', '郭超', '18678778715', '2016-08-15 15:06:09');
INSERT INTO `t_teinfo` VALUES ('济宁分行_手工同城系统', 'null', '121.1.0.118', 'null', 'tcs7000', 'null', '郭超', '18678778715', '2016-08-15 15:08:14');
INSERT INTO `t_teinfo` VALUES ('潍坊分行_手工同城系统', 'null', '121.1.0.119', 'null', 'tcs6600', 'null', '郭超', '18678778715', '2016-08-15 15:09:25');
INSERT INTO `t_teinfo` VALUES ('滨州分行_手工同城系统', 'null', '121.1.0.120', 'null', 'tcs7800', 'null', '郭超', '18678778715', '2016-08-15 15:11:07');
INSERT INTO `t_teinfo` VALUES ('BEAI高可用应用1机', 'null', '102.81.4.32:102.200.133.33', 'beaiht', 'beaiA', 'TE4620_AIX71_64_JDK6_32', '刘家剑', '13426176932', '2016-08-16 19:26:32');
INSERT INTO `t_teinfo` VALUES ('BEAI高可用应用2机', 'null', '102.81.4.33:102.200.133.34', 'beaiht', 'beaiB', 'TE4620_AIX71_64_JDK6_32', '刘家剑', '13426176932', '2016-08-16 19:27:48');
INSERT INTO `t_teinfo` VALUES ('BEAI高可用应用3机', 'null', '102.81.4.34:102.200.162.33', 'beaiht', 'beaiC', 'TE4620_AIX71_64_JDK6_32', '刘家剑', '13426176932', '2016-08-16 19:28:36');
INSERT INTO `t_teinfo` VALUES ('BEAI高可用应用4机', 'null', '102.81.4.35:102.200.162.34', 'beaiht', 'beaiD', 'TE4620_AIX71_64_JDK6_32', '刘家剑', '13426176932', '2016-08-16 19:29:04');
INSERT INTO `t_teinfo` VALUES ('北京分行_电子清分系统', 'null', 'null', 'null', 'dzqfsvr', 'null', '张金平', '13701110789', null);
INSERT INTO `t_teinfo` VALUES ('信用卡应用1机', null, null, null, 'xyk246', null, '王宾', '18518692983', '2017-06-09 09:54:01');
INSERT INTO `t_teinfo` VALUES ('信用卡应用2机', null, null, null, 'xyk146', null, '王宾', '18518692983', '2017-06-09 09:54:10');
