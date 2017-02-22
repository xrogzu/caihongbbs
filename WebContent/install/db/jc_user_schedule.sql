/*
Navicat MySQL Data Transfer

Source Server         : localhsot
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : caihong_cms

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-02-20 11:21:53
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='医生排班';

-- ----------------------------
-- Records of jc_user_schedule
-- ----------------------------
INSERT INTO `jc_user_schedule` VALUES ('2', '1,0,0,0,0,1,1', '30', '2017-02-18', '2019-02-22', '20', '2017-02-18 17:25:46', null);
INSERT INTO `jc_user_schedule` VALUES ('12', '0,1,0,1,1,0,0', '30', '2017-02-18', '2019-02-28', '12', '2017-02-18 17:25:33', null);
INSERT INTO `jc_user_schedule` VALUES ('14', '0,0,1,1,0,1,1', '30', '2017-02-24', '2017-02-24', '45', '2017-02-18 17:25:12', null);
INSERT INTO `jc_user_schedule` VALUES ('23', '0,0,1,1,1,0,0', '30', '2017-02-16', '2019-02-22', '50', '2017-02-18 17:24:58', null);
INSERT INTO `jc_user_schedule` VALUES ('27', '0,0,1,1,1,0,0', '30', '2017-02-18', '2018-03-02', '22', '2017-02-18 17:24:16', null);
INSERT INTO `jc_user_schedule` VALUES ('28', '1,1,0,0,0,0,0', '30', '2017-03-02', '2019-03-08', '22', '2017-02-18 17:23:56', null);
INSERT INTO `jc_user_schedule` VALUES ('29', '1,1,0,0,0,1,0', '30', '2017-02-01', '2018-02-01', '25', '2017-02-18 17:20:59', null);
INSERT INTO `jc_user_schedule` VALUES ('30', '0,1,1,1,0,1,1', '30', '2017-02-21', '2018-02-23', '22', '2017-02-18 17:04:07', null);
