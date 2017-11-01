/*
Navicat MySQL Data Transfer

Source Server         : localhost_3400
Source Server Version : 50624
Source Host           : localhost:3400
Source Database       : hxmqm2

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-11-01 15:47:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `maint_phone`
-- ----------------------------
DROP TABLE IF EXISTS `maint_phone`;
CREATE TABLE `maint_phone` (
  `hostname` varchar(24) DEFAULT NULL,
  `qmname` varchar(32) DEFAULT NULL,
  `peoname` varchar(24) DEFAULT NULL,
  `phonenum` varchar(11) DEFAULT NULL,
  `sysname` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maint_phone
-- ----------------------------
INSERT INTO `maint_phone` VALUES ('sfhc1', 'QM_PICP_304100040000_01', '乔蓉', '13426422475', '身份核查1机');
INSERT INTO `maint_phone` VALUES ('sfhc2', 'QM_PICP_304100040000_01', '乔蓉', '13426422475', '身份核查2机');
INSERT INTO `maint_phone` VALUES ('dzpjdb1', 'QMEMBFE', '乔蓉', '13426422475', '电子票据1机');
INSERT INTO `maint_phone` VALUES ('dzpjdb2', 'QMEMBFE', '乔蓉', '13426422475', '电子票据2机');
INSERT INTO `maint_phone` VALUES ('wbzf1', 'QMFXMB', '邓西灿', '15801509177', '境内外币支付1机');
INSERT INTO `maint_phone` VALUES ('wbzf2', 'QMFXMB', '邓西灿', '15801509177', '境内外币支付2机');
INSERT INTO `maint_phone` VALUES ('ebpsap1', 'QMHXB', '柳小强', '13681401234', '超网前置1机');
INSERT INTO `maint_phone` VALUES ('ebpsap1', 'QMUMBFEI', '柳小强', '13681401234', '超网前置1机');
INSERT INTO `maint_phone` VALUES ('ebpsap2', 'QMHXB', '柳小强', '13681401234', '超网前置2机');
INSERT INTO `maint_phone` VALUES ('ebpsap2', 'QMUMBFEJ', '柳小强', '13681401234', '超网前置2机');
INSERT INTO `maint_phone` VALUES ('pmtsqz1', 'QMHXB', '柳小强', '13681401234', '二代支付前置1机');
INSERT INTO `maint_phone` VALUES ('pmtsqz1', 'QMUMBFEA', '柳小强', '13681401234', '二代支付前置1机');
INSERT INTO `maint_phone` VALUES ('pmtsqz2', 'QMHXB', '柳小强', '13681401234', '二代支付前置2机');
INSERT INTO `maint_phone` VALUES ('pmtsqz2', 'QMUMBFEB', '柳小强', '13681401234', '二代支付前置2机');
INSERT INTO `maint_phone` VALUES ('swiftsaa1', 'QMSWIFT02', '韩博', '13716645510', 'SWIFT1机');
INSERT INTO `maint_phone` VALUES ('swiftsaa2', 'QMSWIFT02', '韩博', '13716645510', 'SWIFT2机');
INSERT INTO `maint_phone` VALUES ('yxjzmq1', 'QMYXL01', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq1', 'QMYXL01', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq2', 'QMYXL02', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq2', 'QMYXL02', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq3', 'QMYXL03', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq3', 'QMYXL03', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq4', 'QMYXL04', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq4', 'QMYXL04', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq5', 'QMYXL05', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq5', 'QMYXL05', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq5', 'QMREP01', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq5', 'QMREP01', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq6', 'QMYXL06', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq6', 'QMYXL06', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq6', 'QMREP02', '樊嵘', '13401177479', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('yxjzmq6', 'QMREP02', '张易辉', '13439717389', '影像流MQ集群');
INSERT INTO `maint_phone` VALUES ('wlmq1', 'QM_MTPS_0003040000_01', '邓西灿', '15801509177', '外联应用网关1机');
INSERT INTO `maint_phone` VALUES ('wlmq2', 'QM_MTPS_0003040000_01', '邓西灿', '15801509177', '外联应用网关2机');
INSERT INTO `maint_phone` VALUES ('cskh1', 'QM_TIPS_604100000010_01', '宫可想', '13691572770', '财税库行1机');
INSERT INTO `maint_phone` VALUES ('cskh2', 'QM_TIPS_604100000010_01', '宫可想', '13691572770', '财税库行2机');
INSERT INTO `maint_phone` VALUES ('cipspmtsqz1', 'QMUCAEA', '柳小强', '13681401234', '人民币跨境支付前置1机');
INSERT INTO `maint_phone` VALUES ('cipspmtsqz2', 'QMUCAEB', '柳小强', '13681401234', '人民币跨境支付前置2机');
INSERT INTO `maint_phone` VALUES ('cipsap1', 'QMU_CCPS', '柳小强', '13681401234', '人民币跨境支付应用1机');
INSERT INTO `maint_phone` VALUES ('cipsap2', 'QMU_CCPS', '柳小强', '13681401234', '人民币跨境支付应用2机');
INSERT INTO `maint_phone` VALUES ('amfedb1', 'QM_AMFE_C1030411000431_01', '柳小强', '13681401234', '人民币帐户管理1机');
INSERT INTO `maint_phone` VALUES ('amfedb2', 'QM_AMFE_C1030411000431_01', '柳小强', '13681401234', '人民币帐户管理2机');
INSERT INTO `maint_phone` VALUES ('wlmq1', 'QM_BANK0010', '邓西灿', '15801509177', '外联应用网关1机');
INSERT INTO `maint_phone` VALUES ('wlmq1', 'QMHXB', '邓西灿', '15801509177', '外联应用网关1机');
INSERT INTO `maint_phone` VALUES ('wlmq2', 'QM_BANK0010', '邓西灿', '15801509177', '外联应用网关2机');
INSERT INTO `maint_phone` VALUES ('wlmq2', 'QMHXB', '邓西灿', '15801509177', '外联应用网关2机');
INSERT INTO `maint_phone` VALUES ('dzgztx3', 'QMJGQZ      ', '李霞', '13810595170', '电子国债1机');
INSERT INTO `maint_phone` VALUES ('dzgztx4', 'QMJGQZ      ', '李霞', '13810595170', '电子国债2机');
INSERT INTO `maint_phone` VALUES ('RMBKJZF-A', 'QM_RCPMIS_604100000010_01', '宫可想', '13691572770', '人民币跨境支付管理1机');
INSERT INTO `maint_phone` VALUES ('RMBKJZF-B', 'QM_RCPMIS_604100000010_02', '宫可想', '13691572770', '人民币跨境支付管理2机');
INSERT INTO `maint_phone` VALUES ('pmtsqzby1', 'QMHXB', '柳小强', '13681401234', '二代支付前置备份1机');
INSERT INTO `maint_phone` VALUES ('pmtsqzby1', 'QMUMBFEA', '柳小强', '13681401234', '二代支付前置备份1机');
INSERT INTO `maint_phone` VALUES ('pmtsqzby2', 'QMHXB', '柳小强', '13681401234', '二代支付前置备份2机');
INSERT INTO `maint_phone` VALUES ('pmtsqzby2', 'QMUMBFEB', '柳小强', '13681401234', '二代支付前置备份2机');
