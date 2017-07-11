-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.17 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.3.0.4999
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 db_blog 的数据库结构
DROP DATABASE IF EXISTS `db_blog`;
CREATE DATABASE IF NOT EXISTS `db_blog` /*!40100 DEFAULT CHARACTER SET gb2312 */;
USE `db_blog`;


-- 导出  表 db_blog.article 结构
DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `username` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `hasread` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `username` (`username`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gb2312 COMMENT='文章表';

-- 正在导出表  db_blog.article 的数据：~5 rows (大约)
DELETE FROM `article`;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` (`Id`, `title`, `content`, `username`, `date`, `hasread`) VALUES
	(1, 'SSH整合方案（一）', '<p>这段时间准备写一下SSH的整合方法<img alt="" src="http://localhost:8080/JavaPrj_4/user/fckeditor/editor/images/smiley/qq/017.jpg" /></p>', 'xiaoxiao', '2009-12-27 10:58:50', 2),
	(2, 'SSH整合方案（二）', '<p>让我们一起感受SSH整合的魅力吧！！！！！</p>', 'xiaoxiao', '2009-12-27 10:59:41', 1),
	(3, '今天好冷啊！', '<p>外面下雪了，今年的冬天来得太早了。<img alt="" src="http://localhost:8080/JavaPrj_4/user/fckeditor/editor/images/smiley/qq/005.gif" /></p>', 'xiaoxiao', '2009-12-27 11:00:22', 1),
	(4, '继续更新我的SSH整合方案！', '', 'xiaoxiao', '2009-12-27 11:08:43', 1),
	(5, '测试日志！！', '<p>测试日志！！<img alt="" src="http://localhost:8080/JavaPrj_4/user/fckeditor/editor/images/smiley/qq/004.gif" /></p>', 'xiaoxiao', '2010-01-27 18:05:06', 1);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;


-- 导出  表 db_blog.bloginfo 结构
DROP TABLE IF EXISTS `bloginfo`;
CREATE TABLE IF NOT EXISTS `bloginfo` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `blogtitle` varchar(50) DEFAULT NULL,
  `idiograph` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `bloginfo_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='个性设置表';

-- 正在导出表  db_blog.bloginfo 的数据：~0 rows (大约)
DELETE FROM `bloginfo`;
/*!40000 ALTER TABLE `bloginfo` DISABLE KEYS */;
INSERT INTO `bloginfo` (`username`, `blogtitle`, `idiograph`) VALUES
	('xiaoxiao', '我是小小', '我喜欢写博客');
/*!40000 ALTER TABLE `bloginfo` ENABLE KEYS */;


-- 导出  表 db_blog.critique 结构
DROP TABLE IF EXISTS `critique`;
CREATE TABLE IF NOT EXISTS `critique` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AId` int(11) DEFAULT NULL,
  `content` text,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AId` (`AId`),
  CONSTRAINT `critique_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `article` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='评论表';

-- 正在导出表  db_blog.critique 的数据：~6 rows (大约)
DELETE FROM `critique`;
/*!40000 ALTER TABLE `critique` DISABLE KEYS */;
INSERT INTO `critique` (`Id`, `AId`, `content`, `username`) VALUES
	(1, 3, '<p>是啊，太冷了，我还好！！！</p>', 'xiaoxiao'),
	(2, 3, '<p>我们公司的暖气坏了，好冷啊！！</p>', 'xiaoxiao'),
	(3, 2, '<p>测试一下！</p>', 'xiaoxiao'),
	(4, 5, '<p>评论！！</p>', 'xiaoxiao'),
	(5, 1, '<p>测试一下！！</p>', 'xiaoxiao'),
	(6, 5, '<p><a href="http://localhost:8080/JavaPrj_4/">http://localhost:8080/JavaPrj_4/</a></p>', '匿名');
/*!40000 ALTER TABLE `critique` ENABLE KEYS */;


-- 导出  表 db_blog.dianjiliang 结构
DROP TABLE IF EXISTS `dianjiliang`;
CREATE TABLE IF NOT EXISTS `dianjiliang` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AId` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AId` (`AId`),
  CONSTRAINT `dianjiliang_ibfk_1` FOREIGN KEY (`AId`) REFERENCES `article` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gb2312 COMMENT='点击量表';

-- 正在导出表  db_blog.dianjiliang 的数据：~6 rows (大约)
DELETE FROM `dianjiliang`;
/*!40000 ALTER TABLE `dianjiliang` DISABLE KEYS */;
INSERT INTO `dianjiliang` (`Id`, `AId`, `ip`, `time`) VALUES
	(1, 1, '0:0:0:0:0:0:0:1', '2009-12-27'),
	(2, 3, '0:0:0:0:0:0:0:1', '2009-12-27'),
	(3, 1, '0:0:0:0:0:0:0:1', '2010-01-27'),
	(4, 2, '0:0:0:0:0:0:0:1', '2010-01-27'),
	(5, 5, '0:0:0:0:0:0:0:1', '2010-01-27'),
	(6, 4, '0:0:0:0:0:0:0:1', '2010-01-27');
/*!40000 ALTER TABLE `dianjiliang` ENABLE KEYS */;


-- 导出  表 db_blog.user 结构
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `question` varchar(50) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 COMMENT='用户表';

-- 正在导出表  db_blog.user 的数据：~0 rows (大约)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`username`, `password`, `nickname`, `question`, `answer`) VALUES
	('xiaoxiao', 'xiaoxiao', '厉风行', '你的家乡', '湖南益阳市');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
