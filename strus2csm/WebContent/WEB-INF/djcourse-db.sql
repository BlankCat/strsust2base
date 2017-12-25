-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: 192.168.1.189:3306
-- 生成日期: 2013 年 06 月 17 日 09:50
-- 服务器版本: 5.5.11
-- PHP 版本: 5.2.12

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `djcourse`
--

DELIMITER $$
--
-- 函数
--
DROP FUNCTION IF EXISTS `bitand`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `bitand`(in_a VARCHAR(255), in_b VARCHAR(255)) RETURNS int(11)
BEGIN
	return in_a & in_b;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_advertising`
--
-- 创建时间: 2013 年 05 月 12 日 02:46
--

DROP TABLE IF EXISTS `dj_advertising`;
CREATE TABLE IF NOT EXISTS `dj_advertising` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `ad_title` varchar(100) DEFAULT NULL COMMENT '标题',
  `ad_summary` varchar(100) DEFAULT NULL COMMENT '摘要',
  `ad_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `ad_position` int(11) NOT NULL DEFAULT '0' COMMENT '广告位0:不是1：是',
  `ad_img` varchar(255) DEFAULT NULL COMMENT '图片',
  `ad_order` int(11) DEFAULT NULL COMMENT '显示顺序',
  `ad_count` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `ad_addtime` datetime NOT NULL COMMENT '增加时间',
  `ad_status` int(11) NOT NULL DEFAULT '0' COMMENT '状态0:不显示1:显示',
  `ad_url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `ad_color` varchar(50) DEFAULT NULL COMMENT '颜色值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_apply`
--
-- 创建时间: 2013 年 05 月 12 日 02:46
--

DROP TABLE IF EXISTS `dj_apply`;
CREATE TABLE IF NOT EXISTS `dj_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `a_number` int(11) DEFAULT '1' COMMENT '人数',
  `a_identity` int(1) unsigned zerofill NOT NULL COMMENT '身份：0律师1律所2律协3讲师',
  `a_tel` varchar(20) NOT NULL COMMENT '联系电话',
  `a_email` varchar(100) DEFAULT NULL COMMENT '联系邮箱',
  `a_rank` int(1) unsigned zerofill DEFAULT NULL COMMENT '申请的会员级别2金1银0铜',
  `a_note` text COMMENT '备注',
  `a_contact` varchar(255) NOT NULL COMMENT '联系人',
  `a_organization` varchar(255) DEFAULT NULL COMMENT '机构名称（律所、律协）',
  `a_addtime` datetime NOT NULL COMMENT '申请时间',
  `a_status` int(1) unsigned zerofill NOT NULL COMMENT '状态：是否审核，0：未审核，1审核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_brandcourse`
--
-- 创建时间: 2013 年 05 月 12 日 02:46
--

DROP TABLE IF EXISTS `dj_brandcourse`;
CREATE TABLE IF NOT EXISTS `dj_brandcourse` (
  `bc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bc_addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `bc_content` varchar(255) DEFAULT NULL COMMENT '内容',
  `bc_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态 0:草稿 1：正文',
  `bc_title` varchar(50) DEFAULT NULL COMMENT '页面title的内容 如果为空显示content',
  `bc_position` int(4) DEFAULT NULL COMMENT '位置 1:左上(图片) 2：右上3：左下4：右下',
  `bc_img_path` varchar(300) DEFAULT NULL COMMENT '图片路径',
  `bc_orders` int(11) NOT NULL DEFAULT '10' COMMENT '排序字段',
  `bc_link` varchar(300) NOT NULL COMMENT '链接地址',
  PRIMARY KEY (`bc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_buycard`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_buycard`;
CREATE TABLE IF NOT EXISTS `dj_buycard` (
  `buycard_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `buycard_name` varchar(10) DEFAULT NULL,
  `buycard_price` float DEFAULT NULL,
  `buycard_discount` float DEFAULT NULL,
  `buycard_img` varchar(50) DEFAULT NULL,
  `buycard_remark` varchar(255) DEFAULT NULL,
  `gift_money` float DEFAULT NULL,
  PRIMARY KEY (`buycard_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_buycardrecord`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_buycardrecord`;
CREATE TABLE IF NOT EXISTS `dj_buycardrecord` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `record_username` varchar(10) DEFAULT NULL,
  `record_money` float DEFAULT NULL,
  `record_date` datetime DEFAULT NULL,
  `record_num` int(11) DEFAULT NULL,
  `record_remark` varchar(255) DEFAULT NULL,
  `actual_money` float DEFAULT NULL,
  `deal_money` float DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `record_username` (`record_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_card`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_card`;
CREATE TABLE IF NOT EXISTS `dj_card` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(25) NOT NULL,
  `card_password` varchar(25) NOT NULL,
  `card_status` tinyint(4) NOT NULL DEFAULT '1',
  `card_money` decimal(10,0) DEFAULT '0',
  `card_type` bigint(20) NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_changemoney`
--
-- 创建时间: 2012 年 08 月 09 日 08:45
--

DROP TABLE IF EXISTS `dj_changemoney`;
CREATE TABLE IF NOT EXISTS `dj_changemoney` (
  `change_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `change_time` datetime DEFAULT NULL,
  `change_name` varchar(100) DEFAULT NULL,
  `change_type` varchar(10) DEFAULT NULL,
  `change_money` decimal(10,2) DEFAULT '0.00',
  `change_operatored` varchar(50) DEFAULT NULL,
  `change_operator` varchar(50) DEFAULT NULL,
  `remain_money` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`change_id`),
  KEY `index_operatored` (`change_operatored`),
  KEY `index_operator` (`change_operator`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=587780 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_comment`
--
-- 创建时间: 2013 年 05 月 12 日 02:46
--

DROP TABLE IF EXISTS `dj_comment`;
CREATE TABLE IF NOT EXISTS `dj_comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `comment_username` varchar(100) NOT NULL COMMENT '评论者',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  `reply_id` int(11) DEFAULT NULL COMMENT '回复的评论id',
  `audit_status` int(1) DEFAULT NULL COMMENT '审核状态:0未审核 1审核通过 2审核未通过',
  `content` longtext COMMENT '评论内容',
  `ip` varchar(50) DEFAULT NULL COMMENT '评论的ip地址',
  `comment_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '评论的时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程评论表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_cooperator`
--
-- 创建时间: 2013 年 03 月 21 日 13:22
--

DROP TABLE IF EXISTS `dj_cooperator`;
CREATE TABLE IF NOT EXISTS `dj_cooperator` (
  `orgid` bigint(20) NOT NULL,
  `begindate` date NOT NULL,
  `enddate` date NOT NULL,
  `price` int(11) DEFAULT NULL,
  `suborgs_num` int(11) DEFAULT '0',
  `members_num` int(11) DEFAULT '0',
  `cooperator_mode` varchar(255) DEFAULT NULL,
  `memorandum` text,
  `description` text,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_course`
--
-- 创建时间: 2013 年 06 月 05 日 10:39
--

DROP TABLE IF EXISTS `dj_course`;
CREATE TABLE IF NOT EXISTS `dj_course` (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `cs_name` varchar(100) DEFAULT NULL,
  `tch_names` varchar(50) DEFAULT NULL,
  `cs_type` int(11) NOT NULL DEFAULT '0',
  `cs_isopen` tinyint(4) NOT NULL DEFAULT '1',
  `cs_isdisplay` tinyint(4) NOT NULL DEFAULT '1',
  `cs_ispack` tinyint(4) NOT NULL,
  `cs_freeurl` text,
  `cs_isaudition` tinyint(4) NOT NULL,
  `cs_recommend` tinyint(4) DEFAULT NULL,
  `cs_clicktimes` int(11) DEFAULT NULL,
  `cs_addtime` bigint(20) NOT NULL,
  `cs_opendate` date DEFAULT NULL,
  `cs_closedate` date DEFAULT NULL,
  `cs_info` text,
  `cs_hour` float DEFAULT '0',
  `cs_price` decimal(10,2) DEFAULT NULL,
  `cs_packname` varchar(50) DEFAULT NULL,
  `cs_reckonkind` tinyint(4) NOT NULL DEFAULT '0',
  `course_authority` int(11) NOT NULL,
  `transcribe_time` datetime DEFAULT NULL,
  `cs_like` bigint(20) DEFAULT '0',
  `cs_img` varchar(255) DEFAULT NULL,
  `cs_summary` text,
  `cs_specialty` int(11) DEFAULT NULL,
  `cs_order` int(11) DEFAULT NULL,
  `cs_spe_group` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1817 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_courseware`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_courseware`;
CREATE TABLE IF NOT EXISTS `dj_courseware` (
  `cw_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cw_name` varchar(255) DEFAULT NULL,
  `cw_info` text,
  `cw_isfree` tinyint(4) DEFAULT NULL,
  `cw_playnum` int(11) DEFAULT NULL,
  `cw_url` varchar(255) DEFAULT NULL,
  `cw_downurl` varchar(255) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `cw_price` decimal(10,0) DEFAULT NULL,
  `cw_addtime` datetime DEFAULT NULL,
  `cw_hour` float DEFAULT NULL,
  `course_id` bigint(20) NOT NULL,
  `cw_reckonkind` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cw_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2566 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_course_tag`
--
-- 创建时间: 2013 年 05 月 12 日 02:46
--

DROP TABLE IF EXISTS `dj_course_tag`;
CREATE TABLE IF NOT EXISTS `dj_course_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_cscategory`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_cscategory`;
CREATE TABLE IF NOT EXISTS `dj_cscategory` (
  `cg_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(50) NOT NULL,
  `cg_pcategory` bigint(20) NOT NULL,
  `cg_addtime` datetime DEFAULT NULL,
  `cg_intro` text,
  `cg_lsml` int(20) DEFAULT '-1',
  `cg_type` tinyint(4) DEFAULT '0',
  `cg_count` int(11) DEFAULT NULL COMMENT '课程数目（包括下级课程分类）',
  `cg_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1040044 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_dictdata`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_dictdata`;
CREATE TABLE IF NOT EXISTS `dj_dictdata` (
  `dd_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `di_item` varchar(50) NOT NULL,
  `dd_value` varchar(255) NOT NULL,
  `dd_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dd_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_dictinfo`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_dictinfo`;
CREATE TABLE IF NOT EXISTS `dj_dictinfo` (
  `di_item` varchar(50) NOT NULL,
  `di_name` varchar(255) NOT NULL,
  `di_isedit` tinyint(4) DEFAULT '0',
  `di_id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`di_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_exam`
--
-- 创建时间: 2012 年 10 月 21 日 00:36
--

DROP TABLE IF EXISTS `dj_exam`;
CREATE TABLE IF NOT EXISTS `dj_exam` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `pass_proportion` int(11) NOT NULL DEFAULT '60',
  `time_limit` int(11) NOT NULL,
  `score` float NOT NULL DEFAULT '0',
  `is_display` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_exam_question`
--
-- 创建时间: 2012 年 10 月 21 日 00:36
--

DROP TABLE IF EXISTS `dj_exam_question`;
CREATE TABLE IF NOT EXISTS `dj_exam_question` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `score` float NOT NULL,
  `answer` text NOT NULL,
  `create_time` date NOT NULL,
  `result` text,
  `answerexplain` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_exam_question_options`
--
-- 创建时间: 2012 年 10 月 21 日 00:36
--

DROP TABLE IF EXISTS `dj_exam_question_options`;
CREATE TABLE IF NOT EXISTS `dj_exam_question_options` (
  `id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `options` text NOT NULL,
  `num` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_exam_student_history`
--
-- 创建时间: 2012 年 10 月 21 日 00:36
--

DROP TABLE IF EXISTS `dj_exam_student_history`;
CREATE TABLE IF NOT EXISTS `dj_exam_student_history` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `exam_score` float NOT NULL,
  `stu_score` float NOT NULL,
  `submit_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_exam_student_question`
--
-- 创建时间: 2012 年 10 月 21 日 00:36
--

DROP TABLE IF EXISTS `dj_exam_student_question`;
CREATE TABLE IF NOT EXISTS `dj_exam_student_question` (
  `id` bigint(20) NOT NULL,
  `exam_student_id` bigint(20) NOT NULL,
  `question_id` bigint(20) NOT NULL,
  `stu_answer` varchar(18) NOT NULL,
  `stu_score` float NOT NULL DEFAULT '0',
  `question_score` float NOT NULL,
  `exam_student_history_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_kq`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_kq`;
CREATE TABLE IF NOT EXISTS `dj_kq` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bh` bigint(20) DEFAULT NULL,
  `rq` datetime DEFAULT NULL,
  `sj` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_kqry`
--
-- 创建时间: 2012 年 04 月 17 日 01:16
--

DROP TABLE IF EXISTS `dj_kqry`;
CREATE TABLE IF NOT EXISTS `dj_kqry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bh` bigint(20) DEFAULT NULL,
  `kh` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_like`
--
-- 创建时间: 2013 年 04 月 15 日 05:50
--

DROP TABLE IF EXISTS `dj_like`;
CREATE TABLE IF NOT EXISTS `dj_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) DEFAULT NULL,
  `mem_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=253 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_loginfo`
--
-- 创建时间: 2012 年 03 月 18 日 03:37
--

DROP TABLE IF EXISTS `dj_loginfo`;
CREATE TABLE IF NOT EXISTS `dj_loginfo` (
  `logid` bigint(4) NOT NULL AUTO_INCREMENT,
  `logdate` datetime NOT NULL,
  `priority` varchar(50) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `classname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_member`
--
-- 创建时间: 2013 年 03 月 21 日 11:23
--

DROP TABLE IF EXISTS `dj_member`;
CREATE TABLE IF NOT EXISTS `dj_member` (
  `mem_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_username` varchar(50) NOT NULL,
  `mem_name` varchar(100) DEFAULT NULL,
  `mem_sex` varchar(50) DEFAULT NULL,
  `mem_photo` varchar(100) DEFAULT NULL,
  `mem_email` varchar(50) DEFAULT NULL,
  `mem_phone` varchar(50) DEFAULT NULL,
  `mem_address` varchar(250) DEFAULT NULL,
  `mem_code` varchar(50) DEFAULT NULL,
  `mem_lastlogin` datetime DEFAULT NULL,
  `mem_lastlogout` datetime DEFAULT NULL,
  `mem_lastloginip` varchar(50) DEFAULT NULL,
  `mem_logintimes` int(11) DEFAULT NULL,
  `mem_addtime` datetime DEFAULT '2010-11-15 00:00:00',
  `mem_type` int(11) NOT NULL DEFAULT '1',
  `mem_money` decimal(10,0) NOT NULL DEFAULT '0',
  `mem_vipstarttime` datetime DEFAULT NULL,
  `mem_sxzh` varchar(50) DEFAULT NULL,
  `mem_zyzh` varchar(50) DEFAULT NULL,
  `mem_idCard` varchar(50) DEFAULT NULL,
  `mem_allorg` varchar(50) NOT NULL,
  `mem_ispass` int(11) DEFAULT '0',
  `mem_pass_date` datetime DEFAULT NULL,
  `is_download` int(11) DEFAULT '0',
  `export` varchar(50) DEFAULT NULL COMMENT '导出字段（网群用）',
  PRIMARY KEY (`mem_id`),
  UNIQUE KEY `mem_username` (`mem_username`),
  KEY `mem_name` (`mem_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98168 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_memorg`
--
-- 创建时间: 2013 年 05 月 22 日 07:51
--

DROP TABLE IF EXISTS `dj_memorg`;
CREATE TABLE IF NOT EXISTS `dj_memorg` (
  `org_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL,
  `org_pid` bigint(20) DEFAULT NULL,
  `org_charger` varchar(50) DEFAULT NULL,
  `org_address` varchar(255) DEFAULT NULL,
  `org_phone` varchar(50) DEFAULT NULL,
  `org_type` int(2) DEFAULT '3',
  `org_email` varchar(100) DEFAULT NULL,
  `org_intro` text,
  `org_lsml` int(11) DEFAULT '-1',
  `org_memcount` int(11) DEFAULT '0',
  `org_lastweek_memcount` int(11) DEFAULT '0',
  `org_lastweek_stattime` bigint(20) DEFAULT NULL,
  `org_lastmonth_memcount` int(11) DEFAULT NULL,
  `org_lastmonth_stattime` bigint(20) DEFAULT NULL,
  `org_history_memcount` int(11) DEFAULT NULL,
  `org_history_stattime` bigint(20) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `org_allbelongs` varchar(200) DEFAULT NULL,
  `export` varchar(50) DEFAULT NULL COMMENT '导出字段（网群用）',
  `org_order` int(11) DEFAULT '0',
  `org_abbreviation` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`org_id`),
  KEY `org_pid` (`org_pid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100029553 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_notice`
--
-- 创建时间: 2012 年 10 月 21 日 00:37
--

DROP TABLE IF EXISTS `dj_notice`;
CREATE TABLE IF NOT EXISTS `dj_notice` (
  `id` bigint(20) NOT NULL,
  `title` text NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `org_id` bigint(20) NOT NULL,
  `creater` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `is_top` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `browse` bigint(20) NOT NULL,
  `is_pub` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_notice_category`
--
-- 创建时间: 2012 年 10 月 21 日 00:37
--

DROP TABLE IF EXISTS `dj_notice_category`;
CREATE TABLE IF NOT EXISTS `dj_notice_category` (
  `id` bigint(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_pid` bigint(20) NOT NULL,
  `org_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dj_onlineuser`
--
-- 创建时间: 2012 年 03 月 18 日 03:37
--

DROP TABLE IF EXISTS `dj_onlineuser`;
CREATE TABLE IF NOT EXISTS `dj_onlineuser` (
  `ol_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  PRIMARY KEY (`ol_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=662 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_order`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_order`;
CREATE TABLE IF NOT EXISTS `dj_order` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_username` varchar(25) DEFAULT NULL,
  `order_createtime` datetime DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `order_amount` decimal(10,2) DEFAULT NULL,
  `order_finalamount` decimal(10,2) DEFAULT NULL,
  `order_isconfirm` tinyint(4) NOT NULL,
  `order_confirmtime` datetime DEFAULT NULL,
  `order_issuccess` tinyint(4) NOT NULL,
  `order_successtime` datetime DEFAULT NULL,
  `order_type` varchar(25) NOT NULL,
  `order_viptype` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_username` (`order_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=201306170007 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_orderitems`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_orderitems`;
CREATE TABLE IF NOT EXISTS `dj_orderitems` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `item_num` int(11) DEFAULT '1',
  `item_money` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_dj_orderitems` (`order_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100259 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_orgcharge`
--
-- 创建时间: 2012 年 03 月 18 日 03:37
--

DROP TABLE IF EXISTS `dj_orgcharge`;
CREATE TABLE IF NOT EXISTS `dj_orgcharge` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgid` bigint(20) NOT NULL,
  `charge_date` datetime NOT NULL,
  `year` varchar(20) NOT NULL,
  `charge_money` decimal(10,2) NOT NULL,
  `is_recursion` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `orgid` (`orgid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_orgcourse`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_orgcourse`;
CREATE TABLE IF NOT EXISTS `dj_orgcourse` (
  `orgcs_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgcs_orgid` bigint(20) NOT NULL,
  `orgcs_courseid` bigint(20) NOT NULL,
  `orgcs_cstype` varchar(25) NOT NULL,
  `orgcs_credit` float NOT NULL,
  `orgcs_note` text,
  `orgcs_year` varchar(10) NOT NULL,
  `orgcs_date` date DEFAULT NULL,
  PRIMARY KEY (`orgcs_id`),
  KEY `orgcs_orgid` (`orgcs_orgid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_orgset`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_orgset`;
CREATE TABLE IF NOT EXISTS `dj_orgset` (
  `orgset_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `orgset_csmustnum` int(11) DEFAULT NULL,
  `orgset_csselectnum` int(11) DEFAULT NULL,
  `orgset_cstime` float DEFAULT NULL,
  `orgset_cscredit` float DEFAULT NULL,
  `orgset_note` text,
  `orgset_year` varchar(10) NOT NULL,
  `orgset_date_begin` date DEFAULT NULL,
  `orgset_date_end` date DEFAULT NULL,
  PRIMARY KEY (`orgset_id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=556 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_question_text`
--
-- 创建时间: 2013 年 04 月 15 日 05:50
--

DROP TABLE IF EXISTS `dj_question_text`;
CREATE TABLE IF NOT EXISTS `dj_question_text` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_question_voice`
--
-- 创建时间: 2013 年 04 月 15 日 05:50
--

DROP TABLE IF EXISTS `dj_question_voice`;
CREATE TABLE IF NOT EXISTS `dj_question_voice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content` longblob,
  `create_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=96 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_resc`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_resc`;
CREATE TABLE IF NOT EXISTS `dj_resc` (
  `resc_id` int(11) NOT NULL AUTO_INCREMENT,
  `resc_name` varchar(250) DEFAULT NULL,
  `resc_type` varchar(50) DEFAULT NULL,
  `resc_string` varchar(250) DEFAULT NULL,
  `resc_priority` int(50) DEFAULT NULL,
  `resc_desc` text,
  PRIMARY KEY (`resc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_role`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_role`;
CREATE TABLE IF NOT EXISTS `dj_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL,
  `role_desc` text,
  `role_isedit` tinyint(4) NOT NULL DEFAULT '1',
  `role_rname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_roleresc`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_roleresc`;
CREATE TABLE IF NOT EXISTS `dj_roleresc` (
  `rr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rr_roleid` bigint(20) DEFAULT NULL,
  `rr_rescid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`rr_id`),
  KEY `rr_roleid` (`rr_roleid`),
  KEY `rr_rescid` (`rr_rescid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3314 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_shoppingcart`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_shoppingcart`;
CREATE TABLE IF NOT EXISTS `dj_shoppingcart` (
  `cart_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_username` varchar(25) DEFAULT NULL,
  `cart_creattime` datetime DEFAULT NULL,
  `cart_num` int(11) DEFAULT NULL,
  `cart_amount` decimal(10,0) DEFAULT NULL,
  `cart_status` tinyint(4) DEFAULT NULL,
  `cart_course` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_username` (`cart_username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=193780 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_specialty`
--
-- 创建时间: 2013 年 06 月 05 日 06:33
--

DROP TABLE IF EXISTS `dj_specialty`;
CREATE TABLE IF NOT EXISTS `dj_specialty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spe_name_prefix` varchar(100) DEFAULT NULL COMMENT '名称前缀',
  `spe_name` varchar(200) DEFAULT NULL COMMENT '名称',
  `spe_name_suffix` varchar(100) DEFAULT NULL COMMENT '名称后缀',
  `spe_lesson` float DEFAULT NULL COMMENT '课时',
  `spe_price` float DEFAULT NULL COMMENT '价格',
  `spe_synopsis` varchar(255) DEFAULT NULL COMMENT '简介',
  `spe_content` varchar(255) DEFAULT '' COMMENT '内容',
  `spe_img` varchar(200) DEFAULT NULL COMMENT '图片',
  `spe_status` int(11) unsigned zerofill DEFAULT NULL COMMENT '状态：前台是否需要展示，默认0不需要1展示',
  `spe_order` int(11) DEFAULT NULL COMMENT '排序',
  `spe_addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `spe_pre_title` varchar(255) DEFAULT NULL COMMENT '序言标题',
  `spe_pre_content` varchar(255) DEFAULT NULL COMMENT '序言内容',
  `spe_contents` varchar(255) DEFAULT NULL COMMENT '课程目录',
  `spe_posc_title` varchar(255) DEFAULT NULL COMMENT '后记标题',
  `spe_posc_content` varchar(255) DEFAULT NULL COMMENT '后记内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_specialty_group`
--
-- 创建时间: 2013 年 06 月 05 日 10:32
--

DROP TABLE IF EXISTS `dj_specialty_group`;
CREATE TABLE IF NOT EXISTS `dj_specialty_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `group_name` varchar(50) NOT NULL COMMENT '分组名称',
  `group_order` float(10,5) NOT NULL DEFAULT '10.00000' COMMENT '排序字段',
  `specialty_id` bigint(20) NOT NULL COMMENT '分组所属专业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_statreport`
--
-- 创建时间: 2012 年 11 月 22 日 08:21
--

DROP TABLE IF EXISTS `dj_statreport`;
CREATE TABLE IF NOT EXISTS `dj_statreport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `members_num` bigint(10) NOT NULL DEFAULT '0',
  `members_learn_num` bigint(10) NOT NULL DEFAULT '0',
  `learn_rate` float NOT NULL DEFAULT '0',
  `avg_minutes` float NOT NULL DEFAULT '0',
  `avg_times` float NOT NULL DEFAULT '0',
  `passed_members_num` bigint(10) NOT NULL DEFAULT '0',
  `pass_rate` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32315 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_stucourse`
--
-- 创建时间: 2013 年 06 月 06 日 23:50
--

DROP TABLE IF EXISTS `dj_stucourse`;
CREATE TABLE IF NOT EXISTS `dj_stucourse` (
  `sc_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) NOT NULL,
  `mem_id` bigint(20) NOT NULL,
  `sc_status` tinyint(4) DEFAULT NULL,
  `sc_applytime` datetime DEFAULT NULL,
  `sc_applyip` varchar(50) DEFAULT NULL,
  `sc_lasttime` datetime DEFAULT NULL,
  `sc_lastip` varchar(50) DEFAULT NULL,
  `sc_org` bigint(20) DEFAULT '-1',
  `sc_totaltime` float DEFAULT NULL,
  `sc_times` int(20) DEFAULT '0',
  `exam_status` int(11) NOT NULL DEFAULT '-1',
  `exam_times` bigint(20) DEFAULT '0',
  `begin_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `couser_id` (`course_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=796919 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_stucw`
--
-- 创建时间: 2012 年 12 月 06 日 08:46
--

DROP TABLE IF EXISTS `dj_stucw`;
CREATE TABLE IF NOT EXISTS `dj_stucw` (
  `stucw_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) NOT NULL,
  `cw_id` bigint(20) NOT NULL,
  `stucw_starttime` datetime DEFAULT NULL,
  `stucw_endtime` datetime DEFAULT NULL,
  `stucw_totaltime` float DEFAULT '0',
  `stucw_status` int(11) NOT NULL DEFAULT '0',
  `stucw_times` int(11) DEFAULT '0',
  `stucourse_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`stucw_id`),
  KEY `mem_id` (`mem_id`),
  KEY `cw_id` (`cw_id`),
  KEY `stucourse_id_index` (`stucourse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3013137 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_stucwtime`
--
-- 创建时间: 2012 年 12 月 06 日 08:48
--

DROP TABLE IF EXISTS `dj_stucwtime`;
CREATE TABLE IF NOT EXISTS `dj_stucwtime` (
  `stucwtime_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mem_id` bigint(20) NOT NULL,
  `cw_id` bigint(20) NOT NULL,
  `stucwtime_starttime` datetime DEFAULT NULL,
  `stucwtime_endtime` datetime DEFAULT NULL,
  `stucwtime_totaltime` float DEFAULT NULL,
  `stucwtime_status` int(4) DEFAULT NULL,
  `stucourse_id` bigint(20) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`stucwtime_id`),
  KEY `cw_id` (`cw_id`),
  KEY `mem_id` (`mem_id`),
  KEY `stucourse_id_index` (`stucourse_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3457691 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_stuspecialty`
--
-- 创建时间: 2013 年 06 月 05 日 06:33
--

DROP TABLE IF EXISTS `dj_stuspecialty`;
CREATE TABLE IF NOT EXISTS `dj_stuspecialty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mem_id` int(11) NOT NULL,
  `specialty_id` int(11) NOT NULL,
  `buy_time` datetime NOT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_sysprop`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_sysprop`;
CREATE TABLE IF NOT EXISTS `dj_sysprop` (
  `sysprop_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sysprop_name` varchar(255) NOT NULL,
  `sysprop_value` varchar(255) DEFAULT NULL,
  `sysprop_desc` text,
  `sysprop_isshow` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`sysprop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_tag`
--
-- 创建时间: 2013 年 05 月 12 日 02:46
--

DROP TABLE IF EXISTS `dj_tag`;
CREATE TABLE IF NOT EXISTS `dj_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_tchcourse`
--
-- 创建时间: 2013 年 06 月 05 日 10:33
--

DROP TABLE IF EXISTS `dj_tchcourse`;
CREATE TABLE IF NOT EXISTS `dj_tchcourse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  `teacher_id` bigint(20) NOT NULL COMMENT '教师id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='课程与教师关联表' AUTO_INCREMENT=1034 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_teacher`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_teacher`;
CREATE TABLE IF NOT EXISTS `dj_teacher` (
  `teacher_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tch_username` varchar(50) DEFAULT NULL,
  `tch_name` varchar(50) NOT NULL,
  `tch_photo` varchar(100) DEFAULT NULL,
  `tch_base` float DEFAULT NULL,
  `tch_total` float DEFAULT NULL,
  `tch_csnum` int(11) DEFAULT NULL,
  `tch_note` text,
  `tch_email` varchar(50) DEFAULT NULL,
  `tch_major` varchar(50) DEFAULT NULL,
  `tch_sex` varchar(10) DEFAULT NULL,
  `tch_birthday` varchar(50) DEFAULT NULL,
  `tch_url` varchar(100) DEFAULT NULL,
  `is_famous` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`teacher_id`),
  KEY `tch_username` (`tch_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=661 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_topic`
--
-- 创建时间: 2013 年 03 月 21 日 12:12
--

DROP TABLE IF EXISTS `dj_topic`;
CREATE TABLE IF NOT EXISTS `dj_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `isShow` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_user`
--
-- 创建时间: 2013 年 01 月 04 日 06:35
--

DROP TABLE IF EXISTS `dj_user`;
CREATE TABLE IF NOT EXISTS `dj_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `orgid` bigint(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` varchar(250) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `lastlogout` datetime DEFAULT NULL,
  `lastloginip` varchar(50) DEFAULT NULL,
  `logintimes` int(11) DEFAULT NULL,
  `user_amont` decimal(10,2) DEFAULT '0.00',
  `isnewuser` int(11) DEFAULT '1',
  `ispopup` int(11) DEFAULT '1',
  `result` varchar(255) DEFAULT NULL,
  `course_authority` int(11) NOT NULL,
  `user_amont_temp` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `orgid` (`orgid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111342 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_userlogs`
--
-- 创建时间: 2012 年 07 月 02 日 08:14
--

DROP TABLE IF EXISTS `dj_userlogs`;
CREATE TABLE IF NOT EXISTS `dj_userlogs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `manager` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `opaction` varchar(50) DEFAULT NULL,
  `desciption` text,
  `actiontime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1795 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_userrole`
--
-- 创建时间: 2013 年 01 月 04 日 06:34
--

DROP TABLE IF EXISTS `dj_userrole`;
CREATE TABLE IF NOT EXISTS `dj_userrole` (
  `ur_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ur_username` varchar(50) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ur_id`),
  UNIQUE KEY `ur_username` (`ur_username`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98177 ;

-- --------------------------------------------------------

--
-- 表的结构 `dj_wx`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `dj_wx`;
CREATE TABLE IF NOT EXISTS `dj_wx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orgid` bigint(20) NOT NULL DEFAULT '0',
  `banner` varchar(100) NOT NULL,
  `commoncss` varchar(100) NOT NULL DEFAULT '/styles/css.jsp',
  `css` varchar(100) DEFAULT NULL,
  `bottom` text NOT NULL,
  `url` varchar(200) NOT NULL,
  `imageurl` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orgid` (`orgid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

-- --------------------------------------------------------

--
-- 表的结构 `http_session_info`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `http_session_info`;
CREATE TABLE IF NOT EXISTS `http_session_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(255) DEFAULT NULL,
  `principal` varchar(25) DEFAULT NULL,
  `expired` tinyint(2) DEFAULT NULL,
  `lastRequest` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessionId` (`sessionId`),
  KEY `principal` (`principal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `http_session_store`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `http_session_store`;
CREATE TABLE IF NOT EXISTS `http_session_store` (
  `session_id` char(40) NOT NULL,
  `session_data` longtext,
  `expire_date` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--
-- 创建时间: 2012 年 03 月 18 日 03:06
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `MESSAGE_ID` bigint(20) NOT NULL,
  `MESSAGE_TEXT` varchar(255) DEFAULT NULL,
  `NEXT_MESSAGE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `FK_NEXT_MESSAGE` (`NEXT_MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `yd_log`
--
-- 创建时间: 2013 年 06 月 03 日 03:02
--

DROP TABLE IF EXISTS `yd_log`;
CREATE TABLE IF NOT EXISTS `yd_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `deviceinfo` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (` id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8489 ;

--
-- 限制导出的表
--

--
-- 限制表 `dj_orderitems`
--
ALTER TABLE `dj_orderitems`
  ADD CONSTRAINT `FK_dj_orderitems` FOREIGN KEY (`order_id`) REFERENCES `dj_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `FK_NEXT_MESSAGE` FOREIGN KEY (`NEXT_MESSAGE_ID`) REFERENCES `messages` (`MESSAGE_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- 2013年6月18日9:07:29	 添加时候是公证处标示字段 	 邵方涛
ALTER TABLE `dj_memorg`
ADD COLUMN `org_notary`  int(11) UNSIGNED ZEROFILL NULL DEFAULT 0.0	COMMENT '是否是公证处标示。0：否。1：是' AFTER `org_abbreviation`;


-- 2013年6月24日17:15:29	 添加字段(积分、课时、VIP、金银铜) 
ALTER TABLE `dj_advertising`
	MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;


ALTER TABLE `dj_apply`
	MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;

ALTER TABLE `dj_brandcourse`
	MODIFY COLUMN `bc_id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;

ALTER TABLE `dj_comment`
	MODIFY COLUMN `comment_id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;


ALTER TABLE `dj_course_tag`
MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ,
MODIFY COLUMN `course_id`  bigint(11) NOT NULL COMMENT '课程id' AFTER `id`,
MODIFY COLUMN `tag_id`  bigint(11) NOT NULL COMMENT '标签id' AFTER `course_id`;



ALTER TABLE `dj_resc`
	MODIFY COLUMN `resc_id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;


ALTER TABLE `dj_specialty`
	MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;


ALTER TABLE `dj_stuspecialty`
MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ,
MODIFY COLUMN `mem_id`  bigint(11) NOT NULL AFTER `id`,
MODIFY COLUMN `specialty_id`  bigint(11) NOT NULL AFTER `mem_id`;





ALTER TABLE `dj_tag`
	MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;



ALTER TABLE `dj_wx`
	MODIFY COLUMN `id`  bigint(11) NOT NULL AUTO_INCREMENT FIRST ;





ALTER TABLE `dj_user`
ADD COLUMN `school_hour`  decimal(8,2) DEFAULT 0.0	 COMMENT 'vip所享有的选课课时数'  AFTER `user_amont_temp`;

ALTER TABLE `dj_user`
ADD COLUMN `choose_school_hour`  decimal(8,2) DEFAULT 0.0 COMMENT '学员已选课时的课时数' AFTER `school_hour`;

ALTER TABLE `dj_user`
ADD COLUMN `remain_school_hour`  decimal(8,2) DEFAULT 0.0 COMMENT '学员剩余课时数' AFTER `choose_school_hour`;

ALTER TABLE `dj_user`
ADD COLUMN `vip_starttime`  datetime  COMMENT 'vip开始日期' AFTER `remain_school_hour`;

ALTER TABLE `dj_user`
ADD COLUMN `vip_endtime`  datetime  COMMENT 'vip截止日期' AFTER `vip_starttime`;

ALTER TABLE `dj_user`
ADD COLUMN `vip_rank`  integer  COMMENT 'vip等级' AFTER `vip_endtime`;

ALTER TABLE `dj_user`
ADD COLUMN `vip_type`  integer  DEFAULT 0 COMMENT 'vip类型' AFTER `vip_rank`;

ALTER TABLE `dj_user`
ADD COLUMN `vip_price`  decimal(8,2)   COMMENT '会员价格' AFTER `vip_type`;

ALTER TABLE `dj_user`
ADD COLUMN `is_group_members` integer  DEFAULT 0  COMMENT '是否为团体会员的标记.0为不是团体会员，1为律协团体会员2为律所团体会员，3为前两者兼有团体会员' AFTER `vip_price`;

ALTER TABLE `dj_stucourse`
ADD COLUMN `buy_type`  integer DEFAULT 0  COMMENT '购买来源，0、课时购买；1、积分购买' AFTER `begin_date`;

ALTER TABLE `dj_dictdata`
ADD COLUMN `dd_desc`  text  COMMENT '描述金银铜' AFTER `dd_note`;

ALTER TABLE `dj_changemoney`
ADD COLUMN `buy_type`  integer  DEFAULT 0 COMMENT '交易类型，0、课时购买；1、积分购买' AFTER `remain_money`;

ALTER TABLE `dj_course`
ADD COLUMN `cs_ks`  double   COMMENT '课时' AFTER `cs_hour`;

ALTER TABLE `dj_order`
ADD COLUMN `order_buytype`  DEFAULT 0 integer   COMMENT '购买方式（0、课时购买；1、积分购买）' AFTER `order_type`;

ALTER TABLE `dj_orderitems`
ADD COLUMN `item_type` integer DEFAULT 0  COMMENT '购买方式（0、课时购买；1、积分购买）' AFTER `item_money`;

ALTER TABLE `dj_orgcharge`
ADD COLUMN `charge_type` integer  COMMENT '充值类型（0、课时充值；1、积分充值）' AFTER `is_recursion`;


CREATE TABLE `dj_specialty_store` (
  `store_id` bigint(20) NOT NULL auto_increment COMMENT '主键id',
  `course_id` bigint(20) NOT NULL COMMENT '课程id',
  `spe_id` int(11) NOT NULL COMMENT '所属专业',
  `group_id` bigint(20) NOT NULL COMMENT '所属分组',
  `course_order` int(11) default '10' COMMENT '在分组中的排序',
  PRIMARY KEY  (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='专业课仓库';



CREATE TABLE `dj_vip` (
  `id` bigint(20) NOT NULL auto_increment COMMENT '主键id',
  `name` varchar(20)  COMMENT '会员名称',
  `value` int(11)  COMMENT '值（1.铜牌会员 2.银牌会员 3.金牌会员）',
  `desc` varchar(255)  COMMENT '会员描述',
  `discount` decimal(10,2)  COMMENT '会员折扣',
  `price` decimal(10,2)  COMMENT '价格',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='金银铜会员表';


ALTER TABLE `dj_vip`
ADD COLUMN `hour` decimal(10,2)  default '0.0' COMMENT '课时' AFTER `price`;


