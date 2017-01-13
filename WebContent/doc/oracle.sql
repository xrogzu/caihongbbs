CREATE SEQUENCE S_BBS_SESSION;
CREATE TABLE bbs_session (
  sid NUMBER(20) NOT NULL ,
  session_id varchar2(100) NOT NULL ,
  user_id NUMBER(11) ,
  ip varchar2(50)  NOT NULL ,
  first_activetime DATE NOT NULL  ,
  last_activetime DATE NOT NULL ,
  CONSTRAINT PK_BBS_SESSION PRIMARY KEY (sid)
);

COMMENT ON TABLE bbs_session IS
'论坛会话;';
COMMENT ON COLUMN bbs_session.session_id IS
'会话sessionID';
COMMENT ON COLUMN bbs_session.user_id IS
'会员用户ID';
COMMENT ON COLUMN bbs_session.ip IS
'IP地址';
COMMENT ON COLUMN bbs_session.first_activetime IS 
'开始活动时间';
COMMENT ON COLUMN bbs_session.last_activetime IS
'最后活动时间';

CREATE TABLE jc_config_attr (
  config_id NUMBER(20) NOT NULL,
  attr_name varchar2(30) NOT NULL,
  attr_value varchar2(255) ,
  CONSTRAINT PK_BBS_CONFIG_ATTR PRIMARY KEY (config_id)
) ;

COMMENT ON TABLE jc_config_attr IS
'BBS配置属性表';
COMMENT ON COLUMN jc_config_attr.attr_name IS
'名称';
COMMENT ON COLUMN jc_config_attr.attr_value IS
'值';


CREATE TABLE bbs_third_account (
  account_id NUMBER(20) NOT NULL ,
  account_key varchar2(255) default '' NOT NULL ,
  username varchar2(100)  NOT NULL ,
  source varchar2(10) NOT NULL 
);
alter table bbs_third_account add constraint PK_JC_THIRD_ACCOUNT primary key (account_id);
CREATE SEQUENCE S_BBS_THIRD_ACCOUNT start with 1;

INSERT INTO jc_config_attr VALUES (1,'keepMinute','15');
INSERT INTO jc_config_attr VALUES (1,'qqEnable','false');
INSERT INTO jc_config_attr VALUES (1,'sinaEnable','false');
INSERT INTO jc_config_attr VALUES (1,'qqWeboEnable','false');
INSERT INTO jc_config_attr VALUES (1,'useronlinetopday','2015-02-13');
INSERT INTO jc_config_attr VALUES (1,'useronlinetopnum','0');
INSERT INTO jc_config_attr VALUES (1,'ssoEnable','false');
INSERT INTO jc_config_attr VALUES (1,'defaultActiveLevel','1');

alter table jo_user add  error_time datetime ;
COMMENT ON COLUMN jo_user.error_time IS '登录错误时间';
alter table jo_user add  error_count NUMBER(11)  default 0 NOT NULL  ;
COMMENT ON COLUMN jo_user.error_count IS '登录错误次数';
alter table jo_user add  error_ip varchar2(50) ;
COMMENT ON COLUMN jo_user.error_ip IS '登录错误IP';

CREATE TABLE jb_user_attr (
  user_id NUMBER(11) NOT NULL,
  attr_name varchar2(255) NOT NULL,
  attr_value varchar2(255) default NULL,
  CONSTRAINT PK_JB_USER_ATTR PRIMARY KEY (user_id)
);

COMMENT ON TABLE jb_user_attr IS
'BBS用户属性表';

CREATE TABLE jc_config_item (
  modelitem_id NUMBER(11) NOT NULL,
  config_id NUMBER(11) NOT NULL,
  field varchar2(50) NOT NULL,
  item_label varchar2(100) NOT NULL ,
  priority NUMBER(11) default 70 NOT NULL  ,
  def_value varchar2(255) default NULL ,
  opt_value varchar2(255) default NULL ,
  text_size varchar2(20) default NULL ,
  area_rows varchar2(3) default NULL ,
  area_cols varchar2(3) default NULL ,
  help varchar2(255) default NULL ,
  help_position varchar(1) default NULL ,
  data_type NUMBER(11) default 1 NOT NULL  ,
  is_required NUMBER(1) default 0 NOT NULL ,
  category NUMBER(11) default 10 NOT NULL 
);
alter table jc_config_item add constraint PK_JC_CONFIG_ITEM primary key (modelitem_id);
ALTER TABLE jc_config_item ADD CONSTRAINT fk_jc_item_config FOREIGN KEY (config_id) REFERENCES jc_config (config_id);
CREATE SEQUENCE S_JC_CONFIG_ITEM start with 1;
COMMENT ON TABLE jc_config_item IS 'CMS配置模型项表';
COMMENT ON COLUMN jc_config_item.field IS '字段';
COMMENT ON COLUMN jc_config_item.item_label IS '名称';
COMMENT ON COLUMN jc_config_item.priority IS '排序';
COMMENT ON COLUMN jc_config_item.def_value IS '默认值';
COMMENT ON COLUMN jc_config_item.opt_value IS '可选项';
COMMENT ON COLUMN jc_config_item.text_size IS '长度';
COMMENT ON COLUMN jc_config_item.area_rows IS '文本行数';
COMMENT ON COLUMN jc_config_item.area_cols IS '文本列数';
COMMENT ON COLUMN jc_config_item.help IS '帮助信息';
COMMENT ON COLUMN jc_config_item.data_type IS '数据类型 "1":"字符串文本","2":"整型文本","3":"浮点型文本","4":"文本区","5":"日期","6":"下拉列表","7":"复选框","8":"单选框"';
COMMENT ON COLUMN jc_config_item.is_required IS '是否必填';
COMMENT ON COLUMN jc_config_item.category IS '模型项目所属分类（10用户模型）';

CREATE TABLE bbs_limit (
  limit_id NUMBER(11) NOT NULL ,
  ip varchar2(50) ,
  user_id NUMBER(11),
  PRIMARY KEY  (id)
);
alter table bbs_limit add constraint PK_BBS_LIMIT primary key (limit_id);
CREATE SEQUENCE S_BBS_LIMIT start with 1;
COMMENT ON TABLE bbs_limit IS '限制发帖回帖';
COMMENT ON COLUMN bbs_limit.ip IS '限制ip';
COMMENT ON COLUMN bbs_limit.user_id IS '限制用户ID';

alter table jb_user add column session_id varchar2(255);

ALTER TABLE jc_config_attr ADD CONSTRAINT fk_attr_config FOREIGN KEY (config_id) REFERENCES jc_config (CONFIG_ID);

ALTER TABLE bbs_session ADD CONSTRAINT fk_session_user FOREIGN KEY (user_id) REFERENCES jb_user (user_id);

ALTER TABLE jb_user_attr ADD CONSTRAINT fk_jb_attr_user FOREIGN KEY (user_id) REFERENCES jb_user (user_id);

CREATE TABLE bbs_webservice_auth (
  auth_id NUMBER(11)  NOT NULL,
  username varchar2(50) NOT NULL,
  password varchar2(50) NOT NULL,
  system varchar2(100) NOT NULL,
  is_enable NUMBER(1) default 1 NOT NULL
);
alter table bbs_webservice_auth add constraint PK_BBS_WEBSERVICE_AUTH primary key (auth_id);
CREATE SEQUENCE S_BBS_WEBSERVICE_AUTH start with 1;
COMMENT ON TABLE bbs_webservice_auth IS 'webservices认证表';
COMMENT ON COLUMN bbs_webservice_auth.username IS '用户名';
COMMENT ON COLUMN bbs_webservice_auth.username IS '密码';
COMMENT ON COLUMN bbs_webservice_auth.username IS '系统';
COMMENT ON COLUMN bbs_webservice_auth.username IS '是否启用';

CREATE TABLE bbs_webservice_call_record (
  record_id NUMBER(11) NOT NULL,
  service_code varchar2(50) NOT NULL COMMENT '接口识别码',
  auth_id NUMBER(11) NOT NULL COMMENT '调用的认证',
  record_time datetime NOT NULL  COMMENT '调用时间'
);
alter table bbs_webservice_call_record add constraint PK_BBS_WEBSERVICE_CALL_RECORD primary key (record_id);
ALTER TABLE bbs_webservice_call_record ADD CONSTRAINT fk_call_record_webservice_auth FOREIGN KEY (auth_id) REFERENCES bbs_webservice_auth (auth_id);
CREATE SEQUENCE S_BBS_WEBSERVICE_CALL_RECORD start with 1;
COMMENT ON TABLE bbs_webservice_call_record IS '接口调用记录';
COMMENT ON COLUMN bbs_webservice_call_record.service_code IS '接口识别码';
COMMENT ON COLUMN bbs_webservice_call_record.auth_id IS '调用的认证';
COMMENT ON COLUMN bbs_webservice_call_record.record_time IS '调用时间';

CREATE TABLE bbs_webservice (
  service_id NUMBER(11) NOT NULL,
  service_address varchar2(255) NOT NULL ,
  target_namespace varchar2(255),
  success_result default '' varchar2(255) ,
  service_type varchar2(50),
  service_operate varchar2(50)
);
alter table bbs_webservice add constraint PK_BBS_WEBSERVICE primary key (service_id);
CREATE SEQUENCE S_BBS_WEBSERVICE start with 1;
COMMENT ON TABLE bbs_webservice IS '接口调用记录';
COMMENT ON COLUMN bbs_webservice.service_address IS '接口地址';
COMMENT ON COLUMN bbs_webservice.success_result IS '正确返回值';
COMMENT ON COLUMN bbs_webservice.service_type IS '接口类型';
COMMENT ON COLUMN bbs_webservice.service_operate IS '接口操作';

CREATE TABLE bbs_webservice_param (
  service_id NUMBER(11) NOT NULL,
  priority NUMBER(11)  default 0 NOT NULL ,
  param_name varchar2(100) default '' NOT NULL,
  default_value varchar2(255)
);
alter table bbs_webservice_param add constraint PK_BBS_WEBSERVICE_PARAM primary key (service_id,priority);
ALTER TABLE bbs_webservice_param ADD CONSTRAINT fk_param_webservice FOREIGN KEY (service_id) REFERENCES bbs_webservice (service_id);
CREATE SEQUENCE S_BBS_WEBSERVICE_PARAM start with 1;
COMMENT ON TABLE bbs_webservice_param IS '接口参数表';
COMMENT ON COLUMN bbs_webservice_param.priority IS '排列顺序';
COMMENT ON COLUMN bbs_webservice_param.param_name IS '参数名';
COMMENT ON COLUMN bbs_webservice_param.default_value IS '默认值';


CREATE TABLE bbs_user_active_level (
  level_id NUMBER(11) NOT NULL auto_increment,
  level_name varchar2(255) NOT NULL ,
  required_hour NUMBER(20)  default 0 NOT NULL ,
  level_img varchar2(255) 
);
alter table bbs_user_active_level add constraint PK_BBS_USER_ACTIVE_LEVEL primary key (level_id);
CREATE SEQUENCE S_BBS_USER_ACTIVE_LEVEL start with 1;
COMMENT ON TABLE bbs_user_active_level IS '接口参数表';
COMMENT ON COLUMN bbs_user_active_level.level_name IS '等级名称';
COMMENT ON COLUMN bbs_user_active_level.required_hour IS '等级需要时间(小时)';
COMMENT ON COLUMN bbs_user_active_level.level_img IS '等级头像';

INSERT INTO bbs_user_active_level VALUES (1,'1',0,'/r/cms/www/blue/bbs_forum/img/Lv_1.png');
INSERT INTO bbs_user_active_level VALUES (2,'2',20,'/r/cms/www/blue/bbs_forum/img/Lv_2.png');
INSERT INTO bbs_user_active_level VALUES (3,'3',50,'/r/cms/www/blue/bbs_forum/img/Lv_3.png');

alter table jb_user add  active_level_id NUMBER(11) ;
update jb_user set active_level_id=1;
alter table jb_user add   is_official NUMBER(11) ;
update jb_user set is_official=0;
alter table jc_site add  tpl_mobile_solution varchar2(50);
COMMENT ON COLUMN jc_site.tpl_mobile_solution IS '手机访问模板方案'; 
update jc_site set tpl_mobile_solution='mobile';

CREATE TABLE bbs_config_attr (
  config_id NUMBER(20) NOT NULL,
  attr_name varchar2(30) NOT NULL ,
  attr_value varchar2(255)
);
ALTER TABLE bbs_config_attr ADD CONSTRAINT fk_bbs_attr_config FOREIGN KEY (config_id) REFERENCES bbs_config (CONFIG_ID);
COMMENT ON COLUMN bbs_config_attr.attr_name IS  '名称';
COMMENT ON COLUMN bbs_config_attr.attr_value IS '值';

/*app相关*/
CREATE TABLE bbs_app_install_statistic (
  id NUMBER(11) NOT NULL,
  equip_id varchar2(100) NOT NULL,
  install_time DATE NOT NULL,
  source varchar2(50)
);
alter table bbs_app_install_statistic add constraint PK_BBS_APP_INSTALL_STATISTIC primary key (id);
CREATE SEQUENCE S_BBS_APP_INSTALL_STATISTIC start with 1; 
COMMENT ON TABLE bbs_app_install_statistic IS 'app安装统计';
COMMENT ON COLUMN bbs_app_install_statistic.equip_id IS '设备ID';
COMMENT ON COLUMN bbs_app_install_statistic.install_time IS '安装时间';
COMMENT ON COLUMN bbs_app_install_statistic.source IS '来源';

CREATE TABLE bbs_topic_msg (
  msg_id NUMBER(11) NOT NULL,
  user_id NUMBER(11) NOT NULL ,
  topic_id NUMBER(11),
  post_id NUMBER(11) NOT NULL,
  is_read NUMBER(1) NOT NULL,
  PRIMARY KEY  (msg_id)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
alter table bbs_topic_msg add constraint PK_BBS_TOPIC_MSG primary key (msg_id);
CREATE SEQUENCE S_BBS_TOPIC_MSG start with 1; 

alter table jb_message_reply add  is_read NUMBER(3);
alter table jb_message_reply add  is_notification NUMBER(3);
update jb_message_reply set is_read=0;
update jb_message_reply set is_notification=1;