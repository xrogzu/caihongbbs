/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : caihong_cms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-05 16:39:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jc_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_department`;
CREATE TABLE `jc_department` (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `site_id` int(11) DEFAULT '0' COMMENT '站点',
  `priority` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `weights` int(11) NOT NULL DEFAULT '1' COMMENT '权重(值越大，级别越高)',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级部门ID',
  PRIMARY KEY (`depart_id`),
  KEY `fk_jc_department_site` (`site_id`),
  KEY `fk_jc_jc_department_parent` (`parent_id`),
  CONSTRAINT `fk_jc_jc_department_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='部门';

-- ----------------------------
-- Records of jc_department
-- ----------------------------
INSERT INTO `jc_department` VALUES ('1', '四川大学华西医院', null, '1', '1', null);
INSERT INTO `jc_department` VALUES ('2', '北京协和医院', null, '2', '1', null);
INSERT INTO `jc_department` VALUES ('3', '病理科', null, '1', '1', '1');
INSERT INTO `jc_department` VALUES ('4', '病理科', null, '1', '1', '2');
INSERT INTO `jc_department` VALUES ('5', '放射科', null, '2', '1', '2');
INSERT INTO `jc_department` VALUES ('6', '其他医院', null, '3', '1', null);
