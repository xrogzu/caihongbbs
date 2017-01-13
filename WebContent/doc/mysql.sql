CREATE TABLE `bbs_session` (
  `sid` bigint(20) NOT NULL auto_increment,
  `session_id` varchar(100) NOT NULL default '' COMMENT '会话sessionID',
  `user_id` int(11) default NULL COMMENT '会员用户ID',
  `ip` varchar(50) NOT NULL default '' COMMENT 'IP地址',
  `first_activetime` datetime NOT NULL  COMMENT '开始活动时间',
  `last_activetime` datetime NOT NULL  COMMENT '最后活动时间',
  PRIMARY KEY  (`sid`),
  KEY `fk_session_user` (`user_id`),
  CONSTRAINT `fk_session_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='论坛会话';

DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr` (
  `config_id` bigint(20) NOT NULL default '0',
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_attr_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS配置属性表';



CREATE TABLE `bbs_third_account` (
  `account_id` bigint(20) NOT NULL auto_increment,
  `account_key` varchar(255) NOT NULL default '' COMMENT '第三方账号key',
  `username` varchar(100) NOT NULL default '0' COMMENT '关联用户名',
  `source` varchar(10) NOT NULL default '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  PRIMARY KEY  (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='第三方登录平台账号';

INSERT INTO jc_config_attr VALUES (1,'keepMinute','15');
INSERT INTO jc_config_attr VALUES (1,'qqEnable','false');
INSERT INTO jc_config_attr VALUES (1,'sinaEnable','false');
INSERT INTO jc_config_attr VALUES (1,'qqWeboEnable','false');

INSERT INTO jc_config_attr VALUES (1,'useronlinetopday','2015-02-13');
INSERT INTO jc_config_attr VALUES (1,'useronlinetopnum','0');

INSERT INTO jc_config_attr VALUES (1,'ssoEnable','false');
INSERT INTO jc_config_attr VALUES (1,'defaultActiveLevel','1');

alter table jo_user add column error_time datetime default NULL COMMENT '登录错误时间';
alter table jo_user add column error_count int(11) NOT NULL default '0' COMMENT '登录错误次数';
alter table jo_user add column error_ip varchar(50) default NULL COMMENT '登录错误IP';

CREATE TABLE `jb_user_attr` (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `attr_value` varchar(255) default NULL,
  KEY `pk_jb_attr_user` (`user_id`),
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jb_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户属性表';


CREATE TABLE `jc_config_item` (
  `modelitem_id` int(11) NOT NULL auto_increment,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) NOT NULL COMMENT '字段',
  `item_label` varchar(100) NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL default '70' COMMENT '排列顺序',
  `def_value` varchar(255) default NULL COMMENT '默认值',
  `opt_value` varchar(255) default NULL COMMENT '可选项',
  `text_size` varchar(20) default NULL COMMENT '长度',
  `area_rows` varchar(3) default NULL COMMENT '文本行数',
  `area_cols` varchar(3) default NULL COMMENT '文本列数',
  `help` varchar(255) default NULL COMMENT '帮助信息',
  `help_position` varchar(1) default NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL default '1' COMMENT '数据类型 "1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"',
  `is_required` tinyint(1) NOT NULL default '0' COMMENT '是否必填',
  `category` int(11) NOT NULL default '10' COMMENT '模型项目所属分类（10用户模型）',
  PRIMARY KEY  (`modelitem_id`),
  KEY `pk_jc_item_config` (`config_id`),
  CONSTRAINT `fk_jb_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS配置模型项表';

CREATE TABLE `bbs_limit` (
  `limit_id` int(11) NOT NULL auto_increment,
  `ip` varchar(50)  COMMENT '限制ip',
  `user_id` int(11)  COMMENT '限制用户ID',
  PRIMARY KEY  (`limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='限制发帖回帖ip';

alter table jb_user add column session_id varchar(255);

ALTER TABLE `jc_config_attr`
ADD CONSTRAINT `fk_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`CONFIG_ID`);

CREATE TABLE `bbs_webservice_auth` (
  `auth_id` int(11) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL  COMMENT '用户名',
  `password` varchar(50) NOT NULL  COMMENT '密码',
  `system` varchar(100) NOT NULL  COMMENT '系统',
  `is_enable` tinyint(1) NOT NULL default '1' COMMENT '是否启用',
  PRIMARY KEY  (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='webservices认证表';

CREATE TABLE `bbs_webservice_call_record` (
  `record_id` int(11) NOT NULL auto_increment,
  `service_code` varchar(50) NOT NULL COMMENT '接口识别码',
  `auth_id` int(11) NOT NULL COMMENT '调用的认证',
  `record_time` datetime NOT NULL  COMMENT '调用时间',
  PRIMARY KEY  (`record_id`),
  KEY `fk_webservice_record_auth` (`auth_id`),
  CONSTRAINT `fk_webservice_record_auth` FOREIGN KEY (`auth_id`) REFERENCES `bbs_webservice_auth` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口调用记录';

CREATE TABLE `bbs_webservice` (
  `service_id` int(11) NOT NULL auto_increment,
  `service_address` varchar(255) NOT NULL default '' COMMENT '接口地址',
  `target_namespace` varchar(255) default NULL,
  `success_result` varchar(255) default '' COMMENT '正确返回值',
  `service_type` varchar(50) default NULL COMMENT '接口类型',
  `service_operate` varchar(50) default NULL COMMENT '接口操作',
  PRIMARY KEY  (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='接口表';

CREATE TABLE `bbs_webservice_param` (
  `service_id` int(11) NOT NULL default '0',
  `priority` int(11) NOT NULL default '0' COMMENT '排列顺序',
  `param_name` varchar(100) NOT NULL default '' COMMENT '参数名',
  `default_value` varchar(255) default NULL COMMENT '默认值',
  KEY `fk_param_webservice` (`service_id`),
  CONSTRAINT `fk_param_webservice` FOREIGN KEY (`service_id`) REFERENCES `bbs_webservice` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接口参数表';


CREATE TABLE `bbs_user_active_level` (
  `level_id` int(11) NOT NULL auto_increment,
  `level_name` varchar(255) NOT NULL default '' COMMENT '等级名称',
  `required_hour` bigint(20) NOT NULL default '0' COMMENT '等级需要时间(小时)',
  `level_img` varchar(255) default NULL COMMENT '等级头像',
  PRIMARY KEY  (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户活跃等级';


INSERT INTO `bbs_user_active_level` VALUES (1,'1',0,'/r/cms/www/blue/bbs_forum/img/Lv_1.png');
INSERT INTO `bbs_user_active_level` VALUES (2,'2',20,'/r/cms/www/blue/bbs_forum/img/Lv_2.png');
INSERT INTO `bbs_user_active_level` VALUES (3,'3',50,'/r/cms/www/blue/bbs_forum/img/Lv_3.png');

alter table jb_user add column active_level_id int(11) ;
update jb_user set active_level_id=1;
alter table jb_user add column  is_official int(11) ;
update jb_user set is_official=0;
alter table jc_site add column tpl_mobile_solution varchar(50) COMMENT '手机访问模板方案';
update jc_site set tpl_mobile_solution='mobile';

CREATE TABLE `bbs_config_attr` (
  `config_id` bigint(20) NOT NULL default '0',
  `attr_name` varchar(30) NOT NULL COMMENT '名称',
  `attr_value` varchar(255) default NULL COMMENT '值',
  KEY `fk_attr_config` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BBS配置属性表';

CREATE TABLE `bbs_app_install_statistic` (
  `id` int(11) NOT NULL auto_increment,
  `equip_id` varchar(100) NOT NULL COMMENT '设备ID',
  `install_time` datetime NOT NULL COMMENT '安装时间',
  `source` varchar(50) default ''  COMMENT '来源',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app安装统计';

CREATE TABLE `bbs_topic_msg` (
  `msg_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL default '0',
  `topic_id` int(11) default '0',
  `post_id` int(11) NOT NULL default '0',
  `is_read` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

alter table jb_message_reply add column is_read tinyint(3);
alter table jb_message_reply add column is_notification tinyint(3);
update jb_message_reply set is_read=0;
update jb_message_reply set is_notification=1;


