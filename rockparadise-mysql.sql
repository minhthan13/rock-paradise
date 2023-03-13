-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2023 at 01:53 PM
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
(358, 82, b'1'),
(359, 82, b'0'),
(360, 82, b'0'),
(361, 82, b'0'),
(362, 82, b'0'),
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
(1, 1, 'A101', NULL, 'RAW AMETHYST POINTS BY THE POUND', 8, 'raw', 'stone', 'Beautiful extra quality points from Uruguay.You will receive a wonderful assortment of points, there are approximately 20 in 1/4 lb give or take as it is by weight.These are really nice points that can be used for wire wrapping, chakra cleansing, reiki, crystal grids, meditation, home decor, crafting and so much more.', NULL, 3, 11, 'purple', 'small', b'0', '2023-03-05'),
(2, 1, 'A102', NULL, 'AMETHYST WORRY STONE SLAB - THUMB STONE - PALM STONE', 4, 'raw', 'stone', 'Worry stones, also know as palm stones or thumb stones are smooth polished gemstones.They have a thumb-sized indentation so you can carry it in your pocket and rub it for relaxation and stress relief.People use them by holding the stone between the index finger and thumb and rubbing one thumb back and forth across the stone.', NULL, 1, 2, 'purple', 'small', b'0', '2023-03-05'),
(3, 1, 'A103', NULL, 'NATURAL AMETHYST TUMBLED STONES, AMETHYST WORRY STONE FOR CRYSTAL HEALING', 4, 'ellipse', 'stone', 'Specimens are natural materials and stones may feature natural internal fractures, dips or inclusions consistent with the growth pattern of the stone.Amount, location, and color of banding varies from stone to stone.', NULL, 2, 9, 'purple', 'small', b'0', '2023-03-05'),
(4, 1, 'A104', NULL, 'DEEP PURPLE AMETHYST CRYSTAL, CRYSTALS, CRYSTAL COLLECTION, URUGUAY', 177, 'raw', 'stone', 'Amethyst comes from the word meaning “not drunken”, the Ancient Greek myth of Bacchus and Diana.Amethyst is also the birthstone for the month of February.', NULL, 10, 30, 'purple', 'big', b'0', '2023-03-05'),
(5, 1, 'A105', NULL, 'LARGE AMETHYST CRYSTAL CLUSTER: CHOOSE SIZE! \"A\" GRADE CHOOSE SIZE!', 7, 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine.Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, 6, 24, 'purple', 'middle', b'1', '2023-03-05'),
(6, 1, 'A106', NULL, 'AAA GRADE NATURAL AMETHYST RAW MATERIAL AMETHYST FINE', 20, 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine. Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, 4, 11, 'purple', 'small', b'0', '2023-03-05'),
(7, 1, 'A107', NULL, '1LB AMETHYST TUMBLED STONE, TUMBLED AMETHYST CRYSTAL, BULK', 58, 'ellipse', 'stone', '1/2lb or 1lb light purple amethyst tumbled stone, some with rainbows.You will receive stones similar to the photos. Colors may vary depending on lighting and monitor.', NULL, 7, 24, 'purple', 'middle', b'0', '2023-03-05'),
(8, 1, 'A108', NULL, 'NATURAL AMETHYST LOOSE STONE ROUND CUT PURPLE CRYSTAL GEMSTONE', 13, 'crystal', 'stone', 'All our gemstones are genuine natural which mined supply directly from gobal mining area.Every gemstone is carefully selected,to keep the precious gemstone in high quality and in vibrant and superior color.', NULL, 3, 9, 'purple', 'small', b'0', '2023-03-05'),
(9, 1, 'A109', NULL, 'PURPLE AMETHYST RING, SILVER TUNGSTEN RING, WOMENS RING, MENS RING', 85, '', 'ring', 'Tungsten rings are popular because of their toughness and durability.Tungsten is scratch resistant and tarnish resistant which makes it a great choice for our customers who value longevity as well as low.', NULL, 9, 36, 'purple', 'small', b'0', '2023-03-05'),
(10, 1, 'A110', NULL, 'ROMANTICE LOVER GIFT NATURAL AMETHYST HEART SHAPE GEMSTONE', 503, '', 'Necklace', '100% Brand New! Excellent Quality and Workmanship.Naturally-Vibrant, Superior Quality Color Gemstone.Diamonds:Natural Diamonds Carat Weight:0.034t Cut:Round Clarity:SI Color:G-H.Metal Type:Solid 14K Yellow Gold Weight:2.1g', NULL, 8, 25, 'purple', 'small', b'0', '2023-03-05'),
(11, 2, 'Q101', NULL, 'CRYSTAL TOWER,LARGE CRYSTAL TOWER,NATURAL CRYSTAL,QUARTZ POINT', 816, 'raw', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, 5, 17, 'white', 'big', b'0', '2023-03-05'),
(12, 2, 'Q102', NULL, 'CRYSTAL CLUSTER，300-500G+ CLEAR QUARTZ CLUSTER CRYSTAL，QUARTZ POINT VUG', 26, 'crystal', 'stone', 'This product is not natural crystal, but belongs to laboratory crystal. If you mind, please do not buy it, thank you.', NULL, 4, 15, 'white', 'big', b'1', '2023-03-05'),
(13, 2, 'Q103', NULL, 'COVELLITE PINK FIRE QUARTZ CRYSTAL - TEARDROP - GEMSTONES, JEWELRY MAKING', 921, 'ellipse', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured. Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, 2, 9, 'pink', 'small', b'0', '2023-03-05'),
(14, 2, 'Q104', NULL, 'RAW HEMATITE PHANTOM QUARTZ POINT - EMF PROTECTOR', 20, 'hex', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured.Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, 3, 9, 'white', 'middle', b'0', '2023-03-05'),
(15, 2, 'Q105', NULL, 'NATURAL ANGEL AURA QUARTZ PENDANT, 925 STERLING SILVER PENDANT', 63, 'ellipse', 'Gemstone', '925 Sterling Silver Natural Angel Aura Quartz Gemstone Silver Pendant Handmade Fine Silver Jewelry', NULL, 9, 33, 'blue', 'small', b'0', '2023-03-05'),
(16, 2, 'Q106', NULL, 'BLUE GHOST PHANTOM QUARTZ CRYSTAL CLUSTER,QUARTZ CRYSTAL VUG', 40, 'crystal', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, 8, 29, 'white', 'middle', b'0', '2023-03-05'),
(17, 2, 'Q107', NULL, 'RAW ROSE QUARTZ, ETHICALLY SOURCED CRYSTALS, ECO-FRIENDLY PACKAGING', 6, 'crystal', 'stone', 'Rose Quartz is the crystal of unconditional love and infinite peace. It is said to promote deep inner healing and self-love, attract new loving relationships, and restore trust and harmony in existing relationships.', NULL, 3, 10, 'pink', 'middle', b'0', '2023-03-05'),
(18, 2, 'Q108', NULL, 'RARE GREEN GHOST PHANTOM,QUARTZ CRYSTAL SPECIMEN,CRYSTAL HEAL ', 11, 'ellipse', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it is normal for the difference.', NULL, 8, 24, 'green', 'small', b'0', '2023-03-05'),
(19, 2, 'Q109', NULL, 'ROSE QUARTZ ROSE FLOWER | PINK QUARTZ | LOVE STONE | - HEART CHAKRA', 30, 'crystal', 'Chakra', 'Beautiful Small Rose Quartz Crystal Rose,You will receive one intuitively chosen.', NULL, 3, 9, 'pink', 'middle', b'0', '2023-03-05'),
(20, 2, 'Q110', NULL, 'NATURAL BLUE GHOST PHANTOM,QUARTZ CRYSTAL SPECIMEN,CRYSTAL HEAL', 12, 'ellipse', 'stone', 'The ghost pendant likes water, soak it in water to make the color more vivid', NULL, 8, 27, 'blue', 'middle', b'0', '2023-03-05'),
(21, 3, 'D101', 'tiffany', 'BANGLE IN YELLOW GOLD WITH DIAMOND ACCENTS', 10000, '', 'Bracelets', 'No rules. All welcome. Inspired by the power of togetherness and inclusivity, Tiffany Lock is a bold and visual statement about the personal bonds that make us who we are. Designed to be worn by all genders, the Tiffany Lock bangle features an innovative clasp that echoes the functionality of a padlock, an important motif from The Tiffany Archives.', NULL, 3, 12, 'yellow', 'middle', b'0', '2023-03-05'),
(22, 3, 'D102', 'tiffany', 'BANGLE IN WHITE GOLD WITH FULL DIAMONDS', 32000, '', 'bracelets', 'No rules. All welcome. Inspired by the power of togetherness and inclusivity,Tiffany Lock is a bold and visual statement about the personal bonds that make us who we are.Designed to be worn by all genders, the Tiffany Lock bangle features an innovative clasp that echoes the functionality of a padlock, an important motif from The Tiffany Archives. ', NULL, 5, 21, 'white', 'middle', b'0', '2023-03-05'),
(23, 3, 'D103', 'tiffany', 'PENDANT PLATINUM WITH MARQUISE DIAMONDS', 14000, '', 'necklaces', 'Inspired by the fire and radiance of our superlative diamonds, Tiffany Victoria uses a unique combination of cuts for a distinctly romantic sensibility.The elegant simplicity of this pendant makes it as appropriate for day as it is for evening.', NULL, 4, 11, 'white', 'small', b'0', '2023-03-05'),
(24, 3, 'D104', 'swarovski', 'SWAROVSKI MILLENIA BRACELET, SMALL OCTAGON CUT CRYSTALS', 329, '', 'bracelet', 'The styling possibilities are infinite with this timeless bracelet. A modern silhouette, it expertly crafted from a row of octagon cut crystals cradled in a rhodium plated setting..Finished with a fine jewelry-inspired closure, it will complement any ensemble', NULL, 9, 34, 'white', 'middle', b'0', '2023-03-05'),
(25, 3, 'D105', 'tiffany', 'TENNIS BRACELET IN PLATINUM WITH DIAMONDS', 10000, '', 'bracelets', 'Inspired by the fire and radiance of our superlative diamonds,Tiffany Victoria uses a unique combination of cuts for a distinctly romantic sensibility. This feminine take on the classic line bracelet features a dazzling clasp of marquise diamonds.', NULL, 1, 5, 'white', 'small', b'0', '2023-03-05'),
(26, 3, 'D106', NULL, 'NATURAL LOOSE DIAMOND RAW ROUGH SILVER GREY COLOR I3 CLARITY 1+ CARAT Q95', 32, 'stone', 'raw', 'Natural Loose Diamond', NULL, 8, 27, 'white', 'small', b'0', '2023-03-05'),
(27, 3, 'D107', NULL, '5PCS GENUINE WHITE DIAMOND RAW GEMSTONE 10X12M12X14MM', 7, 'raw', 'stone', 'Wholesale Price 60% Sale for Natural Raw Diamond Rough Stone,5 Pieces White Crystal Diamond Nuggets-Herkimer diamond jewelry Crystal,Size is 10x12mm to 12x14mm Faceting Diamond Raw Gemstone ROCKS', NULL, 7, 18, 'white', 'small', b'0', '2023-03-05'),
(28, 3, 'D108', NULL, '1,5-2MM - 1CT (20-22PCS) ROUGH WHITE DIAMONDS, LOOSE DIAMOND', 22, 'raw', 'stone', '1,5-2mm - 1Ct (20-22pcs) Rough White Diamonds, Loose Diamond, Tiny Diamonds, Raw Diamonds, Uncut Diamond,Luster Diamond for Jewelry', NULL, 2, 6, 'white', 'small', b'0', '2023-03-05'),
(29, 3, 'D109', NULL, 'MOISSANITE ROUND LAB DIAMOND FACETED CUT 1MM- 4MM LOOSE STONE D-E', 10, 'crystal', 'stone', 'MOISSANITE ROUND DIAMOND FACETED CUT 1mm- 4mm LOOSE D-E WHITE COLOR VVS CLARITY', NULL, 8, 21, 'white', 'small', b'0', '2023-03-05'),
(30, 3, 'D110', NULL, 'DIAMOND TENNIS BRACELET, LOW PROFILE 4 PRONG, 1CT - 6CT, 14K SOLID WHITE YELLOW', 992, '', 'bracelet', 'HOLIDAY SPECIAL!, Diamond Tennis Bracelet, Low Profile 4 Prong,1ct - 6ct, 14k Solid White Yellow Rose Gold,Social Value makes the perfect gift for Birthdays Anniversaries Christmas Hanukkah', NULL, 10, 29, 'white', 'middle', b'0', '2023-03-05'),
(31, 4, 'E101', NULL, 'NATURAL GREEN EMERALD ZAMBIAN ROUGH LOOSE GEMSTONE GENUINE EMERALD', 20, 'raw', 'stone', 'Gemstone > Green Emerald\r\nTransparency: Translucent\r\nTreatment: Dyeing\r\nShape : Rough\r\nCountry of Origin: Zambian', NULL, 4, 15, 'green', 'small', b'0', '2023-03-05'),
(32, 4, 'E102', NULL, '12X16 MM ZAMBIA EMERALD OVAL RING STONE LOOSE GEMSTONE', 11, 'crystal', 'stone', 'If you need more sizes and shapes and stones which are not listed please let us know, we will make special listing for you.We also welcome wholesale orders and offer great discounts on wholesale quantities.', NULL, 8, 21, 'green', 'small', b'0', '2023-03-05'),
(33, 4, 'E103', NULL, 'FACETED ZAMBIAN EMERALD PENDANT 925 STERLING SILVER PENDANT REAL GEMSTONE', 12, '', 'earrings', 'Faceted Zambian Emerald Pendant 925 Sterling Silver Pendant Real Gemstone Pendant Handmade Pendant Gift For Bridal Beautiful Emerald Jewelry', NULL, 4, 11, 'green', 'small', b'1', '2023-03-05'),
(34, 4, 'E104', NULL, 'NATURAL COLOMBIA GREEN EMERALD 10.10 CT LOOSE GEMSTONE FOR RING', 12, 'hex', 'gemstone', 'We are Wholesale Supplier of all type of Gem Stones, precious, semiprecious stones.We also supply Gemstone as per your Requirement and Design.Weight, Design, Stones, Stones size can be changed as per requirement of buyer.', NULL, 2, 6, 'green', 'small', b'0', '2023-03-05'),
(35, 4, 'E105', NULL, 'TENNIS BRACELET ROUND CUT IN LAB CREATED EMERALD DIAMONDS', 479, '', 'bracelet', 'This Bracelet Can Be customized in your choice of shape, type, size, and color of diamond as per requirement, Please DM to customize.', NULL, 6, 22, 'green', 'middle', b'0', '2023-03-05'),
(36, 4, 'E106', NULL, 'BEAUTIFUL CERTIFIED UNCUT 75.85 CT PAIR COLOMBIA EMERALD', 42, 'raw', 'stone', 'Beautiful Certified Uncut 75.85 Ct pair Colombia Emerald Rough Loose Gemstone', NULL, 2, 7, 'green', 'middle', b'0', '2023-03-05'),
(37, 4, 'E107', NULL, 'EMERALD PENDANT COPPER WIRE WRAPPED PENDANT EMERALD GEMSTONE', 17, '', 'gemstone', 'Emerald Gemstone Copper Wire Wrapped Handmade Pendant,A copper I wrapped on a beautiful Emerald Gemstone .Size May Be slight Differ Than Shown In The Picture', NULL, 1, 4, 'green', 'middle', b'0', '2023-03-05'),
(38, 4, 'E108', NULL, 'ART DECO EMERALD GREEN EARRINGS, JADE GREEN BAGUETTE EARRINGS', 28, '', 'earrings', 'These beautiful, emerald green earrings are translucent lucite gems set in a delicate golden brass setting.They are a great deep jade jewel shade of green which is complimented with the deep gold tones of the brass settings.', NULL, 8, 29, 'green', 'small', b'0', '2023-03-05'),
(39, 4, 'E109', NULL, 'NATURAL EMERALD FACETED CUT MIX SHAPE 50 CARAT MINI MIXED LOT OVAL', 32, 'raw', 'gemstone', 'Natural Emerald Faceted Cut Mix Shape 50 Carat Mini Mixed Lot Oval & Emerald Shape Mixed Lot Loose Gemstones', NULL, 10, 36, 'green', 'small', b'0', '2023-03-05'),
(40, 4, 'E110', NULL, 'NATURAL EMERALD ROUGH STICK CORUNDUM COLOMBIAN UNCUT EMERALD GEMSTONE', 33, 'raw', 'gemstone', 'A natural, responsibly earth-mined Emerald with a dominant hue of Green color, cut into a Stick shape. This stone weighs 328 Carats.', NULL, 8, 28, 'green', 'big', b'0', '2023-03-05'),
(41, 4, 'E111', NULL, 'EMERALD RAW STONE LOT, NATURAL EMERALD ROUGH 10-20MM GOOD QUALITY ROUGH', 32, 'raw', 'stone', 'International buyers are notified that no import duties, taxes, or any other charges are included to the item price', NULL, 8, 24, 'green', 'small', b'0', '2023-03-05'),
(42, 5, 'J101', NULL, 'DAINTY JADE BEADED PENDANT NECKLACE, 14K GOLD GREEN JADE FRESHWATER PEARL CHOKER', 25, '', 'necklace', 'The circle of Jade is the means of holding back peace and keeping happiness.Round donuts mean to bring fortune and avoid evil spirits.', NULL, 3, 13, 'green', 'middle', b'0', '2023-03-05'),
(43, 5, 'J102', NULL, 'JADE TUMBLE STONE, GREEN JADE CRYSTAL UK, JADE HEALING STONE', 3, 'charka', 'stone', 'Jade Tumble Stone, Green Jade Crystal UK, Jade Healing Stone, L M S Gemstone For Good Luck, Libra and Taurus Birthstone, Heart Chakra', NULL, 1, 3, 'green', 'middle', b'0', '2023-03-05'),
(44, 5, 'J103', NULL, 'NATURAL REAL HETIAN ICY FLORAL JADE PENDANT, DIY STAR JADE BEADS', 5, '', 'gemstone', 'Elegant green bow gift box with a card including your message is available with few extra dollars. Please select at the check-out.', NULL, 8, 27, 'green', 'small', b'0', '2023-03-05'),
(45, 5, 'J104', NULL, 'VINTAGE HETIAN JADE BRACELET 8MM NATURAL GEMSTONE CHARM BRACELET HEALING', 14, '', 'bracelet', 'This is a Dainty Jade Bracelet , which can let your heart more clear and pure.It helps you to clear out those blockages that may have been holding you back.\r\n', NULL, 10, 37, 'green', 'middle', b'0', '2023-03-05'),
(46, 5, 'J105', NULL, 'REAL GREEN JADE DRAGON NECKLACE, CHINESE ZODIAC YEAR OF DRAGON CHARM', 16, '', 'gemstone', 'Dragon (pronounced as Long) is a mythical creature in both western and oriental cultures, whereas in China it symbolizes power and strength.', NULL, 5, 20, 'green', 'small', b'0', '2023-03-05'),
(47, 5, 'J106', NULL, 'JADE IS ONE OF THE OLDEST AND MOST IMPORTANT GEMSTONES', 5, '', 'gemstone', 'Jade is one of the oldest and most important gemstones, with a history dating over 7,000 years.It is especially prized throughout Chinese and Latin American cultures', NULL, 8, 20, 'green', 'small', b'0', '2023-03-05'),
(48, 5, 'J107', NULL, 'JADE DRAGON PENDANT | UNIQUE DRAGON CARVING NECKLACE PENDANT', 17, '', 'necklace', 'If you need more, we can give you a good discount! Dear friend, whatever question you encounter after purchase, please contact me, please believe I will give you the most satisfactory solution.', NULL, 9, 28, 'green', 'middle', b'0', '2023-03-05'),
(49, 5, 'J108', NULL, 'AFRICA JADE 30 MM ~ GEMSTONE DONUT NECKLACE ~HIPPIE ~GOA ~BOHO', 26, '', 'necklace', 'Gemstone Donut Necklace ~ Africa Jade ~ Incl. 2 mm in antique brown to knot.These new Africa Jade Donuts have a wonderful quality and an intense green - from Canada', NULL, 6, 19, 'green', 'small', b'0', '2023-03-05'),
(50, 5, 'J109', NULL, 'NATURAL RAW GREEN JADE CRYSTAL - RAW GREEN JADE STONE - RAW MAKING JEWELRY', 1, 'raw', 'stone', 'Natural Raw Green Jade Crystal - Raw Green Jade Stone - Raw Making Jewelry - Healing Crystal - Crystal Shop', NULL, 5, 18, 'green', 'small', b'0', '2023-03-05'),
(51, 5, 'J110', NULL, 'GREEN JADE RING, COPPER AND STAINLESS STEEL - HANDMADE - JADE RING', 77, '', 'ring', 'This ring is composed of a 304 stainless steel base, with an inlay made of green jade flakes and copper chips,which I personally select and insert one by one.', NULL, 5, 14, 'green', 'small', b'0', '2023-03-05'),
(52, 8, 'P101', 'pandora', 'SEA TURTLE CHARMS, ON A BLUE BUBBLE MURANO GLASS BEADS', 20, '', 'charms', 'Blue sea seems having a kind of magic and fascinating. Cute dolphin, fish, starfish, turtle,etc......... Do you like it?solid 925 sterling silver sea turtle charm beads.', NULL, 2, 7, 'blue', 'small', b'0', '2023-03-05'),
(53, 8, 'P102', 'pandora', 'CHORUSLOVE VALENTINES DAY CHARMS 925 STERLING SILVER ARROW OF CUPID', 18, '', 'charms', 'solid 925 sterling silver princess heart charm beads, pink heart gems surround by micro clear cz.Lead-free, Nickel-free, Cadmium-free and Hypoallergenic, 100% safe for sensitive skin.', NULL, 1, 2, 'purple', 'small', b'0', '2023-03-05'),
(54, 8, 'P103', 'pandora', 'STERLING SILVER VALENTINES DAY CHARMS HEART CHARMS, I LOVE YOU.', 12, '', 'charms', 'I love you moon and back means I love you more. As we all know, universe is so big, you can imagine how deep is the love.', NULL, 10, 36, 'blue', 'small', b'0', '2023-03-05'),
(55, 8, 'P104', 'pandora', 'STERLING SILVER VALENTINES DAY CHARMS HEART CHARMS, I LOVE YOU', 8, '', 'charms', 'I love you moon and back means I love you more. As we all know, universe is so big, you can imagine how deep is the love.', NULL, 4, 16, 'pink', 'small', b'0', '2023-03-05'),
(56, 8, 'P105', 'pandora', 'BLUE PANSY FLOWER STUD EARRINGS', 66, '', 'earrings', 'Colour your spring with our Blue Pansy Flower Stud Earrings. Hand-finished in sterling silver,each pansy features two petals covered in sparkling pavé and three petals hand-painted in shaded white and blue enamel.', NULL, 3, 8, 'pink', 'small', b'0', '2023-03-05'),
(57, 6, 'R101', 'swarovski', 'SWAROVSKI FLORERE GOLD-PLATED PINK FLOWER WOMEN IS NECKLACE', 1550, '', 'necklace', 'This wondrous Florere necklace becomes even more beautiful the closer you look. Crafted with a gold-tone plated setting, the pink design features five faceted petals artfully arranged around a central stone with a deeper hue.', NULL, 8, 24, 'pink', 'small', b'0', '2023-03-05'),
(58, 6, 'R102', NULL, 'PIGEON BLOOD NATURAL RUBY | OVAL CUT |1.42 CARATS | BURMA MINES', 1759, '', 'gemstone', 'Pigeon Blood Natural Ruby | Oval Cut |1.42 Carats | Burma Mines | No Heat Oval Shape Ruby.', NULL, 4, 13, 'red', 'small', b'0', '2023-03-05'),
(59, 6, 'R103', NULL, 'HANDMADE 100% GENUINE ROUGH PINK RUBY NECKLACE WITH AMAZING PINK COLOR AND GLOW', 32, '', 'necklace', '100% HANDMADE NATURAL HOT PINK RUBY EVERY DAY NECKLACE, ROUGH RUBY NECKLACE, MINIMALIST RUBY NECKLACE, RAW RUBY PENDANT, SOUTH AFRICA MINES.', NULL, 1, 4, 'pink', 'middle', b'1', '2023-03-05'),
(60, 6, 'R104', NULL, 'AAA QUALITY BURMESE PIGEON RED RUBY LOOSE GEMSTONE , OCTAGON SHAPE EMERALD', 45, 'hex', 'gemstone', 'PERSONALISATION : If you need more Sizes and Shapes and stones which are not listed please let us know, We will make special listing for you. We will also make the all the stones and sizes as per your requirement. We happily accept bulk and custom orders.', NULL, 10, 36, 'pink', 'small', b'0', '2023-03-05'),
(61, 6, 'R105', NULL, 'KASHMIR RED RUBY PENDANT COPPER WIRE WRAPPED GEMSTONE PENDANT', 19, '', 'gemstone', 'Kashmir Red Ruby Gemstone Copper Wire Wrapped Handmade Pendant,A copper I wrapped on a beautiful Kashmir Red Ruby Gemstone .', NULL, 2, 9, 'red', 'middle', b'0', '2023-03-05'),
(62, 6, 'R106', NULL, 'BLOOD-RED RUBY OVAL CUT GEMSTONE EGG SHAPE FACETED RUBY GEM MULTIPLE SIZES', 4, '', 'gemstone', 'Priced per 1 gemstone. You can select a size.These gemstones are made by fusing natural ruby raw ore powder.', NULL, 4, 17, 'red', 'small', b'0', '2023-03-05'),
(63, 6, 'R107', NULL, '14MM CUSHION SHAPE MOZAMBIQUE PIGEON RED RUBY LOOSE GEMSTONE', 36, 'hex', 'gemstone', 'PERSONALISATION : If you need more Sizes and Shapes and stones which are not listed please let us know, We will make special listing for you. We will also make the all the stones and sizes as per your requirement. We happily accept bulk and custom orders.', NULL, 10, 40, 'red', 'small', b'0', '2023-03-05'),
(64, 6, 'R108', NULL, 'GENUINE RUBY PENDANT, REAL RUBY NECKLACE, REAL RUBY PENDANT ', 30, '', 'necklace', 'Real Ruby Necklace with a Genuine Ruby Pendant! This Ruby gemstone Necklace is a July Birthstone Necklace!', NULL, 4, 15, 'red', 'small', b'0', '2023-03-05'),
(65, 6, 'R109', NULL, 'RAW RUBY CRYSTAL (1G TO 14G) GRADE AA - NATURAL RUBY STONE - RAW RUBY STONE', 3, 'raw', 'stone', 'Raw Ruby crystal (1g to 14g) grade AA - natural ruby stone - raw ruby stone - rough ruby stone - healing crystals and stones heart chakra.', NULL, 1, 4, 'red', 'small', b'0', '2023-03-05'),
(66, 6, 'R110', NULL, 'NATURAL BURMA RUBY ROUGH GEMSTONE LOT (DYED)', 5, 'raw', 'stone', 'Raw Ruby grade AA - natural ruby stone - raw ruby stone - rough ruby stone - healing crystals and stones heart chakra.', NULL, 1, 3, 'red', 'small', b'0', '2023-03-05'),
(67, 7, 'S101', 'tiffany', 'COLOR BY THE YARD EARRINGS', 1550, '', 'earrings', 'Platinum with round sapphires Carat total weight .22 Original designs copyrighted by Elsa Peretti.', NULL, 7, 25, 'blue', 'small', b'0', '2023-03-05'),
(68, 7, 'S102', 'tiffany', 'COLOR BY THE YARD SAPPHIRE BRACELET', 975, '', 'bracelet', 'Bracelet in platinum with a sapphire.Platinum with a round sapphire, 7\" long, Carat weight .11', NULL, 2, 7, 'blue', 'small', b'0', '2023-03-05'),
(69, 7, 'S103', 'swarovski', 'SWAROVSKI SPARKING DANCE CRYSTAL NECKLACE AND EARRING SET JEWELRY', 250, '', 'necklaces', 'These mini hoop earrings celebrate the treasured Swarovski star emblem,inspired by the magic of Austrian scenery.', NULL, 7, 23, 'blue', 'small', b'0', '2023-03-05'),
(70, 7, 'S104', 'tiffany', 'COLOR BY THE YARD PENDANT', 1990, '', 'necklaces', 'The Elsa Peretti® Color by the Yard collection features bezel-set stones that shimmer against the skin.Platinum with a round sapphire.', NULL, 6, 21, 'blue', 'small', b'0', '2023-03-05'),
(71, 7, 'S105', 'swarovski', 'SWAROVSKI SYMBOLIC EVIL EYE PENDANT NECKLACE', 145, '', 'necklaces', 'This timeless necklace will work wonders with your everyday wardrobe.Suspended on a modern rhodium-plated chain, it features a beautiful.', NULL, 8, 31, 'blue', 'small', b'0', '2023-03-05'),
(72, 7, 'S106', 'swarovski', 'BLUE SAPPHIRE ROUND SHAPE CUT FACETED LOOSE GEMSTONE SIZE', 115, '', 'necklaces', 'The mixed-plated Duo Pendant Evil Eye adds a mystic touch to any look.It features one eye motif in blue, black, and clear crystal pave and one in rose gold-plated metal.', NULL, 2, 7, 'blue', 'small', b'0', '2023-03-05'),
(73, 7, 'S107', NULL, 'BLUE SAPPHIRE ROUND FACETED CUT LOOSE CERTIFIED GEMSTONE UNTREATED LOT', 3, 'crystal', 'gemstone', 'If you cannot find the GemStone of your dreams, give us a chance.We are able to offer custom cut Stones based on any facet diagram or image that you provide.', NULL, 7, 24, 'blue', 'small', b'0', '2023-03-05'),
(74, 7, 'S108', NULL, 'NATURAL STAR SAPPHIRE OVAL CUT STONES, AAA QUALITY LOOSE SAPPHIRE STONE', 2, 'crystal', 'gemstone', 'Natural Blue Sapphire Round Faceted Cut Loose Gemstone.', NULL, 8, 27, 'blue', 'small', b'0', '2023-03-05'),
(75, 7, 'S109', NULL, 'CALIBRATED SIZES OF NATURAL STAR SAPPHIRE GEMSTONES LOOSE GEMS', 28, 'crystal', 'gemstone', 'RANDOMLY Select from the Lot - AAA Quality Sapphire.', NULL, 9, 32, 'blue', 'small', b'0', '2023-03-05'),
(76, 7, 'S110', NULL, 'HUGE FLAWLESS 47.75 CT NATURAL BI-COLOR PINK BLUE SAPPHIRE PRECIOUS LOOSE GEMSTONE.', 322, 'crystal', 'gemstone', 'HUGE Flawless 47.75 Ct Natural Bi-Color Pink Blue Sapphire Precious Loose Gemstone GIT Certified Ovel Cut Stunning , HeartTouching Gemstone.', NULL, 6, 22, 'blue', 'middle', b'0', '2023-03-05'),
(77, 7, 'S111', NULL, 'EXTRA LARGE NATURAL BLUE SAPPHIRE RAW/BLUE SAPPHIRE ROUGH', 6, 'raw', 'gemstone', 'Large Blue Sapphire Raw(Fracture Filled),Blue Sapphire Rough Stone.', NULL, 5, 15, 'blue', 'small', b'0', '2023-03-05'),
(78, 2, 'SE101', NULL, 'ALL SIZES ROSE QUARTZ SPHERE, LARGE ROSE QUARTZ SPHERE', 9, 'sphere', 'stone', 'A beautiful rose quartz crystal sphere, intuitively chosen for you.Did you know rose quartz is regarded as the unconditional love stone?', NULL, 1, 5, 'pink', 'big', b'0', '2023-03-05'),
(79, 2, 'SE102', NULL, '50MM+ NATURAL RED ZOISITE BALL，CRYSTAL SPHERE，QUARTZ CRYSTAL BALL', 24, 'sphere', 'stone', 'This product requires the use of ultraviolet light to see the color change.', NULL, 3, 11, 'red', 'middle', b'0', '2023-03-05'),
(80, 2, 'SE103', NULL, 'NATURAL CLEAR SPHERE,QUARTZ CRYSTAL BALL,MINERAL SPECIMEN,ROCK,REIKI HEALING', 86, 'sphere', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it normal fr the difference', NULL, 3, 8, 'white', 'big', b'0', '2023-03-05'),
(81, 2, 'SE104', NULL, '1PC 55MM+ NATURAL SODALITE BALL，CRYSTAL SPHERE，QUARTZ CRYSTAL BALL', 21, 'sphere', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it is normal fr the difference.', NULL, 4, 14, 'blue', 'middle', b'0', '2023-03-05'),
(82, 8, 'SE105', NULL, 'LARGE BLUE APATITE CRYSTAL BALL - BLUE APATITE SPHERE - CRYSTAL BALL HEALING', 20, 'sphere', 'stone', 'Large Blue Apatite Crystal Ball - Blue Apatite Sphere - Crystal Ball Healing - Stone Decor Feng Shui 45-65mm.', NULL, 5, 18, 'blue', 'big', b'0', '2023-03-05'),
(83, 1, 'SE106', NULL, '1PC NATURAL AMTHYST SPHERE ORNAMENT,HIGH QUALITY CRYSTAL SPHERE', 8, 'sphere', 'stone', 'Welcome to my shop, Im a designer and gemstone lover with a passion for decorating homes with gemstones.', NULL, 7, 20, 'purple', 'big', b'0', '2023-03-05'),
(84, 2, 'SE107', NULL, 'ONE BLUE MELTING STONE SPHERE,QUARTZ CRYSTAL BALL,HOME DECORATION', 17, 'sphere', 'stone', 'This product requires the use of ultraviolet light to see the color change.', NULL, 5, 15, 'blue', 'middle', b'0', '2023-03-05'),
(85, 2, 'SE108', NULL, '2.4\" FLAKY CLEAR QUARTZ SPHERE, CRYSTAL BALL, NATURAL CRYSTAL SPHERE', 22, 'sphere', 'stone', 'The sphere form signifies the emanation of energy from within. Clear quartz is one of its strong protective types.It dissipates negative energy and clears it away.', NULL, 8, 29, 'white', 'middle', b'0', '2023-03-05');

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
  `email` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vote_rating` int(11) NOT NULL,
  `comments` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vote_product`
--

INSERT INTO `vote_product` (`email`, `product_id`, `vote_rating`, `comments`) VALUES
('email1@gmail.com', 1, 5, 'Good product'),
('email10@gmail.com', 4, 2, 'Bad product'),
('email100@gmail.com', 20, 3, 'Normal product'),
('email101@gmail.com', 20, 3, 'Normal product'),
('email102@gmail.com', 20, 4, 'Good product'),
('email103@gmail.com', 20, 4, 'Good product'),
('email104@gmail.com', 20, 2, 'Bad product'),
('email105@gmail.com', 20, 3, 'Normal product'),
('email106@gmail.com', 20, 4, 'Good product'),
('email107@gmail.com', 21, 5, 'Good product'),
('email108@gmail.com', 21, 5, 'Good product'),
('email109@gmail.com', 21, 2, 'Bad product'),
('email11@gmail.com', 4, 2, 'Bad product'),
('email110@gmail.com', 22, 5, 'Good product'),
('email111@gmail.com', 22, 3, 'Normal product'),
('email112@gmail.com', 22, 5, 'Good product'),
('email113@gmail.com', 22, 5, 'Good product'),
('email114@gmail.com', 22, 3, 'Normal product'),
('email115@gmail.com', 23, 2, 'Bad product'),
('email116@gmail.com', 23, 2, 'Bad product'),
('email117@gmail.com', 23, 3, 'Normal product'),
('email118@gmail.com', 23, 4, 'Good product'),
('email119@gmail.com', 24, 5, 'Good product'),
('email12@gmail.com', 4, 4, 'Good product'),
('email120@gmail.com', 24, 2, 'Bad product'),
('email121@gmail.com', 24, 5, 'Good product'),
('email122@gmail.com', 24, 5, 'Good product'),
('email123@gmail.com', 24, 4, 'Good product'),
('email124@gmail.com', 24, 2, 'Bad product'),
('email125@gmail.com', 24, 4, 'Good product'),
('email126@gmail.com', 24, 4, 'Good product'),
('email127@gmail.com', 24, 3, 'Normal product'),
('email128@gmail.com', 25, 5, 'Good product'),
('email129@gmail.com', 26, 5, 'Good product'),
('email13@gmail.com', 4, 2, 'Bad product'),
('email130@gmail.com', 26, 2, 'Bad product'),
('email131@gmail.com', 26, 4, 'Good product'),
('email132@gmail.com', 26, 2, 'Bad product'),
('email133@gmail.com', 26, 2, 'Bad product'),
('email134@gmail.com', 26, 4, 'Good product'),
('email135@gmail.com', 26, 3, 'Normal product'),
('email136@gmail.com', 26, 5, 'Good product'),
('email137@gmail.com', 27, 2, 'Bad product'),
('email138@gmail.com', 27, 2, 'Bad product'),
('email139@gmail.com', 27, 2, 'Bad product'),
('email14@gmail.com', 4, 5, 'Good product'),
('email140@gmail.com', 27, 3, 'Normal product'),
('email141@gmail.com', 27, 3, 'Normal product'),
('email142@gmail.com', 27, 2, 'Bad product'),
('email143@gmail.com', 27, 4, 'Good product'),
('email144@gmail.com', 28, 4, 'Good product'),
('email145@gmail.com', 28, 2, 'Bad product'),
('email146@gmail.com', 29, 2, 'Bad product'),
('email147@gmail.com', 29, 2, 'Bad product'),
('email148@gmail.com', 29, 2, 'Bad product'),
('email149@gmail.com', 29, 2, 'Bad product'),
('email15@gmail.com', 4, 3, 'Normal product'),
('email150@gmail.com', 29, 2, 'Bad product'),
('email151@gmail.com', 29, 5, 'Good product'),
('email152@gmail.com', 29, 2, 'Bad product'),
('email153@gmail.com', 29, 4, 'Good product'),
('email154@gmail.com', 30, 4, 'Good product'),
('email155@gmail.com', 30, 4, 'Good product'),
('email156@gmail.com', 30, 2, 'Bad product'),
('email157@gmail.com', 30, 3, 'Normal product'),
('email158@gmail.com', 30, 2, 'Bad product'),
('email159@gmail.com', 30, 3, 'Normal product'),
('email16@gmail.com', 4, 4, 'Good product'),
('email160@gmail.com', 30, 2, 'Bad product'),
('email161@gmail.com', 30, 2, 'Bad product'),
('email162@gmail.com', 30, 3, 'Normal product'),
('email163@gmail.com', 30, 4, 'Good product'),
('email164@gmail.com', 31, 3, 'Normal product'),
('email165@gmail.com', 31, 3, 'Normal product'),
('email166@gmail.com', 31, 4, 'Good product'),
('email167@gmail.com', 31, 5, 'Good product'),
('email168@gmail.com', 32, 2, 'Bad product'),
('email169@gmail.com', 32, 3, 'Normal product'),
('email17@gmail.com', 5, 4, 'Good product'),
('email170@gmail.com', 32, 2, 'Bad product'),
('email171@gmail.com', 32, 3, 'Normal product'),
('email172@gmail.com', 32, 3, 'Normal product'),
('email173@gmail.com', 32, 2, 'Bad product'),
('email174@gmail.com', 32, 3, 'Normal product'),
('email175@gmail.com', 32, 3, 'Normal product'),
('email176@gmail.com', 33, 2, 'Bad product'),
('email177@gmail.com', 33, 5, 'Good product'),
('email178@gmail.com', 33, 2, 'Bad product'),
('email179@gmail.com', 33, 2, 'Bad product'),
('email18@gmail.com', 5, 4, 'Good product'),
('email180@gmail.com', 34, 2, 'Bad product'),
('email181@gmail.com', 34, 4, 'Good product'),
('email182@gmail.com', 35, 5, 'Good product'),
('email183@gmail.com', 35, 4, 'Good product'),
('email184@gmail.com', 35, 2, 'Bad product'),
('email185@gmail.com', 35, 5, 'Good product'),
('email186@gmail.com', 35, 2, 'Bad product'),
('email187@gmail.com', 35, 4, 'Good product'),
('email188@gmail.com', 36, 4, 'Good product'),
('email189@gmail.com', 36, 3, 'Normal product'),
('email19@gmail.com', 5, 4, 'Good product'),
('email190@gmail.com', 37, 4, 'Good product'),
('email191@gmail.com', 38, 5, 'Good product'),
('email192@gmail.com', 38, 2, 'Bad product'),
('email193@gmail.com', 38, 4, 'Good product'),
('email194@gmail.com', 38, 4, 'Good product'),
('email195@gmail.com', 38, 3, 'Normal product'),
('email196@gmail.com', 38, 4, 'Good product'),
('email197@gmail.com', 38, 5, 'Good product'),
('email198@gmail.com', 38, 2, 'Bad product'),
('email199@gmail.com', 39, 4, 'Good product'),
('email2@gmail.com', 1, 3, 'Normal product'),
('email20@gmail.com', 5, 5, 'Good product'),
('email200@gmail.com', 39, 2, 'Bad product'),
('email201@gmail.com', 39, 5, 'Good product'),
('email202@gmail.com', 39, 3, 'Normal product'),
('email203@gmail.com', 39, 5, 'Good product'),
('email204@gmail.com', 39, 4, 'Good product'),
('email205@gmail.com', 39, 4, 'Good product'),
('email206@gmail.com', 39, 5, 'Good product'),
('email207@gmail.com', 39, 2, 'Bad product'),
('email208@gmail.com', 39, 2, 'Bad product'),
('email209@gmail.com', 40, 5, 'Good product'),
('email21@gmail.com', 5, 5, 'Good product'),
('email210@gmail.com', 40, 4, 'Good product'),
('email211@gmail.com', 40, 4, 'Good product'),
('email212@gmail.com', 40, 4, 'Good product'),
('email213@gmail.com', 40, 2, 'Bad product'),
('email214@gmail.com', 40, 4, 'Good product'),
('email215@gmail.com', 40, 3, 'Normal product'),
('email216@gmail.com', 40, 2, 'Bad product'),
('email217@gmail.com', 41, 2, 'Bad product'),
('email218@gmail.com', 41, 3, 'Normal product'),
('email219@gmail.com', 41, 2, 'Bad product'),
('email22@gmail.com', 5, 2, 'Bad product'),
('email220@gmail.com', 41, 2, 'Bad product'),
('email221@gmail.com', 41, 5, 'Good product'),
('email222@gmail.com', 41, 4, 'Good product'),
('email223@gmail.com', 41, 3, 'Normal product'),
('email224@gmail.com', 41, 3, 'Normal product'),
('email225@gmail.com', 42, 5, 'Good product'),
('email226@gmail.com', 42, 3, 'Normal product'),
('email227@gmail.com', 42, 5, 'Good product'),
('email228@gmail.com', 43, 3, 'Normal product'),
('email229@gmail.com', 44, 5, 'Good product'),
('email23@gmail.com', 6, 2, 'Bad product'),
('email230@gmail.com', 44, 2, 'Bad product'),
('email231@gmail.com', 44, 4, 'Good product'),
('email232@gmail.com', 44, 2, 'Bad product'),
('email233@gmail.com', 44, 2, 'Bad product'),
('email234@gmail.com', 44, 2, 'Bad product'),
('email235@gmail.com', 44, 5, 'Good product'),
('email236@gmail.com', 44, 5, 'Good product'),
('email237@gmail.com', 45, 3, 'Normal product'),
('email238@gmail.com', 45, 3, 'Normal product'),
('email239@gmail.com', 45, 3, 'Normal product'),
('email24@gmail.com', 6, 2, 'Bad product'),
('email240@gmail.com', 45, 2, 'Bad product'),
('email241@gmail.com', 45, 5, 'Good product'),
('email242@gmail.com', 45, 5, 'Good product'),
('email243@gmail.com', 45, 4, 'Good product'),
('email244@gmail.com', 45, 4, 'Good product'),
('email245@gmail.com', 45, 5, 'Good product'),
('email246@gmail.com', 45, 3, 'Normal product'),
('email247@gmail.com', 46, 2, 'Bad product'),
('email248@gmail.com', 46, 4, 'Good product'),
('email249@gmail.com', 46, 5, 'Good product'),
('email25@gmail.com', 6, 4, 'Good product'),
('email250@gmail.com', 46, 4, 'Good product'),
('email251@gmail.com', 46, 5, 'Good product'),
('email252@gmail.com', 47, 3, 'Normal product'),
('email253@gmail.com', 47, 2, 'Bad product'),
('email254@gmail.com', 47, 4, 'Good product'),
('email255@gmail.com', 47, 3, 'Normal product'),
('email256@gmail.com', 47, 2, 'Bad product'),
('email257@gmail.com', 47, 2, 'Bad product'),
('email258@gmail.com', 47, 2, 'Bad product'),
('email259@gmail.com', 47, 2, 'Bad product'),
('email26@gmail.com', 6, 3, 'Normal product'),
('email260@gmail.com', 48, 3, 'Normal product'),
('email261@gmail.com', 48, 5, 'Good product'),
('email262@gmail.com', 48, 5, 'Good product'),
('email263@gmail.com', 48, 2, 'Bad product'),
('email264@gmail.com', 48, 2, 'Bad product'),
('email265@gmail.com', 48, 5, 'Good product'),
('email266@gmail.com', 48, 2, 'Bad product'),
('email267@gmail.com', 48, 2, 'Bad product'),
('email268@gmail.com', 48, 2, 'Bad product'),
('email269@gmail.com', 49, 2, 'Bad product'),
('email27@gmail.com', 7, 4, 'Good product'),
('email270@gmail.com', 49, 3, 'Normal product'),
('email271@gmail.com', 49, 4, 'Good product'),
('email272@gmail.com', 49, 3, 'Normal product'),
('email273@gmail.com', 49, 3, 'Normal product'),
('email274@gmail.com', 49, 4, 'Good product'),
('email275@gmail.com', 50, 5, 'Good product'),
('email276@gmail.com', 50, 3, 'Normal product'),
('email277@gmail.com', 50, 2, 'Bad product'),
('email278@gmail.com', 50, 3, 'Normal product'),
('email279@gmail.com', 50, 5, 'Good product'),
('email28@gmail.com', 7, 5, 'Good product'),
('email280@gmail.com', 51, 3, 'Normal product'),
('email281@gmail.com', 51, 2, 'Bad product'),
('email282@gmail.com', 51, 4, 'Good product'),
('email283@gmail.com', 51, 2, 'Bad product'),
('email284@gmail.com', 51, 3, 'Normal product'),
('email285@gmail.com', 52, 2, 'Bad product'),
('email286@gmail.com', 52, 5, 'Good product'),
('email287@gmail.com', 53, 2, 'Bad product'),
('email288@gmail.com', 54, 4, 'Good product'),
('email289@gmail.com', 54, 4, 'Good product'),
('email29@gmail.com', 7, 5, 'Good product'),
('email290@gmail.com', 54, 4, 'Good product'),
('email291@gmail.com', 54, 3, 'Normal product'),
('email292@gmail.com', 54, 4, 'Good product'),
('email293@gmail.com', 54, 2, 'Bad product'),
('email294@gmail.com', 54, 5, 'Good product'),
('email295@gmail.com', 54, 3, 'Normal product'),
('email296@gmail.com', 54, 5, 'Good product'),
('email297@gmail.com', 54, 2, 'Bad product'),
('email298@gmail.com', 55, 5, 'Good product'),
('email299@gmail.com', 55, 4, 'Good product'),
('email3@gmail.com', 1, 3, 'Normal product'),
('email30@gmail.com', 7, 2, 'Bad product'),
('email300@gmail.com', 55, 3, 'Normal product'),
('email301@gmail.com', 55, 4, 'Good product'),
('email302@gmail.com', 56, 3, 'Normal product'),
('email303@gmail.com', 56, 3, 'Normal product'),
('email304@gmail.com', 56, 2, 'Bad product'),
('email305@gmail.com', 57, 4, 'Good product'),
('email306@gmail.com', 57, 3, 'Normal product'),
('email307@gmail.com', 57, 3, 'Normal product'),
('email308@gmail.com', 57, 2, 'Bad product'),
('email309@gmail.com', 57, 2, 'Bad product'),
('email31@gmail.com', 7, 2, 'Bad product'),
('email310@gmail.com', 57, 5, 'Good product'),
('email311@gmail.com', 57, 2, 'Bad product'),
('email312@gmail.com', 57, 3, 'Normal product'),
('email313@gmail.com', 58, 5, 'Good product'),
('email314@gmail.com', 58, 3, 'Normal product'),
('email315@gmail.com', 58, 2, 'Bad product'),
('email316@gmail.com', 58, 3, 'Normal product'),
('email317@gmail.com', 59, 4, 'Good product'),
('email318@gmail.com', 60, 4, 'Good product'),
('email319@gmail.com', 60, 5, 'Good product'),
('email32@gmail.com', 7, 4, 'Good product'),
('email320@gmail.com', 60, 5, 'Good product'),
('email321@gmail.com', 60, 3, 'Normal product'),
('email322@gmail.com', 60, 2, 'Bad product'),
('email323@gmail.com', 60, 4, 'Good product'),
('email324@gmail.com', 60, 5, 'Good product'),
('email325@gmail.com', 60, 3, 'Normal product'),
('email326@gmail.com', 60, 2, 'Bad product'),
('email327@gmail.com', 60, 3, 'Normal product'),
('email328@gmail.com', 61, 5, 'Good product'),
('email329@gmail.com', 61, 4, 'Good product'),
('email33@gmail.com', 7, 2, 'Bad product'),
('email330@gmail.com', 62, 5, 'Good product'),
('email331@gmail.com', 62, 5, 'Good product'),
('email332@gmail.com', 62, 5, 'Good product'),
('email333@gmail.com', 62, 2, 'Bad product'),
('email334@gmail.com', 63, 5, 'Good product'),
('email335@gmail.com', 63, 5, 'Good product'),
('email336@gmail.com', 63, 5, 'Good product'),
('email337@gmail.com', 63, 5, 'Good product'),
('email338@gmail.com', 63, 3, 'Normal product'),
('email339@gmail.com', 63, 3, 'Normal product'),
('email34@gmail.com', 8, 2, 'Bad product'),
('email340@gmail.com', 63, 4, 'Good product'),
('email341@gmail.com', 63, 4, 'Good product'),
('email342@gmail.com', 63, 2, 'Bad product'),
('email343@gmail.com', 63, 4, 'Good product'),
('email344@gmail.com', 64, 2, 'Bad product'),
('email345@gmail.com', 64, 4, 'Good product'),
('email346@gmail.com', 64, 5, 'Good product'),
('email347@gmail.com', 64, 4, 'Good product'),
('email348@gmail.com', 65, 4, 'Good product'),
('email349@gmail.com', 66, 3, 'Normal product'),
('email35@gmail.com', 8, 4, 'Good product'),
('email350@gmail.com', 67, 2, 'Bad product'),
('email351@gmail.com', 67, 5, 'Good product'),
('email352@gmail.com', 67, 3, 'Normal product'),
('email353@gmail.com', 67, 4, 'Good product'),
('email354@gmail.com', 67, 4, 'Good product'),
('email355@gmail.com', 67, 4, 'Good product'),
('email356@gmail.com', 67, 3, 'Normal product'),
('email357@gmail.com', 68, 4, 'Good product'),
('email358@gmail.com', 68, 3, 'Normal product'),
('email359@gmail.com', 69, 5, 'Good product'),
('email36@gmail.com', 8, 3, 'Normal product'),
('email360@gmail.com', 69, 3, 'Normal product'),
('email361@gmail.com', 69, 3, 'Normal product'),
('email362@gmail.com', 69, 2, 'Bad product'),
('email363@gmail.com', 69, 3, 'Normal product'),
('email364@gmail.com', 69, 4, 'Good product'),
('email365@gmail.com', 69, 3, 'Normal product'),
('email366@gmail.com', 70, 4, 'Good product'),
('email367@gmail.com', 70, 4, 'Good product'),
('email368@gmail.com', 70, 4, 'Good product'),
('email369@gmail.com', 70, 2, 'Bad product'),
('email37@gmail.com', 9, 5, 'Good product'),
('email370@gmail.com', 70, 3, 'Normal product'),
('email371@gmail.com', 70, 4, 'Good product'),
('email372@gmail.com', 71, 5, 'Good product'),
('email373@gmail.com', 71, 5, 'Good product'),
('email374@gmail.com', 71, 3, 'Normal product'),
('email375@gmail.com', 71, 5, 'Good product'),
('email376@gmail.com', 71, 5, 'Good product'),
('email377@gmail.com', 71, 3, 'Normal product'),
('email378@gmail.com', 71, 2, 'Bad product'),
('email379@gmail.com', 71, 3, 'Normal product'),
('email38@gmail.com', 9, 5, 'Good product'),
('email380@gmail.com', 72, 4, 'Good product'),
('email381@gmail.com', 72, 3, 'Normal product'),
('email382@gmail.com', 73, 5, 'Good product'),
('email383@gmail.com', 73, 2, 'Bad product'),
('email384@gmail.com', 73, 4, 'Good product'),
('email385@gmail.com', 73, 4, 'Good product'),
('email386@gmail.com', 73, 2, 'Bad product'),
('email387@gmail.com', 73, 4, 'Good product'),
('email388@gmail.com', 73, 3, 'Normal product'),
('email389@gmail.com', 74, 4, 'Good product'),
('email39@gmail.com', 9, 5, 'Good product'),
('email390@gmail.com', 74, 2, 'Bad product'),
('email391@gmail.com', 74, 2, 'Bad product'),
('email392@gmail.com', 74, 4, 'Good product'),
('email393@gmail.com', 74, 2, 'Bad product'),
('email394@gmail.com', 74, 3, 'Normal product'),
('email395@gmail.com', 74, 5, 'Good product'),
('email396@gmail.com', 74, 5, 'Good product'),
('email397@gmail.com', 75, 5, 'Good product'),
('email398@gmail.com', 75, 2, 'Bad product'),
('email399@gmail.com', 75, 5, 'Good product'),
('email4@gmail.com', 2, 2, 'Bad product'),
('email40@gmail.com', 9, 2, 'Bad product'),
('email400@gmail.com', 75, 3, 'Normal product'),
('email401@gmail.com', 75, 4, 'Good product'),
('email402@gmail.com', 75, 3, 'Normal product'),
('email403@gmail.com', 75, 3, 'Normal product'),
('email404@gmail.com', 75, 3, 'Normal product'),
('email405@gmail.com', 75, 4, 'Good product'),
('email406@gmail.com', 76, 4, 'Good product'),
('email407@gmail.com', 76, 4, 'Good product'),
('email408@gmail.com', 76, 3, 'Normal product'),
('email409@gmail.com', 76, 4, 'Good product'),
('email41@gmail.com', 9, 5, 'Good product'),
('email410@gmail.com', 76, 4, 'Good product'),
('email411@gmail.com', 76, 3, 'Normal product'),
('email412@gmail.com', 77, 2, 'Bad product'),
('email413@gmail.com', 77, 4, 'Good product'),
('email414@gmail.com', 77, 3, 'Normal product'),
('email415@gmail.com', 77, 4, 'Good product'),
('email416@gmail.com', 77, 2, 'Bad product'),
('email417@gmail.com', 78, 5, 'Good product'),
('email418@gmail.com', 79, 4, 'Good product'),
('email419@gmail.com', 79, 2, 'Bad product'),
('email42@gmail.com', 9, 3, 'Normal product'),
('email420@gmail.com', 79, 5, 'Good product'),
('email421@gmail.com', 80, 3, 'Normal product'),
('email422@gmail.com', 80, 2, 'Bad product'),
('email423@gmail.com', 80, 3, 'Normal product'),
('email424@gmail.com', 81, 2, 'Bad product'),
('email425@gmail.com', 81, 5, 'Good product'),
('email426@gmail.com', 81, 3, 'Normal product'),
('email427@gmail.com', 81, 4, 'Good product'),
('email428@gmail.com', 82, 3, 'Normal product'),
('email429@gmail.com', 82, 2, 'Bad product'),
('email43@gmail.com', 9, 4, 'Good product'),
('email430@gmail.com', 82, 5, 'Good product'),
('email431@gmail.com', 82, 4, 'Good product'),
('email432@gmail.com', 82, 4, 'Good product'),
('email433@gmail.com', 83, 3, 'Normal product'),
('email434@gmail.com', 83, 3, 'Normal product'),
('email435@gmail.com', 83, 2, 'Bad product'),
('email436@gmail.com', 83, 4, 'Good product'),
('email437@gmail.com', 83, 3, 'Normal product'),
('email438@gmail.com', 83, 3, 'Normal product'),
('email439@gmail.com', 83, 2, 'Bad product'),
('email44@gmail.com', 9, 2, 'Bad product'),
('email440@gmail.com', 84, 4, 'Good product'),
('email441@gmail.com', 84, 2, 'Bad product'),
('email442@gmail.com', 84, 2, 'Bad product'),
('email443@gmail.com', 84, 5, 'Good product'),
('email444@gmail.com', 84, 2, 'Bad product'),
('email445@gmail.com', 85, 4, 'Good product'),
('email446@gmail.com', 85, 5, 'Good product'),
('email447@gmail.com', 85, 5, 'Good product'),
('email448@gmail.com', 85, 4, 'Good product'),
('email449@gmail.com', 85, 2, 'Bad product'),
('email45@gmail.com', 9, 5, 'Good product'),
('email450@gmail.com', 85, 3, 'Normal product'),
('email451@gmail.com', 85, 2, 'Bad product'),
('email452@gmail.com', 85, 4, 'Good product'),
('email46@gmail.com', 10, 2, 'Bad product'),
('email47@gmail.com', 10, 3, 'Normal product'),
('email48@gmail.com', 10, 3, 'Normal product'),
('email49@gmail.com', 10, 2, 'Bad product'),
('email5@gmail.com', 3, 4, 'Good product'),
('email50@gmail.com', 10, 4, 'Good product'),
('email51@gmail.com', 10, 3, 'Normal product'),
('email52@gmail.com', 10, 5, 'Good product'),
('email53@gmail.com', 10, 3, 'Normal product'),
('email54@gmail.com', 11, 2, 'Bad product'),
('email55@gmail.com', 11, 5, 'Good product'),
('email56@gmail.com', 11, 5, 'Good product'),
('email57@gmail.com', 11, 3, 'Normal product'),
('email58@gmail.com', 11, 2, 'Bad product'),
('email59@gmail.com', 12, 3, 'Normal product'),
('email6@gmail.com', 3, 5, 'Good product'),
('email60@gmail.com', 12, 3, 'Normal product'),
('email61@gmail.com', 12, 4, 'Good product'),
('email62@gmail.com', 12, 5, 'Good product'),
('email63@gmail.com', 13, 5, 'Good product'),
('email64@gmail.com', 13, 4, 'Good product'),
('email65@gmail.com', 14, 4, 'Good product'),
('email66@gmail.com', 14, 2, 'Bad product'),
('email67@gmail.com', 14, 3, 'Normal product'),
('email68@gmail.com', 15, 4, 'Good product'),
('email69@gmail.com', 15, 2, 'Bad product'),
('email7@gmail.com', 4, 4, 'Good product'),
('email70@gmail.com', 15, 5, 'Good product'),
('email71@gmail.com', 15, 3, 'Normal product'),
('email72@gmail.com', 15, 4, 'Good product'),
('email73@gmail.com', 15, 3, 'Normal product'),
('email74@gmail.com', 15, 3, 'Normal product'),
('email75@gmail.com', 15, 5, 'Good product'),
('email76@gmail.com', 15, 4, 'Good product'),
('email77@gmail.com', 16, 2, 'Bad product'),
('email78@gmail.com', 16, 5, 'Good product'),
('email79@gmail.com', 16, 2, 'Bad product'),
('email8@gmail.com', 4, 2, 'Bad product'),
('email80@gmail.com', 16, 5, 'Good product'),
('email81@gmail.com', 16, 3, 'Normal product'),
('email82@gmail.com', 16, 5, 'Good product'),
('email83@gmail.com', 16, 2, 'Bad product'),
('email84@gmail.com', 16, 5, 'Good product'),
('email85@gmail.com', 17, 5, 'Good product'),
('email86@gmail.com', 17, 2, 'Bad product'),
('email87@gmail.com', 17, 3, 'Normal product'),
('email88@gmail.com', 18, 3, 'Normal product'),
('email89@gmail.com', 18, 2, 'Bad product'),
('email9@gmail.com', 4, 2, 'Bad product'),
('email90@gmail.com', 18, 2, 'Bad product'),
('email91@gmail.com', 18, 4, 'Good product'),
('email92@gmail.com', 18, 2, 'Bad product'),
('email93@gmail.com', 18, 5, 'Good product'),
('email94@gmail.com', 18, 4, 'Good product'),
('email95@gmail.com', 18, 2, 'Bad product'),
('email96@gmail.com', 19, 2, 'Bad product'),
('email97@gmail.com', 19, 4, 'Good product'),
('email98@gmail.com', 19, 3, 'Normal product'),
('email99@gmail.com', 20, 4, 'Good product');

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
  ADD PRIMARY KEY (`email`,`product_id`),
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
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=377;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `promotion`
--
ALTER TABLE `promotion`
  MODIFY `promotion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_action_log`
--
ALTER TABLE `user_action_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

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
