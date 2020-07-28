/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.27 : Database - swft
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`swft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `swft`;

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL COMMENT 'id序号',
  `dept_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门名称',
  `dept_manager` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门主管',
  `parent_dept_id` int(11) DEFAULT NULL COMMENT '父级部门',
  `dept_emp_num` int(11) DEFAULT NULL COMMENT '部门人数',
  `dept_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `department` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `option_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作类型',
  `option_target` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作内容',
  `option_user` int(20) DEFAULT NULL COMMENT '操作用户',
  `option_username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人名称',
  `option_ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作人ip',
  `option_remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `log` */

insert  into `log`(`id`,`option_type`,`option_target`,`option_user`,`option_username`,`option_ip`,`option_remark`,`create_time`) values (1,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:51:34'),(2,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:51:34'),(3,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:53:04'),(4,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:54:58'),(5,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:55:50'),(6,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:55:54'),(7,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:56:03'),(8,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 13:58:28'),(9,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 13:59:31'),(10,'登录','用户登录',1,'江二少','127.0.0.1','第null次登录','2020-07-28 14:19:30'),(11,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:19:30'),(12,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:23:19'),(13,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:29:57'),(14,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:32:28'),(15,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:33:20'),(16,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:34:00'),(17,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:37:04'),(18,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:55:02'),(19,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:58:23'),(20,'查询','用户模块',1,'江二少','127.0.0.1','获取用户信息','2020-07-28 14:58:37');

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(20) DEFAULT NULL COMMENT '父权限',
  `perm_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限名称',
  `perm_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '权限描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `permission` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int(20) DEFAULT NULL COMMENT '父角色id',
  `role_zh_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色名称',
  `role_en_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '代码代号',
  `role_desc` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '角色描述',
  `role_enable` tinyint(4) DEFAULT NULL COMMENT '角色是否启用',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `role` */

insert  into `role`(`id`,`parent_id`,`role_zh_name`,`role_en_name`,`role_desc`,`role_enable`,`update_time`,`create_time`) values (1,NULL,'超级管理员','admin','系统管理员',1,NULL,NULL),(2,NULL,'总经理','manager','总经理',0,NULL,NULL);

/*Table structure for table `role_perm` */

DROP TABLE IF EXISTS `role_perm`;

CREATE TABLE `role_perm` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(20) NOT NULL COMMENT '角色id',
  `perm_id` int(20) NOT NULL COMMENT '权限id',
  `perm_type` int(20) NOT NULL COMMENT '权限类型（0:可访问，1:可授权）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `role_perm` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `number` varchar(100) COLLATE utf8mb4_bin NOT NULL COMMENT '编号',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像地址',
  `username` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
  `dept_id` int(20) DEFAULT NULL COMMENT '所属部门',
  `real_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '昵称',
  `gender` smallint(1) unsigned DEFAULT '0' COMMENT '性别：1：男  2：女',
  `age` smallint(10) unsigned DEFAULT NULL COMMENT '年龄',
  `address` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '地址',
  `login_ip` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录ip',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `is_account_non_expired` tinyint(1) DEFAULT '1' COMMENT '账号是否过期',
  `is_account_non_locked` tinyint(1) DEFAULT '1' COMMENT '账号是否被锁定',
  `is_enabled` tinyint(1) DEFAULT '0' COMMENT '账号是否可用',
  `is_credentials_non_expired` tinyint(1) DEFAULT '1' COMMENT '凭证是否过期',
  `login_count` int(20) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`,`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `user` */

insert  into `user`(`id`,`number`,`avatar`,`username`,`password`,`dept_id`,`real_name`,`gender`,`age`,`address`,`login_ip`,`create_time`,`update_time`,`is_account_non_expired`,`is_account_non_locked`,`is_enabled`,`is_credentials_non_expired`,`login_count`) values (1,'hKGGlOEFYh4Rrey36fksySwRrNJIJI0I7UG6ezXk344','https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg','admin','123456',NULL,'江二少',1,23,'重庆丰都','127.0.0.1','2020-03-15 16:30:50','2020-03-15 16:30:48',1,1,1,1,NULL);

/*Table structure for table `user_perm` */

DROP TABLE IF EXISTS `user_perm`;

CREATE TABLE `user_perm` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(20) unsigned NOT NULL,
  `perm_id` int(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `user_perm` */

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(20) unsigned NOT NULL COMMENT '用户',
  `role_id` int(20) unsigned NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `user_role` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
