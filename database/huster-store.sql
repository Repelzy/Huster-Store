-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2024 at 06:47 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huster-store`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)   SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@huster.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Slippers'),
(2, 'High-Top Sneakers'),
(3, 'Low-Top Sneakers'),
(4, 'Accessories'),
(5, 'For Sales');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1),
(160, 1, '::1', -1, 1),
(161, 2, '::1', -1, 1),
(162, 3, '::1', -1, 1),
(163, 59, '::1', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'CONVERSE'),
(2, 'VANS'),
(3, 'PALLADIUM'),
(4, 'NEW BALANCE'),
(5, 'K-SWISS'),
(6, 'SNEAKER BUZZ\r\n'),
(7, 'ACCESSORIES'),
(8, 'SUPRA');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@apricotstore.com'),
(4, 'help.shohan@gmail.com'),
(5, 'info.shohan@yahoo.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL DEFAULT '',
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `trx_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`, `p_status`) VALUES
(1, 12, '', 'Shohan', 'help.shohan@gmail.com', 'Dhaka, Khulna, Barisal', 'Daffodil Smart City', 'Barisal', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234, 'Completed'),
(2, 32, '', 'Tran Manh Ngo', 'huy123@gmail.com', 'Hanoi', 'Vietnam', 'Hai Phong', 100000, 'Tran Manh Ngo', '9876765387340982', '12/22', 2, 1000, 1234, 'Completed'),
(3, 27, '', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'HN', 100000, 'Tran Manh Ngo', '213123213123131', '12/22', 3, 105, 123, ''),
(4, 27, '', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'HMN', 100000, 'tran quang duc', '123123132313121', '12/22', 2, 55, 1234, ''),
(5, 27, '', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'Hai Phong', 100000, 'Tran Manh Ngo', '123412341234', '12/22', 2, 380, 1234, ''),
(6, 27, '', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'HN', 100000, 'Tran Manh Ngo', '1234123412341234', '12/22', 2, 82, 1234, ''),
(7, 27, 'trx_666db97a012294.36414111', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'Hanoi', 100000, 'Tran Manh Ngo', '1234123141231312', '12/22', 2, 360, 1234, 'Pending'),
(8, 27, 'trx_666dba4fb1e655.47559988', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'Hai Phong', 100000, 'tran quang duc', '123412341234', '12/22', 3, 47, 1234, 'Completed'),
(9, 27, 'trx_666dbecd5e7bb1.92764222', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'Hanoi', 100000, 'Tran Manh Ngo', '12341231241231', '12/22', 1, 10, 1234, 'Completed'),
(10, 27, 'trx_666dc4fd692482.37729772', 'Hung Ngo', 'hung@gmail.com', 'Hanoi', 'Vietnam', 'Hanoi', 100000, 'tran quang duc', '12341231312123', '12/22', 2, 55, 1234, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(91, 2, 72, 1, 500),
(92, 2, 73, 1, 500),
(93, 3, 1, 1, 50),
(94, 3, 2, 1, 25),
(95, 3, 3, 1, 30),
(96, 4, 2, 1, 25),
(97, 4, 3, 1, 30),
(98, 5, 3, 1, 30),
(99, 5, 6, 1, 350),
(100, 6, 1, 1, 50),
(101, 6, 3, 1, 32),
(102, 7, 3, 1, 10),
(103, 7, 6, 1, 350),
(104, 8, 10, 1, 20),
(105, 8, 11, 1, 12),
(106, 8, 12, 1, 15),
(107, 9, 17, 1, 10),
(108, 10, 2, 1, 25),
(109, 10, 3, 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR SEASONAL COLOR', 50, 'CONVERSE CHUCK TAYLOR ALL STAR SEASONAL COLOR', 'sale_1.jpg', 'CONVERSE, CHUCK TAYLOR, SEASONAL COLOR'),
(2, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR DIGITAL DAZE', 25, 'CONVERSE CHUCK TAYLOR ALL STAR DIGITAL DAZE', 'sale_2.jpg', 'CONVERSE, CHUCK TAYLOR, DIGITAL DAZE'),
(3, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 30, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_3.jpg', 'CONVERSE, CHUCK TAYLOR, CX'),
(4, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 32, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_4.jpg', 'CONVERSE, CHUCK TAYLOR, CX'),
(5, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 10, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_5.jpg', 'CONVERSE, CHUCK TAYLOR, CX'),
(6, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CREATE FUTURE', 350, 'CONVERSE CHUCK TAYLOR ALL STAR CREATE FUTURE', 'sale_6.jpg', 'CONVERSE, CHUCK TAYLOR, CREATE FUTURE'),
(7, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR DOUBLE UPPER LOGO PLAY', 500, 'CONVERSE CHUCK TAYLOR ALL STAR DOUBLE UPPER LOGO PLAY', 'sale_7.jpg', 'CONVERSE, CHUCK TAYLOR, DOUBLE UPPER LOGO PLAY'),
(8, 1, 5, 'Converse Chuck 70 Nautical Tri Blocked', 400, 'Converse Chuck 70 Nautical Tri Blocked', 'converse_16.jpg', 'CONVERSE, CHUCK 70, NAUTICAL TRI BLOCKED'),
(9, 1, 5, 'Converse Chuck Taylor All Star Pro', 120, 'Converse Chuck Taylor All Star Pro', 'converse_10.jpg', 'CONVERSE, CHUCK TAYLOR, PRO'),
(10, 2, 3, 'VANS UA OLD SKOOL CORDURA 1', 20, 'VANS UA OLD SKOOL CORDURA 1', 'van_1.jpg', 'VANS, OLD SKOOL, CORDURA 1'),
(11, 2, 3, 'VANS UA OLD SKOOL CORDURA 2', 12, 'VANS UA OLD SKOOL CORDURA 2', 'van_2.jpg', 'VANS, OLD SKOOL, CORDURA 2'),
(12, 2, 3, 'VANS UA OLD SKOOL CORDURA 3', 15, 'VANS UA OLD SKOOL CORDURA 3', 'van_3.jpg', 'VANS, OLD SKOOL, CORDURA 3'),
(13, 2, 3, 'VANS UA OLD SKOOL PIG SUEDE', 12, 'VANS UA OLD SKOOL PIG SUEDE', 'van_4.jpg', 'VANS, OLD SKOOL, PIG SUEDE'),
(14, 2, 3, 'VANS UA KNU SKOOL', 14, 'VANS UA KNU SKOOL', 'van_6.jpg', 'VANS, KNU SKOOL'),
(15, 2, 3, 'VANS UA SK8-LOW REARRANGE', 15, 'VANS UA SK8-LOW REARRANGE', 'van_5.jpg', 'VANS, SK8-LOW, REARRANGE'),
(16, 3, 2, 'PALLADIUM PAMPA TRAVEL LITE', 15, 'PALLADIUM PAMPA TRAVEL LITE', 'palladium_1.jpg', 'PALLADIUM, PAMPA TRAVEL LITE'),
(17, 3, 2, 'PALLADIUM PAMPA HI HTG SUPPLY', 10, 'PALLADIUM PAMPA HI HTG SUPPLY', 'palladium_2.jpg', 'PALLADIUM, PAMPA HI HTG SUPPLY'),
(19, 3, 2, 'PALLADIUM PALLABROUSE', 14, 'PALLADIUM PALLABROUSE', 'palladium_3.jpg', 'PALLADIUM, PALLABROUSE'),
(20, 3, 2, 'PALLADIUM PAMPA HI TICKET TO EARTH', 10, 'PALLADIUM PAMPA HI TICKET TO EARTH', 'palladium_4.jpg', 'PALLADIUM, PAMPA HI TICKET TO EARTH'),
(21, 3, 2, 'PALLADIUM PAMPA HI TICKET TO EARTH', 10, 'PALLADIUM PAMPA HI TICKET TO EARTH', 'palladium_5.jpg', 'PALLADIUM, PAMPA HI TICKET TO EARTH'),
(32, 5, 3, 'K-SWISS COURT LITE SPELLOUT S', 25, 'K-SWISS COURT LITE SPELLOUT S', 'k_1.jpg', 'K-SWISS, COURT LITE, SPELLOUT S'),
(50, 3, 2, 'PALLADIUM PAMPA SC RECYCLE WP + N', 16, 'PALLADIUM PAMPA SC RECYCLE WP + N', 'palladium_6.jpg', 'PALLADIUM, PAMPA SC RECYCLE WP + N'),
(51, 3, 2, 'PALLADIUM PAMPA LITE+ RECYCLE WP', 15, 'PALLADIUM PAMPA LITE+ RECYCLE WP', 'palladium_7.jpg', 'PALLADIUM, PAMPA LITE+ RECYCLE WP'),
(52, 3, 2, 'PALLADIUM PALLABROUSSE LEGION', 12, 'PALLADIUM PALLABROUSSE LEGION', 'palladium_8.jpg', 'PALLADIUM, PALLABROUSSE LEGION'),
(53, 3, 2, 'PALLADIUM PAMPA HI MONO CHROME III', 8, 'PALLADIUM PAMPA HI MONO CHROME III', 'palladium_9.jpg', 'PALLADIUM, PAMPA HI MONO CHROME III'),
(54, 3, 3, 'PALLADIUM PAMPA HI MONO CHROME', 8, 'PALLADIUM PAMPA HI MONO CHROME', 'palladium_10.jpg', 'PALLADIUM, PAMPA HI MONO CHROME'),
(55, 3, 3, 'PALLADIUM PAMPA SMILEY DT', 10, 'PALLADIUM PAMPA SMILEY DT', 'palladium_11.jpg', 'PALLADIUM, PAMPA SMILEY DT'),
(56, 3, 2, 'PALLADIUM EASY MULE', 5, 'PALLADIUM EASY MULE', 'palladium_12.jpg', 'PALLADIUM, EASY MULE'),
(57, 3, 2, 'PALLADIUM EVO LITE+ RCYCL WP+', 10, 'PALLADIUM EVO LITE+ RCYCL WP+', 'palladium_13.jpg', 'PALLADIUM, EVO LITE+ RCYCL WP+'),
(58, 3, 2, 'PALLADIUM PALLAPHOENIX FLAME C', 8, 'PALLADIUM PALLAPHOENIX FLAME C', 'palladium_14.jpg', 'PALLADIUM, PALLAPHOENIX FLAME C'),
(59, 3, 2, 'PALLADIUM PAMPA HI SHAKE', 8, 'PALLADIUM PAMPA HI SHAKE', 'palladium_15.jpg', 'PALLADIUM, PAMPA HI SHAKE'),
(70, 3, 2, 'PALLADIUM PAMPALICIOUS POP CORN ', 56, 'PALLADIUM PAMPALICIOUS POP CORN', 'palladium_16.jpg', 'PALLADIUM,POP CORN'),
(71, 1, 5, 'Chuck Taylor All Star 1970s', 4, 'Chuck Taylor All Star 1970s', 'converse_17.jpg', 'Chuck, 1970s'),
(72, 7, 5, 'CONVERSE T-SHIRT GRAPHICS-SS ICON T ', 5, 'CONVERSE T-SHIRT GRAPHICS-SS ICON T ', 'acs_18.jpg', 'CONVERSE, T-SHIRT'),
(73, 7, 5, 'NEO COLOR PACKABLE JACKET', 5, 'NEO COLOR PACKABLE JACKET', 'acs_19.jpg', 'NEO, JACKET'),
(74, 1, 5, 'CONS VOLTAGE MADE IT TO THE TOP', 5, 'CONS VOLTAGE MADE IT TO THE TOP', 'sale_13.jpg', 'CONS, VOLTAGE, MADE IT TO THE TOP'),
(75, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR MADE IT TO THE TOP', 4, 'CONVERSE CHUCK TAYLOR ALL STAR MADE IT TO THE TOP', 'sale_14.jpg', 'CONVERSE, CHUCK TAYLOR, MADE IT TO THE TOP'),
(76, 1, 5, 'Converse Huy Tran', 45, 'Converse Huy Tran', 'sale_15.jpg', 'CONVERSE, HUY TRAN'),
(82, 2, 3, 'VANS UA OLD SKOOL BALLISTIC MIX', 15, 'VANS UA OLD SKOOL BALLISTIC MIX', 'van_7.jpg', 'VANS, UA OLD SKOOL, BALLISTIC MIX'),
(83, 2, 3, 'VANS UA OLD SKOOL OVERSIZED LACES', 13, 'VANS UA OLD SKOOL OVERSIZED LACES', 'van_8.jpg', 'VANS, UA OLD SKOOL, OVERSIZED LACES'),
(84, 2, 3, 'VANS UA CLASSIC SLIP-ON VR3 GROWTH GARDEN VR3', 18, 'VANS UA CLASSIC SLIP-ON VR3 GROWTH GARDEN VR3', 'van_9.jpg', 'VANS, UA CLASSIC SLIP-ON, VR3 GROWTH GARDEN VR3'),
(85, 2, 3, 'VANS UA AUTHENTIC VR3 GROWTH GARDEN VR3', 17, 'VANS UA AUTHENTIC VR3 GROWTH GARDEN VR3', 'van_10.jpg', 'VANS, UA AUTHENTIC, VR3 GROWTH GARDEN VR3'),
(86, 2, 2, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 16, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 'van_11.jpg', 'VANS, UA OLD SKOOL, VR3 GROWTH GARDEN VR3'),
(87, 2, 3, 'VANS UA AUTHENTIC COLOR THEORY', 19, 'VANS UA AUTHENTIC COLOR THEORY', 'van_13.jpg', 'VANS, UA AUTHENTIC, COLOR THEORY'),
(88, 2, 3, 'VANS UA CLASSIC SLIP-ON COLOR THEORY', 19, 'VANS UA CLASSIC SLIP-ON COLOR THEORY', 'van_12.jpg', 'VANS, UA CLASSIC SLIP-ON, COLOR THEORY'),
(89, 2, 2, 'VANS UA OLD SKOOL 36 DX', 19, 'VANS UA OLD SKOOL 36 DX', 'van_14.jpg', 'VANS, UA OLD SKOOL, 36 DX'),
(90, 2, 3, 'VANS UA OLD SKOOL LIVE AT HOV', 19, 'VANS UA OLD SKOOL LIVE AT HOV', 'van_15.jpg', 'VANS, UA OLD SKOOL, LIVE AT HOV'),
(93, 5, 3, 'K-SWISS COURT LITE SPELLOUT S', 12, 'K-SWISS COURT LITE SPELLOUT S', 'K_2.jpg', 'K-SWISS, COURT LITE, SPELLOUT S'),
(94, 5, 3, 'K-SWISS SI-DEFIER 7.0', 12, 'K-SWISS SI-DEFIER 7.0', 'K_3.jpg', 'K-SWISS, SI-DEFIER 7.0'),
(95, 5, 3, 'K-SWISS CLASSIC VN', 12, 'K-SWISS CLASSIC VN', 'K_4.jpg', 'K-SWISS, CLASSIC VN'),
(96, 5, 3, 'K-SWISS HOKE CMF', 12, 'K-SWISS HOKE CMF', 'K_5.jpg', 'K-SWISS, HOKE CMF'),
(97, 5, 3, 'K-SWISS ST329 CMF', 12, 'K-SWISS ST329 CMF', 'K_6.jpg', 'K-SWISS, ST329 CMF'),
(98, 5, 3, 'K-SWISS GEN-K ICON KNIT', 12, 'K-SWISS GEN-K ICON KNIT', 'K_7.jpg', 'K-SWISS, GEN-K ICON KNIT'),
(99, 5, 3, 'K-SWISS AEROSWIFT', 12, 'K-SWISS AEROSWIFT', 'K_8.jpg', 'K-SWISS, AEROSWIFT'),
(100, 5, 3, 'K-SWISS TUBES MILLENNIUM', 12, 'K-SWISS TUBES MILLENNIUM', 'K_9.jpg', 'K-SWISS, TUBES MILLENNIUM'),
(101, 5, 3, 'K-SWISS X-160', 12, 'K-SWISS X-160', 'K_10.jpg', 'K-SWISS, X-160'),
(102, 5, 3, 'K-SWISS COURT PRO II', 12, 'K-SWISS COURT PRO II', 'K_11.jpg', 'K-SWISS, COURT PRO II'),
(103, 5, 3, 'K-SWISS VENDEN', 12, 'K-SWISS VENDEN', 'K_12.jpg', 'K-SWISS, VENDEN'),
(104, 5, 3, 'K-SWISS HOKE VULC', 12, 'K-SWISS HOKE VULC', 'K_13.jpg', 'K-SWISS, HOKE VULC'),
(105, 5, 3, 'K-SWISS X-LITE ATHLETIC', 12, 'K-SWISS X-LITE ATHLETIC', 'K_14.jpg', 'K-SWISS, X-LITE ATHLETIC'),
(106, 5, 3, 'K-SWISS BIGSHOT LIGHT', 12, 'K-SWISS BIGSHOT LIGHT', 'K_15.jpg', 'K-SWISS, BIGSHOT LIGHT'),
(107, 4, 3, 'New Balance 530 Retro Khaki', 13, 'New Balance 530 Retro Khaki', 'nb_1.jpg', 'NEW BALANCE, 530, RETRO KHAKI'),
(108, 4, 3, 'New Balance 530 Retro Running Navy', 18, 'New Balance 530 Retro Running Navy', 'nb_2.png', 'NEW BALANCE, 530, RETRO RUNNING NAVY'),
(109, 4, 3, 'New Balance 530 Beige Angora', 21, 'New Balance 530 Beige Angora', 'nb_3.jpg', 'NEW BALANCE, 530, BEIGE ANGORA'),
(110, 4, 3, 'New Balance 574 Classic Lifestyle', 23, 'New Balance 574 Classic Lifestyle', 'nb_4.jpg', 'NEW BALANCE, 574, CLASSIC LIFESTYLE'),
(111, 4, 3, 'New Balance 550 Dusty Blue', 24, 'New Balance 550 Dusty Blue', 'nb_5.jpg', 'NEW BALANCE, 550, DUSTY BLUE'),
(112, 4, 3, 'New Balance 550 Triple White', 12, 'New Balance 550 Triple White', 'nb_6.jpg', 'NEW BALANCE, 550, TRIPLE WHITE'),
(113, 4, 1, 'New Balance 200v2 Adjustable SUA200K2', 15, 'New Balance 200v2 Adjustable SUA200K2', 'nb_7.jpg', 'NEW BALANCE, 200v2, ADJUSTABLE SUA200K2'),
(114, 4, 1, 'New Balance 550 Triple White BB550WWW', 18, 'New Balance 550 Triple White BB550WWW', 'nb_8.jpg', 'NEW BALANCE, 550, TRIPLE WHITE BB550WWW'),
(115, 4, 1, 'New Balance Laser Performance Run Hat LAH21102_WT', 22, 'New Balance Laser Performance Run Hat LAH21102_WT', 'nb_9.jpg', 'NEW BALANCE, LASER PERFORMANCE, RUN HAT'),
(116, 4, 1, 'New Balance Classic NB Curved Brim Hat LAH91014_BK', 27, 'New Balance Classic NB Curved Brim Hat LAH91014_BK', 'nb_10.jpg', 'NEW BALANCE, CLASSIC NB, CURVED BRIM HAT'),
(117, 4, 4, 'New Balance 530 Beige Angora MR530AA', 12, 'New Balance 530 Beige Angora MR530AA', 'nb_11.jpg', 'NEW BALANCE, 530, BEIGE ANGORA MR530AA'),
(118, 4, 4, 'New Balance 530 Retro Running Navy MR530SG', 14, 'New Balance 530 Retro Running Navy MR530SG', 'nb_12.jpg', 'NEW BALANCE, 530, RETRO RUNNING NAVY MR530SG'),
(119, 3, 4, 'PALLADIUM PAMPALICIOUS BLOSSOM', 12, 'PALLADIUM PAMPALICIOUS BLOSSOM', 'palladium_19.jpg', 'PALLADIUM, PAMPALICIOUS BLOSSOM'),
(120, 3, 4, 'PALLADIUM PAMPA HI SHAKE', 15, 'PALLADIUM PAMPA HI SHAKE', 'palladium_17.jpg', 'PALLADIUM, HI SHAKE'),
(121, 3, 4, 'PALLADIUM JAZZELLE PALLAKIX HI CVS', 16, 'PALLADIUM JAZZELLE PALLAKIX HI CVS', 'palladium_18.jpg', 'Palladium, Jazelle'),
(125, 8, 3, 'Supra Stacks II VULC - 08193-069-M', 54, 'Low-top design Supra Stacks II VULC with Canvas-Suede material, Neon tones Vulcanized sole.', 'supra1.jpg', 'LOW-TOP, SUPRA, CANVAS, SUEDE, NEON'),
(126, 8, 2, 'Supra Aluminum - 05662-816-M', 60, 'High-top Supra Aluminum with trendy yellow tones, high-quality Canvas, durable rubber sole.', 'supra2.jpg', 'HIGH-TOP, SUPRA, CANVAS, YELLOW'),
(127, 8, 2, 'Supra Aluminum - 05662-002-M', 60, 'Bold high-top Supra Aluminum with black Canvas, Vulcanized rubber sole, metal crown logo.', 'supra3.jpg', 'HIGH-TOP, SUPRA, CANVAS, BLACK'),
(128, 8, 2, 'Supra Aluminum - 05662-622-M', 60, 'Stylish high-top Supra Aluminum with trendy Red-White tones, high-quality materials.', 'supra4.jpg', 'HIGH-TOP, SUPRA, RED, WHITE'),
(129, 8, 3, 'Supra Chino - 08051-401-M', 45, 'Simple and youthful Supra Chino with dynamic blue tone, Canvas-suede materials.', 'supra5.jpg', 'SIMPLE, YOUTHFUL, SUPRA, CANVAS, SUEDE, BLUE'),
(131, 8, 3, 'Supra Hammer VTG - 06123-002-M', 54, 'Vintage design Supra Hammer VTG with suede-Canvas materials, black tones, white borders.', 'supra7.jpg', 'VINTAGE, SUPRA, SUEDE, CANVAS, BLACK, WHITE'),
(132, 8, 2, 'Supra Vaider - 08204-049-M', 63, 'Stylish high-top SUPRA Vaider with Gray-Red tones, premium Canvas-Suede materials.', 'supra8.jpg', 'STYLISH, HIGH-TOP, SUPRA, VAIDER, GRAY, RED, CANVAS, SUEDE'),
(133, 8, 2, 'Supra Vaider - 08044-058-M', 63, 'High-top style Supra Vaider with minimalist design, premium fabric material.', 'supra9.jpg', 'HIGH-TOP, SUPRA, MINIMALIST, PREMIUM, FABRIC'),
(134, 8, 2, 'Supra Skytop - 98002-025-M', 81, 'Bold camo pattern Supra Skytop, high-quality rubber sole, thicker tongue-collars for comfort.', 'supra10.jpg', 'CAMO, SUPRA, SKYTOP, RUBBER, ANTI-SLIP'),
(135, 8, 2, 'Supra Skytop - 98002-110-M', 81, 'Fashionable white camo pattern Supra Skytop, high-quality rubber sole, thicker tongue-collars for comfort.', 'supra11.jpg', 'WHITE, CAMO, SUPRA, SKYTOP, RUBBER, ANTI-SLIP'),
(136, 8, 2, 'Supra Stacks Mid - 05903-658-M', 63, 'Canvas-red suede fabric Supra Stacks Mid with white SUPRA logo, versatile and comfortable.', 'supra12.jpg', 'CANVAS, SUEDE, SUPRA, STACKS MID, RED, WHITE'),
(137, 8, 3, 'SILVER VAIDER', 90, 'Best choice', 'supra17.jpg', 'SILVER, OUTDOOR'),
(140, 8, 3, 'COURT LEGACY', 100, 'Beige', 'supra18.jpg', 'BEIGE, RUNNING'),
(141, 8, 3, 'Supra Flow - 08325-360-M', 54, 'Slip-On Supra Flow with camouflage pattern, Suede-Canvas material, horizontal round lace.', 'supra6.jpg', 'SLIP-ON, SUPRA, CAMOUFLAGE, SUEDE, CANVAS'),
(142, 8, 3, 'Vaider Yellow', 70, 'yellow vaider', 'supra16.jpg', 'YELLOW, BIG BOY'),
(143, 8, 3, 'Vaider Maxi', 75, 'white vaider', 'supra15.jpg', 'WHITE, VAIDER'),
(145, 8, 3, 'Supra Cobalt - 05663-093-M', 48, 'Simple black tone Supra Cobalt with gold zigzag stitching, lightweight Canvas, premium rubber sole.', 'supra13.jpg', 'SIMPLE, BLACK, SUPRA, COBALT, GOLD, CANVAS, RUBBER'),
(170, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR CONSTRUCT', 20, 'CONVERSE CHUCK TAYLOR ALL STAR CONSTRUCT', 'converse_1.jpg', 'CONVERSE, CHUCK TAYLOR, CONSTRUCT'),
(171, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR FUTURE UTILITY', 12, 'CONVERSE CHUCK TAYLOR ALL STAR FUTURE UTILITY', 'converse_2.jpg', 'CONVERSE, CHUCK TAYLOR, FUTURE UTILITY'),
(172, 1, 3, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE LOW TOP', 15, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE LOW TOP', 'converse_3.jpg', 'CONVERSE, CHUCK TAYLOR, FALL TONE, LOW TOP'),
(173, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE HIGH TOP', 20, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE HIGH TOP', 'converse_4.jpg', 'CONVERSE, CHUCK TAYLOR, FALL TONE, HIGH TOP'),
(174, 1, 2, 'CONVERSE RUN STAR LEGACY CX', 14, 'CONVERSE RUN STAR LEGACY CX', 'converse_5.jpg', 'CONVERSE, RUN STAR LEGACY CX'),
(175, 1, 2, 'CONVERSE RUN STAR LEGACY CX', 15, 'CONVERSE RUN STAR LEGACY CX', 'converse_6.jpg', 'CONVERSE, RUN STAR LEGACY CX'),
(176, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 15, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 'converse_7.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, TEAL UNIVERSE'),
(177, 1, 3, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 13, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 'converse_8.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, TEAL UNIVERSE'),
(178, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 18, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'converse_9.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, ORIGIN STORY'),
(179, 1, 3, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 17, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'converse_10.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, ORIGIN STORY'),
(180, 1, 3, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 16, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 'converse_11.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM'),
(181, 1, 2, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 19, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 'converse_12.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM'),
(182, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR CX EXPLORE', 19, 'CONVERSE CHUCK TAYLOR ALL STAR CX EXPLORE', 'converse_13.jpg', 'CONVERSE, CHUCK TAYLOR, CX EXPLORE'),
(183, 1, 2, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 19, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 'converse_14.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM, HIGH TOP'),
(185, 7, 4, 'SNEAKER BUZZ SHOE KEYCHAIN - LOGO TAG', 20, 'SNEAKER BUZZ SHOE KEYCHAIN - LOGO TAG', 'acs_1.jpg', 'SNEAKER BUZZ, SHOE KEYCHAIN, LOGO TAG'),
(186, 7, 4, 'NEW BALANCE LASER PERFORMANCE RUN HAT', 12, 'NEW BALANCE LASER PERFORMANCE RUN HAT', 'acs_2.jpg', 'NEW BALANCE, LASER PERFORMANCE, RUN HAT'),
(187, 7, 4, 'VANS WM HALF CREW WMN 6.5-10 1PK', 15, 'VANS WM HALF CREW WMN 6.5-10 1PK', 'acs_3.jpg', 'VANS, WM HALF CREW, WMN 6.5-10, 1PK'),
(188, 7, 4, 'VANS MN OLD SKOOL DROP V BACKPACK', 20, 'VANS MN OLD SKOOL DROP V BACKPACK', 'acs_4.jpg', 'VANS, MN OLD SKOOL, DROP V, BACKPACK'),
(189, 7, 4, 'VANS OC CROSS BODY BAG', 14, 'VANS OC CROSS BODY BAG', 'acs_5.jpg', 'VANS, OC CROSS BODY, BAG'),
(190, 7, 4, 'VANS GYM CLASS WAISTBAG', 15, 'VANS GYM CLASS WAISTBAG', 'acs_6.jpg', 'VANS, GYM CLASS, WAISTBAG'),
(191, 7, 4, 'VANS WARD CROSS BODY PACK BAG', 15, 'VANS WARD CROSS BODY PACK BAG', 'acs_7.jpg', 'VANS, WARD CROSS BODY, PACK BAG'),
(192, 7, 4, 'VANS AP THE ULTRASAKE CROSSBODY', 13, 'VANS AP THE ULTRASAKE CROSSBODY', 'acs_8.jpg', 'VANS, AP THE ULTRASAKE, CROSSBODY'),
(193, 7, 4, 'V? VANS BROOKLAND CANOODLE', 18, 'V? VANS BROOKLAND CANOODLE', 'acs_9.jpg', 'V? VANS, BROOKLAND CANOODLE'),
(194, 1, 2, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 19, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 'converse_15.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM, HIGH TOP'),
(195, 7, 4, 'SUPRA TRADEMARK', 16, 'SUPRA TRADEMARK', 'acs_11.jpg', 'SUPRA, TRADEMARK'),
(196, 7, 4, 'SUPRA TRADEMARK', 19, 'SUPRA TRADEMARK', 'acs_12.jpg', 'SUPRA, TRADEMARK'),
(197, 7, 4, 'VANS FULL PATCH T-SHIRT', 19, 'VANS FULL PATCH T-SHIRT', 'acs_13.jpg', 'VANS, FULL PATCH, T-SHIRT'),
(198, 7, 4, 'SUMMER SHIRT', 19, 'SUMMER SHIRT', 'acs_14.jpg', 'SUMMER, SHIRT'),
(199, 7, 4, 'BEACH GOING SHIRT', 19, 'BEACH GOING SHIRT', 'acs_15.jpg', 'BEACH GOING, SHIRT'),
(200, 7, 4, 'V? VANS CLASSIC CANOODLE 6.5 - 9 3PK', 17, 'V? VANS CLASSIC CANOODLE 6.5 - 9 3PK', 'acs_10.jpg', 'V? VANS, CLASSIC CANOODLE, 6.5-9, 3PK'),
(203, 6, 1, 'DÉP BUZZ Y-STRAP DAISY', 1, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_1.jpg', 'DÉP BUZZ, Y-STRAP DAISY'),
(204, 6, 1, 'DÉP BUZZ Y-STRAP DAISY', 1, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_2.jpg', 'DÉP BUZZ, Y-STRAP DAISY'),
(205, 6, 1, 'DÉP BUZZ Y-STRAP DAISY', 1, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_3.jpg', 'DÉP BUZZ, Y-STRAP DAISY'),
(206, 6, 1, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 1, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 'snkb_4.jpg', 'DÉP SNEAKER BUZZ, CLASSIC SLIDE II'),
(207, 6, 1, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 1, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 'snkb_5.jpg', 'DÉP SNEAKER BUZZ, CLASSIC SLIDE II'),
(208, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_6.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP ADVANTURE'),
(209, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_7.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP ADVANTURE'),
(210, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_8.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP ADVANTURE'),
(211, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP DENIM', 1, 'DÉP SNEAKER BUZZ Y-STRAP DENIM', 'snkb_9.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP DENIM'),
(212, 6, 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'snkb_10.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, ORIGIN STORY'),
(213, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP DECONSTRUCTION', 1, 'DÉP SNEAKER BUZZ Y-STRAP DECONSTRUCTION', 'snkb_11.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP DECONSTRUCTION'),
(214, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_12.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE'),
(215, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_13.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE'),
(216, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_14.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE'),
(217, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_15.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Shohanur', 'Rahman', 'shohan@apricotstore.com', 'shohan', '9448121558', 'DSC', 'Dhaka'),
(15, 'Mehedi', 'Hasan', 'mehedi@apricotstore.com', 'mehedi', '536487276', ',DSC', 'Dhaka'),
(19, 'Niloy', 'Hasan', 'niloy@apricotstore.com', 'niloy', '9871236534', 'DSC', 'Dhaka'),
(22, 'Maruf', 'Mia', 'maruf@apricotstore.com', 'maruf', '9877654334', 'DSC', 'Dhaka'),
(25, 'rafin', 'Molla', 'rafin@apricotstore.com', 'rafin', '9535688928', 'DSC', 'Dhaka'),
(26, 'Tran', 'Duc', 'ductran@gmail.com', 'Abc123', '014394332', 'Lao Cai', 'Lao Cai'),
(27, 'Hung', 'Ngo', 'hung@gmail.com', '1234567890', '0987654321', 'Hanoi', 'Vietnam'),
(28, 'Tran ', 'Duc', 'tranduc1230@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(29, 'Nigga', 'What', 'nigga@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(30, 'Huong', 'Thanh', 'huongmai@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(32, 'Tran', 'Manh Ngo', 'huy123@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_order_id` (`order_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `idx_product_cat` (`product_cat`),
  ADD KEY `idx_product_brand` (`product_brand`),
  ADD KEY `idx_product_title` (`product_title`),
  ADD KEY `idx_product_cat_brand_title` (`product_cat`,`product_brand`,`product_title`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
