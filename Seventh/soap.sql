CREATE DATABASE IF NOT EXISTS `soap`;
USE `soap`;

CREATE TABLE IF NOT EXISTS `articles` (
  `article_id` bigint(5) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB;

INSERT INTO `articles` (`article_id`, `title`, `category`) VALUES
	(1, 'Java Concurrency', 'Java'),
	(2, 'Spring Boot Getting Started', 'Spring Boot'); 
    
select * from `articles`;