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
  `brand` varchar(30) DEFAULT NULL,
  `title` varchar(100)  NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `style` varchar(50)  NOT NULL,
  `type` varchar(50)  NOT NULL,
  `description` text  DEFAULT NULL,
  `promotion_id` int(11) NULL,
  `vote_quantity` int(11) NOT NULL DEFAULT 0,
  `total_vote` float(11) NOT NULL DEFAULT 0,
  `color` varchar(20) NOT NULL DEFAULT 'none',
  `size` varchar(10) NOT NULL,
  `is_top` bit(1) NULL DEFAULT 0,
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

CREATE TABLE `vote_product` (
  `email` varchar(50),
  `product_id` int(11),
  `vote_rating` int(11) NOT NULL,
  PRIMARY KEY(email,product_id)
) ENGINE=InnoDB;

ALTER TABLE `vote_product`
  ADD CONSTRAINT `fk_voteProduct_Product` 
  FOREIGN KEY (`product_id`) 
  REFERENCES `product` (`product_id`);

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
INSERT INTO `product` (`product_id`, `category_id`, `name`, `brand`, `title`, `price`, `style`, `type`, `description`, `promotion_id`, `vote_quantity`, `total_vote`, `color`, `size`, `is_top`, `created_time`)
 VALUES 
--  Amethyst
(NULL, '1', 'A101', NULL, 'RAW AMETHYST POINTS BY THE POUND', '8', 'raw', 'stone','Beautiful extra quality points from Uruguay.You will receive a wonderful assortment of points, there are approximately 20 in 1/4 lb give or take as it is by weight.These are really nice points that can be used for wire wrapping, chakra cleansing, reiki, crystal grids, meditation, home decor, crafting and so much more.', NULL, '0', '0', 'purple', 'small',  b'0', current_timestamp()),
(NULL, '1', 'A102', NULL, 'AMETHYST WORRY STONE SLAB - THUMB STONE - PALM STONE', '4', 'raw', 'stone','Worry stones, also know as palm stones or thumb stones are smooth polished gemstones.They have a thumb-sized indentation so you can carry it in your pocket and rub it for relaxation and stress relief.People use them by holding the stone between the index finger and thumb and rubbing one thumb back and forth across the stone.', NULL, '0', '0', 'purple', 'small',  b'0', current_timestamp()),
(NULL, '1', 'A103', NULL, 'NATURAL AMETHYST TUMBLED STONES, AMETHYST WORRY STONE FOR CRYSTAL HEALING', '4', 'ellipse', 'stone', 'Specimens are natural materials and stones may feature natural internal fractures, dips or inclusions consistent with the growth pattern of the stone.Amount, location, and color of banding varies from stone to stone.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A104', NULL, 'DEEP PURPLE AMETHYST CRYSTAL, CRYSTALS, CRYSTAL COLLECTION, URUGUAY', '177', 'raw', 'stone', 'Amethyst comes from the word meaning “not drunken”, the Ancient Greek myth of Bacchus and Diana.Amethyst is also the birthstone for the month of February.', NULL, '0', '0', 'purple', 'big', b'0', current_timestamp()),
(NULL, '1', 'A105', NULL, 'LARGE AMETHYST CRYSTAL CLUSTER: CHOOSE SIZE! \"A\" GRADE CHOOSE SIZE!', '7', 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine.Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, '0', '0', 'purple', 'middle', b'0', current_timestamp()),
(NULL, '1', 'A106', NULL, 'AAA GRADE NATURAL AMETHYST RAW MATERIAL AMETHYST FINE', '20', 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine. Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A107', NULL, '1LB AMETHYST TUMBLED STONE, TUMBLED AMETHYST CRYSTAL, BULK', '58', 'ellipse', 'stone', '1/2lb or 1lb light purple amethyst tumbled stone, some with rainbows.You will receive stones similar to the photos. Colors may vary depending on lighting and monitor.', NULL, '0', '0', 'purple', 'middle', b'0', current_timestamp()),
(NULL, '1', 'A108', NULL, 'NATURAL AMETHYST LOOSE STONE ROUND CUT PURPLE CRYSTAL GEMSTONE', '13', 'crystal', 'stone', 'All our gemstones are genuine natural which mined supply directly from gobal mining area.Every gemstone is carefully selected,to keep the precious gemstone in high quality and in vibrant and superior color.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A109', NULL, 'PURPLE AMETHYST RING, SILVER TUNGSTEN RING, WOMENS RING, MENS RING', '85', '', 'ring', 'Tungsten rings are popular because of their toughness and durability.Tungsten is scratch resistant and tarnish resistant which makes it a great choice for our customers who value longevity as well as low.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A110', NULL, 'ROMANTICE LOVER GIFT NATURAL AMETHYST HEART SHAPE GEMSTONE', '503', '', 'Necklace', '100% Brand New! Excellent Quality and Workmanship.Naturally-Vibrant, Superior Quality Color Gemstone.Diamonds:Natural Diamonds Carat Weight:0.034t Cut:Round Clarity:SI Color:G-H.Metal Type:Solid 14K Yellow Gold Weight:2.1g', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
-- Quartz
(NULL, '2', 'Q101', NULL, 'CRYSTAL TOWER,LARGE CRYSTAL TOWER,NATURAL CRYSTAL,QUARTZ POINT', '816', 'raw', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, '0', '0', 'white', 'big', b'0', current_timestamp()),
(NULL, '2', 'Q102', NULL, 'CRYSTAL CLUSTER，300-500G+ CLEAR QUARTZ CLUSTER CRYSTAL，QUARTZ POINT VUG', '26', 'crystal', 'stone', 'This product is not natural crystal, but belongs to laboratory crystal. If you mind, please do not buy it, thank you.', NULL, '0', '0', 'white', 'big', b'0', current_timestamp()),
(NULL, '2', 'Q103', NULL, 'COVELLITE PINK FIRE QUARTZ CRYSTAL - TEARDROP - GEMSTONES, JEWELRY MAKING', '921', 'ellipse', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured. Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, '0', '0', 'pink', 'small', b'1', current_timestamp()),
(NULL, '2', 'Q104', NULL, 'RAW HEMATITE PHANTOM QUARTZ POINT - EMF PROTECTOR', '20', 'hex', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured.Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, '0', '0', 'white', 'middle', b'0', current_timestamp()),
(NULL, '2', 'Q105', NULL, 'NATURAL ANGEL AURA QUARTZ PENDANT, 925 STERLING SILVER PENDANT', '63', 'ellipse', 'Gemstone', '925 Sterling Silver Natural Angel Aura Quartz Gemstone Silver Pendant Handmade Fine Silver Jewelry', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),
(NULL, '2', 'Q106', NULL, 'BLUE GHOST PHANTOM QUARTZ CRYSTAL CLUSTER,QUARTZ CRYSTAL VUG', '40', 'crystal', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, '0', '0', 'white', 'middle', b'0', current_timestamp()),
(NULL, '2', 'Q107', NULL, 'RAW ROSE QUARTZ, ETHICALLY SOURCED CRYSTALS, ECO-FRIENDLY PACKAGING', '6', 'crystal', 'stone', 'Rose Quartz is the crystal of unconditional love and infinite peace. It is said to promote deep inner healing and self-love, attract new loving relationships, and restore trust and harmony in existing relationships.', NULL, '0', '0', 'pink', 'middle', b'0', current_timestamp()),
(NULL, '2', 'Q108', NULL, 'RARE GREEN GHOST PHANTOM,QUARTZ CRYSTAL SPECIMEN,CRYSTAL HEAL ', '11', 'ellipse', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it is normal for the difference.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),
(NULL, '2', 'Q109', NULL, 'ROSE QUARTZ ROSE FLOWER | PINK QUARTZ | LOVE STONE | - HEART CHAKRA', '30', 'crystal', 'Chakra', 'Beautiful Small Rose Quartz Crystal Rose,You will receive one intuitively chosen.', NULL, '0', '0', 'pink', 'middle', b'0', current_timestamp()),
(NULL, '2', 'Q110', NULL, 'NATURAL BLUE GHOST PHANTOM,QUARTZ CRYSTAL SPECIMEN,CRYSTAL HEAL', '12', 'ellipse', 'stone', 'The ghost pendant likes water, soak it in water to make the color more vivid', NULL, '0', '0', 'blue', 'middle', b'0', current_timestamp()),
-- Diamond
(NULL, '3', 'D101', 'tiffany', 'BANGLE IN YELLOW GOLD WITH DIAMOND ACCENTS', '10000', '', 'Bracelets', 'No rules. All welcome. Inspired by the power of togetherness and inclusivity, Tiffany Lock is a bold and visual statement about the personal bonds that make us who we are. Designed to be worn by all genders, the Tiffany Lock bangle features an innovative clasp that echoes the functionality of a padlock, an important motif from The Tiffany Archives.', NULL, '0', '0', 'yellow', 'middle', b'0', current_timestamp()),
(NULL, '3', 'D102', 'tiffany', 'BANGLE IN WHITE GOLD WITH FULL DIAMONDS', '32000', '', 'bracelets', 'No rules. All welcome. Inspired by the power of togetherness and inclusivity,Tiffany Lock is a bold and visual statement about the personal bonds that make us who we are.Designed to be worn by all genders, the Tiffany Lock bangle features an innovative clasp that echoes the functionality of a padlock, an important motif from The Tiffany Archives. ', NULL, '0', '0', 'white', 'middle', b'0', current_timestamp()),
(NULL, '3', 'D103', 'tiffany', 'PENDANT PLATINUM WITH MARQUISE DIAMONDS', '14000', '', 'necklaces', 'Inspired by the fire and radiance of our superlative diamonds, Tiffany Victoria uses a unique combination of cuts for a distinctly romantic sensibility.The elegant simplicity of this pendant makes it as appropriate for day as it is for evening.', NULL, '0', '0', 'white', 'small', b'0', current_timestamp()),
(NULL, '3', 'D104', 'swarovski', 'SWAROVSKI MILLENIA BRACELET, SMALL OCTAGON CUT CRYSTALS', '329', '', 'bracelet', 'The styling possibilities are infinite with this timeless bracelet. A modern silhouette, it expertly crafted from a row of octagon cut crystals cradled in a rhodium plated setting..Finished with a fine jewelry-inspired closure, it will complement any ensemble', NULL, '0', '0', 'white', 'middle', b'0', current_timestamp()),
(NULL, '3', 'D105', 'tiffany', 'TENNIS BRACELET IN PLATINUM WITH DIAMONDS', '10000', '', 'bracelets', 'Inspired by the fire and radiance of our superlative diamonds,Tiffany Victoria uses a unique combination of cuts for a distinctly romantic sensibility. This feminine take on the classic line bracelet features a dazzling clasp of marquise diamonds.', NULL, '0', '0', 'white', 'small', b'0', current_timestamp()),
(NULL, '3', 'D106', NULL, 'NATURAL LOOSE DIAMOND RAW ROUGH SILVER GREY COLOR I3 CLARITY 1+ CARAT Q95', '32', 'stone', 'raw', 'Natural Loose Diamond', NULL, '0', '0', 'white', 'small', b'0', current_timestamp()),
(NULL, '3', 'D107', NULL, '5PCS GENUINE WHITE DIAMOND RAW GEMSTONE 10X12M12X14MM', '7', 'raw', 'stone', 'Wholesale Price 60% Sale for Natural Raw Diamond Rough Stone,5 Pieces White Crystal Diamond Nuggets-Herkimer diamond jewelry Crystal,Size is 10x12mm to 12x14mm Faceting Diamond Raw Gemstone ROCKS', NULL, '0', '0', 'white', 'small', b'0', current_timestamp()),
(NULL, '3', 'D108', NULL, '1,5-2MM - 1CT (20-22PCS) ROUGH WHITE DIAMONDS, LOOSE DIAMOND', '22', 'raw', 'stone', '1,5-2mm - 1Ct (20-22pcs) Rough White Diamonds, Loose Diamond, Tiny Diamonds, Raw Diamonds, Uncut Diamond,Luster Diamond for Jewelry', NULL, '0', '0', 'white', 'small', b'0', current_timestamp()),
(NULL, '3', 'D109', NULL, 'MOISSANITE ROUND LAB DIAMOND FACETED CUT 1MM- 4MM LOOSE STONE D-E', '10', 'crystal', 'stone', 'MOISSANITE ROUND DIAMOND FACETED CUT 1mm- 4mm LOOSE D-E WHITE COLOR VVS CLARITY', NULL, '0', '0', 'white', 'small', b'0', current_timestamp()),
(NULL, '3', 'D110', NULL, 'DIAMOND TENNIS BRACELET, LOW PROFILE 4 PRONG, 1CT - 6CT, 14K SOLID WHITE YELLOW', '992', '', 'bracelet', 'HOLIDAY SPECIAL!, Diamond Tennis Bracelet, Low Profile 4 Prong,1ct - 6ct, 14k Solid White Yellow Rose Gold,Social Value makes the perfect gift for Birthdays Anniversaries Christmas Hanukkah', NULL, '0', '0', 'white', 'middle', b'0', current_timestamp()),
--
