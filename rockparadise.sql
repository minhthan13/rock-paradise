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
  `image_id` int(11) PRIMARY KEY AUTO_INCREMENT,
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
(NULL, '1', 'A105', NULL, 'LARGE AMETHYST CRYSTAL CLUSTER: CHOOSE SIZE! \"A\" GRADE CHOOSE SIZE!', '7', 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine.Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, '0', '0', 'purple', 'middle', b'1', current_timestamp()),
(NULL, '1', 'A106', NULL, 'AAA GRADE NATURAL AMETHYST RAW MATERIAL AMETHYST FINE', '20', 'raw', 'stone', 'Also known as “Everyone’s favorite stone”, the beautiful crystal takes its attractive and unique color from the tears of Dionysus, connecting the concrete to the divine. Amethyst means ‘not intoxicated’ and comes from the ancient Greek word – Amethystos.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A107', NULL, '1LB AMETHYST TUMBLED STONE, TUMBLED AMETHYST CRYSTAL, BULK', '58', 'ellipse', 'stone', '1/2lb or 1lb light purple amethyst tumbled stone, some with rainbows.You will receive stones similar to the photos. Colors may vary depending on lighting and monitor.', NULL, '0', '0', 'purple', 'middle', b'0', current_timestamp()),
(NULL, '1', 'A108', NULL, 'NATURAL AMETHYST LOOSE STONE ROUND CUT PURPLE CRYSTAL GEMSTONE', '13', 'crystal', 'stone', 'All our gemstones are genuine natural which mined supply directly from gobal mining area.Every gemstone is carefully selected,to keep the precious gemstone in high quality and in vibrant and superior color.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A109', NULL, 'PURPLE AMETHYST RING, SILVER TUNGSTEN RING, WOMENS RING, MENS RING', '85', '', 'ring', 'Tungsten rings are popular because of their toughness and durability.Tungsten is scratch resistant and tarnish resistant which makes it a great choice for our customers who value longevity as well as low.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
(NULL, '1', 'A110', NULL, 'ROMANTICE LOVER GIFT NATURAL AMETHYST HEART SHAPE GEMSTONE', '503', '', 'Necklace', '100% Brand New! Excellent Quality and Workmanship.Naturally-Vibrant, Superior Quality Color Gemstone.Diamonds:Natural Diamonds Carat Weight:0.034t Cut:Round Clarity:SI Color:G-H.Metal Type:Solid 14K Yellow Gold Weight:2.1g', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()),
-- Quartz
(NULL, '2', 'Q101', NULL, 'CRYSTAL TOWER,LARGE CRYSTAL TOWER,NATURAL CRYSTAL,QUARTZ POINT', '816', 'raw', 'stone', 'This high quality crystal tower is made from clear quartz and was mined ethically in Brazil.Clear quartz is one of the most popular of all crystals and was admired throughout the centuries.Many ancient cultures turned clear quartz into relics, lucky-charms, bowls and ornaments.', NULL, '0', '0', 'white', 'big', b'0', current_timestamp()),
(NULL, '2', 'Q102', NULL, 'CRYSTAL CLUSTER，300-500G+ CLEAR QUARTZ CLUSTER CRYSTAL，QUARTZ POINT VUG', '26', 'crystal', 'stone', 'This product is not natural crystal, but belongs to laboratory crystal. If you mind, please do not buy it, thank you.', NULL, '0', '0', 'white', 'big', b'1', current_timestamp()),
(NULL, '2', 'Q103', NULL, 'COVELLITE PINK FIRE QUARTZ CRYSTAL - TEARDROP - GEMSTONES, JEWELRY MAKING', '921', 'ellipse', 'Gemstone', 'This item is one of a kind and you will receive the EXACT piece(s) pictured. Macro photography is used to show detail but can make items appear larger than their actual size.Please refer to the size ranges and note whether they are in inches or centimeters.', NULL, '0', '0', 'pink', 'small', b'0', current_timestamp()),
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

-- Emerald
(NULL, '4', 'E101', NULL, 'NATURAL GREEN EMERALD ZAMBIAN ROUGH LOOSE GEMSTONE GENUINE EMERALD', '20', 'raw', 'stone', 'Gemstone > Green Emerald\r\nTransparency: Translucent\r\nTreatment: Dyeing\r\nShape : Rough\r\nCountry of Origin: Zambian', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),
(NULL, '4', 'E102', NULL, '12X16 MM ZAMBIA EMERALD OVAL RING STONE LOOSE GEMSTONE', '11', 'crystal', 'stone', 'If you need more sizes and shapes and stones which are not listed please let us know, we will make special listing for you.We also welcome wholesale orders and offer great discounts on wholesale quantities.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),
(NULL, '4', 'E103', NULL, 'FACETED ZAMBIAN EMERALD PENDANT 925 STERLING SILVER PENDANT REAL GEMSTONE', '12', '', 'earrings', 'Faceted Zambian Emerald Pendant 925 Sterling Silver Pendant Real Gemstone Pendant Handmade Pendant Gift For Bridal Beautiful Emerald Jewelry', NULL, '0', '0', 'green', 'small', b'1', current_timestamp()),
(NULL, '4', 'E104', NULL, 'NATURAL COLOMBIA GREEN EMERALD 10.10 CT LOOSE GEMSTONE FOR RING', '12', 'hex', 'gemstone', 'We are Wholesale Supplier of all type of Gem Stones, precious, semiprecious stones.We also supply Gemstone as per your Requirement and Design.Weight, Design, Stones, Stones size can be changed as per requirement of buyer.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),
(NULL, '4', 'E105', NULL, 'TENNIS BRACELET ROUND CUT IN LAB CREATED EMERALD DIAMONDS', '479', '', 'bracelet', 'This Bracelet Can Be customized in your choice of shape, type, size, and color of diamond as per requirement, Please DM to customize.', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()),
(NULL, '4', 'E106', NULL, 'BEAUTIFUL CERTIFIED UNCUT 75.85 CT PAIR COLOMBIA EMERALD', '42', 'raw', 'stone', 'Beautiful Certified Uncut 75.85 Ct pair Colombia Emerald Rough Loose Gemstone', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()),
(NULL, '4', 'E107', NULL, 'EMERALD PENDANT COPPER WIRE WRAPPED PENDANT EMERALD GEMSTONE', '17', '', 'gemstone', 'Emerald Gemstone Copper Wire Wrapped Handmade Pendant,A copper I wrapped on a beautiful Emerald Gemstone .Size May Be slight Differ Than Shown In The Picture', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()), 
(NULL, '4', 'E108', NULL, 'ART DECO EMERALD GREEN EARRINGS, JADE GREEN BAGUETTE EARRINGS', '28', '', 'earrings', 'These beautiful, emerald green earrings are translucent lucite gems set in a delicate golden brass setting.They are a great deep jade jewel shade of green which is complimented with the deep gold tones of the brass settings.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()), 
(NULL, '4', 'E109', NULL, 'NATURAL EMERALD FACETED CUT MIX SHAPE 50 CARAT MINI MIXED LOT OVAL', '32', 'raw', 'gemstone', 'Natural Emerald Faceted Cut Mix Shape 50 Carat Mini Mixed Lot Oval & Emerald Shape Mixed Lot Loose Gemstones', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()), (NULL, '4', 'E110', NULL, 'NATURAL EMERALD ROUGH STICK CORUNDUM COLOMBIAN UNCUT EMERALD GEMSTONE', '33', 'raw', 'gemstone', 'A natural, responsibly earth-mined Emerald with a dominant hue of Green color, cut into a Stick shape. This stone weighs 328 Carats.', NULL, '0', '0', 'green', 'big', b'0', current_timestamp()),
(NULL, '4', 'E111', NULL, 'EMERALD RAW STONE LOT, NATURAL EMERALD ROUGH 10-20MM GOOD QUALITY ROUGH', '32', 'raw', 'stone', 'International buyers are notified that no import duties, taxes, or any other charges are included to the item price', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),

-- Jade
(NULL, '5', 'J101', NULL, 'DAINTY JADE BEADED PENDANT NECKLACE, 14K GOLD GREEN JADE FRESHWATER PEARL CHOKER', '25', '', 'necklace', 'The circle of Jade is the means of holding back peace and keeping happiness.Round donuts mean to bring fortune and avoid evil spirits.', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()), 
(NULL, '5', 'J102', NULL, 'JADE TUMBLE STONE, GREEN JADE CRYSTAL UK, JADE HEALING STONE', '3', 'charka', 'stone', 'Jade Tumble Stone, Green Jade Crystal UK, Jade Healing Stone, L M S Gemstone For Good Luck, Libra and Taurus Birthstone, Heart Chakra', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()), 
(NULL, '5', 'J103', NULL, 'NATURAL REAL HETIAN ICY FLORAL JADE PENDANT, DIY STAR JADE BEADS', '5', '', 'gemstone', 'Elegant green bow gift box with a card including your message is available with few extra dollars. Please select at the check-out.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),
(NULL, '5', 'J104', NULL, 'VINTAGE HETIAN JADE BRACELET 8MM NATURAL GEMSTONE CHARM BRACELET HEALING', '14', '', 'bracelet', 'This is a Dainty Jade Bracelet , which can let your heart more clear and pure.It helps you to clear out those blockages that may have been holding you back.\r\n', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()), 
(NULL, '5', 'J105', NULL, 'REAL GREEN JADE DRAGON NECKLACE, CHINESE ZODIAC YEAR OF DRAGON CHARM', '16', '', 'gemstone', 'Dragon (pronounced as Long) is a mythical creature in both western and oriental cultures, whereas in China it symbolizes power and strength.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()), 
(NULL, '5', 'J106', NULL, 'JADE IS ONE OF THE OLDEST AND MOST IMPORTANT GEMSTONES', '5', '', 'gemstone', 'Jade is one of the oldest and most important gemstones, with a history dating over 7,000 years.It is especially prized throughout Chinese and Latin American cultures', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()), 
(NULL, '5', 'J107', NULL, 'JADE DRAGON PENDANT | UNIQUE DRAGON CARVING NECKLACE PENDANT', '17', '', 'necklace', 'If you need more, we can give you a good discount! Dear friend, whatever question you encounter after purchase, please contact me, please believe I will give you the most satisfactory solution.', NULL, '0', '0', 'green', 'middle', b'0', current_timestamp()), 
(NULL, '5', 'J108', NULL, 'AFRICA JADE 30 MM ~ GEMSTONE DONUT NECKLACE ~HIPPIE ~GOA ~BOHO', '26', '', 'necklace', 'Gemstone Donut Necklace ~ Africa Jade ~ Incl. 2 mm in antique brown to knot.These new Africa Jade Donuts have a wonderful quality and an intense green - from Canada', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()), 
(NULL, '5', 'J109', NULL, 'NATURAL RAW GREEN JADE CRYSTAL - RAW GREEN JADE STONE - RAW MAKING JEWELRY', '1', 'raw', 'stone', 'Natural Raw Green Jade Crystal - Raw Green Jade Stone - Raw Making Jewelry - Healing Crystal - Crystal Shop', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()), 
(NULL, '5', 'J110', NULL, 'GREEN JADE RING, COPPER AND STAINLESS STEEL - HANDMADE - JADE RING', '77', '', 'ring', 'This ring is composed of a 304 stainless steel base, with an inlay made of green jade flakes and copper chips,which I personally select and insert one by one.', NULL, '0', '0', 'green', 'small', b'0', current_timestamp()),

-- Pandora
(NULL, '8', 'P101', 'pandora', 'SEA TURTLE CHARMS, ON A BLUE BUBBLE MURANO GLASS BEADS', '20', '', 'charms', 'Blue sea seems having a kind of magic and fascinating. Cute dolphin, fish, starfish, turtle,etc......... Do you like it?solid 925 sterling silver sea turtle charm beads.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()), 
(NULL, '8', 'P102', 'pandora', 'CHORUSLOVE VALENTINES DAY CHARMS 925 STERLING SILVER ARROW OF CUPID', '18', '', 'charms', 'solid 925 sterling silver princess heart charm beads, pink heart gems surround by micro clear cz.Lead-free, Nickel-free, Cadmium-free and Hypoallergenic, 100% safe for sensitive skin.', NULL, '0', '0', 'purple', 'small', b'0', current_timestamp()), 
(NULL, '8', 'P103', 'pandora', 'STERLING SILVER VALENTINES DAY CHARMS HEART CHARMS, I LOVE YOU.', '12', '', 'charms', 'I love you moon and back means I love you more. As we all know, universe is so big, you can imagine how deep is the love.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()), 
(NULL, '8', 'P104', 'pandora', 'STERLING SILVER VALENTINES DAY CHARMS HEART CHARMS, I LOVE YOU', '8', '', 'charms', 'I love you moon and back means I love you more. As we all know, universe is so big, you can imagine how deep is the love.', NULL, '0', '0', 'pink', 'small', b'0', current_timestamp()), 
(NULL, '8', 'P105', 'pandora', 'BLUE PANSY FLOWER STUD EARRINGS', '66', '', 'earrings', 'Colour your spring with our Blue Pansy Flower Stud Earrings. Hand-finished in sterling silver,each pansy features two petals covered in sparkling pavé and three petals hand-painted in shaded white and blue enamel.', NULL, '0', '0', 'pink', 'small', b'0', current_timestamp()),

-- Ruby

(NULL, '6', 'R101', 'swarovski', 'SWAROVSKI FLORERE GOLD-PLATED PINK FLOWER WOMEN IS NECKLACE', '1550', '', 'necklace', 'This wondrous Florere necklace becomes even more beautiful the closer you look. Crafted with a gold-tone plated setting, the pink design features five faceted petals artfully arranged around a central stone with a deeper hue.', NULL, '0', '0', 'pink', 'small', b'0', current_timestamp()), 
(NULL, '6', 'R102', NULL, 'PIGEON BLOOD NATURAL RUBY | OVAL CUT |1.42 CARATS | BURMA MINES', '1759', '', 'gemstone', 'Pigeon Blood Natural Ruby | Oval Cut |1.42 Carats | Burma Mines | No Heat Oval Shape Ruby.', NULL, '0', '0', 'red', 'small', b'0', current_timestamp()),
(NULL, '6', 'R103', NULL, 'HANDMADE 100% GENUINE ROUGH PINK RUBY NECKLACE WITH AMAZING PINK COLOR AND GLOW', '32', '', 'necklace', '100% HANDMADE NATURAL HOT PINK RUBY EVERY DAY NECKLACE, ROUGH RUBY NECKLACE, MINIMALIST RUBY NECKLACE, RAW RUBY PENDANT, SOUTH AFRICA MINES.', NULL, '0', '0', 'pink', 'middle', b'1', current_timestamp()), 
(NULL, '6', 'R104', NULL, 'AAA QUALITY BURMESE PIGEON RED RUBY LOOSE GEMSTONE , OCTAGON SHAPE EMERALD', '45', 'hex', 'gemstone', 'PERSONALISATION : If you need more Sizes and Shapes and stones which are not listed please let us know, We will make special listing for you. We will also make the all the stones and sizes as per your requirement. We happily accept bulk and custom orders.', NULL, '0', '0', 'pink', 'small', b'0', current_timestamp()), 
(NULL, '6', 'R105', NULL, 'KASHMIR RED RUBY PENDANT COPPER WIRE WRAPPED GEMSTONE PENDANT', '19', '', 'gemstone', 'Kashmir Red Ruby Gemstone Copper Wire Wrapped Handmade Pendant,A copper I wrapped on a beautiful Kashmir Red Ruby Gemstone .', NULL, '0', '0', 'red', 'middle', b'0', current_timestamp()), 
(NULL, '6', 'R106', NULL, 'BLOOD-RED RUBY OVAL CUT GEMSTONE EGG SHAPE FACETED RUBY GEM MULTIPLE SIZES', '4', '', 'gemstone', 'Priced per 1 gemstone. You can select a size.These gemstones are made by fusing natural ruby raw ore powder.', NULL, '0', '0', 'red', 'small', b'0', current_timestamp()),
(NULL, '6', 'R107', NULL, '14MM CUSHION SHAPE MOZAMBIQUE PIGEON RED RUBY LOOSE GEMSTONE', '36', 'hex', 'gemstone', 'PERSONALISATION : If you need more Sizes and Shapes and stones which are not listed please let us know, We will make special listing for you. We will also make the all the stones and sizes as per your requirement. We happily accept bulk and custom orders.', NULL, '0', '0', 'red', 'small', b'0', current_timestamp()),
(NULL, '6', 'R108', NULL, 'GENUINE RUBY PENDANT, REAL RUBY NECKLACE, REAL RUBY PENDANT ', '30', '', 'necklace', 'Real Ruby Necklace with a Genuine Ruby Pendant! This Ruby gemstone Necklace is a July Birthstone Necklace!', NULL, '0', '0', 'red', 'small', b'0', current_timestamp()), 
(NULL, '6', 'R109', NULL, 'RAW RUBY CRYSTAL (1G TO 14G) GRADE AA - NATURAL RUBY STONE - RAW RUBY STONE', '3', 'raw', 'stone', 'Raw Ruby crystal (1g to 14g) grade AA - natural ruby stone - raw ruby stone - rough ruby stone - healing crystals and stones heart chakra.', NULL, '0', '0', 'red', 'small', b'0', current_timestamp()), 
(NULL, '6', 'R110', NULL, 'NATURAL BURMA RUBY ROUGH GEMSTONE LOT (DYED)', '5', 'raw', 'stone', 'Raw Ruby grade AA - natural ruby stone - raw ruby stone - rough ruby stone - healing crystals and stones heart chakra.', NULL, '0', '0', 'red', 'small', b'0', current_timestamp()),

-- Sapphire
(NULL, '7', 'S101', 'tiffany', 'COLOR BY THE YARD EARRINGS', '1550', '', 'earrings', 'Platinum with round sapphires Carat total weight .22 Original designs copyrighted by Elsa Peretti.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()), 
(NULL, '7', 'S102', 'tiffany', 'COLOR BY THE YARD SAPPHIRE BRACELET', '975', '', 'bracelet', 'Bracelet in platinum with a sapphire.Platinum with a round sapphire, 7\" long, Carat weight .11', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()), 
(NULL, '7', 'S103', 'swarovski', 'SWAROVSKI SPARKING DANCE CRYSTAL NECKLACE AND EARRING SET JEWELRY', '250', '', 'necklaces', 'These mini hoop earrings celebrate the treasured Swarovski star emblem,inspired by the magic of Austrian scenery.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()), 
(NULL, '7', 'S104', 'tiffany', 'COLOR BY THE YARD PENDANT', '1990', '', 'necklaces', 'The Elsa Peretti® Color by the Yard collection features bezel-set stones that shimmer against the skin.Platinum with a round sapphire.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),
(NULL, '7', 'S105', 'swarovski', 'SWAROVSKI SYMBOLIC EVIL EYE PENDANT NECKLACE', '145', '', 'necklaces', 'This timeless necklace will work wonders with your everyday wardrobe.Suspended on a modern rhodium-plated chain, it features a beautiful.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),
(NULL, '7', 'S106', 'swarovski', 'BLUE SAPPHIRE ROUND SHAPE CUT FACETED LOOSE GEMSTONE SIZE', '115', '', 'necklaces', 'The mixed-plated Duo Pendant Evil Eye adds a mystic touch to any look.It features one eye motif in blue, black, and clear crystal pave and one in rose gold-plated metal.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()), 
(NULL, '7', 'S107', NULL, 'BLUE SAPPHIRE ROUND FACETED CUT LOOSE CERTIFIED GEMSTONE UNTREATED LOT', '3', 'crystal', 'gemstone', 'If you cannot find the GemStone of your dreams, give us a chance.We are able to offer custom cut Stones based on any facet diagram or image that you provide.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),
(NULL, '7', 'S108', NULL, 'NATURAL STAR SAPPHIRE OVAL CUT STONES, AAA QUALITY LOOSE SAPPHIRE STONE', '2', 'crystal', 'gemstone', 'Natural Blue Sapphire Round Faceted Cut Loose Gemstone.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),
(NULL, '7', 'S109', NULL, 'CALIBRATED SIZES OF NATURAL STAR SAPPHIRE GEMSTONES LOOSE GEMS', '28', 'crystal', 'gemstone', 'RANDOMLY Select from the Lot - AAA Quality Sapphire.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),
(NULL, '7', 'S110', NULL, 'HUGE FLAWLESS 47.75 CT NATURAL BI-COLOR PINK BLUE SAPPHIRE PRECIOUS LOOSE GEMSTONE.', '322', 'crystal', 'gemstone', 'HUGE Flawless 47.75 Ct Natural Bi-Color Pink Blue Sapphire Precious Loose Gemstone GIT Certified Ovel Cut Stunning , HeartTouching Gemstone.', NULL, '0', '0', 'blue', 'middle', b'0', current_timestamp()), 
(NULL, '7', 'S111', NULL, 'EXTRA LARGE NATURAL BLUE SAPPHIRE RAW/BLUE SAPPHIRE ROUGH', '6', 'raw', 'gemstone', 'Large Blue Sapphire Raw(Fracture Filled),Blue Sapphire Rough Stone.', NULL, '0', '0', 'blue', 'small', b'0', current_timestamp()),

-- Sphere

(NULL, '2', 'SE101', NULL, 'ALL SIZES ROSE QUARTZ SPHERE, LARGE ROSE QUARTZ SPHERE', '9', 'sphere', 'stone', 'A beautiful rose quartz crystal sphere, intuitively chosen for you.Did you know rose quartz is regarded as the unconditional love stone?', NULL, '0', '0', 'pink', 'big', b'0', current_timestamp()), 
(NULL, '2', 'SE102', NULL, '50MM+ NATURAL RED ZOISITE BALL，CRYSTAL SPHERE，QUARTZ CRYSTAL BALL', '24', 'sphere', 'stone', 'This product requires the use of ultraviolet light to see the color change.', NULL, '0', '0', 'red', 'middle', b'0', current_timestamp()), 
(NULL, '2', 'SE103', NULL, 'NATURAL CLEAR SPHERE,QUARTZ CRYSTAL BALL,MINERAL SPECIMEN,ROCK,REIKI HEALING', '86', 'sphere', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it normal fr the difference', NULL, '0', '0', 'white', 'big', b'0', current_timestamp()), 
(NULL, '2', 'SE104', NULL, '1PC 55MM+ NATURAL SODALITE BALL，CRYSTAL SPHERE，QUARTZ CRYSTAL BALL', '21', 'sphere', 'stone', 'Because it is 100% natural crystal,it is hard to keep everyone is same,so these may happen:The size & weight of everyone always is different,it is normal fr the difference.', NULL, '0', '0', 'blue', 'middle', b'0', current_timestamp()), 
(NULL, '8', 'SE105', NULL, 'LARGE BLUE APATITE CRYSTAL BALL - BLUE APATITE SPHERE - CRYSTAL BALL HEALING', '20', 'sphere', 'stone', 'Large Blue Apatite Crystal Ball - Blue Apatite Sphere - Crystal Ball Healing - Stone Decor Feng Shui 45-65mm.', NULL, '0', '0', 'blue', 'big', b'0', current_timestamp()),
(NULL, '1', 'SE106', NULL, '1PC NATURAL AMTHYST SPHERE ORNAMENT,HIGH QUALITY CRYSTAL SPHERE', '8', 'sphere', 'stone', 'Welcome to my shop, Im a designer and gemstone lover with a passion for decorating homes with gemstones.', NULL, '0', '0', 'purple', 'big', b'0', current_timestamp()), 
(NULL, '2', 'SE107', NULL, 'ONE BLUE MELTING STONE SPHERE,QUARTZ CRYSTAL BALL,HOME DECORATION', '17', 'sphere', 'stone', 'This product requires the use of ultraviolet light to see the color change.', NULL, '0', '0', 'blue', 'middle', b'0', current_timestamp()), 
(NULL, '2', 'SE108', NULL, '2.4\" FLAKY CLEAR QUARTZ SPHERE, CRYSTAL BALL, NATURAL CRYSTAL SPHERE', '22', 'sphere', 'stone', 'The sphere form signifies the emanation of energy from within. Clear quartz is one of its strong protective types.It dissipates negative energy and clears it away.', NULL, '0', '0', 'white', 'middle', b'0', current_timestamp());

-- insert Image

INSERT INTO `image` (`image_id`, `product_id`, `default_image`) 
VALUES
-- A1...
(NULL, '1', b'1'), (NULL, '1', b'0'), (NULL, '1', b'0'), (NULL, '1', b'0'),
(NULL, '2', b'1'), (NULL, '2', b'0'), (NULL, '2', b'0'), (NULL, '2', b'0'),
(NULL, '3', b'1'), (NULL, '3', b'0'), (NULL, '3', b'0'), (NULL, '3', b'0'), (NULL, '3', b'0'),
(NULL, '4', b'1'), (NULL, '4', b'0'), (NULL, '4', b'0'), (NULL, '4', b'0'), (NULL, '4', b'0'),
(NULL, '5', b'1'), (NULL, '5', b'0'), (NULL, '5', b'0'), (NULL, '5', b'0'),
(NULL, '6', b'1'), (NULL, '6', b'0'), (NULL, '6', b'0'),
(NULL, '7', b'1'), (NULL, '7', b'0'), (NULL, '7', b'0'), (NULL, '7', b'0'), (NULL, '7', b'0'), (NULL, '7', b'0'),
(NULL, '8', b'1'), (NULL, '8', b'0'), (NULL, '8', b'0'), (NULL, '8', b'0'),
(NULL, '9', b'1'), (NULL, '9', b'0'), (NULL, '9', b'0'), (NULL, '9', b'0'), (NULL, '9', b'0'), (NULL, '9', b'0'),
(NULL, '10', b'1'), (NULL, '10', b'0'), (NULL, '10', b'0'), (NULL, '10', b'0'), (NULL, '10', b'0'),

-- D1...
(NULL, '21', b'1'), (NULL, '21', b'0'), (NULL, '21', b'0'), (NULL, '21', b'0'),
(NULL, '22', b'1'), (NULL, '22', b'0'), (NULL, '22', b'0'), (NULL, '22', b'0'),
(NULL, '23', b'1'), (NULL, '23', b'0'), (NULL, '23', b'0'), (NULL, '23', b'0'),
(NULL, '24', b'1'), (NULL, '24', b'0'), (NULL, '24', b'0'), (NULL, '24', b'0'),
(NULL, '25', b'1'), (NULL, '25', b'0'), (NULL, '25', b'0'), (NULL, '25', b'0'),
(NULL, '26', b'1'), (NULL, '26', b'0'), (NULL, '26', b'0'), (NULL, '26', b'0'), (NULL, '26', b'0'),
(NULL, '27', b'1'), (NULL, '27', b'0'), (NULL, '27', b'0'), (NULL, '27', b'0'), (NULL, '27', b'0'),
(NULL, '28', b'1'), (NULL, '28', b'0'), (NULL, '28', b'0'), (NULL, '28', b'0'), (NULL, '28', b'0'),
(NULL, '29', b'1'), (NULL, '29', b'0'), (NULL, '29', b'0'), (NULL, '29', b'0'), (NULL, '29', b'0'),
(NULL, '30', b'1'), (NULL, '30', b'0'), (NULL, '30', b'0'), (NULL, '30', b'0'),

-- Q1...
(NULL, '11', b'1'), (NULL, '11', b'0'), (NULL, '11', b'0'), (NULL, '11', b'0'), (NULL, '11', b'0'),
(NULL, '12', b'1'), (NULL, '12', b'0'), (NULL, '12', b'0'), (NULL, '12', b'0'),
(NULL, '13', b'1'), (NULL, '13', b'0'), (NULL, '13', b'0'), (NULL, '13', b'0'),
(NULL, '14', b'1'), (NULL, '14', b'0'), (NULL, '14', b'0'), (NULL, '14', b'0'),
(NULL, '15', b'1'), (NULL, '15', b'0'), (NULL, '15', b'0'), (NULL, '15', b'0'), (NULL, '15', b'0'),
(NULL, '16', b'1'), (NULL, '16', b'0'), (NULL, '16', b'0'), (NULL, '16', b'0'), (NULL, '16', b'0'),
(NULL, '17', b'1'), (NULL, '17', b'0'), (NULL, '17', b'0'), (NULL, '17', b'0'),
(NULL, '18', b'1'), (NULL, '18', b'0'), (NULL, '18', b'0'), (NULL, '18', b'0'), (NULL, '18', b'0'),
(NULL, '19', b'1'), (NULL, '19', b'0'), (NULL, '19', b'0'), (NULL, '19', b'0'), (NULL, '19', b'0'),
(NULL, '20', b'1'), (NULL, '20', b'0'), (NULL, '20', b'0'), (NULL, '20', b'0'), (NULL, '20', b'0'),

-- E1....
(NULL, '31', b'1'), (NULL, '31', b'0'), (NULL, '31', b'0'), (NULL, '31', b'0'),
(NULL, '32', b'1'), (NULL, '32', b'0'),
(NULL, '33', b'1'), (NULL, '33', b'0'), (NULL, '33', b'0'), (NULL, '33', b'0'), (NULL, '33', b'0'),
(NULL, '34', b'1'), (NULL, '34', b'0'), (NULL, '34', b'0'), (NULL, '34', b'0'), (NULL, '34', b'0'),
(NULL, '35', b'1'), (NULL, '35', b'0'), (NULL, '35', b'0'), (NULL, '35', b'0'), (NULL, '35', b'0'),
(NULL, '36', b'1'), (NULL, '36', b'0'), (NULL, '36', b'0'),
(NULL, '37', b'1'), (NULL, '37', b'0'), (NULL, '37', b'0'), (NULL, '37', b'0'), (NULL, '37', b'0'),
(NULL, '38', b'1'), (NULL, '38', b'0'), (NULL, '38', b'0'),
(NULL, '39', b'1'), (NULL, '39', b'0'), (NULL, '39', b'0'), (NULL, '39', b'0'), (NULL, '39', b'0'),
(NULL, '40', b'1'), (NULL, '40', b'0'), (NULL, '40', b'0'), (NULL, '40', b'0'),
(NULL, '41', b'1'), (NULL, '41', b'0'), (NULL, '41', b'0'), (NULL, '41', b'0'),

-- J1....
(NULL, '42', b'1'), (NULL, '42', b'0'), (NULL, '42', b'0'), (NULL, '42', b'0'), (NULL, '42', b'0'),
(NULL, '43', b'1'), (NULL, '43', b'0'), (NULL, '43', b'0'), (NULL, '43', b'0'), (NULL, '43', b'0'),
(NULL, '44', b'1'), (NULL, '44', b'0'), (NULL, '44', b'0'), (NULL, '44', b'0'), (NULL, '44', b'0'),
(NULL, '45', b'1'), (NULL, '45', b'0'), (NULL, '45', b'0'), (NULL, '45', b'0'), (NULL, '45', b'0'),
(NULL, '46', b'1'), (NULL, '46', b'0'), (NULL, '46', b'0'), (NULL, '46', b'0'), (NULL, '46', b'0'),
(NULL, '47', b'1'), (NULL, '47', b'0'), (NULL, '47', b'0'), (NULL, '47', b'0'),
(NULL, '48', b'1'), (NULL, '48', b'0'), (NULL, '48', b'0'), (NULL, '48', b'0'),
(NULL, '49', b'1'), (NULL, '49', b'0'), (NULL, '49', b'0'), (NULL, '49', b'0'), (NULL, '49', b'0'),
(NULL, '50', b'1'), (NULL, '50', b'0'), (NULL, '50', b'0'), (NULL, '50', b'0'), (NULL, '50', b'0'),
(NULL, '51', b'1'), (NULL, '51', b'0'), (NULL, '51', b'0'), (NULL, '51', b'0'),

-- P1...
(NULL, '52', b'1'), (NULL, '52', b'0'), (NULL, '52', b'0'),
(NULL, '53', b'1'), (NULL, '53', b'0'), (NULL, '53', b'0'),
(NULL, '54', b'1'), (NULL, '54', b'0'), (NULL, '54', b'0'), (NULL, '54', b'0'),(NULL, '54', b'0'),
(NULL, '55', b'1'), (NULL, '55', b'0'), (NULL, '55', b'0'), (NULL, '55', b'0'),
(NULL, '56', b'1'), (NULL, '56', b'0'), (NULL, '56', b'0'),

-- R1...
(NULL, '57', b'1'), (NULL, '57', b'0'), (NULL, '57', b'0'), (NULL, '57', b'0'), (NULL, '57', b'0'),
(NULL, '58', b'1'), (NULL, '58', b'0'), (NULL, '58', b'0'), (NULL, '58', b'0'), (NULL, '58', b'0'),
(NULL, '59', b'1'), (NULL, '59', b'0'), (NULL, '59', b'0'), (NULL, '59', b'0'), (NULL, '59', b'0'),
(NULL, '60', b'1'), (NULL, '60', b'0'), (NULL, '60', b'0'), (NULL, '60', b'0'), (NULL, '60', b'0'),
(NULL, '61', b'1'), (NULL, '61', b'0'), (NULL, '61', b'0'), (NULL, '61', b'0'), (NULL, '61', b'0'),
(NULL, '62', b'1'), (NULL, '62', b'0'), (NULL, '62', b'0'), (NULL, '62', b'0'), (NULL, '62', b'0'),
(NULL, '63', b'1'), (NULL, '63', b'0'), (NULL, '63', b'0'), (NULL, '63', b'0'), (NULL, '63', b'0'),
(NULL, '64', b'1'), (NULL, '64', b'0'), (NULL, '64', b'0'), (NULL, '64', b'0'), (NULL, '64', b'0'),
(NULL, '65', b'1'), (NULL, '65', b'0'), (NULL, '65', b'0'), (NULL, '65', b'0'),
(NULL, '66', b'1'), (NULL, '66', b'0'), (NULL, '66', b'0'), (NULL, '66', b'0'), (NULL, '66', b'0'),

-- S1...
(NULL, '67', b'1'), (NULL, '67', b'0'), (NULL, '67', b'0'), (NULL, '67', b'0'),
(NULL, '68', b'1'), (NULL, '68', b'0'), (NULL, '68', b'0'),
(NULL, '69', b'1'), (NULL, '69', b'0'), (NULL, '69', b'0'), (NULL, '69', b'0'), (NULL, '69', b'0'),
(NULL, '70', b'1'), (NULL, '70', b'0'), (NULL, '70', b'0'), (NULL, '70', b'0'),
(NULL, '71', b'1'), (NULL, '71', b'0'), (NULL, '71', b'0'),
(NULL, '72', b'1'), (NULL, '72', b'0'),
(NULL, '73', b'1'), (NULL, '73', b'0'), (NULL, '73', b'0'), (NULL, '73', b'0'), (NULL, '73', b'0'),
(NULL, '74', b'1'), (NULL, '74', b'0'), (NULL, '74', b'0'), (NULL, '74', b'0'),
(NULL, '75', b'1'), (NULL, '75', b'0'), (NULL, '75', b'0'), (NULL, '75', b'0'), (NULL, '75', b'0'),
(NULL, '76', b'1'), (NULL, '76', b'0'), (NULL, '76', b'0'), (NULL, '76', b'0'), (NULL, '76', b'0'),
(NULL, '77', b'1'), (NULL, '77', b'0'), (NULL, '77', b'0'),

-- SE1...
(NULL, '78', b'1'), (NULL, '78', b'0'), (NULL, '78', b'0'), (NULL, '78', b'0'), (NULL, '78', b'0'),
(NULL, '79', b'1'), (NULL, '79', b'0'), (NULL, '79', b'0'), (NULL, '79', b'0'),
(NULL, '80', b'1'), (NULL, '80', b'0'), (NULL, '80', b'0'), (NULL, '80', b'0'), (NULL, '80', b'0'),
(NULL, '81', b'1'), (NULL, '81', b'0'), (NULL, '81', b'0'), (NULL, '81', b'0'), (NULL, '81', b'0'),
(NULL, '82', b'1'), (NULL, '82', b'0'), (NULL, '82', b'0'), (NULL, '82', b'0'), (NULL, '82', b'0'),
(NULL, '83', b'1'), (NULL, '83', b'0'), (NULL, '83', b'0'), (NULL, '83', b'0'), (NULL, '83', b'0'),
(NULL, '84', b'1'), (NULL, '84', b'0'), (NULL, '84', b'0'), (NULL, '84', b'0'), (NULL, '84', b'0'),
(NULL, '85', b'1'), (NULL, '85', b'0'), (NULL, '85', b'0'), (NULL, '85', b'0');
