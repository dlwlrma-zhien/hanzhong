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