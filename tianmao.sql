/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - tianmao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tianmao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tianmao`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`) values (1,'测试分类1'),(2,'测试分类2'),(3,'测试分类3'),(4,'测试分类4'),(5,'测试分类5'),(6,'测试分类6'),(7,'测试分类7'),(8,'测试分类C'),(11,'测试分类B'),(12,'测试分类1'),(13,'测试分类2'),(14,'测试分类3'),(15,'测试分类4'),(16,'测试分类5'),(17,'测试分类6'),(18,'测试分类7'),(19,'测试分类8'),(20,'测试分类9'),(21,'测试分类10'),(24,'测试分类F'),(25,'测试分类S'),(27,'测试分类U');

/*Table structure for table `order_` */

DROP TABLE IF EXISTS `order_`;

CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderCode` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `post` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `userMessage` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `order_` */

insert  into `order_`(`id`,`orderCode`,`address`,`post`,`receiver`,`mobile`,`userMessage`,`createDate`,`payDate`,`deliveryDate`,`confirmDate`,`uid`,`status`) values (1,'201912142311409699','','','','','','2019-12-14 23:11:40','2019-12-14 23:11:43','2019-12-14 23:33:07','2020-06-27 20:32:01',1,'waitReview'),(2,'202006211440287161356','','','','','','2020-06-21 14:40:28','2020-06-21 14:40:33','2020-07-20 21:18:36',NULL,1,'waitConfirm'),(3,'202006272031473797984','','','','','','2020-06-27 20:31:47','2020-06-27 20:31:49',NULL,NULL,1,'delete'),(4,'202007051958435718155','','','','','','2020-07-05 19:58:43','2020-07-05 19:58:45',NULL,NULL,1,'delete'),(5,'202007212004574947213','','','','','','2020-07-21 20:04:57',NULL,NULL,NULL,1,'waitPay');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_user` (`uid`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_order` (`oid`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_orderitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`id`,`pid`,`oid`,`uid`,`number`) values (1,1,1,1,1),(2,1,2,1,1),(3,1,3,1,1),(4,1,4,1,1),(5,1,NULL,1,1),(6,2,5,1,3);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `subTitle` varchar(255) DEFAULT NULL,
  `originalPrice` float DEFAULT NULL,
  `promotePrice` float DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`subTitle`,`originalPrice`,`promotePrice`,`stock`,`cid`,`createDate`) values (1,'水果','垃圾水果',99.98,19.98,99,12,'2019-12-12 22:32:39'),(2,'芒果','海南金煌芒',99.98,19.98,99,27,NULL);

/*Table structure for table `productimage` */

DROP TABLE IF EXISTS `productimage`;

CREATE TABLE `productimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_productimage_product` (`pid`),
  CONSTRAINT `fk_productimage_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `productimage` */

insert  into `productimage`(`id`,`pid`,`type`) values (1,1,'type_single'),(2,1,'type_detail');

/*Table structure for table `property` */

DROP TABLE IF EXISTS `property`;

CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `property` */

insert  into `property`(`id`,`cid`,`name`) values (1,27,'水果');

/*Table structure for table `propertyvalue` */

DROP TABLE IF EXISTS `propertyvalue`;

CREATE TABLE `propertyvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_propertyvalue_property` (`ptid`),
  KEY `fk_propertyvalue_product` (`pid`),
  CONSTRAINT `fk_propertyvalue_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_propertyvalue_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `propertyvalue` */

/*Table structure for table `review` */

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_review_product` (`pid`),
  KEY `fk_review_user` (`uid`),
  CONSTRAINT `fk_review_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `review` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`) values (1,'admin','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
