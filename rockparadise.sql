-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2023 at 10:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rockparadise`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `vote_product_gen_data` ()   BEGIN
  DECLARE v_max_count INT DEFAULT 10;
  DECLARE v_min_count INT DEFAULT 1;
  DECLARE v_count INT DEFAULT 1;
  DECLARE v_min_vote INT DEFAULT 2;
  DECLARE v_max_vote INT DEFAULT 5;
  DECLARE v_vote INT DEFAULT 1;
  DECLARE v_product_id INT DEFAULT 0;
  DECLARE v_next_product_id INT DEFAULT 1;
  DECLARE v_random_email INT DEFAULT 1;
  DECLARE v_email VARCHAR(30);
  DECLARE v_comment TEXT DEFAULT '';
  TRUNCATE TABLE vote_product;
  UPDATE product SET vote_quantity = 0, total_vote = 0 WHERE product_id > 0;
 
  WHILE v_next_product_id > v_product_id 
	DO
  	  SET v_product_id = v_next_product_id;
      
      SELECT  product_id INTO v_next_product_id
      FROM product 
      WHERE product_id > v_product_id
      ORDER BY product_id 
      LIMIT 1;
      
	 SET v_count = FLOOR(RAND()*(v_max_count - v_min_count + 1)) + v_min_count;
     WHILE v_count > 0
     DO
		SET v_count = v_count -1;
		SET v_email = concat('email',convert(v_random_email, char),'@gmail.com');
		SET v_random_email = v_random_email + 1;
        SET v_vote = FLOOR(RAND()*(v_max_vote - v_min_vote + 1)) + v_min_vote;
        SET v_comment = CASE 
        WHEN v_vote <= 2 THEN 'Bad product' 
        WHEN v_vote >= 4 THEN 'Good product'
        ELSE 'Normal product'
        END;
        INSERT INTO vote_product (email,product_id,vote_rating, comments)
        VALUES (v_email, v_product_id, v_vote, v_comment);
        UPDATE product 
        SET vote_quantity = vote_quantity + 1,
        total_vote = total_vote + v_vote
        WHERE product_id = v_product_id;
     END WHILE;
	
  END WHILE;
  
  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `order`) VALUES
(1, 'Amethyst', 0),
(2, 'Quartz', 0),
(3, 'Diamond', 0),
(4, 'Emerald', 0),
(5, 'Jade', 0),
(6, 'Ruby', 0),
(7, 'Sapphire', 0),
(8, 'Other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `default_image` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `product_id`, `default_image`) VALUES
(1, 1, b'1'),
(2, 1, b'0'),
(3, 1, b'0'),
(4, 1, b'0'),
(5, 2, b'1'),
(6, 2, b'0'),
(7, 2, b'0'),
(8, 2, b'0'),
(9, 3, b'1'),
(10, 3, b'0'),
(11, 3, b'0'),
(12, 3, b'0'),
(13, 3, b'0'),
(14, 4, b'1'),
(15, 4, b'0'),
(16, 4, b'0'),
(17, 4, b'0'),
(18, 4, b'0'),
(19, 5, b'1'),
(20, 5, b'0'),
(21, 5, b'0'),
(22, 5, b'0'),
(23, 6, b'1'),
(24, 6, b'0'),
(25, 6, b'0'),
(26, 7, b'1'),
(27, 7, b'0'),
(28, 7, b'0'),
(29, 7, b'0'),
(30, 7, b'0'),
(31, 7, b'0'),
(32, 8, b'1'),
(33, 8, b'0'),
(34, 8, b'0'),
(35, 8, b'0'),
(36, 9, b'1'),
(37, 9, b'0'),
(38, 9, b'0'),
(39, 9, b'0'),
(40, 9, b'0'),
(41, 9, b'0'),
(42, 10, b'1'),
(43, 10, b'0'),
(44, 10, b'0'),
(45, 10, b'0'),
(46, 10, b'0'),
(47, 21, b'1'),
(48, 21, b'0'),
(49, 21, b'0'),
(50, 21, b'0'),
(51, 22, b'1'),
(52, 22, b'0'),
(53, 22, b'0'),
(54, 22, b'0'),
(55, 23, b'1'),
(56, 23, b'0'),
(57, 23, b'0'),
(58, 23, b'0'),
(59, 24, b'1'),
(60, 24, b'0'),
(61, 24, b'0'),
(62, 24, b'0'),
(63, 25, b'1'),
(64, 25, b'0'),
(65, 25, b'0'),
(66, 25, b'0'),
(67, 26, b'1'),
(68, 26, b'0'),
(69, 26, b'0'),
(70, 26, b'0'),
(71, 26, b'0'),
(72, 27, b'1'),
(73, 27, b'0'),
(74, 27, b'0'),
(75, 27, b'0'),
(76, 27, b'0'),
(77, 28, b'1'),
(78, 28, b'0'),
(79, 28, b'0'),
(80, 28, b'0'),
(81, 28, b'0'),
(82, 29, b'1'),
(83, 29, b'0'),
(84, 29, b'0'),
(85, 29, b'0'),
(86, 29, b'0'),
(87, 30, b'1'),
(88, 30, b'0'),
(89, 30, b'0'),
(90, 30, b'0'),
(91, 11, b'1'),
(92, 11, b'0'),
(93, 11, b'0'),
(94, 11, b'0'),
(95, 11, b'0'),
(96, 12, b'1'),
(97, 12, b'0'),
(98, 12, b'0'),
(99, 12, b'0'),
(100, 13, b'1'),
(101, 13, b'0'),
(102, 13, b'0'),
(103, 13, b'0'),
(104, 14, b'1'),
(105, 14, b'0'),
(106, 14, b'0'),
(107, 14, b'0'),
(108, 15, b'1'),
(109, 15, b'0'),
(110, 15, b'0'),
(111, 15, b'0'),
(112, 15, b'0'),
(113, 16, b'1'),
(114, 16, b'0'),
(115, 16, b'0'),
(116, 16, b'0'),
(117, 16, b'0'),
(118, 17, b'1'),
(119, 17, b'0'),
(120, 17, b'0'),
(121, 17, b'0'),
(122, 18, b'1'),
(123, 18, b'0'),
(124, 18, b'0'),
(125, 18, b'0'),
(126, 18, b'0'),
(127, 19, b'1'),
(128, 19, b'0'),
(129, 19, b'0'),
(130, 19, b'0'),
(131, 19, b'0'),
(132, 20, b'1'),
(133, 20, b'0'),
(134, 20, b'0'),
(135, 20, b'0'),
(136, 20, b'0'),
(137, 31, b'1'),
(138, 31, b'0'),
(139, 31, b'0'),
(140, 31, b'0'),
(141, 32, b'1'),
(142, 32, b'0'),
(143, 33, b'1'),
(144, 33, b'0'),
(145, 33, b'0'),
(146, 33, b'0'),
(147, 33, b'0'),
(148, 34, b'1'),
(149, 34, b'0'),
(150, 34, b'0'),
(151, 34, b'0'),
(152, 34, b'0'),
(153, 35, b'1'),
(154, 35, b'0'),
(155, 35, b'0'),
(156, 35, b'0'),
(157, 35, b'0'),
(158, 36, b'1'),
(159, 36, b'0'),
(160, 36, b'0'),
(161, 37, b'1'),
(162, 37, b'0'),
(163, 37, b'0'),
(164, 37, b'0'),
(165, 37, b'0'),
(166, 38, b'1'),
(167, 38, b'0'),
(168, 38, b'0'),
(169, 39, b'1'),
(170, 39, b'0'),
(171, 39, b'0'),
(172, 39, b'0'),
(173, 39, b'0'),
(174, 40, b'1'),
(175, 40, b'0'),
(176, 40, b'0'),
(177, 40, b'0'),
(178, 41, b'1'),
(179, 41, b'0'),
(180, 41, b'0'),
(181, 41, b'0'),
(182, 42, b'1'),
(183, 42, b'0'),
(184, 42, b'0'),
(185, 42, b'0'),
(186, 42, b'0'),
(187, 43, b'1'),
(188, 43, b'0'),
(189, 43, b'0'),
(190, 43, b'0'),
(191, 43, b'0'),
(192, 44, b'1'),
(193, 44, b'0'),
(194, 44, b'0'),
(195, 44, b'0'),
(196, 44, b'0'),
(197, 45, b'1'),
(198, 45, b'0'),
(199, 45, b'0'),
(200, 45, b'0'),
(201, 45, b'0'),
(202, 46, b'1'),
(203, 46, b'0'),
(204, 46, b'0'),
(205, 46, b'0'),
(206, 46, b'0'),
(207, 47, b'1'),
(208, 47, b'0'),
(209, 47, b'0'),
(210, 47, b'0'),
(211, 48, b'1'),
(212, 48, b'0'),
(213, 48, b'0'),
(214, 48, b'0'),
(215, 49, b'1'),
(216, 49, b'0'),
(217, 49, b'0'),
(218, 49, b'0'),
(219, 49, b'0'),
(220, 50, b'1'),
(221, 50, b'0'),
(222, 50, b'0'),
(223, 50, b'0'),
(224, 50, b'0'),
(225, 51, b'1'),
(226, 51, b'0'),
(227, 51, b'0'),
(228, 51, b'0'),
(229, 52, b'1'),
(230, 52, b'0'),
(231, 52, b'0'),
(232, 53, b'1'),
(233, 53, b'0'),
(234, 53, b'0'),
(235, 54, b'1'),
(236, 54, b'0'),
(237, 54, b'0'),
(238, 54, b'0'),
(239, 54, b'0'),
(240, 55, b'1'),
(241, 55, b'0'),
(242, 55, b'0'),
(243, 55, b'0'),
(244, 56, b'1'),
(245, 56, b'0'),
(246, 56, b'0'),
(247, 57, b'1'),
(248, 57, b'0'),
(249, 57, b'0'),
(250, 57, b'0'),
(251, 57, b'0'),
(252, 58, b'1'),
(253, 58, b'0'),
(254, 58, b'0'),
(255, 58, b'0'),
(256, 58, b'0'),
(257, 59, b'1'),
(258, 59, b'0'),
(259, 59, b'0'),
(260, 59, b'0'),
(261, 59, b'0'),
(262, 60, b'1'),
(263, 60, b'0'),
(264, 60, b'0'),
(265, 60, b'0'),
(266, 60, b'0'),
(267, 61, b'1'),
(268, 61, b'0'),
(269, 61, b'0'),
(270, 61, b'0'),
(271, 61, b'0'),
(272, 62, b'1'),
(273, 62, b'0'),
(274, 62, b'0'),
(275, 62, b'0'),
(276, 62, b'0'),
(277, 63, b'1'),
(278, 63, b'0'),
(279, 63, b'0'),
(280, 63, b'0'),
(281, 63, b'0'),
(282, 64, b'1'),
(283, 64, b'0'),
(284, 64, b'0'),
(285, 64, b'0'),
(286, 64, b'0'),
(287, 65, b'1'),
(288, 65, b'0'),
(289, 65, b'0'),
(290, 65, b'0'),
(291, 66, b'1'),
(292, 66, b'0'),
(293, 66, b'0'),
(294, 66, b'0'),
(295, 66, b'0'),
(296, 67, b'1'),
(297, 67, b'0'),
(298, 67, b'0'),
(299, 67, b'0'),
(300, 68, b'1'),
(301, 68, b'0'),
(302, 68, b'0'),
(303, 69, b'1'),
(304, 69, b'0'),
(305, 69, b'0'),
(306, 69, b'0'),
(307, 69, b'0'),
(308, 70, b'1'),
(309, 70, b'0'),
(310, 70, b'0'),
(311, 70, b'0'),
(312, 71, b'1'),
(313, 71, b'0'),
(314, 71, b'0'),
(315, 72, b'1'),
(316, 72, b'0'),
(317, 73, b'1'),
(318, 73, b'0'),
(319, 73, b'0'),
(320, 73, b'0'),
(321, 73, b'0'),
(322, 74, b'1'),
(323, 74, b'0'),
(324, 74, b'0'),
(325, 74, b'0'),
(326, 75, b'1'),
(327, 75, b'0'),
(328, 75, b'0'),
(329, 75, b'0'),
(330, 75, b'0'),
(331, 76, b'1'),
(332, 76, b'0'),
(333, 76, b'0'),
(334, 76, b'0'),
(335, 76, b'0'),
(336, 77, b'1'),
(337, 77, b'0'),
(338, 77, b'0'),
(339, 78, b'1'),
(340, 78, b'0'),
(341, 78, b'0'),
(342, 78, b'0'),
(343, 78, b'0'),
(344, 79, b'1'),
(345, 79, b'0'),
(346, 79, b'0'),
(347, 79, b'0'),
(348, 80, b'1'),
(349, 80, b'0'),
(350, 80, b'0'),
(351, 80, b'0'),
(352, 80, b'0'),
(353, 81, b'1'),
(354, 81, b'0'),
(355, 81, b'0'),
(356, 81, b'0'),
(357, 81, b'0'),
(363, 83, b'1'),
(364, 83, b'0'),
(365, 83, b'0'),
(366, 83, b'0'),
(367, 83, b'0'),
(368, 84, b'1'),
(369, 84, b'0'),
(370, 84, b'0'),
(371, 84, b'0'),
(372, 84, b'0'),
(373, 85, b'1'),
(374, 85, b'0'),
(375, 85, b'0'),
(376, 85, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `style` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `vote_quantity` int(11) NOT NULL DEFAULT 0,
  `total_vote` float NOT NULL DEFAULT 0,
  `color` varchar(20) NOT NULL DEFAULT 'none',
  `size` varchar(10) NOT NULL,
  `is_top` bit(1) DEFAULT b'0',
  `created_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `name`, `brand`, `title`, `price`, `style`, `type`, `description`, `promotion_id`, `vote_quantity`, `total_vote`, `color`, `size`, `is_top`, `created_time`) VALUES
(1, 1, 'A101', NULL, 'RAW AMETHYST POINTS BY THE POUND', 8, 'raw', 'stone', 'Beautiful extra quality points from Uruguay.You will receive a wonderful assortment of points, there are approximately 20 in 1/4 lb give or take as it is by weight.These are really nice points that can be used for wire wrapping, chakra cleansing, reiki, crystal grids, meditation, home decor, crafting and so much more.', NULL, 15, 58, 'purple', 'small', b'0', '2023-03-15'),
(2, 1, 'A102', NULL, 'AMETHYST WORRY STONE SLAB - THUMB STONE - PALM STONE', 4, 'raw', 'stone', 'Worry stones, also know as palm stones or thumb stones are smooth polished gemstones.They have a thumb-sized indentation so you can carry it in your pocket and rub it for relaxation and stress relief.People use them by holding the stone between the index finger and thumb and rubbing one thumb back and forth across the stone.', NULL, 6, 17, 'purple', 'small', b'0', '2023-03-15'),
(3, 1, 'A103', NULL, 'NATURAL AMETHYST TUMBLED STONES, AMETHYST WORRY STONE FOR CRYSTAL HEALING', 4, 'ellipse', 'stone', 'Specimens are natural materials and stones may feature natural internal fractures, dips or inclusions consistent with the growth pattern of the stone.Amount, location, and color of banding varies from stone to stone.', NULL, 1, 2, 'purple', 'small', b'0', '2023-03-15'),
(4, 1, 'A104', NULL, 'DEEP PURPLE AMETHYST CRYSTAL, CRYSTALS, CRYSTAL COLLECTION, URUGUAY', 177, 'raw', 'stone', 'Amethyst comes from the word meaning “not drunken”, the Ancient Greek myth of Bacchus and Diana.Amethyst is also the birthstone for the month of February.', NULL, 5, 20, 'purple', 'big', b'0', '2023-03-15'),
(5, 1, 'A105', NULL, 'LARGE AMETHYST CRYSTAL CLUSTER: CHOOSE SIZE! \"A\" GRADE CHOOSE SIZE!', 7, 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine.Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, 4, 14, 'purple', 'middle', b'1', '2023-03-15'),
(6, 1, 'A106', NULL, 'AAA GRADE NATURAL AMETHYST RAW MATERIAL AMETHYST FINE', 20, 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine. Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, 9, 32, 'purple', 'small', b'0', '2023-03-15'),
(7, 1, 'A107', NULL, '1LB AMETHYST TUMBLED STONE, TUMBLED AMETHYST CRYSTAL, BULK', 58, 'ellipse', 'stone', '1/2lb or 1lb light purple amethyst tumbled stone, some with rainbows.You will receive stones similar to the photos. Colors may vary depending on lighting and monitor.', NULL, 10, 30, 'purple', 'middle', b'0', '2023-03-15'),
(8, 1, 'A108', NULL, 'NATURAL AMETHYST LOOSE STONE ROUND CUT PURPLE CRYSTAL GEMSTONE', 13, 'crystal', 'stone', 'All our gemstones are genuine natural which mined supply directly from gobal mining area.Every gemstone is carefully selected,to keep the precious gemstone in high quality and in vibrant and superior color.', NULL, 1, 4, 'purple', 'small', b'0', '2023-03-15'),
(9, 1, 'A109', NULL, 'PURPLE AMETHYST RING, SILVER TUNGSTEN RING, WOMENS RING, MENS RING', 85, '', 'ring', 'Tungsten rings are popular because of their toughness and durability.Tungsten is scratch resistant and tarnish resistant which makes it a great choice for our customers who value longevity as well as low.', NULL, 9, 32, 'purple', 'small', b'0', '2023-03-15'),
(10, 1, 'A110', NULL, 'ROMANTICE LOVER GIFT NATURAL AMETHYST HEART SHAPE GEMSTONE', 503, '', 'Necklace', '100% Brand New! Excellent Quality and Workmanship.Naturally-Vibrant, Superior Quality Color Gemstone.Diamonds:Natural Diamonds Carat Weight:0.034t Cut:Round Clarity:SI Color:G-H.Metal Type:Solid 14K Yellow Gold Weight:2.1g', NULL, 1, 3, 'purple', 'small', b'1', '2023-03-15'),
(11, 2, 'Q101', NULL, 'CRYSTAL TOWER,LARGE CRYSTAL TOWER,NATURAL CRYSTAL,QUARTZ POINT', 816, 'raw', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, 4, 17, 'white', 'big', b'0', '2023-03-15'),
(12, 2, 'Q102', NULL, 'CRYSTAL CLUSTER，300-500G+ CLEAR QUARTZ CLUSTER CRYSTAL，QUARTZ POINT VUG', 26, 'crystal', 'stone', 'This product is not natural crystal, but belongs to laboratory crystal. If you mind, please do not buy it, thank you.', NULL, 3, 14, 'white', 'big', b'1', '2023-03-15'),
(13, 2, 'Q103', NULL, 'COVELLITE PINK FIRE QUARTZ CRYSTAL - TEARDROP - GEMSTONES, JEWELRY MAKING', 921, 'ellipse', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured. Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, 7, 23, 'pink', 'small', b'0', '2023-03-15'),
(14, 2, 'Q104', NULL, 'RAW HEMATITE PHANTOM QUARTZ POINT - EMF PROTECTOR', 20, 'hex', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured.Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, 4, 15, 'white', 'middle', b'0', '2023-03-15'),
(15, 2, 'Q105', NULL, 'NATURAL ANGEL AURA QUARTZ PENDANT, 925 STERLING SILVER PENDANT', 63, 'ellipse', 'Gemstone', '925 Sterling Silver Natural Angel Aura Quartz Gemstone Silver Pendant Handmade Fine Silver Jewelry', NULL, 1, 5, 'blue', 'small', b'0', '2023-03-15'),
(16, 2, 'Q106', NULL, 'BLUE GHOST PHANTOM QUARTZ CRYSTAL CLUSTER,QUARTZ CRYSTAL VUG', 40, 'crystal', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, 5, 18, 'white', 'middle', b'1', '2023-03-15'),
(17, 2, 'Q107', NULL, 'RAW ROSE QUARTZ, ETHICALLY SOURCED CRYSTALS, ECO-FRIENDLY PACKAGING', 6, 'crystal', 'stone', 'Rose Quartz is the crystal of unconditional love and infinite peace. It is said to promote deep inner healing and self-love, attract new loving relationships, and restore trust and harmony in existing relationships.', NULL, 7, 20, 'pink', 'middle', b'0', '2023-03-15'),
(18, 2, 'Q108', NULL, 'RARE GREEN GHOST PHANTOM,QUARTZ CRYSTAL SPECIMEN,CRYSTAL HEAL ', 11, 'ellipse', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it is normal for the difference.', NULL, 5, 11, 'green', 'small', b'0', '2023-03-15'),
(19, 2, 'Q109', NULL, 'ROSE QUARTZ ROSE FLOWER | PINK QUARTZ | LOVE STONE | - HEART CHAKRA', 30, 'crystal', 'Chakra', 'Beautiful Small Rose Quartz Crystal Rose,You will receive one intuitively chosen.', NULL, 7, 27, 'pink', 'middle', b'1', '2023-03-15'),
(20, 2, 'Q110', NULL, 'NATURAL BLUE GHOST PHANTOM,QUARTZ CRYSTAL SPECIMEN,CRYSTAL HEAL', 12, 'ellipse', 'stone', 'The ghost pendant likes water, soak it in water to make the color more vivid', NULL, 8, 31, 'blue', 'middle', b'1', '2023-03-15'),
(21, 3, 'D101', 'tiffany', 'BANGLE IN YELLOW GOLD WITH DIAMOND ACCENTS', 10000, '', 'Bracelets', 'No rules. All welcome. Inspired by the power of togetherness and inclusivity, Tiffany Lock is a bold and visual statement about the personal bonds that make us who we are. Designed to be worn by all genders, the Tiffany Lock bangle features an innovative clasp that echoes the functionality of a padlock, an important motif from The Tiffany Archives.', NULL, 7, 24, 'yellow', 'middle', b'0', '2023-03-15'),
(22, 3, 'D102', 'tiffany', 'BANGLE IN WHITE GOLD WITH FULL DIAMONDS', 32000, '', 'bracelets', 'No rules. All welcome. Inspired by the power of togetherness and inclusivity,Tiffany Lock is a bold and visual statement about the personal bonds that make us who we are.Designed to be worn by all genders, the Tiffany Lock bangle features an innovative clasp that echoes the functionality of a padlock, an important motif from The Tiffany Archives. ', NULL, 1, 3, 'white', 'middle', b'0', '2023-03-15'),
(23, 3, 'D103', 'tiffany', 'PENDANT PLATINUM WITH MARQUISE DIAMONDS', 14000, '', 'necklaces', 'Inspired by the fire and radiance of our superlative diamonds, Tiffany Victoria uses a unique combination of cuts for a distinctly romantic sensibility.The elegant simplicity of this pendant makes it as appropriate for day as it is for evening.', NULL, 2, 10, 'white', 'small', b'0', '2023-03-15'),
(24, 3, 'D104', 'swarovski', 'SWAROVSKI MILLENIA BRACELET, SMALL OCTAGON CUT CRYSTALS', 329, '', 'bracelet', 'The styling possibilities are infinite with this timeless bracelet. A modern silhouette, it expertly crafted from a row of octagon cut crystals cradled in a rhodium plated setting..Finished with a fine jewelry-inspired closure, it will complement any ensemble', NULL, 4, 8, 'white', 'middle', b'0', '2023-03-15'),
(25, 3, 'D105', 'tiffany', 'TENNIS BRACELET IN PLATINUM WITH DIAMONDS', 10000, '', 'bracelets', 'Inspired by the fire and radiance of our superlative diamonds,Tiffany Victoria uses a unique combination of cuts for a distinctly romantic sensibility. This feminine take on the classic line bracelet features a dazzling clasp of marquise diamonds.', NULL, 6, 21, 'white', 'small', b'0', '2023-03-15'),
(26, 3, 'D106', NULL, 'NATURAL LOOSE DIAMOND RAW ROUGH SILVER GREY COLOR I3 CLARITY 1+ CARAT Q95', 32, 'stone', 'raw', 'Natural Loose Diamond', NULL, 1, 5, 'white', 'small', b'0', '2023-03-15'),
(27, 3, 'D107', NULL, '5PCS GENUINE WHITE DIAMOND RAW GEMSTONE 10X12M12X14MM', 7, 'raw', 'stone', 'Wholesale Price 60% Sale for Natural Raw Diamond Rough Stone,5 Pieces White Crystal Diamond Nuggets-Herkimer diamond jewelry Crystal,Size is 10x12mm to 12x14mm Faceting Diamond Raw Gemstone ROCKS', NULL, 6, 22, 'white', 'small', b'0', '2023-03-15'),
(28, 3, 'D108', NULL, '1,5-2MM - 1CT (20-22PCS) ROUGH WHITE DIAMONDS, LOOSE DIAMOND', 22, 'raw', 'stone', '1,5-2mm - 1Ct (20-22pcs) Rough White Diamonds, Loose Diamond, Tiny Diamonds, Raw Diamonds, Uncut Diamond,Luster Diamond for Jewelry', NULL, 9, 34, 'white', 'small', b'0', '2023-03-15'),
(29, 3, 'D109', NULL, 'MOISSANITE ROUND LAB DIAMOND FACETED CUT 1MM- 4MM LOOSE STONE D-E', 10, 'crystal', 'stone', 'MOISSANITE ROUND DIAMOND FACETED CUT 1mm- 4mm LOOSE D-E WHITE COLOR VVS CLARITY', NULL, 4, 14, 'white', 'small', b'0', '2023-03-15'),
(30, 3, 'D110', NULL, 'DIAMOND TENNIS BRACELET, LOW PROFILE 4 PRONG, 1CT - 6CT, 14K SOLID WHITE YELLOW', 992, '', 'bracelet', 'HOLIDAY SPECIAL!, Diamond Tennis Bracelet, Low Profile 4 Prong,1ct - 6ct, 14k Solid White Yellow Rose Gold,Social Value makes the perfect gift for Birthdays Anniversaries Christmas Hanukkah', NULL, 10, 30, 'white', 'middle', b'0', '2023-03-15'),
(31, 4, 'E101', NULL, 'NATURAL GREEN EMERALD ZAMBIAN ROUGH LOOSE GEMSTONE GENUINE EMERALD', 20, 'raw', 'stone', 'Gemstone > Green Emerald\r\nTransparency: Translucent\r\nTreatment: Dyeing\r\nShape : Rough\r\nCountry of Origin: Zambian', NULL, 8, 28, 'green', 'small', b'0', '2023-03-15'),
(32, 4, 'E102', NULL, '12X16 MM ZAMBIA EMERALD OVAL RING STONE LOOSE GEMSTONE', 11, 'crystal', 'stone', 'If you need more sizes and shapes and stones which are not listed please let us know, we will make special listing for you.We also welcome wholesale orders and offer great discounts on wholesale quantities.', NULL, 1, 2, 'green', 'small', b'0', '2023-03-15'),
(33, 4, 'E103', NULL, 'FACETED ZAMBIAN EMERALD PENDANT 925 STERLING SILVER PENDANT REAL GEMSTONE', 12, '', 'earrings', 'Faceted Zambian Emerald Pendant 925 Sterling Silver Pendant Real Gemstone Pendant Handmade Pendant Gift For Bridal Beautiful Emerald Jewelry', NULL, 9, 35, 'green', 'small', b'1', '2023-03-15'),
(34, 4, 'E104', NULL, 'NATURAL COLOMBIA GREEN EMERALD 10.10 CT LOOSE GEMSTONE FOR RING', 12, 'hex', 'gemstone', 'We are Wholesale Supplier of all type of Gem Stones, precious, semiprecious stones.We also supply Gemstone as per your Requirement and Design.Weight, Design, Stones, Stones size can be changed as per requirement of buyer.', NULL, 3, 13, 'green', 'small', b'0', '2023-03-15'),
(35, 4, 'E105', NULL, 'TENNIS BRACELET ROUND CUT IN LAB CREATED EMERALD DIAMONDS', 479, '', 'bracelet', 'This Bracelet Can Be customized in your choice of shape, type, size, and color of diamond as per requirement, Please DM to customize.', NULL, 9, 34, 'green', 'middle', b'0', '2023-03-15'),
(36, 4, 'E106', NULL, 'BEAUTIFUL CERTIFIED UNCUT 75.85 CT PAIR COLOMBIA EMERALD', 42, 'raw', 'stone', 'Beautiful Certified Uncut 75.85 Ct pair Colombia Emerald Rough Loose Gemstone', NULL, 1, 2, 'green', 'middle', b'0', '2023-03-15'),
(37, 4, 'E107', NULL, 'EMERALD PENDANT COPPER WIRE WRAPPED PENDANT EMERALD GEMSTONE', 17, '', 'gemstone', 'Emerald Gemstone Copper Wire Wrapped Handmade Pendant,A copper I wrapped on a beautiful Emerald Gemstone .Size May Be slight Differ Than Shown In The Picture', NULL, 7, 22, 'green', 'middle', b'0', '2023-03-15'),
(38, 4, 'E108', NULL, 'ART DECO EMERALD GREEN EARRINGS, JADE GREEN BAGUETTE EARRINGS', 28, '', 'earrings', 'These beautiful, emerald green earrings are translucent lucite gems set in a delicate golden brass setting.They are a great deep jade jewel shade of green which is complimented with the deep gold tones of the brass settings.', NULL, 1, 2, 'green', 'small', b'0', '2023-03-15'),
(39, 4, 'E109', NULL, 'NATURAL EMERALD FACETED CUT MIX SHAPE 50 CARAT MINI MIXED LOT OVAL', 32, 'raw', 'gemstone', 'Natural Emerald Faceted Cut Mix Shape 50 Carat Mini Mixed Lot Oval & Emerald Shape Mixed Lot Loose Gemstones', NULL, 1, 2, 'green', 'small', b'0', '2023-03-15'),
(40, 4, 'E110', NULL, 'NATURAL EMERALD ROUGH STICK CORUNDUM COLOMBIAN UNCUT EMERALD GEMSTONE', 33, 'raw', 'gemstone', 'A natural, responsibly earth-mined Emerald with a dominant hue of Green color, cut into a Stick shape. This stone weighs 328 Carats.', NULL, 4, 12, 'green', 'big', b'0', '2023-03-15'),
(41, 4, 'E111', NULL, 'EMERALD RAW STONE LOT, NATURAL EMERALD ROUGH 10-20MM GOOD QUALITY ROUGH', 32, 'raw', 'stone', 'International buyers are notified that no import duties, taxes, or any other charges are included to the item price', NULL, 10, 37, 'green', 'small', b'0', '2023-03-15'),
(42, 5, 'J101', NULL, 'DAINTY JADE BEADED PENDANT NECKLACE, 14K GOLD GREEN JADE FRESHWATER PEARL CHOKER', 25, '', 'necklace', 'The circle of Jade is the means of holding back peace and keeping happiness.Round donuts mean to bring fortune and avoid evil spirits.', NULL, 4, 10, 'green', 'middle', b'0', '2023-03-15'),
(43, 5, 'J102', NULL, 'JADE TUMBLE STONE, GREEN JADE CRYSTAL UK, JADE HEALING STONE', 3, 'charka', 'stone', 'Jade Tumble Stone, Green Jade Crystal UK, Jade Healing Stone, L M S Gemstone For Good Luck, Libra and Taurus Birthstone, Heart Chakra', NULL, 1, 5, 'green', 'middle', b'0', '2023-03-15'),
(44, 5, 'J103', NULL, 'NATURAL REAL HETIAN ICY FLORAL JADE PENDANT, DIY STAR JADE BEADS', 5, '', 'gemstone', 'Elegant green bow gift box with a card including your message is available with few extra dollars. Please select at the check-out.', NULL, 10, 34, 'green', 'small', b'0', '2023-03-15'),
(45, 5, 'J104', NULL, 'VINTAGE HETIAN JADE BRACELET 8MM NATURAL GEMSTONE CHARM BRACELET HEALING', 14, '', 'bracelet', 'This is a Dainty Jade Bracelet , which can let your heart more clear and pure.It helps you to clear out those blockages that may have been holding you back.\r\n', NULL, 3, 9, 'green', 'middle', b'0', '2023-03-15'),
(46, 5, 'J105', NULL, 'REAL GREEN JADE DRAGON NECKLACE, CHINESE ZODIAC YEAR OF DRAGON CHARM', 16, '', 'gemstone', 'Dragon (pronounced as Long) is a mythical creature in both western and oriental cultures, whereas in China it symbolizes power and strength.', NULL, 6, 21, 'green', 'small', b'0', '2023-03-15'),
(47, 5, 'J106', NULL, 'JADE IS ONE OF THE OLDEST AND MOST IMPORTANT GEMSTONES', 5, '', 'gemstone', 'Jade is one of the oldest and most important gemstones, with a history dating over 7,000 years.It is especially prized throughout Chinese and Latin American cultures', NULL, 9, 33, 'green', 'small', b'0', '2023-03-15'),
(48, 5, 'J107', NULL, 'JADE DRAGON PENDANT | UNIQUE DRAGON CARVING NECKLACE PENDANT', 17, '', 'necklace', 'If you need more, we can give you a good discount! Dear friend, whatever question you encounter after purchase, please contact me, please believe I will give you the most satisfactory solution.', NULL, 8, 25, 'green', 'middle', b'0', '2023-03-15'),
(49, 5, 'J108', NULL, 'AFRICA JADE 30 MM ~ GEMSTONE DONUT NECKLACE ~HIPPIE ~GOA ~BOHO', 26, '', 'necklace', 'Gemstone Donut Necklace ~ Africa Jade ~ Incl. 2 mm in antique brown to knot.These new Africa Jade Donuts have a wonderful quality and an intense green - from Canada', NULL, 9, 31, 'green', 'small', b'0', '2023-03-15'),
(50, 5, 'J109', NULL, 'NATURAL RAW GREEN JADE CRYSTAL - RAW GREEN JADE STONE - RAW MAKING JEWELRY', 1, 'raw', 'stone', 'Natural Raw Green Jade Crystal - Raw Green Jade Stone - Raw Making Jewelry - Healing Crystal - Crystal Shop', NULL, 3, 14, 'green', 'small', b'0', '2023-03-15'),
(51, 5, 'J110', NULL, 'GREEN JADE RING, COPPER AND STAINLESS STEEL - HANDMADE - JADE RING', 77, '', 'ring', 'This ring is composed of a 304 stainless steel base, with an inlay made of green jade flakes and copper chips,which I personally select and insert one by one.', NULL, 8, 28, 'green', 'small', b'0', '2023-03-15'),
(52, 8, 'P101', 'pandora', 'SEA TURTLE CHARMS, ON A BLUE BUBBLE MURANO GLASS BEADS', 20, '', 'charms', 'Blue sea seems having a kind of magic and fascinating. Cute dolphin, fish, starfish, turtle,etc......... Do you like it?solid 925 sterling silver sea turtle charm beads.', NULL, 6, 24, 'blue', 'small', b'0', '2023-03-15'),
(53, 8, 'P102', 'pandora', 'CHORUSLOVE VALENTINES DAY CHARMS 925 STERLING SILVER ARROW OF CUPID', 18, '', 'charms', 'solid 925 sterling silver princess heart charm beads, pink heart gems surround by micro clear cz.Lead-free, Nickel-free, Cadmium-free and Hypoallergenic, 100% safe for sensitive skin.', NULL, 5, 16, 'purple', 'small', b'0', '2023-03-15'),
(54, 8, 'P103', 'pandora', 'STERLING SILVER VALENTINES DAY CHARMS HEART CHARMS, I LOVE YOU.', 12, '', 'charms', 'I love you moon and back means I love you more. As we all know, universe is so big, you can imagine how deep is the love.', NULL, 5, 14, 'blue', 'small', b'0', '2023-03-15'),
(55, 8, 'P104', 'pandora', 'STERLING SILVER VALENTINES DAY CHARMS HEART CHARMS, I LOVE YOU', 8, '', 'charms', 'I love you moon and back means I love you more. As we all know, universe is so big, you can imagine how deep is the love.', NULL, 10, 35, 'pink', 'small', b'0', '2023-03-15'),
(56, 8, 'P105', 'pandora', 'BLUE PANSY FLOWER STUD EARRINGS', 66, '', 'earrings', 'Colour your spring with our Blue Pansy Flower Stud Earrings. Hand-finished in sterling silver,each pansy features two petals covered in sparkling pavé and three petals hand-painted in shaded white and blue enamel.', NULL, 5, 19, 'pink', 'small', b'0', '2023-03-15'),
(57, 6, 'R101', 'swarovski', 'SWAROVSKI FLORERE GOLD-PLATED PINK FLOWER WOMEN IS NECKLACE', 1550, '', 'necklace', 'This wondrous Florere necklace becomes even more beautiful the closer you look. Crafted with a gold-tone plated setting, the pink design features five faceted petals artfully arranged around a central stone with a deeper hue.', NULL, 4, 13, 'pink', 'small', b'1', '2023-03-15'),
(58, 6, 'R102', NULL, 'PIGEON BLOOD NATURAL RUBY | OVAL CUT |1.42 CARATS | BURMA MINES', 1759, '', 'gemstone', 'Pigeon Blood Natural Ruby | Oval Cut |1.42 Carats | Burma Mines | No Heat Oval Shape Ruby.', NULL, 10, 36, 'red', 'small', b'1', '2023-03-15'),
(59, 6, 'R103', NULL, 'HANDMADE 100% GENUINE ROUGH PINK RUBY NECKLACE WITH AMAZING PINK COLOR AND GLOW', 32, '', 'necklace', '100% HANDMADE NATURAL HOT PINK RUBY EVERY DAY NECKLACE, ROUGH RUBY NECKLACE, MINIMALIST RUBY NECKLACE, RAW RUBY PENDANT, SOUTH AFRICA MINES.', NULL, 10, 39, 'pink', 'middle', b'1', '2023-03-15'),
(60, 6, 'R104', NULL, 'AAA QUALITY BURMESE PIGEON RED RUBY LOOSE GEMSTONE , OCTAGON SHAPE EMERALD', 45, 'hex', 'gemstone', 'PERSONALISATION : If you need more Sizes and Shapes and stones which are not listed please let us know, We will make special listing for you. We will also make the all the stones and sizes as per your requirement. We happily accept bulk and custom orders.', NULL, 7, 23, 'pink', 'small', b'0', '2023-03-15'),
(61, 6, 'R105', NULL, 'KASHMIR RED RUBY PENDANT COPPER WIRE WRAPPED GEMSTONE PENDANT', 19, '', 'gemstone', 'Kashmir Red Ruby Gemstone Copper Wire Wrapped Handmade Pendant,A copper I wrapped on a beautiful Kashmir Red Ruby Gemstone .', NULL, 7, 31, 'red', 'middle', b'1', '2023-03-15'),
(62, 6, 'R106', NULL, 'BLOOD-RED RUBY OVAL CUT GEMSTONE EGG SHAPE FACETED RUBY GEM MULTIPLE SIZES', 4, '', 'gemstone', 'Priced per 1 gemstone. You can select a size.These gemstones are made by fusing natural ruby raw ore powder.', NULL, 3, 9, 'red', 'small', b'0', '2023-03-15'),
(63, 6, 'R107', NULL, '14MM CUSHION SHAPE MOZAMBIQUE PIGEON RED RUBY LOOSE GEMSTONE', 36, 'hex', 'gemstone', 'PERSONALISATION : If you need more Sizes and Shapes and stones which are not listed please let us know, We will make special listing for you. We will also make the all the stones and sizes as per your requirement. We happily accept bulk and custom orders.', NULL, 2, 6, 'red', 'small', b'0', '2023-03-15'),
(64, 6, 'R108', NULL, 'GENUINE RUBY PENDANT, REAL RUBY NECKLACE, REAL RUBY PENDANT ', 30, '', 'necklace', 'Real Ruby Necklace with a Genuine Ruby Pendant! This Ruby gemstone Necklace is a July Birthstone Necklace!', NULL, 10, 34, 'red', 'small', b'1', '2023-03-15'),
(65, 6, 'R109', NULL, 'RAW RUBY CRYSTAL (1G TO 14G) GRADE AA - NATURAL RUBY STONE - RAW RUBY STONE', 3, 'raw', 'stone', 'Raw Ruby crystal (1g to 14g) grade AA - natural ruby stone - raw ruby stone - rough ruby stone - healing crystals and stones heart chakra.', NULL, 3, 10, 'red', 'small', b'0', '2023-03-15'),
(66, 6, 'R110', NULL, 'NATURAL BURMA RUBY ROUGH GEMSTONE LOT (DYED)', 5, 'raw', 'stone', 'Raw Ruby grade AA - natural ruby stone - raw ruby stone - rough ruby stone - healing crystals and stones heart chakra.', NULL, 6, 23, 'red', 'small', b'0', '2023-03-15'),
(67, 7, 'S101', 'tiffany', 'COLOR BY THE YARD EARRINGS', 1550, '', 'earrings', 'Platinum with round sapphires Carat total weight .22 Original designs copyrighted by Elsa Peretti.', NULL, 10, 28, 'blue', 'small', b'0', '2023-03-15'),
(68, 7, 'S102', 'tiffany', 'COLOR BY THE YARD SAPPHIRE BRACELET', 975, '', 'bracelet', 'Bracelet in platinum with a sapphire.Platinum with a round sapphire, 7\" long, Carat weight .11', NULL, 9, 35, 'blue', 'small', b'0', '2023-03-15'),
(69, 7, 'S103', 'swarovski', 'SWAROVSKI SPARKING DANCE CRYSTAL NECKLACE AND EARRING SET JEWELRY', 250, '', 'necklaces', 'These mini hoop earrings celebrate the treasured Swarovski star emblem,inspired by the magic of Austrian scenery.', NULL, 1, 3, 'blue', 'small', b'0', '2023-03-15'),
(70, 7, 'S104', 'tiffany', 'COLOR BY THE YARD PENDANT', 1990, '', 'necklaces', 'The Elsa Peretti® Color by the Yard collection features bezel-set stones that shimmer against the skin.Platinum with a round sapphire.', NULL, 3, 13, 'blue', 'small', b'0', '2023-03-15'),
(71, 7, 'S105', 'swarovski', 'SWAROVSKI SYMBOLIC EVIL EYE PENDANT NECKLACE', 145, '', 'necklaces', 'This timeless necklace will work wonders with your everyday wardrobe.Suspended on a modern rhodium-plated chain, it features a beautiful.', NULL, 9, 34, 'blue', 'small', b'0', '2023-03-15'),
(72, 7, 'S106', 'swarovski', 'BLUE SAPPHIRE ROUND SHAPE CUT FACETED LOOSE GEMSTONE SIZE', 115, '', 'necklaces', 'The mixed-plated Duo Pendant Evil Eye adds a mystic touch to any look.It features one eye motif in blue, black, and clear crystal pave and one in rose gold-plated metal.', NULL, 4, 11, 'blue', 'small', b'0', '2023-03-15'),
(73, 7, 'S107', NULL, 'BLUE SAPPHIRE ROUND FACETED CUT LOOSE CERTIFIED GEMSTONE UNTREATED LOT', 3, 'crystal', 'gemstone', 'If you cannot find the GemStone of your dreams, give us a chance.We are able to offer custom cut Stones based on any facet diagram or image that you provide.', NULL, 4, 16, 'blue', 'small', b'0', '2023-03-15'),
(74, 7, 'S108', NULL, 'NATURAL STAR SAPPHIRE OVAL CUT STONES, AAA QUALITY LOOSE SAPPHIRE STONE', 2, 'crystal', 'gemstone', 'Natural Blue Sapphire Round Faceted Cut Loose Gemstone.', NULL, 3, 7, 'blue', 'small', b'0', '2023-03-15'),
(75, 7, 'S109', NULL, 'CALIBRATED SIZES OF NATURAL STAR SAPPHIRE GEMSTONES LOOSE GEMS', 28, 'crystal', 'gemstone', 'RANDOMLY Select from the Lot - AAA Quality Sapphire.', NULL, 3, 12, 'blue', 'small', b'0', '2023-03-15'),
(76, 7, 'S110', NULL, 'HUGE FLAWLESS 47.75 CT NATURAL BI-COLOR PINK BLUE SAPPHIRE PRECIOUS LOOSE GEMSTONE.', 322, 'crystal', 'gemstone', 'HUGE Flawless 47.75 Ct Natural Bi-Color Pink Blue Sapphire Precious Loose Gemstone GIT Certified Ovel Cut Stunning , HeartTouching Gemstone.', NULL, 7, 26, 'blue', 'middle', b'0', '2023-03-15'),
(77, 7, 'S111', NULL, 'EXTRA LARGE NATURAL BLUE SAPPHIRE RAW/BLUE SAPPHIRE ROUGH', 6, 'raw', 'gemstone', 'Large Blue Sapphire Raw(Fracture Filled),Blue Sapphire Rough Stone.', NULL, 4, 16, 'blue', 'small', b'0', '2023-03-15'),
(78, 2, 'SE101', NULL, 'ALL SIZES ROSE QUARTZ SPHERE, LARGE ROSE QUARTZ SPHERE', 9, 'sphere', 'stone', 'A beautiful rose quartz crystal sphere, intuitively chosen for you.Did you know rose quartz is regarded as the unconditional love stone?', NULL, 9, 29, 'pink', 'big', b'0', '2023-03-15'),
(79, 2, 'SE102', NULL, '50MM+ NATURAL RED ZOISITE BALL，CRYSTAL SPHERE，QUARTZ CRYSTAL BALL', 24, 'sphere', 'stone', 'This product requires the use of ultraviolet light to see the color change.', NULL, 7, 22, 'red', 'middle', b'0', '2023-03-15'),
(80, 2, 'SE103', NULL, 'NATURAL CLEAR SPHERE,QUARTZ CRYSTAL BALL,MINERAL SPECIMEN,ROCK,REIKI HEALING', 86, 'sphere', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it normal fr the difference', NULL, 8, 30, 'white', 'big', b'0', '2023-03-15'),
(81, 2, 'SE104', NULL, '1PC 55MM+ NATURAL SODALITE BALL，CRYSTAL SPHERE，QUARTZ CRYSTAL BALL', 21, 'sphere', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it is normal fr the difference.', NULL, 5, 18, 'blue', 'middle', b'1', '2023-03-15'),
(82, 8, 'SE105', NULL, 'LARGE BLUE APATITE CRYSTAL BALL - BLUE APATITE SPHERE - CRYSTAL BALL HEALING', 20, 'sphere', 'stone', 'Large Blue Apatite Crystal Ball - Blue Apatite Sphere - Crystal Ball Healing - Stone Decor Feng Shui 45-65mm.', NULL, 4, 16, 'blue', 'big', b'0', '2023-03-15'),
(83, 1, 'SE106', NULL, '1PC NATURAL AMTHYST SPHERE ORNAMENT,HIGH QUALITY CRYSTAL SPHERE', 8, 'sphere', 'stone', 'Welcome to my shop, Im a designer and gemstone lover with a passion for decorating homes with gemstones.', NULL, 10, 35, 'purple', 'big', b'0', '2023-03-15'),
(84, 2, 'SE107', NULL, 'ONE BLUE MELTING STONE SPHERE,QUARTZ CRYSTAL BALL,HOME DECORATION', 17, 'sphere', 'stone', 'This product requires the use of ultraviolet light to see the color change.', NULL, 6, 16, 'blue', 'middle', b'0', '2023-03-15'),
(85, 2, 'SE108', NULL, '2.4\" FLAKY CLEAR QUARTZ SPHERE, CRYSTAL BALL, NATURAL CRYSTAL SPHERE', 22, 'sphere', 'stone', 'The sphere form signifies the emanation of energy from within. Clear quartz is one of its strong protective types.It dissipates negative energy and clears it away.', NULL, 5, 19, 'white', 'middle', b'0', '2023-03-15');

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

CREATE TABLE `promotion` (
  `promotion_id` int(11) NOT NULL,
  `value` float NOT NULL,
  `description` text NOT NULL,
  `image_link` varchar(50) NOT NULL,
  `start_time` date NOT NULL DEFAULT current_timestamp(),
  `end_time` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nick_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `password`, `nick_name`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'thannguyen', 'admin', 'Thân');

-- --------------------------------------------------------

--
-- Table structure for table `user_action_log`
--

CREATE TABLE `user_action_log` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vote_product`
--

CREATE TABLE `vote_product` (
  `vote_id` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `vote_rating` int(11) NOT NULL,
  `comments` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vote_product`
--

INSERT INTO `vote_product` (`vote_id`, `email`, `product_id`, `vote_rating`, `comments`) VALUES
(1, 'email1@gmail.com', 1, 4, 'Good product'),
(2, 'email2@gmail.com', 1, 4, 'Good product'),
(3, 'email3@gmail.com', 1, 3, 'Normal product'),
(4, 'email4@gmail.com', 1, 4, 'Good product'),
(5, 'email5@gmail.com', 1, 3, 'Normal product'),
(6, 'email6@gmail.com', 1, 4, 'Good product'),
(7, 'email7@gmail.com', 1, 5, 'Good product'),
(8, 'email8@gmail.com', 1, 2, 'Bad product'),
(9, 'email9@gmail.com', 1, 2, 'Bad product'),
(10, 'email10@gmail.com', 1, 5, 'Good product'),
(11, 'email11@gmail.com', 2, 3, 'Normal product'),
(12, 'email12@gmail.com', 2, 3, 'Normal product'),
(13, 'email13@gmail.com', 2, 2, 'Bad product'),
(14, 'email14@gmail.com', 2, 4, 'Good product'),
(15, 'email15@gmail.com', 2, 2, 'Bad product'),
(16, 'email16@gmail.com', 2, 3, 'Normal product'),
(17, 'email17@gmail.com', 3, 2, 'Bad product'),
(18, 'email18@gmail.com', 4, 5, 'Good product'),
(19, 'email19@gmail.com', 4, 5, 'Good product'),
(20, 'email20@gmail.com', 4, 3, 'Normal product'),
(21, 'email21@gmail.com', 4, 5, 'Good product'),
(22, 'email22@gmail.com', 4, 2, 'Bad product'),
(23, 'email23@gmail.com', 5, 2, 'Bad product'),
(24, 'email24@gmail.com', 5, 5, 'Good product'),
(25, 'email25@gmail.com', 5, 4, 'Good product'),
(26, 'email26@gmail.com', 5, 3, 'Normal product'),
(27, 'email27@gmail.com', 6, 3, 'Normal product'),
(28, 'email28@gmail.com', 6, 3, 'Normal product'),
(29, 'email29@gmail.com', 6, 3, 'Normal product'),
(30, 'email30@gmail.com', 6, 3, 'Normal product'),
(31, 'email31@gmail.com', 6, 5, 'Good product'),
(32, 'email32@gmail.com', 6, 4, 'Good product'),
(33, 'email33@gmail.com', 6, 2, 'Bad product'),
(34, 'email34@gmail.com', 6, 4, 'Good product'),
(35, 'email35@gmail.com', 6, 5, 'Good product'),
(36, 'email36@gmail.com', 7, 3, 'Normal product'),
(37, 'email37@gmail.com', 7, 2, 'Bad product'),
(38, 'email38@gmail.com', 7, 4, 'Good product'),
(39, 'email39@gmail.com', 7, 2, 'Bad product'),
(40, 'email40@gmail.com', 7, 2, 'Bad product'),
(41, 'email41@gmail.com', 7, 4, 'Good product'),
(42, 'email42@gmail.com', 7, 2, 'Bad product'),
(43, 'email43@gmail.com', 7, 3, 'Normal product'),
(44, 'email44@gmail.com', 7, 5, 'Good product'),
(45, 'email45@gmail.com', 7, 3, 'Normal product'),
(46, 'email46@gmail.com', 8, 4, 'Good product'),
(47, 'email47@gmail.com', 9, 4, 'Good product'),
(48, 'email48@gmail.com', 9, 2, 'Bad product'),
(49, 'email49@gmail.com', 9, 4, 'Good product'),
(50, 'email50@gmail.com', 9, 3, 'Normal product'),
(51, 'email51@gmail.com', 9, 2, 'Bad product'),
(52, 'email52@gmail.com', 9, 3, 'Normal product'),
(53, 'email53@gmail.com', 9, 5, 'Good product'),
(54, 'email54@gmail.com', 9, 5, 'Good product'),
(55, 'email55@gmail.com', 9, 4, 'Good product'),
(56, 'email56@gmail.com', 10, 3, 'Normal product'),
(57, 'email57@gmail.com', 11, 5, 'Good product'),
(58, 'email58@gmail.com', 11, 4, 'Good product'),
(59, 'email59@gmail.com', 11, 4, 'Good product'),
(60, 'email60@gmail.com', 11, 4, 'Good product'),
(61, 'email61@gmail.com', 12, 5, 'Good product'),
(62, 'email62@gmail.com', 12, 5, 'Good product'),
(63, 'email63@gmail.com', 12, 4, 'Good product'),
(64, 'email64@gmail.com', 13, 5, 'Good product'),
(65, 'email65@gmail.com', 13, 5, 'Good product'),
(66, 'email66@gmail.com', 13, 3, 'Normal product'),
(67, 'email67@gmail.com', 13, 3, 'Normal product'),
(68, 'email68@gmail.com', 13, 2, 'Bad product'),
(69, 'email69@gmail.com', 13, 2, 'Bad product'),
(70, 'email70@gmail.com', 13, 3, 'Normal product'),
(71, 'email71@gmail.com', 14, 4, 'Good product'),
(72, 'email72@gmail.com', 14, 5, 'Good product'),
(73, 'email73@gmail.com', 14, 4, 'Good product'),
(74, 'email74@gmail.com', 14, 2, 'Bad product'),
(75, 'email75@gmail.com', 15, 5, 'Good product'),
(76, 'email76@gmail.com', 16, 4, 'Good product'),
(77, 'email77@gmail.com', 16, 4, 'Good product'),
(78, 'email78@gmail.com', 16, 4, 'Good product'),
(79, 'email79@gmail.com', 16, 2, 'Bad product'),
(80, 'email80@gmail.com', 16, 4, 'Good product'),
(81, 'email81@gmail.com', 17, 3, 'Normal product'),
(82, 'email82@gmail.com', 17, 5, 'Good product'),
(83, 'email83@gmail.com', 17, 3, 'Normal product'),
(84, 'email84@gmail.com', 17, 2, 'Bad product'),
(85, 'email85@gmail.com', 17, 2, 'Bad product'),
(86, 'email86@gmail.com', 17, 2, 'Bad product'),
(87, 'email87@gmail.com', 17, 3, 'Normal product'),
(88, 'email88@gmail.com', 18, 2, 'Bad product'),
(89, 'email89@gmail.com', 18, 2, 'Bad product'),
(90, 'email90@gmail.com', 18, 2, 'Bad product'),
(91, 'email91@gmail.com', 18, 3, 'Normal product'),
(92, 'email92@gmail.com', 18, 2, 'Bad product'),
(93, 'email93@gmail.com', 19, 2, 'Bad product'),
(94, 'email94@gmail.com', 19, 3, 'Normal product'),
(95, 'email95@gmail.com', 19, 5, 'Good product'),
(96, 'email96@gmail.com', 19, 5, 'Good product'),
(97, 'email97@gmail.com', 19, 5, 'Good product'),
(98, 'email98@gmail.com', 19, 5, 'Good product'),
(99, 'email99@gmail.com', 19, 2, 'Bad product'),
(100, 'email100@gmail.com', 20, 5, 'Good product'),
(101, 'email101@gmail.com', 20, 3, 'Normal product'),
(102, 'email102@gmail.com', 20, 4, 'Good product'),
(103, 'email103@gmail.com', 20, 3, 'Normal product'),
(104, 'email104@gmail.com', 20, 5, 'Good product'),
(105, 'email105@gmail.com', 20, 3, 'Normal product'),
(106, 'email106@gmail.com', 20, 5, 'Good product'),
(107, 'email107@gmail.com', 20, 3, 'Normal product'),
(108, 'email108@gmail.com', 21, 5, 'Good product'),
(109, 'email109@gmail.com', 21, 3, 'Normal product'),
(110, 'email110@gmail.com', 21, 5, 'Good product'),
(111, 'email111@gmail.com', 21, 2, 'Bad product'),
(112, 'email112@gmail.com', 21, 4, 'Good product'),
(113, 'email113@gmail.com', 21, 2, 'Bad product'),
(114, 'email114@gmail.com', 21, 3, 'Normal product'),
(115, 'email115@gmail.com', 22, 3, 'Normal product'),
(116, 'email116@gmail.com', 23, 5, 'Good product'),
(117, 'email117@gmail.com', 24, 2, 'Bad product'),
(118, 'email118@gmail.com', 24, 2, 'Bad product'),
(119, 'email119@gmail.com', 24, 2, 'Bad product'),
(120, 'email120@gmail.com', 24, 2, 'Bad product'),
(121, 'email121@gmail.com', 25, 3, 'Normal product'),
(122, 'email122@gmail.com', 25, 3, 'Normal product'),
(123, 'email123@gmail.com', 25, 4, 'Good product'),
(124, 'email124@gmail.com', 25, 3, 'Normal product'),
(125, 'email125@gmail.com', 25, 5, 'Good product'),
(126, 'email126@gmail.com', 25, 3, 'Normal product'),
(127, 'email127@gmail.com', 26, 5, 'Good product'),
(128, 'email128@gmail.com', 27, 5, 'Good product'),
(129, 'email129@gmail.com', 27, 2, 'Bad product'),
(130, 'email130@gmail.com', 27, 2, 'Bad product'),
(131, 'email131@gmail.com', 27, 5, 'Good product'),
(132, 'email132@gmail.com', 27, 3, 'Normal product'),
(133, 'email133@gmail.com', 27, 5, 'Good product'),
(134, 'email134@gmail.com', 28, 3, 'Normal product'),
(135, 'email135@gmail.com', 28, 4, 'Good product'),
(136, 'email136@gmail.com', 28, 5, 'Good product'),
(137, 'email137@gmail.com', 28, 4, 'Good product'),
(138, 'email138@gmail.com', 28, 5, 'Good product'),
(139, 'email139@gmail.com', 28, 2, 'Bad product'),
(140, 'email140@gmail.com', 28, 2, 'Bad product'),
(141, 'email141@gmail.com', 28, 4, 'Good product'),
(142, 'email142@gmail.com', 28, 5, 'Good product'),
(143, 'email143@gmail.com', 29, 4, 'Good product'),
(144, 'email144@gmail.com', 29, 2, 'Bad product'),
(145, 'email145@gmail.com', 29, 3, 'Normal product'),
(146, 'email146@gmail.com', 29, 5, 'Good product'),
(147, 'email147@gmail.com', 30, 2, 'Bad product'),
(148, 'email148@gmail.com', 30, 3, 'Normal product'),
(149, 'email149@gmail.com', 30, 4, 'Good product'),
(150, 'email150@gmail.com', 30, 3, 'Normal product'),
(151, 'email151@gmail.com', 30, 2, 'Bad product'),
(152, 'email152@gmail.com', 30, 3, 'Normal product'),
(153, 'email153@gmail.com', 30, 4, 'Good product'),
(154, 'email154@gmail.com', 30, 4, 'Good product'),
(155, 'email155@gmail.com', 30, 3, 'Normal product'),
(156, 'email156@gmail.com', 30, 2, 'Bad product'),
(157, 'email157@gmail.com', 31, 2, 'Bad product'),
(158, 'email158@gmail.com', 31, 5, 'Good product'),
(159, 'email159@gmail.com', 31, 4, 'Good product'),
(160, 'email160@gmail.com', 31, 5, 'Good product'),
(161, 'email161@gmail.com', 31, 2, 'Bad product'),
(162, 'email162@gmail.com', 31, 5, 'Good product'),
(163, 'email163@gmail.com', 31, 3, 'Normal product'),
(164, 'email164@gmail.com', 31, 2, 'Bad product'),
(165, 'email165@gmail.com', 32, 2, 'Bad product'),
(166, 'email166@gmail.com', 33, 5, 'Good product'),
(167, 'email167@gmail.com', 33, 3, 'Normal product'),
(168, 'email168@gmail.com', 33, 5, 'Good product'),
(169, 'email169@gmail.com', 33, 2, 'Bad product'),
(170, 'email170@gmail.com', 33, 4, 'Good product'),
(171, 'email171@gmail.com', 33, 5, 'Good product'),
(172, 'email172@gmail.com', 33, 4, 'Good product'),
(173, 'email173@gmail.com', 33, 3, 'Normal product'),
(174, 'email174@gmail.com', 33, 4, 'Good product'),
(175, 'email175@gmail.com', 34, 4, 'Good product'),
(176, 'email176@gmail.com', 34, 4, 'Good product'),
(177, 'email177@gmail.com', 34, 5, 'Good product'),
(178, 'email178@gmail.com', 35, 3, 'Normal product'),
(179, 'email179@gmail.com', 35, 2, 'Bad product'),
(180, 'email180@gmail.com', 35, 4, 'Good product'),
(181, 'email181@gmail.com', 35, 4, 'Good product'),
(182, 'email182@gmail.com', 35, 5, 'Good product'),
(183, 'email183@gmail.com', 35, 4, 'Good product'),
(184, 'email184@gmail.com', 35, 5, 'Good product'),
(185, 'email185@gmail.com', 35, 4, 'Good product'),
(186, 'email186@gmail.com', 35, 3, 'Normal product'),
(187, 'email187@gmail.com', 36, 2, 'Bad product'),
(188, 'email188@gmail.com', 37, 4, 'Good product'),
(189, 'email189@gmail.com', 37, 3, 'Normal product'),
(190, 'email190@gmail.com', 37, 4, 'Good product'),
(191, 'email191@gmail.com', 37, 2, 'Bad product'),
(192, 'email192@gmail.com', 37, 2, 'Bad product'),
(193, 'email193@gmail.com', 37, 3, 'Normal product'),
(194, 'email194@gmail.com', 37, 4, 'Good product'),
(195, 'email195@gmail.com', 38, 2, 'Bad product'),
(196, 'email196@gmail.com', 39, 2, 'Bad product'),
(197, 'email197@gmail.com', 40, 4, 'Good product'),
(198, 'email198@gmail.com', 40, 4, 'Good product'),
(199, 'email199@gmail.com', 40, 2, 'Bad product'),
(200, 'email200@gmail.com', 40, 2, 'Bad product'),
(201, 'email201@gmail.com', 41, 3, 'Normal product'),
(202, 'email202@gmail.com', 41, 3, 'Normal product'),
(203, 'email203@gmail.com', 41, 4, 'Good product'),
(204, 'email204@gmail.com', 41, 4, 'Good product'),
(205, 'email205@gmail.com', 41, 4, 'Good product'),
(206, 'email206@gmail.com', 41, 3, 'Normal product'),
(207, 'email207@gmail.com', 41, 4, 'Good product'),
(208, 'email208@gmail.com', 41, 5, 'Good product'),
(209, 'email209@gmail.com', 41, 3, 'Normal product'),
(210, 'email210@gmail.com', 41, 4, 'Good product'),
(211, 'email211@gmail.com', 42, 3, 'Normal product'),
(212, 'email212@gmail.com', 42, 2, 'Bad product'),
(213, 'email213@gmail.com', 42, 2, 'Bad product'),
(214, 'email214@gmail.com', 42, 3, 'Normal product'),
(215, 'email215@gmail.com', 43, 5, 'Good product'),
(216, 'email216@gmail.com', 44, 2, 'Bad product'),
(217, 'email217@gmail.com', 44, 5, 'Good product'),
(218, 'email218@gmail.com', 44, 4, 'Good product'),
(219, 'email219@gmail.com', 44, 3, 'Normal product'),
(220, 'email220@gmail.com', 44, 2, 'Bad product'),
(221, 'email221@gmail.com', 44, 2, 'Bad product'),
(222, 'email222@gmail.com', 44, 4, 'Good product'),
(223, 'email223@gmail.com', 44, 2, 'Bad product'),
(224, 'email224@gmail.com', 44, 5, 'Good product'),
(225, 'email225@gmail.com', 44, 5, 'Good product'),
(226, 'email226@gmail.com', 45, 2, 'Bad product'),
(227, 'email227@gmail.com', 45, 2, 'Bad product'),
(228, 'email228@gmail.com', 45, 5, 'Good product'),
(229, 'email229@gmail.com', 46, 5, 'Good product'),
(230, 'email230@gmail.com', 46, 2, 'Bad product'),
(231, 'email231@gmail.com', 46, 2, 'Bad product'),
(232, 'email232@gmail.com', 46, 2, 'Bad product'),
(233, 'email233@gmail.com', 46, 5, 'Good product'),
(234, 'email234@gmail.com', 46, 5, 'Good product'),
(235, 'email235@gmail.com', 47, 4, 'Good product'),
(236, 'email236@gmail.com', 47, 3, 'Normal product'),
(237, 'email237@gmail.com', 47, 4, 'Good product'),
(238, 'email238@gmail.com', 47, 4, 'Good product'),
(239, 'email239@gmail.com', 47, 2, 'Bad product'),
(240, 'email240@gmail.com', 47, 4, 'Good product'),
(241, 'email241@gmail.com', 47, 2, 'Bad product'),
(242, 'email242@gmail.com', 47, 5, 'Good product'),
(243, 'email243@gmail.com', 47, 5, 'Good product'),
(244, 'email244@gmail.com', 48, 2, 'Bad product'),
(245, 'email245@gmail.com', 48, 5, 'Good product'),
(246, 'email246@gmail.com', 48, 2, 'Bad product'),
(247, 'email247@gmail.com', 48, 4, 'Good product'),
(248, 'email248@gmail.com', 48, 2, 'Bad product'),
(249, 'email249@gmail.com', 48, 2, 'Bad product'),
(250, 'email250@gmail.com', 48, 5, 'Good product'),
(251, 'email251@gmail.com', 48, 3, 'Normal product'),
(252, 'email252@gmail.com', 49, 2, 'Bad product'),
(253, 'email253@gmail.com', 49, 2, 'Bad product'),
(254, 'email254@gmail.com', 49, 4, 'Good product'),
(255, 'email255@gmail.com', 49, 2, 'Bad product'),
(256, 'email256@gmail.com', 49, 4, 'Good product'),
(257, 'email257@gmail.com', 49, 3, 'Normal product'),
(258, 'email258@gmail.com', 49, 5, 'Good product'),
(259, 'email259@gmail.com', 49, 4, 'Good product'),
(260, 'email260@gmail.com', 49, 5, 'Good product'),
(261, 'email261@gmail.com', 50, 5, 'Good product'),
(262, 'email262@gmail.com', 50, 5, 'Good product'),
(263, 'email263@gmail.com', 50, 4, 'Good product'),
(264, 'email264@gmail.com', 51, 3, 'Normal product'),
(265, 'email265@gmail.com', 51, 3, 'Normal product'),
(266, 'email266@gmail.com', 51, 3, 'Normal product'),
(267, 'email267@gmail.com', 51, 5, 'Good product'),
(268, 'email268@gmail.com', 51, 3, 'Normal product'),
(269, 'email269@gmail.com', 51, 5, 'Good product'),
(270, 'email270@gmail.com', 51, 2, 'Bad product'),
(271, 'email271@gmail.com', 51, 4, 'Good product'),
(272, 'email272@gmail.com', 52, 4, 'Good product'),
(273, 'email273@gmail.com', 52, 3, 'Normal product'),
(274, 'email274@gmail.com', 52, 5, 'Good product'),
(275, 'email275@gmail.com', 52, 3, 'Normal product'),
(276, 'email276@gmail.com', 52, 4, 'Good product'),
(277, 'email277@gmail.com', 52, 5, 'Good product'),
(278, 'email278@gmail.com', 53, 4, 'Good product'),
(279, 'email279@gmail.com', 53, 3, 'Normal product'),
(280, 'email280@gmail.com', 53, 3, 'Normal product'),
(281, 'email281@gmail.com', 53, 3, 'Normal product'),
(282, 'email282@gmail.com', 53, 3, 'Normal product'),
(283, 'email283@gmail.com', 54, 3, 'Normal product'),
(284, 'email284@gmail.com', 54, 2, 'Bad product'),
(285, 'email285@gmail.com', 54, 2, 'Bad product'),
(286, 'email286@gmail.com', 54, 5, 'Good product'),
(287, 'email287@gmail.com', 54, 2, 'Bad product'),
(288, 'email288@gmail.com', 55, 3, 'Normal product'),
(289, 'email289@gmail.com', 55, 4, 'Good product'),
(290, 'email290@gmail.com', 55, 2, 'Bad product'),
(291, 'email291@gmail.com', 55, 5, 'Good product'),
(292, 'email292@gmail.com', 55, 5, 'Good product'),
(293, 'email293@gmail.com', 55, 2, 'Bad product'),
(294, 'email294@gmail.com', 55, 5, 'Good product'),
(295, 'email295@gmail.com', 55, 3, 'Normal product'),
(296, 'email296@gmail.com', 55, 2, 'Bad product'),
(297, 'email297@gmail.com', 55, 4, 'Good product'),
(298, 'email298@gmail.com', 56, 4, 'Good product'),
(299, 'email299@gmail.com', 56, 3, 'Normal product'),
(300, 'email300@gmail.com', 56, 5, 'Good product'),
(301, 'email301@gmail.com', 56, 3, 'Normal product'),
(302, 'email302@gmail.com', 56, 4, 'Good product'),
(303, 'email303@gmail.com', 57, 3, 'Normal product'),
(304, 'email304@gmail.com', 57, 4, 'Good product'),
(305, 'email305@gmail.com', 57, 4, 'Good product'),
(306, 'email306@gmail.com', 57, 2, 'Bad product'),
(307, 'email307@gmail.com', 58, 5, 'Good product'),
(308, 'email308@gmail.com', 58, 2, 'Bad product'),
(309, 'email309@gmail.com', 58, 4, 'Good product'),
(310, 'email310@gmail.com', 58, 3, 'Normal product'),
(311, 'email311@gmail.com', 58, 5, 'Good product'),
(312, 'email312@gmail.com', 58, 2, 'Bad product'),
(313, 'email313@gmail.com', 58, 5, 'Good product'),
(314, 'email314@gmail.com', 58, 4, 'Good product'),
(315, 'email315@gmail.com', 58, 4, 'Good product'),
(316, 'email316@gmail.com', 58, 2, 'Bad product'),
(317, 'email317@gmail.com', 59, 4, 'Good product'),
(318, 'email318@gmail.com', 59, 5, 'Good product'),
(319, 'email319@gmail.com', 59, 5, 'Good product'),
(320, 'email320@gmail.com', 59, 3, 'Normal product'),
(321, 'email321@gmail.com', 59, 4, 'Good product'),
(322, 'email322@gmail.com', 59, 3, 'Normal product'),
(323, 'email323@gmail.com', 59, 2, 'Bad product'),
(324, 'email324@gmail.com', 59, 5, 'Good product'),
(325, 'email325@gmail.com', 59, 3, 'Normal product'),
(326, 'email326@gmail.com', 59, 5, 'Good product'),
(327, 'email327@gmail.com', 60, 5, 'Good product'),
(328, 'email328@gmail.com', 60, 2, 'Bad product'),
(329, 'email329@gmail.com', 60, 2, 'Bad product'),
(330, 'email330@gmail.com', 60, 4, 'Good product'),
(331, 'email331@gmail.com', 60, 3, 'Normal product'),
(332, 'email332@gmail.com', 60, 4, 'Good product'),
(333, 'email333@gmail.com', 60, 3, 'Normal product'),
(334, 'email334@gmail.com', 61, 3, 'Normal product'),
(335, 'email335@gmail.com', 61, 4, 'Good product'),
(336, 'email336@gmail.com', 61, 5, 'Good product'),
(337, 'email337@gmail.com', 61, 4, 'Good product'),
(338, 'email338@gmail.com', 61, 5, 'Good product'),
(339, 'email339@gmail.com', 61, 5, 'Good product'),
(340, 'email340@gmail.com', 61, 5, 'Good product'),
(341, 'email341@gmail.com', 62, 3, 'Normal product'),
(342, 'email342@gmail.com', 62, 3, 'Normal product'),
(343, 'email343@gmail.com', 62, 3, 'Normal product'),
(344, 'email344@gmail.com', 63, 3, 'Normal product'),
(345, 'email345@gmail.com', 63, 3, 'Normal product'),
(346, 'email346@gmail.com', 64, 4, 'Good product'),
(347, 'email347@gmail.com', 64, 2, 'Bad product'),
(348, 'email348@gmail.com', 64, 3, 'Normal product'),
(349, 'email349@gmail.com', 64, 5, 'Good product'),
(350, 'email350@gmail.com', 64, 5, 'Good product'),
(351, 'email351@gmail.com', 64, 2, 'Bad product'),
(352, 'email352@gmail.com', 64, 2, 'Bad product'),
(353, 'email353@gmail.com', 64, 5, 'Good product'),
(354, 'email354@gmail.com', 64, 2, 'Bad product'),
(355, 'email355@gmail.com', 64, 4, 'Good product'),
(356, 'email356@gmail.com', 65, 3, 'Normal product'),
(357, 'email357@gmail.com', 65, 5, 'Good product'),
(358, 'email358@gmail.com', 65, 2, 'Bad product'),
(359, 'email359@gmail.com', 66, 3, 'Normal product'),
(360, 'email360@gmail.com', 66, 4, 'Good product'),
(361, 'email361@gmail.com', 66, 4, 'Good product'),
(362, 'email362@gmail.com', 66, 4, 'Good product'),
(363, 'email363@gmail.com', 66, 4, 'Good product'),
(364, 'email364@gmail.com', 66, 4, 'Good product'),
(365, 'email365@gmail.com', 67, 2, 'Bad product'),
(366, 'email366@gmail.com', 67, 3, 'Normal product'),
(367, 'email367@gmail.com', 67, 4, 'Good product'),
(368, 'email368@gmail.com', 67, 4, 'Good product'),
(369, 'email369@gmail.com', 67, 4, 'Good product'),
(370, 'email370@gmail.com', 67, 2, 'Bad product'),
(371, 'email371@gmail.com', 67, 3, 'Normal product'),
(372, 'email372@gmail.com', 67, 2, 'Bad product'),
(373, 'email373@gmail.com', 67, 2, 'Bad product'),
(374, 'email374@gmail.com', 67, 2, 'Bad product'),
(375, 'email375@gmail.com', 68, 3, 'Normal product'),
(376, 'email376@gmail.com', 68, 5, 'Good product'),
(377, 'email377@gmail.com', 68, 4, 'Good product'),
(378, 'email378@gmail.com', 68, 4, 'Good product'),
(379, 'email379@gmail.com', 68, 4, 'Good product'),
(380, 'email380@gmail.com', 68, 2, 'Bad product'),
(381, 'email381@gmail.com', 68, 4, 'Good product'),
(382, 'email382@gmail.com', 68, 5, 'Good product'),
(383, 'email383@gmail.com', 68, 4, 'Good product'),
(384, 'email384@gmail.com', 69, 3, 'Normal product'),
(385, 'email385@gmail.com', 70, 5, 'Good product'),
(386, 'email386@gmail.com', 70, 4, 'Good product'),
(387, 'email387@gmail.com', 70, 4, 'Good product'),
(388, 'email388@gmail.com', 71, 4, 'Good product'),
(389, 'email389@gmail.com', 71, 4, 'Good product'),
(390, 'email390@gmail.com', 71, 5, 'Good product'),
(391, 'email391@gmail.com', 71, 3, 'Normal product'),
(392, 'email392@gmail.com', 71, 5, 'Good product'),
(393, 'email393@gmail.com', 71, 3, 'Normal product'),
(394, 'email394@gmail.com', 71, 5, 'Good product'),
(395, 'email395@gmail.com', 71, 3, 'Normal product'),
(396, 'email396@gmail.com', 71, 2, 'Bad product'),
(397, 'email397@gmail.com', 72, 3, 'Normal product'),
(398, 'email398@gmail.com', 72, 2, 'Bad product'),
(399, 'email399@gmail.com', 72, 2, 'Bad product'),
(400, 'email400@gmail.com', 72, 4, 'Good product'),
(401, 'email401@gmail.com', 73, 5, 'Good product'),
(402, 'email402@gmail.com', 73, 4, 'Good product'),
(403, 'email403@gmail.com', 73, 5, 'Good product'),
(404, 'email404@gmail.com', 73, 2, 'Bad product'),
(405, 'email405@gmail.com', 74, 3, 'Normal product'),
(406, 'email406@gmail.com', 74, 2, 'Bad product'),
(407, 'email407@gmail.com', 74, 2, 'Bad product'),
(408, 'email408@gmail.com', 75, 5, 'Good product'),
(409, 'email409@gmail.com', 75, 5, 'Good product'),
(410, 'email410@gmail.com', 75, 2, 'Bad product'),
(411, 'email411@gmail.com', 76, 5, 'Good product'),
(412, 'email412@gmail.com', 76, 5, 'Good product'),
(413, 'email413@gmail.com', 76, 2, 'Bad product'),
(414, 'email414@gmail.com', 76, 4, 'Good product'),
(415, 'email415@gmail.com', 76, 5, 'Good product'),
(416, 'email416@gmail.com', 76, 2, 'Bad product'),
(417, 'email417@gmail.com', 76, 3, 'Normal product'),
(418, 'email418@gmail.com', 77, 5, 'Good product'),
(419, 'email419@gmail.com', 77, 2, 'Bad product'),
(420, 'email420@gmail.com', 77, 5, 'Good product'),
(421, 'email421@gmail.com', 77, 4, 'Good product'),
(422, 'email422@gmail.com', 78, 4, 'Good product'),
(423, 'email423@gmail.com', 78, 3, 'Normal product'),
(424, 'email424@gmail.com', 78, 3, 'Normal product'),
(425, 'email425@gmail.com', 78, 3, 'Normal product'),
(426, 'email426@gmail.com', 78, 5, 'Good product'),
(427, 'email427@gmail.com', 78, 4, 'Good product'),
(428, 'email428@gmail.com', 78, 2, 'Bad product'),
(429, 'email429@gmail.com', 78, 3, 'Normal product'),
(430, 'email430@gmail.com', 78, 2, 'Bad product'),
(431, 'email431@gmail.com', 79, 4, 'Good product'),
(432, 'email432@gmail.com', 79, 3, 'Normal product'),
(433, 'email433@gmail.com', 79, 2, 'Bad product'),
(434, 'email434@gmail.com', 79, 3, 'Normal product'),
(435, 'email435@gmail.com', 79, 2, 'Bad product'),
(436, 'email436@gmail.com', 79, 4, 'Good product'),
(437, 'email437@gmail.com', 79, 4, 'Good product'),
(438, 'email438@gmail.com', 80, 4, 'Good product'),
(439, 'email439@gmail.com', 80, 2, 'Bad product'),
(440, 'email440@gmail.com', 80, 3, 'Normal product'),
(441, 'email441@gmail.com', 80, 3, 'Normal product'),
(442, 'email442@gmail.com', 80, 4, 'Good product'),
(443, 'email443@gmail.com', 80, 5, 'Good product'),
(444, 'email444@gmail.com', 80, 5, 'Good product'),
(445, 'email445@gmail.com', 80, 4, 'Good product'),
(446, 'email446@gmail.com', 81, 3, 'Normal product'),
(447, 'email447@gmail.com', 81, 5, 'Good product'),
(448, 'email448@gmail.com', 81, 4, 'Good product'),
(449, 'email449@gmail.com', 81, 3, 'Normal product'),
(450, 'email450@gmail.com', 81, 3, 'Normal product'),
(451, 'email451@gmail.com', 82, 5, 'Good product'),
(452, 'email452@gmail.com', 82, 4, 'Good product'),
(453, 'email453@gmail.com', 82, 4, 'Good product'),
(454, 'email454@gmail.com', 82, 3, 'Normal product'),
(455, 'email455@gmail.com', 83, 4, 'Good product'),
(456, 'email456@gmail.com', 83, 3, 'Normal product'),
(457, 'email457@gmail.com', 83, 3, 'Normal product'),
(458, 'email458@gmail.com', 83, 2, 'Bad product'),
(459, 'email459@gmail.com', 83, 4, 'Good product'),
(460, 'email460@gmail.com', 83, 5, 'Good product'),
(461, 'email461@gmail.com', 83, 5, 'Good product'),
(462, 'email462@gmail.com', 83, 5, 'Good product'),
(463, 'email463@gmail.com', 83, 2, 'Bad product'),
(464, 'email464@gmail.com', 83, 2, 'Bad product'),
(465, 'email465@gmail.com', 84, 5, 'Good product'),
(466, 'email466@gmail.com', 84, 2, 'Bad product'),
(467, 'email467@gmail.com', 84, 3, 'Normal product'),
(468, 'email468@gmail.com', 84, 2, 'Bad product'),
(469, 'email469@gmail.com', 84, 2, 'Bad product'),
(470, 'email470@gmail.com', 84, 2, 'Bad product'),
(471, 'email471@gmail.com', 85, 5, 'Good product'),
(472, 'email472@gmail.com', 85, 3, 'Normal product'),
(473, 'email473@gmail.com', 85, 4, 'Good product'),
(474, 'email474@gmail.com', 85, 3, 'Normal product'),
(475, 'email475@gmail.com', 85, 4, 'Good product'),
(476, 'than@gmail.com', 5, 10, 'good'),
(477, 'ihsdfi@gmail.com', 23, 5, 'bad'),
(478, 'than@gmail.com', 1, 5, NULL),
(479, 'test@gmail.com', 1, 5, 'test vote'),
(480, 'than2@gmail.com', 1, 4, 'good'),
(481, 'than3@gmail.com', 1, 4, 'bad'),
(482, 'than3@gmail.com', 1, 4, 'bad');

--
-- Triggers `vote_product`
--
DELIMITER $$
CREATE TRIGGER `vote_product_AFTER_INSERT` AFTER INSERT ON `vote_product` FOR EACH ROW BEGIN
	UPDATE `rockparadise`.`product`
    SET vote_quantity = vote_quantity + 1,
		total_vote = total_vote + NEW.vote_rating
	WHERE product_id = NEW.product_id;
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `vote_product_BEFORE_INSERT` BEFORE INSERT ON `vote_product` FOR EACH ROW BEGIN

	IF NEW.vote_rating < 1 
    THEN
		SET NEW.vote_rating = 1;
    ELSEIF NEW.vote_rating > 5
		THEN 
        SET NEW.vote_rating = 5;  
	END IF;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `fk_image_product_product_id` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_category_categroy_id` (`category_id`);

--
-- Indexes for table `promotion`
--
ALTER TABLE `promotion`
  ADD PRIMARY KEY (`promotion_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_action_log`
--
ALTER TABLE `user_action_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `vote_product`
--
ALTER TABLE `vote_product`
  ADD PRIMARY KEY (`vote_id`),
  ADD KEY `fk_voteProduct_Product` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=414;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_action_log`
--
ALTER TABLE `user_action_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vote_product`
--
ALTER TABLE `vote_product`
  MODIFY `vote_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=483;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `fk_image_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_category_categroy_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `vote_product`
--
ALTER TABLE `vote_product`
  ADD CONSTRAINT `fk_voteProduct_Product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
