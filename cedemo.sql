-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projectdb`
--

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `lecturer`
--

CREATE TABLE IF NOT EXISTS `lecturer` (
  `lct_id` int(11) NOT NULL AUTO_INCREMENT,
  `lct_fname` varchar(45) DEFAULT NULL,
  `lct_lname` varchar(45) DEFAULT NULL,
  `lct_ttl_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`lct_id`),
  KEY `f_lct_ttl_id` (`lct_ttl_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- dump ตาราง `lecturer`
--

INSERT INTO `lecturer` (`lct_id`, `lct_fname`, `lct_lname`, `lct_ttl_id`) VALUES
(1, 'นิทัศน์', 'นิลฉวี', 7),
(2, 'สาธิต', 'สุวรรณเวช', 7),
(3, 'ทิพย์วรรณ', 'ฟูเฟื่อง', 4),
(4, 'วรวิทย์', 'ชีวาพร', 5),
(5, 'เดชาวุฒิ', 'วานิชสรรพ์', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `lecturer_detail`
--
CREATE TABLE IF NOT EXISTS `lecturer_detail` (
`lct_id` int(11)
,`ttl_name` varchar(45)
,`lct_fname` varchar(45)
,`lct_lname` varchar(45)
);
-- --------------------------------------------------------

--
-- โครงสร้างตาราง `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `prg_id` int(11) NOT NULL AUTO_INCREMENT,
  `prg_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`prg_id`),
  UNIQUE KEY `prg_name_UNIQUE` (`prg_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- dump ตาราง `program`
--

INSERT INTO `program` (`prg_id`, `prg_name`) VALUES
(5, 'คอมพิวเตอร์ศึกษา'),
(4, 'ภูมิสารสนเทศ'),
(1, 'วิทยาการคอมพิวเตอร์'),
(2, 'เทคโนโลยีสารสนเทศ'),
(3, 'เทคโนโลยีเครือข่ายคอมพิวเตอร์');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `prj_id` int(11) NOT NULL AUTO_INCREMENT,
  `prj_name_th` varchar(200) DEFAULT NULL,
  `prj_name_en` varchar(200) DEFAULT NULL,
  `prj_stt_id` int(11) DEFAULT NULL,
  `prj_ppt_id` int(11) DEFAULT NULL,
  `prj_lct_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`prj_id`),
  KEY `f_prj_stt_id` (`prj_stt_id`),
  KEY `f_prj_ppt_id` (`prj_ppt_id`),
  KEY `f_prj_lct_id` (`prj_lct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS `project_progress` (
  `pjg_id` int(11) NOT NULL AUTO_INCREMENT,
  `pjg_prj_id` int(11) DEFAULT NULL,
  `pjg_pst_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pjg_id`),
  KEY `f_pjg_prj_id` (`pjg_prj_id`),
  KEY `f_pjg_pst_id` (`pjg_pst_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `project_lecturer`
--

CREATE TABLE IF NOT EXISTS `project_lecturer` (
  `pjl_prj_id` int(11) NOT NULL,
  `pjl_lct_id` int(11) NOT NULL,
  `pjl_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pjl_id`),
  KEY `f_pjl_prj_id` (`pjl_prj_id`),
  KEY `f_pjl_lct_id` (`pjl_lct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `project_student`
--

CREATE TABLE IF NOT EXISTS `project_student` (
  `pjs_prj_id` int(11) NOT NULL,
  `pjs_std_id` int(11) NOT NULL,
  `pjs_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pjs_id`),
  KEY `f_pjs_prj_id` (`pjs_prj_id`),
  KEY `f_pjs_std_id` (`pjs_std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `project_tools`
--

CREATE TABLE IF NOT EXISTS `project_tools` (
  `pjt_prj_id` int(11) NOT NULL,
  `pjt_tls_id` int(11) NOT NULL,
  `pjt_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pjt_id`),
  KEY `f_pjt_prj_id` (`pjt_prj_id`),
  KEY `f_pjt_tls_id` (`pjt_tls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `project_type`
--

CREATE TABLE IF NOT EXISTS `project_type` (
  `ptt_id` int(11) NOT NULL AUTO_INCREMENT,
  `ptt_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ptt_id`),
  UNIQUE KEY `ptt_name_UNIQUE` (`ptt_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- dump ตาราง `project_type`
--

INSERT INTO `project_type` (`ptt_id`, `ptt_name`) VALUES
(1, 'ระบบสารสนเทศออนไลน์'),
(2, 'ระบบสารสนเทศออฟไลน์'),
(4, 'ระบบฮาร์ดแวร์'),
(3, 'ระบบเกมส์'),
(5, 'สื่อมัลติมีเดียสำหรับการศึกษา');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `status`
--

CREATE TABLE IF NOT EXISTS `project_status` (
  `pst_id` int(11) NOT NULL AUTO_INCREMENT,
  `pst_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pst_id`),
  UNIQUE KEY `pst_name_UNIQUE` (`pst_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- dump ตาราง `status`
--

INSERT INTO `project_status` (`pst_id`, `pst_name`) VALUES
(2, 'ผ่านการพิจารณา'),
(4, 'ผ่านการสอบหัวข้อ'),
(6, 'ผ่านการสอบโครงงาน'),
(8, 'ยังไม่ได้ส่งหัวข้อ'),
(9, 'ยังไม่ได้ส่งโครงงาน'),
(1, 'รอพิจารณาหัวข้อ'),
(3, 'ไม่ผ่านการพิจารณา'),
(5, 'ไม่ผ่านการสอบหัวข้อ'),
(7, 'ไม่ผ่านการสอบโครงงาน');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `std_id` int(10) NOT NULL,
  `std_sid` varchar(10) NOT NULL,
  `std_fname` varchar(50) NOT NULL,
  `std_lname` varchar(50) NOT NULL,
  `std_ttl_id` int(11) DEFAULT NULL,
  `std_prg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`std_id`),
  KEY `f_std_ttl_id` (`std_ttl_id`),
  KEY `f_std_prg_id` (`std_prg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `title`
--

CREATE TABLE IF NOT EXISTS `title` (
  `ttl_id` int(11) NOT NULL AUTO_INCREMENT,
  `ttl_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ttl_id`),
  UNIQUE KEY `ttl_name_UNIQUE` (`ttl_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- dump ตาราง `title`
--

INSERT INTO `title` (`ttl_id`, `ttl_name`) VALUES
(8, 'Mr.'),
(2, 'นาง'),
(3, 'นางสาว'),
(1, 'นาย'),
(4, 'ผู้ช่วยศาสตราจารย์'),
(5, 'รองศาสตราจารย์'),
(6, 'ศาสตราจารย์'),
(7, 'อาจารย์');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `tools`
--

CREATE TABLE IF NOT EXISTS `tools` (
  `tls_id` int(11) NOT NULL AUTO_INCREMENT,
  `tls_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tls_id`),
  UNIQUE KEY `tls_name_UNIQUE` (`tls_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- dump ตาราง `tools`
--

INSERT INTO `tools` (`tls_id`, `tls_name`) VALUES
(11, 'C++'),
(14, 'CSS 2.0'),
(15, 'CSS 3.0'),
(12, 'HTML 4.0'),
(16, 'HTML 5'),
(5, 'Java'),
(9, 'MS SQL'),
(8, 'MySQL'),
(10, 'Oracle'),
(1, 'PHP'),
(6, 'Python'),
(7, 'Ruby'),
(4, 'VB.Net'),
(2, 'VC#.Net'),
(3, 'VC++.Net'),
(13, 'XTHML 1.0');

-- --------------------------------------------------------

--
-- โครงสร้างตาราง `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usr_email` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usr_pwd` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `usr_register_date` timestamp NULL DEFAULT NULL,
  `usr_right` int(11) DEFAULT NULL,
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `usr_name_UNIQUE` (`usr_name`),
  UNIQUE KEY `usr_email_UNIQUE` (`usr_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure for view `lecturer_detail`
--
DROP TABLE IF EXISTS `lecturer_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lecturer_detail` AS select `lecturer`.`lct_id` AS `lct_id`,`title`.`ttl_name` AS `ttl_name`,`lecturer`.`lct_fname` AS `lct_fname`,`lecturer`.`lct_lname` AS `lct_lname` from (`lecturer` join `title` on((`lecturer`.`lct_ttl_id` = `title`.`ttl_id`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD CONSTRAINT `f_lct_ttl_id` FOREIGN KEY (`lct_ttl_id`) REFERENCES `title` (`ttl_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `f_prj_lct_id` FOREIGN KEY (`prj_lct_id`) REFERENCES `lecturer` (`lct_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `f_prj_ppt_id` FOREIGN KEY (`prj_ppt_id`) REFERENCES `project_type` (`ptt_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `f_prj_pst_id` FOREIGN KEY (`prj_pst_id`) REFERENCES `project_status` (`pst_id`) ON UPDATE CASCADE;

--
-- Constraints for table `project_lecturer`
--
ALTER TABLE `project_lecturer`
  ADD CONSTRAINT `f_pjl_lct_id` FOREIGN KEY (`pjl_lct_id`) REFERENCES `lecturer` (`lct_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `f_pjl_prj_id` FOREIGN KEY (`pjl_prj_id`) REFERENCES `project` (`prj_id`) ON UPDATE CASCADE;

--
-- Constraints for table `project_student`
--
ALTER TABLE `project_student`
  ADD CONSTRAINT `f_pjs_prj_id` FOREIGN KEY (`pjs_prj_id`) REFERENCES `project` (`prj_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `j_pjs_std_id` FOREIGN KEY (`pjs_std_id`) REFERENCES `student` (`std_id`) ON UPDATE CASCADE;

--
-- Constraints for table `project_tools`
--
ALTER TABLE `project_tools`
  ADD CONSTRAINT `f_pjt_prj_id` FOREIGN KEY (`pjt_prj_id`) REFERENCES `project` (`prj_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `f_pjt_tls_id` FOREIGN KEY (`pjt_tls_id`) REFERENCES `tools` (`tls_id`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `f_std_prg_id` FOREIGN KEY (`std_prg_id`) REFERENCES `program` (`prg_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `f_std_ttl_id` FOREIGN KEY (`std_ttl_id`) REFERENCES `title` (`ttl_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
