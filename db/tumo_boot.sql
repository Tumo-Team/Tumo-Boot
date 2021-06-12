/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 127.0.0.1:3306
 Source Schema         : tumo_boot

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 11/06/2021 10:40:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(256) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `oauth_client_details` VALUES ('client', NULL, '$2a$10$22emI3a6/w3a4ZZIa0.pY.dvLsyx4GH.he37wULtW8nJ.TeiGUpC6', 'app', 'password,refresh_token', 'http://tycoding.cn', NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for oss_file
-- ----------------------------
DROP TABLE IF EXISTS `oss_file`;
CREATE TABLE `oss_file` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `origin_name` varchar(255) DEFAULT NULL COMMENT '原始文件名称',
  `target_name` varchar(255) DEFAULT NULL COMMENT '文件存储名称',
  `bucket` varchar(255) DEFAULT NULL COMMENT '桶路径',
  `url` varchar(255) DEFAULT NULL COMMENT '文件地址',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型',
  `size` bigint(20) DEFAULT NULL COMMENT '文件大小',
  `des` varchar(255) DEFAULT NULL COMMENT '文件描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源文件表';

-- ----------------------------
-- Records of oss_file
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL COMMENT '部门ID',
  `parent_id` bigint(20) NOT NULL COMMENT '上级部门ID',
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1362597682681577273, 0, '测试部门', 1, '测试');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL COMMENT '编号',
  `type` int(10) DEFAULT NULL COMMENT '日志类型',
  `username` varchar(20) DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) DEFAULT NULL COMMENT '操作描述',
  `url` varchar(255) DEFAULT NULL COMMENT '请求URL',
  `time` bigint(20) DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级ID',
  `path` varchar(255) DEFAULT NULL COMMENT '菜单路径',
  `perms` varchar(255) DEFAULT NULL COMMENT '权限标识',
  `type` varchar(20) DEFAULT NULL COMMENT '菜单类型',
  `order_no` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_disabled` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `is_ext` tinyint(1) DEFAULT NULL COMMENT '是否外链',
  `is_keepalive` tinyint(1) DEFAULT NULL COMMENT '是否缓存',
  `is_show` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1402556566351122433, '权限模块', 0, '/upms', 'upms:view', 'menu', 100, 'ant-design:setting-outlined', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402557067260071938, '用户管理', 1402556566351122433, 'user', 'user:view', 'menu', 101, 'ant-design:user-switch-outlined', '/modules/upms/user/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402562175471669250, '用户新增', 1402557067260071938, NULL, 'user:add', 'button', 102, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402563862928248833, '用户修改', 1402557067260071938, NULL, 'user:update', 'button', 103, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402564440660070402, '用户删除', 1402557067260071938, NULL, 'user:delete', 'button', 104, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402891854378217473, '角色管理', 1402556566351122433, 'role', 'role:view', 'menu', 110, 'ant-design:user-switch-outlined', '/modules/upms/role/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402895826841288705, '角色新增', 1402891854378217473, NULL, 'role:add', 'button', 111, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402895916096077825, '角色修改', 1402891854378217473, NULL, 'role:update', 'button', 112, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896004537171970, '角色删除', 1402891854378217473, NULL, 'role:delete', 'button', 113, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896397505708033, '部门管理', 1402556566351122433, 'dept', 'dept:view', 'menu', 120, 'ant-design:audit-outlined', '/modules/upms/dept/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896819314278401, '部门新增', 1402896397505708033, NULL, 'dept:add', 'button', 121, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402896925455335425, '部门修改', 1402896397505708033, NULL, 'dept:update', 'button', 122, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897035325128705, '部门删除', 1402896397505708033, NULL, 'dept:delete', 'button', 123, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897356944359426, '菜单管理', 1402556566351122433, 'menu', 'menu:view', 'menu', 130, 'ant-design:unordered-list-outlined', '/modules/upms/menu/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897461059567617, '菜单新增', 1402897356944359426, NULL, 'menu:add', 'button', 131, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897607436582914, '菜单修改', 1402897356944359426, NULL, 'menu:update', 'button', 132, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402897754488881153, '菜单删除', 1402897356944359426, NULL, 'menu:delete', 'button', 133, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402900711645126657, '资源模块', NULL, '/resource', 'resource:view', 'menu', 200, 'ant-design:fork-outlined', 'Layout', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402901682110603265, '系统日志', 1402900711645126657, 'log', 'log:view', 'menu', 210, 'ant-design:thunderbolt-filled', '/modules/resource/log/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902022428041217, '日志删除', 1402901682110603265, NULL, 'log:delete', 'button', 211, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902525295730689, '文件管理', 1402900711645126657, 'file', 'oss:view', 'menu', 220, 'ant-design:folder-open-twotone', '/modules/resource/oss/index', 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902709501173762, '文件新增', 1402902525295730689, NULL, 'oss:add', 'button', 221, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402902826891354113, '文件修改', 1402902525295730689, NULL, 'oss:update', 'button', 222, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402903214973526017, '文件删除', 1402902525295730689, NULL, 'oss:delete', 'button', 223, NULL, NULL, 0, 0, 1, 1);
INSERT INTO `sys_menu` VALUES (1402904047832276993, 'API文档', NULL, 'http://127.0.0.1:8010/doc.html', 'api:view', 'menu', 300, 'ant-design:rocket-outlined', 'Layout', 0, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级节点',
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `alias` varchar(20) DEFAULT NULL COMMENT '角色别名',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1362304631325192103, 0, '超级管理员管理员', 'administrator', 1, '超级管理员管理员，不受权限控制');
INSERT INTO `sys_role` VALUES (1362597571041787906, 0, '用户管理员', 'user-admin', 1, '仅拥有用户管理权限');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单/按钮ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0锁定 1有效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1362304631325102103, 'administrator', '$2a$10$TlSIkPzm5QqkSMhtP0nFQ.fx864TTT6meypBChmMCcGrkq.5RLh0K', '超级管理员', '女', '19809587839', 'tycoding@sina.com', 1362597682681577473, '/upload/default.png', 1, '2019-01-01 00:00:00');
INSERT INTO `sys_user` VALUES (1362598312234024962, 'tycoding', '$2a$10$TlSIkPzm5QqkSMhtP0nFQ.fx864TTT6meypBChmMCcGrkq.5RLh0K', '涂陌', '男', '19823879128', 'tycoding@sina.com', 1362597682681577473, '/upload/default.png', 1, '2021-02-19 11:02:08');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1362304631325102103, 1362304631325192103);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
