/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mycms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-10-30 02:02:33
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of mc_auth_access
-- ----------------------------
INSERT INTO `mc_auth_access` VALUES ('31', '4', 'index/setting/default', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('32', '4', 'index/index/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('33', '4', 'index/menu/add', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('34', '4', 'index/user/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('35', '4', 'index/role/index', 'admin_url');
INSERT INTO `mc_auth_access` VALUES ('36', '4', 'index/auth/index', 'admin_url');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of mc_auth_rule
-- ----------------------------
INSERT INTO `mc_auth_rule` VALUES ('2', '1', 'index', 'admin_url', 'index/Setting/default', '', '系统设置', '');
INSERT INTO `mc_auth_rule` VALUES ('3', '1', 'index', 'admin_url', 'index/Data/default', '', '数据库设置', '');
INSERT INTO `mc_auth_rule` VALUES ('4', '1', 'index', 'admin_url', 'index/Menu/index', '', '菜单管理', '');
INSERT INTO `mc_auth_rule` VALUES ('5', '1', 'index', 'admin_url', 'index/User/index', '', '用户管理', '');
INSERT INTO `mc_auth_rule` VALUES ('6', '1', 'index', 'admin_url', 'index/Role/index', '', '角色管理', '');
INSERT INTO `mc_auth_rule` VALUES ('7', '1', 'index', 'admin_url', 'index/Auth/index', '', '权限管理', '');
INSERT INTO `mc_auth_rule` VALUES ('8', '1', 'index', 'admin_url', 'index/Menu/add', '', '新增菜单', '');
INSERT INTO `mc_auth_rule` VALUES ('9', '1', 'index', 'admin_url', 'index/data/backup', '', '数据备份', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of mc_menu
-- ----------------------------
INSERT INTO `mc_menu` VALUES ('4', '0', '1', '1', '0', 'index', 'Setting', 'default', '', '系统设置', 'cog', '系统');
INSERT INTO `mc_menu` VALUES ('5', '0', '1', '1', '0', 'index', 'Data', 'default', '', '数据库设置', 'cog', '系统');
INSERT INTO `mc_menu` VALUES ('6', '4', '1', '1', '0', 'index', 'Menu', 'index', '', '菜单管理', '', '');
INSERT INTO `mc_menu` VALUES ('7', '4', '1', '1', '0', 'index', 'User', 'index', '', '用户管理', '', '');
INSERT INTO `mc_menu` VALUES ('8', '4', '1', '1', '0', 'index', 'Role', 'index', '', '角色管理', '', '');
INSERT INTO `mc_menu` VALUES ('9', '4', '1', '1', '0', 'index', 'Auth', 'index', '', '权限管理', '', '');
INSERT INTO `mc_menu` VALUES ('10', '6', '1', '0', '0', 'index', 'Menu', 'add', '', '新增菜单', '', '');
INSERT INTO `mc_menu` VALUES ('11', '5', '1', '1', '0', 'index', 'data', 'backup', '', '数据备份', '', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of mc_role
-- ----------------------------
INSERT INTO `mc_role` VALUES ('52', '0', '1', '1509174069', '0', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `mc_role` VALUES ('53', '0', '1', '1509174108', '0', '0', '普通管理员', '');

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
INSERT INTO `mc_role_user` VALUES ('2', '53', '1');
INSERT INTO `mc_role_user` VALUES ('7', '53', '35');

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of mc_user
-- ----------------------------
INSERT INTO `mc_user` VALUES ('1', '1', '0', '0', '1509297162', '5', '0', '1508811133', '1', 'admin', '99c348ce96784563b08f4e36c11ec5ab', '超级管理员', '', '', '', '', '0.0.0.0', '', '', null);
INSERT INTO `mc_user` VALUES ('35', '1', '0', '0', '1509275868', '1', '0', '1509088849', '1', 'zzh', 'aa64395bec97fc114b420dd4e11f4f64', 'zzh', '', '', '', '', '0.0.0.0', '', '', null);
INSERT INTO `mc_user` VALUES ('36', '1', '0', '0', '0', '0', '0', '1509177269', '1', 'ww', 'ad57484016654da87125db86f4227ea3', 'ww', '', '', '', '', '', '', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of mc_user_token
-- ----------------------------
INSERT INTO `mc_user_token` VALUES ('1', '34', '1524827687', '1509275687', '102876f8bbffb2c87b7c985a211cdb15b1c9e5a16b87fdedcbe6889c4f498ac3', 'web');
INSERT INTO `mc_user_token` VALUES ('2', '35', '1524827868', '1509275868', 'af1e674ac6b6bc983380651b8317366046995da061b0fc0dbffa3a1d1d8fef88', 'web');
INSERT INTO `mc_user_token` VALUES ('3', '1', '1524849162', '1509297162', '87a6adbfee84c14a37024c2879a4e4326661d77d7787f08bacc2d544fdaaec40', 'web');
