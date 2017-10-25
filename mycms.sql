/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : mycms

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-10-25 17:16:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mc_menu
-- ----------------------------
DROP TABLE IF EXISTS `mc_menu`;
CREATE TABLE `mc_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(10) NOT NULL DEFAULT 'admin' COMMENT '菜单类别（admin后台，user会员中心）',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mc_menu
-- ----------------------------
INSERT INTO `mc_menu` VALUES ('1', '系统设置', 'admin', 'cog', '0', '0', '', '0', '', '', '0', '0');
INSERT INTO `mc_menu` VALUES ('2', '数据库管理', 'admin', '', '0', '0', '', '0', '', '', '0', '0');
INSERT INTO `mc_menu` VALUES ('18', '用户管理', 'admin', 'users', '1', '0', 'index/user/index', '0', '', '', '0', '0');
INSERT INTO `mc_menu` VALUES ('19', '角色管理', 'admin', '', '1', '0', 'index/role/index', '0', '', '', '0', '0');
INSERT INTO `mc_menu` VALUES ('20', '权限管理', 'admin', '', '1', '0', 'index/auth/index', '0', '', '', '0', '0');
INSERT INTO `mc_menu` VALUES ('3', '菜单管理', 'admin', '', '1', '0', 'index/menu/index', '0', '', '', '0', '0');

-- ----------------------------
-- Table structure for mc_role
-- ----------------------------
DROP TABLE IF EXISTS `mc_role`;
CREATE TABLE `mc_role` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mc_role
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of mc_role_user
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of mc_user
-- ----------------------------
INSERT INTO `mc_user` VALUES ('34', '1', '0', '0', '0', '0', '0', '1508811133', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员', '', '', '', '', '', '', '', null);
