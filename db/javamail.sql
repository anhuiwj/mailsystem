/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost
 Source Database       : javamail

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : utf-8

 Date: 04/07/2017 12:55:06 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `eye_x_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `eye_x_role_menu`;
CREATE TABLE `eye_x_role_menu` (
  `id` char(32) NOT NULL COMMENT '主键',
  `role_id` char(32) DEFAULT NULL COMMENT '角色主键',
  `menu_id` char(32) DEFAULT NULL COMMENT '权限主键',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记0：正常 1：删除',
  `source_id` varchar(4) DEFAULT NULL COMMENT '来源代码',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
--  Table structure for `file_info`
-- ----------------------------
DROP TABLE IF EXISTS `file_info`;
CREATE TABLE `file_info` (
  `id` varchar(32) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `del_flag` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `file_info`
-- ----------------------------
BEGIN;
INSERT INTO `file_info` VALUES ('42b1ba0f0aa24a2fbd3e87e181778fc3', 'Tulips.jpg', '0'), ('566b0985a8da4b5a8e5eff50dbfc6029', 'Tulips.jpg', '0'), ('8914356cfa734168b1d1e5417b9c7a18', 'Tulips.jpg', '0'), ('8eea3390408f46c19b303128247f4ac8', 'Tulips.jpg', '0'), ('a25423e435a54d7d8ed64293783aa261', 'Tulips.jpg', '0'), ('ad311bd40bee4d58bead12745ce84c63', 'Jellyfish.jpg', '0'), ('c3498621f1bd40318df8adc3a641dc14', '3.png', '0'), ('cf8f193f4b6d4055aaaf0790056df5b3', 'Penguins.jpg', '0'), ('d8e152001501433494ce24ff08368ade', 'Tulips.jpg', '0'), ('fcb9df1466f94437b2a85da8a8781489', 'Tulips.jpg', '0');
COMMIT;

-- ----------------------------
--  Table structure for `formula`
-- ----------------------------
DROP TABLE IF EXISTS `formula`;
CREATE TABLE `formula` (
  `id` varchar(32) NOT NULL,
  `formula_name` varchar(64) NOT NULL COMMENT '配比公式名称',
  `create_by` varchar(32) DEFAULT NULL,
  `del_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配比公式配置';

-- ----------------------------
--  Records of `formula`
-- ----------------------------
BEGIN;
INSERT INTO `formula` VALUES ('063e899680024c458490e7275c5d6b7a', '钙钒石', 'admin', '0', '2017-03-19 10:59:54', null, '2017-03-19 10:59:54'), ('1', '123', '123', '0', '2017-03-18 17:00:06', null, null), ('2423de1f5d4e49c0891ee8c9aa9b731f', 'test', null, '0', '2017-03-18 20:16:10', null, '2017-03-18 20:16:10'), ('2cd8ccdff70b41ba8528664be714ce2a', 'wqe', '123', '0', '2017-02-16 17:01:03', null, '2017-03-18 16:14:59'), ('2fff78b59e874dd088727f412de03dae', '123', '132', '0', '2017-03-21 17:01:08', null, '2017-03-18 16:53:16'), ('6ec2a709c8f44a72b48c9f2e1dfec7aa', '12323', 'admin', '0', '2017-03-18 20:17:04', null, '2017-03-18 20:17:04'), ('8aea91cb39cc435f86e9ac84a00b2e8d', '12323', null, '0', '2017-03-18 17:20:50', null, '2017-03-18 17:20:50'), ('8df718351a504619b0815c2e9ec07db7', '分废水凝集剂', null, '0', '2017-03-18 17:13:05', null, '2017-03-18 17:13:05'), ('93522ca8cf8b4770a555f90e61568910', 'ceshi', '132', '0', '2017-03-06 17:01:12', null, '2017-03-18 16:19:50'), ('a15a6193e3044595a84d5c823ac04796', '挨打的', null, '0', '2017-03-18 17:17:20', null, '2017-03-18 17:17:20'), ('ad43b64eca3b4efcb11eb9298f0c61ec', '212', null, '0', '2017-03-18 17:02:45', null, '2017-03-18 17:02:45'), ('f7875417a5bb40c1be0abe3d16dab051', '硫酸钾', null, '0', '2017-03-18 17:01:49', null, '2017-03-18 17:01:49');
COMMIT;

-- ----------------------------
--  Table structure for `formula_matarial`
-- ----------------------------
DROP TABLE IF EXISTS `formula_matarial`;
CREATE TABLE `formula_matarial` (
  `id` varchar(32) NOT NULL,
  `formula_id` varchar(32) NOT NULL,
  `raw_material_id` varchar(32) NOT NULL,
  `need_num` int(11) DEFAULT NULL,
  `del_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配比公式原材料数量';

-- ----------------------------
--  Records of `formula_matarial`
-- ----------------------------
BEGIN;
INSERT INTO `formula_matarial` VALUES ('036a47ee6bf44297b21941f809a17323', '93522ca8cf8b4770a555f90e61568910', '4964be0b27264475a930075c77ec0972', '21', '1', '2017-03-18 17:03:08', null, '2017-03-18 17:03:08'), ('1', '1', '1', '123', '0', null, null, null), ('134c2632a2f24355b8dfce2b30850623', '8aea91cb39cc435f86e9ac84a00b2e8d', '1', '3', '0', '2017-03-18 17:20:50', null, '2017-03-18 17:20:50'), ('22862c5fd9264a09837ba0de71354f64', '8df718351a504619b0815c2e9ec07db7', '7b0afb4480594d92bab5e21bb7dca319', '4', '0', '2017-03-18 17:13:05', null, '2017-03-18 17:13:05'), ('3a1d0704f7304cdd801dca168c661556', '6ec2a709c8f44a72b48c9f2e1dfec7aa', '1', '12', '0', '2017-03-18 20:17:04', null, '2017-03-18 20:17:04'), ('3dba141613c0486fab0dd5e32f5108f0', '063e899680024c458490e7275c5d6b7a', '1', '12', '0', '2017-03-19 10:59:54', null, '2017-03-19 10:59:54'), ('4852b0f1a3ff4037891e8f8f7c167f11', '8df718351a504619b0815c2e9ec07db7', '4964be0b27264475a930075c77ec0972', '2', '0', '2017-03-18 17:13:05', null, '2017-03-18 17:13:05'), ('594344df5e82421b8add408e86743274', '2fff78b59e874dd088727f412de03dae', '1', '12', '0', '2017-03-18 17:15:17', null, '2017-03-18 17:15:17'), ('6631be700749452684359792611acfb2', '2423de1f5d4e49c0891ee8c9aa9b731f', '1', '12', '0', '2017-03-18 20:16:10', null, '2017-03-18 20:16:10'), ('7541d875de4142b39ae139c59efe8425', '8aea91cb39cc435f86e9ac84a00b2e8d', '1', '2', '0', '2017-03-18 17:20:50', null, '2017-03-18 17:20:50'), ('817621bd80f24d69bdec84b74b2a828b', '93522ca8cf8b4770a555f90e61568910', '1', '1', '0', null, null, '2017-03-18 16:19:50'), ('90bc8d80fb8c4356a451687ba9b615fd', '2cd8ccdff70b41ba8528664be714ce2a', '4964be0b27264475a930075c77ec0972', '1', '1', null, null, '2017-03-18 16:51:55'), ('998033feac9645bea6c506342913d0d8', '8df718351a504619b0815c2e9ec07db7', '1', '1', '1', '2017-03-18 17:13:05', null, '2017-03-18 17:13:05'), ('a62434ae15ee4b3fa5ab576b9a5fe345', 'a15a6193e3044595a84d5c823ac04796', '7b0afb4480594d92bab5e21bb7dca319', '12', '0', '2017-03-18 17:17:20', null, '2017-03-18 17:17:20'), ('aab16b56ae1d4390a5131262905dc805', '2fff78b59e874dd088727f412de03dae', 'd0c78b2840bc44d9a8b0716733251ec3', '12', '1', null, null, '2017-03-18 16:53:16'), ('b34125c2cb4e4af48254b6244cc90e11', '2423de1f5d4e49c0891ee8c9aa9b731f', 'df1c068ffae648308e6e67a839a9fe81', '1', '0', '2017-03-19 17:35:56', null, '2017-03-19 17:35:56'), ('cd6f634e849e40e489ba890605146f6b', '1', 'd0c78b2840bc44d9a8b0716733251ec3', '12', '1', null, null, '2017-03-18 16:27:52'), ('e18c17d6cb4c40eeaa1d8f07d6102ae7', '2cd8ccdff70b41ba8528664be714ce2a', '1', '12', '1', null, null, '2017-03-18 16:51:37'), ('e47cdb6ef0d04de4ad91f9e6d3e37b11', 'ad43b64eca3b4efcb11eb9298f0c61ec', '1', '1', '0', '2017-03-18 17:02:45', null, '2017-03-18 17:02:45'), ('e4b7548a29324365b09808c5a7e1d897', '2fff78b59e874dd088727f412de03dae', '4964be0b27264475a930075c77ec0972', '12', '0', '2017-03-19 17:10:14', null, '2017-03-19 17:10:14'), ('e60d9f75348a49729acf75635203d09d', '2cd8ccdff70b41ba8528664be714ce2a', '4964be0b27264475a930075c77ec0972', '243', '1', null, null, '2017-03-18 16:47:46'), ('e80cf0a76a47410aa3d10c35adc55480', '2cd8ccdff70b41ba8528664be714ce2a', '1', '1', '1', null, null, '2017-03-18 16:50:17'), ('ecbdd4d989924565b602e65644874c49', '8aea91cb39cc435f86e9ac84a00b2e8d', '7b0afb4480594d92bab5e21bb7dca319', '1', '0', '2017-03-18 17:20:50', null, '2017-03-18 17:20:50'), ('fcbbec69b7014d8d8295f28a0172aa02', '2cd8ccdff70b41ba8528664be714ce2a', '1', '12', '0', null, null, '2017-03-18 16:51:55');
COMMIT;

-- ----------------------------
--  Table structure for `in_material`
-- ----------------------------
DROP TABLE IF EXISTS `in_material`;
CREATE TABLE `in_material` (
  `id` varchar(32) NOT NULL,
  `raw_material_id` varchar(32) NOT NULL COMMENT '原材料id',
  `in_num` float(32,1) DEFAULT '0.0' COMMENT '进货数量',
  `in_user` varchar(32) NOT NULL COMMENT '进货人',
  `in_date` datetime DEFAULT NULL,
  `del_flag` varchar(2) NOT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原材料进货';

-- ----------------------------
--  Records of `in_material`
-- ----------------------------
BEGIN;
INSERT INTO `in_material` VALUES ('063e5be0089a422790f16121ee8e08ff', 'df1c068ffae648308e6e67a839a9fe81', '1.0', '管理员', '2017-03-19 17:35:36', '0', null, null, null, '2017-03-19 17:35:36'), ('1', '1', '6.3', '管理员', '2017-03-19 17:09:56', '0', 'admin', null, null, '2017-03-19 17:09:56'), ('dde84bb216984999b17f3e1c523e7d0e', '4964be0b27264475a930075c77ec0972', '12.0', '管理员', '2017-03-19 17:09:45', '0', null, null, null, '2017-03-19 17:09:45');
COMMIT;

-- ----------------------------
--  Table structure for `mail`
-- ----------------------------
DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` varchar(32) NOT NULL,
  `mail_id` varchar(32) NOT NULL,
  `status` varchar(2) NOT NULL COMMENT '状态 0 未发送 1已发送 2草稿 3删除',
  `send_user` varchar(32) DEFAULT NULL,
  `receive_user` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mail_info`
-- ----------------------------
DROP TABLE IF EXISTS `mail_info`;
CREATE TABLE `mail_info` (
  `id` varchar(32) NOT NULL,
  `mail_content` longtext COMMENT '邮件内容',
  `is_read` varchar(2) DEFAULT NULL COMMENT '是否已读 1已读 2未读',
  `file_id` varchar(32) DEFAULT NULL COMMENT '对应附件id',
  `del_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `make_product_material`
-- ----------------------------
DROP TABLE IF EXISTS `make_product_material`;
CREATE TABLE `make_product_material` (
  `id` varchar(32) NOT NULL,
  `material_num` int(11) DEFAULT '0' COMMENT '所需原材料数量',
  `make_product_id` varchar(32) NOT NULL COMMENT '制作产品id',
  `raw_material_id` varchar(32) NOT NULL COMMENT '原材料id',
  `del_flag` varchar(2) NOT NULL,
  `source_id` varchar(32) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='  产品制作所需原材料表（与raw_material关联）';

-- ----------------------------
--  Records of `make_product_material`
-- ----------------------------
BEGIN;
INSERT INTO `make_product_material` VALUES ('37212aa7ff724cc888d4a71903ad347d', '0', '32c613cbd9d84bbc98f26078930d6bb8', '1', '0', null, null, null, null, '2017-03-19 17:36:28'), ('7cc7827d0eb9450097592ca7cc310d67', '0', '3b7bfc064dfa4c63b0d3af6d834adda6', '1', '0', null, 'admin', null, null, '2017-03-19 11:30:36'), ('80b28290f6e949ad8dcc14888fcbc2a3', '0', '782b8d7484da40d899abfd740b979fe6', '1', '0', null, 'admin', null, null, '2017-03-19 12:19:34'), ('8f1ebe3ce40f42c4badd58ef25b93081', '0', 'b5d26ef8904848c3b5861169f6fd788e', '1', '0', null, 'admin', null, null, '2017-03-19 12:04:11'), ('a4a9a2b7656348ada94ba6360afec2ef', '0', '86fb97fca9f7439daf213c8088b6381c', '1', '0', null, 'admin', null, null, '2017-03-19 11:29:13'), ('a896c882cdf74c66a2279cf0cf8c1848', '0', 'e32545a7e7cc4bcd88ac73b7cab6ef22', '1', '0', null, 'admin', null, null, '2017-03-19 12:18:05'), ('af60175051d0405bb556d138a6e67afa', '0', '6b1522f218b14a48bd22d222bd43348d', '1', '0', null, 'admin', null, null, '2017-03-19 12:18:39');
COMMIT;

-- ----------------------------
--  Table structure for `make_product_num`
-- ----------------------------
DROP TABLE IF EXISTS `make_product_num`;
CREATE TABLE `make_product_num` (
  `id` varchar(32) NOT NULL,
  `product_name` varchar(64) DEFAULT NULL COMMENT '产品名称',
  `pro_num` int(11) DEFAULT NULL COMMENT '制作产品数量',
  `formula_id` varchar(32) NOT NULL COMMENT '配比公式id',
  `del_flag` varchar(2) DEFAULT NULL,
  `source_id` varchar(32) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品制作数量中间表（与make_product_material关联）';

-- ----------------------------
--  Records of `make_product_num`
-- ----------------------------
BEGIN;
INSERT INTO `make_product_num` VALUES ('1', '分废水凝集剂', '12', '', '0', null, null, '2017-03-17 21:04:18', null, null), ('32c613cbd9d84bbc98f26078930d6bb8', '测试产品', '1', '063e899680024c458490e7275c5d6b7a', '0', null, '管理员', '2017-03-19 17:36:28', null, '2017-03-19 17:36:28'), ('3b5005cf11b847dda5d550da738f4f74', '12', '12', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', null, null, '2017-03-19 11:24:53'), ('3b7bfc064dfa4c63b0d3af6d834adda6', '盖世', '12', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', '2017-03-19 11:30:36', null, '2017-03-19 11:30:33'), ('6b1522f218b14a48bd22d222bd43348d', '1', '1', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', '2017-03-19 12:18:37', null, '2017-03-19 12:18:34'), ('782b8d7484da40d899abfd740b979fe6', '13', '1', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', '2017-03-19 12:19:34', null, '2017-03-19 12:19:34'), ('86fb97fca9f7439daf213c8088b6381c', 'ad', '12', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', '2017-03-19 11:29:09', null, '2017-03-19 11:28:58'), ('930576e755ca44179c209d201744fc27', '12', '12', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', null, null, '2017-03-19 11:26:05'), ('b5d26ef8904848c3b5861169f6fd788e', '123', '12', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', '2017-03-19 12:04:11', null, '2017-03-19 12:04:08'), ('e32545a7e7cc4bcd88ac73b7cab6ef22', '123', '1', '063e899680024c458490e7275c5d6b7a', '0', null, 'admin', '2017-03-19 12:18:05', null, '2017-03-19 12:18:04');
COMMIT;

-- ----------------------------
--  Table structure for `raw_material`
-- ----------------------------
DROP TABLE IF EXISTS `raw_material`;
CREATE TABLE `raw_material` (
  `id` varchar(32) NOT NULL,
  `commonly_called` varchar(64) DEFAULT NULL COMMENT '俗称',
  `china_name` varchar(32) DEFAULT NULL,
  `english_name` varchar(32) DEFAULT NULL COMMENT '英文名',
  `chemical_formula` varchar(255) DEFAULT NULL COMMENT '化学式',
  `del_flag` varchar(2) NOT NULL,
  `source_id` varchar(32) DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `Inventory` int(11) DEFAULT '0' COMMENT '库存量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `raw_material`
-- ----------------------------
BEGIN;
INSERT INTO `raw_material` VALUES ('1', '钙钒石', '钙钒石', 'a', 'CaO·Al<sub>2</sub>O<sub>3</sub>·3CaSO<sub>2</sub>·32H<sub>2</sub>O', '0', null, 'admin', null, null, '2017-03-18 17:15:39', null), ('4964be0b27264475a930075c77ec0972', '硫酸铝', '硫酸铝', '12s', '12', '0', null, 'admin', null, null, '2017-03-18 17:11:07', null), ('7b0afb4480594d92bab5e21bb7dca319', '无水硫酸钠', '无水硫酸钠', 's', '', '1', null, 'admin', null, null, '2017-03-18 17:12:28', null), ('d0c78b2840bc44d9a8b0716733251ec3', '二水硫酸钠', '二水硫酸钠', 'ss', 'H<sub><sub><sub><sub>2</sub></sub></sub></sub>O', '0', null, 'admin', null, null, '2017-03-18 17:11:49', null), ('df1c068ffae648308e6e67a839a9fe81', 'test', 'test', 'test', 'H<sub><sub>2</sub></sub>O', '0', null, null, null, null, '2017-03-19 17:35:06', null), ('eb2393f46b674e4fae4279c6ab44d5d1', '八水硫酸钠', '八水硫酸钠', 'wee', '', '1', null, 'admin', null, null, '2017-03-18 17:12:03', null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `pid` varchar(32) DEFAULT NULL,
  `sys` varchar(16) DEFAULT NULL COMMENT '系统',
  `name` varchar(64) DEFAULT NULL COMMENT '名称',
  `href` varchar(64) DEFAULT NULL COMMENT '菜单链接',
  `target` varchar(64) DEFAULT NULL COMMENT '目标',
  `icon` varchar(64) DEFAULT NULL COMMENT '菜单图标',
  `permission` varchar(64) DEFAULT NULL COMMENT '权限标识',
  `display` varchar(2) DEFAULT NULL COMMENT '是否显示',
  `sort` int(11) NOT NULL COMMENT '排序',
  `del_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `remarks` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('12', '0', null, '功能菜单', null, null, null, null, null, '1', '0', null, null, null, null, null), ('2', '12', null, '系统管理', null, null, null, null, '1', '1', '0', null, null, null, null, null), ('2ceab77bf80a437cbff8ef2d8b5cf7d0', '5', null, '1', '1', '', '', '1', '0', '1', '1', null, null, '2017-03-18 10:02:00', null, null), ('2f4df4bb89654bed850cfeecf6b08811', '6', null, '1', '', '', '', '', null, '1', '1', null, null, '2017-03-17 13:07:41', null, null), ('3', '2', null, '角色管理', '/role/index', null, null, null, '1', '1', '0', null, null, null, null, null), ('38dbcaf3e5404d509acdd005eeba3d7c', '6', null, '1', '', '', '', '', null, '1', '1', null, null, '2017-03-17 13:09:15', null, null), ('4', '2', null, '菜单管理', '/menu/index', null, null, null, '1', '2', '0', null, null, null, null, null), ('47c1d826b61749a8b86844244a480276', '5', null, '配比原材料', '/rawmaterial/index', '', '', '', '1', '2', '0', null, null, '2017-03-17 21:31:56', null, null), ('5', '12', null, '产品管理', '#', '', '', '', '1', '2', '0', null, null, '2017-03-17 17:51:44', null, null), ('572d1488331c40dba2d8e7d123ed4c44', '5', null, '进货管理', '/productIn/index', '', '', '', '1', '3', '0', null, null, '2017-03-18 09:56:06', null, null), ('6', '5', null, '产品信息列表', '/product/index', '', '', '', '1', '1', '0', null, null, '2017-03-17 17:51:22', null, null), ('7158ba3d0040475cb546a23efc7bcad7', '12', null, '邮箱管理', '#', '', '', '', '1', '3', '0', null, null, '2017-04-03 07:42:57', null, null), ('82f7542430454b239df414050a220642', '5', null, '进货管理', '/productIn/index', '', '', '', '1', '3', '1', null, null, '2017-03-18 09:56:06', null, null), ('8841161c47e3452eafa15e77d78262c5', '7158ba3d0040475cb546a23efc7bcad7', null, '收件箱', '/receive/index', '', '', '', '1', '1', '0', null, null, '2017-04-03 07:49:08', null, null), ('9a9ec223236e4e5d85714a6d4ba57af9', '7158ba3d0040475cb546a23efc7bcad7', null, '草稿箱', '/rubish/index', '', '', '', '1', '3', '0', null, null, '2017-04-05 12:58:30', null, null), ('a293134c063a4b51abd8005d30474571', '7158ba3d0040475cb546a23efc7bcad7', null, '已发送', '/send/index', '', '', '', '1', '2', '0', null, null, '2017-04-05 12:58:11', null, null), ('a88ffb9c37bf47bd9a937e2fa524a49c', '5', null, '配比原材料', '/rawmaterial/index', '', '', '', '1', '2', '1', null, null, '2017-03-17 21:31:56', null, null), ('ab6615a73fb94878870ee9f5b2529d8c', '7158ba3d0040475cb546a23efc7bcad7', null, '联系人管理', '/tongxun/index', '', '', '', '1', '4', '0', null, null, '2017-04-06 12:41:10', null, null), ('b1fb00cdb3ca4ade82123bbb18e40cd3', '2', null, '用户管理', '/user/index', '', '', '', '1', '3', '0', null, 'admin', '2017-03-19 13:08:08', null, null), ('b38748bc4ca7497db63ab29ed4a29c0b', '6', null, 'd', '1', '', '', '', null, '1', '1', null, null, '2017-03-17 13:33:32', null, null), ('c372276db7e647f9b7238b2bde59db48', '5', null, '产品配比公式', '/productFormula/index', '', '', '', '1', '4', '0', null, null, '2017-03-18 11:08:52', null, null), ('f7b424dfbcbd4eb9a5faa2e78ea4062a', '5', null, '1', '1', '2', '3', '1', '0', '1', '1', null, null, '2017-03-18 10:02:34', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `sys_x_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_x_dict`;
CREATE TABLE `sys_x_dict` (
  `id` varchar(5) NOT NULL COMMENT '类型id',
  `code` varchar(32) NOT NULL DEFAULT '' COMMENT '标准代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pinyin` varchar(50) DEFAULT NULL COMMENT '拼音',
  `pcode` varchar(3) DEFAULT NULL COMMENT '上级代码',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记0：正常 1：删除',
  `source_id` varchar(32) DEFAULT NULL COMMENT '来源代码',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- ----------------------------
--  Records of `sys_x_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_x_dict` VALUES ('00001', '1', '电子邮件加密算法系统', null, null, '0', null, null, null, null, null), ('00002', '1', '男', null, null, '0', null, null, null, null, null), ('00002', '2', '女', null, null, '0', null, null, null, null, null), ('00004', '1', '是', null, null, '0', '通用条件判断', null, null, null, null), ('00004', '2', '否', null, null, '0', '通用条件判断', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) NOT NULL,
  `rolename` varchar(64) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `del_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `remarks` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_role` VALUES ('37408db105dd4d43a25e865d9c1d4664', '普通用户', '1', '0', null, null, '2017-04-06 22:04:34', null, null), ('6270d4974f754219a5907bfba76ce38e', '管理员', '1', '0', null, null, '2017-04-06 12:40:38', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `role_id` varchar(32) NOT NULL,
  `menu_id` varchar(32) NOT NULL,
  `del_flag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '12', '1'), ('6270d4974f754219a5907bfba76ce38e', '3', '1'), ('6270d4974f754219a5907bfba76ce38e', '4', '1'), ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1'), ('6270d4974f754219a5907bfba76ce38e', '7158ba3d0040475cb546a23efc7bcad7', '1'), ('6270d4974f754219a5907bfba76ce38e', '8841161c47e3452eafa15e77d78262c5', '1'), ('6270d4974f754219a5907bfba76ce38e', 'a293134c063a4b51abd8005d30474571', '1'), ('6270d4974f754219a5907bfba76ce38e', '9a9ec223236e4e5d85714a6d4ba57af9', '1'), ('6270d4974f754219a5907bfba76ce38e', '12', '1'), ('6270d4974f754219a5907bfba76ce38e', '2', '1'), ('6270d4974f754219a5907bfba76ce38e', '3', '1'), ('6270d4974f754219a5907bfba76ce38e', '4', '1'), ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1'), ('6270d4974f754219a5907bfba76ce38e', '12', '0'), ('6270d4974f754219a5907bfba76ce38e', '2', '0'), ('6270d4974f754219a5907bfba76ce38e', '3', '0'), ('6270d4974f754219a5907bfba76ce38e', '4', '0'), ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '0'), ('6270d4974f754219a5907bfba76ce38e', '7158ba3d0040475cb546a23efc7bcad7', '0'), ('6270d4974f754219a5907bfba76ce38e', '8841161c47e3452eafa15e77d78262c5', '0'), ('6270d4974f754219a5907bfba76ce38e', 'a293134c063a4b51abd8005d30474571', '0'), ('6270d4974f754219a5907bfba76ce38e', '9a9ec223236e4e5d85714a6d4ba57af9', '0'), ('6270d4974f754219a5907bfba76ce38e', 'ab6615a73fb94878870ee9f5b2529d8c', '0'), ('37408db105dd4d43a25e865d9c1d4664', '12', '0'), ('37408db105dd4d43a25e865d9c1d4664', '7158ba3d0040475cb546a23efc7bcad7', '0'), ('37408db105dd4d43a25e865d9c1d4664', '8841161c47e3452eafa15e77d78262c5', '0'), ('37408db105dd4d43a25e865d9c1d4664', 'a293134c063a4b51abd8005d30474571', '0'), ('37408db105dd4d43a25e865d9c1d4664', '9a9ec223236e4e5d85714a6d4ba57af9', '0'), ('37408db105dd4d43a25e865d9c1d4664', 'ab6615a73fb94878870ee9f5b2529d8c', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) NOT NULL,
  `usercode` varchar(64) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `del_flag` varchar(2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(32) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(32) DEFAULT NULL,
  `remarks` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('007670d25fa24e259a8396ce4d5e3401', 'wangjie@email.com', 'C2273D2D5C87D450FB7132EA32E793B2', 'wangjie', null, '1', null, '0', null, null, '2017-04-06 22:12:32', null, null), ('1', 'admin@email.com', 'E10ADC3949BA59ABBE56E057F20F883E', '管理员', null, '1', null, '0', null, null, null, null, null), ('fdd9ec051ed4427f9d7662972c6e4336', 'jiejie@email.com', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiejie', null, '1', null, '0', null, null, '2017-04-06 22:05:03', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` char(32) NOT NULL COMMENT '主键',
  `user_id` char(32) DEFAULT NULL COMMENT '人员主键',
  `role_id` char(32) DEFAULT NULL COMMENT '角色主键',
  `del_flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '删除标记0：正常 1：删除',
  `source_id` varchar(4) DEFAULT NULL COMMENT '来源代码',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员权限表';

-- ----------------------------
--  Records of `t_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `t_user_role` VALUES ('46a449745cd24e34b9a559b3280cf14c', 'fdd9ec051ed4427f9d7662972c6e4336', '37408db105dd4d43a25e865d9c1d4664', '0', null, null, null, null, '2017-04-06 22:05:03'), ('762fed770fec45fa80ae12c66e9961a1', '6d65f81b840a4b1199cfbc4bb70bf1a2', '37408db105dd4d43a25e865d9c1d4664', '0', null, null, null, null, '2017-04-06 22:14:38'), ('7d9eeaac1c3c40bc8acca94bdfbdff56', '48d944e998814da28c693bb4bbc94c23', '37408db105dd4d43a25e865d9c1d4664', '0', null, null, null, null, '2017-03-19 17:06:00'), ('8fd23ecfe6764c8fb2c0bcd73e8c4e45', 'c6fb0bc2c29e4eb3a0437c85421ac544', '37408db105dd4d43a25e865d9c1d4664', '0', null, null, null, null, '2017-04-06 22:01:00'), ('cd375a90d6ee4d31acaf8857e5ef4400', '1', '6270d4974f754219a5907bfba76ce38e', '0', null, null, null, null, '2017-03-19 16:42:13'), ('fb86cfc9bd9c4a27a29133b67a1a5817', '007670d25fa24e259a8396ce4d5e3401', '37408db105dd4d43a25e865d9c1d4664', '0', null, null, null, null, '2017-04-06 22:12:32');
COMMIT;

-- ----------------------------
--  Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` varchar(32) NOT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `email` varchar(32) NOT NULL,
  `owner` varchar(32) NOT NULL COMMENT '拥有者',
  `del_flag` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_info`
-- ----------------------------
BEGIN;
INSERT INTO `user_info` VALUES ('0b7fe6b2fcba481c99ca4b0c3342308f', 'jiejie', 'jiejie@email.com', '007670d25fa24e259a8396ce4d5e3401', '0'), ('ee2b757685d54c07a6ff1546c38beabd', 'jeijie', '123@qq.com', '1', '0'), ('efba57bf4a4b4bb798d78304c8a78be3', 'test', 'test@email.com', '1', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
