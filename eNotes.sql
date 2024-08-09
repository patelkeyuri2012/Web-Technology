CREATE DATABASE `enotes` ;

USE `enotes`;

CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL UNIQUE,
  `password` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthday`date NOT NULL,
  `contactNo` varchar(10) NOT NULL UNIQUE,
   PRIMARY KEY (`userId`)
);

INSERT INTO `user` (`firstName`, `lastName`, `email`, `password`, `gender`, `birthday`, `contactNo`) VALUES ('Keyuri', 'Patel', 'keyuri@gmail.com', '123456', 'female', '2002-12-20', '8735979376');

SELECT * FROM `user`;

SELECT COUNT(*)  FROM user WHERE `email` = "prey@gmail.com";

SELECT COUNT(*) FROM user WHERE `contactNo` = "8735979376";

UPDATE user SET password = "richi1999" WHERE `email` = "richi@gmail.com";

SELECT * FROM user WHERE `email` = "keyuri@gmail.com" AND password = "123456";

CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `datetime` varchar(50) NOT NULL,
   PRIMARY KEY (`id`),
   FOREIGN KEY (`userId`) REFERENCES `user`(`userId`)
);

INSERT INTO `notes` (`userId`, `title`, `content`, `datetime`) VALUES (1, "Servet", "<b>Java Servlets</b> are the Java programs that run on the <u>Java-enabled web server </u>or application server. They are used to handle the <i>request obtained from the web server</i>", "2023-02-11 04:11:08");

SELECT * FROM `notes` WHERE `userId` = 1;

SELECT * FROM `notes` WHERE `title` LIKE '%k%' OR `content` LIKE '%%';

SELECT * FROM `notes` ORDER BY `title`;

SELECT * FROM `notes` ORDER BY `datetime` ASC;

SELECT * FROM `notes` ORDER BY `datetime` DESC;

DELETE FROM `notes` WHERE `id` = 1;

UPDATE `notes` SET `title` = "JAVA", `content` = "Java is a <i>high-level, class-based, object-oriented programming language</i> that is designed to have as few <b>implementation dependencies as possible.</b>", `datetime` = "2024-02-11 04:11:08" WHERE `id` = 2;

CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(15) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL UNIQUE,
  `password` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birthday`date NOT NULL,
  `contactNo` varchar(10) NOT NULL UNIQUE,
   PRIMARY KEY (`adminId`)
);

INSERT INTO `admin` (`firstName`, `lastName`, `email`, `password`, `gender`, `birthday`, `contactNo`) VALUES ('Keyuri', 'Patel', 'keyuri@gmail.com', '123456', 'female', '2002-12-20', '8735979376');

SELECT * FROM `admin`;
