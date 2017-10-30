/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : mycms

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-10-30 14:02:04
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='权限授权表';

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of mc_auth_rule
-- ----------------------------
INSERT INTO `mc_auth_rule` VALUES ('2', '1', 'index', 'admin_url', 'index/Setting/default', '', '系统设置', '');
INSERT INTO `mc_auth_rule` VALUES ('3', '1', 'index', 'admin_url', 'index/Report/index', '', '系统巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('4', '1', 'index', 'admin_url', 'index/Menu/index', '', '菜单管理', '');
INSERT INTO `mc_auth_rule` VALUES ('5', '1', 'index', 'admin_url', 'index/User/index', '', '用户管理', '');
INSERT INTO `mc_auth_rule` VALUES ('6', '1', 'index', 'admin_url', 'index/Role/index', '', '角色管理', '');
INSERT INTO `mc_auth_rule` VALUES ('7', '1', 'index', 'admin_url', 'index/Auth/index', '', '权限管理', '');
INSERT INTO `mc_auth_rule` VALUES ('8', '1', 'index', 'admin_url', 'index/Menu/add', '', '新增菜单', '');
INSERT INTO `mc_auth_rule` VALUES ('9', '1', 'index', 'admin_url', 'index/Report/linux', '', 'Linu巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('10', '1', 'index', 'admin_url', 'index/Report/windows', '', 'Windows巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('11', '1', 'index', 'admin_url', 'index/Report/mq', '', 'MQ巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('12', '1', 'index', 'admin_url', 'index/Report/was', '', 'was巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('13', '1', 'index', 'admin_url', 'index/Report/oracle', '', 'Oracle巡检', '');
INSERT INTO `mc_auth_rule` VALUES ('14', '1', 'index', 'admin_url', 'index/iframe/host', '', '新上线主机添加', '');
INSERT INTO `mc_auth_rule` VALUES ('15', '1', 'index', 'admin_url', 'index/iframe/sms', '', '报警短信黑名单', '');
INSERT INTO `mc_auth_rule` VALUES ('16', '1', 'index', 'admin_url', 'index/Iframe/gtp', '', 'GTP传输失败文件查询', '');
INSERT INTO `mc_auth_rule` VALUES ('17', '1', 'index', 'admin_url', 'index/Iframe/file', '', '查询文件是否存在            ', '');
INSERT INTO `mc_auth_rule` VALUES ('18', '1', 'index', 'admin_url', 'index/Iframe/chart', '', '设备故障信息统计', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of mc_menu
-- ----------------------------
INSERT INTO `mc_menu` VALUES ('4', '0', '1', '1', '0', 'index', 'Setting', 'default', '', '系统设置', 'cog', '系统');
INSERT INTO `mc_menu` VALUES ('5', '0', '1', '1', '0', 'index', 'Report', 'index', '', '系统巡检', 'dashboard', '');
INSERT INTO `mc_menu` VALUES ('6', '4', '1', '1', '0', 'index', 'Menu', 'index', '', '菜单管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('7', '4', '1', '1', '0', 'index', 'User', 'index', '', '用户管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('8', '4', '1', '1', '0', 'index', 'Role', 'index', '', '角色管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('9', '4', '1', '1', '0', 'index', 'Auth', 'index', '', '权限管理', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('10', '6', '1', '0', '0', 'index', 'Menu', 'add', '', '新增菜单', 'circle-o text-red', '');
INSERT INTO `mc_menu` VALUES ('11', '5', '1', '1', '0', 'index', 'Report', 'linux', '', 'Linu巡检', 'linux', '');
INSERT INTO `mc_menu` VALUES ('12', '5', '1', '1', '0', 'index', 'Report', 'windows', '', 'Windows巡检', 'windows', '');
INSERT INTO `mc_menu` VALUES ('13', '5', '1', '1', '0', 'index', 'Report', 'mq', '', 'MQ巡检', '', '');
INSERT INTO `mc_menu` VALUES ('14', '5', '1', '1', '0', 'index', 'Report', 'was', '', 'was巡检', '', '');
INSERT INTO `mc_menu` VALUES ('15', '5', '1', '1', '0', 'index', 'Report', 'oracle', '', 'Oracle巡检', '', '');
INSERT INTO `mc_menu` VALUES ('16', '0', '1', '1', '0', 'index', 'iframe', 'host', '', '新上线主机添加', 'laptop', '');
INSERT INTO `mc_menu` VALUES ('17', '0', '1', '1', '0', 'index', 'iframe', 'sms', '', '报警短信黑名单', 'edit', '');
INSERT INTO `mc_menu` VALUES ('18', '0', '1', '1', '0', 'index', 'Iframe', 'gtp', '', 'GTP传输失败文件查询', 'search', '');
INSERT INTO `mc_menu` VALUES ('19', '0', '1', '1', '0', 'index', 'Iframe', 'file', '', '查询文件是否存在                     ', 'files-o', '');
INSERT INTO `mc_menu` VALUES ('20', '0', '1', '1', '0', 'index', 'Iframe', 'chart', '', '设备故障信息统计', 'pie-chart', '');

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
INSERT INTO `mc_role` VALUES ('1', '0', '1', '1509174069', '0', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `mc_role` VALUES ('2', '0', '1', '1509174108', '0', '0', '普通管理员', '');

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
INSERT INTO `mc_role_user` VALUES ('2', '2', '2');

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
INSERT INTO `mc_user` VALUES ('1', '1', '0', '0', '1509327542', '6', '0', '1508811133', '1', 'admin', '99c348ce96784563b08f4e36c11ec5ab', '超级管理员', '', '', '', '', '0.0.0.0', '', '', null);
INSERT INTO `mc_user` VALUES ('2', '1', '0', '0', '1509328158', '2', '0', '1509088849', '1', 'zzh', 'aa64395bec97fc114b420dd4e11f4f64', 'zzh', '', '', '', '', '0.0.0.0', '', '', null);
INSERT INTO `mc_user` VALUES ('3', '1', '0', '0', '0', '0', '0', '1509177269', '1', 'ww', 'ad57484016654da87125db86f4227ea3', 'ww', '', '', '', '', '', '', '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of mc_user_token
-- ----------------------------
INSERT INTO `mc_user_token` VALUES ('1', '1', '1524879542', '1509327542', 'f1ee015816ed13f15a45f590a6a6bec9fce56114614d7a7d54ec02c9552f8147', 'web');
INSERT INTO `mc_user_token` VALUES ('4', '2', '1524880158', '1509328158', 'd28bc01d8f3388463446eccf1ecd96aa775140cf4e1d2fe5fa8a52b3c5994238', 'web');
