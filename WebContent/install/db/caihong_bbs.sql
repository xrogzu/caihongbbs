/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : caihong_bbs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-19 20:37:16
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('2', '201', 'IMG_3494.JPG', null, '/u/cms/www/201701/17155530hl6o.jpg', 'IMG_3494.JPG', '2944217', '1', '2017-01-17 15:55:30');
INSERT INTO `attachment` VALUES ('3', '202', 'Redocn_2012042304002837.jpg', null, '/u/cms/www/201701/17155600o4pk.jpg', 'Redocn_2012042304002837.jpg', '1160958', '1', '2017-01-17 15:56:00');
INSERT INTO `attachment` VALUES ('8', '218', '大雄宝殿20140701114817.jpg', null, '/u/cms/www/201701/18183023hmqu.jpg', '大雄宝殿20140701114817.jpg', '383085', '1', '2017-01-18 18:30:23');
INSERT INTO `attachment` VALUES ('9', '218', 'webwxgetmsgimg (1).jpg', null, '/u/cms/www/201701/181830237a1j.jpg', 'webwxgetmsgimg (1).jpg', '4595', '1', '2017-01-18 18:30:23');
INSERT INTO `attachment` VALUES ('10', '231', '8357413_111621673300_2.jpg', null, '/u/cms/www/201701/24172906kplv.jpg', '8357413_111621673300_2.jpg', '273138', '1', '2017-01-24 17:29:06');
INSERT INTO `attachment` VALUES ('11', '231', '2009163223562_2.jpg', null, '/u/cms/www/201701/24172906syr8.jpg', '2009163223562_2.jpg', '248721', '1', '2017-01-24 17:29:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='论坛分区';

-- ----------------------------
-- Records of bbs_category
-- ----------------------------
INSERT INTO `bbs_category` VALUES ('1', '1', 'jsjl', '临床病理', '0', '1', 'admin');
INSERT INTO `bbs_category` VALUES ('2', '1', 'yxcs', '影像和超声', '3', '1', 'admin');
INSERT INTO `bbs_category` VALUES ('3', '1', 'lcxk', '临床学科', '4', '1', '');
INSERT INTO `bbs_category` VALUES ('4', '1', 'xlzx', '心理咨询', '4', '1', '');
INSERT INTO `bbs_category` VALUES ('5', '1', 'zygc', '中医国粹', '5', '1', '');
INSERT INTO `bbs_category` VALUES ('6', '1', 'zyjx', '资源教学', '6', '1', '');
INSERT INTO `bbs_category` VALUES ('7', '1', 'lcjy', '临床检验', '1', '1', '');
INSERT INTO `bbs_category` VALUES ('8', '1', 'qccp', '器材产品', '7', '1', '');
INSERT INTO `bbs_category` VALUES ('10', '1', 'ylyd', '娱乐园地', '8', '1', '');
INSERT INTO `bbs_category` VALUES ('12', '1', 'xxfb', '彩虹医学信息发布区', '9', '1', '');

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
INSERT INTO `bbs_config` VALUES ('1', '1', '160', '160', '20', '10', '彩虹医学网论坛', '彩虹医学网论坛', '1', '1', '', '0', '0', '44', '2017-01-24', '46', '165', '7', '39', '1', '1', '0', '1', '0');

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
  CONSTRAINT `FK_BBS_FORUM_USER` FOREIGN KEY (`replyer_id`) REFERENCES `jb_user` (`user_id`),
  CONSTRAINT `FK_BBS_FORUM_WEBSITE` FOREIGN KEY (`SITE_ID`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='论坛板块';

-- ----------------------------
-- Records of bbs_forum
-- ----------------------------
INSERT INTO `bbs_forum` VALUES ('1', '7', '1', '227', '16', 'jyzj', '检验之家', '', '检验之家', '', '0', '1', '6', '0', '', '5', '0', '100', '2017-01-24 15:46:39', '0', 'admin', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `bbs_forum` VALUES ('3', '7', '1', '243', '23', 'jyzs', '检验综述', '', '', '', '1', '2', '6', '0', '', '5', '0', '100', '2017-01-24 18:56:00', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('4', '3', '1', '259', '24', 'nk', '内科', '', '内科', '', '0', '3', '7', '0', '', '5', '0', '100', '2017-01-24 19:35:24', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('5', '2', '1', '269', '24', 'yxcs', '影像和超声', '', '影像和超声', '', '10', '6', '22', '0', '', '5', '0', '100', '2017-01-24 20:10:44', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('6', '1', '1', '286', '38', 'zzbl', '组织病例', '', '组织病例', '', '0', '5', '13', '0', '', '5', '0', '100', '2017-02-14 22:01:05', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '0', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('7', '1', '1', null, null, 'xbbl', '细胞病例', '细胞病例细胞病例细胞病例', '细胞病例', '', '1', '0', '0', '0', '', '5', '0', '100', null, '0', 'admin', ',113,2,', ',113,2,', ',113,2,', '1', '1', '0', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('8', '1', '1', '288', '39', 'bljs', '病理技术', '', '病理技术', '', '2', '3', '4', '0', '', '5', '0', '100', '2017-02-14 22:12:19', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '0', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('9', '1', '1', '272', '25', 'fzbl', '分子病理', '', '分子病理', '', '3', '1', '1', '0', '', '5', '0', '100', '2017-01-25 00:11:53', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '0', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('10', '1', '1', '266', '24', 'sjtl', '尸检讨论', '', '尸检讨论', '', '4', '1', '1', '0', '', '5', '0', '100', '2017-01-24 20:02:55', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '0', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('11', '1', '1', '273', '25', 'zlkz', '质量控制', '', '质量控制', '', '5', '1', '1', '0', '', '5', '0', '100', '2017-01-25 00:12:18', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '0', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('14', '3', '1', '280', '5', 'wk', '外科', '', '外科', '', '1', '1', '2', '0', '', '5', '0', '100', '2017-02-10 10:28:13', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('15', '3', '1', '275', '25', 'fk', '妇科', '', '妇科', '', '2', '1', '1', '0', '', '5', '0', '100', '2017-01-25 00:12:57', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('16', '3', '1', '277', '25', 'ek', '儿科', '', '儿科', '', '10', '1', '1', '0', '', '5', '0', '100', '2017-01-25 00:13:38', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('17', '3', '1', '279', '5', 'qt', '其他', '', '其他', '', '4', '2', '2', '0', '', '5', '0', '100', '2017-02-06 17:44:20', '0', '', ',14,1,3,4,5,6,7,8,9,10,11,113,2,', ',14,1,3,4,5,6,7,8,9,10,11,113,2,', ',14,1,3,4,5,6,7,8,9,10,11,113,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('18', '4', '1', '278', '5', 'xlzx', '心理咨询', '', '心理咨询', '', '0', '1', '1', '0', '', '5', '0', '100', '2017-02-06 17:42:56', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('19', '5', '1', null, null, 'zygc', '中医国粹', '', '中医国粹', '', '10', '0', '0', '0', '', '5', '0', '100', null, '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('20', '6', '1', null, null, 'zyhx', '资源教学', '', '资源教学', '', '10', '0', '0', '0', '', '5', '0', '100', null, '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('21', '8', '1', null, null, 'qccp', '器材产品', '', '器材产品', '', '10', '0', '0', '0', '', '5', '0', '100', null, '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('22', '10', '1', null, null, 'ylyd', '娱乐园地', '', '娱乐园地', '', '10', '0', '0', '0', '', '5', '0', '100', null, '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('23', '12', '1', '271', '25', 'xxfb', '信息发布', '', '信息发布', '', '0', '1', '4', '0', '', '5', '0', '100', '2017-01-24 23:37:01', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('24', '12', '1', null, null, 'qzzp', '求职招聘', '', '求职招聘', '', '1', '0', '0', '0', '', '5', '0', '100', null, '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('25', '12', '1', '267', '24', 'bwgl', '版务管理', '', '版务管理', '', '2', '1', '12', '0', '', '5', '0', '100', '2017-01-24 20:07:43', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');
INSERT INTO `bbs_forum` VALUES ('26', '12', '1', '260', '24', 'jzls', '建站历史', '', '建站历史', '', '3', '1', '3', '0', '', '5', '0', '100', '2017-01-24 19:36:35', '0', '', ',14,113,1,2,', ',14,113,1,2,', ',14,113,1,2,', '1', '1', '1', '0', '1', '2', '3', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_grade
-- ----------------------------
INSERT INTO `bbs_grade` VALUES ('1', '11', '205', '0', '', '2017-01-17 16:05:07');
INSERT INTO `bbs_grade` VALUES ('2', '9', '201', '0', '我很赞同', '2017-01-17 16:06:02');
INSERT INTO `bbs_grade` VALUES ('3', '18', '213', '0', '我很赞同', '2017-01-24 18:04:51');

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
) ENGINE=InnoDB AUTO_INCREMENT=912 DEFAULT CHARSET=utf8 COMMENT='登录日志';

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
INSERT INTO `bbs_login_log` VALUES ('878', '5', '2017-01-14 01:37:44', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('879', '5', '2017-01-14 01:38:06', null, '0:0:0:0:0:0:0:1');
INSERT INTO `bbs_login_log` VALUES ('880', '5', '2017-01-14 01:38:28', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('881', '5', '2017-01-14 01:39:36', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('882', '5', '2017-01-14 01:44:54', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('883', '5', '2017-01-14 19:36:39', null, '192.168.1.101');
INSERT INTO `bbs_login_log` VALUES ('884', '5', '2017-01-14 19:52:53', null, '192.168.1.101');
INSERT INTO `bbs_login_log` VALUES ('885', '5', '2017-01-15 10:58:30', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('886', '6', '2017-01-15 11:00:41', null, '127.0.0.1');
INSERT INTO `bbs_login_log` VALUES ('887', '5', '2017-01-16 18:33:52', null, '192.168.1.147');
INSERT INTO `bbs_login_log` VALUES ('888', '5', '2017-01-17 09:12:21', null, '117.175.128.162');
INSERT INTO `bbs_login_log` VALUES ('889', '5', '2017-01-17 16:08:00', null, '182.138.200.232');
INSERT INTO `bbs_login_log` VALUES ('890', '5', '2017-01-17 16:21:56', null, '182.138.200.232');
INSERT INTO `bbs_login_log` VALUES ('891', '5', '2017-01-17 17:55:04', null, '117.175.128.162');
INSERT INTO `bbs_login_log` VALUES ('892', '5', '2017-01-17 19:01:14', null, '117.175.128.162');
INSERT INTO `bbs_login_log` VALUES ('893', '5', '2017-01-17 21:53:35', null, '117.175.128.162');
INSERT INTO `bbs_login_log` VALUES ('894', '5', '2017-01-18 08:58:50', null, '117.173.132.144');
INSERT INTO `bbs_login_log` VALUES ('895', '5', '2017-01-18 09:06:48', null, '117.173.132.144');
INSERT INTO `bbs_login_log` VALUES ('896', '6', '2017-01-19 14:04:24', null, '117.175.132.60');
INSERT INTO `bbs_login_log` VALUES ('897', '5', '2017-01-19 16:41:34', null, '182.138.200.232');
INSERT INTO `bbs_login_log` VALUES ('898', '5', '2017-01-19 17:49:48', null, '117.175.132.60');
INSERT INTO `bbs_login_log` VALUES ('899', '5', '2017-01-19 18:16:02', null, '117.175.132.60');
INSERT INTO `bbs_login_log` VALUES ('900', '5', '2017-01-19 18:20:10', null, '117.175.132.60');
INSERT INTO `bbs_login_log` VALUES ('901', '5', '2017-01-21 22:38:15', null, '101.207.227.67');
INSERT INTO `bbs_login_log` VALUES ('902', '5', '2017-01-22 01:53:23', null, '101.207.227.1');
INSERT INTO `bbs_login_log` VALUES ('903', '6', '2017-01-22 11:40:29', null, '223.87.240.174');
INSERT INTO `bbs_login_log` VALUES ('904', '6', '2017-01-22 11:42:35', null, '223.87.240.174');
INSERT INTO `bbs_login_log` VALUES ('905', '5', '2017-01-22 13:28:11', null, '223.87.240.174');
INSERT INTO `bbs_login_log` VALUES ('906', '6', '2017-01-22 17:43:32', null, '223.87.240.174');
INSERT INTO `bbs_login_log` VALUES ('907', '6', '2017-01-23 11:55:56', null, '117.174.30.239');
INSERT INTO `bbs_login_log` VALUES ('908', '5', '2017-01-24 15:45:48', null, '110.184.35.37');
INSERT INTO `bbs_login_log` VALUES ('909', '5', '2017-01-25 09:40:42', null, '117.174.29.135');
INSERT INTO `bbs_login_log` VALUES ('910', '5', '2017-01-25 09:41:14', null, '117.174.29.135');
INSERT INTO `bbs_login_log` VALUES ('911', '5', '2017-01-25 13:37:48', null, '110.184.35.37');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='道具记录表';

-- ----------------------------
-- Records of bbs_magic_log
-- ----------------------------
INSERT INTO `bbs_magic_log` VALUES ('1', '6', '5', '2015-02-04 14:58:21', '3', '10', '1', null);
INSERT INTO `bbs_magic_log` VALUES ('2', '10', '5', '2015-02-04 14:58:27', '3', '10', '1', null);
INSERT INTO `bbs_magic_log` VALUES ('3', '6', '5', '2017-02-10 10:28:23', '1', '10', '1', null);

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
INSERT INTO `bbs_member_magic` VALUES ('1', '5', '6', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COMMENT='主题、帖子操作记录';

-- ----------------------------
-- Records of bbs_operation
-- ----------------------------
INSERT INTO `bbs_operation` VALUES ('330', '1', '5', 'POST', '186', '屏蔽', null, '2017-01-14 01:48:43');
INSERT INTO `bbs_operation` VALUES ('331', '1', '5', 'POST', '186', '取消屏蔽', null, '2017-01-14 01:48:48');
INSERT INTO `bbs_operation` VALUES ('332', '1', '5', 'POST', '188', '屏蔽', null, '2017-01-17 15:21:28');
INSERT INTO `bbs_operation` VALUES ('333', '1', '5', 'POST', '188', '取消屏蔽', null, '2017-01-17 15:21:37');
INSERT INTO `bbs_operation` VALUES ('334', '1', '11', 'POST', '200', '编辑', null, '2017-01-17 16:27:20');
INSERT INTO `bbs_operation` VALUES ('335', '1', '5', 'TOPI', '71', '精华', '精品文章', '2017-01-17 16:57:08');
INSERT INTO `bbs_operation` VALUES ('336', '1', '5', 'TOPI', '71', '高亮', '', '2017-01-17 16:57:19');
INSERT INTO `bbs_operation` VALUES ('337', '1', '5', 'TOPI', '65', '置顶', '', '2017-01-17 16:57:39');
INSERT INTO `bbs_operation` VALUES ('338', '1', '6', 'TOPI', '67', '精华', '精品文章', '2017-01-18 17:32:51');
INSERT INTO `bbs_operation` VALUES ('339', '1', '5', 'POST', '186', '编辑', null, '2017-02-08 16:26:14');
INSERT INTO `bbs_operation` VALUES ('340', '1', '5', 'POST', '186', '编辑', null, '2017-02-08 16:29:53');
INSERT INTO `bbs_operation` VALUES ('341', '1', '5', 'POST', '186', '编辑', null, '2017-02-08 16:30:48');
INSERT INTO `bbs_operation` VALUES ('342', '1', '5', 'POST', '186', '编辑', null, '2017-02-08 17:25:13');
INSERT INTO `bbs_operation` VALUES ('343', '1', '5', 'POST', '264', '编辑', null, '2017-02-13 18:19:42');
INSERT INTO `bbs_operation` VALUES ('344', '1', '5', 'POST', '282', '编辑', null, '2017-02-13 18:30:23');
INSERT INTO `bbs_operation` VALUES ('345', '1', '39', 'POST', '287', '编辑', null, '2017-02-14 22:03:43');
INSERT INTO `bbs_operation` VALUES ('346', '1', '39', 'POST', '288', '编辑', null, '2017-02-14 22:12:39');

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
INSERT INTO `bbs_permission` VALUES ('13', 'allow_attach', 'true');
INSERT INTO `bbs_permission` VALUES ('13', 'allow_reply', 'true');
INSERT INTO `bbs_permission` VALUES ('13', 'allow_topic', 'true');
INSERT INTO `bbs_permission` VALUES ('13', 'attach_max_size', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'attach_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'attach_type', '');
INSERT INTO `bbs_permission` VALUES ('13', 'edit_limit_minute', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'favorite_count', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'msg_count', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'msg_interval', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'msg_per_day', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('13', 'post_per_day', '0');
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
INSERT INTO `bbs_permission` VALUES ('1', 'msg_per_day', '1000');
INSERT INTO `bbs_permission` VALUES ('1', 'post_interval', '0');
INSERT INTO `bbs_permission` VALUES ('1', 'post_per_day', '1000');
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
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COMMENT='论坛帖子';

-- ----------------------------
-- Records of bbs_post
-- ----------------------------
INSERT INTO `bbs_post` VALUES ('186', '65', '1', '1', '5', '5', '2017-01-14 01:13:05', '127.0.0.1', '2017-02-08 17:25:13', '127.0.0.1', '4', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('200', '67', '1', '1', '11', '11', '2017-01-17 15:54:13', '182.138.200.232', '2017-01-17 16:27:20', '182.138.200.232', '1', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('201', '68', '1', '1', null, '5', '2017-01-17 15:55:30', '182.138.200.232', null, null, '0', '1', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('202', '69', '1', '1', null, '5', '2017-01-17 15:56:00', '182.138.200.232', null, null, '0', '1', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('203', '68', '1', '1', null, '11', '2017-01-17 15:56:18', '182.138.200.232', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('204', '68', '1', '1', null, '5', '2017-01-17 16:03:37', '182.138.200.232', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('205', '68', '1', '1', null, '9', '2017-01-17 16:04:07', '182.138.200.232', null, null, '0', '4', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('209', '67', '1', '1', null, '11', '2017-01-17 16:27:51', '182.138.200.232', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('210', '67', '1', '1', null, '11', '2017-01-17 16:28:00', '182.138.200.232', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('211', '71', '1', '1', null, '5', '2017-01-17 16:54:20', '182.138.200.232', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('212', '67', '1', '1', null, '5', '2017-01-17 18:41:42', '117.175.128.162', null, null, '0', '4', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('213', '72', '1', '1', null, '5', '2017-01-18 00:32:59', '101.207.231.72', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('218', '75', '1', '1', null, '6', '2017-01-18 18:30:23', '182.150.160.76', null, null, '0', '1', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('219', '71', '1', '1', null, '5', '2017-01-19 13:52:33', '117.175.132.60', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('220', '76', '1', '1', null, '5', '2017-01-21 22:41:32', '101.207.227.70', null, null, '0', '1', '0', '0', '0', '5', '0');
INSERT INTO `bbs_post` VALUES ('221', '77', '1', '1', null, '16', '2017-01-24 13:20:37', '110.22.22.220', null, null, '0', '1', '0', '0', '0', '3', '0');
INSERT INTO `bbs_post` VALUES ('222', '77', '1', '1', null, '16', '2017-01-24 13:20:46', '110.22.22.220', null, null, '0', '2', '0', '0', '0', '3', '0');
INSERT INTO `bbs_post` VALUES ('223', '77', '1', '1', null, '16', '2017-01-24 13:23:08', '110.22.22.220', null, null, '0', '3', '0', '0', '0', '3', '0');
INSERT INTO `bbs_post` VALUES ('224', '77', '1', '1', null, '16', '2017-01-24 13:23:15', '110.22.22.220', null, null, '0', '4', '0', '0', '0', '3', '0');
INSERT INTO `bbs_post` VALUES ('225', '77', '1', '1', null, '16', '2017-01-24 13:24:05', '110.22.22.220', null, null, '0', '5', '0', '0', '0', '3', '0');
INSERT INTO `bbs_post` VALUES ('226', '72', '1', '1', null, '16', '2017-01-24 13:25:43', '110.22.22.220', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('227', '77', '1', '1', null, '16', '2017-01-24 15:46:39', '110.22.22.220', null, null, '0', '6', '0', '0', '0', '3', '0');
INSERT INTO `bbs_post` VALUES ('228', '78', '1', '1', null, '18', '2017-01-24 17:12:58', '110.22.22.220', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('229', '78', '1', '1', null, '21', '2017-01-24 17:21:49', '171.214.210.223', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('230', '79', '1', '1', null, '18', '2017-01-24 17:27:50', '110.22.22.220', null, null, '0', '1', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('231', '79', '1', '1', null, '18', '2017-01-24 17:29:06', '110.22.22.220', null, null, '0', '2', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('232', '79', '1', '1', null, '19', '2017-01-24 17:33:33', '211.101.240.18', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('233', '79', '1', '1', null, '19', '2017-01-24 17:33:51', '211.101.240.18', null, null, '0', '4', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('234', '79', '1', '1', null, '19', '2017-01-24 17:37:02', '211.101.240.18', null, null, '0', '5', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('235', '79', '1', '1', null, '19', '2017-01-24 17:37:43', '211.101.240.18', null, null, '0', '6', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('236', '79', '1', '1', null, '18', '2017-01-24 17:38:09', '110.22.22.220', null, null, '0', '7', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('237', '79', '1', '1', null, '18', '2017-01-24 17:40:01', '110.22.22.220', null, null, '0', '8', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('238', '79', '1', '1', null, '19', '2017-01-24 17:59:06', '211.101.240.18', null, null, '0', '9', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('239', '72', '1', '1', null, '18', '2017-01-24 18:05:55', '110.22.22.220', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('240', '72', '1', '1', null, '18', '2017-01-24 18:06:15', '110.22.22.220', null, null, '0', '4', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('241', '65', '1', '1', null, '23', '2017-01-24 18:53:22', '180.212.194.81', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('242', '65', '1', '1', null, '23', '2017-01-24 18:55:48', '180.212.194.81', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('243', '65', '1', '1', null, '23', '2017-01-24 18:56:00', '180.212.194.81', null, null, '0', '4', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('244', '80', '1', '1', null, '24', '2017-01-24 19:10:41', '180.212.194.81', null, null, '0', '1', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('245', '80', '1', '1', null, '24', '2017-01-24 19:11:21', '180.212.194.81', null, null, '0', '2', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('246', '80', '1', '1', null, '24', '2017-01-24 19:11:31', '180.212.194.81', null, null, '0', '3', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('247', '80', '1', '1', null, '24', '2017-01-24 19:11:41', '180.212.194.81', null, null, '0', '4', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('248', '79', '1', '1', null, '24', '2017-01-24 19:16:28', '180.212.194.81', null, null, '0', '10', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('249', '79', '1', '1', null, '24', '2017-01-24 19:17:38', '180.212.194.81', null, null, '0', '11', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('250', '72', '1', '1', null, '24', '2017-01-24 19:20:09', '180.212.194.81', null, null, '0', '5', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('251', '72', '1', '1', null, '24', '2017-01-24 19:27:14', '180.212.194.81', null, null, '0', '6', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('252', '72', '1', '1', null, '24', '2017-01-24 19:27:32', '180.212.194.81', null, null, '0', '7', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('253', '72', '1', '1', null, '24', '2017-01-24 19:28:24', '180.212.194.81', null, null, '0', '8', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('254', '72', '1', '1', null, '24', '2017-01-24 19:28:56', '180.212.194.81', null, null, '0', '9', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('255', '72', '1', '1', null, '24', '2017-01-24 19:30:04', '180.212.194.81', null, null, '0', '10', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('256', '72', '1', '1', null, '24', '2017-01-24 19:30:20', '180.212.194.81', null, null, '0', '11', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('257', '81', '1', '1', null, '24', '2017-01-24 19:32:22', '180.212.194.81', null, null, '0', '1', '0', '0', '0', '10', '0');
INSERT INTO `bbs_post` VALUES ('258', '81', '1', '1', null, '24', '2017-01-24 19:32:29', '180.212.194.81', null, null, '0', '2', '0', '0', '0', '10', '0');
INSERT INTO `bbs_post` VALUES ('259', '69', '1', '1', null, '24', '2017-01-24 19:35:24', '180.212.194.81', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('260', '78', '1', '1', null, '24', '2017-01-24 19:36:35', '180.212.194.81', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('261', '82', '1', '1', null, '24', '2017-01-24 19:39:14', '180.212.194.81', null, null, '0', '1', '0', '1', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('262', '83', '1', '1', null, '24', '2017-01-24 19:56:19', '180.212.194.81', null, null, '0', '1', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('263', '83', '1', '1', null, '24', '2017-01-24 19:56:33', '180.212.194.81', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('264', '84', '1', '1', '5', '24', '2017-01-24 19:58:42', '180.212.194.81', '2017-02-13 18:19:42', '127.0.0.1', '1', '1', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('265', '85', '1', '1', null, '24', '2017-01-24 19:59:28', '180.212.194.81', null, null, '0', '1', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('266', '86', '1', '1', null, '24', '2017-01-24 20:02:55', '180.212.194.81', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('267', '79', '1', '1', null, '24', '2017-01-24 20:07:43', '180.212.194.81', null, null, '0', '12', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('268', '87', '1', '1', null, '24', '2017-01-24 20:10:15', '180.212.194.81', null, null, '0', '1', '0', '1', '0', '5', '0');
INSERT INTO `bbs_post` VALUES ('269', '87', '1', '1', null, '24', '2017-01-24 20:10:44', '180.212.194.81', null, null, '0', '2', '0', '0', '0', '5', '0');
INSERT INTO `bbs_post` VALUES ('270', '83', '1', '1', null, '25', '2017-01-24 23:36:33', '221.203.80.59', null, null, '0', '3', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('271', '83', '1', '1', null, '25', '2017-01-24 23:37:01', '221.203.80.59', null, null, '0', '4', '0', '1', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('272', '88', '1', '1', null, '25', '2017-01-25 00:11:53', '221.203.80.59', null, null, '0', '1', '0', '0', '0', '11', '0');
INSERT INTO `bbs_post` VALUES ('273', '89', '1', '1', null, '25', '2017-01-25 00:12:18', '221.203.80.59', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('274', '90', '1', '1', null, '25', '2017-01-25 00:12:37', '221.203.80.59', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('275', '91', '1', '1', null, '25', '2017-01-25 00:12:57', '221.203.80.59', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('276', '92', '1', '1', null, '25', '2017-01-25 00:13:16', '221.203.80.59', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('277', '93', '1', '1', null, '25', '2017-01-25 00:13:38', '221.203.80.59', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('278', '94', '1', '1', null, '5', '2017-02-06 17:42:56', '127.0.0.1', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('279', '95', '1', '1', null, '5', '2017-02-06 17:44:20', '127.0.0.1', null, null, '0', '1', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('280', '90', '1', '1', null, '5', '2017-02-10 10:28:13', '127.0.0.1', null, null, '0', '2', '0', '0', '0', '1', '0');
INSERT INTO `bbs_post` VALUES ('281', '84', '1', '1', null, '5', '2017-02-13 18:26:26', '127.0.0.1', null, null, '0', '2', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('282', '84', '1', '1', '5', '5', '2017-02-13 18:29:25', '127.0.0.1', '2017-02-13 18:30:23', '127.0.0.1', '1', '3', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('283', '84', '1', '1', null, '5', '2017-02-13 18:31:10', '127.0.0.1', null, null, '0', '4', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('284', '84', '1', '1', null, '5', '2017-02-13 18:54:28', '127.0.0.1', null, null, '0', '5', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('285', '84', '1', '1', null, '5', '2017-02-13 18:55:27', '127.0.0.1', null, null, '0', '6', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('286', '96', '1', '1', null, '38', '2017-02-14 22:01:05', '42.122.139.53', null, null, '0', '1', '0', '0', '0', '8', '0');
INSERT INTO `bbs_post` VALUES ('287', '97', '1', '1', '39', '39', '2017-02-14 22:03:16', '42.122.139.53', '2017-02-14 22:03:43', '42.122.139.53', '1', '1', '0', '0', '0', '10', '0');
INSERT INTO `bbs_post` VALUES ('288', '98', '1', '1', '39', '39', '2017-02-14 22:12:19', '42.122.139.53', '2017-02-14 22:12:39', '42.122.139.53', '1', '1', '0', '0', '0', '10', '0');

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
INSERT INTO `bbs_post_text` VALUES ('186', '这个病例诊断什么？巨细胞修复性肉芽肿？骨巨细胞瘤？', '<p style=\"line-height: 16px;\"><img src=\"http://bbs.caihongyixue.com/thirdparty/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/u/bbs/file/20170208/1486542590048034632.jpg\" title=\"bx.jpg\">bx.jpg</a></p><p>性别	男	\r\n年龄	36	\r\n临床诊断	右颞叶巨大占位\r\n一般病史	右耳鸣2月余，渐行加重。CT示右颞叶环形高密度影。\r\n标本名称	右颞叶占位组织\r\n大体所见	术中所见：右颞叶弧形切口，暴露颧弓根部，切开颞肌，见颞部肌肉近颅骨侧血供丰富伴肿瘤组织侵袭。颞骨见肿瘤组织侵袭伴4*4cm大小颅骨缺损。开骨窗后，见颅骨下硬膜外巨大灰白色肿瘤，与周围硬脑膜及颅骨粘连紧密，肿瘤大小约6*5*5cm。内侧侵及颅骨岩骨段，外侧侵及内听道及气房乳突。肿瘤血供丰富，质松脆，实质呈鱼肉状，瘤内多发钙化及囊变。</p><p style=\"line-height: 16px;\"><img src=\"http://bbs.caihongyixue.com/thirdparty/ueditor/dialogs/attachment/fileTypeImages/icon_doc.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/u/bbs/file/20170208/1486542646033024060.docx\" title=\"关于目前一些问题及建议.docx\">关于目前一些问题及建议.docx</a></p><p style=\"line-height: 16px;\"><img src=\"http://bbs.caihongyixue.com/thirdparty/ueditor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/u/bbs/file/20170208/1486545906137041784.jpg\" title=\"IMG_1043.jpg\">IMG_1043.jpg</a></p><p><br/></p>');
INSERT INTO `bbs_post_text` VALUES ('200', '测试测试', '[smiley=11]测试123');
INSERT INTO `bbs_post_text` VALUES ('201', '细胞学', '[attachment]2[/attachment]');
INSERT INTO `bbs_post_text` VALUES ('202', '组织学', '[attachment]3[/attachment]');
INSERT INTO `bbs_post_text` VALUES ('203', '', '测试测试速度很好');
INSERT INTO `bbs_post_text` VALUES ('204', '', '[smiley=11]');
INSERT INTO `bbs_post_text` VALUES ('205', '', '[smiley=11]');
INSERT INTO `bbs_post_text` VALUES ('209', '', '[smiley=11]回[smiley=11]复第1楼');
INSERT INTO `bbs_post_text` VALUES ('210', '', '[smiley=15]回复第2楼');
INSERT INTO `bbs_post_text` VALUES ('211', '你怎么女卡戴珊vnklanfvakln', '[smiley=4][smiley=4][smiley=4]');
INSERT INTO `bbs_post_text` VALUES ('212', '', '回复第2楼[smiley=3][smiley=3][smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('213', '那个方法好', '阿斯顿发发骚');
INSERT INTO `bbs_post_text` VALUES ('218', '123123123', '[attachment]8[/attachment][attachment]9[/attachment]');
INSERT INTO `bbs_post_text` VALUES ('219', '', '[smiley=7][smiley=7][smiley=7][smiley=7][smiley=7]');
INSERT INTO `bbs_post_text` VALUES ('220', 'test', '[smiley=3][smiley=3][smiley=3][smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('221', 'cash', 'cesgu[smiley=4][smiley=4]');
INSERT INTO `bbs_post_text` VALUES ('222', '', '1111111');
INSERT INTO `bbs_post_text` VALUES ('223', '', '[smiley=4]回[smiley=4]复第2楼');
INSERT INTO `bbs_post_text` VALUES ('224', '', '[smiley=18][[smiley=18]quote][smiley=4]回[smiley=4]复第2楼[/quote]');
INSERT INTO `bbs_post_text` VALUES ('225', '', ' 我们的田野，美丽的的田野');
INSERT INTO `bbs_post_text` VALUES ('226', '', '[smiley=16][smiley=16][smiley=16][smiley=16]');
INSERT INTO `bbs_post_text` VALUES ('227', '', 'wanwan');
INSERT INTO `bbs_post_text` VALUES ('228', '2017年1月24日星期二', '\r\n测试小组成立，今晚8点开始测试论坛。');
INSERT INTO `bbs_post_text` VALUES ('229', '', '我来报道');
INSERT INTO `bbs_post_text` VALUES ('230', '新年快乐', '新年快乐');
INSERT INTO `bbs_post_text` VALUES ('231', '新年好啊', '\r\n新年好啊[attachment]10[/attachment][attachment]11[/attachment]');
INSERT INTO `bbs_post_text` VALUES ('232', 'nihao', '[smiley=2]');
INSERT INTO `bbs_post_text` VALUES ('233', 'lallala', '[smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('234', 'Daisy', '你好呀');
INSERT INTO `bbs_post_text` VALUES ('235', 'nihao', 'hello');
INSERT INTO `bbs_post_text` VALUES ('236', '', '好啊好啊\r\n');
INSERT INTO `bbs_post_text` VALUES ('237', '', '回复第5楼你的个性化签名很好啊，我也去添加一个签名啦啦啦啦');
INSERT INTO `bbs_post_text` VALUES ('238', '', '回复第8楼 好呀，哈哈');
INSERT INTO `bbs_post_text` VALUES ('239', '', '[smiley=7][[smiley=7]quote][smiley=16][smiley=16][smiley=16][smiley=16][/quote]');
INSERT INTO `bbs_post_text` VALUES ('240', '', '[smiley=5][[smiley=5]q[smiley=5]u[smiley=5]ote][smiley=7][[smiley=7]quote][smiley=16][smiley=16][smiley=16][smiley=16][/quote][/quote]');
INSERT INTO `bbs_post_text` VALUES ('241', '', '大体所见	术中所见：右颞叶弧形切口，暴露颧弓根部，切开颞肌，见颞部肌肉近颅骨侧血供丰富伴肿瘤组织侵袭。颞骨见肿瘤组织侵袭伴4*4cm大小颅骨缺损。开骨窗后，见颅骨下硬膜外巨大灰白色肿瘤，与周围硬脑膜及颅骨粘连紧密，肿瘤大小约6*5*5cm。内侧侵及颅骨岩骨段，外侧侵及内听道及气房乳突。肿瘤');
INSERT INTO `bbs_post_text` VALUES ('242', '', '[quote]大体所见	术中所见：右颞叶弧形切口，暴露颧弓根部，切开颞肌，见颞部肌肉近颅骨侧血供丰富伴肿瘤组织侵袭。颞骨见肿瘤组织侵袭伴4*4cm大小颅骨缺损。开骨窗后，见颅骨下硬膜外巨大灰白色肿瘤，与周围硬脑膜及颅骨粘连紧密，肿瘤大小约6*5*5cm。内侧侵及颅骨岩骨段，外侧侵及内听道及气房乳突。肿瘤[/quote]');
INSERT INTO `bbs_post_text` VALUES ('243', '', '回复第3楼qwqwqwwq');
INSERT INTO `bbs_post_text` VALUES ('244', '病理学的作用', '病理学的作用');
INSERT INTO `bbs_post_text` VALUES ('245', '', '123212');
INSERT INTO `bbs_post_text` VALUES ('246', '', '[quote]123212[/quote]6666');
INSERT INTO `bbs_post_text` VALUES ('247', '', '回复第3楼6699');
INSERT INTO `bbs_post_text` VALUES ('248', '', '222');
INSERT INTO `bbs_post_text` VALUES ('249', '333', '[quote][/quote]');
INSERT INTO `bbs_post_text` VALUES ('250', '', '[smiley=3][smiley=3][smiley=3][smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('251', '', '问问[smiley=3][smiley=7]');
INSERT INTO `bbs_post_text` VALUES ('252', '', '回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。[smiley=8][smiley=12][smiley=14][smiley=16]');
INSERT INTO `bbs_post_text` VALUES ('253', '', '232323323');
INSERT INTO `bbs_post_text` VALUES ('254', '', '回复[smiley=3]中[smiley=2] [smiley=7]填[smiley=2]加[smiley=4]不[smiley=6]了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。回复中 填加不了图片。');
INSERT INTO `bbs_post_text` VALUES ('255', '', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。');
INSERT INTO `bbs_post_text` VALUES ('256', '', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料[smiley=3]，[smiley=3]修[smiley=3]改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。');
INSERT INTO `bbs_post_text` VALUES ('257', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。');
INSERT INTO `bbs_post_text` VALUES ('258', '', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。');
INSERT INTO `bbs_post_text` VALUES ('259', '', '五、自己发的回复 不能删除。');
INSERT INTO `bbs_post_text` VALUES ('260', '', '[smiley=3][smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('261', '彩虹医生论坛测试结果', '222');
INSERT INTO `bbs_post_text` VALUES ('262', '彩虹医生论坛测试结果.docx', '彩虹医生论坛测试结果.docx');
INSERT INTO `bbs_post_text` VALUES ('263', '', '56565');
INSERT INTO `bbs_post_text` VALUES ('264', '钱物轻微', '<p>afasfasfafafasf</p>');
INSERT INTO `bbs_post_text` VALUES ('265', '1223', '2233232323232');
INSERT INTO `bbs_post_text` VALUES ('266', '1231', '钱物轻微 ');
INSERT INTO `bbs_post_text` VALUES ('267', '', '回复第10楼666');
INSERT INTO `bbs_post_text` VALUES ('268', '八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。', '八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。');
INSERT INTO `bbs_post_text` VALUES ('269', '', '八、发起投票只有神[smiley=20]经[smiley=20]内科。');
INSERT INTO `bbs_post_text` VALUES ('270', '', '[smiley=3][smiley=3][smiley=3][smiley=3]aaaaaa');
INSERT INTO `bbs_post_text` VALUES ('271', '', '[smiley=3][smiley=3]');
INSERT INTO `bbs_post_text` VALUES ('272', 'ceshi', 'ceshi');
INSERT INTO `bbs_post_text` VALUES ('273', '123', '123');
INSERT INTO `bbs_post_text` VALUES ('274', '123', '123');
INSERT INTO `bbs_post_text` VALUES ('275', '123', '123');
INSERT INTO `bbs_post_text` VALUES ('276', '123', '1263');
INSERT INTO `bbs_post_text` VALUES ('277', '123', '123');
INSERT INTO `bbs_post_text` VALUES ('278', 'teset', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>');
INSERT INTO `bbs_post_text` VALUES ('279', 'tet', '<p>etetetasdfasfasfasf<img src=\"http://img.baidu.com/hi/jx2/j_0025.gif\"/></p>');
INSERT INTO `bbs_post_text` VALUES ('280', '', '<p>afasfasdfasfasdfasdf</p>');
INSERT INTO `bbs_post_text` VALUES ('281', '', '<blockquote class=\"uncited\"><p>afasfasfafafasf</p></blockquote>');
INSERT INTO `bbs_post_text` VALUES ('282', 'afasdfasdf', '<p>asfasfasfasdfasdf</p>');
INSERT INTO `bbs_post_text` VALUES ('283', '', '<blockquote class=\"uncited\"><p>afasfasfafafasfasdfasfa</p></blockquote>');
INSERT INTO `bbs_post_text` VALUES ('284', '', '<p>引用</p><p>afasfasfafafasf</p>');
INSERT INTO `bbs_post_text` VALUES ('285', '', '<p><img src=\"/u/bbs/image/20170213/1486983310959020924.jpg\" title=\"1486983310959020924.jpg\" alt=\"QQ图片20160928083813.jpg\" width=\"129\" height=\"133\"/></p>');
INSERT INTO `bbs_post_text` VALUES ('286', '彩虹岛之箭第一贴', '132彩虹岛之箭第一贴彩虹岛之箭第一贴彩虹岛之箭第一贴彩虹岛之箭第一贴');
INSERT INTO `bbs_post_text` VALUES ('287', '彩虹岛', '<p>请问其二</p><hr/><p><img src=\"/u/bbs/image/20170214/1487081015485031975.jpg\" title=\"1487081015485031975.jpg\" alt=\"图片1.jpg\"/></p>');
INSERT INTO `bbs_post_text` VALUES ('288', '234254', '<p>32452354325<img src=\"/u/bbs/image/20170214/1487081558537001166.jpg\" title=\"1487081558537001166.jpg\" alt=\"4545554.jpg\"/></p>');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_post_type
-- ----------------------------
INSERT INTO `bbs_post_type` VALUES ('1', '技术交流', '1', '1', '1', null);
INSERT INTO `bbs_post_type` VALUES ('2', '嘻嘻', '2', '1', '1', '1');
INSERT INTO `bbs_post_type` VALUES ('3', '哈哈', '3', '1', '1', '1');
INSERT INTO `bbs_post_type` VALUES ('4', '呜呜', '4', '1', '1', '1');
INSERT INTO `bbs_post_type` VALUES ('5', '细胞学', '1', '1', '5', null);
INSERT INTO `bbs_post_type` VALUES ('6', '神经病理', '1', '1', '3', null);
INSERT INTO `bbs_post_type` VALUES ('7', '组织学', '1', '1', '4', null);
INSERT INTO `bbs_post_type` VALUES ('8', '呼吸内科', '1', '1', '6', null);
INSERT INTO `bbs_post_type` VALUES ('9', '消化内科', '1', '1', '7', null);
INSERT INTO `bbs_post_type` VALUES ('10', '神经内科', '1', '1', '8', null);
INSERT INTO `bbs_post_type` VALUES ('11', '心血管内科', '1', '1', '9', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报记录';

-- ----------------------------
-- Records of bbs_report
-- ----------------------------
INSERT INTO `bbs_report` VALUES ('1', 'http：//localhost：8080/jsjl/33.jhtml＃pidnull', null, null, null, '0', '2014-11-20 15:29:36');
INSERT INTO `bbs_report` VALUES ('2', 'http://bbs.caihongyixue.com:80/xbx/68.jhtml#pid203', null, null, null, '0', '2017-01-17 15:57:04');
INSERT INTO `bbs_report` VALUES ('4', 'http://bbs.caihongyixue.com:80/blyj/70.jhtml#pid208', null, null, null, '0', '2017-01-17 16:24:42');
INSERT INTO `bbs_report` VALUES ('5', 'http://bbs.caihongyixue.com:80/yxcs/76.jhtml#pid220', null, null, null, '0', '2017-01-24 18:09:11');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报扩展';

-- ----------------------------
-- Records of bbs_report_ext
-- ----------------------------
INSERT INTO `bbs_report_ext` VALUES ('1', '1', '5', '2014-11-20 15:29:36', '<script＞alert(1)</script＞');
INSERT INTO `bbs_report_ext` VALUES ('2', '2', '11', '2017-01-17 15:57:04', '超级');
INSERT INTO `bbs_report_ext` VALUES ('4', '4', '11', '2017-01-17 16:24:42', '抄袭');
INSERT INTO `bbs_report_ext` VALUES ('5', '5', '18', '2017-01-24 18:09:11', 'buhaokan');

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
) ENGINE=InnoDB AUTO_INCREMENT=3142 DEFAULT CHARSET=utf8 COMMENT='论坛会话';

-- ----------------------------
-- Records of bbs_session
-- ----------------------------
INSERT INTO `bbs_session` VALUES ('3139', 'DC62287EBF49D2EC04F07DBC8DF547B3', null, '127.0.0.1', '2017-02-19 19:29:27', '2017-02-19 19:29:27');
INSERT INTO `bbs_session` VALUES ('3140', '43150F53D57A0B6500531A9B3CAC9DEE', null, '127.0.0.1', '2017-02-19 19:31:37', '2017-02-19 19:31:37');
INSERT INTO `bbs_session` VALUES ('3141', 'EB734F1C6BBC88A0B48D83F3F6D1C914', null, '127.0.0.1', '2017-02-19 19:36:54', '2017-02-19 19:36:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='论坛主题';

-- ----------------------------
-- Records of bbs_topic
-- ----------------------------
INSERT INTO `bbs_topic` VALUES ('65', '3', '243', '186', '1', '5', '23', '这个病例诊断什么？巨细胞修复性肉芽肿？骨巨细胞瘤？', '2017-01-14 01:13:05', '2017-01-24 18:56:00', '2017-01-24 18:56:00', '37', '3', '1', '0', '0', null, '0', '0', null, null, '0', ',23,', '0', '1', '1', '0', '0', null, '0', '23', '10', '0');
INSERT INTO `bbs_topic` VALUES ('67', '4', '212', '200', '1', '11', '5', '测试测试', '2017-01-17 15:54:13', '2017-01-17 18:41:42', '2017-01-17 18:41:42', '16', '3', '0', '1', '0', null, '0', '0', null, null, '0', ',11,5,', '1', '1', '1', '0', '0', null, '0', '9', '9', '0');
INSERT INTO `bbs_topic` VALUES ('68', '5', '205', '201', '1', '5', '9', '细胞学', '2017-01-17 15:55:30', '2017-01-17 16:04:07', '2017-01-17 16:04:07', '25', '3', '0', '0', '0', null, '0', '0', null, null, '1', ',11,5,9,', '1', '1', '1', '0', '0', null, '0', '24', '2', '0');
INSERT INTO `bbs_topic` VALUES ('69', '4', '259', '202', '1', '5', '24', '组织学', '2017-01-17 15:56:00', '2017-01-24 19:35:24', '2017-01-24 19:35:24', '17', '1', '0', '0', '0', null, '0', '0', null, null, '1', ',24,', '0', '1', '1', '0', '0', null, '0', '15', '15', '0');
INSERT INTO `bbs_topic` VALUES ('71', '3', '219', '211', '1', '5', '5', '你怎么女卡戴珊vnklanfvakln', '2017-01-17 16:54:20', '2017-01-19 13:52:33', '2017-01-19 13:52:33', '14', '1', '0', '1', '0', null, '0', '0', 'FF0000', null, '0', ',5,', '1', '1', '1', '0', '0', null, '0', '11', '11', '0');
INSERT INTO `bbs_topic` VALUES ('72', '5', '256', '213', '1', '5', '24', '那个方法好', '2017-01-18 00:32:59', '2017-01-24 19:30:20', '2017-01-24 19:30:20', '37', '10', '0', '0', '0', null, '0', '0', null, null, '0', ',16,18,24,', '0', '1', '1', '0', '0', null, '0', '27', '19', '0');
INSERT INTO `bbs_topic` VALUES ('75', '4', null, '218', '1', '6', '6', '123123123', '2017-01-18 18:30:23', '2017-01-18 18:30:23', '2017-01-18 18:30:23', '1', '0', '0', '0', '0', null, '0', '0', null, null, '1', ',', '0', '1', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('76', '5', null, '220', '1', '5', '5', 'test', '2017-01-21 22:41:32', '2017-01-21 22:41:32', '2017-01-21 22:41:32', '5', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '5', '1', '0', '1', '4', '0', '5', '5', '0');
INSERT INTO `bbs_topic` VALUES ('77', '1', '227', '221', '1', '16', '16', 'cash', '2017-01-24 13:20:37', '2017-01-24 15:46:39', '2017-01-24 15:46:39', '11', '5', '0', '0', '0', null, '0', '0', null, null, '0', ',16,', '0', '3', '1', '0', '0', null, '0', '6', '6', '0');
INSERT INTO `bbs_topic` VALUES ('78', '26', '260', '228', '1', '18', '24', '2017年1月24日星期二', '2017-01-24 17:12:58', '2017-01-24 19:36:35', '2017-01-24 19:36:35', '11', '2', '0', '0', '0', null, '0', '0', null, null, '0', ',21,24,', '0', '1', '1', '0', '0', null, '0', '9', '4', '0');
INSERT INTO `bbs_topic` VALUES ('79', '25', '267', '230', '1', '18', '24', '新年快乐', '2017-01-24 17:27:50', '2017-01-24 20:07:43', '2017-01-24 20:07:43', '28', '11', '0', '0', '0', null, '0', '0', null, null, '1', ',18,19,24,', '0', '1', '1', '0', '0', null, '0', '25', '2', '0');
INSERT INTO `bbs_topic` VALUES ('80', '6', '247', '244', '1', '24', '24', '病理学的作用', '2017-01-24 19:10:41', '2017-01-24 19:11:41', '2017-01-24 19:11:41', '13', '3', '0', '0', '0', null, '0', '0', null, null, '0', ',24,', '0', '8', '1', '0', '0', null, '0', '7', '1', '0');
INSERT INTO `bbs_topic` VALUES ('81', '8', '258', '257', '1', '24', '24', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完', '2017-01-24 19:32:22', '2017-01-24 19:32:29', '2017-01-24 19:32:29', '1', '1', '0', '0', '0', null, '0', '0', null, null, '0', ',24,', '0', '10', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('82', '6', null, '261', '1', '24', '24', '彩虹医生论坛测试结果', '2017-01-24 19:39:14', '2017-01-24 19:39:14', '2017-01-24 19:39:14', '12', '0', '0', '0', '0', null, '0', '0', null, null, '1', ',', '0', '8', '1', '0', '0', null, '0', '5', '2', '0');
INSERT INTO `bbs_topic` VALUES ('83', '23', '271', '262', '1', '24', '25', '彩虹医生论坛测试结果.docx', '2017-01-24 19:56:19', '2017-01-24 23:37:01', '2017-01-24 23:37:01', '3', '3', '0', '0', '0', null, '0', '0', null, null, '1', ',24,25,', '0', '1', '1', '0', '0', null, '0', '3', '3', '0');
INSERT INTO `bbs_topic` VALUES ('84', '6', '285', '264', '1', '24', '5', '钱物轻微', '2017-01-24 19:58:42', '2017-02-13 18:55:27', '2017-02-13 18:55:27', '11', '5', '0', '0', '0', null, '0', '0', null, null, '0', ',5,', '0', '8', '1', '0', '0', null, '0', '8', '6', '0');
INSERT INTO `bbs_topic` VALUES ('85', '6', null, '265', '1', '24', '24', '1223', '2017-01-24 19:59:28', '2017-01-24 19:59:28', '2017-01-24 19:59:28', '5', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '8', '1', '0', '1', '2', '0', '3', '1', '0');
INSERT INTO `bbs_topic` VALUES ('86', '10', null, '266', '1', '24', '24', '1231', '2017-01-24 20:02:55', '2017-01-24 20:02:55', '2017-01-24 20:02:55', '4', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '1', '1', '0', '4', '4', '0');
INSERT INTO `bbs_topic` VALUES ('87', '5', '269', '268', '1', '24', '24', '八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。', '2017-01-24 20:10:15', '2017-01-24 20:10:44', '2017-01-24 20:10:44', '9', '1', '0', '0', '0', null, '0', '0', null, null, '1', ',24,', '0', '5', '1', '0', '0', null, '0', '7', '7', '0');
INSERT INTO `bbs_topic` VALUES ('88', '9', null, '272', '1', '25', '25', 'ceshi', '2017-01-25 00:11:53', '2017-01-25 00:11:53', '2017-01-25 00:11:53', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '11', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('89', '11', null, '273', '1', '25', '25', '123', '2017-01-25 00:12:18', '2017-01-25 00:12:18', '2017-01-25 00:12:18', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('90', '14', '280', '274', '1', '25', '5', '123', '2017-01-25 00:12:37', '2017-02-10 10:28:13', '2017-02-10 10:28:13', '1', '1', '0', '0', '0', null, '0', '0', null, null, '0', ',5,', '0', '1', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('91', '15', null, '275', '1', '25', '25', '123', '2017-01-25 00:12:57', '2017-01-25 00:12:57', '2017-01-25 00:12:57', '0', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '0', '0', '0', '0');
INSERT INTO `bbs_topic` VALUES ('92', '17', null, '276', '1', '25', '25', '123', '2017-01-25 00:13:16', '2017-01-25 00:13:16', '2017-01-25 00:13:16', '0', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '0', '0', '0', '0');
INSERT INTO `bbs_topic` VALUES ('93', '16', null, '277', '1', '25', '25', '123', '2017-01-25 00:13:38', '2017-01-25 00:13:38', '2017-01-25 00:13:38', '5', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '0', '5', '5', '0');
INSERT INTO `bbs_topic` VALUES ('94', '18', null, '278', '1', '5', '5', 'teset', '2017-02-06 17:42:56', '2017-02-06 17:42:56', '2017-02-06 17:42:56', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('95', '17', null, '279', '1', '5', '5', 'tet', '2017-02-06 17:44:20', '2017-02-06 17:44:20', '2017-02-06 17:44:20', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '1', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('96', '6', null, '286', '1', '38', '38', '彩虹岛之箭第一贴', '2017-02-14 22:01:05', '2017-02-14 22:01:05', '2017-02-14 22:01:05', '33', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '8', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('97', '8', null, '287', '1', '39', '39', '彩虹岛', '2017-02-14 22:03:16', '2017-02-14 22:03:16', '2017-02-14 22:03:16', '3', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '10', '1', '0', '0', null, '0', '1', '1', '0');
INSERT INTO `bbs_topic` VALUES ('98', '8', null, '288', '1', '39', '39', '234254', '2017-02-14 22:12:19', '2017-02-14 22:12:19', '2017-02-14 22:12:19', '1', '0', '0', '0', '0', null, '0', '0', null, null, '0', ',', '0', '10', '1', '0', '0', null, '0', '1', '1', '0');

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
INSERT INTO `bbs_topic_text` VALUES ('67', '测试测试');
INSERT INTO `bbs_topic_text` VALUES ('68', '细胞学');
INSERT INTO `bbs_topic_text` VALUES ('69', '组织学');
INSERT INTO `bbs_topic_text` VALUES ('71', '你怎么女卡戴珊vnklanfvakln');
INSERT INTO `bbs_topic_text` VALUES ('72', '那个方法好');
INSERT INTO `bbs_topic_text` VALUES ('75', '123123123');
INSERT INTO `bbs_topic_text` VALUES ('76', 'test');
INSERT INTO `bbs_topic_text` VALUES ('77', 'cash');
INSERT INTO `bbs_topic_text` VALUES ('78', '2017年1月24日星期二');
INSERT INTO `bbs_topic_text` VALUES ('79', '新年快乐');
INSERT INTO `bbs_topic_text` VALUES ('80', '病理学的作用');
INSERT INTO `bbs_topic_text` VALUES ('81', '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完');
INSERT INTO `bbs_topic_text` VALUES ('82', '彩虹医生论坛测试结果');
INSERT INTO `bbs_topic_text` VALUES ('83', '彩虹医生论坛测试结果.docx');
INSERT INTO `bbs_topic_text` VALUES ('84', '钱物轻微');
INSERT INTO `bbs_topic_text` VALUES ('85', '1223');
INSERT INTO `bbs_topic_text` VALUES ('86', '1231');
INSERT INTO `bbs_topic_text` VALUES ('87', '八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。八、发起投票只有神经内科。');
INSERT INTO `bbs_topic_text` VALUES ('88', 'ceshi');
INSERT INTO `bbs_topic_text` VALUES ('89', '123');
INSERT INTO `bbs_topic_text` VALUES ('90', '123');
INSERT INTO `bbs_topic_text` VALUES ('91', '123');
INSERT INTO `bbs_topic_text` VALUES ('92', '123');
INSERT INTO `bbs_topic_text` VALUES ('93', '123');
INSERT INTO `bbs_topic_text` VALUES ('94', 'teset');
INSERT INTO `bbs_topic_text` VALUES ('95', 'tet');
INSERT INTO `bbs_topic_text` VALUES ('96', '彩虹岛之箭第一贴');
INSERT INTO `bbs_topic_text` VALUES ('97', '彩虹岛');
INSERT INTO `bbs_topic_text` VALUES ('98', '234254');

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
INSERT INTO `bbs_user_group` VALUES ('13', '1', '认证医生会员', '3', '10', '0', '0', '0', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=gbk COMMENT='用户在线时长统计';

-- ----------------------------
-- Records of bbs_user_online
-- ----------------------------
INSERT INTO `bbs_user_online` VALUES ('5', '0.00', '0.00', '0.00', '0.00', '0.01', '379.16');
INSERT INTO `bbs_user_online` VALUES ('6', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('7', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('8', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('9', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('10', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('11', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('14', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('15', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('16', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('17', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('18', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('19', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('20', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('21', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('22', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('23', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('24', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('25', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('26', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('27', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('29', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('30', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('31', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('32', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('33', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('34', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('35', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('36', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('37', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('38', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');
INSERT INTO `bbs_user_online` VALUES ('39', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_vote_item
-- ----------------------------
INSERT INTO `bbs_vote_item` VALUES ('1', '73', '1231', '1');
INSERT INTO `bbs_vote_item` VALUES ('2', '73', '123', '1');
INSERT INTO `bbs_vote_item` VALUES ('3', '73', '123', '0');
INSERT INTO `bbs_vote_item` VALUES ('4', '73', '', '0');
INSERT INTO `bbs_vote_item` VALUES ('5', '74', 'a,10', '1');
INSERT INTO `bbs_vote_item` VALUES ('6', '74', 'b,10', '1');
INSERT INTO `bbs_vote_item` VALUES ('7', '74', '', '0');
INSERT INTO `bbs_vote_item` VALUES ('8', '74', '', '0');
INSERT INTO `bbs_vote_item` VALUES ('9', '76', '11', '1');
INSERT INTO `bbs_vote_item` VALUES ('10', '76', '22', '1');
INSERT INTO `bbs_vote_item` VALUES ('11', '76', '333', '2');
INSERT INTO `bbs_vote_item` VALUES ('12', '76', '444', '0');
INSERT INTO `bbs_vote_item` VALUES ('13', '85', '1', '1');
INSERT INTO `bbs_vote_item` VALUES ('14', '85', '2', '0');
INSERT INTO `bbs_vote_item` VALUES ('15', '85', '3', '0');
INSERT INTO `bbs_vote_item` VALUES ('16', '85', '4', '0');
INSERT INTO `bbs_vote_item` VALUES ('17', '85', '5', '1');
INSERT INTO `bbs_vote_item` VALUES ('18', '86', '1', '1');
INSERT INTO `bbs_vote_item` VALUES ('19', '86', '2', '0');
INSERT INTO `bbs_vote_item` VALUES ('20', '86', '3', '0');
INSERT INTO `bbs_vote_item` VALUES ('21', '86', '', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bbs_vote_record
-- ----------------------------
INSERT INTO `bbs_vote_record` VALUES ('1', '5', '73', '2017-01-18 00:47:22');
INSERT INTO `bbs_vote_record` VALUES ('2', '6', '74', '2017-01-18 17:36:41');
INSERT INTO `bbs_vote_record` VALUES ('3', '5', '76', '2017-01-21 22:41:41');
INSERT INTO `bbs_vote_record` VALUES ('4', '18', '76', '2017-01-24 18:08:45');
INSERT INTO `bbs_vote_record` VALUES ('5', '24', '85', '2017-01-24 19:59:44');
INSERT INTO `bbs_vote_record` VALUES ('6', '24', '86', '2017-01-24 20:04:09');
INSERT INTO `bbs_vote_record` VALUES ('7', '25', '85', '2017-01-24 23:39:06');

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='接口调用记录';

-- ----------------------------
-- Records of bbs_webservice_call_record
-- ----------------------------
INSERT INTO `bbs_webservice_call_record` VALUES ('1', 'user_add', '1', '2017-01-15 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('2', 'user_add', '1', '2017-01-16 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('3', 'user_update', '1', '2017-01-16 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('4', 'user_update', '1', '2017-01-16 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('5', 'user_add', '1', '2017-01-17 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('6', 'user_add', '1', '2017-01-17 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('7', 'user_add', '1', '2017-01-17 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('8', 'user_add', '1', '2017-01-17 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('9', 'user_add', '1', '2017-01-17 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('10', 'user_delete', '1', '2017-01-17 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('11', 'user_add', '1', '2017-01-18 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('12', 'user_add', '1', '2017-01-19 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('13', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('14', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('15', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('16', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('17', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('18', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('19', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('20', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('21', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('22', 'user_add', '1', '2017-01-24 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('23', 'user_add', '1', '2017-01-25 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('24', 'user_add', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('25', 'user_add', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('26', 'user_add', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('27', 'user_add', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('28', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('29', 'user_add', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('30', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('31', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('32', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('33', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('34', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('35', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('36', 'user_update', '1', '2017-02-01 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('37', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('38', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('39', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('40', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('41', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('42', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('43', 'user_add', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('44', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('45', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('46', 'user_update', '1', '2017-02-02 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('47', 'user_update', '1', '2017-02-03 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('48', 'user_update', '1', '2017-02-03 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('49', 'user_update', '1', '2017-02-03 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('50', 'user_update', '1', '2017-02-03 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('51', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('52', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('53', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('54', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('55', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('56', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('57', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('58', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('59', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('60', 'user_update', '1', '2017-02-04 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('61', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('62', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('63', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('64', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('65', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('66', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('67', 'user_update', '1', '2017-02-05 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('68', 'user_update', '1', '2017-02-08 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('69', 'user_add', '1', '2017-02-09 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('70', 'user_add', '1', '2017-02-09 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('71', 'user_add', '1', '2017-02-09 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('72', 'user_add', '1', '2017-02-09 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('73', 'user_add', '1', '2017-02-14 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('74', 'user_add', '1', '2017-02-14 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('75', 'user_add', '1', '2017-02-14 00:00:00');
INSERT INTO `bbs_webservice_call_record` VALUES ('76', 'user_update', '1', '2017-02-18 00:00:00');

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
INSERT INTO `bbs_webservice_param` VALUES ('1', '9', 'telphone', null);
INSERT INTO `bbs_webservice_param` VALUES ('2', '9', 'telphone', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_friendship
-- ----------------------------
INSERT INTO `jb_friendship` VALUES ('1', '5', '11', '1');
INSERT INTO `jb_friendship` VALUES ('2', '11', '5', '1');
INSERT INTO `jb_friendship` VALUES ('3', '18', '19', '1');
INSERT INTO `jb_friendship` VALUES ('4', '19', '21', '0');
INSERT INTO `jb_friendship` VALUES ('5', '19', '18', '1');
INSERT INTO `jb_friendship` VALUES ('6', '24', '21', '0');
INSERT INTO `jb_friendship` VALUES ('7', '24', '23', '0');
INSERT INTO `jb_friendship` VALUES ('8', '6', '21', '0');
INSERT INTO `jb_friendship` VALUES ('9', '6', '19', '0');
INSERT INTO `jb_friendship` VALUES ('10', '6', '18', '0');
INSERT INTO `jb_friendship` VALUES ('11', '6', '16', '0');
INSERT INTO `jb_friendship` VALUES ('12', '5', '25', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message
-- ----------------------------
INSERT INTO `jb_message` VALUES ('1', '11', '5', '11', '你好', '2017-01-17 15:46:44', '0', '3', '0');
INSERT INTO `jb_message` VALUES ('2', '5', '5', '11', '你好', '2017-01-17 15:46:44', '0', '3', '1');
INSERT INTO `jb_message` VALUES ('3', '18', '18', '19', 'hi hello', '2017-01-24 17:40:50', '0', '3', '0');
INSERT INTO `jb_message` VALUES ('4', '19', '18', '19', 'hi hello', '2017-01-24 17:40:50', '0', '3', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jb_message_reply
-- ----------------------------
INSERT INTO `jb_message_reply` VALUES ('1', '1', '11', '5', 'hello', '2017-01-17 15:46:25', '1');
INSERT INTO `jb_message_reply` VALUES ('2', '2', '11', '5', 'hello', '2017-01-17 15:46:25', '0');
INSERT INTO `jb_message_reply` VALUES ('3', '2', '5', '11', '你好', '2017-01-17 15:46:44', '1');
INSERT INTO `jb_message_reply` VALUES ('4', '1', '5', '11', '你好', '2017-01-17 15:46:44', '0');
INSERT INTO `jb_message_reply` VALUES ('5', '3', '18', '19', 'hi hello', '2017-01-24 17:40:50', '1');
INSERT INTO `jb_message_reply` VALUES ('6', '4', '18', '19', 'hi hello', '2017-01-24 17:40:50', '0');

-- ----------------------------
-- Table structure for jb_user
-- ----------------------------
DROP TABLE IF EXISTS `jb_user`;
CREATE TABLE `jb_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `telphone` varchar(20) DEFAULT NULL,
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
INSERT INTO `jb_user` VALUES ('5', '2', null, 'admin', 'caihongyixue@qq.com', '2017-01-03 12:02:04', '127.0.0.1', '2017-01-25 13:37:48', '110.184.35.37', '1040', '0', '0', '2011-03-17', '1', '0', '0', null, null, '0', '447', null, '简介', '01.gif', '0', '71', '128', '1', '199', null, '111', '-10', 'CD200826754EDA72B3275B72DAE968BD', '3', '0');
INSERT INTO `jb_user` VALUES ('6', '1', null, 'caihong', 'qianfo_713@163.com', '2017-01-15 10:59:48', '127.0.0.1', '2017-01-23 11:55:56', '117.174.30.239', '16', '0', '0', '2017-01-15', '0', '0', '0', null, null, '0', '10', null, '', 'none.gif', '0', '2', '2', '0', '4', null, '22', '0', '0C49C5AE72D2FC99CAD38B85BBA4F476', '1', '0');
INSERT INTO `jb_user` VALUES ('7', '1', null, 'caihong1', '77219569@qq.com', '2017-01-16 17:41:24', '127.0.0.1', '2017-01-16 17:41:24', '127.0.0.1', '2', '0', '0', '2017-01-16', '0', '0', '0', null, null, '0', '0', null, '', 'none.gif', '0', '0', '0', '0', '0', null, '0', '0', '294E1AA96E695E3815B69E69D5C08E48', '1', '0');
INSERT INTO `jb_user` VALUES ('8', '1', null, 'caihong3', '77219569@qq.com', '2017-01-17 00:58:56', '127.0.0.1', '2017-01-17 00:58:56', '127.0.0.1', '1', '0', '0', '2017-01-17', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', 'A0DFA5A2E188EBD6C3493AE102027503', '1', '0');
INSERT INTO `jb_user` VALUES ('9', '12', null, '红山茶007', '423649967@qq.com', '2017-01-17 11:41:15', '127.0.0.1', '2017-01-17 11:41:15', '127.0.0.1', '4', '0', '0', '2017-01-17', '0', '0', '0', null, '0', '0', '0', null, null, null, '0', '0', '1', '0', '1', null, '0', '0', '40160A7E07D7243B8EFDC0DF48AF0EA9', '1', '0');
INSERT INTO `jb_user` VALUES ('10', '1', null, '彩虹医学编辑', 'caihongyixue@163.com', '2017-01-17 15:31:54', '127.0.0.1', '2017-01-17 15:31:54', '127.0.0.1', '0', '0', '0', '2017-01-17', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('11', '12', null, 'ceshi123', 'caihongyixue@163.com', '2017-01-17 15:40:37', '127.0.0.1', '2017-01-17 15:40:37', '127.0.0.1', '1', '0', '0', '2017-01-17', '0', '0', '0', null, '0', '0', '110', null, null, null, '0', '2', '12', '1', '14', null, '3', '0', '149C1E6ED3F33FBFD1174D76C9D4D8C0', '1', '0');
INSERT INTO `jb_user` VALUES ('14', '1', null, 'qianfo_713', '77219569@qq.com', '2017-01-18 10:19:18', '127.0.0.1', '2017-01-18 10:19:18', '127.0.0.1', '2', '0', '0', '2017-01-18', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', '02BEE083DEBB08E5C9CE3C44EA453B73', '1', '0');
INSERT INTO `jb_user` VALUES ('15', '1', null, '成都李炳成', 'yyy9990@vip.163.com', '2017-01-19 17:54:44', '127.0.0.1', '2017-01-19 17:54:44', '127.0.0.1', '1', '0', '0', '2017-01-19', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', 'BB25A2D17CA37C22C99CFCD14DB319BA', '1', '0');
INSERT INTO `jb_user` VALUES ('16', '13', null, '彩虹妹妹', 'caihongyixue@163.com', '2017-01-24 12:56:23', '127.0.0.1', '2017-01-24 12:56:23', '127.0.0.1', '3', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '5', null, null, null, '0', '1', '6', '0', '7', null, '0', '0', '55686FDB5539095B8A4EC2142C740A88', '1', '0');
INSERT INTO `jb_user` VALUES ('17', '1', null, 'Butter', 'dlxiyoulinux@gmail.com', '2017-01-24 17:06:34', '127.0.0.1', '2017-01-24 17:06:34', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', '805F7D16485CF7F4A92982B9FF4168B2', '1', '0');
INSERT INTO `jb_user` VALUES ('18', '13', null, '彩虹', 'caihongyixue@163.com', '2017-01-24 17:08:56', '127.0.0.1', '2017-01-24 17:08:56', '127.0.0.1', '3', '0', '0', '2017-01-24', '0', '0', '0', null, '0', '0', '10', null, null, null, '0', '2', '5', '0', '7', null, '2', '0', '4C311F8E4B70B8251FB4FB68A7E2E5A3', '1', '0');
INSERT INTO `jb_user` VALUES ('19', '1', null, 'Daisy', '1213388927@qq.com', '2017-01-24 17:09:33', '127.0.0.1', '2017-01-24 17:09:33', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '0', null, '我是一只特立独行的蜻蜓，，，，，，，，........tyhr', 'none.gif', '0', '0', '5', '0', '5', null, '0', '0', '3C9E189D885121451CB5B88867C3E71C', '1', '0');
INSERT INTO `jb_user` VALUES ('20', '1', null, 'shbqsl-790818', '125257175@qq.com.cn', '2017-01-24 17:11:11', '127.0.0.1', '2017-01-24 17:11:11', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '0', null, '121322你好一、搜索好友处 打招呼 出现乱码。但是只是汉字的情况下，不识别汉字。', '10.gif', '0', '0', '0', '0', '0', null, '0', '0', '67A7C25B0B9A29D489227409BC15EB4E', '1', '0');
INSERT INTO `jb_user` VALUES ('21', '1', null, '李炳辰', 'yyy9990@vip.163.com', '2017-01-24 17:19:59', '127.0.0.1', '2017-01-24 17:19:59', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '1', '0', '1', null, '0', '0', 'B91A4FB5599CBA0BCCCDF0A45E071C18', '1', '0');
INSERT INTO `jb_user` VALUES ('22', '1', null, 'shbqsl-790818sss', '125257175@qq.com', '2017-01-24 18:40:54', '127.0.0.1', '2017-01-24 18:40:54', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', 'E5CBB645750CBF7202774E52DC606A9E', '1', '0');
INSERT INTO `jb_user` VALUES ('23', '1', null, 'shbqsl-790818a', '125257175@qq.com', '2017-01-24 18:51:23', '127.0.0.1', '2017-01-24 18:51:23', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '0', null, '二、基本资料，修改头像、密码安全，保存资料后，没有提示。修改头像和密码安全 修改完后点击保存后就显示到基本资料界面了。', '06.gif', '0', '0', '3', '0', '3', null, '0', '0', '8358F444C334A354C8B4D6989C451AAD', '1', '0');
INSERT INTO `jb_user` VALUES ('24', '1', null, 'shbqsl-790818aa', '125257175@qq.com', '2017-01-24 19:08:21', '127.0.0.1', '2017-01-24 19:08:21', '127.0.0.1', '1', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '40', null, '', '01.gif', '0', '8', '18', '0', '26', null, '2', '0', '229D8A51706FD481C890A13792864C79', '1', '0');
INSERT INTO `jb_user` VALUES ('25', '1', null, 'ydk110', '564464797@qq.com', '2017-01-24 23:35:03', '127.0.0.1', '2017-01-24 23:35:03', '127.0.0.1', '5', '0', '0', '2017-01-24', '0', '0', '0', null, null, '0', '30', null, null, null, '0', '6', '2', '0', '8', null, '4', '0', 'B6D8F492C8055F703D0A7B80FADBDAAD', '1', '0');
INSERT INTO `jb_user` VALUES ('26', '1', null, '北极光', '133620311@qq.com', '2017-01-25 10:12:36', '127.0.0.1', '2017-01-25 10:12:36', '127.0.0.1', '1', '0', '0', '2017-01-25', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', '226B67FA39A6D368AE96D7810D8E03A3', '1', '0');
INSERT INTO `jb_user` VALUES ('27', '13', null, 'caihong5', 'qianfo@713.com', '2017-02-01 00:38:06', '127.0.0.1', '2017-02-01 00:38:06', '127.0.0.1', '0', '0', '0', '2017-02-01', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('29', '13', null, 'caihong4', '123@163.com', '2017-02-01 17:21:42', '127.0.0.1', '2017-02-01 17:21:42', '127.0.0.1', '0', '0', '0', '2017-02-01', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('30', '13', '15588882223', 'caihong6', 'caihongyixue@qq.com', '2017-02-01 17:42:23', '127.0.0.1', '2017-02-01 17:42:23', '127.0.0.1', '0', '0', '0', '2017-02-01', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('31', '13', null, 'test', '77219569@qq.com', '2017-02-01 19:36:23', '127.0.0.1', '2017-02-01 19:36:23', '127.0.0.1', '0', '0', '0', '2017-02-01', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('32', '13', null, 'test1', '77219569@qq.com', '2017-02-02 23:42:23', '127.0.0.1', '2017-02-02 23:42:23', '127.0.0.1', '0', '0', '0', '2017-02-02', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '0', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('33', '1', '15544442222', 'caih', '77219569@qq.com', '2017-02-09 17:52:42', '127.0.0.1', '2017-02-09 17:52:42', '127.0.0.1', '2', '0', '0', '2017-02-09', '0', '0', '0', null, null, '0', '0', null, '', '/user/images/201702/10093457m04p.jpg', '0', '0', '0', '0', '0', null, '10', '0', '813C00750004AE2DEA9A88EEFB0F0235', '1', '0');
INSERT INTO `jb_user` VALUES ('34', '1', '15566664444', 'caihh', '77219569@qq.com', '2017-02-09 17:58:25', '127.0.0.1', '2017-02-09 17:58:25', '127.0.0.1', '0', '0', '0', '2017-02-09', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '10', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('35', '1', '15566664445', 'caihhh', '77219569@qq.com', '2017-02-09 18:24:46', '127.0.0.1', '2017-02-09 18:24:46', '127.0.0.1', '0', '0', '0', '2017-02-09', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '10', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('36', '1', '15566664447', 'caihongh', '77219569@qq.com', '2017-02-09 18:36:16', '127.0.0.1', '2017-02-09 18:36:16', '127.0.0.1', '0', '0', '0', '2017-02-09', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '10', '0', null, '1', '0');
INSERT INTO `jb_user` VALUES ('37', '1', '15588882224', '六六', '77219569@qq.com', '2017-02-14 21:54:44', '127.0.0.1', '2017-02-14 21:54:44', '127.0.0.1', '2', '0', '0', '2017-02-14', '0', '0', '0', null, null, '0', '0', null, null, null, '0', '0', '0', '0', '0', null, '10', '0', '6C272FBDEF1D128FD297699293AF8F25', '1', '0');
INSERT INTO `jb_user` VALUES ('38', '1', '15313242771', '彩虹岛之箭', '125257175@qq.com', '2017-02-14 22:00:06', '127.0.0.1', '2017-02-14 22:00:06', '127.0.0.1', '1', '0', '0', '2017-02-14', '0', '0', '0', null, null, '0', '5', null, null, null, '0', '1', '0', '0', '1', null, '10', '0', 'EE6E9444C595816656A5AB31581204BE', '1', '0');
INSERT INTO `jb_user` VALUES ('39', '1', '13691495770', '彩虹岛', '125257175@qq.com', '2017-02-14 22:02:38', '127.0.0.1', '2017-02-14 22:02:38', '127.0.0.1', '2', '0', '0', '2017-02-14', '0', '0', '0', null, null, '0', '10', null, null, null, '0', '2', '0', '0', '2', null, '10', '0', '8AD75A270106252D0188181F72BDA293', '1', '0');

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
  `moble` varchar(50) DEFAULT NULL COMMENT '电话-暂时无用',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `USER_ID` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS用户扩展信息表';

-- ----------------------------
-- Records of jb_user_ext
-- ----------------------------
INSERT INTO `jb_user_ext` VALUES ('5', 'true', '1', null, null, '简介2222', null, null, null, null, '121212');
INSERT INTO `jb_user_ext` VALUES ('6', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('7', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('8', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('9', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('10', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('11', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('14', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('15', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('16', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('17', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('18', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('19', null, '0', null, null, 'Dragonfly', '北京', null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('20', null, '1', null, null, '一、搜索好友处 打招呼 出现乱码。但是只是汉字的情况下，不识别汉字。', null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('21', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('22', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('23', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('24', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('25', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('26', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('27', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('29', 'true', null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('30', 'true', null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('31', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('32', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('33', null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('34', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('35', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('36', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('37', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('38', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jb_user_ext` VALUES ('39', null, null, null, null, null, null, null, null, null, null);

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
INSERT INTO `jc_config` VALUES ('1', null, null, '80', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '1', '120', '120', '/r/cms/www/watermark.png', 'www.jeecms.com', '20', '#FF0000', '50', '1', '0', '0', '2017-02-19', '2011-12-26 13:32:26', 'jeecms', '12', null, null, null, null, null, '7z,aiff,asf,avi,bmp,csv,doc,docx,fla,flv,gif,gz,gzip,jpeg,jpg,mid,mov,mp3,mp4,mpc,mpeg,mpg,ods,odt,pdf,png,ppt,pxd,qt,ram,rar,rm,rmi,rmvb,rtf,sdc,sitd,swf,sxc,sxw,tar,tgz,tif,tiff,vsd,wav,wma,wmv,xls,xlsx,txt,xml,zip');

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
INSERT INTO `jc_config_attr` VALUES ('1', 'useronlinetopnum', '37');
INSERT INTO `jc_config_attr` VALUES ('1', 'useronlinetopday', 'Jan 24, 2017');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------
INSERT INTO `jc_sensitivity` VALUES ('1', '1', '法轮功', '***');

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
INSERT INTO `jc_site` VALUES ('1', '1', null, 'bbs.caihongyixue.com', 'www', '彩虹医学网论坛', '彩虹医学网', 'http://', '.jhtml', '.html', null, '0', '0', 'zh_CN', 'zh_CN', 'blue', 'mobile', '2', '2', '1', '1', '192.168.0.2,192.168.0.7,192.168.0.144,localhost', '', '1');

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
INSERT INTO `jo_config` VALUES ('email_password', 'dycbaby0713');
INSERT INTO `jo_config` VALUES ('email_personal', '彩虹医学网');
INSERT INTO `jo_config` VALUES ('email_port', '25');
INSERT INTO `jo_config` VALUES ('email_username', '77219569@qq.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '彩虹医学网会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用彩虹医学网系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://bbs.caihongyixue.com/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');
INSERT INTO `jo_config` VALUES ('message_register_subject', '彩虹医学网会员注册信息');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册彩虹医学网系统会员\r\n请点击以下链接进行激活\r\nhttp://bbs.caihongyixue.com/active.jspx?username=${username}&key=${activationCode}\r\n');
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
  `telphone` varchar(20) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES ('5', 'admin', null, 'caihongyixue@qq.com', '4297f44b13955235245b2497399d7a93', '2011-03-17 12:02:04', '127.0.0.1', '2017-01-25 13:37:48', '110.184.35.37', '1724', null, null, '1', null, '2017-02-15 15:38:48', '2', '222.210.220.150');
INSERT INTO `jo_user` VALUES ('6', 'caihong', null, 'qianfo_713@163.com', '202cb962ac59075b964b07152d234b70', '2017-01-15 10:59:48', '127.0.0.1', '2017-01-23 11:55:56', '117.174.30.239', '6', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('7', 'caihong1', null, '77219569@qq.com', '4297f44b13955235245b2497399d7a93', '2017-01-16 17:41:24', '127.0.0.1', '2017-01-16 17:41:24', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('8', 'caihong3', null, '77219569@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-17 00:58:56', '127.0.0.1', '2017-01-17 00:58:56', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('9', '红山茶007', null, '423649967@qq.com', '14d7856a0a928ea325f3c013a19f29ef', '2017-01-17 11:41:15', '127.0.0.1', '2017-01-17 11:41:15', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('10', '彩虹医学编辑', null, 'caihongyixue@163.com', 'd71b219ba0291aaf5ccb33e44e0f53b6', '2017-01-17 15:31:54', '127.0.0.1', '2017-01-17 15:31:54', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('11', 'ceshi123', null, 'caihongyixue@163.com', 'b935e710033c606d1b36e62c7bdfa59f', '2017-01-17 15:40:37', '127.0.0.1', '2017-01-17 15:40:37', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('14', 'qianfo_713', null, '77219569@qq.com', '4297f44b13955235245b2497399d7a93', '2017-01-18 10:19:18', '127.0.0.1', '2017-01-18 10:19:18', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('15', '成都李炳成', null, 'yyy9990@vip.163.com', '9dd638d9753713796331d705396c9cd7', '2017-01-19 17:54:44', '127.0.0.1', '2017-01-19 17:54:44', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('16', '彩虹妹妹', null, 'caihongyixue@163.com', 'a584bedcbb16a50b3d9202b3313f7027', '2017-01-24 12:56:23', '127.0.0.1', '2017-01-24 12:56:23', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('17', 'Butter', null, 'dlxiyoulinux@gmail.com', '4edefce7dd12dfcc1b6f06d56aa2cfd2', '2017-01-24 17:06:34', '127.0.0.1', '2017-01-24 17:06:34', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('18', '彩虹', null, 'caihongyixue@163.com', 'c8ce4d760b453555fa40716abedfa7f0', '2017-01-24 17:08:56', '127.0.0.1', '2017-01-24 17:08:56', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('19', 'Daisy', null, '1213388927@qq.com', 'c21b7617e097739ed3fb8d90a7cf0f7d', '2017-01-24 17:09:33', '127.0.0.1', '2017-01-24 17:09:33', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('20', 'shbqsl-790818', null, '125257175@qq.com.cn', '5d0e3c932eabad6fb59b813a24f3cc01', '2017-01-24 17:11:11', '127.0.0.1', '2017-01-24 17:11:11', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('21', '李炳辰', null, 'yyy9990@vip.163.com', '9dd638d9753713796331d705396c9cd7', '2017-01-24 17:19:59', '127.0.0.1', '2017-01-24 17:19:59', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('22', 'shbqsl-790818sss', null, '125257175@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-24 18:40:54', '127.0.0.1', '2017-01-24 18:40:54', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('23', 'shbqsl-790818a', null, '125257175@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-24 18:51:23', '127.0.0.1', '2017-01-24 18:51:23', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('24', 'shbqsl-790818aa', null, '125257175@qq.com', 'c8837b23ff8aaa8a2dde915473ce0991', '2017-01-24 19:08:21', '127.0.0.1', '2017-01-24 19:08:21', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('25', 'ydk110', null, '564464797@qq.com', 'af82cf39e2021b7a5c8c5e4dd483859d', '2017-01-24 23:35:03', '127.0.0.1', '2017-01-24 23:35:03', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('26', '北极光', null, '133620311@qq.com', 'd59f4480999b03203ea3423697e5eb2c', '2017-01-25 10:12:36', '127.0.0.1', '2017-01-25 10:12:36', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('27', 'caihong5', '15882454451', 'qianfo@713.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-01 00:38:06', '127.0.0.1', '2017-02-01 00:38:06', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('29', 'caihong4', '15588882222', '123@163.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-01 17:21:42', '127.0.0.1', '2017-02-01 17:21:42', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('30', 'caihong6', '15588882223', 'caihongyixue@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-01 17:42:23', '127.0.0.1', '2017-02-01 17:42:23', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('31', 'test', '1', '77219569@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2017-02-01 19:36:23', '127.0.0.1', '2017-02-01 19:36:23', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('32', 'test1', '15588882222', '77219569@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '2017-02-02 23:42:23', '127.0.0.1', '2017-02-02 23:42:23', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('33', 'caih', null, '77219569@qq.com', '698d51a19d8a121ce581499d7b701668', '2017-02-09 17:52:42', '127.0.0.1', '2017-02-09 17:52:42', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('34', 'caihh', '15566664444', '77219569@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-09 17:58:25', '127.0.0.1', '2017-02-09 17:58:25', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('35', 'caihhh', '15566664445', '77219569@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-09 18:24:46', '127.0.0.1', '2017-02-09 18:24:46', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('36', 'caihongh', '15566664447', '77219569@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-09 18:36:16', '127.0.0.1', '2017-02-09 18:36:16', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('37', '六六', '15588882224', '77219569@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-14 21:54:44', '127.0.0.1', '2017-02-14 21:54:44', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('38', '彩虹岛之箭', '15313242771', '125257175@qq.com', 'a7973d3045fca7a56e5c178d51d13e71', '2017-02-14 22:00:06', '127.0.0.1', '2017-02-14 22:00:06', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
INSERT INTO `jo_user` VALUES ('39', '彩虹岛', '13691495770', '125257175@qq.com', 'a7973d3045fca7a56e5c178d51d13e71', '2017-02-14 22:02:38', '127.0.0.1', '2017-02-14 22:02:38', '127.0.0.1', '0', null, null, '1', null, null, '0', null);
