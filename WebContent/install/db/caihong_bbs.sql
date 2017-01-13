/*
Navicat MySQL Data Transfer

Source Server         : localhsot
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : caihong_bbs

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-01-14 01:18:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `file_path` varchar(100) DEFAULT NULL COMMENT '路径',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_size` int(11) DEFAULT NULL COMMENT '大小',
  `is_pictrue` tinyint(1) DEFAULT '0' COMMENT '是否是图片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`attachment_id`),
  KEY `FK_attachment_post` (`post_id`),
  CONSTRAINT `FK_attachment_post` FOREIGN KEY (`post_id`) REFERENCES `bbs_post` (`POST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachment
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_accredit
-- ----------------------------
DROP TABLE IF EXISTS `bbs_accredit`;
CREATE TABLE `bbs_accredit` (
  `accredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `corporation_name` varchar(100) NOT NULL DEFAULT '',
  `telphone` varchar(20) NOT NULL DEFAULT '',
  `website_name` varchar(50) NOT NULL DEFAULT '',
  `realm_name` varchar(50) NOT NULL DEFAULT '',
  `buy_time` varchar(255) NOT NULL DEFAULT '',
  `stop_time` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`accredit_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `bbs_accredit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='授权表';

-- ----------------------------
-- Records of bbs_accredit
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_category
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category`;
CREATE TABLE `bbs_category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(11) NOT NULL,
  `PATH` varchar(20) NOT NULL COMMENT '访问路径',
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `PRIORITY` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `FORUM_COLS` int(11) NOT NULL DEFAULT '1' COMMENT '板块列数',
  `moderators` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FK_BBS_CTG_SITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_CTG_SITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='论坛分区';

-- ----------------------------
-- Records of bbs_category
-- ----------------------------
INSERT INTO `bbs_category` VALUES ('1', '1', 'jsjl', '技术交流', '0', '1', 'admin');
INSERT INTO `bbs_category` VALUES ('2', '1', 'zkbl', '专科病理', '0', '1', 'admin');

-- ----------------------------
-- Table structure for bbs_category_user
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category_user`;
CREATE TABLE `bbs_category_user` (
  `CATEGORY_ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`,`user_id`),
  KEY `FK_BBS_CATEGORY_TO_USER` (`user_id`),
  CONSTRAINT `FK_BBS_CATEGORY_TO_USER` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_USER_TO_CATEGORY` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `bbs_category` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分区版主';

-- ----------------------------
-- Records of bbs_category_user
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_common_magic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_common_magic`;
CREATE TABLE `bbs_common_magic` (
  `magicid` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '道具id',
  `available` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `identifier` varchar(40) NOT NULL COMMENT '唯一标识',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  `credit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用的积分',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  `num` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `salevolume` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '销售量',
  `supplytype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动补货类型',
  `supplynum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '自动补货数量',
  `useperoid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用周期',
  `usenum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '周期使用数量',
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '重量',
  `useevent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:只在特定环境使用 1:可以在道具中心使用',
  PRIMARY KEY (`magicid`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `displayorder` (`available`,`displayorder`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='道具数据表';

-- ----------------------------
-- Records of bbs_common_magic
-- ----------------------------
INSERT INTO `bbs_common_magic` VALUES ('1', '1', '喧嚣卡', 'open', '可以将主题开启，可以回复', '0', '1', '10', '0', '0', '2', '0', '2', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('2', '1', '悔悟卡', 'repent', '可以删除自己的帖子', '0', '2', '10', '2', '0', '1', '0', '1', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('3', '1', '照妖镜', 'namepost', '可以查看一次匿名用户的真实身份。', '0', '1', '10', '1', '0', '1', '0', '1', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('4', '1', '金钱卡', 'money', '可以随机获得一些金币', '0', '2', '10', '44', '0', '1', '0', '1', '0', '10', '1');
INSERT INTO `bbs_common_magic` VALUES ('5', '1', '千斤顶', 'jack', '可以将主题顶起一段时间，重复使用可延长帖子被顶起的时间', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('6', '1', '窥视卡', 'showip', '可以查看指定用户的 IP', '0', '1', '10', '1', '0', '1', '0', '1', '0', '10', '1');
INSERT INTO `bbs_common_magic` VALUES ('7', '1', '抢沙发', 'sofa', '可以抢夺指定主题的沙发', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('8', '1', '置顶卡', 'stick', '可以将主题置顶', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('9', '1', '变色卡', 'highlight', '可以将帖子或日志的标题高亮，变更颜色', '0', '1', '10', '2', '0', '0', '0', '0', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('10', '1', '雷达卡', 'checkonline', '查看某个用户是否在线', '0', '1', '10', '1', '0', '1', '0', '1', '0', '10', '1');
INSERT INTO `bbs_common_magic` VALUES ('11', '1', '沉默卡', 'close', '可以将主题关闭，禁止回复', '0', '1', '10', '2', '100', '1', '0', '1', '2', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('12', '1', '提升卡', 'bump', '可以提升某个主题', '0', '1', '10', '0', '0', '1', '0', '1', '0', '10', '0');
INSERT INTO `bbs_common_magic` VALUES ('13', '1', '匿名卡', 'anonymouspost', '在指定的地方，让自己的名字显示为匿名。', '0', '1', '10', '0', '0', '0', '0', '0', '0', '10', '0');

-- ----------------------------
-- Table structure for bbs_config
-- ----------------------------
DROP TABLE IF EXISTS `bbs_config`;
CREATE TABLE `bbs_config` (
  `CONFIG_ID` bigint(20) NOT NULL,
  `DEF_AVATAR` varchar(100) NOT NULL DEFAULT '' COMMENT '默认会员头像',
  `AVATAR_WIDTH` int(11) NOT NULL DEFAULT '160' COMMENT '头像最大宽度',
  `AVATAR_HEIGHT` int(11) NOT NULL DEFAULT '160' COMMENT '头像最大高度',
  `TOPIC_COUNT_PER_PAGE` int(11) NOT NULL DEFAULT '20' COMMENT '每页主题数',
  `POST_COUNT_PER_PAGE` int(11) NOT NULL DEFAULT '10' COMMENT '每页帖子数',
  `KEYWORDS` varchar(255) NOT NULL DEFAULT '' COMMENT '首页关键字',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '' COMMENT '首页描述',
  `REGISTER_STATUS` smallint(6) NOT NULL DEFAULT '1' COMMENT '注册状态（0：关闭，1：开放，2：邀请）',
  `REGISTER_GROUP_ID` int(11) NOT NULL DEFAULT '1' COMMENT '注册会员组',
  `REGISTER_RULE` longtext COMMENT '注册协议',
  `CACHE_POST_TODAY` int(11) NOT NULL DEFAULT '0' COMMENT '今日贴数',
  `CACHE_POST_YESTERDAY` int(11) NOT NULL DEFAULT '0' COMMENT '昨日帖数',
  `CACHE_POST_MAX` int(11) NOT NULL DEFAULT '0' COMMENT '最高帖数',
  `CACHE_POST_MAX_DATE` date NOT NULL COMMENT '最高帖数日',
  `CACHE_TOPIC_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '总主题',
  `CACHE_POST_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '总帖数',
  `CACHE_USER_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '总会员',
  `last_user_id` int(11) DEFAULT NULL COMMENT '最新会员',
  `site_id` int(11) NOT NULL,
  `DEFAULT_GROUP_ID` bigint(20) NOT NULL DEFAULT '1' COMMENT '默认会员组',
  `TOPIC_HOT_COUNT` int(11) NOT NULL DEFAULT '10' COMMENT '热帖回复数量',
  `AUTO_REGISTER` tinyint(1) DEFAULT '1' COMMENT '是否自动注册',
  `EMAIL_VALIDATE` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  PRIMARY KEY (`CONFIG_ID`),
  KEY `FK_BBS_CONFIG_SITE` (`site_id`),
  CONSTRAINT `FK_BBS_CONFIG_SITE` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛配置';

-- ----------------------------
-- Records of bbs_config
-- ----------------------------
INSERT INTO `bbs_config` VALUES ('1', '1', '160', '160', '20', '10', '彩虹医学网论坛', '彩虹医学网论坛', '1', '1', '', '0', '0', '0', '2017-01-14', '0', '0', '1', '5', '1', '1', '0', '1', '0');

-- ----------------------------
-- Table structure for bbs_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `bbs_config_attr`;
CREATE TABLE `bbs_config_attr` (
  `config_id` bigint(20) NOT NULL DEFAULT '0',
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_attr_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS配置属性表';

-- ----------------------------
-- Records of bbs_config_attr
-- ----------------------------
INSERT INTO `bbs_config_attr` VALUES ('1', 'keepMinute', '15');

-- ----------------------------
-- Table structure for bbs_credit_exchange
-- ----------------------------
DROP TABLE IF EXISTS `bbs_credit_exchange`;
CREATE TABLE `bbs_credit_exchange` (
  `eid` int(11) NOT NULL DEFAULT '0',
  `expoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换比率积分基数',
  `exprestige` int(11) NOT NULL DEFAULT '0' COMMENT '兑换比率彩虹币基数',
  `pointoutavailable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分是否可以兑出',
  `pointinavailable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分是否允许兑入',
  `prestigeoutavailable` tinyint(3) NOT NULL DEFAULT '0' COMMENT '彩虹币是否允许兑出',
  `prestigeinavailable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '彩虹币是否允许兑入',
  `exchangetax` float(2,1) NOT NULL DEFAULT '0.0' COMMENT '兑换交易税',
  `mini_balance` int(11) NOT NULL DEFAULT '0' COMMENT '兑换最低余额',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分交易规则';

-- ----------------------------
-- Records of bbs_credit_exchange
-- ----------------------------
INSERT INTO `bbs_credit_exchange` VALUES ('1', '1', '10', '1', '1', '1', '1', '0.2', '0');

-- ----------------------------
-- Table structure for bbs_credit_rule
-- ----------------------------
DROP TABLE IF EXISTS `bbs_credit_rule`;
CREATE TABLE `bbs_credit_rule` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '规则ID',
  `rulename` varchar(20) NOT NULL DEFAULT '' COMMENT '规则名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '规则action唯一KEY',
  `cycletype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '奖励周期0:一次;1:每天;2:整点;3:间隔分钟;4:不限;',
  `cycletime` int(10) NOT NULL DEFAULT '0' COMMENT '间隔时间',
  `rewardnum` tinyint(2) NOT NULL DEFAULT '1' COMMENT '奖励次数',
  `extcredits1` int(10) NOT NULL DEFAULT '0' COMMENT '扩展1',
  `extcredits2` int(10) NOT NULL DEFAULT '0' COMMENT '扩展2',
  `extcredits3` int(10) NOT NULL DEFAULT '0' COMMENT '扩展3',
  `extcredits4` int(10) NOT NULL DEFAULT '0' COMMENT '扩展4',
  `ext1name` varchar(20) DEFAULT NULL COMMENT '扩展1别名',
  `ext2name` varchar(20) DEFAULT NULL COMMENT '扩展2别名',
  `ext3name` varchar(20) DEFAULT NULL COMMENT '扩展3别名',
  `ext4name` varchar(20) DEFAULT NULL COMMENT '扩展4别名',
  `ext1avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext2avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext3avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext4avai` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  `ext1exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext2exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext3exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext4exchangeout` tinyint(1) DEFAULT '0' COMMENT '积分兑出',
  `ext1exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `ext2exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `ext3exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `ext4exchangein` tinyint(1) DEFAULT '0' COMMENT '积分兑入',
  `credittax` tinyint(2) DEFAULT NULL COMMENT '积分交易税',
  `minibalance` int(10) DEFAULT NULL COMMENT '兑换最低余额',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='积分规则表';

-- ----------------------------
-- Records of bbs_credit_rule
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_forum
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum`;
CREATE TABLE `bbs_forum` (
  `FORUM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` int(11) NOT NULL COMMENT '分区ID',
  `SITE_ID` int(11) NOT NULL COMMENT '站点ID',
  `POST_ID` int(11) DEFAULT NULL COMMENT '最后回帖',
  `replyer_id` int(11) DEFAULT NULL COMMENT '最后回帖会员',
  `PATH` varchar(20) NOT NULL COMMENT '访问路径',
  `TITLE` varchar(150) NOT NULL COMMENT '标题',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `KEYWORDS` varchar(255) DEFAULT NULL COMMENT 'meta-keywords',
  `FORUM_RULE` varchar(255) DEFAULT NULL COMMENT '版规',
  `PRIORITY` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `TOPIC_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '主题总数',
  `POST_TOTAL` int(11) NOT NULL DEFAULT '0' COMMENT '帖子总数',
  `POST_TODAY` int(11) NOT NULL DEFAULT '0' COMMENT '今日新帖',
  `OUTER_URL` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `POINT_TOPIC` int(11) NOT NULL DEFAULT '0' COMMENT '发贴加分',
  `POINT_REPLY` int(11) NOT NULL DEFAULT '0' COMMENT '回帖加分',
  `POINT_PRIME` int(11) NOT NULL DEFAULT '0' COMMENT '精华加分',
  `LAST_TIME` datetime DEFAULT NULL COMMENT '最后发贴时间',
  `TOPIC_LOCK_LIMIT` int(11) NOT NULL DEFAULT '0' COMMENT '锁定主题（天）',
  `moderators` varchar(100) DEFAULT NULL COMMENT '版主',
  `group_views` varchar(100) DEFAULT NULL COMMENT '访问会员组',
  `group_topics` varchar(100) DEFAULT NULL COMMENT '发帖会员组',
  `group_replies` varchar(100) DEFAULT NULL COMMENT '回复会员组',
  `POINT_AVAILABLE` tinyint(1) DEFAULT NULL COMMENT '积分是否启用',
  `PRESTIGE_AVAILABLE` tinyint(1) DEFAULT NULL COMMENT '彩虹币是否启用',
  `PRESTIGE_TOPIC` int(11) DEFAULT '0' COMMENT '发帖加彩虹币',
  `PRESTIGE_REPLY` int(11) DEFAULT '0' COMMENT '回帖加彩虹币',
  `PRESTIGE_PRIME1` int(11) DEFAULT '0' COMMENT '精华1加彩虹币',
  `PRESTIGE_PRIME2` int(11) DEFAULT '0' COMMENT '精华2加彩虹币',
  `PRESTIGE_PRIME3` int(11) DEFAULT '0' COMMENT '精华3加彩虹币',
  `PRESTIGE_PRIME0` int(11) DEFAULT '0' COMMENT '解除精华扣除彩虹币',
  PRIMARY KEY (`FORUM_ID`),
  KEY `FK_BBS_FORUM_CTG` (`CATEGORY_ID`),
  KEY `FK_BBS_FORUM_USER` (`replyer_id`),
  KEY `FK_BBS_FORUM_POST` (`POST_ID`),
  KEY `FK_BBS_FORUM_WEBSITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_FORUM_CTG` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `bbs_category` (`CATEGORY_ID`),
  CONSTRAINT `FK_BBS_FORUM_POST` FOREIGN KEY (`POST_ID`) REFERENCES `bbs_post` (`POST_ID`),
  CONSTRAINT `FK_BBS_FORUM_USER` FOREIGN KEY (`replyer_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_FORUM_WEBSITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='论坛板块';

-- ----------------------------
-- Records of bbs_forum
-- ----------------------------
INSERT INTO `bbs_forum` VALUES ('1', '1', '1', null, null, 'jsfx', '技术交流', '', '技术交流', '', '10', '0', '0', '0', '', '5', '0', '100', null, '0', 'admin', ',14,1,2,3,4,5,6,7,8,9,10,11,12,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,', '1', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `bbs_forum` VALUES ('2', '1', '1', null, null, 'blyj', '病理研究', '病理研究', 'blyj', '病理研究', '10', '0', '0', '0', '', '5', '0', '100', null, '0', 'admin', ',14,1,2,3,4,5,6,7,8,9,10,11,12,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('3', '2', '1', '186', '5', 'sjbl', '神经病理', '', '', '', '10', '1', '1', '1', '', '5', '0', '100', '2017-01-14 01:13:05', '0', '', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', ',14,1,2,3,4,5,6,7,8,9,10,11,12,13,', '1', '1', '1', '0', '1', '2', '3', '0');

-- ----------------------------
-- Table structure for bbs_forum_group_reply
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_group_reply`;
CREATE TABLE `bbs_forum_group_reply` (
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`FORUM_ID`,`GROUP_ID`),
  KEY `FK_BBS_FORUM_GROUP_REPLY` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_FORUM_GROUP_REPLY` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_FORUM_REPLY` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回复权限';

-- ----------------------------
-- Records of bbs_forum_group_reply
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_forum_group_topic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_group_topic`;
CREATE TABLE `bbs_forum_group_topic` (
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`FORUM_ID`,`GROUP_ID`),
  KEY `FK_BBS_FORUM_GROUP_TOPIC` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_FORUM_GROUP_TOPIC` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_FORUM_TOPIC` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发贴权限';

-- ----------------------------
-- Records of bbs_forum_group_topic
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_forum_group_view
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_group_view`;
CREATE TABLE `bbs_forum_group_view` (
  `GROUP_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`FORUM_ID`),
  KEY `FK_BBS_GROUP_FORUM_VIEW` (`FORUM_ID`),
  CONSTRAINT `FK_BBS_FORUM_GROUP_VIEW` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_FORUM_VIEW` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='浏览权限';

-- ----------------------------
-- Records of bbs_forum_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_forum_user
-- ----------------------------
DROP TABLE IF EXISTS `bbs_forum_user`;
CREATE TABLE `bbs_forum_user` (
  `FORUM_ID` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`FORUM_ID`,`user_id`),
  KEY `FK_BBS_FORUM_TO_USER` (`user_id`),
  CONSTRAINT `FK_BBS_FORUM_TO_USER` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_USER_TO_FORUM` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版块版主';

-- ----------------------------
-- Records of bbs_forum_user
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_grade
-- ----------------------------
DROP TABLE IF EXISTS `bbs_grade`;
CREATE TABLE `bbs_grade` (
  `GRADE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `SCORE` int(11) DEFAULT NULL,
  `REASON` varchar(100) DEFAULT NULL,
  `GRADE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`GRADE_ID`),
  KEY `FK_MEMBER_GRADE` (`user_id`),
  KEY `FK_POST_GRADE` (`POST_ID`),
  CONSTRAINT `FK_MEMBER_GRADE` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_POST_GRADE` FOREIGN KEY (`POST_ID`) REFERENCES `bbs_post` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_grade
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_group_type
-- ----------------------------
DROP TABLE IF EXISTS `bbs_group_type`;
CREATE TABLE `bbs_group_type` (
  `GROUP_ID` int(11) NOT NULL DEFAULT '0',
  `TYPE_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TYPE_ID`,`GROUP_ID`),
  KEY `FK_BBS_GROUP_TYPE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_TYPE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_GROUP_TYPE_TYPE` FOREIGN KEY (`TYPE_ID`) REFERENCES `bbs_post_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员组投票分类关联表';

-- ----------------------------
-- Records of bbs_group_type
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_limit
-- ----------------------------
DROP TABLE IF EXISTS `bbs_limit`;
CREATE TABLE `bbs_limit` (
  `limit_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) DEFAULT '' COMMENT '限制ip',
  `user_id` int(11) DEFAULT NULL COMMENT '限制用户ID',
  PRIMARY KEY (`limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限制发帖回帖';

-- ----------------------------
-- Records of bbs_limit
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_login_log
-- ----------------------------
DROP TABLE IF EXISTS `bbs_login_log`;
CREATE TABLE `bbs_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '登录用户',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '退出时间',
  `ip` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_login_log_user` (`user_id`),
  CONSTRAINT `fk_bbs_login_log_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=878 DEFAULT CHARSET=utf8 COMMENT='登录日志';

-- ----------------------------
-- Records of bbs_login_log
-- ----------------------------
INSERT INTO `bbs_login_log` VALUES ('863', '5', '2017-01-13 18:46:01', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('864', '5', '2017-01-13 18:59:58', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('865', '5', '2017-01-13 19:10:04', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('866', '5', '2017-01-13 19:20:07', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('867', '5', '2017-01-13 19:22:27', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('868', '5', '2017-01-13 22:36:54', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('869', '5', '2017-01-13 22:50:02', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('870', '5', '2017-01-13 22:51:00', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('871', '5', '2017-01-13 23:08:15', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('872', '5', '2017-01-13 23:20:10', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('873', '5', '2017-01-13 23:50:32', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('874', '5', '2017-01-14 00:00:16', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('875', '5', '2017-01-14 00:00:26', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('876', '5', '2017-01-14 00:55:34', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('877', '5', '2017-01-14 00:55:36', null, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for bbs_magic_config
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_config`;
CREATE TABLE `bbs_magic_config` (
  `id` int(11) NOT NULL DEFAULT '1' COMMENT '主键id',
  `magic_switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启道具',
  `magic_discount` int(3) DEFAULT NULL COMMENT '道具回收折扣',
  `magic_sofa_lines` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '抢沙发台词',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具配置表';

-- ----------------------------
-- Records of bbs_magic_config
-- ----------------------------
INSERT INTO `bbs_magic_config` VALUES ('1', '1', '80', 'O(∩_∩)O哈哈~，沙发是我的啦O(∩_∩)O');

-- ----------------------------
-- Table structure for bbs_magic_log
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_log`;
CREATE TABLE `bbs_magic_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `magic_id` smallint(5) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `log_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `operator` tinyint(2) DEFAULT NULL COMMENT '操作(0出售道具1使用道具 2丢弃道具 3购买道具,4赠送)',
  `price` int(11) DEFAULT NULL COMMENT '购买价格',
  `num` int(11) DEFAULT NULL COMMENT '购买数量或者赠送数量',
  `targetuid` int(11) DEFAULT '0' COMMENT '赠送目标用户',
  PRIMARY KEY (`log_id`),
  KEY `fk_magic_log_magic` (`magic_id`),
  KEY `fk_magic_log_user` (`user_id`),
  CONSTRAINT `fk_magic_log_magic` FOREIGN KEY (`magic_id`) REFERENCES `bbs_common_magic` (`magicid`),
  CONSTRAINT `fk_magic_log_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='道具记录表';

-- ----------------------------
-- Records of bbs_magic_log
-- ----------------------------
INSERT INTO `bbs_magic_log` VALUES ('1', '6', '5', '2015-02-04 14:58:21', '3', '10', '1', null);
INSERT INTO `bbs_magic_log` VALUES ('2', '10', '5', '2015-02-04 14:58:27', '3', '10', '1', null);

-- ----------------------------
-- Table structure for bbs_magic_usergroup
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_usergroup`;
CREATE TABLE `bbs_magic_usergroup` (
  `magicid` smallint(6) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '有权限使用该道具的用户组id',
  PRIMARY KEY (`magicid`,`groupid`),
  KEY `fk_bbs_magic_usergroup_group` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具组权限';

-- ----------------------------
-- Records of bbs_magic_usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_magic_usergroup_to
-- ----------------------------
DROP TABLE IF EXISTS `bbs_magic_usergroup_to`;
CREATE TABLE `bbs_magic_usergroup_to` (
  `magicid` smallint(6) NOT NULL DEFAULT '0',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '允许被使用的用户组id',
  PRIMARY KEY (`magicid`,`groupid`),
  KEY `fk_bbs_magic_usergroup_group` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='允许被使用的用户组';

-- ----------------------------
-- Records of bbs_magic_usergroup_to
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_member_magic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_member_magic`;
CREATE TABLE `bbs_member_magic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `magicid` smallint(6) NOT NULL DEFAULT '0' COMMENT '道具id',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '道具数量',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_member_magic_user` (`uid`),
  KEY `fk_bbs_member_magic_magic` (`magicid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户道具表';

-- ----------------------------
-- Records of bbs_member_magic
-- ----------------------------
INSERT INTO `bbs_member_magic` VALUES ('1', '5', '6', '1');
INSERT INTO `bbs_member_magic` VALUES ('2', '5', '10', '1');

-- ----------------------------
-- Table structure for bbs_operation
-- ----------------------------
DROP TABLE IF EXISTS `bbs_operation`;
CREATE TABLE `bbs_operation` (
  `OPERATOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(11) NOT NULL,
  `operater_id` int(11) NOT NULL COMMENT '操作会员',
  `REF_TYPE` char(4) NOT NULL COMMENT '引用类型',
  `REF_ID` int(11) NOT NULL DEFAULT '0' COMMENT '引用ID',
  `OPT_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPT_REASON` varchar(255) DEFAULT NULL COMMENT '操作原因',
  `OPT_TIME` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`OPERATOR_ID`),
  KEY `FK_BBS_OPEATTION` (`SITE_ID`),
  KEY `FK_BBS_OPERATION_USER` (`operater_id`),
  CONSTRAINT `FK_BBS_OPEATTION` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `FK_BBS_OPERATION_USER` FOREIGN KEY (`operater_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8 COMMENT='主题、帖子操作记录';

-- ----------------------------
-- Records of bbs_operation
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_permission
-- ----------------------------
DROP TABLE IF EXISTS `bbs_permission`;
CREATE TABLE `bbs_permission` (
  `GROUP_ID` int(11) NOT NULL,
  `PERM_KEY` varchar(20) NOT NULL COMMENT '权限key',
  `PERM_VALUE` varchar(255) DEFAULT NULL COMMENT '权限value',
  KEY `FK_BBS_PERMISSION_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_BBS_PERMISSION_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `bbs_user_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛权限';

-- ----------------------------
-- Records of bbs_permission
-- ----------------------------
INSERT INTO `bbs_permission` VALUES ('1', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('1', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('1', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('1', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('1', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'msg_per_day', '100');
INSERT INTO `bbs_permission` VALUES ('1', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'post_per_day', '100');
INSERT INTO `bbs_permission` VALUES ('2', 'allow_attach', 'false');
INSERT INTO `bbs_permission` VALUES ('2', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('2', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('2', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('2', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('2', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('12', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'member_prohibit', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'post_limit', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'post_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('12', 'super_moderator', 'false');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_delete', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_edit', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_manage', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_shield', 'true');
INSERT INTO `bbs_permission` VALUES ('12', 'topic_top', '3');
INSERT INTO `bbs_permission` VALUES ('12', 'view_ip', 'true');

-- ----------------------------
-- Table structure for bbs_post
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post`;
CREATE TABLE `bbs_post` (
  `POST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL COMMENT '主题',
  `SITE_ID` int(11) NOT NULL COMMENT '站点',
  `CONFIG_ID` int(11) NOT NULL,
  `EDITER_ID` int(11) DEFAULT NULL COMMENT '编辑器会员',
  `CREATER_ID` int(11) NOT NULL COMMENT '发贴会员',
  `CREATE_TIME` datetime NOT NULL COMMENT '发贴时间',
  `POSTER_IP` varchar(20) NOT NULL DEFAULT '' COMMENT '发贴IP',
  `EDIT_TIME` datetime DEFAULT NULL COMMENT '编辑时间',
  `EDITER_IP` varchar(20) DEFAULT '' COMMENT '编辑者IP',
  `EDIT_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '编辑次数',
  `INDEX_COUNT` int(11) NOT NULL DEFAULT '1' COMMENT '第几楼',
  `STATUS` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态',
  `IS_AFFIX` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传附件',
  `IS_HIDDEN` tinyint(1) DEFAULT '0' COMMENT '是否有隐藏内容',
  `TYPE_ID` int(11) NOT NULL COMMENT '帖子分类id',
  `ANONYMOUS` tinyint(1) DEFAULT NULL COMMENT '是否匿名',
  PRIMARY KEY (`POST_ID`),
  KEY `FK_BBS_POST_CREATER` (`CREATER_ID`),
  KEY `FK_BBS_POST_EDITOR` (`EDITER_ID`),
  KEY `FK_BBS_POST_TOPIC` (`TOPIC_ID`),
  KEY `FK_BBS_POST_WEBSITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_POST_CREATER` FOREIGN KEY (`CREATER_ID`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_POST_EDITOR` FOREIGN KEY (`EDITER_ID`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_POST_TOPIC` FOREIGN KEY (`TOPIC_ID`) REFERENCES `bbs_topic` (`TOPIC_ID`),
  CONSTRAINT `FK_BBS_POST_WEBSITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8 COMMENT='论坛帖子';

-- ----------------------------
-- Records of bbs_post
-- ----------------------------
INSERT INTO `bbs_post` VALUES ('186', '65', '1', '1', null, '5', '2017-01-14 01:13:05', '127.0.0.1', null, null, '0', '1', '0', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for bbs_post_text
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post_text`;
CREATE TABLE `bbs_post_text` (
  `POST_ID` bigint(20) NOT NULL,
  `POST_TITLE` varchar(100) DEFAULT NULL COMMENT '帖子标题',
  `POST_CONTENT` longtext COMMENT '帖子内容',
  PRIMARY KEY (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛帖子内容';

-- ----------------------------
-- Records of bbs_post_text
-- ----------------------------
INSERT INTO `bbs_post_text` VALUES ('186', '这个病例诊断什么？巨细胞修复性肉芽肿？骨巨细胞瘤？', '性别	男	\r\n年龄	36	\r\n临床诊断	右颞叶巨大占位\r\n一般病史	右耳鸣2月余，渐行加重。CT示右颞叶环形高密度影。\r\n标本名称	右颞叶占位组织\r\n大体所见	术中所见：右颞叶弧形切口，暴露颧弓根部，切开颞肌，见颞部肌肉近颅骨侧血供丰富伴肿瘤组织侵袭。颞骨见肿瘤组织侵袭伴4*4cm大小颅骨缺损。开骨窗后，见颅骨下硬膜外巨大灰白色肿瘤，与周围硬脑膜及颅骨粘连紧密，肿瘤大小约6*5*5cm。内侧侵及颅骨岩骨段，外侧侵及内听道及气房乳突。肿瘤血供丰富，质松脆，实质呈鱼肉状，瘤内多发钙化及囊变。');

-- ----------------------------
-- Table structure for bbs_post_type
-- ----------------------------
DROP TABLE IF EXISTS `bbs_post_type`;
CREATE TABLE `bbs_post_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '帖子分类名称',
  `priority` int(11) DEFAULT NULL COMMENT '排序',
  `site_id` int(11) DEFAULT NULL COMMENT '站点id',
  `forum_id` int(11) NOT NULL DEFAULT '0' COMMENT '板块',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类id',
  PRIMARY KEY (`type_id`),
  KEY `fk_bbs_post_type_site` (`site_id`),
  KEY `fk_bbs_post_type_parent` (`parent_id`),
  KEY `fk_bbs_type_forum` (`forum_id`),
  CONSTRAINT `fk_bbs_post_type_parent` FOREIGN KEY (`parent_id`) REFERENCES `bbs_post_type` (`type_id`),
  CONSTRAINT `fk_bbs_post_type_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_bbs_type_forum` FOREIGN KEY (`forum_id`) REFERENCES `bbs_forum` (`FORUM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_post_type
-- ----------------------------
INSERT INTO `bbs_post_type` VALUES ('1', '测试', '1', '1', '1', null);
INSERT INTO `bbs_post_type` VALUES ('2', '嘻嘻', '2', '1', '1', '1');
INSERT INTO `bbs_post_type` VALUES ('3', '哈哈', '3', '1', '1', '1');
INSERT INTO `bbs_post_type` VALUES ('4', '呜呜', '4', '1', '1', '1');

-- ----------------------------
-- Table structure for bbs_private_msg
-- ----------------------------
DROP TABLE IF EXISTS `bbs_private_msg`;
CREATE TABLE `bbs_private_msg` (
  `PRIVMSG_ID` bigint(20) NOT NULL,
  `TO_USER` bigint(20) NOT NULL COMMENT '收信人',
  `FROM_USER` bigint(20) NOT NULL COMMENT '发信人',
  `MSG_TYPE` smallint(6) NOT NULL DEFAULT '1' COMMENT '类型（2：已发，1：已阅，0：未阅）',
  `MSG_SUBJECT` varchar(255) DEFAULT NULL COMMENT '主题',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MSG_IP` varchar(20) NOT NULL DEFAULT '' COMMENT 'IP地址',
  PRIMARY KEY (`PRIVMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人短消息';

-- ----------------------------
-- Records of bbs_private_msg
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_private_msg_text
-- ----------------------------
DROP TABLE IF EXISTS `bbs_private_msg_text`;
CREATE TABLE `bbs_private_msg_text` (
  `PRIVMSG_ID` bigint(20) NOT NULL,
  `MSG_TEXT` longtext COMMENT '个人信息内容',
  PRIMARY KEY (`PRIVMSG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='个人消息内容';

-- ----------------------------
-- Records of bbs_private_msg_text
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_report
-- ----------------------------
DROP TABLE IF EXISTS `bbs_report`;
CREATE TABLE `bbs_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_url` varchar(255) CHARACTER SET gbk NOT NULL DEFAULT '' COMMENT '举报地址',
  `process_user` int(11) DEFAULT NULL COMMENT '处理人',
  `process_time` datetime DEFAULT NULL COMMENT '处理时间',
  `process_result` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '处理结果',
  `status` tinyint(1) DEFAULT NULL COMMENT '处理状态0未处理。1已经处理',
  `report_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '举报时间',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_report_process_user` (`process_user`),
  CONSTRAINT `fk_bbs_report_process_user` FOREIGN KEY (`process_user`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='举报记录';

-- ----------------------------
-- Records of bbs_report
-- ----------------------------
INSERT INTO `bbs_report` VALUES ('1', 'http：//localhost：8080/jsjl/33.jhtml＃pidnull', null, null, null, '0', '2014-11-20 15:29:36');

-- ----------------------------
-- Table structure for bbs_report_ext
-- ----------------------------
DROP TABLE IF EXISTS `bbs_report_ext`;
CREATE TABLE `bbs_report_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报id',
  `report_id` int(11) NOT NULL DEFAULT '0' COMMENT 'reportid',
  `report_user` int(11) NOT NULL DEFAULT '0' COMMENT '举报人',
  `report_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '举报时间',
  `report_reason` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '举报理由',
  PRIMARY KEY (`id`),
  KEY `fk_bbs_report_ext_report_user` (`report_user`),
  KEY `fk_bbs_report_ext_report` (`report_id`),
  CONSTRAINT `fk_bbs_report_ext_report` FOREIGN KEY (`report_id`) REFERENCES `bbs_report` (`id`),
  CONSTRAINT `fk_bbs_report_ext_report_user` FOREIGN KEY (`report_user`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='举报扩展';

-- ----------------------------
-- Records of bbs_report_ext
-- ----------------------------
INSERT INTO `bbs_report_ext` VALUES ('1', '1', '5', '2014-11-20 15:29:36', '<script＞alert(1)</script＞');

-- ----------------------------
-- Table structure for bbs_session
-- ----------------------------
DROP TABLE IF EXISTS `bbs_session`;
CREATE TABLE `bbs_session` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(100) NOT NULL DEFAULT '' COMMENT '会话sessionID',
  `user_id` int(11) DEFAULT NULL COMMENT '会员用户ID',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `last_activetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后活动时间',
  `first_activetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始活动时间',
  PRIMARY KEY (`sid`),
  KEY `fk_session_user` (`user_id`),
  CONSTRAINT `fk_session_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1257 DEFAULT CHARSET=utf8 COMMENT='论坛会话';

-- ----------------------------
-- Records of bbs_session
-- ----------------------------
INSERT INTO `bbs_session` VALUES ('1254', '6A0AF51BD91ADEFE14AA2313AA19B8FD', '5', '127.0.0.1', '2017-01-14 00:55:30', '2017-01-14 00:55:30');
INSERT INTO `bbs_session` VALUES ('1255', 'AB53EB234F9EE8474DADA134CB987C81', '5', '0:0:0:0:0:0:0:1', '2017-01-14 00:55:34', '2017-01-14 00:55:34');
INSERT INTO `bbs_session` VALUES ('1256', 'EC1A09438829C7711598AC2DAC588199', null, '127.0.0.1', '2017-01-14 01:05:28', '2017-01-14 01:05:28');

-- ----------------------------
-- Table structure for bbs_third_account
-- ----------------------------
DROP TABLE IF EXISTS `bbs_third_account`;
CREATE TABLE `bbs_third_account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录平台账号';

-- ----------------------------
-- Records of bbs_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_topic
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic`;
CREATE TABLE `bbs_topic` (
  `TOPIC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL COMMENT '板块',
  `LAST_POST_ID` int(11) DEFAULT NULL COMMENT '最后帖',
  `FIRST_POST_ID` int(11) DEFAULT NULL COMMENT '主题帖',
  `SITE_ID` int(11) NOT NULL COMMENT '站点',
  `CREATER_ID` int(11) NOT NULL COMMENT '发帖会员',
  `REPLYER_ID` int(11) NOT NULL COMMENT '最后回帖会员',
  `TITLE` varchar(100) NOT NULL COMMENT '标题',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `LAST_TIME` datetime NOT NULL COMMENT '最后回帖时间',
  `SORT_TIME` datetime NOT NULL COMMENT '用于排序',
  `VIEW_COUNT` bigint(20) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `REPLY_COUNT` int(11) NOT NULL DEFAULT '0' COMMENT '恢复次数',
  `TOP_LEVEL` smallint(6) NOT NULL DEFAULT '0' COMMENT '固定级别',
  `PRIME_LEVEL` smallint(6) NOT NULL DEFAULT '0' COMMENT '精华级别',
  `STATUS` smallint(6) NOT NULL DEFAULT '0' COMMENT '状态',
  `OUTER_URL` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `STYLE_BOLD` tinyint(1) NOT NULL DEFAULT '0' COMMENT '粗体',
  `STYLE_ITALIC` tinyint(1) NOT NULL DEFAULT '0' COMMENT '斜体',
  `STYLE_COLOR` char(6) DEFAULT NULL COMMENT '颜色',
  `STYLE_TIME` datetime DEFAULT NULL COMMENT '样式有效时间',
  `IS_AFFIX` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上传附件',
  `HAVA_REPLY` longtext COMMENT '回复列表',
  `moderator_reply` tinyint(1) DEFAULT '0' COMMENT '版主是否回复',
  `TYPE_ID` int(11) NOT NULL COMMENT '主题分类id',
  `ALLAY_REPLY` tinyint(1) DEFAULT NULL COMMENT '主题是否允许回复',
  `HAS_SOFAED` tinyint(1) DEFAULT NULL COMMENT '主题是否已经被抢走沙发',
  `CATEGORY` tinyint(1) DEFAULT NULL COMMENT '帖子类型(0:普通帖;1:投票贴)',
  `TOTAL_COUNT` int(11) DEFAULT NULL COMMENT '总票数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问量',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问量',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问量',
  `replycount_day` int(11) NOT NULL DEFAULT '0' COMMENT '日回复量',
  PRIMARY KEY (`TOPIC_ID`),
  KEY `BBS_SORT_TIME` (`SORT_TIME`),
  KEY `FK_BBS_FIRST_POST` (`FIRST_POST_ID`),
  KEY `FK_BBS_LAST_POST` (`LAST_POST_ID`),
  KEY `FK_BBS_TOPIC_FORUM` (`FORUM_ID`),
  KEY `FK_BBS_TOPIC_USER_CREATE` (`CREATER_ID`),
  KEY `FK_BBS_TOPIC_USER_LAST` (`REPLYER_ID`),
  KEY `FK_BBS_TOPIC_SITE` (`SITE_ID`),
  CONSTRAINT `FK_BBS_FIRST_POST` FOREIGN KEY (`FIRST_POST_ID`) REFERENCES `bbs_post` (`POST_ID`),
  CONSTRAINT `FK_BBS_LAST_POST` FOREIGN KEY (`LAST_POST_ID`) REFERENCES `bbs_post` (`POST_ID`),
  CONSTRAINT `FK_BBS_TOPIC_FORUM` FOREIGN KEY (`FORUM_ID`) REFERENCES `bbs_forum` (`FORUM_ID`),
  CONSTRAINT `FK_BBS_TOPIC_SITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `FK_BBS_TOPIC_USER_CREATE` FOREIGN KEY (`CREATER_ID`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_TOPIC_USER_LAST` FOREIGN KEY (`REPLYER_ID`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='论坛主题';

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------
INSERT INTO `bbs_topic` VALUES ('65', '3', null, '186', '1', '5', '5', '这个病例诊断什么？巨细胞修复性肉芽肿？骨巨细胞瘤？', '2017-01-14 01:13:05', '2017-01-14 01:13:05', '2017-01-14 01:13:05', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '1', '1', '1', '0');

-- ----------------------------
-- Table structure for bbs_topic_text
-- ----------------------------
DROP TABLE IF EXISTS `bbs_topic_text`;
CREATE TABLE `bbs_topic_text` (
  `topic_id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '主题标题',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='论坛主题内容';

-- ----------------------------
-- Records of bbs_topic_text
-- ----------------------------
INSERT INTO `bbs_topic_text` VALUES ('65', '这个病例诊断什么？巨细胞修复性肉芽肿？骨巨细胞瘤？');

-- ----------------------------
-- Table structure for bbs_user_active_level
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user_active_level`;
CREATE TABLE `bbs_user_active_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) NOT NULL DEFAULT '' COMMENT '等级名称',
  `required_hour` bigint(20) NOT NULL DEFAULT '0' COMMENT '等级需要时间(小时)',
  `level_img` varchar(255) DEFAULT NULL COMMENT '等级头像',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户活跃等级';

-- ----------------------------
-- Records of bbs_user_active_level
-- ----------------------------
INSERT INTO `bbs_user_active_level` VALUES ('1', '1', '0', '/r/cms/www/blue/bbs_forum/img/Lv_1.png');
INSERT INTO `bbs_user_active_level` VALUES ('2', '2', '20', '/r/cms/www/blue/bbs_forum/img/Lv_2.png');
INSERT INTO `bbs_user_active_level` VALUES ('3', '3', '50', '/r/cms/www/blue/bbs_forum/img/Lv_3.png');

-- ----------------------------
-- Table structure for bbs_user_group
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user_group`;
CREATE TABLE `bbs_user_group` (
  `GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL COMMENT '头衔',
  `GROUP_TYPE` smallint(6) NOT NULL DEFAULT '0' COMMENT '组类别',
  `GROUP_IMG` varchar(100) DEFAULT NULL COMMENT '图片',
  `GROUP_POINT` int(11) NOT NULL DEFAULT '0' COMMENT '升级积分',
  `IS_DEFAULT` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认组',
  `GRADE_NUM` int(11) DEFAULT '0' COMMENT '评分',
  `magic_packet_size` int(11) DEFAULT NULL COMMENT '用户组道具包容量',
  PRIMARY KEY (`GROUP_ID`),
  KEY `FK_BBS_GROUP_SITE` (`site_id`),
  CONSTRAINT `FK_BBS_GROUP_SITE` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='论坛会员组';

-- ----------------------------
-- Records of bbs_user_group
-- ----------------------------
INSERT INTO `bbs_user_group` VALUES ('1', '1', '白丁', '1', '1', '0', '1', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('2', '1', '童生', '1', '2', '100', '0', '0', '100');
INSERT INTO `bbs_user_group` VALUES ('3', '1', '秀才', '1', '3', '500', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('4', '1', '举人', '1', '4', '1000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('5', '1', '解元', '1', '5', '2000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('6', '1', '贡士', '1', '6', '4000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('7', '1', '会元', '1', '7', '8000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('8', '1', '进士', '1', '8', '16000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('9', '1', '探花', '1', '9', '32000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('10', '1', '榜眼', '1', '10', '64000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('11', '1', '状元', '1', '11', '128000', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('12', '1', '版主', '2', '21', '0', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('13', '1', 'VIP会员', '3', '10', '0', '0', '0', '0');
INSERT INTO `bbs_user_group` VALUES ('14', '1', '游客', '0', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for bbs_user_online
-- ----------------------------
DROP TABLE IF EXISTS `bbs_user_online`;
CREATE TABLE `bbs_user_online` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `online_latest` double(10,2) DEFAULT NULL COMMENT '最后登录时长',
  `online_day` double(10,2) DEFAULT NULL COMMENT '今日在线时长',
  `online_week` double(10,2) DEFAULT NULL COMMENT '本周在线',
  `online_month` double(10,2) DEFAULT NULL COMMENT '本月在线',
  `online_year` double(10,2) DEFAULT NULL COMMENT '本年在线',
  `online_total` double(10,2) DEFAULT NULL COMMENT '总在线时长',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_bbs_user_online_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=gbk COMMENT='用户在线时长统计';

-- ----------------------------
-- Records of bbs_user_online
-- ----------------------------
INSERT INTO `bbs_user_online` VALUES ('5', '0.00', '0.00', '0.01', '0.01', '0.01', '379.16');

-- ----------------------------
-- Table structure for bbs_vote_item
-- ----------------------------
DROP TABLE IF EXISTS `bbs_vote_item`;
CREATE TABLE `bbs_vote_item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '票数',
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_vote_item
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_vote_record
-- ----------------------------
DROP TABLE IF EXISTS `bbs_vote_record`;
CREATE TABLE `bbs_vote_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `vote_time` datetime DEFAULT NULL COMMENT '投票时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_vote_record_user` (`user_id`),
  KEY `fk_vote_record_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_vote_record
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_webservice
-- ----------------------------
DROP TABLE IF EXISTS `bbs_webservice`;
CREATE TABLE `bbs_webservice` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_address` varchar(255) NOT NULL DEFAULT '' COMMENT '接口地址',
  `target_namespace` varchar(255) DEFAULT NULL,
  `success_result` varchar(255) DEFAULT '' COMMENT '正确返回值',
  `service_type` varchar(50) DEFAULT NULL COMMENT '接口类型',
  `service_operate` varchar(50) DEFAULT NULL COMMENT '接口操作',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='接口表';

-- ----------------------------
-- Records of bbs_webservice
-- ----------------------------
INSERT INTO `bbs_webservice` VALUES ('1', 'http://localhost:2021/services/User?wsdl', 'http://localhost:2021/services/User', '100', 'addUser', 'addUser');
INSERT INTO `bbs_webservice` VALUES ('2', 'http://localhost:2021/services/User?wsdl', 'http://localhost:2021/services/User', '100', 'updateUser', 'updateUser');
INSERT INTO `bbs_webservice` VALUES ('3', 'http://localhost:2021/services/User?wsdl', 'http://localhost:2021/services/User', '100', 'deleteUser', 'delUser');

-- ----------------------------
-- Table structure for bbs_webservice_auth
-- ----------------------------
DROP TABLE IF EXISTS `bbs_webservice_auth`;
CREATE TABLE `bbs_webservice_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `system` varchar(100) NOT NULL DEFAULT '' COMMENT '系统',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='webservices认证表';

-- ----------------------------
-- Records of bbs_webservice_auth
-- ----------------------------
INSERT INTO `bbs_webservice_auth` VALUES ('1', 'test', '098f6bcd4621d373cade4e832627b4f6', 'bbs', '1');

-- ----------------------------
-- Table structure for bbs_webservice_call_record
-- ----------------------------
DROP TABLE IF EXISTS `bbs_webservice_call_record`;
CREATE TABLE `bbs_webservice_call_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(50) NOT NULL DEFAULT '' COMMENT '接口识别码',
  `auth_id` int(11) NOT NULL COMMENT '调用的认证',
  `record_time` datetime NOT NULL COMMENT '调用时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_webservice_record_auth` (`auth_id`),
  CONSTRAINT `fk_webservice_record_auth` FOREIGN KEY (`auth_id`) REFERENCES `bbs_webservice_auth` (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='接口调用记录';

-- ----------------------------
-- Records of bbs_webservice_call_record
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_webservice_param
-- ----------------------------
DROP TABLE IF EXISTS `bbs_webservice_param`;
CREATE TABLE `bbs_webservice_param` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `param_name` varchar(100) NOT NULL DEFAULT '' COMMENT '参数名',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  KEY `fk_param_webservice` (`service_id`),
  CONSTRAINT `fk_param_webservice` FOREIGN KEY (`service_id`) REFERENCES `bbs_webservice` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数表';

-- ----------------------------
-- Records of bbs_webservice_param
-- ----------------------------
INSERT INTO `bbs_webservice_param` VALUES ('1', '0', 'auth_username', 'test');
INSERT INTO `bbs_webservice_param` VALUES ('1', '1', 'auth_password', 'test');
INSERT INTO `bbs_webservice_param` VALUES ('1', '2', 'admin', 'false');
INSERT INTO `bbs_webservice_param` VALUES ('1', '3', 'username', '');
INSERT INTO `bbs_webservice_param` VALUES ('1', '4', 'password', '');
INSERT INTO `bbs_webservice_param` VALUES ('1', '5', 'email', '');
INSERT INTO `bbs_webservice_param` VALUES ('1', '6', 'realname', '');
INSERT INTO `bbs_webservice_param` VALUES ('1', '7', 'sex', '');
INSERT INTO `bbs_webservice_param` VALUES ('1', '8', 'tel', '');
INSERT INTO `bbs_webservice_param` VALUES ('2', '0', 'auth_username', 'test');
INSERT INTO `bbs_webservice_param` VALUES ('2', '1', 'auth_password', 'test');
INSERT INTO `bbs_webservice_param` VALUES ('2', '2', 'username', '');
INSERT INTO `bbs_webservice_param` VALUES ('2', '3', 'password', '');
INSERT INTO `bbs_webservice_param` VALUES ('2', '4', 'email', '');
INSERT INTO `bbs_webservice_param` VALUES ('2', '5', 'realname', '');
INSERT INTO `bbs_webservice_param` VALUES ('2', '6', 'sex', '');
INSERT INTO `bbs_webservice_param` VALUES ('2', '7', 'tel', '');
INSERT INTO `bbs_webservice_param` VALUES ('3', '0', 'auth_username', 'test');
INSERT INTO `bbs_webservice_param` VALUES ('3', '1', 'auth_password', 'test');
INSERT INTO `bbs_webservice_param` VALUES ('3', '2', 'username', '');

-- ----------------------------
-- Table structure for jb_friendship
-- ----------------------------
DROP TABLE IF EXISTS `jb_friendship`;
CREATE TABLE `jb_friendship` (
  `friendship_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `friend_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '好友状态(0:申请中;1:接受;2:拒绝)',
  PRIMARY KEY (`friendship_id`),
  KEY `fk_jb_friendship_friend` (`friend_id`),
  KEY `fk_jb_friendship_user` (`user_id`),
  CONSTRAINT `jb_friendship_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `jb_friendship_ibfk_2` FOREIGN KEY (`friend_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_friendship
-- ----------------------------

-- ----------------------------
-- Table structure for jb_message
-- ----------------------------
DROP TABLE IF EXISTS `jb_message`;
CREATE TABLE `jb_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0',
  `sender` int(11) DEFAULT NULL COMMENT '发送人',
  `receiver` int(11) DEFAULT '0' COMMENT '接收人',
  `content` longtext CHARACTER SET gbk NOT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为系统消息(0:不是;1:是)',
  `msg_type` int(2) NOT NULL DEFAULT '1' COMMENT '1消息，2留言,3打招呼',
  `is_read` tinyint(1) DEFAULT '0' COMMENT '信息状态 0未读 1已读',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jb_message_user` (`user_id`),
  KEY `fk_jb_message_receiver` (`receiver`),
  KEY `fk_jb_message_sender` (`sender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message
-- ----------------------------

-- ----------------------------
-- Table structure for jb_message_reply
-- ----------------------------
DROP TABLE IF EXISTS `jb_message_reply`;
CREATE TABLE `jb_message_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL DEFAULT '0',
  `sender` int(11) DEFAULT NULL,
  `receiver` int(11) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_read` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reply_id`),
  KEY `fk_jb_reply_sender` (`sender`),
  KEY `fk_jb_reply_receiver` (`receiver`),
  KEY `fk_jb_reply_msg` (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message_reply
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_user`;
CREATE TABLE `jb_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `PROHIBIT_POST` smallint(6) NOT NULL DEFAULT '0' COMMENT '禁言(0:不禁言;1:永久禁言;2:定期禁言)',
  `PROHIBIT_TIME` datetime DEFAULT NULL COMMENT '解禁时间',
  `GRADE_TODAY` int(11) DEFAULT '0' COMMENT '今日评分',
  `UPLOAD_TODAY` int(11) DEFAULT '0' COMMENT '今日上传',
  `POINT` bigint(20) DEFAULT '0' COMMENT '积分',
  `INTRODUCTION` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `SIGNED` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `AVATAR` varchar(100) DEFAULT NULL COMMENT '个人头像',
  `AVATAR_TYPE` smallint(6) DEFAULT '0' COMMENT '头像类型',
  `TOPIC_COUNT` int(11) DEFAULT '0' COMMENT '主题总数',
  `REPLY_COUNT` int(11) DEFAULT '0' COMMENT '回复总数',
  `PRIME_COUNT` int(11) DEFAULT '0' COMMENT '精华总数',
  `POST_TODAY` int(11) DEFAULT '0' COMMENT '今日发帖',
  `LAST_POST_TIME` datetime DEFAULT NULL COMMENT '最后回帖时间',
  `PRESTIGE` bigint(20) DEFAULT '0' COMMENT '彩虹币',
  `magic_packet_size` int(11) DEFAULT NULL COMMENT '用户道具包现有容量',
  `session_id` varchar(255) DEFAULT NULL,
  `active_level_id` int(11) DEFAULT NULL,
  `is_official` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `FK_BBS_MEMBER_MEMBERGROUP` (`group_id`),
  CONSTRAINT `FK_BBS_MEMBER_MEMBERGROUP` FOREIGN KEY (`group_id`) REFERENCES `bbs_user_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS用户表';

-- ----------------------------
-- Records of jb_user
-- ----------------------------
INSERT INTO `jb_user` VALUES ('5', '12', 'admin', 'qianfo_713@163.com', '2011-03-17 12:02:04', '127.0.0.1', '2017-01-14 00:55:36', '0:0:0:0:0:0:0:1', '947', '0', '0', '2011-03-17', '1', '0', '0', null, null, '0', '302', null, '简介2222', '01.gif', '0', '62', '114', '0', '176', null, '8', '0', 'AB53EB234F9EE8474DADA134CB987C81', '3', '0');

-- ----------------------------
-- Table structure for jb_user_attr
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_attr`;
CREATE TABLE `jb_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  KEY `pk_jb_attr_user` (`user_id`),
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- ----------------------------
-- Records of jb_user_attr
-- ----------------------------

-- ----------------------------
-- Table structure for jb_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `jb_user_ext`;
CREATE TABLE `jb_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `avatar` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `moble` varchar(50) DEFAULT NULL COMMENT '手机',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS用户扩展信息表';

-- ----------------------------
-- Records of jb_user_ext
-- ----------------------------
INSERT INTO `jb_user_ext` VALUES ('5', 'abc', '1', null, null, '简介2222', null, null, null, null, null);

-- ----------------------------
-- Table structure for jc_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '用户活跃清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `allow_suffix` varchar(255) DEFAULT NULL COMMENT '允许上传文件后缀',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES ('1', null, null, '2020', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '1', '120', '120', '/r/cms/www/watermark.png', 'www.jeecms.com', '20', '#FF0000', '50', '1', '0', '0', '2017-01-14', '2011-12-26 13:32:26', 'jeecms', '12', null, null, null, null, null, '7z,aiff,asf,avi,bmp,csv,doc,docx,fla,flv,gif,gz,gzip,jpeg,jpg,mid,mov,mp3,mp4,mpc,mpeg,mpg,ods,odt,pdf,png,ppt,pxd,qt,ram,rar,rm,rmi,rmvb,rtf,sdc,sitd,swf,sxc,sxw,tar,tgz,tif,tiff,vsd,wav,wma,wmv,xls,xlsx,txt,xml,zip');

-- ----------------------------
-- Table structure for jc_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr` (
  `config_id` bigint(20) NOT NULL DEFAULT '0',
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_attr_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS配置属性表';

-- ----------------------------
-- Records of jc_config_attr
-- ----------------------------
INSERT INTO `jc_config_attr` VALUES ('1', 'keepMinute', '1');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqID', '101194204');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqKey', 'd4e1583fabe2a2db6e44bbcc8a2c24e8');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaID', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboID', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'useronlinetopnum', '146');
INSERT INTO `jc_config_attr` VALUES ('1', 'useronlinetopday', '2015-3-21');
INSERT INTO `jc_config_attr` VALUES ('1', 'changeGroup', '10');
INSERT INTO `jc_config_attr` VALUES ('1', 'autoChangeGroup', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'serviceExpirationEmailNotice', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'expirationEmailNoticeCount', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'sso_2', 'http://www.caihongyixue.com/sso/authenticate.jspx');
INSERT INTO `jc_config_attr` VALUES ('1', 'ssoEnable', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'defaultActiveLevel', '2');

-- ----------------------------
-- Table structure for jc_config_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_item`;
CREATE TABLE `jc_config_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '70' COMMENT '排列顺序',
  `def_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型 "1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填',
  `category` int(11) NOT NULL DEFAULT '10' COMMENT '模型项目所属分类（10用户模型）',
  PRIMARY KEY (`modelitem_id`),
  KEY `pk_jc_item_config` (`config_id`),
  CONSTRAINT `fk_jb_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';

-- ----------------------------
-- Records of jc_config_item
-- ----------------------------

-- ----------------------------
-- Table structure for jc_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink` (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) NOT NULL COMMENT '网站名称',
  `domain` varchar(255) NOT NULL COMMENT '网站地址',
  `logo` varchar(150) DEFAULT NULL COMMENT '图标',
  `email` varchar(100) DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`),
  KEY `fk_jc_ctg_friendlink` (`friendlinkctg_id`),
  KEY `fk_jc_friendlink_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------

-- ----------------------------
-- Table structure for jc_friendlink_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg` (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`),
  KEY `fk_jc_friendlinkctg_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------

-- ----------------------------
-- Table structure for jc_sensitivity
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`),
  KEY `fk_sensitivity_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------

-- ----------------------------
-- Table structure for jc_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) NOT NULL COMMENT '域名',
  `site_path` varchar(20) NOT NULL COMMENT '路径',
  `site_name` varchar(100) NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `tpl_mobile_solution` varchar(50) NOT NULL DEFAULT '' COMMENT '手机访问模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `creditex_id` int(11) DEFAULT '1' COMMENT '积分交易规则id',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES ('1', '1', null, 'localhost', 'www', '彩虹医学网论坛', '彩虹医学网', 'http://', '.jhtml', '.html', null, '0', '0', 'zh_CN', 'zh_CN', 'blue', 'mobile', '2', '2', '1', '1', '192.168.0.2,192.168.0.7,192.168.0.144,localhost', '', '1');

-- ----------------------------
-- Table structure for jo_authentication
-- ----------------------------
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication` (
  `authentication_id` char(32) NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='认证信息表';

-- ----------------------------
-- Records of jo_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for jo_config
-- ----------------------------
DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config` (
  `cfg_key` varchar(50) NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of jo_config
-- ----------------------------
INSERT INTO `jo_config` VALUES ('email_encoding', 'utf-8');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.qq.com');
INSERT INTO `jo_config` VALUES ('email_password', '1212');
INSERT INTO `jo_config` VALUES ('email_personal', 'jeecms');
INSERT INTO `jo_config` VALUES ('email_port', null);
INSERT INTO `jo_config` VALUES ('email_username', '221@qq.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '彩虹医学网会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用彩虹医学网系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost:2020/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
INSERT INTO `jo_config` VALUES ('message_register_subject', '彩虹医学网会员注册信息');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册彩虹医学网系统会员\r\n请点击以下链接进行激活\r\nhttp://localhost:2020/active.jspx?username=${username}&key=${activationCode}\r\n');
INSERT INTO `jo_config` VALUES ('message_serviceexpiration_subject', 'JEECMS商业服务到期');
INSERT INTO `jo_config` VALUES ('message_serviceexpiration_text', '感谢您使用JEECMS系列产品，您的服务已到期，如需得到我司服务，您可以到电话联系售前人员购买支持服务，联系方式在官网可以查询：http://www.jeecms.com');
INSERT INTO `jo_config` VALUES ('message_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');

-- ----------------------------
-- Table structure for jo_ftp
-- ----------------------------
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp` (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) NOT NULL COMMENT '名称',
  `ip` varchar(50) NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT '21' COMMENT '端口号',
  `username` varchar(100) DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) DEFAULT NULL COMMENT '路径',
  `url` varchar(255) NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FTP表';

-- ----------------------------
-- Records of jo_ftp
-- ----------------------------

-- ----------------------------
-- Table structure for jo_template
-- ----------------------------
DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template` (
  `tpl_name` varchar(150) NOT NULL COMMENT '模板名称',
  `tpl_source` longtext COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of jo_template
-- ----------------------------

-- ----------------------------
-- Table structure for jo_upload
-- ----------------------------
DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload` (
  `filename` varchar(150) NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传附件表';

-- ----------------------------
-- Records of jo_upload
-- ----------------------------

-- ----------------------------
-- Table structure for jo_user
-- ----------------------------
DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reset_key` char(32) DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) DEFAULT NULL COMMENT '重置密码VALUE',
  `activation` tinyint(1) NOT NULL DEFAULT '0' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES ('5', 'admin', 'qianfo_713@163.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2011-03-17 12:02:04', '127.0.0.1', '2017-01-14 00:55:36', '0:0:0:0:0:0:0:1', '1696', null, null, '1', null, null, '0', null);
