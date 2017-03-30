/*
Navicat MySQL Data Transfer

Source Server         : mjs
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : weixin

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-03-20 13:17:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `eye_x_role_menu`
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
-- Records of eye_x_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `formula`
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
-- Records of formula
-- ----------------------------

-- ----------------------------
-- Table structure for `formula_matarial`
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
-- Records of formula_matarial
-- ----------------------------

-- ----------------------------
-- Table structure for `in_material`
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
-- Records of in_material
-- ----------------------------
INSERT INTO `in_material` VALUES ('063e5be0089a422790f16121ee8e08ff', 'df1c068ffae648308e6e67a839a9fe81', '1.0', '管理员', '2017-03-19 17:35:36', '0', null, null, null, '2017-03-19 17:35:36');
INSERT INTO `in_material` VALUES ('1', '1', '6.3', '管理员', '2017-03-19 17:09:56', '0', 'admin', null, null, '2017-03-19 17:09:56');
INSERT INTO `in_material` VALUES ('dde84bb216984999b17f3e1c523e7d0e', '4964be0b27264475a930075c77ec0972', '12.0', '管理员', '2017-03-19 17:09:45', '0', null, null, null, '2017-03-19 17:09:45');

-- ----------------------------
-- Table structure for `make_product_material`
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
-- Records of make_product_material
-- ----------------------------

-- ----------------------------
-- Table structure for `make_product_num`
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
-- Records of make_product_num
-- ----------------------------

-- ----------------------------
-- Table structure for `raw_material`
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
-- Records of raw_material
-- ----------------------------
INSERT INTO `raw_material` VALUES ('1', '钙钒石', '钙钒石', 'a', 'CaO·Al<sub>2</sub>O<sub>3</sub>·3CaSO<sub>2</sub>·32H<sub>2</sub>O', '0', null, 'admin', null, null, '2017-03-18 17:15:39', null);
INSERT INTO `raw_material` VALUES ('4964be0b27264475a930075c77ec0972', '硫酸铝', '硫酸铝', '12s', '12', '0', null, 'admin', null, null, '2017-03-18 17:11:07', null);
INSERT INTO `raw_material` VALUES ('7b0afb4480594d92bab5e21bb7dca319', '无水硫酸钠', '无水硫酸钠', 's', '', '1', null, 'admin', null, null, '2017-03-18 17:12:28', null);
INSERT INTO `raw_material` VALUES ('d0c78b2840bc44d9a8b0716733251ec3', '二水硫酸钠', '二水硫酸钠', 'ss', 'H<sub><sub><sub><sub>2</sub></sub></sub></sub>O', '0', null, 'admin', null, null, '2017-03-18 17:11:49', null);
INSERT INTO `raw_material` VALUES ('eb2393f46b674e4fae4279c6ab44d5d1', '八水硫酸钠', '八水硫酸钠', 'wee', '', '1', null, 'admin', null, null, '2017-03-18 17:12:03', null);

-- ----------------------------
-- Table structure for `sys_menu`
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
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('12', '0', null, '功能菜单', null, null, null, null, null, '1', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2', '12', null, '系统管理', null, null, null, null, '1', '1', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('2ceab77bf80a437cbff8ef2d8b5cf7d0', '5', null, '1', '1', '', '', '1', '0', '1', '1', null, null, '2017-03-18 10:02:00', null, null);
INSERT INTO `sys_menu` VALUES ('2f4df4bb89654bed850cfeecf6b08811', '6', null, '1', '', '', '', '', null, '1', '1', null, null, '2017-03-17 13:07:41', null, null);
INSERT INTO `sys_menu` VALUES ('3', '2', null, '角色管理', '/role/index', null, null, null, '1', '1', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('38dbcaf3e5404d509acdd005eeba3d7c', '6', null, '1', '', '', '', '', null, '1', '1', null, null, '2017-03-17 13:09:15', null, null);
INSERT INTO `sys_menu` VALUES ('4', '2', null, '菜单管理', '/menu/index', null, null, null, '1', '2', '0', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('47c1d826b61749a8b86844244a480276', '5', null, '配比原材料', '/rawmaterial/index', '', '', '', '1', '2', '0', null, null, '2017-03-17 21:31:56', null, null);
INSERT INTO `sys_menu` VALUES ('5', '12', null, '产品管理', '#', '', '', '', '1', '2', '0', null, null, '2017-03-17 17:51:44', null, null);
INSERT INTO `sys_menu` VALUES ('572d1488331c40dba2d8e7d123ed4c44', '5', null, '进货管理', '/productIn/index', '', '', '', '1', '3', '0', null, null, '2017-03-18 09:56:06', null, null);
INSERT INTO `sys_menu` VALUES ('6', '5', null, '产品信息列表', '/product/index', '', '', '', '1', '1', '0', null, null, '2017-03-17 17:51:22', null, null);
INSERT INTO `sys_menu` VALUES ('82f7542430454b239df414050a220642', '5', null, '进货管理', '/productIn/index', '', '', '', '1', '3', '1', null, null, '2017-03-18 09:56:06', null, null);
INSERT INTO `sys_menu` VALUES ('a88ffb9c37bf47bd9a937e2fa524a49c', '5', null, '配比原材料', '/rawmaterial/index', '', '', '', '1', '2', '1', null, null, '2017-03-17 21:31:56', null, null);
INSERT INTO `sys_menu` VALUES ('b1fb00cdb3ca4ade82123bbb18e40cd3', '2', null, '用户管理', '/user/index', '', '', '', '1', '3', '0', null, 'admin', '2017-03-19 13:08:08', null, null);
INSERT INTO `sys_menu` VALUES ('b38748bc4ca7497db63ab29ed4a29c0b', '6', null, 'd', '1', '', '', '', null, '1', '1', null, null, '2017-03-17 13:33:32', null, null);
INSERT INTO `sys_menu` VALUES ('c372276db7e647f9b7238b2bde59db48', '5', null, '产品配比公式', '/productFormula/index', '', '', '', '1', '4', '0', null, null, '2017-03-18 11:08:52', null, null);
INSERT INTO `sys_menu` VALUES ('f7b424dfbcbd4eb9a5faa2e78ea4062a', '5', null, '1', '1', '2', '3', '1', '0', '1', '1', null, null, '2017-03-18 10:02:34', null, null);

-- ----------------------------
-- Table structure for `sys_x_dict`
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
-- Records of sys_x_dict
-- ----------------------------
INSERT INTO `sys_x_dict` VALUES ('00001', '1', '配比系统', null, null, '0', null, null, null, null, null);
INSERT INTO `sys_x_dict` VALUES ('00002', '1', '男', null, null, '0', null, null, null, null, null);
INSERT INTO `sys_x_dict` VALUES ('00002', '2', '女', null, null, '0', null, null, null, null, null);
INSERT INTO `sys_x_dict` VALUES ('00004', '1', '是', null, null, '0', '通用条件判断', null, null, null, null);
INSERT INTO `sys_x_dict` VALUES ('00004', '2', '否', null, null, '0', '通用条件判断', null, null, null, null);

-- ----------------------------
-- Table structure for `t_role`
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
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('37408db105dd4d43a25e865d9c1d4664', '普通用户', '1', '0', null, null, '2017-03-20 12:46:27', null, null);
INSERT INTO `t_role` VALUES ('6270d4974f754219a5907bfba76ce38e', '管理员', '1', '0', null, null, '2017-03-19 16:38:09', null, null);

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `role_id` varchar(32) DEFAULT NULL,
  `menu_id` varchar(32) DEFAULT NULL,
  `del_flag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '12', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '2', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '3', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '4', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '5', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '6', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '12', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '2', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '3', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '4', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '5', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '6', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '47c1d826b61749a8b86844244a480276', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', '572d1488331c40dba2d8e7d123ed4c44', '0');
INSERT INTO `t_role_menu` VALUES ('28d922e078d744529d05574fab14bba1', 'c372276db7e647f9b7238b2bde59db48', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', 'TRole.menus', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '5', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '12', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '2', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '3', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', '5', '0');
INSERT INTO `t_role_menu` VALUES ('202a0dbe54594d70a39d4c6b20d3f0c4', 'c372276db7e647f9b7238b2bde59db48', '0');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '12', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '2', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '3', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '4', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '5', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '6', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '12', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '2', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '3', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '4', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '5', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '6', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '12', '0');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '2', '0');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '3', '0');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', '4', '0');
INSERT INTO `t_role_menu` VALUES ('ca65a6eb56ff4ca2b8265e15904c9aea', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '12', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '2', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '4', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '5', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '6', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '12', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '2', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '4', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '5', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '6', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '12', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '2', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '4', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '5', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '6', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '12', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '2', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '4', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '5', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '6', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '12', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '2', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '3', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '4', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '5', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '6', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '47c1d826b61749a8b86844244a480276', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', '572d1488331c40dba2d8e7d123ed4c44', '0');
INSERT INTO `t_role_menu` VALUES ('6270d4974f754219a5907bfba76ce38e', 'c372276db7e647f9b7238b2bde59db48', '0');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '4', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'b1fb00cdb3ca4ade82123bbb18e40cd3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '2', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '3', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', 'c372276db7e647f9b7238b2bde59db48', '1');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '12', '0');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '5', '0');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '6', '0');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '47c1d826b61749a8b86844244a480276', '0');
INSERT INTO `t_role_menu` VALUES ('37408db105dd4d43a25e865d9c1d4664', '572d1488331c40dba2d8e7d123ed4c44', '0');

-- ----------------------------
-- Table structure for `t_user`
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
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '管理员', null, '1', null, '0', null, null, null, null, null);
INSERT INTO `t_user` VALUES ('48d944e998814da28c693bb4bbc94c23', 'jiejie', 'E10ADC3949BA59ABBE56E057F20F883E', 'jiejie', null, '2', null, '0', null, null, '2017-03-19 14:12:06', null, null);

-- ----------------------------
-- Table structure for `t_user_role`
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
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('7d9eeaac1c3c40bc8acca94bdfbdff56', '48d944e998814da28c693bb4bbc94c23', '37408db105dd4d43a25e865d9c1d4664', '0', null, null, null, null, '2017-03-19 17:06:00');
INSERT INTO `t_user_role` VALUES ('cd375a90d6ee4d31acaf8857e5ef4400', '1', '6270d4974f754219a5907bfba76ce38e', '0', null, null, null, null, '2017-03-19 16:42:13');
