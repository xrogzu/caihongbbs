/*
Navicat MySQL Data Transfer

Source Server         : localhsot
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : caihong_cms

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-02-09 17:23:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jc_grain_buy_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_grain_buy_config`;
CREATE TABLE `jc_grain_buy_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '彩虹币数量',
  `price` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '配置时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_grain_buy_config
-- ----------------------------
INSERT INTO `jc_grain_buy_config` VALUES ('1', '10', '1.00', '2017-02-09 16:29:16');
INSERT INTO `jc_grain_buy_config` VALUES ('2', '110', '10.00', '2017-02-09 16:29:36');
INSERT INTO `jc_grain_buy_config` VALUES ('3', '1200', '100.00', '2017-02-09 16:33:50');
INSERT INTO `jc_grain_buy_config` VALUES ('4', '15000', '1000.00', '2017-02-09 16:34:12');

-- ----------------------------
-- Table structure for jc_grain_detail
-- ----------------------------
DROP TABLE IF EXISTS `jc_grain_detail`;
CREATE TABLE `jc_grain_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `from_user_id` int(11) DEFAULT NULL COMMENT '来源用户id,赠送用户',
  `grain_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '获得彩虹币数量,可以为正，为负',
  `type` int(2) NOT NULL COMMENT '1,注册，2 论坛，3购买，4，用户打赏',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '获取时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_grain_detail
-- ----------------------------
