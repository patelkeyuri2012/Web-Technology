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

CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `datetime` varchar(50) NOT NULL,
   PRIMARY KEY (`id`),
   FOREIGN KEY (`userId`) REFERENCES `user`(`userId`)
);

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

