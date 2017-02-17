/*
Navicat MySQL Data Transfer

Source Server         : localhsot
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : caihong_cms

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-02-17 14:20:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jc_schedule
-- ----------------------------
DROP TABLE IF EXISTS `jc_schedule`;
CREATE TABLE `jc_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doctor_id` int(11) NOT NULL COMMENT '医生id',
  `schedule_time` date DEFAULT NULL COMMENT '资源日期',
  `price` double NOT NULL COMMENT '资源价格',
  `counts` int(11) NOT NULL COMMENT '可用数量',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 : 1，可用\r\n0，停诊',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='排班表';

-- ----------------------------
-- Records of jc_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_schedule
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_schedule`;
CREATE TABLE `jc_user_schedule` (
  `user_id` int(11) NOT NULL COMMENT 'user_id',
  `zuozhen_times` varchar(200) NOT NULL DEFAULT '0' COMMENT '看诊状态 : 周一到周日坐诊次数\r\n1,0,1,0，1,5,6,7',
  `counts` int(11) DEFAULT NULL COMMENT '可看诊次数',
  `start_date` date NOT NULL COMMENT '开始日期 : 开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `price` double NOT NULL DEFAULT '0' COMMENT '坐诊价格 : 坐诊价格',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生排班';

-- ----------------------------
-- Records of jc_user_schedule
-- ----------------------------
