/*
SQLyog Ultimate v12.14 (64 bit)
MySQL - 5.1.73-community-log : Database - test_app
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test_app` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test_app`;

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `rows_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users_id` int(10) unsigned NOT NULL,
  `desc` text NOT NULL,
  `rating` int(10) unsigned NOT NULL,
  `date_add` int(10) unsigned NOT NULL,
  PRIMARY KEY (`rows_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `reviews` */

insert  into `reviews`(`rows_id`,`users_id`,`desc`,`rating`,`date_add`) values 
(1,1,'Excepteur ad reprehenderit id do. Pariatur sit incididunt exercitation voluptate sunt ut officia cupidatat cupidatat ullamco laborum aliqua labore minim. Exercitation officia duis reprehenderit labore magna eiusmod eiusmod commodo amet laboris do. Eiusmod ea proident quis aute fugiat deserunt dolore dolore pariatur et ex fugiat veniam laboris. Magna do commodo veniam ipsum voluptate enim. Sint dolore proident irure ad occaecat ex in. Officia magna laboris labore elit.',3,1481747621),
(2,1,'Sunt do nostrud non quis nostrud pariatur sit aliqua irure minim. Dolore deserunt elit quis in ipsum. Non excepteur officia dolore non non irure ipsum eu do. Excepteur veniam ipsum voluptate laboris minim labore sunt reprehenderit ullamco consectetur id voluptate irure aute. Aliqua est Lorem minim ullamco. Ut deserunt excepteur aliqua est amet. Deserunt reprehenderit mollit aliqua duis consequat quis ipsum veniam in laboris fugiat adipisicing occaecat ullamco.',4,1481747621),
(3,2,'Consequat velit duis excepteur ut in. Magna eu et fugiat adipisicing et deserunt aliquip irure commodo dolor. Voluptate magna dolor ad nulla dolor dolor cillum ea magna laborum commodo.\\r\\n\",\r\n    \"greeting\": \"Hello, undefined! You have 10 unread messages.',5,1481747621),
(4,2,'Lorem ullamco et dolore do aliqua ullamco aliqua excepteur aliqua. Aliquip ullamco aliquip ullamco labore officia ut sit exercitation. Sit consectetur sit voluptate nostrud officia fugiat. Adipisicing mollit consectetur ipsum sunt ea cupidatat do. Culpa sint laborum sint elit sint veniam.\\r\\n\",\r\n    \"greeting\": \"Hello, undefined! You have 8 unread messages.',5,1481747621),
(5,3,'Ex do reprehenderit culpa quis laboris enim non magna ullamco proident voluptate. Dolore nulla velit exercitation veniam mollit id duis id ut officia exercitation commodo duis. In do tempor et culpa deserunt ea.',3,1481747621);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `addr` text NOT NULL,
  `add_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`phone`,`addr`,`add_date`) values 
(1,'Ginger','Franco','+1 (907) 507-3579','709 Pacific Street, Wiscon, South Carolina, 933',1481745127),
(2,'Wolf ','Ferguson','+1 (883) 510-2681','758 Hillel Place, Sharon, Minnesota, 2620',1481745127),
(3,'Jannie ','Manning','+1 (817) 580-2734','823 Montrose Avenue, Calverton, Oklahoma, 1053',1481745127),
(4,'Shelby ','Ray','+1 (958) 555-3497','415 Madoc Avenue, Rockbridge, North Dakota, 6886',1481745127),
(5,'Burke ','Guerrero','+1 (888) 466-3722','528 Amboy Street, Dunbar, Rhode Island, 6259',1481745127),
(6,'Emmas ','Medina','+1 (853) 449-3845','232 Cook Street, Emison, Florida, 9107',1481745127);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
