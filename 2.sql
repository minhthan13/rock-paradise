DROP DATABASE IF EXISTS rockparadise;
CREATE DATABASE rockparadise CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE rockparadise;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `category` (
  `category_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50)  NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB ;

CREATE TABLE `product` (
  `product_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(50)  NOT NULL,
  `style` varchar(50)  NOT NULL,
  `type` varchar(50)  NOT NULL,
  `brand` int(11) DEFAULT NULL,
  `description` text  DEFAULT NULL,
  `vote_rating` float(11) NOT NULL DEFAULT 0,
  `title` varchar(100)  NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `promotion_id` int(11) NOT NULL,
  `created_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB ;
ALTER TABLE `product`
    ADD CONSTRAINT `fk_product_category_categroy_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`category_id`);

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `default_image` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB;

ALTER TABLE `image`
  ADD CONSTRAINT `fk_image_product_product_id` 
  FOREIGN KEY (`product_id`) 
  REFERENCES `product` (`product_id`);

CREATE TABLE `promotion` (
  `promotion_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `value` float NOT NULL,
  `description` text  NOT NULL,
  `image_link` varchar(50)  NOT NULL,
  `start_time` date NOT NULL DEFAULT current_timestamp(),
  `end_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB;

CREATE TABLE `user` (
  `user_id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `user_name` varchar(50)  NOT NULL,
  `password` varchar(50)  NOT NULL,
  `nick_name` varchar(50)  NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `user_action_log` (
  `log_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` text  NOT NULL
) ENGINE=InnoDB;


-- insert category
INSERT INTO `category` (`category_id`, `name`, `order`) 
VALUES 
(NULL, 'Amethyst', '0'),
(NULL, 'Quartz', '0'),
(NULL, 'Diamond', '0'),
(NULL, 'Emerald', '0'),
(NULL, 'Jade', '0'),
(NULL, 'Ruby', '0'),
(NULL, 'Sapphire', '0'),
(NULL, 'Other', '0');

-- insert product 