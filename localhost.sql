-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 年 09 月 18 日 14:38
-- 服务器版本: 5.5.53
-- PHP 版本: 5.4.45

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `base`
--
CREATE DATABASE `base` DEFAULT CHARACTER SET utf32 COLLATE utf32_unicode_ci;
USE `base`;

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_access`
--

CREATE TABLE IF NOT EXISTS `tp_admin_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `node_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `tp_admin_access`
--

INSERT INTO `tp_admin_access` (`role_id`, `node_id`, `level`, `pid`) VALUES
(1, 67, 3, 63),
(1, 66, 3, 63),
(1, 65, 3, 63),
(1, 64, 3, 63),
(1, 63, 2, 1),
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_group`
--

CREATE TABLE IF NOT EXISTS `tp_admin_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_admin_group`
--

INSERT INTO `tp_admin_group` (`id`, `name`, `icon`, `sort`, `status`, `remark`, `isdelete`, `create_time`, `update_time`) VALUES
(1, '系统管理', '&#xe61d;', 2, 1, '', 0, 1450752856, 1481180175),
(2, '工具', '&#xe616;', 3, 1, '', 0, 1476016712, 1481180175);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_node`
--

CREATE TABLE IF NOT EXISTS `tp_admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `isdelete` (`isdelete`),
  KEY `sort` (`sort`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=68 ;

--
-- 转存表中的数据 `tp_admin_node`
--

INSERT INTO `tp_admin_node` (`id`, `pid`, `group_id`, `name`, `title`, `remark`, `level`, `type`, `sort`, `status`, `isdelete`) VALUES
(1, 0, 1, 'Admin', '后台管理', '后台管理，不可更改', 1, 1, 1, 1, 0),
(2, 1, 1, 'AdminGroup', '分组管理', ' ', 2, 1, 1, 1, 0),
(3, 1, 1, 'AdminNode', '节点管理', ' ', 2, 1, 2, 1, 0),
(4, 1, 1, 'AdminRole', '角色管理', ' ', 2, 1, 3, 1, 0),
(5, 1, 1, 'AdminUser', '用户管理', '', 2, 1, 4, 1, 0),
(6, 1, 0, 'Index', '首页', '', 2, 1, 50, 1, 0),
(7, 6, 0, 'welcome', '欢迎页', '', 3, 0, 50, 1, 0),
(8, 6, 0, 'index', '未定义', '', 3, 0, 50, 1, 0),
(9, 1, 2, 'Generate', '代码自动生成', '', 2, 1, 50, 1, 0),
(10, 1, 2, 'Demo/excel', 'Excel一键导出', '', 2, 0, 2, 1, 0),
(11, 1, 2, 'Demo/download', '下载', '', 2, 0, 3, 1, 0),
(12, 1, 2, 'Demo/downloadImage', '远程图片下载', '', 2, 0, 4, 1, 0),
(13, 1, 2, 'Demo/mail', '邮件发送', '', 2, 0, 5, 1, 0),
(14, 1, 2, 'Demo/qiniu', '七牛上传', '', 2, 0, 6, 1, 0),
(15, 1, 2, 'Demo/hashids', 'ID加密', '', 2, 0, 7, 1, 0),
(16, 1, 2, 'Demo/layer', '丰富弹层', '', 2, 0, 8, 1, 0),
(17, 1, 2, 'Demo/tableFixed', '表格溢出', '', 2, 0, 9, 1, 0),
(18, 1, 2, 'Demo/ueditor', '百度编辑器', '', 2, 0, 10, 1, 0),
(19, 1, 2, 'Demo/imageUpload', '图片上传', '', 2, 0, 11, 1, 0),
(20, 1, 2, 'Demo/qrcode', '二维码生成', '', 2, 0, 12, 1, 0),
(21, 1, 1, 'NodeMap', '节点图', '', 2, 1, 5, 1, 0),
(22, 1, 1, 'WebLog', '操作日志', '', 2, 1, 6, 1, 0),
(23, 1, 1, 'LoginLog', '登录日志', '', 2, 1, 7, 1, 0),
(59, 1, 2, 'one.two.three.Four/index', '多级节点', '', 2, 0, 50, 1, 0),
(24, 23, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(25, 22, 0, 'index', '列表', '', 3, 0, 50, 1, 0),
(26, 22, 0, 'detail', '详情', '', 3, 0, 50, 1, 0),
(27, 21, 0, 'load', '自动导入', '', 3, 0, 50, 1, 0),
(28, 21, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(29, 5, 0, 'add', '添加', '', 3, 0, 51, 1, 0),
(30, 21, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0),
(31, 21, 0, 'deleteForever', '永久删除', '', 3, 0, 50, 1, 0),
(32, 9, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(33, 9, 0, 'generate', '生成方法', '', 3, 0, 50, 1, 0),
(34, 5, 0, 'password', '修改密码', '', 3, 0, 50, 1, 0),
(35, 5, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(36, 5, 0, 'add', '添加', '', 3, 0, 50, 1, 0),
(37, 5, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0),
(38, 4, 0, 'user', '用户列表', '', 3, 0, 50, 1, 0),
(39, 4, 0, 'access', '授权', '', 3, 0, 50, 1, 0),
(40, 4, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(41, 4, 0, 'add', '添加', '', 3, 0, 50, 1, 0),
(42, 4, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0),
(43, 4, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0),
(44, 4, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0),
(45, 3, 0, 'load', '节点快速导入测试', '', 3, 0, 50, 1, 0),
(46, 3, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(47, 3, 0, 'add', '添加', '', 3, 0, 50, 1, 0),
(48, 3, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0),
(49, 3, 0, 'forbid', '默认禁用操作', '', 3, 0, 50, 1, 0),
(50, 3, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0),
(51, 2, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(52, 2, 0, 'add', '添加', '', 3, 0, 50, 1, 0),
(53, 2, 0, 'edit', '编辑', '', 3, 0, 50, 1, 0),
(54, 2, 0, 'forbid', '默认禁用操作', '', 3, 0, 51, 1, 0),
(55, 2, 0, 'resume', '默认恢复操作', '', 3, 0, 50, 1, 0),
(56, 1, 2, 'one', '一级菜单', '', 2, 1, 13, 1, 0),
(60, 56, 2, 'two', '二级', '', 3, 1, 50, 1, 0),
(61, 60, 2, 'three', '三级菜单', '', 4, 1, 50, 1, 0),
(62, 61, 2, 'Four', '四级菜单', '', 5, 1, 50, 1, 0),
(63, 1, 2, 'Upload', '文件上传', '', 2, 1, 50, 1, 0),
(64, 63, 0, 'index', '首页', '', 3, 0, 50, 1, 0),
(65, 63, 0, 'Upload', '本地上传', '', 3, 0, 50, 1, 0),
(66, 63, 0, 'remote', '网络抓取', '', 3, 0, 50, 1, 0),
(67, 63, 0, 'listImage', '历史图片', '', 3, 0, 50, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_node_load`
--

CREATE TABLE IF NOT EXISTS `tp_admin_node_load` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='节点快速导入' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `tp_admin_node_load`
--

INSERT INTO `tp_admin_node_load` (`id`, `title`, `name`, `status`) VALUES
(4, '编辑', 'edit', 1),
(5, '添加', 'add', 1),
(6, '首页', 'index', 1),
(7, '删除', 'delete', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_role`
--

CREATE TABLE IF NOT EXISTS `tp_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`),
  KEY `isdelete` (`isdelete`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_admin_role`
--

INSERT INTO `tp_admin_role` (`id`, `pid`, `name`, `remark`, `status`, `isdelete`, `create_time`, `update_time`) VALUES
(1, 0, '客户名称', '', 1, 0, 1568788561, 1568788561);

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_role_user`
--

CREATE TABLE IF NOT EXISTS `tp_admin_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 转存表中的数据 `tp_admin_role_user`
--

INSERT INTO `tp_admin_role_user` (`role_id`, `user_id`) VALUES
(1, '2');

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin_user`
--

CREATE TABLE IF NOT EXISTS `tp_admin_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(32) NOT NULL DEFAULT '',
  `realname` varchar(255) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_login_ip` char(15) NOT NULL DEFAULT '',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '50',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `accountpassword` (`account`,`password`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_admin_user`
--

INSERT INTO `tp_admin_user` (`id`, `account`, `realname`, `password`, `last_login_time`, `last_login_ip`, `login_count`, `email`, `mobile`, `remark`, `status`, `isdelete`, `create_time`, `update_time`) VALUES
(1, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', 1568788645, '127.0.0.1', 5, 'tianpian0805@gmail.com', '13121126169', '我是超级管理员', 1, 0, 1222907803, 1451033528),
(2, 'demo', '客户名称', 'e10adc3949ba59abbe56e057f20f883e', 1568788593, '127.0.0.1', 3, '', '', '', 1, 0, 1476777133, 1477399793);

-- --------------------------------------------------------

--
-- 表的结构 `tp_file`
--

CREATE TABLE IF NOT EXISTS `tp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_login_log`
--

CREATE TABLE IF NOT EXISTS `tp_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login_ip` char(15) NOT NULL DEFAULT '',
  `login_location` varchar(255) NOT NULL DEFAULT '',
  `login_browser` varchar(255) NOT NULL DEFAULT '',
  `login_os` varchar(255) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `tp_login_log`
--

INSERT INTO `tp_login_log` (`id`, `uid`, `login_ip`, `login_location`, `login_browser`, `login_os`, `login_time`) VALUES
(1, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(67.0.3396.87)', 'Windows 7', '2019-03-18 10:03:50'),
(2, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(67.0.3396.87)', 'Windows 7', '2019-03-22 03:21:06'),
(3, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(73.0.3683.86)', 'Windows 7', '2019-04-09 01:56:36'),
(4, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-17 02:20:05'),
(5, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-17 02:43:52'),
(6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-17 02:45:04'),
(7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-18 06:19:18'),
(8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-18 06:31:31'),
(9, 2, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-18 06:32:17'),
(10, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-18 06:32:32'),
(11, 2, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-18 06:36:33'),
(12, 1, '127.0.0.1', '本机地址 本机地址  ', 'Chrome(75.0.3770.100)', 'Windows 10', '2019-09-18 06:37:25');

-- --------------------------------------------------------

--
-- 表的结构 `tp_node_map`
--

CREATE TABLE IF NOT EXISTS `tp_node_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`),
  KEY `map` (`method`,`module`,`controller`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点图' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_one_two_three_four`
--

CREATE TABLE IF NOT EXISTS `tp_one_two_three_four` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) DEFAULT NULL COMMENT '选填',
  `select` varchar(255) DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='四级控制器' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `tp_one_two_three_four`
--

INSERT INTO `tp_one_two_three_four` (`id`, `field1`, `option`, `select`, `radio`, `checkbox`, `password`, `textarea`, `date`, `mobile`, `email`, `sort`, `status`, `isdelete`, `create_time`, `update_time`) VALUES
(1, 'yuan1994', 'tpadmin', '2', '1', NULL, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', 50, 1, 0, 1481947278, 1481947353);

-- --------------------------------------------------------

--
-- 表的结构 `tp_web_log_001`
--

CREATE TABLE IF NOT EXISTS `tp_web_log_001` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`),
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站日志' AUTO_INCREMENT=303 ;

--
-- 转存表中的数据 `tp_web_log_001`
--

INSERT INTO `tp_web_log_001` (`id`, `uid`, `ip`, `location`, `os`, `browser`, `url`, `module`, `controller`, `action`, `method`, `data`, `create_at`) VALUES
(1, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568686740),
(2, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568686740),
(3, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568686743),
(4, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568686794),
(5, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:3:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";s:7:"captcha";s:4:"kb6a";}', 1568686805),
(6, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568686805),
(7, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568686805),
(8, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568687973),
(9, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568687974),
(10, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568687980),
(11, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568687987),
(12, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688068),
(13, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568688075),
(14, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688077),
(15, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688078),
(16, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568688083),
(17, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688222),
(18, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688226),
(19, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568688232),
(20, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688233),
(21, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688233),
(22, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688246),
(23, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688246),
(24, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688263),
(25, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688263),
(26, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688263),
(27, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688264),
(28, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688265),
(29, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688271),
(30, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688271),
(31, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568688279),
(32, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688280),
(33, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:4:"demo";s:8:"password";s:13:"1111111111111";}', 1568688284),
(34, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"sssss";s:8:"password";s:4:"qqqq";}', 1568688293),
(35, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568688304),
(36, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688304),
(37, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688305),
(38, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688402),
(39, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688402),
(40, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1568688407),
(41, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/qrcode.html', 'admin', 'Demo', 'qrcode', 'GET', 'a:0:{}', 1568688412),
(42, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1568688414),
(43, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/ueditor.html', 'admin', 'Demo', 'ueditor', 'GET', 'a:0:{}', 1568688415),
(44, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/ueditor/index.html?action=config&&noCache=1568688415997', 'admin', 'Ueditor', 'index', 'GET', 'a:2:{s:6:"action";s:6:"config";s:7:"noCache";s:13:"1568688415997";}', 1568688416),
(45, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/tablefixed.html', 'admin', 'Demo', 'tablefixed', 'GET', 'a:0:{}', 1568688416),
(46, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/layer.html', 'admin', 'Demo', 'layer', 'GET', 'a:0:{}', 1568688417),
(47, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/downloadimage.html', 'admin', 'Demo', 'downloadimage', 'GET', 'a:0:{}', 1568688418),
(48, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/download.html', 'admin', 'Demo', 'download', 'GET', 'a:0:{}', 1568688443),
(49, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/excel.html', 'admin', 'Demo', 'excel', 'GET', 'a:0:{}', 1568688446),
(50, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/download.html', 'admin', 'Demo', 'download', 'GET', 'a:0:{}', 1568688447),
(51, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/downloadimage.html', 'admin', 'Demo', 'downloadimage', 'GET', 'a:0:{}', 1568688447),
(52, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/mail.html', 'admin', 'Demo', 'mail', 'GET', 'a:0:{}', 1568688448),
(53, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/qiniu.html', 'admin', 'Demo', 'qiniu', 'GET', 'a:0:{}', 1568688449),
(54, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/layer.html', 'admin', 'Demo', 'layer', 'GET', 'a:0:{}', 1568688449),
(55, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/tablefixed.html', 'admin', 'Demo', 'tablefixed', 'GET', 'a:0:{}', 1568688450),
(56, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/ueditor.html', 'admin', 'Demo', 'ueditor', 'GET', 'a:0:{}', 1568688450),
(57, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/ueditor/index.html?action=config&&noCache=1568688451087', 'admin', 'Ueditor', 'index', 'GET', 'a:2:{s:6:"action";s:6:"config";s:7:"noCache";s:13:"1568688451087";}', 1568688451),
(58, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1568688452),
(59, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568688454),
(60, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688455),
(61, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688455),
(62, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688464),
(63, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688464),
(64, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688508),
(65, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688508),
(66, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688552),
(67, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688552),
(68, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/generate/index.html', 'admin', 'Generate', 'index', 'GET', 'a:0:{}', 1568688558),
(69, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688559),
(70, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688560),
(71, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688564),
(72, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568688572),
(73, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568688572),
(74, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/download.html', 'admin', 'Demo', 'download', 'GET', 'a:0:{}', 1568688685),
(75, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/downloadimage.html', 'admin', 'Demo', 'downloadimage', 'GET', 'a:0:{}', 1568688686),
(76, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/demo/imageupload.html', 'admin', 'Demo', 'imageupload', 'GET', 'a:0:{}', 1568688687),
(77, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/upload/index/id/upload.html', 'admin', 'Upload', 'index', 'GET', 'a:1:{s:2:"id";s:6:"upload";}', 1568688688),
(78, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568689277),
(79, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568689277),
(80, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568689740),
(81, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568689740),
(82, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568690893),
(83, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568690893),
(84, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568691000),
(85, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568691000),
(86, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568691013),
(87, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568691013),
(88, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568691013),
(89, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568691014),
(90, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568691015),
(91, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568691093),
(92, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568691094),
(93, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568708604),
(94, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568708604),
(95, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1568708607),
(96, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568708608),
(97, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568708608),
(98, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568708608),
(99, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568708608),
(100, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568708609),
(101, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1568708609),
(102, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1568708610),
(103, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', 1568708611),
(104, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1568708611),
(105, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568708612),
(106, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568708612),
(107, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568708612),
(108, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568787549),
(109, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568787549),
(110, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568787558),
(111, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568787558),
(112, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568787558),
(113, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1568787561),
(114, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787561),
(115, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787562),
(116, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568787562),
(117, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add?pid=1', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:"pid";s:1:"1";}', 1568787564),
(118, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:"id";s:0:"";s:3:"pid";s:1:"1";s:5:"level";s:1:"2";s:8:"group_id";s:1:"0";s:5:"title";s:12:"文件上传";s:4:"name";s:6:"Upload";s:4:"type";s:1:"0";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787578),
(119, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787578),
(120, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787578),
(121, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568787579),
(122, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787583),
(123, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"0";}', 1568787585),
(124, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:"id";s:2:"63";}', 1568787587),
(125, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:"id";s:2:"63";s:3:"pid";s:1:"1";s:5:"level";s:1:"2";s:8:"group_id";s:1:"2";s:5:"title";s:12:"文件上传";s:4:"name";s:6:"Upload";s:4:"type";s:1:"0";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787589),
(126, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787589),
(127, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787589),
(128, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"0";}', 1568787589),
(129, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787591),
(130, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:"pid";s:2:"63";}', 1568787592),
(131, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:"id";s:0:"";s:3:"pid";s:2:"63";s:5:"level";s:1:"3";s:8:"group_id";s:1:"0";s:5:"title";s:6:"首页";s:4:"name";s:5:"index";s:4:"type";s:1:"0";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787601),
(132, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787601),
(133, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787601),
(134, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787602),
(135, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/edit?id=63', 'admin', 'AdminNode', 'edit', 'GET', 'a:1:{s:2:"id";s:2:"63";}', 1568787605),
(136, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/edit', 'admin', 'AdminNode', 'edit', 'POST', 'a:9:{s:2:"id";s:2:"63";s:3:"pid";s:1:"1";s:5:"level";s:1:"2";s:8:"group_id";s:1:"2";s:5:"title";s:12:"文件上传";s:4:"name";s:6:"Upload";s:4:"type";s:1:"1";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787606),
(137, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787606),
(138, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787606),
(139, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787606),
(140, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:"pid";s:2:"63";}', 1568787608),
(141, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:"id";s:0:"";s:3:"pid";s:2:"63";s:5:"level";s:1:"3";s:8:"group_id";s:1:"0";s:5:"title";s:12:"本地上传";s:4:"name";s:6:"Upload";s:4:"type";s:1:"0";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787625),
(142, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787626),
(143, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787626),
(144, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787626),
(145, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:"pid";s:2:"63";}', 1568787627),
(146, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:"pid";s:2:"63";}', 1568787641),
(147, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:"id";s:0:"";s:3:"pid";s:2:"63";s:5:"level";s:1:"3";s:8:"group_id";s:1:"0";s:5:"title";s:12:"网络抓取";s:4:"name";s:6:"remote";s:4:"type";s:1:"0";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787659),
(148, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787659),
(149, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787660),
(150, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787660),
(151, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add?pid=63', 'admin', 'AdminNode', 'add', 'GET', 'a:1:{s:3:"pid";s:2:"63";}', 1568787663),
(152, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/add', 'admin', 'AdminNode', 'add', 'POST', 'a:9:{s:2:"id";s:0:"";s:3:"pid";s:2:"63";s:5:"level";s:1:"3";s:8:"group_id";s:1:"0";s:5:"title";s:12:"历史图片";s:4:"name";s:9:"listImage";s:4:"type";s:1:"0";s:4:"sort";s:2:"50";s:6:"status";s:1:"1";}', 1568787694),
(153, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568787695),
(154, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568787695),
(155, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"2";}', 1568787695),
(156, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568787701),
(157, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568787702),
(158, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/password/id/2.html', 'admin', 'AdminUser', 'password', 'GET', 'a:1:{s:2:"id";s:1:"2";}', 1568787718),
(159, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/password/id/2.html', 'admin', 'AdminUser', 'password', 'POST', 'a:3:{s:2:"id";s:1:"2";s:8:"password";s:6:"123456";s:10:"repassword";s:6:"123456";}', 1568787726),
(160, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568787728),
(161, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568787729),
(162, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/user/id/1.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568787734),
(163, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/user/id/1.html', 'admin', 'AdminRole', 'user', 'POST', 'a:2:{s:2:"id";s:1:"1";s:7:"user_id";a:1:{i:0;s:1:"2";}}', 1568787736),
(164, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568787737),
(165, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'POST', 'a:2:{s:2:"id";s:1:"1";s:7:"node_id";a:6:{i:0;s:5:"1_1_0";i:1;s:6:"63_2_1";i:2;s:7:"64_3_63";i:3;s:7:"65_3_63";i:4;s:7:"66_3_63";i:5;s:7:"67_3_63";}}', 1568787760),
(166, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788247),
(167, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788247),
(168, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788247),
(169, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788247),
(170, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788249),
(171, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788249),
(172, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788253),
(173, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788254),
(174, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788255),
(175, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788256),
(176, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788256),
(177, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788256),
(178, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788256),
(179, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568788265),
(180, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568788266),
(181, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:4:"base";s:8:"password";s:6:"123456";}', 1568788279),
(182, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568788291),
(183, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788291),
(184, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788291),
(185, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788293),
(186, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788296),
(187, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1568788298),
(188, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788298),
(189, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/forbid/id/2.html', 'admin', 'AdminUser', 'forbid', 'POST', 'a:1:{s:2:"id";s:1:"2";}', 1568788302),
(190, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/resume/id/2.html', 'admin', 'AdminUser', 'resume', 'POST', 'a:1:{s:2:"id";s:1:"2";}', 1568788302),
(191, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788304),
(192, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1568788304),
(193, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788305),
(194, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788305),
(195, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/user/id/1.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568788307),
(196, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/user/id/1.html', 'admin', 'AdminRole', 'user', 'POST', 'a:2:{s:2:"id";s:1:"1";s:7:"user_id";a:1:{i:0;s:1:"2";}}', 1568788309),
(197, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568788310),
(198, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'POST', 'a:2:{s:2:"id";s:1:"1";s:7:"node_id";a:6:{i:0;s:5:"1_1_0";i:1;s:6:"63_2_1";i:2;s:7:"64_3_63";i:3;s:7:"65_3_63";i:4;s:7:"66_3_63";i:5;s:7:"67_3_63";}}', 1568788318),
(199, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788319),
(200, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788323),
(201, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/password/id/2.html', 'admin', 'AdminUser', 'password', 'GET', 'a:1:{s:2:"id";s:1:"2";}', 1568788325),
(202, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788327),
(203, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568788329),
(204, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568788330),
(205, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:4:"demo";s:8:"password";s:6:"123456";}', 1568788337),
(206, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788337),
(207, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788337),
(208, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/upload/index.html', 'admin', 'Upload', 'index', 'GET', 'a:0:{}', 1568788339),
(209, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/upload/listimage.html', 'admin', 'Upload', 'listimage', 'POST', 'a:2:{s:1:"p";s:1:"1";s:5:"count";s:1:"1";}', 1568788341),
(210, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/upload/listimage.html', 'admin', 'Upload', 'listimage', 'POST', 'a:2:{s:1:"p";s:1:"1";s:5:"count";s:1:"1";}', 1568788342),
(211, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/upload/listimage.html', 'admin', 'Upload', 'listimage', 'POST', 'a:2:{s:1:"p";s:1:"1";s:5:"count";s:1:"1";}', 1568788343),
(212, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568788346),
(213, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568788347),
(214, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568788352),
(215, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788353),
(216, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788353),
(217, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1568788354),
(218, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788355),
(219, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788355),
(220, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788355),
(221, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788356),
(222, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788356),
(223, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788357),
(224, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788357),
(225, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788359),
(226, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788361),
(227, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788361),
(228, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788368);
INSERT INTO `tp_web_log_001` (`id`, `uid`, `ip`, `location`, `os`, `browser`, `url`, `module`, `controller`, `action`, `method`, `data`, `create_at`) VALUES
(229, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788368),
(230, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788368),
(231, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788369),
(232, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788369),
(233, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1568788370),
(234, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1568788371),
(235, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/login_log/index.html', 'admin', 'LoginLog', 'index', 'GET', 'a:0:{}', 1568788372),
(236, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/web_log/index.html', 'admin', 'WebLog', 'index', 'GET', 'a:0:{}', 1568788373),
(237, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/node_map/index.html', 'admin', 'NodeMap', 'index', 'GET', 'a:0:{}', 1568788374),
(238, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788390),
(239, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788391),
(240, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788392),
(241, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/edit/id/2.html', 'admin', 'AdminUser', 'edit', 'GET', 'a:1:{s:2:"id";s:1:"2";}', 1568788393),
(242, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788400),
(243, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/edit/id/1.html', 'admin', 'AdminRole', 'edit', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568788402),
(244, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788417),
(245, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788417),
(246, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788417),
(247, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_user/index.html', 'admin', 'AdminUser', 'index', 'GET', 'a:0:{}', 1568788419),
(248, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788420),
(249, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788420),
(250, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788420),
(251, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788420),
(252, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788429),
(253, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788430),
(254, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788430),
(255, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788430),
(256, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_group/index.html', 'admin', 'AdminGroup', 'index', 'GET', 'a:0:{}', 1568788430),
(257, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_group/edit/id/1.html', 'admin', 'AdminGroup', 'edit', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568788433),
(258, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788439),
(259, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788440),
(260, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788440),
(261, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788440),
(262, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788441),
(263, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788441),
(264, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788441),
(265, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788536),
(266, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788536),
(267, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788538),
(268, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'GET', 'a:0:{}', 1568788539),
(269, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/add.html', 'admin', 'AdminRole', 'add', 'POST', 'a:4:{s:2:"id";s:0:"";s:4:"name";s:12:"客户名称";s:6:"status";s:1:"1";s:6:"remark";s:0:"";}', 1568788561),
(270, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788561),
(271, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/user/id/1.html', 'admin', 'AdminRole', 'user', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568788565),
(272, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/user/id/1.html', 'admin', 'AdminRole', 'user', 'POST', 'a:2:{s:2:"id";s:1:"1";s:7:"user_id";a:1:{i:0;s:1:"2";}}', 1568788567),
(273, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'GET', 'a:1:{s:2:"id";s:1:"1";}', 1568788569),
(274, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/access/id/1.html', 'admin', 'AdminRole', 'access', 'POST', 'a:2:{s:2:"id";s:1:"1";s:7:"node_id";a:6:{i:0;s:5:"1_1_0";i:1;s:6:"63_2_1";i:2;s:7:"64_3_63";i:3;s:7:"65_3_63";i:4;s:7:"66_3_63";i:5;s:7:"67_3_63";}}', 1568788573),
(275, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568788581),
(276, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568788583),
(277, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:4:"demo";s:8:"password";s:6:"123456";}', 1568788593),
(278, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788593),
(279, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788593),
(280, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/upload/index.html', 'admin', 'Upload', 'index', 'GET', 'a:0:{}', 1568788595),
(281, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/profile.html', 'admin', 'Pub', 'profile', 'GET', 'a:0:{}', 1568788606),
(282, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/profile.html', 'admin', 'Pub', 'profile', 'POST', 'a:4:{s:8:"realname";s:12:"客户名称";s:5:"email";s:0:"";s:6:"mobile";s:0:"";s:6:"remark";s:0:"";}', 1568788632),
(283, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788634),
(284, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788635),
(285, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788636),
(286, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788636),
(287, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788636),
(288, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788637),
(289, 2, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/logout.html', 'admin', 'Pub', 'logout', 'GET', 'a:0:{}', 1568788639),
(290, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/login.html', 'admin', 'Pub', 'login', 'GET', 'a:0:{}', 1568788640),
(291, 0, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/checklogin.html', 'admin', 'Pub', 'checklogin', 'POST', 'a:2:{s:7:"account";s:5:"admin";s:8:"password";s:6:"123456";}', 1568788645),
(292, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/index.html', 'admin', 'Index', 'index', 'GET', 'a:0:{}', 1568788645),
(293, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/index/welcome.html', 'admin', 'Index', 'welcome', 'GET', 'a:0:{}', 1568788645),
(294, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788647),
(295, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788647),
(296, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788648),
(297, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788648),
(298, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index.html', 'admin', 'AdminNode', 'index', 'GET', 'a:0:{}', 1568788652),
(299, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:2:{s:4:"type";s:5:"group";s:9:"module_id";s:1:"1";}', 1568788652),
(300, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_node/index', 'admin', 'AdminNode', 'index', 'POST', 'a:3:{s:4:"type";s:4:"node";s:9:"module_id";s:1:"1";s:8:"group_id";s:1:"1";}', 1568788652),
(301, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/admin_role/index.html', 'admin', 'AdminRole', 'index', 'GET', 'a:0:{}', 1568788653),
(302, 1, '127.0.0.1', '本机地址 本机地址  ', 'Windows 10', 'Chrome(75.0.3770.100)', 'http://base.local/admin/pub/profile.html', 'admin', 'Pub', 'profile', 'GET', 'a:0:{}', 1568788655);

-- --------------------------------------------------------

--
-- 表的结构 `tp_web_log_all`
--

CREATE TABLE IF NOT EXISTS `tp_web_log_all` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC INSERT_METHOD=LAST UNION=(`tp_web_log_001`) COMMENT='网站日志';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
