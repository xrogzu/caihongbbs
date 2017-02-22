/*
Navicat MySQL Data Transfer

Source Server         : rds
Source Server Version : 50634
Source Host           : localhost:3301
Source Database       : caihong_cms

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-02-20 11:43:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jc_order
-- ----------------------------
DROP TABLE IF EXISTS `jc_order`;
CREATE TABLE `jc_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '购买用户id',
  `amount` double(255,2) NOT NULL DEFAULT '0.00' COMMENT '购买金额',
  `order_num` varchar(50) NOT NULL COMMENT '订单编号',
  `order_num_weixin` varchar(255) DEFAULT NULL COMMENT '微信订单号',
  `order_num_alipay` varchar(255) DEFAULT NULL COMMENT '支付宝订单号',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `type` int(3) NOT NULL DEFAULT '1' COMMENT '订单类型 1，彩虹币购买，2诊断支付',
  `object_id` int(11) DEFAULT NULL COMMENT '彩虹币购买配置id',
  `note` varchar(255) DEFAULT NULL COMMENT '内容备注',
  `status` int(1) DEFAULT '1' COMMENT '状态，1，已支付 2,未支付 3，已退款 取消',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_num` (`order_num`),
  UNIQUE KEY `order_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_order
-- ----------------------------
INSERT INTO `jc_order` VALUES ('2', '1', '0.01', '148697605719451653', '4000622001201702139794203264', null, '2017-02-13 16:54:36', '1', '1', '彩虹币10个', '1');
INSERT INTO `jc_order` VALUES ('3', '1', '0.01', '148697679015761774', '4000622001201702139800529989', null, '2017-02-13 17:06:46', '1', '1', '彩虹币10个', '1');
INSERT INTO `jc_order` VALUES ('4', '1', '0.01', '148723837747825726', '4000622001201702160165102679', null, '2017-02-16 17:46:36', '1', '1', '彩虹币10个', '1');
INSERT INTO `jc_order` VALUES ('5', '1', '0.01', '148724354194666636', '4000622001201702160178577650', null, '2017-02-16 19:12:32', '1', '1', '彩虹币10个', '1');
INSERT INTO `jc_order` VALUES ('6', '1', '0.01', '148731344312656495', null, '2017021721001004370251464648', '2017-02-17 16:13:01', '1', '1', '彩虹币10个', '1');
INSERT INTO `jc_order` VALUES ('7', '1', '0.01', '148756162398106021', '4000622001201702200620253254', null, '2017-02-20 11:34:01', '2', '4', '预约医生:彩虹妹妹', '1');

-- ----------------------------
-- Table structure for jc_patient
-- ----------------------------
DROP TABLE IF EXISTS `jc_patient`;
CREATE TABLE `jc_patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL COMMENT '1,男 2女',
  `telphone` varchar(50) DEFAULT NULL,
  `birthday` varchar(20) DEFAULT NULL,
  `id_no` varchar(50) DEFAULT NULL,
  `job` int(11) DEFAULT NULL COMMENT '1，普通员工\r\n2，农民\r\n3，工人\r\n4，其他',
  `user_id` int(11) DEFAULT NULL COMMENT '可以为空',
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `work_address` varchar(200) DEFAULT NULL,
  `home_address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_patient
-- ----------------------------
INSERT INTO `jc_patient` VALUES ('1', '病理科', '0', '15588882222', '2017-02-19', '511023198207138739', '1', '1', '2017-02-19 16:24:05', 'sic', '成都');
INSERT INTO `jc_patient` VALUES ('2', '病理科', '0', '15588882222', '1986-09-23', '511011198609237646', '1', '1', '2017-02-19 18:27:44', 'sic', 'asdfafafasf');
INSERT INTO `jc_patient` VALUES ('3', '刘红', '0', '15588884444', '1999-07-13', '511011199907138843', '1', '1', '2017-02-20 10:59:32', '四川成都市', '四川成都市');

-- ----------------------------
-- Table structure for jc_reserve
-- ----------------------------
DROP TABLE IF EXISTS `jc_reserve`;
CREATE TABLE `jc_reserve` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `price` double DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `expect_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1，申请中\r\n2，已安排\r\n3，已诊断\r\n4，已取消',
  `reserve_user_id` int(11) NOT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `pay_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1，已支付\r\n2，未支付',
  `order_num` varchar(100) DEFAULT NULL,
  `diagnosis` text COMMENT '医生诊断',
  `clinical_diagnosis` text,
  `cancel_reason` varchar(1000) DEFAULT NULL COMMENT '取消原因',
  `patient_id` int(11) NOT NULL COMMENT 'id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `patient_id` (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_reserve
-- ----------------------------
INSERT INTO `jc_reserve` VALUES ('1', '20', '2', '2017-02-21 00:00:00', '4', '1', '2017-02-19 16:29:58', '0', null, null, '阿萨德法师打发水电费', null, '1');
INSERT INTO `jc_reserve` VALUES ('2', '20', '2', '2017-02-28 00:00:00', '4', '1', '2017-02-19 16:39:43', '0', null, null, '案发生的法师法师打发', null, '1');
INSERT INTO `jc_reserve` VALUES ('3', '12', '12', '2017-02-28 00:00:00', '4', '1', '2017-02-19 18:27:44', '0', null, null, 'asfsdfasfasdf', 'TESET', '2');
INSERT INTO `jc_reserve` VALUES ('4', '0.01', '12', '2017-02-28 00:00:00', '1', '1', '2017-02-20 10:59:32', '1', '148756162398106021', null, '阿打发沙发上发生的发生发生发顺丰AAS发', null, '3');

-- ----------------------------
-- Table structure for jc_reserve_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jc_reserve_attachment`;
CREATE TABLE `jc_reserve_attachment` (
  `reserve_id` int(11) NOT NULL COMMENT 'id',
  `priority` int(11) NOT NULL COMMENT '排练顺序',
  `path` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  KEY `reserve_id` (`reserve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_reserve_attachment
-- ----------------------------
INSERT INTO `jc_reserve_attachment` VALUES ('1', '0', '/uploads/201702/d8b519a912e147259699f1b0286c1bca.jpg', 'u=448533732', null);
INSERT INTO `jc_reserve_attachment` VALUES ('2', '0', '/uploads/201702/29672dba26dd4d06bea7a4eeeb519bf1.jpg', 'timg - 副本.jpg', null);
INSERT INTO `jc_reserve_attachment` VALUES ('3', '0', '/uploads/201702/e6528d67d2da497bad06858caff5019f.docx', '证明.docx', null);
INSERT INTO `jc_reserve_attachment` VALUES ('4', '0', '/uploads/201702/cd485da391c5463b9401c4df85332bd8.png', '客户关系系统.png', null);
INSERT INTO `jc_reserve_attachment` VALUES ('4', '1', '/uploads/201702/b007520a77364aa087fb184928d690c2.png', 'logo.png', null);
INSERT INTO `jc_reserve_attachment` VALUES ('4', '2', '/uploads/201702/1e9b83c6bdc24235b4e920d18b6a3b77.doc', '禅道操作手册.doc', null);
