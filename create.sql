DROP TABLE IF EXISTS `ordinary_users`;
CREATE TABLE `ordinary_users`(
                                 `ordinary_users_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '普通用户ID',
                                 `full_name` varchar(64) comment '姓名',
                                 `gender` varchar(64) comment '性别',
                                 `examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
                                 `recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
                                 `user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

                                 PRIMARY KEY (ordinary_users_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '普通用户';

DROP TABLE IF EXISTS `scenic_spot_information`;
CREATE TABLE `scenic_spot_information`(
                                          `scenic_spot_information_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '景点信息ID',
                                          `name_of_scenic_spot` varchar(64) comment '景点名称',
                                          `scenic_spot_type` varchar(64) comment '景点类型',
                                          `opening_hours` varchar(64) comment '开放时间',
                                          `scenic_spot_telephone` varchar(64) comment '景点电话',
                                          `scenic_spot_address` varchar(64) comment '景点地址',
                                          `cover_photo_` varchar(255) comment '封面图片',
                                          `recommended_hotel` varchar(64) comment '推荐酒店',
                                          `route_recommendation` text comment '路线推荐',
                                          `introduction_to_scenic_spots` longtext comment '景点简介',
                                          `hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
                                          `recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

                                          PRIMARY KEY (scenic_spot_information_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '景点信息';


DROP TABLE IF EXISTS `type_management`;
CREATE TABLE `type_management`(
                                  `type_management_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型管理ID',
                                  `scenic_spot_type` varchar(64) comment '景点类型',
                                  `recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

                                  PRIMARY KEY (type_management_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '类型管理';

DROP TABLE IF EXISTS `hotel_information`;
CREATE TABLE `hotel_information`(
                                    `hotel_information_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '酒店信息ID',
                                    `hotel_name` varchar(64) comment '酒店名称',
                                    `hotel_telephone` varchar(64) comment '酒店电话',
                                    `cover_photo_` varchar(255) comment '封面图片',
                                    `nearby_scenic_spots` varchar(64) comment '附近景点',
                                    `hotel_address` varchar(64) comment '酒店地址',
                                    `hotel_profile` longtext comment '酒店简介',
                                    `hits` int(11) DEFAULT 0 NOT NULL comment '点击数',
                                    `recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

                                    PRIMARY KEY (hotel_information_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '酒店信息';

DROP TABLE IF EXISTS `route_application`;
CREATE TABLE `route_application`(
                                    `route_application_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路线申请ID',
                                    `name_of_scenic_spot` varchar(64) comment '景点名称',
                                    `applicant` int(11) DEFAULT 0 comment '申请人',
                                    `full_name` varchar(64) comment '姓名',
                                    `contact_number` varchar(16) comment '联系电话',
                                    `approval_status` varchar(64) comment '审批状态',
                                    `route_information` text comment '路线信息',
                                    `reply_message` text comment '回复信息',
                                    `recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',

                                    PRIMARY KEY (route_application_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '路线申请';

DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
                                `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
                                `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
                                `info` text,
                                `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                                `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
                                PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
                           `article_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
                           `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
                           `type` varchar(64) NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
                           `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
                           `praise_len` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                           `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                           `source` varchar(255) DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
                           `url` varchar(255) DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
                           `tag` varchar(255) DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
                           `content` longtext COMMENT '正文：文章的主体内容',
                           `img` varchar(255) DEFAULT NULL COMMENT '封面图',
                           `description` text COMMENT '文章描述',
                           PRIMARY KEY (`article_id`,`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章：用于内容管理系统的文章';
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type` (
                                `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
                                `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
                                `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
                                `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
                                `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
                                `icon` text COMMENT '分类图标：',
                                `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
                                `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                                `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                                PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='文章频道：用于汇总浏览文章，在不同频道下展示不同文章。';

DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
                        `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
                        `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
                        `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
                        `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
                        `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
                        `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
                        `position` varchar(32) DEFAULT NULL COMMENT '位置：',
                        `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
                        `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
                        `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
                        `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
                        `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
                        `field_add` varchar(500) DEFAULT NULL COMMENT '添加字段：',
                        `field_set` varchar(500) DEFAULT NULL COMMENT '修改字段：',
                        `field_get` varchar(500) DEFAULT NULL COMMENT '查询字段：',
                        `table_nav_name` varchar(255) DEFAULT NULL COMMENT '跨表导航名称：',
                        `table_nav` varchar(255) DEFAULT NULL COMMENT '跨表导航：',
                        `option` text COMMENT '配置：',
                        `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                        `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                        PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定制授权';

DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
                           `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
                           `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏人ID：',
                           `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
                           `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
                           `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
                           `title` varchar(255) DEFAULT NULL COMMENT '标题：',
                           `img` varchar(255) DEFAULT NULL COMMENT '封面：',
                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                           `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                           PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收藏：';
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
                           `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
                           `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论人ID：',
                           `reply_to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复评论ID：空为0',
                           `content` longtext COMMENT '内容：',
                           `nickname` varchar(255) DEFAULT NULL COMMENT '昵称：',
                           `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
                           `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                           `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                           `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
                           `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
                           `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
                           PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论：';
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
                         `forum_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '论坛id',
                         `display` smallint(5) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
                         `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
                         `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
                         `praise_len` int(10) unsigned DEFAULT '0' COMMENT '点赞数',
                         `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问数',
                         `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题',
                         `keywords` varchar(125) DEFAULT NULL COMMENT '关键词',
                         `description` varchar(255) DEFAULT NULL COMMENT '描述',
                         `url` varchar(255) DEFAULT NULL COMMENT '来源地址',
                         `tag` varchar(255) DEFAULT NULL COMMENT '标签',
                         `img` text COMMENT '封面图',
                         `content` longtext COMMENT '正文',
                         `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                         `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                         `avatar` varchar(255) DEFAULT NULL COMMENT '发帖人头像：',
                         `type` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '0' COMMENT '论坛分类：[0,1000]用来搜索指定类型的论坛帖',
                         PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='论坛：';

DROP TABLE IF EXISTS `forum_type`;
CREATE TABLE `forum_type` (
                              `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
                              `name` varchar(16) NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
                              `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
                              `url` varchar(255) DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
                              `father_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID：[0,32767]',
                              `icon` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类图标：',
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                              PRIMARY KEY (`type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='论坛频道：用于汇总浏览论坛，在不同频道下展示不同论坛。';

CREATE TABLE `notice` (
                          `notice_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '公告id：',
                          `title` varchar(125) NOT NULL DEFAULT '' COMMENT '标题：',
                          `content` longtext COMMENT '正文：',
                          `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                          PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告：';

DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise` (
                          `praise_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
                          `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
                          `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                          `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
                          `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
                          `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
                          `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '点赞状态:1为点赞，0已取消',
                          PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='点赞：';

DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides` (
                          `slides_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
                          `title` varchar(64) DEFAULT NULL COMMENT '标题：',
                          `content` varchar(255) DEFAULT NULL COMMENT '内容：',
                          `url` varchar(255) DEFAULT NULL COMMENT '链接：',
                          `img` varchar(255) DEFAULT NULL COMMENT '轮播图：',
                          `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击量：',
                          `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                          `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                          PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图：';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
                          `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
                          `name` varchar(64) DEFAULT NULL COMMENT '文件名',
                          `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
                          `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
                          `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
                          `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
                          `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
                          `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
                          PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
                        `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
                        `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
                        `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
                        `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
                        `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
                        `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
                        `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
                        `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
                        `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
                        `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
                        `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
                        `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                        PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
                              `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
                              `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
                              `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
                              `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
                              `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
                              `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
                              `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
                              `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
                              `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                              `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                              PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
                        `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
                        `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
                        `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
                        `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
                        `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
                        `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
                        `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
                        PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

insert into `scenic_spot_information` values (1,'景点名称1','景点类型1','开放时间1','景点电话1','景点地址1','/api/upload/image_1615206273494.jpg','推荐酒店1','路线推荐1','此处可上传文字、图片、视频、超链接、表格等内容区1','240','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (2,'景点名称2','景点类型2','开放时间2','景点电话2','景点地址2','/api/upload/image_1615198957362.jpg','推荐酒店2','路线推荐2','此处可上传文字、图片、视频、超链接、表格等内容区2','42','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (3,'景点名称3','景点类型3','开放时间3','景点电话3','景点地址3','/api/upload/image_1615198957772.jpg','推荐酒店3','路线推荐3','此处可上传文字、图片、视频、超链接、表格等内容区3','440','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (4,'景点名称4','景点类型4','开放时间4','景点电话4','景点地址4','/api/upload/image_1615206273525.jpg','推荐酒店4','路线推荐4','此处可上传文字、图片、视频、超链接、表格等内容区4','406','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (5,'景点名称5','景点类型5','开放时间5','景点电话5','景点地址5','/api/upload/image_1615198965330.jpg','推荐酒店5','路线推荐5','此处可上传文字、图片、视频、超链接、表格等内容区5','736','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (6,'景点名称6','景点类型6','开放时间6','景点电话6','景点地址6','/api/upload/image_1615206273494.jpg','推荐酒店6','路线推荐6','此处可上传文字、图片、视频、超链接、表格等内容区6','341','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (7,'景点名称7','景点类型7','开放时间7','景点电话7','景点地址7','/api/upload/image_1615198965330.jpg','推荐酒店7','路线推荐7','此处可上传文字、图片、视频、超链接、表格等内容区7','52','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `scenic_spot_information` values (8,'景点名称8','景点类型8','开放时间8','景点电话8','景点地址8','/api/upload/image_1615198958415.jpg','推荐酒店8','路线推荐8','此处可上传文字、图片、视频、超链接、表格等内容区8','204','0','2025-06-20 07:32:09','2025-06-20 07:32:09');

insert into `type_management` values (1,'景点类型1','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (2,'景点类型2','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (3,'景点类型3','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (4,'景点类型4','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (5,'景点类型5','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (6,'景点类型6','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (7,'景点类型7','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `type_management` values (8,'景点类型8','0','2025-06-20 07:32:09','2025-06-20 07:32:09');

insert into `hotel_information` values (1,'酒店名称1','酒店电话1','/api/upload/image_1645455515214.jpg','附近景点1','酒店地址1','此处可上传文字、图片、视频、超链接、表格等内容区1','249','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (2,'酒店名称2','酒店电话2','/api/upload/image_1645455515214.jpg','附近景点2','酒店地址2','此处可上传文字、图片、视频、超链接、表格等内容区2','899','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (3,'酒店名称3','酒店电话3','/api/upload/image_1645455515219.jpg','附近景点3','酒店地址3','此处可上传文字、图片、视频、超链接、表格等内容区3','361','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (4,'酒店名称4','酒店电话4','/api/upload/image_1645455515200.jpg','附近景点4','酒店地址4','此处可上传文字、图片、视频、超链接、表格等内容区4','584','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (5,'酒店名称5','酒店电话5','/api/upload/image_1645455515228.jpg','附近景点5','酒店地址5','此处可上传文字、图片、视频、超链接、表格等内容区5','5','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (6,'酒店名称6','酒店电话6','/api/upload/image_1645455515219.jpg','附近景点6','酒店地址6','此处可上传文字、图片、视频、超链接、表格等内容区6','746','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (7,'酒店名称7','酒店电话7','/api/upload/image_1645455515200.jpg','附近景点7','酒店地址7','此处可上传文字、图片、视频、超链接、表格等内容区7','160','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `hotel_information` values (8,'酒店名称8','酒店电话8','/api/upload/image_1645455515230.jpg','附近景点8','酒店地址8','此处可上传文字、图片、视频、超链接、表格等内容区8','168','0','2025-06-20 07:32:09','2025-06-20 07:32:09');


insert into `route_application` values (1,'景点名称1',0,'姓名1','18945782351','审批状态1','路线信息1','回复信息1','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (2,'景点名称2',0,'姓名2','18945782352','审批状态2','路线信息2','回复信息2','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (3,'景点名称3',0,'姓名3','18945782353','审批状态3','路线信息3','回复信息3','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (4,'景点名称4',0,'姓名4','18945782354','审批状态4','路线信息4','回复信息4','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (5,'景点名称5',0,'姓名5','18945782355','审批状态5','路线信息5','回复信息5','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (6,'景点名称6',0,'姓名6','18945782356','审批状态6','路线信息6','回复信息6','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (7,'景点名称7',0,'姓名7','18945782357','审批状态7','路线信息7','回复信息7','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `route_application` values (8,'景点名称8',0,'姓名8','18945782358','审批状态8','路线信息8','回复信息8','0','2025-06-20 07:32:09','2025-06-20 07:32:09');

insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2025-06-20 07:32:09','2025-06-20 07:32:09','1');

insert into `forum` values ('1','100','1','小明','0','149','测试标题','关键字1','描述','#','标签','/static/img/img_temp.jpg','<h1>fafgwagbagbwgwag</h1>','2025-06-20 07:32:09','2025-06-20 07:32:09','http://localhost:5000/upload/jingdian (11)_15.jpg','0');
insert into `forum` values ('2','100','2','小明','0','30','测试标题2','关键字2','dec','#','标签','/static/img/img_temp.jpg','测试文章内容2','2025-06-20 07:32:09','2025-06-20 07:32:09',null,'0');
insert into `forum` values ('3','100','2','小红','0','42','测试标题3','关键字3','dec2','#','标签','/static/img/img_temp.jpg','测试文章内容3','2025-06-20 07:32:09','2025-06-20 07:32:09',null,'0');
insert into `forum` values ('4','100','2','小红','0','22','测试标题4','关键字4','dec3','#','标签','/static/img/img_temp.jpg','测试文章内容4','2025-06-20 07:32:09','2025-06-20 07:32:09',null,'0');

insert into `forum_type` values ('1','休闲','描述','/article/list?type_id=1','0',null,'2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `forum_type` values ('2','娱乐','企业信息描述描述描述描述','/article/list?type_id=2','0',null,'2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `forum_type` values ('3','开心','操作帮助描述描述描述','/article/list?type_id=3','0',null,'2025-06-20 07:32:09','2025-06-20 07:32:09');


insert into `notice` values ('1','公告标题1','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `notice` values ('2','公告标题2','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `notice` values ('3','公告标题3','公告，是指政府、团体对重大事件当众正式公布或者公开宣告，宣布。国务院2012年4月16日发布、2012年7月1日起施行的《党政机关公文处理工作条例》，对公告的使用表述为：“适用于向国内外宣布重要事项或者法定事项”。其中包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等。','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `notice` values ('4','公告标题4','公告，包含两方面的内容：一是向国内外宣布重要事项，公布依据政策、法令采取的重大行动等；二是向国内外宣布法定事项，公布依据法律规定告知国内外的有关重要规定和重大行动等','2025-06-20 07:32:09','2025-06-20 07:32:09');


insert into `praise` values ('2','1','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','7','1');
insert into `praise` values ('25','5','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','9','1');
insert into `praise` values ('26','5','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','7','1');
insert into `praise` values ('27','5','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','7','1');
insert into `praise` values ('44','2','2025-06-20 07:32:09','2025-06-20 07:32:09','forum','forum_id','2','1');
insert into `praise` values ('50','2','2025-06-20 07:32:09','2025-06-20 07:32:09','forum','forum_id','2','1');
insert into `praise` values ('54','2','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','9','1');
insert into `praise` values ('57','0','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','10','1');
insert into `praise` values ('86','0','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','6','1');
insert into `praise` values ('101','7','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','7','1');
insert into `praise` values ('108','2','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','8','1');
insert into `praise` values ('221','0','2025-06-20 07:32:09','2025-06-20 07:32:09','article','article_id','2','1');

insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');

insert into `auth` values ('1','管理员','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','1','1','1','full_name,gender','full_name,gender','full_name,gender',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('2','管理员','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','1','1','1','full_name,gender','full_name,gender','full_name,gender',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('3','管理员','景点信息','scenic_spot_information','景点信息','/scenic_spot_information/table','','_blank','1','1','1','1','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('4','管理员','景点信息','scenic_spot_information','景点信息详情','/scenic_spot_information/view','','_blank','1','1','1','1','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('5','管理员','景点信息','scenic_spot_information','景点信息','/scenic_spot_information/list','top','_blank','1','1','1','1','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('6','管理员','景点信息','scenic_spot_information','景点信息详情','/scenic_spot_information/details','','_blank','1','1','1','1','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('7','管理员','类型管理','type_management','类型管理','/type_management/table','','_blank','1','1','1','1','scenic_spot_type','scenic_spot_type','scenic_spot_type',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('8','管理员','类型管理','type_management','类型管理详情','/type_management/view','','_blank','1','1','1','1','scenic_spot_type','scenic_spot_type','scenic_spot_type',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('9','管理员','酒店信息','hotel_information','酒店信息','/hotel_information/table','','_blank','1','1','1','1','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('10','管理员','酒店信息','hotel_information','酒店信息详情','/hotel_information/view','','_blank','1','1','1','1','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('11','管理员','酒店信息','hotel_information','酒店信息','/hotel_information/list','top','_blank','1','1','1','1','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('12','管理员','酒店信息','hotel_information','酒店信息详情','/hotel_information/details','','_blank','1','1','1','1','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('13','管理员','路线申请','route_application','路线申请','/route_application/table','','_blank','1','1','1','1','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('14','管理员','路线申请','route_application','路线申请详情','/route_application/view','','_blank','1','1','1','1','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('15','管理员','路线申请','route_application','路线申请编辑','/route_application/edit','','_blank','1','1','1','1','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('16','管理员','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('17','管理员','评论','comment','评论列表','/comment/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('18','管理员','评论','comment','评论详情','/comment/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('19','管理员','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('20','管理员','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('21','管理员','论坛','forum','在线留言','/forum/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"import_db":true,"export_db":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('22','管理员','论坛','forum','在线留言','/forum/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('23','管理员','论坛','forum','在线留言','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('24','管理员','论坛','forum','在线留言','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_show_comment":true,"can_comment":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('25','管理员','论坛分类','forum_type','留言分类','/forum_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('26','管理员','论坛分类','forum_type','留言分类','/forum_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('27','管理员','新闻','article','景点资讯','/article/table','','_blank','1','1','1','1','','','',null,'0','{"print":true,"import_db":true,"export_db":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('28','管理员','新闻','article','景点资讯','/article/view','','_blank','1','1','1','1','','','',null,'0','{"print":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('29','管理员','新闻','article','景点资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('30','管理员','新闻','article','景点资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_show_comment":true,"can_comment":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('31','管理员','新闻分类','article_type','资讯分类','/article_type/table','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('32','管理员','新闻分类','article_type','资讯分类','/article_type/view','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('33','游客','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','1','0','0','0','full_name,gender','full_name,gender','full_name,gender',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('34','游客','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','1','0','0','0','full_name,gender','full_name,gender','full_name,gender',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('35','游客','景点信息','scenic_spot_information','景点信息','/scenic_spot_information/table','','_blank','0','0','0','0','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('36','游客','景点信息','scenic_spot_information','景点信息详情','/scenic_spot_information/view','','_blank','0','0','0','0','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('37','游客','景点信息','scenic_spot_information','景点信息','/scenic_spot_information/list','top','_blank','0','0','0','0','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('38','游客','景点信息','scenic_spot_information','景点信息详情','/scenic_spot_information/details','','_blank','0','0','0','0','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('39','游客','类型管理','type_management','类型管理','/type_management/table','','_blank','0','0','0','0','scenic_spot_type','scenic_spot_type','scenic_spot_type',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('40','游客','类型管理','type_management','类型管理详情','/type_management/view','','_blank','0','0','0','0','scenic_spot_type','scenic_spot_type','scenic_spot_type',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('41','游客','酒店信息','hotel_information','酒店信息','/hotel_information/table','','_blank','0','0','0','0','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('42','游客','酒店信息','hotel_information','酒店信息详情','/hotel_information/view','','_blank','0','0','0','0','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('43','游客','酒店信息','hotel_information','酒店信息','/hotel_information/list','top','_blank','0','0','0','0','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('44','游客','酒店信息','hotel_information','酒店信息详情','/hotel_information/details','','_blank','0','0','0','0','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('45','游客','路线申请','route_application','路线申请','/route_application/table','','_blank','0','0','0','0','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('46','游客','路线申请','route_application','路线申请详情','/route_application/view','','_blank','0','0','0','0','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('47','游客','路线申请','route_application','路线申请编辑','/route_application/edit','','_blank','0','0','0','0','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('48','游客','我的收藏','collect','我的收藏','/collect/list','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('49','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('50','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('51','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('52','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('53','游客','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"import_db":false,"export_db":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('54','游客','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('55','游客','论坛','forum','在线留言','/forum/list','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('56','游客','论坛','forum','在线留言','/forum/details','','_blank','0','0','0','1','','','',null,'0','{"can_show_comment":true,"can_comment":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('57','游客','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('58','游客','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('59','游客','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"import_db":false,"export_db":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('60','游客','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('61','游客','新闻','article','景点资讯','/article/list','','_blank','0','0','0','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('62','游客','新闻','article','景点资讯','/article/details','','_blank','0','0','0','1','','','',null,'0','{"can_show_comment":true,"can_comment":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('63','游客','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('64','游客','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('65','普通用户','普通用户','ordinary_users','普通用户','/ordinary_users/table','','_blank','0','0','0','0','full_name,gender','full_name,gender','full_name,gender',null,'0','{}', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('66','普通用户','普通用户','ordinary_users','普通用户详情','/ordinary_users/view','','_blank','0','0','0','0','full_name,gender','full_name,gender','full_name,gender',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('67','普通用户','景点信息','scenic_spot_information','景点信息','/scenic_spot_information/table','','_blank','0','0','0','0','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}',     '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('68','普通用户','景点信息','scenic_spot_information','景点信息详情','/scenic_spot_information/view','','_blank','0','0','0','0','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}',   '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('69','普通用户','景点信息','scenic_spot_information','景点信息','/scenic_spot_information/list','top','_blank','1','1','1','1','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}',   '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('70','普通用户','景点信息','scenic_spot_information','景点信息详情','/scenic_spot_information/details','','_blank','1','1','1','1','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots','name_of_scenic_spot,scenic_spot_type,opening_hours,scenic_spot_telephone,scenic_spot_address,cover_photo_,recommended_hotel,route_recommendation,introduction_to_scenic_spots',null,'0','{}', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('71','普通用户','类型管理','type_management','类型管理','/type_management/table','','_blank','0','0','0','0','scenic_spot_type','scenic_spot_type','scenic_spot_type',null,'0','{}',  '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('72','普通用户','类型管理','type_management','类型管理详情','/type_management/view','','_blank','0','0','0','0','scenic_spot_type','scenic_spot_type','scenic_spot_type',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('73','普通用户','酒店信息','hotel_information','酒店信息','/hotel_information/table','','_blank','0','0','0','0','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('74','普通用户','酒店信息','hotel_information','酒店信息详情','/hotel_information/view','','_blank','0','0','0','0','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('75','普通用户','酒店信息','hotel_information','酒店信息','/hotel_information/list','top','_blank','1','1','1','1','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('76','普通用户','酒店信息','hotel_information','酒店信息详情','/hotel_information/details','','_blank','1','1','1','1','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile','hotel_name,hotel_telephone,cover_photo_,nearby_scenic_spots,hotel_address,hotel_profile',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('77','普通用户','路线申请','route_application','路线申请','/route_application/table','','_blank','0','1','0','1','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('78','普通用户','路线申请','route_application','路线申请详情','/route_application/view','','_blank','0','1','0','1','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message','name_of_scenic_spot,applicant,full_name,contact_number,approval_status,route_information,reply_message',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('79','普通用户','路线申请','route_application','路线申请编辑','/route_application/edit','','_blank','1','1','1','1','full_name,route_information,contact_number,applicant,name_of_scenic_spot','full_name,route_information,contact_number,applicant,name_of_scenic_spot','full_name,route_information,contact_number,applicant,name_of_scenic_spot',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('80','普通用户','我的收藏','collect','我的收藏','/collect/list','','_blank','1','1','1','1','','','',null,'0','{}', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('81','普通用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}',  '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('82','普通用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}',   '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('83','普通用户','评论','comment','我的评论','/comment/list','','_blank','1','1','1','1','','','',null,'0','{}',   '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('84','普通用户','评论','comment','评论详情','/comment/details','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('85','普通用户','论坛','forum','论坛列表','/forum/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"import_db":false,"export_db":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('86','普通用户','论坛','forum','论坛详情','/forum/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('87','普通用户','论坛','forum','在线留言','/forum/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('88','普通用户','论坛','forum','在线留言','/forum/details','','_blank','1','1','1','1','','','',null,'0','{"can_show_comment":true,"can_comment":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('89','普通用户','论坛分类','forum_type','论坛分类列表','/forum_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('90','普通用户','论坛分类','forum_type','论坛分类详情','/forum_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('91','普通用户','新闻','article','新闻列表','/article/table','','_blank','0','0','0','0','','','',null,'0','{"print":false,"import_db":false,"export_db":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('92','普通用户','新闻','article','新闻详情','/article/view','','_blank','0','0','0','0','','','',null,'0','{"print":false}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('93','普通用户','新闻','article','景点资讯','/article/list','','_blank','1','1','1','1','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('94','普通用户','新闻','article','景点资讯','/article/details','','_blank','1','1','1','1','','','',null,'0','{"can_show_comment":true,"can_comment":true}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('95','普通用户','新闻分类','article_type','新闻分类列表','/article_type/table','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `auth` values ('96','普通用户','新闻分类','article_type','新闻分类详情','/article_type/view','','_blank','0','0','0','0','','','',null,'0','{}','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `user_group` values ('3','100','普通用户',null,'ordinary_users','ordinary_users_id','0','3','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `slides` values ('1','轮播图1','内容1','/article/details?article=1','/api/upload/image_1615198876390.jpg','28', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `slides` values ('2','轮播图2','内容2','/article/details?article=2','/api/upload/image_1615206244488.jpg','284','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `slides` values ('3','轮播图3','内容3','/article/details?article=3','/api/upload/image_1615206244550.jpg','695','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `slides` values ('4','轮播图4','内容4','/article/details?article=4','/api/upload/image_1615206244747.jpg','51', '2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `slides` values ('5','轮播图5','内容5','/article/details?article=5','/api/upload/image_1615198875722.jpg','614','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `slides` values ('6','轮播图6','内容6','/article/details?article=6','/api/upload/image_1615198875981.jpg','449','2025-06-20 07:32:09','2025-06-20 07:32:09');
insert into `article` values ('1','它是沈从文《边城》的原型，处在三省交界处，风景如画游客不多','风景','80','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>很多人旅游都是为了放松自己紧张的心情，所以很多人都想要找一个风景秀美而且比较僻静的地方，这样不仅可以更好的放松心情，而且还能够增进一同旅行的人的感情，正是因为这样的人多了，所以古镇文化才会慢慢兴起。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/258/w640h418/20210324/766a-kmvwsvx6547318.png"></p><p>地处三省交界</p><p>周边游让古镇文化一度非常火热，很多城市都斥巨资兴建了不少的仿古城，虽然没有古城的古色古香，但是跟平时见到的景色也有很大的不同。很多传承已久的古城也再度散发出了魅力，吸引了不少旅客的游览。</p><p>而在重庆东南部就有一个风景秀丽可是游览人数却不是很多的古镇，这个地方就是洪安古镇。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/256/w640h416/20210324/bb25-kmvwsvx6547323.png"></p><p>古镇介绍</p><p>很多人听到洪安古镇都是一愣，因为重庆的热门景点中很少提及这个古镇，但其实这座古镇却是大有来头，因为是大文豪沈从文的小说《边城》的原型，所以有不少人慕名而来，全镇总面积有52平方公里，所以景点还是不少的。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/257/w640h417/20210324/9a8e-kmvwsvx6547320.png"></p><p>洪安古镇位于湖南、重庆、贵州三个省的交界处，之前是一个三不管的地方，所以经济比较落后，但是后来划入重庆之后得到了快速的发展，镇民们的生活也过的越来越富足，很多游客到这里都可以感受到乡亲们的热情和友善。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/252/w640h412/20210324/44ea-kmvwsvx6547327.png"></p><p>秀美风光</p><p>洪安古镇的自然风光十分秀丽，这里依山傍水气候湿润，成片的绿树让古镇空气十分清新，河水在微风的吹拂下泛起了点点波光，美得就像一幅画一样。</p><p>而且洪安古镇是土家族风格的建筑，由石板铺成的街道配上青砖黑瓦风格的土家族建筑，让人可以感到浓郁的历史气息，不仅沈从文先生描写过这个地方，就连二野大军进入大西南的时候，司令部都在这里驻扎过很长一段时间。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/269/w640h429/20210324/e034-kmvwsvx6547326.png"></p><p>特色美食</p><p>除了特色的风光和历史之外，洪安古镇还有“一锅煮三省”的洪安腌菜鱼，为什么说是一锅煮三省呢？湖南的鱼鲜和贵州的豆腐再加上重庆的腌菜，三省的美食汇聚一锅，才能形成特色的洪安腌菜鱼。三种味道融合成一道菜，你中有我我中有你，不仅鲜辣可口而且相互不冲味，显得十分和谐。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/263/w640h423/20210324/ce96-kmvwsvx6547325.png"></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('2','捷映 | 胜日寻芳，美丽的春日风景，记录在视频里的春天故事','风景','767','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>胜日寻芳泗水滨，无边光景一时新。几处早莺争暖树，谁家新燕啄春泥。春天来了，脑海中不由得就会浮现出诗中那般美好的事物。春天是万物复苏的季节，阳光明媚，春风轻拂，更能带来好心情，欣赏春日风景，记录下春日生活中美好的点点滴滴。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/533/w1280h853/20210325/d624-kmvwsvx9676473.jpg"></p><p>阳光照耀大地，春风带走寒冬的凛冽，天气变暖，搬上一张摇椅，在院子里晒晒太阳，偶尔翻上几本小说，享受一份春日的慵懒。与家人一起在公园中散散步，河水轻荡，波光粼粼，柳树随风招展，小草吐露新芽，花儿开始绽放，鸟儿在枝头雀跃，一片祥和的景象，如此美好，净化心灵。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/640/w1280h960/20210325/336a-kmvwsvx9677403.jpg"></p><p>春天是郊游踏青的好季节，约上三两好友，来一场春游，看看田间风吹麦浪，犹如绿色的海洋，金黄油菜花在太阳下闪闪发光，偶尔有几个小孩子在田间奔跑追逐，或放风筝，或嬉戏打闹。春风送来阵阵泥土的芬芳，天上云朵片片，美丽的春天田野，如诗如画。和好友一起畅游在天地间，感受春天的气息，一起回忆往昔的美好。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/533/w1280h853/20210325/3b74-kmvwsvx9678046.jpg"></p><p>春天也是一个谈恋爱的好季节，去年春日此门中，人面桃花相映红。桃花绽放，与喜欢的人一起欣赏桃花林，樱花树下，洁白的樱花飘落，为爱情装点一份浪漫。春水初生，春林初盛，春风十里不如你。桃花，杏花，樱花，各种花儿绽放，万紫千红，点缀大地，但最美的风景不过身边的人，落花人独立，微雨燕双飞。佳人如仙子，宛若画中来。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/480/w1280h800/20210325/78b5-kmvwsvx9678643.jpg"></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('3','潍坊科技学院：万物生 春意浓 莫负好风景','风景','433','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>【潍坊科技学院：万物生 春意浓 莫负好风景】春回大地，万物复苏，潍坊科技学院内，朵朵洋红，开得恣意汪洋。在教学楼外徘徊，看室内书香云霭，闻室外花香成海。碧湖倒影映白云，湖中柳，柳中湖。我还是很喜欢你，潍科的春天。</p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/358/w1200h758/20210326/ce67-kmvwsvy1582392.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/784/w1200h1984/20210326/9604-kmvwsvy1582489.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/120/w1080h1440/20210326/3827-kmvwsvy1582590.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/400/w1200h800/20210326/e26d-kmvwsvy1582860.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/223/w1200h623/20210326/f589-kmvwsvy1582957.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/337/w1200h737/20210326/2f54-kmvwsvy1583185.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/474/w800h474/20210326/ab8b-kmvwsvy1583399.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/752/w1080h1272/20210326/506e-kmvwsvy1583479.jpg"></p><p><img src="http://n.sinaimg.cn/sinakd20210326ac/379/w1200h779/20210326/8d2f-kmvwsvy1583645.jpg"></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('4','团风县历史悠久、风景优美,历来是兵家必争之地','风景','786','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/205/w640h365/20210324/4554-kmvwsvx7002792.jpg"></p><p>团风县，隶属于湖北省黄冈市，位于湖北省东部，团风历史悠久，始于唐代，至宋代形成集市。历史上古镇团风历来是兵家必争之地，曹操曾屯兵乌林，朱元璋曾在这里战败陈友谅；素来商业繁盛，明、清年间商贾云集，集市繁荣，是长江沿岸的商业重埠之一。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/188/w640h348/20210324/7a9c-kmvwsvx7002795.jpg"></p><p>01</p><p>大崎山</p><p>大崎山矗立在大别山南麓，长江北岸，素有鄂东泰山之誉。主峰龙王顶海拔1040.8米，山体呈东西走向，东南横卧小崎山、祷雨山，西北耸立接天山。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/111/w500h411/20210324/5690-kmvwsvx7002796.jpg"></p><p>大崎山山高林密，苍翠欲滴。崎山叠翠在明代弘治年间就被誉为八景之一。明代诗人茅瑞徽有诗“崎山高不及，半岭看云低。乱石分排戟，飞梁回作梯。天风传远梵，人籁出烟溪。直拟扪箩上，跻攀境屡迷。”这首诗已把畸山景色一表无余，如今大崎山更是有许多让人流连忘返的景点，如“龙王井”的古泉，“海沙芦苇”的奇异；“仙人石”万斤巨石推之则转；“接天石”的奇险美景；“夕照壁”的万点等等，都有着独，的景致及动人的传说。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/37/w500h337/20210324/7fb6-kmvwsvx7002793.jpg"></p><p>大崎山山高险峻，雄奇俊美，决定了她与宗教有十分密切的关系，位于南山腰姝的能仁寺，历史悠久，源远流长。据弘治《黄州府志》记载：“能仁寺，在永宁寺崎山，昔密云寺禅师修道之所。”相传能仁寺（今称大庙）在唐代最为鼎盛，梵宇建筑宏伟，共有70条干道，81口天井，僧众三千人，受皇上敕封。</p><p>现存有一大石碑，遒劲的“唐敕能仁”四个大字，向人们昭示着当年能仁寺的宏伟气派。接天山的“真武观”道教，据说历史上曾经与武当山的道教齐名天下，受到四方朝拜，还有“龙王寺”，也曾有过辉煌的历史。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/89/w640h249/20210324/6a15-kmvwsvx7002801.jpg"></p><p>大崎山古时隶属湖北黄州府永宁乡。永宁乡所涵盖的区域包括现今的罗田县大崎乡、三里畈镇一部分；麻城夫子河镇一部分；武汉市新州区道观河一小部分；团风县贾庙乡、但店一部分。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/37/w500h337/20210324/1787-kmvwsvx7002794.jpg"></p><p>02</p><p>神山寨</p><p>神山寨本名神仙寨，是团风县（古称乌林）方高坪镇境内的一座山，海拔不高，也非名山大岳，但却是鄂东北部大别山区和南部长江冲积区之间的天然分界线，也是长江北岸一个重要的军事战略屏障。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/272/w640h432/20210324/abeb-kmvwsvx7002798.jpg"></p><p>北眺大别山，青松观即掩映于半山腰的青松之间，观内与三年前的情形无太大差别，大殿内供奉着三清真人、观世音圣母、护法天王等尊神，主持也依然是那位卦辞读得不利索的年长道姑。最大的变化要算大殿南侧新增的侧殿，供奉有送子观音像，当然观内的香火似乎更旺了，谁叫人世间多苦难．．．．．忆及三年前初登神山寨，余等三人，问卦于神前，或应验，或不验；今余三人，再访青松观，或卜之，或远之。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/37/w500h337/20210324/177d-kmvwsvx7002797.jpg"></p><p><br></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('5','有“广东最美湖泊”之称,还曾登上小学课本,风景优美却鲜少人知','风景','16','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>说起广东，大家肯定不会陌生，作为我国经济最发达的省份，境内很多城市都家喻户晓，而随着近几年来我国旅游业的兴起，越来越多游客也来到了广东旅游，不过，大家所观光的，无非就是像广州、珠海此类的大城市，殊不知，在广东境内，还藏有一个美丽的湖北，它有“广东最美湖泊”的美誉，同时还登上过小学课本，风景优美却鲜少人知。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/272/w640h432/20210324/dc34-kmvwsvx6922641.jpg"></p><p>这座湖泊就是湖光岩风景区，想必很多广东的朋友都或多或少听说过，它地处于湛江市区西南18公里处，总面积达38平方公里，是一座以玛珥火山地质地貌为主体的自然生态公园，境内由雷琼世界地质公园博物馆、楞严寺、李纲醉月雕像、美食欢乐园、清风林、火山地质遗迹、白牛仙女雕像等20个景点组成的4A级国家景区。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/272/w640h432/20210324/598a-kmvwsvx6922649.jpg"></p><p>很多人都以为湖光岩风景区是一座现代所建造的风景区，其实不然，景区内有很多景点都是古代所建，例如依岩而建的楞严寺，就是始建于隋代末年，同时还是全国十八大古刹之一，还有宋朝所建的白衣庵，就连景区的名字，也是宋朝丞相李纲所起。当时正值金军犯境，李纲作为宋朝抗金名将，与奸臣秦桧不合，所以被其所害，被贬海南，在路途中看到了此地，于是便在摩崖石上刻下了“湖光岩”。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/272/w640h432/20210324/7fd9-kmvwsvx6922647.jpg"></p><p>而湖光岩风景区是在2001年才正式对外开放，其中最具代表性的景点就是玛珥湖，玛珥湖是距今14—16万年前由平地火山爆炸后冷却下沉形成的玛珥式火山湖，湖深400多米，由于四周被山体包围，常年不受外界干扰，所以湖底有很多具有历史价值的样本。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/270/w640h430/20210324/a103-kmvwsvx6922645.jpg"></p><p>其次还有龙鱼神龟，想必很多人都在景区之中见到过这两尊雕像，而这两座雕像并不是平白无故建立在此的，传说在1998年的5月28日，国防大学将军班在游览景区时，发现了传说中4米多长的龙鱼和近2米宽的大龟遨游湖中的奇观，并且有60人看见，在此之后陆续又有很多人看到这一奇观，景区也为此在东门广场修建龙鱼神龟雕像。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/272/w640h432/20210324/a8d8-kmvwsvx6922650.jpg"></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('6','捷映 | 胜日寻芳，美丽的春日风景，记录在视频里的春天故事','风景','393','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>胜日寻芳泗水滨，无边光景一时新。几处早莺争暖树，谁家新燕啄春泥。春天来了，脑海中不由得就会浮现出诗中那般美好的事物。春天是万物复苏的季节，阳光明媚，春风轻拂，更能带来好心情，欣赏春日风景，记录下春日生活中美好的点点滴滴。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/533/w1280h853/20210325/d624-kmvwsvx9676473.jpg"></p><p>阳光照耀大地，春风带走寒冬的凛冽，天气变暖，搬上一张摇椅，在院子里晒晒太阳，偶尔翻上几本小说，享受一份春日的慵懒。与家人一起在公园中散散步，河水轻荡，波光粼粼，柳树随风招展，小草吐露新芽，花儿开始绽放，鸟儿在枝头雀跃，一片祥和的景象，如此美好，净化心灵。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/640/w1280h960/20210325/336a-kmvwsvx9677403.jpg"></p><p>春天是郊游踏青的好季节，约上三两好友，来一场春游，看看田间风吹麦浪，犹如绿色的海洋，金黄油菜花在太阳下闪闪发光，偶尔有几个小孩子在田间奔跑追逐，或放风筝，或嬉戏打闹。春风送来阵阵泥土的芬芳，天上云朵片片，美丽的春天田野，如诗如画。和好友一起畅游在天地间，感受春天的气息，一起回忆往昔的美好。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/533/w1280h853/20210325/3b74-kmvwsvx9678046.jpg"></p><p>春天也是一个谈恋爱的好季节，去年春日此门中，人面桃花相映红。桃花绽放，与喜欢的人一起欣赏桃花林，樱花树下，洁白的樱花飘落，为爱情装点一份浪漫。春水初生，春林初盛，春风十里不如你。桃花，杏花，樱花，各种花儿绽放，万紫千红，点缀大地，但最美的风景不过身边的人，落花人独立，微雨燕双飞。佳人如仙子，宛若画中来。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/480/w1280h800/20210325/78b5-kmvwsvx9678643.jpg"></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('7','团风县历史悠久、风景优美,历来是兵家必争之地','风景','909','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/205/w640h365/20210324/4554-kmvwsvx7002792.jpg"></p><p>团风县，隶属于湖北省黄冈市，位于湖北省东部，团风历史悠久，始于唐代，至宋代形成集市。历史上古镇团风历来是兵家必争之地，曹操曾屯兵乌林，朱元璋曾在这里战败陈友谅；素来商业繁盛，明、清年间商贾云集，集市繁荣，是长江沿岸的商业重埠之一。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/188/w640h348/20210324/7a9c-kmvwsvx7002795.jpg"></p><p>01</p><p>大崎山</p><p>大崎山矗立在大别山南麓，长江北岸，素有鄂东泰山之誉。主峰龙王顶海拔1040.8米，山体呈东西走向，东南横卧小崎山、祷雨山，西北耸立接天山。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/111/w500h411/20210324/5690-kmvwsvx7002796.jpg"></p><p>大崎山山高林密，苍翠欲滴。崎山叠翠在明代弘治年间就被誉为八景之一。明代诗人茅瑞徽有诗“崎山高不及，半岭看云低。乱石分排戟，飞梁回作梯。天风传远梵，人籁出烟溪。直拟扪箩上，跻攀境屡迷。”这首诗已把畸山景色一表无余，如今大崎山更是有许多让人流连忘返的景点，如“龙王井”的古泉，“海沙芦苇”的奇异；“仙人石”万斤巨石推之则转；“接天石”的奇险美景；“夕照壁”的万点等等，都有着独，的景致及动人的传说。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/37/w500h337/20210324/7fb6-kmvwsvx7002793.jpg"></p><p>大崎山山高险峻，雄奇俊美，决定了她与宗教有十分密切的关系，位于南山腰姝的能仁寺，历史悠久，源远流长。据弘治《黄州府志》记载：“能仁寺，在永宁寺崎山，昔密云寺禅师修道之所。”相传能仁寺（今称大庙）在唐代最为鼎盛，梵宇建筑宏伟，共有70条干道，81口天井，僧众三千人，受皇上敕封。</p><p>现存有一大石碑，遒劲的“唐敕能仁”四个大字，向人们昭示着当年能仁寺的宏伟气派。接天山的“真武观”道教，据说历史上曾经与武当山的道教齐名天下，受到四方朝拜，还有“龙王寺”，也曾有过辉煌的历史。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/89/w640h249/20210324/6a15-kmvwsvx7002801.jpg"></p><p>大崎山古时隶属湖北黄州府永宁乡。永宁乡所涵盖的区域包括现今的罗田县大崎乡、三里畈镇一部分；麻城夫子河镇一部分；武汉市新州区道观河一小部分；团风县贾庙乡、但店一部分。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/37/w500h337/20210324/1787-kmvwsvx7002794.jpg"></p><p>02</p><p>神山寨</p><p>神山寨本名神仙寨，是团风县（古称乌林）方高坪镇境内的一座山，海拔不高，也非名山大岳，但却是鄂东北部大别山区和南部长江冲积区之间的天然分界线，也是长江北岸一个重要的军事战略屏障。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/272/w640h432/20210324/abeb-kmvwsvx7002798.jpg"></p><p>北眺大别山，青松观即掩映于半山腰的青松之间，观内与三年前的情形无太大差别，大殿内供奉着三清真人、观世音圣母、护法天王等尊神，主持也依然是那位卦辞读得不利索的年长道姑。最大的变化要算大殿南侧新增的侧殿，供奉有送子观音像，当然观内的香火似乎更旺了，谁叫人世间多苦难．．．．．忆及三年前初登神山寨，余等三人，问卦于神前，或应验，或不验；今余三人，再访青松观，或卜之，或远之。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210324ac/37/w500h337/20210324/177d-kmvwsvx7002797.jpg"></p><p><br></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('8','比较新十大暑假旅游景点排行','风景','860','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>炎热的夏季，暑气逼人，暑期长假即将来临，那么漫漫暑期，到底选择去<span style="color: rgb(51, 51, 51);">什么地方避暑好呢</span>?以下小编为您整理一份<span style="color: rgb(51, 51, 51);">比较新十大暑假旅游景点排行</span>，供您参考。<span style="color: rgb(255, 255, 255);">www.chinapp.com 品牌网</span></p><p><br></p><p class="ql-align-center"><img src="https://img.chinapp.com/uploadfile/2014/0624/20140624113933255.png"></p><p>1、桂林</p><p>理由：桂林地区属岩溶地貌，这些特殊的地貌与景象万千的漓江及其周围美丽迷人的田园风光融为一体，形成了独具一格、驰名中外的“山清、水秀、洞奇、石美”的“桂林山水”。这时的山，平地拔起，千姿百态;漓江的水，蜿蜒曲折，明洁如镜;山多有洞，洞幽景奇，瑰丽壮观;洞中怪石，鬼斧神工，琳琅满目，而自上而下应有“山水甲天下”的赞誉。</p><p>2、长白山</p><p>理由：长白山是风光秀丽、景色迷人的关东第一山，景观绮丽迷人，驰名中外，登上群峰之冠，可谓“一览众山小”!由于山地地形垂直变化的影响，长白山从山脚到山顶，随着调高度的增加形成了由温带到寒带的4个景观带，这在世界上是罕见的，“一山有四季，十里不同天”，在这时可以度过一个不一样的夏季了。</p><p>3、神农架</p><p>理由：神农架冰山位于湖北省，这里有奇特的风洞、雷洞、闪洞、雾洞等自然奇观。其中神秘莫测的冰洞里还有冰柱、冰剑、冰坠、冰塔、冰珠等，千种奇象，万种神态，寒光皎洁，妖娆夺目。如果你喜欢，还可以在这里做一次惊心动魄的漂流。总的来说，在炎炎的夏季来这里感受一份难得的凉爽，是比较好不过的事情了。</p><p>4、庐山</p><p>理由：几千万年前的地壳运动，造就了庐山叠嶂九层、崇岭万仞的赫赫气势，伴生出峰诡不穷、怪石不绝的阳刚之美。由于庐山高耸于江湖之间，雨量丰富，年降水量可达2000毫米，故山中温差大，云雾多，千姿百态，变幻无穷。到庐山旅游，不可不体味庐山的云雾之美。至此消暑，环境幽静，烦热顿消，成为全国著名的避暑胜地。</p><p><br></p><p class="ql-align-center"><img src="https://img.chinapp.com/uploadfile/2014/0624/20140624113955479.png"></p><p>5、乌镇</p><p>理由：乌镇是一个历史悠久，文化氛围浓郁的水乡古镇。这时除了具备小桥、流水、人家的水乡风情和精巧雅致的民居建筑之外，更多地飘逸着一股浓郁的历史和文化气息。在这座小镇，历史上曾出过64个进士，161个举人。现代中国的文学巨匠DD茅盾，也诞生在这个小镇上。</p><p>6、承德避暑山庄</p><p>理由：承德位于湖北省东北部，这里山环水绕，林木苍郁，风景秀丽，气候宜人。我国比较大的古典皇家园林“避暑山庄”和大型寺庙群“外八庙”就坐落在市区北新半部。整个山庄殿宇巍峨，丁朴典雅;明湖百倾，洲岛错落;平川旷野，芳草如茵;山峦苍翠，林木葱郁，很是凉爽。</p><p>7、北戴河</p><p>理由：北戴河 位于河北省秦皇岛市西南，南临渤海，北靠联峰山，海滩漫长曲折，沙软潮平，林木苍翠，水面凉气轻拂，是著名的海滨避暑胜地。盛夏季节，这里气候宜人，游人置身其间，心旷神怡，暑气皆消。</p><p><br></p><p class="ql-align-center"><img src="https://img.chinapp.com/uploadfile/2014/0624/20140624114022875.png"></p><p>8.安徽黄山</p><p>理由：安徽,世界文化与自然遗产,世界地质公园,三山五岳中三山之一,国家5A级风景区,著名避暑胜地</p><p>9.九寨沟-黄龙</p><p>理由：四川,世界自然遗产,国家5A级风景区,国家森林公园,全国重点风景名胜区,中国十大风景名胜区</p><p>10.苏州园林</p><p>理由：世界文化与自然遗产,拙政园/留园/网狮园/环秀山庄等,中国古典园林建筑的典范,国家5A级旅游景区</p><p>来源 品牌网 chinapp.com 转载请注明出处</p>','',null);
insert into `article` values ('9','深圳旅游景点排行','风景','632','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>深圳作为中国的四大一线城市之一，虽然没有北京文化古城的韵味，却有着现代化的时尚感。如果，您打算去深圳旅游，那么，您应该去品牌网小编为您推荐的<span style="color: rgb(51, 51, 51);">几个好看的旅游景点</span>。下面一起来看看<span style="color: rgb(51, 51, 51);">深圳旅游景点排名</span>吧。</p><p><span style="color: rgb(51, 51, 51);"> 一，世界之窗</span></p><p>世界之窗位于深圳湾畔的华侨城内，占地48万平方米。她以弘扬世界文化为宗旨，把世界奇观、历史遗迹、古今名胜、民间歌舞表演汇集一园，以"您给我一天，我给您一个美妙的世界"为号召，营造了一个精彩美妙的世界。世界之窗景区按五大洲划分，与世界广场、世界雕塑园、国际街、侏罗纪天地共同构成千姿万态、美妙绝伦的世界。118个景点按不同比例自由仿建，精巧别致，惟妙惟肖，令游客叹为观止。如果说世界之窗的一个个景点是一首首凝固的交响诗，那么异彩纷呈的民俗表演则是一幅幅活动的风情画。每当华灯初上，在世界广场上演的大型歌舞和狂欢巡游，更是把世界之窗的主题--"世界与您共欢乐"表现得淋漓尽致。</p><p><span style="color: rgb(51, 51, 51);"> 二，野生动物园</span></p><p>野生动物园建于深圳西丽湖畔，占地面积120万平方米，是我国第一家集动物园、植物园、科普园等多种园艺、观赏功能为一体的亚热带新型园林生态环境风景区。园内放养着来自世界各洲的300多个品种、一万多头(只)动物，有不少属于世界珍禽名曾和我国一、二级保护动物。马戏、群象、海豹、鸟类四个表演馆将游客带入一座座神奇、欢乐的世界;还有别具情趣的百鸟乐园、儿童乐园、猴山、鳄鱼湖、水族馆、鹦鹉小径、观景天桥和了望塔等。每日推出的大型动物广场艺术表演是目前世界动物园中绝无仅有的大制作，节目刺激惊险，场面神秘壮观，使人有"体验野性，回归自然"之感。</p><p><span style="color: rgb(51, 51, 51);"> 三，锦绣中华微缩景区</span></p><p>锦绣中华微缩景区坐落在深圳湾畔，是一座反映中国历史、文化艺术、古代建筑和民族风情比较丰富、比较生动、比较全面的微缩景区，占地450亩。景区中，近百处景点大致按中国区域版图分布。这里有名列世界八大奇迹的万里长城、秦陵兵马俑有比较古老的石拱桥，比较大的宫殿和佛像比较大的皇家园林，比较长的石窟画廊，海拔比较高比较宏伟的建筑等众多世界之比较;有肃穆庄严的黄帝陵，金碧辉粕的孔庙，雄伟壮观的泰山，险峻挺拔的长江三峡;还有如诗如画的漓江山水，千姿百态的名塔、名寺、名楼、名石窟以及具有民族风情的地方民居;此外，皇帝祭天、光绪大婚、孔庙祭典的场面与民间婚丧嫁娶风俗尽呈眼前，让游客大饱眼福。使游客"一步迈进历史，一天游遍中国"，它可以称做是中国历史之窗、文化之窗、旅游之窗。</p><p><span style="color: rgb(51, 51, 51);"> 四，中国民俗文化村</span></p><p>中国民俗文化村是国内第一个荟萃各民族民间艺术、民俗风情和居民建筑于一园的大型文化游览区，坐落在深圳湾畔，毗邻锦绣中华微缩景区，占地20万平方米。民俗文化村以"源于生活、高于生活、荟集景区、有所取舍"作为建村的指导原则，从不同角度反映我国民族的民俗文化。景区现有21个民族的24个村寨，均按原景的1：1比例建造。游客在村寨里可以了解民族的建筑风格，还可以欣赏和参与各民族的歌舞表演、民族工艺品制作，品尝民族风味食品，观赏民族艺术广场表演和专业水平的歌舞晚会，欢度民间喜庆节日，领略56个民族多姿多彩的文化艺术。</p><p><span style="color: rgb(51, 51, 51);"> 五，青青世界</span></p><p>青青世界位于深圳大南山的月亮湾畔，占地20万平方米，在这里，自然风情与民族文化相融，精致农业与旅游观光互补，形成一种具有浓厚现代色彩的山林野趣，被誉为"第四代旅游产品"的典范。依山而筑的小木屋供游客小住;园艺馆里，引种培植了来自日本，荷兰等国家和地区的数百种花卉;果园也汇集了十多种果树，常年果实累累。陶艺馆，不但可以领略中国传统的陶艺精品，亦让人们体验自己制作的乐趣;侏罗纪公园，藏卧着大大小小，形态逼真的恐龙和鳄鱼;蝴蝶谷内成群的蝴蝶在游客周围翩翩起舞、上下翻飞;还有充满野趣的露营区、烧烤场、钓鱼池、民艺广场等景点。让人实实在在的跳出城市生活节奏，放松心情去体验自然。</p><p><span style="color: rgb(51, 51, 51);"> 六，仙湖植物园</span></p><p>仙湖植物园是以旅游为主，科研科普为辅的风景植物园，坐落在梧桐山。全园分天上人间、天池、湖区、庙区、沙漠和松柏杜鹃五大景区，建有别有洞天、迷宫、天池、芦汀乡渡、仙渡、玉带桥、逍遥谷、野营区、龙蹲塔、听涛阁、揽胜亭等十几处园林景点和棕榈园、竹区、荫生植物区、沙漠植物区、百果园、水生植物园、裸子植物区、国际苏铁保存中心、盆景园、珍稀树木园等十几个植物专类园，保存的植物达三千多种，还有世界上比较大的化石森林。棕榈区草绿茵茵，林葵树分布其间，呈现出一派浓郁的热带风光;室内观赏植物区内，食虫植物伺机捕食，跳舞兰鲜艳的花朵宛然宫女踩着优美的舞步;晨曦中，弘法寺钟声回响，诵经曲徐疾有致，令人肃穆;夕阳下，湖水波光潋潋，绿树亭倒影其中，景色如画……</p><p><span style="color: rgb(51, 51, 51);"> 七，小梅沙</span></p><p>素有"东方夏威夷"之美誉的著名海滨旅游景区--小梅沙位于深圳东部大鹏湾。小梅沙三面青山环抱，一面海水蔚蓝，一弯新月似的沙滩镶嵌在兰天碧波之间。她的环海沙滩延绵千里，海滨浴场洁净开阔，兰色的大海碧波万顷，茂盛的椰树婆娑起舞。放眼望去，海滨沙滩被鲜艳的太阳伞装点得五彩缤纷，游艇犁出浪花，降落伞迎风绽开，墩洲岛巨浪拍岸，千人烧烤场篝火通红。</p><p>来源 品牌网 转载请注明出处</p>','',null);
insert into `article` values ('10','松滋市是一座集工业农业商贸旅游于一体的新兴城市,风景也很美','风景','456','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/4/w534h270/20210325/e6cf-kmvwsvy0000730.jpg"></p><p>松滋市位于湖北省西南部，处于平原和丘陵结合地区，隶属荆州市管辖。是一座集工业农业商贸旅游于一体的新兴城市。2015年被列为第二批国家新型城镇化综合试点地区。2019年3月，被列为第一批革命文物保护利用片区分县名单。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/222/w640h382/20210325/18c8-kmvwsvy0000735.jpg"></p><p>01</p><p>洈水风景区</p><p>洈水水库属亚洲著名的人工淡水湖，洈水大坝全长8968米，属亚洲第一大人工型土坝。湖水浩淼碧澄，天水一色，500个湖心岛在水中崛起，使水面多处分割，几经收放，形成连续的风景区域，湖中有岛，岛中有湖，湖光山色尽在其中；500个半岛群峰毗连，层峦叠嶂，山水相依，可谓"山得水而活，水得山而媚"。有"楚南仙境千岛湖"之美誉。</p><p>洈水森林公园总面积52.8平方公里，森林覆盖率达80%以上，林中无处不飞花，山间处处有芳草，生态环境良好，野生动物资源丰富。春花、夏树、秋月、冬雪，四季美景使森林公园成为天地间最宽敞亮丽的泼墨山水。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/164/w640h324/20210325/a1f9-kmvwsvy0000731.jpg"></p><p>洈水汽车露营地，是集户外运动、观光旅游、休闲养生、度假居住为一体的全国首个五星级汽车自驾运动营地。获露营行业最高奖“鹿鹰奖”。营地依托洈水国家水利风景区森林、湿地、岛屿等多样化自然特色条件，在洈水大坝下的丛林中依势而建，以丛林为主题风格，强化人与自然环境互动。占地407亩（21,193平方米），规划分为主会场区、主营区、特色住宿区、活动娱乐区、配套服务区等五个主体功能区。</p><p>主会场区包括丛林广场和舞台。主营区包括：房车营位区、自驾车营位区、露营帐篷区和商业帐篷区。特色住宿区拥有5个房车花园酒店、15个自驾宝、15间童话主题树屋、5间丛林木屋、5个观星帐篷、4个亲水野奢帐篷等个性化住宿产品。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/224/w640h384/20210325/f780-kmvwsvy0000734.jpg"></p><p>活动娱乐区分为，家庭活动区，包括丛林探险乐园、儿童乐园、戏水池、采摘园。</p><p>运动区，包括笼式足球、攻略箭、垂钓、攀岩、卡丁车等；团建区，包括空中华容道（高低空探险）、丛林野战乐园、过五关斩六将（团队拓展基地）。配套服务区有游客服务中心、淋浴房、洗衣房和卫生间、书吧、茶吧、简餐厅等。</p><p>滤去城市的喧嚣，回归自然的宁静，洈水假日汽车营地将带给您一个亲近自然的时尚、欢乐、放松的浪漫体验。</p><p>洈水湖有500多座岛屿分布在湖四周，有着“楚南仙境千岛湖”之美誉，它们时伸时缩，使湖岸蜿蜒曲折，港汊交错，形成山重水复的美丽风光。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/223/w640h383/20210325/46d9-kmvwsvy0000736.jpg"></p><p>“百岛画廊”位于无数个岛屿之中，仿佛在“水上迷宫”中穿行，也仿佛进入一幅绝妙淡雅的水墨丹青画图中。</p><p>李家河生态岛的春、夏、秋、冬园四季瓜果飘香；白云古渡、白云阁、新神洞，神话传说、历史风云与奇山异水相得益彰。到岛上露营驿站感受幕天席地、枕水听涛的岛上露营，体会李白诗中“飞羽觞而醉月，开琼筵以坐花”的情景，更是别有一番风味。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/139/w640h299/20210325/05eb-kmvwsvy0000737.jpg"></p><p>新神洞以"洞中瀑布"、"边石坝"、"乾坤神柱"、"天宫大幕"等绝景著称"天下第一奇洞"。颜将军洞、古神洞等10多个溶洞奇石叠垒，洞幽玲珑，令人叹为观止。</p><p>02</p><p>言程公园</p><p>言程公园位于湖北省松滋市市区西北方向，由金松大道、贺炳炎大道和环湖路围合而成。东接环湖路，南邻市民中心政府办公大楼，西连贺炳炎大道，北临金松大道，四面环路、路路相通。</p><p class="ql-align-center"><img src="http://n.sinaimg.cn/sinakd20210325ac/164/w640h324/20210325/057b-kmvwsvy0000732.jpg"></p><p><br></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('11','捷映 | 胜日寻芳，美丽的春日风景，记录在视频里的春天故事','风景','963','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>胜日寻芳泗水滨，无边光景一时新。几处早莺争暖树，谁家新燕啄春泥。春天来了，脑海中不由得就会浮现出诗中那般美好的事物。春天是万物复苏的季节，阳光明媚，春风轻拂，更能带来好心情，欣赏春日风景，记录下春日生活中美好的点点滴滴。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/533/w1280h853/20210325/d624-kmvwsvx9676473.jpg"></p><p>阳光照耀大地，春风带走寒冬的凛冽，天气变暖，搬上一张摇椅，在院子里晒晒太阳，偶尔翻上几本小说，享受一份春日的慵懒。与家人一起在公园中散散步，河水轻荡，波光粼粼，柳树随风招展，小草吐露新芽，花儿开始绽放，鸟儿在枝头雀跃，一片祥和的景象，如此美好，净化心灵。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/640/w1280h960/20210325/336a-kmvwsvx9677403.jpg"></p><p>春天是郊游踏青的好季节，约上三两好友，来一场春游，看看田间风吹麦浪，犹如绿色的海洋，金黄油菜花在太阳下闪闪发光，偶尔有几个小孩子在田间奔跑追逐，或放风筝，或嬉戏打闹。春风送来阵阵泥土的芬芳，天上云朵片片，美丽的春天田野，如诗如画。和好友一起畅游在天地间，感受春天的气息，一起回忆往昔的美好。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/533/w1280h853/20210325/3b74-kmvwsvx9678046.jpg"></p><p>春天也是一个谈恋爱的好季节，去年春日此门中，人面桃花相映红。桃花绽放，与喜欢的人一起欣赏桃花林，樱花树下，洁白的樱花飘落，为爱情装点一份浪漫。春水初生，春林初盛，春风十里不如你。桃花，杏花，樱花，各种花儿绽放，万紫千红，点缀大地，但最美的风景不过身边的人，落花人独立，微雨燕双飞。佳人如仙子，宛若画中来。</p><p><br></p><p><img src="https://n.sinaimg.cn/sinakd10116/480/w1280h800/20210325/78b5-kmvwsvx9678643.jpg"></p>','','2022年03月23日 12:51 新浪网');
insert into `article` values ('12','它是沈从文《边城》的原型，处在三省交界处，风景如画游客不多','风景','248','0','2025-06-20 07:32:09','2025-06-20 07:32:09',null,null,null,'<p>很多人旅游都是为了放松自己紧张的心情，所以很多人都想要找一个风景秀美而且比较僻静的地方，这样不仅可以更好的放松心情，而且还能够增进一同旅行的人的感情，正是因为这样的人多了，所以古镇文化才会慢慢兴起。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/258/w640h418/20210324/766a-kmvwsvx6547318.png"></p><p>地处三省交界</p><p>周边游让古镇文化一度非常火热，很多城市都斥巨资兴建了不少的仿古城，虽然没有古城的古色古香，但是跟平时见到的景色也有很大的不同。很多传承已久的古城也再度散发出了魅力，吸引了不少旅客的游览。</p><p>而在重庆东南部就有一个风景秀丽可是游览人数却不是很多的古镇，这个地方就是洪安古镇。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/256/w640h416/20210324/bb25-kmvwsvx6547323.png"></p><p>古镇介绍</p><p>很多人听到洪安古镇都是一愣，因为重庆的热门景点中很少提及这个古镇，但其实这座古镇却是大有来头，因为是大文豪沈从文的小说《边城》的原型，所以有不少人慕名而来，全镇总面积有52平方公里，所以景点还是不少的。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/257/w640h417/20210324/9a8e-kmvwsvx6547320.png"></p><p>洪安古镇位于湖南、重庆、贵州三个省的交界处，之前是一个三不管的地方，所以经济比较落后，但是后来划入重庆之后得到了快速的发展，镇民们的生活也过的越来越富足，很多游客到这里都可以感受到乡亲们的热情和友善。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/252/w640h412/20210324/44ea-kmvwsvx6547327.png"></p><p>秀美风光</p><p>洪安古镇的自然风光十分秀丽，这里依山傍水气候湿润，成片的绿树让古镇空气十分清新，河水在微风的吹拂下泛起了点点波光，美得就像一幅画一样。</p><p>而且洪安古镇是土家族风格的建筑，由石板铺成的街道配上青砖黑瓦风格的土家族建筑，让人可以感到浓郁的历史气息，不仅沈从文先生描写过这个地方，就连二野大军进入大西南的时候，司令部都在这里驻扎过很长一段时间。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/269/w640h429/20210324/e034-kmvwsvx6547326.png"></p><p>特色美食</p><p>除了特色的风光和历史之外，洪安古镇还有“一锅煮三省”的洪安腌菜鱼，为什么说是一锅煮三省呢？湖南的鱼鲜和贵州的豆腐再加上重庆的腌菜，三省的美食汇聚一锅，才能形成特色的洪安腌菜鱼。三种味道融合成一道菜，你中有我我中有你，不仅鲜辣可口而且相互不冲味，显得十分和谐。</p><p><img src="http://n.sinaimg.cn/sinakd20210324ac/263/w640h423/20210324/ce96-kmvwsvx6547325.png"></p>','','2022年03月23日 12:51 新浪网');
insert into `article_type` values ('1','100','风景','0',null,null,null,'2025-06-20 07:32:09','2025-06-20 07:32:09');