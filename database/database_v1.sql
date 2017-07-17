/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : scc

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-08-28 09:24:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for catalogue
-- ----------------------------
DROP TABLE IF EXISTS `catalogue`;
CREATE TABLE `catalogue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `pos_order` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `catalogue_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of catalogue
-- ----------------------------
INSERT INTO `catalogue` VALUES ('1', 'Tuyển dụng', 'tuyendung', null, '1', '', '0');
INSERT INTO `catalogue` VALUES ('2', 'Tin trong ngành', 'tintrongnganh', null, '2', '', '1');
INSERT INTO `catalogue` VALUES ('3', 'Tin SCC Hà Nội', 'tinscchanoi', null, '3', '', '1');
INSERT INTO `catalogue` VALUES ('4', 'Tin dự án', 'tinduan', null, '4', '', '1');
INSERT INTO `catalogue` VALUES ('5', 'Hoạt động SCC Hà Nội', 'hoatdongscc', null, '5', '', '1');
INSERT INTO `catalogue` VALUES ('6', 'Lĩnh Vực', 'linhvuc', null, '6', '', '0');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `postal` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `updated` varchar(255) DEFAULT NULL,
  `admin_email` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'c2', 'asd', 'asd', 'abc', '123', '123', '', '', '', '', '', 'admin@gmail.com', 'Active', '9beea88c0852eb9aa44652aedc206021', '');
INSERT INTO `client` VALUES ('2', 'daomai', 'Tan Binh', 'Nguyen Van Troi', 'HCM', '12343', '1234', '0945454545', '0345345676', 'example@gmail.com', '12-09-2013', '12-10-2018', 'admin@gmail.com', 'Inactive', null, null);
INSERT INTO `client` VALUES ('3', 'G.A.S', '', '', '', '', '', '', '', '', '12/05/2016', '19/05/2016', '', null, null, null);
INSERT INTO `client` VALUES ('4', 'c2', 'asd', 'asd', 'abc', '123', '', '', '', '', '', '', '', null, null, null);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('2', 'email_server', 'greatcircle49@gmail.com', '<p>\n	email server for send email.</p>\n', '');
INSERT INTO `config` VALUES ('3', 'email_pass', 'timelife@123', '<p>\n	password off email</p>\n', '');
INSERT INTO `config` VALUES ('4', 'email_host', 'smtp.gmail.com', '<p>\r\n	sets email as the SMTP server</p>\r\n', '');
INSERT INTO `config` VALUES ('5', 'email_port', '465', '<p>\r\n	set the SMTP port for the email server</p>\r\n', '');
INSERT INTO `config` VALUES ('6', 'email_SMTPSecure', 'ssl', '<p>\r\n	sets the prefix to the servier</p>\r\n', '');

-- ----------------------------
-- Table structure for email_template
-- ----------------------------
DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_date` datetime DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_uid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `Subject` varchar(255) DEFAULT NULL,
  `key` varchar(255) NOT NULL,
  `to` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `email_template` text NOT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of email_template
-- ----------------------------
INSERT INTO `email_template` VALUES ('1', null, null, '2014-07-24 18:26:42', '1', 'Thanks email content:', 'Thank you', 'thanks_email_content', null, null, '<p>\r\n	Thank you for your enquiry, one of our staff will be in contact with you shorty.</p>\r\n', '');
INSERT INTO `email_template` VALUES ('2', null, null, '2014-07-24 18:28:36', '1', 'Workshop email content :', 'Thank you', 'thanks_email_workshop', null, null, '<p>\r\n	Thank you for your request one of our staff will be in contact shortly to confirm your appointment. &nbsp; &nbsp;</p>\r\n', '');

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('1', 'Tiếng Việt', 'vn', '');
INSERT INTO `language` VALUES ('2', 'English', 'en', '');
INSERT INTO `language` VALUES ('3', '中国', 'cn', '');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `reply` bit(1) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'ádfádf', 'nkluan.gl@gmail.com', '', '', 'asdfsadf', 'asdfadsfadsf', '2015-07-02 05:16:57', '\0', '');
INSERT INTO `message` VALUES ('2', 'ádfádf', 'nkluan.gl@gmail.com', '', '', 'asdfsadf', 'asdfadsfadsf', '2015-07-02 05:17:04', '\0', '');
INSERT INTO `message` VALUES ('3', 'luannguyen49', 'nkluan.gl@gmail.com', '', '', 'adfasdf', 'asdfasdf', '2015-07-02 05:20:05', '\0', '');
INSERT INTO `message` VALUES ('4', 'luannguyen49', 'nkluan.gl@gmail.com', '', '', 'sdà', 'dàádf', '2015-07-02 05:21:47', '\0', '');
INSERT INTO `message` VALUES ('5', 'luannguyen49', 'nkluan.gl@gmail.com', '', '', 'ádf', 'ádfádf', '2015-07-02 05:22:22', '\0', '');

-- ----------------------------
-- Table structure for organizational
-- ----------------------------
DROP TABLE IF EXISTS `organizational`;
CREATE TABLE `organizational` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `pos_order` int(255) DEFAULT NULL,
  `active` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of organizational
-- ----------------------------
INSERT INTO `organizational` VALUES ('1', ' Jhon Doe', 'Founder and CEO', '76a37-man1.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable.', '1', '1');
INSERT INTO `organizational` VALUES ('2', 'Jhon Doe', 'Founder and CEO', 'e783d-man2.jpg', '<p>\r\n	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable.</p>\r\n', '2', '1');
INSERT INTO `organizational` VALUES ('3', ' Jhon Doe', 'Founder and CEO', '6ba33-man3.jpg', '<p>\r\n	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable.</p>\r\n', '4', '1');
INSERT INTO `organizational` VALUES ('4', 'Jhon Doe', 'Founder and CEO', '7b7c6-man4.jpg', '<p>\r\n	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable.</p>\r\n', '4', '1');

-- ----------------------------
-- Table structure for partner
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_cn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `partner_cat_id` int(11) DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `partner_cat_id` (`partner_cat_id`),
  CONSTRAINT `partner_ibfk_1` FOREIGN KEY (`partner_cat_id`) REFERENCES `partner_cat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of partner
-- ----------------------------
INSERT INTO `partner` VALUES ('1', 'gallery', 'gallery_A', 'gallery', 'gallery', '1', '<h3>\r\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</h3>\r\n', '1', '70293-partner4.png', 'http://mp3.zing.vn/bai-hat/-Kaze-no-Kioku-Anri-Kumaki/ZWZAI6UW.html');
INSERT INTO `partner` VALUES ('4', 'Tiếng Việt', 'Tiếng Anh', 'Tiếng Trung', '123', '0', null, '1', null, null);
INSERT INTO `partner` VALUES ('5', 'SSC HCM', 'SSCHCM', 'SSCHCM', '1234', '1', '<h3>\r\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</h3>\r\n', '2', 'f19ab-partner3.png', 'http://mp3.zing.vn/bai-hat/-Kaze-no-Kioku-Anri-Kumaki/ZWZAI6UW.html');
INSERT INTO `partner` VALUES ('7', 'CSS Đà Nẵng', 'CSS Da Nang', '', 'DaNang ', '1', '<h3>\r\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</h3>\r\n', '2', 'a8f6d-partner4.png', 'http://mp3.zing.vn/bai-hat/-Kaze-no-Kioku-Anri-Kumaki/ZWZAI6UW.html');
INSERT INTO `partner` VALUES ('8', 'head', 'head', '', 'head', '1', '<h3>\r\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</h3>\r\n', '1', 'a7b72-partner1.png', 'http://mp3.zing.vn/bai-hat/-Kaze-no-Kioku-Anri-Kumaki/ZWZAI6UW.html');
INSERT INTO `partner` VALUES ('9', 'adam', 'adam', '', null, '1', '<h3>\r\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt</h3>\r\n', '1', 'e2ae0-partner2.png', 'http://mp3.zing.vn/bai-hat/-Kaze-no-Kioku-Anri-Kumaki/ZWZAI6UW.html');

-- ----------------------------
-- Table structure for partner_cat
-- ----------------------------
DROP TABLE IF EXISTS `partner_cat`;
CREATE TABLE `partner_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picture_to_type` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of partner_cat
-- ----------------------------
INSERT INTO `partner_cat` VALUES ('1', 'Đối tác', 'doitac', '');
INSERT INTO `partner_cat` VALUES ('2', 'Công ty thành viên', 'ctytv', '');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `picture_type` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picture_to_type` (`picture_type`),
  CONSTRAINT `picture_to_type` FOREIGN KEY (`picture_type`) REFERENCES `picture_type` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('2', '9ae81-bg1.jpg', '1', '');

-- ----------------------------
-- Table structure for picture_type
-- ----------------------------
DROP TABLE IF EXISTS `picture_type`;
CREATE TABLE `picture_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_cn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of picture_type
-- ----------------------------
INSERT INTO `picture_type` VALUES ('1', 'gallery', 'gallery', 'gallery', 'gallery', '');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_uid` int(11) DEFAULT NULL,
  `update_uid` int(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `price` float(11,0) DEFAULT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pos_order` int(11) DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catalogue_id` int(11) DEFAULT NULL,
  `active` bit(1) NOT NULL,
  `like` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_to_catelogue` (`catalogue_id`) USING BTREE,
  KEY `create_uid` (`create_uid`),
  KEY `post_ibfk_2` (`update_uid`),
  CONSTRAINT `post_ibfk_3` FOREIGN KEY (`catalogue_id`) REFERENCES `catalogue` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES ('1', '1', '1', '2015-07-02 06:06:07', '2014-07-21 22:20:01', 'Giới Thiệu', 'gioithieu', '<p>\n	Giới Thiệu</p>\n', '', null, '', null, '', '', null, 'page', null, '', null);
INSERT INTO `post` VALUES ('2', '1', '1', '2015-06-29 15:14:03', '2014-07-21 22:20:01', 'Lịch sử hoạt động', 'lichsuhoatdong', '', '<div class=\"accessoriesImg\">\r\n	<img alt=\"\" src=\"public/images/img1.png\" /></div>\r\n<ul class=\"accessoriesList\">\r\n	<li class=\"clearfix\">\r\n		<p class=\"Img\">\r\n			<a data-lightbox=\"roadtrip\" href=\"public/images/img2_1.jpg\"><img alt=\"\" src=\"public/images/img2.png\" /></a></p>\r\n		<p class=\"text\">\r\n			How much is your head worth? It&#39;s a known fact that your head is the most valuable and important part of your body. Dale Britton Motorcycles carry a large range of Helmets from the Worlds leading brands. Shoei, HJC, OGK, AGV and Perth&#39;s largest range of Shark Helmets to name a few. Protect your most important asset today.</p>\r\n	</li>\r\n	<li class=\"clearfix\">\r\n		<p class=\"Img\">\r\n			<a data-lightbox=\"roadtrip\" href=\"public/images/img10_1.jpg\"><img alt=\"\" src=\"public/images/img10.jpg\" /></a></p>\r\n		<p class=\"text\">\r\n			Jackets Jackets Jackets...Dale Britton&#39;s accessories staff have the got the Jacket your after. Leather or Textile, Winter, Summer or in-between ..Brands from Alpinestars, Dainese, Berik, RST, Shift, Ixon, Dri-rider, Motodry.. Mens and ladies.. All sizes...</p>\r\n	</li>\r\n	<li class=\"clearfix\">\r\n		<p class=\"Img\">\r\n			<a data-lightbox=\"roadtrip\" href=\"public/images/img11_1.jpg\"><img alt=\"\" src=\"public/images/img11.jpg\" /></a></p>\r\n		<p class=\"text\">\r\n			Dale Britton Motorcycles are a stockist of Gloves from leading brands such as Alpinestars, RST, Berik, Shift, Dri-rider, Ixon and Motodry. Our staff are experts in accessoeries. If its not here in stock, its probablly not available.</p>\r\n	</li>\r\n	<li class=\"clearfix\">\r\n		<p class=\"Img\">\r\n			<a data-lightbox=\"roadtrip\" href=\"public/images/img12_1.jpg\"><img alt=\"\" src=\"public/images/img12.jpg\" /></a></p>\r\n		<p class=\"text\">\r\n			&nbsp;</p>\r\n	</li>\r\n</ul>\r\n', null, '', null, '', null, null, 'page', null, '', null);
INSERT INTO `post` VALUES ('3', '1', '1', '2015-06-29 14:53:22', '2014-07-21 22:20:01', 'Lịch sử hình thành', 'lichsuhinhthanh', '', '<p>\r\n	<span style=\"color:#000080;\"><b style=\"font-weight: 700; color: rgb(204, 204, 204); font-family: \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif; font-size: 16px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 24px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(0, 0, 0, 0.4);\"><span style=\"background-color: rgb(255, 255, 255);\">1. Loại bạn đến với ch&uacute;ng ta tay kh&ocirc;ng v&agrave; khi đi th&igrave; trong tay phải c&oacute;. Đ&oacute; l&agrave; những kẻ:</span></b><br />\r\n	<span style=\"font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,&quot;Lucida Grande&quot;,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; display: inline ! important; float: none;\">- Thăm ch&uacute;ng ta với &yacute; định lấy đi c&aacute;i g&igrave; đ&oacute;.</span><br style=\"color: rgb(204, 204, 204); font-family: \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(0, 0, 0, 0.4);\" />\r\n	<span style=\"font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,&quot;Lucida Grande&quot;,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; display: inline ! important; float: none;\">- Tặng ch&uacute;ng ta &iacute;t th&ocirc;i v&agrave; mong muốn nhận lại nhiều.</span><br style=\"color: rgb(204, 204, 204); font-family: \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(0, 0, 0, 0.4);\" />\r\n	<span style=\"font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,&quot;Lucida Grande&quot;,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; display: inline ! important; float: none;\">- Chỉ gi&uacute;p ch&uacute;ng ta khi bản th&acirc;n họ đang bị nguy hiểm.</span><br style=\"color: rgb(204, 204, 204); font-family: \'Helvetica Neue\', Helvetica, Arial, \'Lucida Grande\', sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(0, 0, 0, 0.4);\" />\r\n	<span style=\"font-family: &quot;Helvetica Neue&quot;,Helvetica,Arial,&quot;Lucida Grande&quot;,sans-serif; font-size: 16px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 24px; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; display: inline ! important; float: none;\">- Li&ecirc;n hệ với ch&uacute;ng ta chỉ v&igrave; những động cơ vị kỷ.</span></span></p>\r\n', null, '2f987-482310_517066655001372_14627739_n.jpg', null, '', '', null, 'page', null, '', null);
INSERT INTO `post` VALUES ('4', '1', '1', '2015-06-29 15:53:21', '2014-07-21 22:20:01', 'Thông tin liên hệ', 'lienhe', '<p>\r\n	Th&ocirc;ng tin li&ecirc;n lạc c&ocirc;ng ty</p>\r\n', '<div class=\"container\">\r\n	<div class=\"row\">\r\n		<div class=\"col-sm-12\">\r\n			<h2>\r\n				C&ocirc;ng ty SCC H&agrave; Nội</h2>\r\n			<p class=\"lead\">\r\n				362/14, Đường Ung văn khi&ecirc;m, Phường 25, Quận B&igrave;nh Thạnh, TP Hồ Ch&iacute; Minh<br />\r\n				Telephone: 08 111111 / 08 222222<br />\r\n				FAX: 08 333333<br />\r\n				E-mail: info@xaydungscc.com<br />\r\n				Website: www.xaydungscc.com</p>\r\n		</div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', null, '', null, '', '', null, 'page', null, '', null);
INSERT INTO `post` VALUES ('5', '1', '1', '2015-07-02 17:22:25', '2014-07-22 13:35:10', 'Chi Nhánh', 'chinhanh', '<p>\r\n	Danh s&aacute;ch chi nh&aacute;nh c&ocirc;ng ty.</p>\r\n', '<p>\r\n	<span style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.3199996948242px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">Ho?t d?ng b?t ng? th&uacute; v? d&agrave;nh cho nh?ng b?n dang chu?n b? cho k&igrave; thi IELTS: WSE s? t? ch?c thi th? IELTS d? c&aacute;c b?n d&aacute;nh gi&aacute; kh? nang c?a m&igrave;nh v&agrave; tr?i nghi?m m?t k&igrave; thi &ldquo;nhu th?t&rdquo;!</span><br style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.3199996948242px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\" />\r\n	<span style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.3199996948242px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\">K&igrave; thi kh&ocirc;ng thu ph&iacute; nhung gi?i h?n s? lu?ng tham d?, v?y n&ecirc;n c&aacute;c b?n h&atilde;y nhanh tay dang k&yacute; t?i<span class=\"Apple-converted-space\">&nbsp;</span></span><a href=\"http://wallstreetenglish.edu.vn/vi/su-kien/849-thi-thu-ielts-mien-phi.html\" rel=\"nofollow\" style=\"color: rgb(59, 89, 152); cursor: pointer; text-decoration: none; font-family: helvetica, arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.3199996948242px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\" target=\"_blank\">http://wallstreetenglish.edu.vn/&hellip;/849-thi-thu-ielts-mien-ph&hellip;</a><span style=\"color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.3199996948242px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline !important; float: none; background-color: rgb(255, 255, 255);\"><span class=\"Apple-converted-space\">&nbsp;</span>d? kh&ocirc;ng b? qua tr?i nghi?m v&ocirc; c&ugrave;ng b? &iacute;ch n&agrave;y nh&eacute;. V&agrave; d?ng qu&ecirc;n nh?n &ldquo;Share&rdquo; d? chia s? th&ocirc;ng tin v? ho?t d?ng h?u &iacute;ch n&agrave;y d?n c&aacute;c b?n c?a m&igrave;</span><span class=\"text_exposed_show\" style=\"display: inline; color: rgb(20, 24, 35); font-family: helvetica, arial, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.3199996948242px; orphans: auto; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 1; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255);\">nh! Ch?c ch?n c&oacute; r?t nhi?u b?n b&egrave; c?a b?n dang quan t&acirc;m d?n k&igrave; thi cam go n&agrave;y d?y.<span class=\"Apple-converted-space\">&nbsp;</span><i class=\"_4-k1 img sp_fM-mz8spZ1b sx_d580ab\" style=\"vertical-align: -3px; display: inline-block; height: 16px; width: 16px; background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yx/r/pimRBh7B6ER.png); background-size: auto; background-position: 0px -170px; background-repeat: no-repeat;\"><u style=\"left: -999999px; position: absolute;\">grin emoticon</u></i><br />\r\n	...........................<span class=\"Apple-converted-space\">&nbsp;</span><br />\r\n	This amazing activity is for those who are preparing for IELTS: WSE will organize IELTS mock test for you to experience an actual IELTS based on international standards.<br />\r\n	Registration is limited so quickly click on<span class=\"Apple-converted-space\">&nbsp;</span><a href=\"http://wallstreetenglish.edu.vn/en/events/849-free-ielts-mock-test.html\" rel=\"nofollow\" style=\"color: rgb(59, 89, 152); cursor: pointer; text-decoration: none;\" target=\"_blank\">http://wallstreetenglish.edu.vn/&hellip;/849-free-ielts-mock-test.&hellip;</a><span class=\"Apple-converted-space\">&nbsp;</span>to attend this fantastic experience. And don&rsquo;t forget to click &ldquo;Share&rdquo; to share more information about this activity.<span class=\"Apple-converted-space\">&nbsp;</span><i class=\"_4-k1 img sp_fM-mz8spZ1b sx_d580ab\" style=\"vertical-align: -3px; display: inline-block; height: 16px; width: 16px; background-image: url(https://fbstatic-a.akamaihd.net/rsrc.php/v2/yx/r/pimRBh7B6ER.png); background-size: auto; background-position: 0px -170px; background-repeat: no-repeat;\"><u style=\"left: -999999px; position: absolute;\">grin emoticon</u></i></span></p>\r\n', null, '78534-item3.png', null, null, null, 'http://mp3.zing.vn/bai-hat/-Kaze-no-Kioku-Anri-Kumaki/ZWZAI6UW.html', 'page', null, '', null);
INSERT INTO `post` VALUES ('6', '1', '1', '2014-07-21 22:19:44', '2014-07-21 22:20:01', 'Home', 'trangchu', '', '<ul class=\"topItem1 clearfix\">\r\n	<li>\r\n    	<p class=\"img\"><a href=\"<?php echo base_url(\'page/new_bikes\')?>\"><img src=\"public/images/img8.png\" alt=\"\"/></a>\r\n        <dl class=\"clearfix\">\r\n        	<dt>Perth\'s Newest Honda Motorcycle Dealer</dt>\r\n            <dd><a href=\"<?php echo base_url(\'page/new_bikes\')?>\">View the Honda Range</a></dd>\r\n        </dl>\r\n    </li>\r\n\r\n	<li>\r\n    	<p class=\"img\"><a href=\"http://www.hyosung.com.au\" target=\"_blank\"><img src=\"public/images/img9.png\" alt=\"\"/></a>\r\n        <dl class=\"clearfix\">\r\n        	<dt>Perth\'s largest Hyosung Dealer</dt>\r\n            <dd><a  href=\"http://www.hyosung.com.au\" target=\"_blank\">View the Hyosung Range</a></dd>\r\n        </dl>\r\n    </li>\r\n\r\n</ul>', null, '', null, '', '', '', 'page', null, '', null);
INSERT INTO `post` VALUES ('7', '1', '1', '2015-07-02 05:44:08', null, 'Thành lập - phát triển', 'thanhlapphattrien', '<h3 style=\"box-sizing: border-box; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 400; line-height: 24px; color: rgb(120, 120, 120); margin-top: 0px; margin-bottom: 10px; font-size: 16px;\">\n	C&ocirc;ng ty Cổ phần Đầu tư X&acirc;y dựng ABC được th&agrave;nh lập năm 2005 với t&ecirc;n gọi C&ocirc;ng ty TNHH ABC, lĩnh vực kinh doanh ch&iacute;nh l&agrave; thi c&ocirc;ng, x&acirc;y dựng hệ thống cung cấp nước sạch, BTCT&hellip;Đến năm 2008, đổi t&ecirc;n th&agrave;nh C&ocirc;ng ty Cổ phần Đầu tư X&acirc;y dựng ABC cho đến nay.</h3>\n', '<h3 style=\"box-sizing: border-box; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 400; line-height: 24px; color: rgb(120, 120, 120); margin-top: 0px; margin-bottom: 10px; font-size: 16px;\">\n	C&ocirc;ng ty Cổ phần Đầu tư X&acirc;y dựng ABC được th&agrave;nh lập năm 2005 với t&ecirc;n gọi C&ocirc;ng ty TNHH ABC, lĩnh vực kinh doanh ch&iacute;nh l&agrave; thi c&ocirc;ng, x&acirc;y dựng hệ thống cung cấp nước sạch, BTCT&hellip;Đến năm 2008, đổi t&ecirc;n th&agrave;nh C&ocirc;ng ty Cổ phần Đầu tư X&acirc;y dựng ABC cho đến nay.</h3>\n', null, '29ba1-thanhlap.jpg', null, null, null, null, 'page', null, '', null);
INSERT INTO `post` VALUES ('8', '1', '1', '2015-07-02 05:44:51', '2015-06-16 16:48:15', 'Lĩnh vực hoạt động', 'linhvuchoatdong', '<h3 style=\"box-sizing: border-box; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 400; line-height: 24px; color: rgb(120, 120, 120); margin-top: 0px; margin-bottom: 10px; font-size: 16px;\">\n	C&ocirc;ng ty Cổ phần Đầu tư X&acirc;y dựng ABC được Sở Kế hoạch v&agrave; Đầu tư Tp.HCM cấp Giấy chứng nhận đăng k&yacute; doanh nghiệp số 0303898093, thay đổi lần thứ 8 ng&agrave;y 13 th&aacute;ng 02 năm 2015. Lĩnh vực hoạt động ch&iacute;nh của C&ocirc;ng ty l&agrave; x&acirc;y dựng Cầu đường, khai th&aacute;c mỏ đ&aacute;&hellip;</h3>\n', '<h3>\n	C&ocirc;ng ty Cổ phần Đầu tư X&acirc;y dựng ABC được Sở Kế hoạch v&agrave; Đầu tư Tp.HCM cấp Giấy chứng nhận đăng k&yacute; doanh nghiệp số 0303898093, thay đổi lần thứ 8 ng&agrave;y 13 th&aacute;ng 02 năm 2015. Lĩnh vực hoạt động ch&iacute;nh của C&ocirc;ng ty l&agrave; x&acirc;y dựng Cầu đường, khai th&aacute;c mỏ đ&aacute;&hellip;</h3>\n', null, 'ec385-linhvuc.jpg', null, null, null, null, 'page', null, '', null);
INSERT INTO `post` VALUES ('9', '1', '1', '2015-07-02 05:45:36', null, 'Cơ cấu tổ chức', 'cocautochuc', '<h3 style=\"box-sizing: border-box; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 400; line-height: 24px; color: rgb(120, 120, 120); margin-top: 0px; margin-bottom: 10px; font-size: 16px;\">\n	Hướng tới mục ti&ecirc;u ph&aacute;t triển bền vững trong tương lai, C&ocirc;ng ty ch&uacute;ng t&ocirc;i kh&ocirc;ng ngừng đổi mới c&ocirc;ng nghệ hiện đại phục vụ thi c&ocirc;ng, đổi mới c&ocirc;ng t&aacute;c tổ chức quản l&yacute;, n&acirc;ng cao năng lực chuy&ecirc;n m&ocirc;n của CB_CNV. Bằng sự đo&agrave;n kết v&agrave; nhất tr&iacute; một l&ograve;ng của tập thể CB_CNV năng động.</h3>\n', '<h3 style=\"box-sizing: border-box; font-family: \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-weight: 400; line-height: 24px; color: rgb(120, 120, 120); margin-top: 0px; margin-bottom: 10px; font-size: 16px;\">\n	Hướng tới mục ti&ecirc;u ph&aacute;t triển bền vững trong tương lai, C&ocirc;ng ty ch&uacute;ng t&ocirc;i kh&ocirc;ng ngừng đổi mới c&ocirc;ng nghệ hiện đại phục vụ thi c&ocirc;ng, đổi mới c&ocirc;ng t&aacute;c tổ chức quản l&yacute;, n&acirc;ng cao năng lực chuy&ecirc;n m&ocirc;n của CB_CNV. Bằng sự đo&agrave;n kết v&agrave; nhất tr&iacute; một l&ograve;ng của tập thể CB_CNV năng động.</h3>\n', null, 'e78e5-tochuc.jpg', null, null, null, null, 'page', null, '', null);
INSERT INTO `post` VALUES ('10', '1', '1', null, null, 'Chi Nhánh', 'chinhanh', '', '', null, '', null, null, null, null, 'page', null, '', null);
INSERT INTO `post` VALUES ('80', '1', '1', '2015-06-30 19:21:28', '2015-06-29 13:57:07', 'abc', '123', '<p>\r\n	&aacute;dfasdf</p>\r\n', '<p>\r\n	&aacute;dfasdf</p>\r\n', null, '', null, null, null, null, 'post', '4', '', null);
INSERT INTO `post` VALUES ('81', '1', '1', '2015-06-30 18:35:01', '2015-06-30 17:46:51', 'Tiến độ loạt dự án sau 6 tháng được hồi sinh', 'T01', '', '<h2 data-field=\"sapo\">\r\n	Đến nay Sun square đ&atilde; ho&agrave;n thiện m&oacute;ng, 3 tầng hầm, phần th&acirc;n đ&atilde; x&acirc;y th&ocirc; xong từ tầng 10 đến tầng 16. Được biết, hiện chủ đầu tư cam kết sẽ giao nh&agrave; v&agrave;o qu&yacute; 3/2016.</h2>\r\n<div>\r\n	<ul style=\"list-style-type:none;\">\r\n		<li>\r\n			<a href=\"http://cafef.vn/tin-tuc-du-an/can-canh-thien-duong-dap-chieu-thang-long-mansion-thanh-bai-trong-rua-xe-2014061607335792710.chn\" title=\"Cận cảnh “thiên đường đắp chiếu” Thăng Long Mansion thành.... bãi trông, rửa xe\">Cận cảnh &ldquo;thi&ecirc;n đường đắp chiếu&rdquo; Thăng Long Mansion th&agrave;nh.... b&atilde;i tr&ocirc;ng, rửa xe</a></li>\r\n		<li>\r\n			<a a=\"\" href=\"http://cafef.vn/tin-tuc-du-an/thang-long-mansion-thien-duong-dap-chieu-thanh-bai-trong-rua-xe-2013092409585420318.chn\" i=\"\" nh....=\"\" p=\"\" title=\"Thăng Long Mansion: Thiên đường \">Thăng Long Mansion: Thi&ecirc;n đường &quot;đắp chiếu&quot; th&agrave;nh.... b&atilde;i tr&ocirc;ng, rửa xe</a></li>\r\n	</ul>\r\n</div>\r\n<div data-field=\"body\">\r\n	<p>\r\n		<strong>B&agrave;i 1: Thăng Long Mansion &ldquo;đổi vỏ&rdquo; chờ đổi vận</strong></p>\r\n	<p>\r\n		Dự &aacute;n tọa lạc tại số 21 L&ecirc; Đức Thọ, huyện Từ Li&ecirc;m do C&ocirc;ng ty Cổ phần Đầu tư Ph&aacute;t triển Đ&ocirc; thị Thăng Long l&agrave;m chủ đầu tư. C&ocirc;ng tr&igrave;nh gồm 5 t&ograve;a nh&agrave; c&oacute; 2 t&ograve;a văn ph&ograve;ng 17 tầng, 1 văn ph&ograve;ng kết hợp căn hộ cho thu&ecirc; 21 tầng b&ecirc;n cạnh 2 t&ograve;a th&aacute;p chung cư cao cấp 30 tầng.</p>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img _fl=\"\" align=\"middle\" alt=\"Dự án nằm ngay tại ngã tư Lê Đức Thọ - Hàm Nghi\" h=\"456\" height=\"367\" id=\"img_29634\" photoid=\"img_29634\" rel=\"http://cafef.vcmedia.vn/2015/1-untitled-1435570006809.jpg\" src=\"http://cafef.vcmedia.vn/k:2015/1-untitled-1435570006809/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.jpg\" style=\"border:none;vertical-align:middle;\" templatetype=\"default\" type=\"photo\" w=\"517\" width=\"478\" /></div>\r\n		<div>\r\n			<p>\r\n				Dự &aacute;n nằm ngay tại ng&atilde; tư L&ecirc; Đức Thọ - H&agrave;m Nghi</p>\r\n		</div>\r\n	</div>\r\n	<p>\r\n		Dự &aacute;n ban đầu c&oacute; t&ecirc;n l&agrave; Thăng Long Mansion v&agrave; được khởi c&ocirc;ng từ năm 2009, dự kiến sẽ ho&agrave;n th&agrave;nh v&agrave;o cuối năm 2013. &nbsp;Giữa năm 2011, khi thị trường căn hộ c&oacute; dấu hiệu đi xuống r&otilde; rệt, chủ đầu tư đ&atilde; c&oacute; &yacute; định mở b&aacute;n v&agrave; căn hộ Thăng Long Mansion v&agrave; nhiều đơn vị m&ocirc;i giới quảng c&aacute;o<em><strong>&nbsp;rao b&aacute;n với gi&aacute; cao ngất ngưởng 34 - 37 triệu đồng/m2.</strong></em>&nbsp;Với mức gi&aacute; n&agrave;y, căn hộ dự &aacute;n Thăng Long Mansion cao hơn tr&ecirc;n dưới 10 triệu đồng/m2 so với những dự &aacute;n đồng hạng c&ugrave;ng khu vực.<br />\r\n		<br />\r\n		Nhưng v&agrave;o đ&uacute;ng thời điểm bất động sản bắt đầu &quot;lao dốc&quot;, gi&aacute; cao khiến dự &aacute;n đ&atilde; ch&igrave;m nghỉm. Kết quả l&agrave; từ cuối năm 2011, khi Dự &aacute;n Thăng Long Mansion được thi c&ocirc;ng đến tầng 6, đơn vị chủ đầu tư l&agrave; CTCP Đầu tư ph&aacute;t triển đ&ocirc; thị Thăng Long đ&atilde; bất ngờ ngừng mọi hoạt động thi c&ocirc;ng.</p>\r\n	<p>\r\n		Theo một số nh&agrave; đầu tư, số phận của dự &aacute;n Thăng Long Mansion đ&atilde; được dự b&aacute;o trước, kh&ocirc;ng chỉ v&igrave; chủ dự &aacute;n chọn nhầm điểm rơi b&aacute;n h&agrave;ng đ&uacute;ng l&uacute;c thị trường đi xuống, m&agrave; c&ograve;n v&igrave; chủ dự &aacute;n đ&atilde; định gi&aacute; qu&aacute; cao, khiến căn hộ dự &aacute;n kh&ocirc;ng được kh&aacute;ch h&agrave;ng quan t&acirc;m. Việc dự &aacute;n ngừng thi c&ocirc;ng qu&aacute; l&acirc;u được đồn đo&aacute;n l&agrave; do chủ đầu tư kh&ocirc;ng thể huy động được nguồn vốn từ kh&aacute;ch h&agrave;ng.</p>\r\n	<p>\r\n		Trong suốt 3 năm phơi nắng phơi mưa, c&ocirc;ng trường dự &aacute;n n&agrave;y được tận dụng l&agrave;m điểm tr&ocirc;ng giữ &ocirc; t&ocirc; xe m&aacute;y. Việc dự &aacute;n bị ngừng thi c&ocirc;ng trong thời gian d&agrave;i khiến một số kết cấu th&eacute;p tr&ecirc;n c&ocirc;ng tr&igrave;nh bị han gỉ nghi&ecirc;m trọng.</p>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img alt=\"Toàn cảnh dự án đang triển khai dở dang vào tháng 6/2014\" h=\"375\" id=\"img_29640\" photoid=\"img_29640\" rel=\"http://cafef.vcmedia.vn/2015/1-wp001898-1435570074584.jpg\" src=\"http://cafef.vcmedia.vn/k:2015/1-wp001898-1435570074584/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.jpg\" style=\"border:none;vertical-align:middle;\" templatetype=\"default\" type=\"photo\" w=\"500\" /></div>\r\n		<div>\r\n			<p>\r\n				To&agrave;n cảnh dự &aacute;n đang triển khai dở dang v&agrave;o th&aacute;ng 6/2014</p>\r\n		</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		&nbsp;</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<em><img _fl=\"\" align=\"middle\" alt=\"Thăng Long Mansion: Thiên đường \" h=\"474\" id=\"img_29638\" photoid=\"img_29638\" rel=\"http://cafef.vcmedia.vn/Images/Uploaded/Share/8a010923642b7bc979a379e399d7ca78/2013/09/24/WP002442/thang-long-mansion-thien-duong-dap-chieu-thanh-bai-trong-rua-xe.jpg\" src=\"http://cafef.vcmedia.vn/k:Images/Uploaded/Share/8a010923642b7bc979a379e399d7ca78/2013/09/24/WP002442/thang-long-mansion-thien-duong-dap-chieu-thanh-bai-trong-rua-xe/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.jpg\" style=\"border:none;vertical-align:middle;\" templatetype=\"default\" type=\"photo\" w=\"560\" /></em></div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			&nbsp;Để đắp chiếu l&acirc;u ng&agrave;y phơi nắng, phơi mưa, cốt th&eacute;p đ&atilde; hoen gỉ</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<em><img _fl=\"\" align=\"middle\" alt=\"\" h=\"375\" id=\"img_29639\" photoid=\"img_29639\" rel=\"http://cafef.vcmedia.vn/2015/1-wp001896-1435570148726.jpg\" src=\"http://cafef.vcmedia.vn/k:2015/1-wp001896-1435570148726/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.jpg\" style=\"border:none;vertical-align:middle;\" type=\"photo\" w=\"500\" width=\"500\" /></em></div>\r\n		<div>\r\n			Tổ hợp t&ograve;a nh&agrave; dang dở n&agrave;y từng được tận dụng l&agrave;m chỗ để xe, rửa xe.</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<em><img _fl=\"\" align=\"middle\" alt=\"Pano quảng cáo hoành tráng 1 thời bị rách nát\" h=\"375\" id=\"img_29635\" photoid=\"img_29635\" rel=\"http://cafef.vcmedia.vn/2015/3-wp001904-1435570071838.jpg\" src=\"http://cafef.vcmedia.vn/k:2015/3-wp001904-1435570071838/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.jpg\" style=\"border:none;vertical-align:middle;\" templatetype=\"default\" type=\"photo\" w=\"500\" width=\"500\" /></em></div>\r\n		<div>\r\n			&nbsp;Pano quảng c&aacute;o ho&agrave;nh tr&aacute;ng 1 thời bị r&aacute;ch n&aacute;t</div>\r\n	</div>\r\n	<p>\r\n		Đầu năm 2015, Dự &aacute;n Thăng Long Mansion bất ngờ được CTCP Đầu tư ph&aacute;t triển đ&ocirc; thị Thăng Long giới thiệu ra thị trường với t&ecirc;n gọi mới l&agrave; Sun Square. Đồng thời, chủ đầu tư n&agrave;y cũng c&ocirc;ng bố c&aacute;c đối t&aacute;c li&ecirc;n quan đến việc thi c&ocirc;ng dự &aacute;n, đối t&aacute;c b&aacute;n h&agrave;ng v&agrave; ng&acirc;n h&agrave;ng hỗ trợ vay vốn.</p>\r\n	<p>\r\n		Việc k&yacute; thỏa thuận hợp t&aacute;c với h&agrave;ng loạt đối t&aacute;c từ thi c&ocirc;ng, hỗ trợ vốn, đến b&aacute;n h&agrave;ng cho thấy chủ đầu tư tỏ ra kh&aacute; quyết t&acirc;m khởi động lại dự &aacute;n n&agrave;y. Thế nhưng, việc t&aacute;i khởi động đi k&egrave;m với việc đổi t&ecirc;n dự &aacute;n cho thấy chủ đầu tư rất ngại &quot;c&aacute;i b&oacute;ng&quot; của dự &aacute;n kh&aacute; nổi tiếng v&agrave; cũng nhiều tai tiếng Thăng Long Mansion trước đ&acirc;y c&oacute; thể g&acirc;y ảnh hưởng đến việc b&aacute;n h&agrave;ng, nhất l&agrave; khi thị trường căn hộ cao cấp chưa thực sự hồi phục.</p>\r\n	<p>\r\n		Theo một đại diện đơn vị ph&acirc;n phối c&oacute; tiếng tại H&agrave; Nội thừa nhận những lợi thế về vị tr&iacute; m&agrave; Sun Square đang c&oacute;. Thế nhưng, việc dự &aacute;n c&oacute; b&aacute;n được sản phẩm hay kh&ocirc;ng, theo đại diện n&agrave;y, phụ thuộc rất nhiều v&agrave;o sự chuyển động tr&ecirc;n c&ocirc;ng trường dự &aacute;n trong thời gian tới.</p>\r\n	<p>\r\n		Được biết, hiện chủ đầu tư cam kết sẽ giao nh&agrave; v&agrave;o qu&yacute; 3/2016. Đến nay Sun square đ&atilde; ho&agrave;n thiện m&oacute;ng, 3 tầng hầm, phần th&acirc;n đ&atilde; x&acirc;y th&ocirc; xong từ tầng 10 đến tầng 16.</p>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img h=\"373\" id=\"img_29597\" photoid=\"img_29597\" rel=\"http://cafef.vcmedia.vn/2015/img-1439-1435566515497.JPG\" src=\"http://cafef.vcmedia.vn/k:2015/img-1439-1435566515497/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.JPG\" style=\"border:none;vertical-align:middle;\" type=\"photo\" w=\"500\" /></div>\r\n		<div>\r\n			C&ocirc;ng tr&igrave;nh nh&igrave;n từ ng&atilde; tư L&ecirc; Đức Thọ - H&agrave;m Nghi</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img alt=\"\" h=\"500\" id=\"img_29580\" photoid=\"29580\" rel=\"http://cafef.vcmedia.vn/2015/img-1433-1435566515330.JPG\" src=\"http://cafef.vcmedia.vn/k:2015/img-1433-1435566515330/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.JPG\" style=\"border:none;vertical-align:middle;\" title=\"\" type=\"photo\" w=\"373\" /></div>\r\n		<div>\r\n			Hiện tại c&aacute;c t&ograve;a đang x&acirc;y dựng phần th&acirc;n từ tầng 10 đến tầng 16</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img alt=\"\" h=\"500\" id=\"img_29581\" photoid=\"29581\" rel=\"http://cafef.vcmedia.vn/2015/img-1434-1435566515355.JPG\" src=\"http://cafef.vcmedia.vn/k:2015/img-1434-1435566515355/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.JPG\" style=\"border:none;vertical-align:middle;\" title=\"\" type=\"photo\" w=\"373\" /></div>\r\n		<div>\r\n			Chủ đầu tư cho biết, dự &aacute;n sẽ b&agrave;n giao cho kh&aacute;ch sau khoảng gần 1 năm nữa</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img alt=\"Các căn hộ tại đây đang được chủ đầu tư bán với giá từ 27 triệu đồng/m2. Giá này đã giảm nhiều so với mức giá từ 34 - 37 triệu đồng/m2 mà chủ đầu tư đưa ra hồi năm 2011\" h=\"373\" id=\"img_29598\" photoid=\"img_29598\" rel=\"http://cafef.vcmedia.vn/2015/img-1443-1435566515574.JPG\" src=\"http://cafef.vcmedia.vn/k:2015/img-1443-1435566515574/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.JPG\" style=\"border:none;vertical-align:middle;\" templatetype=\"default\" type=\"photo\" w=\"500\" /></div>\r\n		<div>\r\n			<p>\r\n				C&aacute;c căn hộ tại đ&acirc;y đang được chủ đầu tư b&aacute;n với gi&aacute; từ 27 triệu đồng/m2. Gi&aacute; n&agrave;y đ&atilde; giảm nhiều so với mức gi&aacute; từ 34 - 37 triệu đồng/m2 m&agrave; chủ đầu tư đưa ra hồi năm 2011</p>\r\n		</div>\r\n	</div>\r\n	<div type=\"Photo\">\r\n		<div>\r\n			<img alt=\"\" h=\"373\" id=\"img_29585\" photoid=\"29585\" rel=\"http://cafef.vcmedia.vn/2015/img-1438-1435566515471.JPG\" src=\"http://cafef.vcmedia.vn/k:2015/img-1438-1435566515471/soi-tien-do-loat-du-an-sau-6-thang-duoc-hoi-sinh.JPG\" style=\"border:none;vertical-align:middle;\" title=\"\" type=\"photo\" w=\"500\" /></div>\r\n	</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', null, 'e0f6d-18864.jpg', null, null, null, null, 'post', '2', '', '2');
INSERT INTO `post` VALUES ('82', '1', null, null, '2015-06-30 18:41:09', 'Căn hộ cao cấp mở bán nhiều gấp 3 lần tại Hà Nội', 'T02', '<div>\r\n	Căn hộ cao cấp mở b&aacute;n nhiều gấp 3 lần tại H&agrave; Nội</div>\r\n', '<div>\r\n	Tỷ trọng căn hộ cao cấp được giao dịch trong 5 th&aacute;ng đầu năm chiếm 22%, gần gấp 4 lần năm 2013. Trong khi đ&oacute;, tỷ trọng mua b&aacute;n ph&acirc;n kh&uacute;c b&igrave;nh d&acirc;n lại giảm c&oacute; xu hướng giảm.&nbsp;</div>\r\n<div>\r\n	<ul style=\"list-style-type:none;\">\r\n		<li>\r\n			<a href=\"http://kinhdoanh.vnexpress.net/tin-tuc/bat-dong-san/tieu-thu-can-ho-tp-hcm-lap-ky-luc-3241417.html\" title=\"Tiêu thụ căn hộ TP HCM lập kỷ lục\">Ti&ecirc;u thụ căn hộ TP HCM lập kỷ lục</a></li>\r\n	</ul>\r\n</div>\r\n<div>\r\n	<p>\r\n		Theo b&aacute;o c&aacute;o bất động sản của CBRE vừa được c&ocirc;ng bố, trong qu&yacute; II, H&agrave; Nội c&oacute; tổng cộng 5.137 căn hộ được mở b&aacute;n mới từ 19 dự &aacute;n, tăng 19% so với c&ugrave;ng kỳ. Đặc biệt, căn hộ cao cấp chiếm tỷ trọng tăng dần trong tổng số căn mở b&aacute;n mới. Lần đầu ti&ecirc;n căn hộ cao cấp chiếm tỷ lệ khoảng một phần ba tổng số căn mở b&aacute;n mới (khoảng 30%), tỷ lệ n&agrave;y cao hơn trong tất cả c&aacute;c qu&yacute; từ 2012 đến nay. Số căn hộ cao cấp tăng gấp 3 lần so với qu&yacute; trước với 1.518 căn.&nbsp;</p>\r\n	<p>\r\n		Ước t&iacute;nh c&oacute; khoảng 4.480 căn hộ được giao dịch trong qu&yacute;, tăng 80% so với c&ugrave;ng kỳ. Trong đ&oacute;, giao dịch đối với căn hộ cao cấp cũng tăng l&ecirc;n. T&iacute;nh chung trong 5 th&aacute;ng, chuyển nhượng căn hộ cao cấp chiếm 22% tổng số giao dịch, trong khi c&ugrave;ng kỳ 2014 l&agrave; 18% v&agrave; 2013 chỉ c&oacute; 6%.&nbsp;</p>\r\n	<p>\r\n		Đối với ph&acirc;n kh&uacute;c căn hộ b&igrave;nh d&acirc;n - ph&acirc;n kh&uacute;c từng thống lĩnh thị trường c&oacute; tỷ lệ giao dịch lại giảm c&ograve;n 26% trong qu&yacute; n&agrave;y. Tỷ lệ n&agrave;y năm 2014 l&agrave; 44%, 2013 l&agrave; 49%.</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"Hancorp-AQ-3855-1396666545-7592-14356541\" data-pwidth=\"470.40625\" data-width=\"490\" src=\"http://c1.f25.img.vnecdn.net/2015/06/30/Hancorp-AQ-3855-1396666545-7592-1435654168.jpg\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Thị trường giao dịch căn hộ kh&aacute; s&ocirc;i động&nbsp;trong qu&yacute; II.&nbsp;<em>Ảnh: Anh Qu&acirc;n</em></p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		L&yacute; giải về những diễn biến ở ph&acirc;n kh&uacute;c căn hộ cao cấp, b&agrave; Nguyễn Ho&agrave;i An, Ph&oacute; gi&aacute;m đốc CBRE cho rằng đ&acirc;y kh&ocirc;ng phải l&agrave; t&igrave;nh trạng bất b&igrave;nh thường. Nguy&ecirc;n nh&acirc;n l&agrave;&nbsp;tỷ lệ sinh lời về mặt cho thu&ecirc; tr&ecirc;n gi&aacute; trị t&agrave;i sản ở ph&acirc;n kh&uacute;c cao cấp lớn hơn n&ecirc;n nhiều nh&agrave; đầu tư chuộng hơn.&nbsp;</p>\r\n	<p>\r\n		&quot;Tuy nhi&ecirc;n, thực tế th&igrave; hiện nay chưa c&oacute; ti&ecirc;u ch&iacute; r&otilde; r&agrave;ng để ph&acirc;n chia loại căn hộ cao cấp hay b&igrave;nh d&acirc;n, chủ yếu dựa v&agrave;o gi&aacute;&quot;, b&agrave; n&oacute;i.</p>\r\n	<p>\r\n		Cũng theo chuy&ecirc;n gia n&agrave;y, khi thị trường đang c&oacute; dấu hiệu ấm l&ecirc;n, c&aacute;c chủ đầu tư ở những dự &aacute;n c&oacute; vị tr&iacute; tốt (thường lựa chọn triển khai ph&acirc;n kh&uacute;c cao cấp) cũng nắm bắt được cơ hội như vậy để t&aacute;i khởi động. Bởi v&igrave; khi thị trường kh&oacute; khăn th&igrave; nhu cầu mua để đầu tư kh&ocirc;ng nhiều, ngược lại giao dịch ấm l&ecirc;n th&igrave; con số n&agrave;y lại tăng.&nbsp;</p>\r\n	<p>\r\n		<strong>Về gi&aacute; cả, b&aacute;o c&aacute;o cho biết một số dự &aacute;n tăng khoảng 4-6% so với năm trước, đặc biệt tại những nơi c&oacute; vị tr&iacute; tốt.</strong>&nbsp;Hiện tượng gi&aacute; tăng chủ yếu tại ph&acirc;n kh&uacute;c cao cấp v&agrave; b&igrave;nh d&acirc;n. Tuy nhi&ecirc;n, ở những ph&acirc;n kh&uacute;c cao cấp, gi&aacute; chỉ tăng tại c&aacute;c dự &aacute;n quy m&ocirc; lớn của chủ đầu tư c&oacute; t&ecirc;n tuổi, cung cấp đầy đủ c&aacute;c tiện &iacute;ch v&agrave; hạng mục phụ trợ trong khu đ&ocirc; thị. Với ph&acirc;n kh&uacute;c b&igrave;nh d&acirc;n, c&aacute;c dự &aacute;n c&oacute; mức gi&aacute; tốt, ở vị tr&iacute; thuận tiện tăng gi&aacute; khi được b&aacute;n lại cho c&aacute;c kh&aacute;ch h&agrave;ng đầu tư.&nbsp;</p>\r\n	<p>\r\n		Tr&ecirc;n thị trường thứ cấp, gi&aacute; được cải thiện tốt ở cả 3 ph&acirc;n kh&uacute;c cao cấp, trung cấp v&agrave; b&igrave;nh d&acirc;n. Trong đ&oacute;, ph&acirc;n kh&uacute;c trung cấp tăng mạnh nhất, hầu hết tại c&aacute;c dự &aacute;n gần c&ocirc;ng tr&igrave;nh cơ sở hạ tầng quan trọng khu ph&iacute;a T&acirc;y.</p>\r\n	<p>\r\n		Theo nhận định của CBRE, tiến độ x&acirc;y dựng cơ sở hạ tầng đ&atilde; t&aacute;c động t&iacute;ch cực đến diễn biến gi&aacute; c&aacute;c dự &aacute;n l&acirc;n cận. &nbsp;</p>\r\n	<p>\r\n		&quot;Trong thời gian tới, cơ sở hạ tầng được dự kiến sẽ tiếp tục l&agrave; yếu tố x&uacute;c t&aacute;c để c&aacute;c dự &aacute;n mới cũng như c&aacute;c chủ đầu tư, nh&agrave; đầu tư tham gia v&agrave;o thị trường. &nbsp;Thị trường cũng được dự b&aacute;o sẽ ghi nhận th&ecirc;m c&aacute;c dự &aacute;n hạng sang v&agrave; cao cấp, do c&aacute;c chủ đầu tư nắm bắt cơ hội. &nbsp;B&ecirc;n cạnh đ&oacute;, x&eacute;t trong d&agrave;i hạn, với c&aacute;c quy định v&agrave; luật lệ mới, thị trường dự kiến sẽ trở n&ecirc;n minh bạch hơn đối với c&aacute;c đối tượng tham gia&quot;, b&aacute;o c&aacute;o cho hay.</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', null, '8eb95-154645_143944218990031_100001233600287_270176_2494020_n.jpg', null, null, null, null, 'post', '2', '', null);
INSERT INTO `post` VALUES ('83', '1', '1', '2015-06-30 19:27:16', '2015-06-30 19:26:35', 'Trả trước 210 triệu đồng sở hữu căn hộ chung cư Đặng Xá', 'T03', '<h1 style=\"margin: 0px; padding: 0px; font-weight: 400; font-size: 28px; line-height: 32px; font-family: arial; text-rendering: geometricprecision; color: rgb(51, 51, 51);\">\r\n	Trả trước 210 triệu đồng sở hữu căn hộ chung cư Đặng X&aacute;</h1>\r\n', '<div>\r\n	Chỉ cần thanh to&aacute;n 210 triệu đồng (tương đương 30% gi&aacute; trị hợp đồng), trả gốc v&agrave; l&atilde;i khoảng 4 triệu đồng một th&aacute;ng l&agrave; c&oacute; thể sở hữu căn hộ tại dự &aacute;n chung cư gi&aacute; thấp CT8 Đặng X&aacute;.&nbsp;</div>\r\n<div>\r\n	<p>\r\n		Chủ đầu tư Viglacera c&ograve;n tặng 25-40 triệu đồng cho người mua nh&agrave; trong th&aacute;ng 6 v&agrave; th&aacute;ng 7. Căn hộ chung cư CT8 c&oacute; gi&aacute; b&aacute;n từ 13,2 triệu đồng một m2 (b&agrave;n giao căn hộ ho&agrave;n thiện, gi&aacute; chưa gồm VAT v&agrave; ph&iacute; bảo tr&igrave;).&nbsp;</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"\" data-natural-=\"\" data-pwidth=\"470.40625\" data-width=\"500\" src=\"http://m.f25.img.vnecdn.net/2015/06/30/29-6-201539-901037641-6858-1435633530.png\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Phối cảnh tổng thể chung cư CT8.</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		Chung cư CT8 thuộc khu đ&ocirc; thị Đặng X&aacute; (Gia L&acirc;m, H&agrave; Nội) do Viglacera l&agrave;m chủ đầu tư, bao gồm 3 t&ograve;a nh&agrave; cao 9 tầng, bố tr&iacute; 288 căn hộ. Dự &aacute;n mang đến cho nhiều lựa chọn với c&aacute;c căn hộ diện t&iacute;ch từ 48m2 đến 70m2 (diện t&iacute;ch tim tường).</p>\r\n	<p>\r\n		C&aacute;c căn hộ c&oacute; thiết kế hợp l&yacute;, ngay cả với căn hộ 48m2 cũng c&oacute; thể biến đổi kh&ocirc;ng gian linh hoạt th&agrave;nh hai ph&ograve;ng ngủ, ph&ugrave; hợp với hộ gia đ&igrave;nh 3-4 người. Căn hộ đảm bảo sự th&ocirc;ng tho&aacute;ng, đầy đủ &aacute;nh s&aacute;ng v&agrave; diện t&iacute;ch ri&ecirc;ng tư cho từng th&agrave;nh vi&ecirc;n trong gia đ&igrave;nh.&nbsp;Mỗi tầng căn hộ đều được trang bị hệ thống camera quan s&aacute;t 24/7. Nhờ đ&oacute; việc ra v&agrave;o t&ograve;a nh&agrave; sẽ được gi&aacute;m s&aacute;t chặt chẽ hơn, đảm bảo an ninh, an to&agrave;n cho to&agrave;n bộ cư d&acirc;n sinh sống trong dự &aacute;n.</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"\" data-natural-=\"\" data-pwidth=\"470.40625\" data-width=\"500\" src=\"http://m.f25.img.vnecdn.net/2015/06/30/29-6-201545-404435255-3176-1435633531.png\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Hướng nh&igrave;n từ chung cư CT8 ra&nbsp;c&ocirc;ng vi&ecirc;n v&agrave; hồ nước 50.000m2.</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		Khu chung cư CT8 nằm ngay mặt ngo&agrave;i của khu đ&ocirc; thị Đặng X&aacute;, tọa lạc gần tuyến Quốc lộ 5, c&oacute; tầm nh&igrave;n hướng ra c&ocirc;ng vi&ecirc;n v&agrave; hồ nước 50.000m2 n&ecirc;n tạo được kh&ocirc;ng gian tho&aacute;ng, vị tr&iacute; giao th&ocirc;ng thuận lợi, dễ d&agrave;ng tiếp cận với c&aacute;c khu dịch vụ tiện &iacute;ch nội khu cũng như di chuyển đến trung t&acirc;m H&agrave; Nội v&agrave; c&aacute;c khu vực l&acirc;n cận.</p>\r\n	<p>\r\n		Chủ đầu tư Viglacera &aacute;p dụng h&igrave;nh thức thanh to&aacute;n linh hoạt v&agrave; chia tiến độ thanh to&aacute;n hợp l&yacute; cho người mua nh&agrave; th&agrave;nh 5 đợt theo tiến độ x&acirc;y dựng c&ocirc;ng tr&igrave;nh. Do đ&acirc;y l&agrave; dự &aacute;n nằm trong g&oacute;i hỗ trợ t&iacute;n dụng 30.000 tỷ của Ch&iacute;nh phủ n&ecirc;n người mua chỉ cần đ&oacute;ng trước 210 triệu đồng cho đợt đầu. Số c&ograve;n lại sẽ được ng&acirc;n h&agrave;ng hỗ trợ vay vốn với mức l&atilde;i suất 5% một năm trong 15 năm. H&agrave;ng th&aacute;ng, tiền gốc v&agrave; l&atilde;i trung b&igrave;nh khoảng 4 triệu đồng.</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"2\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"\" data-natural-=\"\" data-pwidth=\"470.40625\" data-width=\"500\" src=\"http://m.f25.img.vnecdn.net/2015/06/30/29-6-201552-6590-1435633531.png\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Hotline&nbsp;C&ocirc;ng ty Đầu tư Ph&aacute;t triển hạ tầng Viglacera: 0933458558 -&nbsp;0914822522.</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		Hiện nay số lượng d&acirc;n cư trong khu đ&ocirc; thị Đặng X&aacute; đ&atilde; l&ecirc;n đến 15.000 người. Dự &aacute;n c&oacute; quy hoạch đồng bộ với hệ thống tiện &iacute;ch đ&ocirc; thị kh&eacute;p k&iacute;n, cơ sở hạ tầng đồng bộ, phục vụ đời sống thường ng&agrave;y của cư d&acirc;n, bao gồm hệ thống trường mầm non, si&ecirc;u thị, nh&agrave; h&agrave;ng, bể bơi, s&acirc;n tennis, c&ocirc;ng vi&ecirc;n&hellip; Trong khu đ&ocirc; thị c&ograve;n c&oacute; điểm chờ xe bus đi đến trung t&acirc;m th&agrave;nh phố.</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', null, '', null, null, null, null, 'post', '5', '', null);
INSERT INTO `post` VALUES ('84', '1', null, null, '2015-06-30 19:35:59', 'Gần 500 người dự mở bán đợt 2 dự án FLC Sầm Sơn', 'T09', '<h1 style=\"margin: 0px; padding: 0px; font-weight: 400; font-size: 28px; line-height: 32px; font-family: arial; text-rendering: geometricprecision; color: rgb(51, 51, 51);\">\r\n	Gần 500 người dự mở b&aacute;n đợt 2 dự &aacute;n FLC Sầm Sơn</h1>\r\n', '<div>\r\n	50 người đầu ti&ecirc;n đặt mua biệt thự đ&atilde; được tặng g&oacute;i dịch vụ ưu đ&atilde;i trị gi&aacute; 888 triệu đồng một căn.</div>\r\n<div>\r\n	<p>\r\n		Ng&agrave;y 27-28/6, C&ocirc;ng ty cổ phần Tập đo&agrave;n FLC tổ chức lễ mở b&aacute;n lần 2 dự &aacute;n FLC Residences Sầm Sơn.</p>\r\n	<p>\r\n		B&agrave; Nguyễn Xu&acirc;n Hương, Trưởng Ph&ograve;ng Kinh doanh bất động sản Tập đo&agrave;n FLC chia sẻ, doanh nghiệp muốn kh&aacute;ch h&agrave;ng tận mắt xem x&eacute;t vị tr&iacute;, kiến tr&uacute;c của c&aacute;c căn biệt thự, trực tiếp trải nghiệm những tiện &iacute;ch m&agrave; cả quần thể du lịch mang lại. Điều n&agrave;y gi&uacute;p c&aacute;c chủ nh&acirc;n căn hộ tương lai hiểu v&agrave; cảm nhận r&otilde; gi&aacute; trị của c&aacute;c căn biệt thự m&agrave; m&igrave;nh sẽ sở hữu.</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"2_1435555133.jpg\" data-natural-=\"\" data-pwidth=\"470.40625\" data-width=\"500\" src=\"http://c1.f25.img.vnecdn.net/2015/06/29/2-9624-1435560025.jpg\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Kh&aacute;ch h&agrave;ng được chia sẻ c&aacute;c th&ocirc;ng tin về khu biệt thự FLC Residences Samson của Tập đo&agrave;n FLC.</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		Do đ&oacute;, tại lễ mở b&aacute;n, ngo&agrave;i việc được giới thiệu, tư vấn chi tiết về sản phẩm v&agrave; c&aacute;c ch&iacute;nh s&aacute;ch b&aacute;n h&agrave;ng của Tập đo&agrave;n FLC, người tham dự c&ograve;n tham quan to&agrave;n bộ khu biệt thự đ&atilde; x&acirc;y th&ocirc; hoặc ho&agrave;n thiện. Mọi người cũng trải nghiệm miễn ph&iacute; một số dịch vụ cao cấp của Quần thể Du lịch nghỉ dưỡng sinh th&aacute;i FLC Sầm Sơn (FLC Samson Beach &amp; Golf Resort).</p>\r\n	<p>\r\n		Những ai mua biệt thự tại FLC Residences Sầm Sơn lần n&agrave;y được tặng g&oacute;i dịch vụ ưu đ&atilde;i trị gi&aacute; 888 triệu đồng một g&oacute;i cho 50 người đầu ti&ecirc;n. Trong đ&oacute; c&oacute; miễn ph&iacute; 3 năm dịch vụ quản l&yacute; bởi một thương hiệu quốc tế uy t&iacute;n, 3 năm dịch vụ bể bơi nước mặn ti&ecirc;u chuẩn 5 sao của kh&aacute;ch sạn &Agrave; La Carte, 3 năm chơi golf tại s&acirc;n golf dạng links 18 lỗ hiện đại ở Việt Nam - FLC Samson Golf Links...</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"4_1435555174_1435555209.jpg\" data-natural-=\"\" data-pwidth=\"470.40625\" data-width=\"500\" src=\"http://c1.f25.img.vnecdn.net/2015/06/29/4-7885-1435560025.jpg\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Dịch vụ spa 5 sao cao cấp tại Fusion Resort Samson, l&atilde;ng mạn v&agrave; ri&ecirc;ng tư b&ecirc;n bờ biển lộng gi&oacute;.</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		FLC Residences Sầm Sơn nằm trong kh&ocirc;ng gian quần thể đại dự &aacute;n FLC Samson Beach &amp; Golf Resort với thiết kế đầy đủ c&aacute;c dịch vụ ti&ecirc;u chuẩn 5 sao, được quản l&yacute; vận h&agrave;nh bởi c&aacute;c t&ecirc;n tuổi lớn tr&ecirc;n thế giới.</p>\r\n	<p>\r\n		Dự &aacute;n bao gồm nhiều hạng mục như biệt thự nghỉ dưỡng, kh&aacute;ch sạn ti&ecirc;u chuẩn 5 sao, bể bơi nước mặn ngo&agrave;i trời rộng hơn 5.000 m2, s&acirc;n golf 18 lỗ, khu nh&agrave; h&agrave;ng, kh&aacute;ch sạn, dịch vụ spa, trung t&acirc;m hội nghị quốc tế 1.300 chỗ ngồi&hellip;</p>\r\n	<p>\r\n		Kh&ocirc;ng chỉ tạo kh&ocirc;ng gian sống l&yacute; tưởng, dự &aacute;n cũng đồng thời mang tới cơ hội đầu tư sinh lời cho cư d&acirc;n, với cam kết cho thu&ecirc; đảm bảo mức lợi tức 7% một năm. Hai năm đầu, chủ căn hộ được ứng trước m&agrave; vẫn c&oacute; quyền sử dụng biệt thự khi c&oacute; nhu cầu.</p>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" style=\"width:470px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<img alt=\"5_1435555258.jpg\" data-natural-=\"\" data-pwidth=\"470.40625\" data-width=\"500\" src=\"http://c1.f25.img.vnecdn.net/2015/06/29/5-5484-1435560025.jpg\" style=\"border:0px;line-height:0;width:470px;\" /></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"line-height:0;\">\r\n					<p>\r\n						Trải nghiệm s&acirc;n golf dạng link ven biển đẹp nhất Việt Nam. Xem th&ecirc;m tại<a href=\"http://www.flcresidencessamson.vn/\" target=\"_blank\">www.flcresidencessamson.vn</a>&nbsp; hoặc 0965 600 688/ 0965 399 688.</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<p>\r\n		C&aacute;c căn biệt thự FLC Residences Samson mở b&aacute;n lần n&agrave;y c&oacute; diện t&iacute;ch 200-500 m2 một căn, thiết kế theo phong c&aacute;ch hiện đại, h&agrave;i h&ograve;a với kh&ocirc;ng gian xung quanh. Tất cả c&aacute;c căn đều c&oacute; một hướng nh&igrave;n ra s&acirc;n golf v&agrave; một hướng nh&igrave;n ra biển, đ&atilde; được x&acirc;y dựng. Mức gi&aacute; b&aacute;n của c&aacute;c căn biệt thự n&agrave;y dao động 11-15 triệu đồng một m2, tương đương gi&aacute; c&aacute;c căn nh&agrave; liền kề ở th&agrave;nh phố Thanh H&oacute;a, thị x&atilde; Sầm Sơn. Từ dự &aacute;n mất khoảng 15 ph&uacute;t l&aacute;i xe từ Sầm Sơn v&agrave;o Thanh H&oacute;a.</p>\r\n	<p>\r\n		Trước đ&oacute;, trong ng&agrave;y mở b&aacute;n đầu ti&ecirc;n (31/5), được tổ chức tại Trung t&acirc;m hội nghị quốc tế, cũng thuộc quần thể dự &aacute;n FLC Sầm Sơn, với tr&ecirc;n 2.000 người tham dự, to&agrave;n bộ số biệt thự FLC Residences Samson mở b&aacute;n đ&atilde; được b&aacute;n hết.</p>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', null, '', null, null, null, null, 'post', '3', '', null);
INSERT INTO `post` VALUES ('85', '1', '1', '2015-07-01 14:11:48', '2015-07-01 12:17:27', 'System Engineer', 'System Engineer', '', '<div class=\"tuyendungInfo\">\r\n	<h4>\r\n		System Engineer</h4>\r\n	<div>\r\n		<b>M&atilde; ngh? nghi?p:</b> 15-ZME-0126<br />\r\n		<b>Noi l&agrave;m vi?c:</b> Tp H? Ch&iacute; Minh<br />\r\n		<b>Luong:</b> Th?a thu?n</div>\r\n	<h5>\r\n		M&ocirc; t? c&ocirc;ng vi?c</h5>\r\n	<div>\r\n		- Ch?u tr&aacute;ch nhi?m v?n h&agrave;nh h? th?ng server c?a Zingme, Zingme mobile c&oacute; traffic cao.<br />\r\n		- H? tr? c&aacute;c Developer trong vi?c tri?n khai s?n ph?m web, mobile, desktop l&ecirc;n m&ocirc;i tru?ng staging, production.<br />\r\n		- Ch?u tr&aacute;ch nhi?m x&acirc;y d?ng v&agrave; v?n h&agrave;nh h? th?ng backup: d?m b?o c&ocirc;ng t&aacute;c backup data du?c th?c hi?n d?y d? v&agrave; thu?ng xuy&ecirc;n.<br />\r\n		- T? d?ng h&oacute;a c&aacute;c thao t&aacute;c tri?n khai, v?n h&agrave;nh s?n ph?m.<br />\r\n		- Nghi&ecirc;n c?u c&aacute;c c&ocirc;ng ngh? m?i, d&aacute;nh gi&aacute; hi?u qu? v&agrave; &aacute;p d?ng th?c ti?n v&agrave;o c&aacute;c s?n ph?m c?a c&ocirc;ng ty.</div>\r\n	<h5>\r\n		Y&ecirc;u c?u</h5>\r\n	<div>\r\n		- C&oacute; ki?n th?c v? HDH Linux.<br />\r\n		- C&oacute; kinh nghi?m v? v?n h&agrave;nh website.<br />\r\n		- C&oacute; ki?n th?c v? network.<br />\r\n		- C&oacute; kinh nghi?m v?n h&agrave;nh h? th?ng linux.<br />\r\n		- C&oacute; kinh nghi?m qu?n tr? database: MySQL<br />\r\n		- L&agrave;m vi?c chuy&ecirc;n nghi?p theo d&uacute;ng quy tr&igrave;nh v?n h&agrave;nh h? th?ng.<br />\r\n		- C&oacute; kh? nang tu duy logic v&agrave; l&agrave;m vi?c d?c l?p.<br />\r\n		- C&oacute; kh? nang ph&acirc;n t&iacute;ch v&agrave; thi?t k? h? th?ng.<br />\r\n		- C&oacute; kh? nang nghi&ecirc;n c?u t?t.<br />\r\n		- C&oacute; kh? nang l?p tr&igrave;nh c&aacute;c c&ocirc;ng c? ph?c v? v?n h&agrave;nh &amp; t? d?ng h&oacute;a.<br />\r\n		- C&oacute; kh? nang d?c hi?u t&agrave;i li?u ti?ng anh.</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', null, '3cd88-1512450_835344049841623_4115066391678091088_n.jpg', null, null, null, null, 'post', '1', '\0', null);
INSERT INTO `post` VALUES ('86', '1', '1', '2015-07-01 15:14:51', '2015-07-01 14:04:35', ' System Engineer', null, '<p>\r\n	<a>V?n h&agrave;nh h? th?ng, Tp H? Ch&iacute; Minh </a></p>\r\n', '<div>\r\n	<b>M&atilde; ngh? nghi?p:</b> 15-ZME-0126<br />\r\n	<b>Noi l&agrave;m vi?c:</b> Tp H? Ch&iacute; Minh<br />\r\n	<b>Luong:</b> Th?a thu?n</div>\r\n<h5>\r\n	<span style=\"color:#0000ff;\">M&ocirc; t? c&ocirc;ng vi?c</span></h5>\r\n<div>\r\n	- Ch?u tr&aacute;ch nhi?m v?n h&agrave;nh h? th?ng server c?a Zingme, Zingme mobile c&oacute; traffic cao.<br />\r\n	- H? tr? c&aacute;c Developer trong vi?c tri?n khai s?n ph?m web, mobile, desktop l&ecirc;n m&ocirc;i tru?ng staging, production.<br />\r\n	- Ch?u tr&aacute;ch nhi?m x&acirc;y d?ng v&agrave; v?n h&agrave;nh h? th?ng backup: d?m b?o c&ocirc;ng t&aacute;c backup data du?c th?c hi?n d?y d? v&agrave; thu?ng xuy&ecirc;n.<br />\r\n	- T? d?ng h&oacute;a c&aacute;c thao t&aacute;c tri?n khai, v?n h&agrave;nh s?n ph?m.<br />\r\n	- Nghi&ecirc;n c?u c&aacute;c c&ocirc;ng ngh? m?i, d&aacute;nh gi&aacute; hi?u qu? v&agrave; &aacute;p d?ng th?c ti?n v&agrave;o c&aacute;c s?n ph?m c?a c&ocirc;ng ty.</div>\r\n<h5>\r\n	<span style=\"color:#ff0000;\">Y&ecirc;u c?u</span></h5>\r\n<div>\r\n	- C&oacute; ki?n th?c v? HDH Linux.<br />\r\n	- C&oacute; kinh nghi?m v? v?n h&agrave;nh website.<br />\r\n	- C&oacute; ki?n th?c v? network.<br />\r\n	- C&oacute; kinh nghi?m v?n h&agrave;nh h? th?ng linux.<br />\r\n	- C&oacute; kinh nghi?m qu?n tr? database: MySQL<br />\r\n	- L&agrave;m vi?c chuy&ecirc;n nghi?p theo d&uacute;ng quy tr&igrave;nh v?n h&agrave;nh h? th?ng.<br />\r\n	- C&oacute; kh? nang tu duy logic v&agrave; l&agrave;m vi?c d?c l?p.<br />\r\n	- C&oacute; kh? nang ph&acirc;n t&iacute;ch v&agrave; thi?t k? h? th?ng.<br />\r\n	- C&oacute; kh? nang nghi&ecirc;n c?u t?t.<br />\r\n	- C&oacute; kh? nang l?p tr&igrave;nh c&aacute;c c&ocirc;ng c? ph?c v? v?n h&agrave;nh &amp; t? d?ng h&oacute;a.<br />\r\n	- C&oacute; kh? nang d?c hi?u t&agrave;i li?u ti?ng anh.</div>\r\n', null, '', null, null, null, null, 'post', '1', '', null);
INSERT INTO `post` VALUES ('87', '1', '1', '2015-07-01 14:12:34', '2015-07-01 14:05:15', ' Associate Sales Support Executive', null, '<p>\r\n	<a>H&agrave;nh ch&iacute;nh van ph&ograve;ng, Tp H? Ch&iacute; Minh</a></p>\r\n', '<div>\r\n	<b>M&atilde; ngh? nghi?p:</b> 15-ZME-0126<br />\r\n	<b>Noi l&agrave;m vi?c:</b> Tp H? Ch&iacute; Minh<br />\r\n	<b>Luong:</b> Th?a thu?n</div>\r\n<h5>\r\n	M&ocirc; t? c&ocirc;ng vi?c</h5>\r\n<div>\r\n	- Ch?u tr&aacute;ch nhi?m v?n h&agrave;nh h? th?ng server c?a Zingme, Zingme mobile c&oacute; traffic cao.<br />\r\n	- H? tr? c&aacute;c Developer trong vi?c tri?n khai s?n ph?m web, mobile, desktop l&ecirc;n m&ocirc;i tru?ng staging, production.<br />\r\n	- Ch?u tr&aacute;ch nhi?m x&acirc;y d?ng v&agrave; v?n h&agrave;nh h? th?ng backup: d?m b?o c&ocirc;ng t&aacute;c backup data du?c th?c hi?n d?y d? v&agrave; thu?ng xuy&ecirc;n.<br />\r\n	- T? d?ng h&oacute;a c&aacute;c thao t&aacute;c tri?n khai, v?n h&agrave;nh s?n ph?m.<br />\r\n	- Nghi&ecirc;n c?u c&aacute;c c&ocirc;ng ngh? m?i, d&aacute;nh gi&aacute; hi?u qu? v&agrave; &aacute;p d?ng th?c ti?n v&agrave;o c&aacute;c s?n ph?m c?a c&ocirc;ng ty.</div>\r\n<h5>\r\n	Y&ecirc;u c?u</h5>\r\n<div>\r\n	- C&oacute; ki?n th?c v? HDH Linux.<br />\r\n	- C&oacute; kinh nghi?m v? v?n h&agrave;nh website.<br />\r\n	- C&oacute; ki?n th?c v? network.<br />\r\n	- C&oacute; kinh nghi?m v?n h&agrave;nh h? th?ng linux.<br />\r\n	- C&oacute; kinh nghi?m qu?n tr? database: MySQL<br />\r\n	- L&agrave;m vi?c chuy&ecirc;n nghi?p theo d&uacute;ng quy tr&igrave;nh v?n h&agrave;nh h? th?ng.<br />\r\n	- C&oacute; kh? nang tu duy logic v&agrave; l&agrave;m vi?c d?c l?p.<br />\r\n	- C&oacute; kh? nang ph&acirc;n t&iacute;ch v&agrave; thi?t k? h? th?ng.<br />\r\n	- C&oacute; kh? nang nghi&ecirc;n c?u t?t.<br />\r\n	- C&oacute; kh? nang l?p tr&igrave;nh c&aacute;c c&ocirc;ng c? ph?c v? v?n h&agrave;nh &amp; t? d?ng h&oacute;a.<br />\r\n	- C&oacute; kh? nang d?c hi?u t&agrave;i li?u ti?ng anh.</div>\r\n', null, '', null, null, null, null, 'post', '1', '', null);
INSERT INTO `post` VALUES ('88', '1', '1', '2015-07-01 14:12:50', '2015-07-01 14:05:49', ' General Accountant, Specialist', null, '<p>\r\n	<a>T&agrave;i ch&iacute;nh &amp; K? to&aacute;n, Tp H? Ch&iacute; Minh</a></p>\r\n', '<div>\r\n	<b>M&atilde; ngh? nghi?p:</b> 15-ZME-0126<br />\r\n	<b>Noi l&agrave;m vi?c:</b> Tp H? Ch&iacute; Minh<br />\r\n	<b>Luong:</b> Th?a thu?n</div>\r\n<h5>\r\n	M&ocirc; t? c&ocirc;ng vi?c</h5>\r\n<div>\r\n	- Ch?u tr&aacute;ch nhi?m v?n h&agrave;nh h? th?ng server c?a Zingme, Zingme mobile c&oacute; traffic cao.<br />\r\n	- H? tr? c&aacute;c Developer trong vi?c tri?n khai s?n ph?m web, mobile, desktop l&ecirc;n m&ocirc;i tru?ng staging, production.<br />\r\n	- Ch?u tr&aacute;ch nhi?m x&acirc;y d?ng v&agrave; v?n h&agrave;nh h? th?ng backup: d?m b?o c&ocirc;ng t&aacute;c backup data du?c th?c hi?n d?y d? v&agrave; thu?ng xuy&ecirc;n.<br />\r\n	- T? d?ng h&oacute;a c&aacute;c thao t&aacute;c tri?n khai, v?n h&agrave;nh s?n ph?m.<br />\r\n	- Nghi&ecirc;n c?u c&aacute;c c&ocirc;ng ngh? m?i, d&aacute;nh gi&aacute; hi?u qu? v&agrave; &aacute;p d?ng th?c ti?n v&agrave;o c&aacute;c s?n ph?m c?a c&ocirc;ng ty.</div>\r\n<h5>\r\n	Y&ecirc;u c?u</h5>\r\n<div>\r\n	- C&oacute; ki?n th?c v? HDH Linux.<br />\r\n	- C&oacute; kinh nghi?m v? v?n h&agrave;nh website.<br />\r\n	- C&oacute; ki?n th?c v? network.<br />\r\n	- C&oacute; kinh nghi?m v?n h&agrave;nh h? th?ng linux.<br />\r\n	- C&oacute; kinh nghi?m qu?n tr? database: MySQL<br />\r\n	- L&agrave;m vi?c chuy&ecirc;n nghi?p theo d&uacute;ng quy tr&igrave;nh v?n h&agrave;nh h? th?ng.<br />\r\n	- C&oacute; kh? nang tu duy logic v&agrave; l&agrave;m vi?c d?c l?p.<br />\r\n	- C&oacute; kh? nang ph&acirc;n t&iacute;ch v&agrave; thi?t k? h? th?ng.<br />\r\n	- C&oacute; kh? nang nghi&ecirc;n c?u t?t.<br />\r\n	- C&oacute; kh? nang l?p tr&igrave;nh c&aacute;c c&ocirc;ng c? ph?c v? v?n h&agrave;nh &amp; t? d?ng h&oacute;a.<br />\r\n	- C&oacute; kh? nang d?c hi?u t&agrave;i li?u ti?ng anh.</div>\r\n', null, '', null, null, null, null, 'post', '1', '', null);
INSERT INTO `post` VALUES ('89', '1', '1', null, null, 'XÂY DỰNG CÔNG TRÌNH ĐƯỜNG', 'xay-dung-cong-trinh-cau-duong', 'Với đội ngũ công nhân có tay nghề cao đã qua đào tạo, máy móc thiết bị dụng cụ thi công hiện đại cùng sự hỗ trợ của lực lượng kỹ thuật có trình độ chuyên môn, kinh nghiệm, năng động, nhiệt tình. Công ty Tuấn Lộc đã hoàn thành các công trình thi công xây dựng đường đạt chất lượng và đúng tiến độ đề ra, được các đối tác đánh giá cao', 'Với đội ngũ công nhân có tay nghề cao đã qua đào tạo, máy móc thiết bị dụng cụ thi công hiện đại cùng sự hỗ trợ của lực lượng kỹ thuật có trình độ chuyên môn, kinh nghiệm, năng động, nhiệt tình. Công ty Tuấn Lộc đã hoàn thành các công trình thi công xây dựng đường đạt chất lượng và đúng tiến độ đề ra, được các đối tác đánh giá cao', null, '', null, null, null, null, 'post', '6', '', null);
INSERT INTO `post` VALUES ('90', '1', '1', null, null, 'XÂY DỰNG CÔNG TRÌNH CẦU', 'XÂY DỰNG CÔNG TRÌNH CẦU', 'XÂY DỰNG CÔNG TRÌNH CẦU', 'XÂY DỰNG CÔNG TRÌNH CẦU', null, '', null, null, null, null, 'post', '6', '', null);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `create_uid` int(11) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `pos_order` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `hot` tinyint(255) DEFAULT NULL,
  `active` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_du_an` (`create_uid`),
  KEY `type_id` (`type_id`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `project_type` (`id`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`cat_id`) REFERENCES `project_cat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', 'Khu nhà CT1 Khu đô thị CIPUTA Hà Nội', '<p>\n	Khu Nh&agrave; ? CT1 Khu &ETH;&ocirc; Th? CIPUTA H&agrave; N?i</p>\n', '1', '2015-06-01 19:05:50', '2015-07-03 01:46:22', '1', '1', '3', '29f3e-item1.png', '1', '1');
INSERT INTO `project` VALUES ('5', 'Khu đô thị Phú Mỹ Hưng', '<p>\n	Khu đ&ocirc; thị Ph&uacute; Mỹ Hưng</p>\n', '1', '2015-06-29 07:49:08', '2015-07-03 01:48:16', '1', '1', '3', '03e99-item5.png', '1', '1');
INSERT INTO `project` VALUES ('6', 'Khu đô thị Ven Sông', '<p>\n	C&ocirc;ng ty C? ph?n &ETH;?u tu X&acirc;y d?ng ABC du?c S? K? ho?ch v&agrave; &ETH;?u tu Tp.HCM c?p Gi?y ch?ng nh?n dang k&yacute; doanh nghi?p s? 0303898093, thay d?i l?n th? 8 ng&agrave;y 13 th&aacute;ng 02 nam 2015.</p>\n', '1', '2015-06-29 07:54:06', '2015-07-03 01:49:36', '3', '1', '3', '19781-item3.png', '1', '1');
INSERT INTO `project` VALUES ('7', 'Khu đô thị Tân Bình', '<p>\n	Khu đ&ocirc; thị T&acirc;n B&igrave;nh</p>\n', '1', '2015-07-03 01:50:08', null, null, '1', '1', '1676e-item4.png', '1', '1');

-- ----------------------------
-- Table structure for project_cat
-- ----------------------------
DROP TABLE IF EXISTS `project_cat`;
CREATE TABLE `project_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `active` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_cat
-- ----------------------------
INSERT INTO `project_cat` VALUES ('1', 'Căn hộ', 'CanHo', '1');
INSERT INTO `project_cat` VALUES ('2', 'Văn phòng', 'VanPhong', '1');
INSERT INTO `project_cat` VALUES ('3', 'Nhà Phố', 'NhaPho', '1');
INSERT INTO `project_cat` VALUES ('4', 'Thành Phố', 'ThanhPho', '1');

-- ----------------------------
-- Table structure for project_type
-- ----------------------------
DROP TABLE IF EXISTS `project_type`;
CREATE TABLE `project_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `active` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_type
-- ----------------------------
INSERT INTO `project_type` VALUES ('1', 'Dự án đã hoàn thành', 'DaHoanThanh', '1');
INSERT INTO `project_type` VALUES ('2', 'Dự án đang thực hiện', null, '1');
INSERT INTO `project_type` VALUES ('3', 'Dự án sắp triển khai', null, '1');
INSERT INTO `project_type` VALUES ('4', 'Dự án đang nghĩ', 'DangNghi', '1');

-- ----------------------------
-- Table structure for res_groups
-- ----------------------------
DROP TABLE IF EXISTS `res_groups`;
CREATE TABLE `res_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of res_groups
-- ----------------------------
INSERT INTO `res_groups` VALUES ('1', 'admin', 'Administrator', '');

-- ----------------------------
-- Table structure for res_users
-- ----------------------------
DROP TABLE IF EXISTS `res_users`;
CREATE TABLE `res_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `reset_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`user_type`),
  UNIQUE KEY `username` (`username`),
  KEY `user_to_type` (`user_type`),
  CONSTRAINT `user_type` FOREIGN KEY (`user_type`) REFERENCES `res_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of res_users
-- ----------------------------
INSERT INTO `res_users` VALUES ('1', 'test.IntelliSpeX@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 'admin', '90000000', 'daolehongmai@gmai.com', '1', '', '');
INSERT INTO `res_users` VALUES ('2', 'dale', '81dc9bdb52d04dc20036dbd8313ed055', 'dale', '123456789', 'dale@gmail.com', '1', '', null);
