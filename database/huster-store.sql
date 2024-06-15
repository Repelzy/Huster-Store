-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2024 at 04:36 PM
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

<<<<<<< HEAD

=======
-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
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
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Shohan', 'help.shohan@gmail.com', 'Dhaka, Khulna, Barisal', 'Daffodil Smart City', 'Barisal', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 32, 'Tran Manh Ngo', 'huy123@gmail.com', 'Hanoi', 'Vietnam', 'Hai Phong', 100000, 'Tran Manh Ngo', '9876765387340982', '12/22', 2, 1000, 1234);

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
(92, 2, 73, 1, 500);

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
<<<<<<< HEAD
INSERT INTO `products` (`product_id`, `product_brand`, `product_cat`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR SEASONAL COLOR', 50.00, 'CONVERSE CHUCK TAYLOR ALL STAR SEASONAL COLOR', 'sale_1.jpg', 'CONVERSE, CHUCK TAYLOR, SEASONAL COLOR'),
(2, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR DIGITAL DAZE', 25.00, 'CONVERSE CHUCK TAYLOR ALL STAR DIGITAL DAZE', 'sale_2.jpg', 'CONVERSE, CHUCK TAYLOR, DIGITAL DAZE'),
(3, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 30.00, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_3.jpg', 'CONVERSE, CHUCK TAYLOR, CX'),
(4, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 32.00, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_4.jpg', 'CONVERSE, CHUCK TAYLOR, CX'),
(5, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 10.00, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_5.jpg', 'CONVERSE, CHUCK TAYLOR, CX'),
(6, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR CREATE FUTURE', 350.00, 'CONVERSE CHUCK TAYLOR ALL STAR CREATE FUTURE', 'sale_6.jpg', 'CONVERSE, CHUCK TAYLOR, CREATE FUTURE'),
(7, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR DOUBLE UPPER LOGO PLAY', 500.00, 'CONVERSE CHUCK TAYLOR ALL STAR DOUBLE UPPER LOGO PLAY', 'sale_7.jpg', 'CONVERSE, CHUCK TAYLOR, DOUBLE UPPER LOGO PLAY'),
(8, 5, 1, 'Converse Chuck 70 Nautical Tri Blocked', 400.00, 'Converse Chuck 70 Nautical Tri Blocked', 'converse_16.jpg', 'CONVERSE, CHUCK 70, NAUTICAL TRI BLOCKED'),
(9, 5, 1, 'Converse Chuck Taylor All Star Pro', 120.00, 'Converse Chuck Taylor All Star Pro', 'converse_10.jpg', 'CONVERSE, CHUCK TAYLOR, PRO'),
(10, 3, 2, 'VANS UA OLD SKOOL CORDURA 1', 20.00, 'VANS UA OLD SKOOL CORDURA 1', 'van_1.jpg', 'VANS, OLD SKOOL, CORDURA 1'),
(11, 3, 2, 'VANS UA OLD SKOOL CORDURA 2', 12.00, 'VANS UA OLD SKOOL CORDURA 2', 'van_2.jpg', 'VANS, OLD SKOOL, CORDURA 2'),
(12, 3, 2, 'VANS UA OLD SKOOL CORDURA 3', 15.00, 'VANS UA OLD SKOOL CORDURA 3', 'van_3.jpg', 'VANS, OLD SKOOL, CORDURA 3'),
(13, 3, 2, 'VANS UA OLD SKOOL PIG SUEDE', 12.00, 'VANS UA OLD SKOOL PIG SUEDE', 'van_4.jpg', 'VANS, OLD SKOOL, PIG SUEDE'),
(14, 3, 2, 'VANS UA KNU SKOOL', 14.00, 'VANS UA KNU SKOOL', 'van_6.jpg', 'VANS, KNU SKOOL'),
(15, 3, 2, 'VANS UA SK8-LOW REARRANGE', 15.00, 'VANS UA SK8-LOW REARRANGE', 'van_5.jpg', 'VANS, SK8-LOW, REARRANGE'),
(16, 2, 3, 'PALLADIUM PAMPA TRAVEL LITE', 15.00, 'PALLADIUM PAMPA TRAVEL LITE', 'palladium_1.jpg', 'PALLADIUM, PAMPA TRAVEL LITE'),
(17, 2, 3, 'PALLADIUM PAMPA HI HTG SUPPLY', 10.00, 'PALLADIUM PAMPA HI HTG SUPPLY', 'palladium_2.jpg', 'PALLADIUM, PAMPA HI HTG SUPPLY'),
(19, 2, 3, 'PALLADIUM PALLABROUSE', 14.00, 'PALLADIUM PALLABROUSE', 'palladium_3.jpg', 'PALLADIUM, PALLABROUSE'),
(20, 2, 3, 'PALLADIUM PAMPA HI TICKET TO EARTH', 10.00, 'PALLADIUM PAMPA HI TICKET TO EARTH', 'palladium_4.jpg', 'PALLADIUM, PAMPA HI TICKET TO EARTH'),
(21, 2, 3, 'PALLADIUM PAMPA HI TICKET TO EARTH', 10.00, 'PALLADIUM PAMPA HI TICKET TO EARTH', 'palladium_5.jpg', 'PALLADIUM, PAMPA HI TICKET TO EARTH'),
(32, 3, 5, 'K-SWISS COURT LITE SPELLOUT S', 25.00, 'K-SWISS COURT LITE SPELLOUT S', 'k_1.jpg', 'K-SWISS, COURT LITE, SPELLOUT S'),
(50, 2, 3, 'PALLADIUM PAMPA SC RECYCLE WP + N', 16.00, 'PALLADIUM PAMPA SC RECYCLE WP + N', 'palladium_6.jpg', 'PALLADIUM, PAMPA SC RECYCLE WP + N'),
(51, 2, 3, 'PALLADIUM PAMPA LITE+ RECYCLE WP', 15.00, 'PALLADIUM PAMPA LITE+ RECYCLE WP', 'palladium_7.jpg', 'PALLADIUM, PAMPA LITE+ RECYCLE WP'),
(52, 2, 3, 'PALLADIUM PALLABROUSSE LEGION', 12.00, 'PALLADIUM PALLABROUSSE LEGION', 'palladium_8.jpg', 'PALLADIUM, PALLABROUSSE LEGION'),
(53, 2, 3, 'PALLADIUM PAMPA HI MONO CHROME III', 8.00, 'PALLADIUM PAMPA HI MONO CHROME III', 'palladium_9.jpg', 'PALLADIUM, PAMPA HI MONO CHROME III'),
(54, 3, 3, 'PALLADIUM PAMPA HI MONO CHROME', 8.00, 'PALLADIUM PAMPA HI MONO CHROME', 'palladium_10.jpg', 'PALLADIUM, PAMPA HI MONO CHROME'),
(55, 3, 3, 'PALLADIUM PAMPA SMILEY DT', 10.00, 'PALLADIUM PAMPA SMILEY DT', 'palladium_11.jpg', 'PALLADIUM, PAMPA SMILEY DT'),
(56, 2, 3, 'PALLADIUM EASY MULE', 5.00, 'PALLADIUM EASY MULE', 'palladium_12.jpg', 'PALLADIUM, EASY MULE'),
(57, 2, 3, 'PALLADIUM EVO LITE+ RCYCL WP+', 10.00, 'PALLADIUM EVO LITE+ RCYCL WP+', 'palladium_13.jpg', 'PALLADIUM, EVO LITE+ RCYCL WP+'),
(58, 2, 3, 'PALLADIUM PALLAPHOENIX FLAME C', 8.00, 'PALLADIUM PALLAPHOENIX FLAME C', 'palladium_14.jpg', 'PALLADIUM, PALLAPHOENIX FLAME C'),
(59, 2, 3, 'PALLADIUM PAMPA HI SHAKE', 8.00, 'PALLADIUM PAMPA HI SHAKE', 'palladium_15.jpg', 'PALLADIUM, PAMPA HI SHAKE'),
(71, 5, 1, 'VANS UA ERA PIG SUEDE', 4.00, 'VANS UA ERA PIG SUEDE', 'sale_10.jpg', 'VANS, UA ERA, PIG SUEDE'),
(72, 5, 7, 'VANS UA OLD SKOOL LIVE AT HOV', 5.00, 'VANS UA OLD SKOOL LIVE AT HOV', 'sale_11.jpg', 'VANS, UA OLD SKOOL, LIVE AT HOV'),
(73, 5, 7, 'VANS UA ERA LIVE AT HOV', 5.00, 'VANS UA ERA LIVE AT HOV', 'sale_12.jpg', 'VANS, UA ERA, LIVE AT HOV'),
(74, 5, 1, 'CONS VOLTAGE MADE IT TO THE TOP', 4.50, 'CONS VOLTAGE MADE IT TO THE TOP', 'sale_13.jpg', 'CONS, VOLTAGE, MADE IT TO THE TOP'),
(75, 5, 1, 'CONVERSE CHUCK TAYLOR ALL STAR MADE IT TO THE TOP', 4.00, 'CONVERSE CHUCK TAYLOR ALL STAR MADE IT TO THE TOP', 'sale_14.jpg', 'CONVERSE, CHUCK TAYLOR, MADE IT TO THE TOP'),
(76, 5, 1, 'Converse Huy Tran', 45.00, 'Converse Huy Tran', 'sale_15.jpg', 'CONVERSE, HUY TRAN'),
(82, 3, 2, 'VANS UA OLD SKOOL BALLISTIC MIX', 15.00, 'VANS UA OLD SKOOL BALLISTIC MIX', 'van_7.jpg', 'VANS, UA OLD SKOOL, BALLISTIC MIX'),
(83, 3, 2, 'VANS UA OLD SKOOL OVERSIZED LACES', 13.00, 'VANS UA OLD SKOOL OVERSIZED LACES', 'van_8.jpg', 'VANS, UA OLD SKOOL, OVERSIZED LACES'),
(84, 3, 2, 'VANS UA CLASSIC SLIP-ON VR3 GROWTH GARDEN VR3', 18.00, 'VANS UA CLASSIC SLIP-ON VR3 GROWTH GARDEN VR3', 'van_9.jpg', 'VANS, UA CLASSIC SLIP-ON, VR3 GROWTH GARDEN VR3'),
(85, 3, 2, 'VANS UA AUTHENTIC VR3 GROWTH GARDEN VR3', 17.00, 'VANS UA AUTHENTIC VR3 GROWTH GARDEN VR3', 'van_10.jpg', 'VANS, UA AUTHENTIC, VR3 GROWTH GARDEN VR3'),
(86, 2, 2, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 16.00, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 'van_11.jpg', 'VANS, UA OLD SKOOL, VR3 GROWTH GARDEN VR3'),
(87, 3, 2, 'VANS UA AUTHENTIC COLOR THEORY', 19.00, 'VANS UA AUTHENTIC COLOR THEORY', 'van_13.jpg', 'VANS, UA AUTHENTIC, COLOR THEORY'),
(88, 3, 2, 'VANS UA CLASSIC SLIP-ON COLOR THEORY', 19.00, 'VANS UA CLASSIC SLIP-ON COLOR THEORY', 'van_12.jpg', 'VANS, UA CLASSIC SLIP-ON, COLOR THEORY'),
(89, 2, 2, 'VANS UA OLD SKOOL 36 DX', 19.00, 'VANS UA OLD SKOOL 36 DX', 'van_14.jpg', 'VANS, UA OLD SKOOL, 36 DX'),
(90, 3, 2, 'VANS UA OLD SKOOL LIVE AT HOV', 19.00, 'VANS UA OLD SKOOL LIVE AT HOV', 'van_15.jpg', 'VANS, UA OLD SKOOL, LIVE AT HOV'),
(93, 3, 5, 'K-SWISS COURT LITE SPELLOUT S', 12.00, 'K-SWISS COURT LITE SPELLOUT S', 'K_2.jpg', 'K-SWISS, COURT LITE, SPELLOUT S'),
(94, 3, 5, 'K-SWISS SI-DEFIER 7.0', 12.00, 'K-SWISS SI-DEFIER 7.0', 'K_3.jpg', 'K-SWISS, SI-DEFIER 7.0'),
(95, 3, 5, 'K-SWISS CLASSIC VN', 12.00, 'K-SWISS CLASSIC VN', 'K_4.jpg', 'K-SWISS, CLASSIC VN'),
(96, 3, 5, 'K-SWISS HOKE CMF', 12.00, 'K-SWISS HOKE CMF', 'K_5.jpg', 'K-SWISS, HOKE CMF'),
(97, 3, 5, 'K-SWISS ST329 CMF', 12.00, 'K-SWISS ST329 CMF', 'K_6.jpg', 'K-SWISS, ST329 CMF'),
(98, 3, 5, 'K-SWISS GEN-K ICON KNIT', 12.00, 'K-SWISS GEN-K ICON KNIT', 'K_7.jpg', 'K-SWISS, GEN-K ICON KNIT'),
(99, 3, 5, 'K-SWISS AEROSWIFT', 12.00, 'K-SWISS AEROSWIFT', 'K_8.jpg', 'K-SWISS, AEROSWIFT'),
(100, 3, 5, 'K-SWISS TUBES MILLENNIUM', 12.00, 'K-SWISS TUBES MILLENNIUM', 'K_9.jpg', 'K-SWISS, TUBES MILLENNIUM'),
(101, 3, 5, 'K-SWISS X-160', 12.00, 'K-SWISS X-160', 'K_10.jpg', 'K-SWISS, X-160'),
(102, 3, 5, 'K-SWISS COURT PRO II', 12.00, 'K-SWISS COURT PRO II', 'K_11.jpg', 'K-SWISS, COURT PRO II'),
(103, 3, 5, 'K-SWISS VENDEN', 12.00, 'K-SWISS VENDEN', 'K_12.jpg', 'K-SWISS, VENDEN'),
(104, 3, 5, 'K-SWISS HOKE VULC', 12.00, 'K-SWISS HOKE VULC', 'K_13.jpg', 'K-SWISS, HOKE VULC'),
(105, 3, 5, 'K-SWISS X-LITE ATHLETIC', 12.00, 'K-SWISS X-LITE ATHLETIC', 'K_14.jpg', 'K-SWISS, X-LITE ATHLETIC'),
(106, 3, 5, 'K-SWISS BIGSHOT LIGHT', 12.00, 'K-SWISS BIGSHOT LIGHT', 'K_15.jpg', 'K-SWISS, BIGSHOT LIGHT'),
(107, 3, 4, 'New Balance 530 Retro Khaki', 13.00, 'New Balance 530 Retro Khaki', 'nb_1.jpg', 'NEW BALANCE, 530, RETRO KHAKI'),
(108, 3, 4, 'New Balance 530 Retro Running Navy', 18.00, 'New Balance 530 Retro Running Navy', 'nb_2.png', 'NEW BALANCE, 530, RETRO RUNNING NAVY'),
(109, 3, 4, 'New Balance 530 Beige Angora', 21.00, 'New Balance 530 Beige Angora', 'nb_3.jpg', 'NEW BALANCE, 530, BEIGE ANGORA'),
(110, 3, 4, 'New Balance 574 Classic Lifestyle', 23.00, 'New Balance 574 Classic Lifestyle', 'nb_4.jpg', 'NEW BALANCE, 574, CLASSIC LIFESTYLE'),
(111, 3, 4, 'New Balance 550 Dusty Blue', 24.00, 'New Balance 550 Dusty Blue', 'nb_5.jpg', 'NEW BALANCE, 550, DUSTY BLUE'),
(112, 3, 4, 'New Balance 550 Triple White', 12.00, 'New Balance 550 Triple White', 'nb_6.jpg', 'NEW BALANCE, 550, TRIPLE WHITE'),
(113, 1, 4, 'New Balance 200v2 Adjustable SUA200K2', 15.00, 'New Balance 200v2 Adjustable SUA200K2', 'nb_7.jpg', 'NEW BALANCE, 200v2, ADJUSTABLE SUA200K2'),
(114, 1, 4, 'New Balance 550 Triple White BB550WWW', 18.00, 'New Balance 550 Triple White BB550WWW', 'nb_8.jpg', 'NEW BALANCE, 550, TRIPLE WHITE BB550WWW'),
(115, 1, 4, 'New Balance Laser Performance Run Hat LAH21102_WT', 22.00, 'New Balance Laser Performance Run Hat LAH21102_WT', 'nb_9.jpg', 'NEW BALANCE, LASER PERFORMANCE, RUN HAT'),
(116, 1, 4, 'New Balance Classic NB Curved Brim Hat LAH91014_BK', 27.00, 'New Balance Classic NB Curved Brim Hat LAH91014_BK', 'nb_10.jpg', 'NEW BALANCE, CLASSIC NB, CURVED BRIM HAT'),
(117, 4, 4, 'New Balance 530 Beige Angora MR530AA', 12.00, 'New Balance 530 Beige Angora MR530AA', 'nb_11.jpg', 'NEW BALANCE, 530, BEIGE ANGORA MR530AA'),
(118, 4, 4, 'New Balance 530 Retro Running Navy MR530SG', 14.00, 'New Balance 530 Retro Running Navy MR530SG', 'nb_12.jpg', 'NEW BALANCE, 530, RETRO RUNNING NAVY MR530SG'),
(119, 4, 3, 'New Balance 530 Retro Khaki MR530SH', 12.00, 'New Balance 530 Retro Khaki MR530SH', 'nb_13.jpg', 'NEW BALANCE, 530, RETRO KHAKI MR530SH'),
(120, 4, 3, 'New Balance 550 Dusty Blue BB550STG', 15.00, 'New Balance 550 Dusty Blue BB550STG', 'nb_14.jpg', 'NEW BALANCE, 550, DUSTY BLUE BB550STG'),
(121, 4, 3, 'New Balance 550 Dusty Blue BB550STG', 16.00, 'New Balance 550 Dusty Blue BB550STG', 'nb_15.jpg', 'NEW BALANCE, 550, DUSTY BLUE BB550STG'),
(125, 3, 8, 'Supra Stacks II VULC - 08193-069-M', 54.00, 'Low-top design Supra Stacks II VULC with Canvas-Suede material, Neon tones Vulcanized sole.', 'supra1.jpg', 'LOW-TOP, SUPRA, CANVAS, SUEDE, NEON'),
(126, 2, 8, 'Supra Aluminum - 05662-816-M', 60.00, 'High-top Supra Aluminum with trendy yellow tones, high-quality Canvas, durable rubber sole.', 'supra2.jpg', 'HIGH-TOP, SUPRA, CANVAS, YELLOW'),
(127, 2, 8, 'Supra Aluminum - 05662-002-M', 60.00, 'Bold high-top Supra Aluminum with black Canvas, Vulcanized rubber sole, metal crown logo.', 'supra3.jpg', 'HIGH-TOP, SUPRA, CANVAS, BLACK'),
(128, 2, 8, 'Supra Aluminum - 05662-622-M', 60.00, 'Stylish high-top Supra Aluminum with trendy Red-White tones, high-quality materials.', 'supra4.jpg', 'HIGH-TOP, SUPRA, RED, WHITE'),
(129, 3, 8, 'Supra Chino - 08051-401-M', 45.00, 'Simple and youthful Supra Chino with dynamic blue tone, Canvas-suede materials.', 'supra5.jpg', 'SIMPLE, YOUTHFUL, SUPRA, CANVAS, SUEDE, BLUE'),
(131, 3, 8, 'Supra Hammer VTG - 06123-002-M', 54.00, 'Vintage design Supra Hammer VTG with suede-Canvas materials, black tones, white borders.', 'supra7.jpg', 'VINTAGE, SUPRA, SUEDE, CANVAS, BLACK, WHITE'),
(132, 2, 8, 'Supra Vaider - 08204-049-M', 63.00, 'Stylish high-top SUPRA Vaider with Gray-Red tones, premium Canvas-Suede materials.', 'supra8.jpg', 'STYLISH, HIGH-TOP, SUPRA, VAIDER, GRAY, RED, CANVAS, SUEDE'),
(133, 2, 8, 'Supra Vaider - 08044-058-M', 63.00, 'High-top style Supra Vaider with minimalist design, premium fabric material.', 'supra9.jpg', 'HIGH-TOP, SUPRA, MINIMALIST, PREMIUM, FABRIC'),
(134, 2, 8, 'Supra Skytop - 98002-025-M', 81.00, 'Bold camo pattern Supra Skytop, high-quality rubber sole, thicker tongue-collars for comfort.', 'supra10.jpg', 'CAMO, SUPRA, SKYTOP, RUBBER, ANTI-SLIP'),
(135, 2, 8, 'Supra Skytop - 98002-110-M', 81.00, 'Fashionable white camo pattern Supra Skytop, high-quality rubber sole, thicker tongue-collars for comfort.', 'supra11.jpg', 'WHITE, CAMO, SUPRA, SKYTOP, RUBBER, ANTI-SLIP'),
(136, 2, 8, 'Supra Stacks Mid - 05903-658-M', 63.00, 'Canvas-red suede fabric Supra Stacks Mid with white SUPRA logo, versatile and comfortable.', 'supra12.jpg', 'CANVAS, SUEDE, SUPRA, STACKS MID, RED, WHITE'),
(137, 3, 8, 'SILVER VAIDER', 90.00, 'Best choice', 'supra17.jpg', 'SILVER, OUTDOOR'),
(140, 3, 8, 'COURT LEGACY', 100.00, 'Beige', 'supra18.jpg', 'BEIGE, RUNNING'),
(141, 3, 8, 'Supra Flow - 08325-360-M', 54.00, 'Slip-On Supra Flow with camouflage pattern, Suede-Canvas material, horizontal round lace.', 'supra6.jpg', 'SLIP-ON, SUPRA, CAMOUFLAGE, SUEDE, CANVAS'),
(142, 3, 8, 'Vaider Yellow', 70.00, 'yellow vaider', 'supra16.jpg', 'YELLOW, BIG BOY'),
(143, 3, 8, 'Vaider Maxi', 75.00, 'white vaider', 'supra15.jpg', 'WHITE, VAIDER'),
(145, 3, 8, 'Supra Cobalt - 05663-093-M', 48.00, 'Simple black tone Supra Cobalt with gold zigzag stitching, lightweight Canvas, premium rubber sole.', 'supra13.jpg', 'SIMPLE, BLACK, SUPRA, COBALT, GOLD, CANVAS, RUBBER'),
(170, 2, 1, 'CONVERSE CHUCK TAYLOR ALL STAR CONSTRUCT', 20.00, 'CONVERSE CHUCK TAYLOR ALL STAR CONSTRUCT', 'converse_1.jpg', 'CONVERSE, CHUCK TAYLOR, CONSTRUCT'),
(171, 2, 1, 'CONVERSE CHUCK TAYLOR ALL STAR FUTURE UTILITY', 12.00, 'CONVERSE CHUCK TAYLOR ALL STAR FUTURE UTILITY', 'converse_2.jpg', 'CONVERSE, CHUCK TAYLOR, FUTURE UTILITY'),
(172, 3, 1, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE LOW TOP', 15.00, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE LOW TOP', 'converse_3.jpg', 'CONVERSE, CHUCK TAYLOR, FALL TONE, LOW TOP'),
(173, 2, 1, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE HIGH TOP', 20.00, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE HIGH TOP', 'converse_4.jpg', 'CONVERSE, CHUCK TAYLOR, FALL TONE, HIGH TOP'),
(174, 2, 1, 'CONVERSE RUN STAR LEGACY CX', 14.00, 'CONVERSE RUN STAR LEGACY CX', 'converse_5.jpg', 'CONVERSE, RUN STAR LEGACY CX'),
(175, 2, 1, 'CONVERSE RUN STAR LEGACY CX', 15.00, 'CONVERSE RUN STAR LEGACY CX', 'converse_6.jpg', 'CONVERSE, RUN STAR LEGACY CX'),
(176, 2, 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 15.00, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 'converse_7.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, TEAL UNIVERSE'),
(177, 3, 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 13.00, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 'converse_8.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, TEAL UNIVERSE'),
(178, 2, 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 18.00, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'converse_9.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, ORIGIN STORY'),
(179, 3, 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 17.00, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'converse_10.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, ORIGIN STORY'),
(180, 3, 1, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 16.00, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 'converse_11.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM'),
(181, 2, 1, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 19.00, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 'converse_12.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM'),
(182, 2, 1, 'CONVERSE CHUCK TAYLOR ALL STAR CX EXPLORE', 19.00, 'CONVERSE CHUCK TAYLOR ALL STAR CX EXPLORE', 'converse_13.jpg', 'CONVERSE, CHUCK TAYLOR, CX EXPLORE'),
(183, 2, 1, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 19.00, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 'converse_14.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM, HIGH TOP'),
(185, 4, 7, 'SNEAKER BUZZ SHOE KEYCHAIN - LOGO TAG', 20.00, 'SNEAKER BUZZ SHOE KEYCHAIN - LOGO TAG', 'acs_1.jpg', 'SNEAKER BUZZ, SHOE KEYCHAIN, LOGO TAG'),
(186, 4, 7, 'NEW BALANCE LASER PERFORMANCE RUN HAT', 12.00, 'NEW BALANCE LASER PERFORMANCE RUN HAT', 'acs_2.jpg', 'NEW BALANCE, LASER PERFORMANCE, RUN HAT'),
(187, 4, 7, 'VANS WM HALF CREW WMN 6.5-10 1PK', 15.00, 'VANS WM HALF CREW WMN 6.5-10 1PK', 'acs_3.jpg', 'VANS, WM HALF CREW, WMN 6.5-10, 1PK'),
(188, 4, 7, 'VANS MN OLD SKOOL DROP V BACKPACK', 20.00, 'VANS MN OLD SKOOL DROP V BACKPACK', 'acs_4.jpg', 'VANS, MN OLD SKOOL, DROP V, BACKPACK'),
(189, 4, 7, 'VANS OC CROSS BODY BAG', 14.00, 'VANS OC CROSS BODY BAG', 'acs_5.jpg', 'VANS, OC CROSS BODY, BAG'),
(190, 4, 7, 'VANS GYM CLASS WAISTBAG', 15.00, 'VANS GYM CLASS WAISTBAG', 'acs_6.jpg', 'VANS, GYM CLASS, WAISTBAG'),
(191, 4, 7, 'VANS WARD CROSS BODY PACK BAG', 15.00, 'VANS WARD CROSS BODY PACK BAG', 'acs_7.jpg', 'VANS, WARD CROSS BODY, PACK BAG'),
(192, 4, 7, 'VANS AP THE ULTRASAKE CROSSBODY', 13.00, 'VANS AP THE ULTRASAKE CROSSBODY', 'acs_8.jpg', 'VANS, AP THE ULTRASAKE, CROSSBODY'),
(193, 4, 7, 'V? VANS BROOKLAND CANOODLE', 18.00, 'V? VANS BROOKLAND CANOODLE', 'acs_9.jpg', 'V? VANS, BROOKLAND CANOODLE'),
(194, 2, 1, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 19.00, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 'converse_15.jpg', 'CONVERSE, RUN STAR MOTION, CANVAS PLATFORM, HIGH TOP'),
(195, 4, 7, 'SUPRA TRADEMARK', 16.00, 'SUPRA TRADEMARK', 'acs_11.jpg', 'SUPRA, TRADEMARK'),
(196, 4, 7, 'SUPRA TRADEMARK', 19.00, 'SUPRA TRADEMARK', 'acs_12.jpg', 'SUPRA, TRADEMARK'),
(197, 4, 7, 'VANS FULL PATCH T-SHIRT', 19.00, 'VANS FULL PATCH T-SHIRT', 'acs_13.jpg', 'VANS, FULL PATCH, T-SHIRT'),
(198, 4, 7, 'SUMMER SHIRT', 19.00, 'SUMMER SHIRT', 'acs_14.jpg', 'SUMMER, SHIRT'),
(199, 4, 7, 'BEACH GOING SHIRT', 19.00, 'BEACH GOING SHIRT', 'acs_15.jpg', 'BEACH GOING, SHIRT'),
(200, 4, 7, 'V? VANS CLASSIC CANOODLE 6.5 - 9 3PK', 17.00, 'V? VANS CLASSIC CANOODLE 6.5 - 9 3PK', 'acs_10.jpg', 'V? VANS, CLASSIC CANOODLE, 6.5-9, 3PK'),
(203, 1, 6, 'DÉP BUZZ Y-STRAP DAISY', 0.80, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_1.jpg', 'DÉP BUZZ, Y-STRAP DAISY'),
(204, 1, 6, 'DÉP BUZZ Y-STRAP DAISY', 0.80, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_2.jpg', 'DÉP BUZZ, Y-STRAP DAISY'),
(205, 1, 6, 'DÉP BUZZ Y-STRAP DAISY', 0.70, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_3.jpg', 'DÉP BUZZ, Y-STRAP DAISY'),
(206, 1, 6, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 0.60, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 'snkb_4.jpg', 'DÉP SNEAKER BUZZ, CLASSIC SLIDE II'),
(207, 1, 6, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 0.75, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 'snkb_5.jpg', 'DÉP SNEAKER BUZZ, CLASSIC SLIDE II'),
(208, 1, 6, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 0.75, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_6.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP ADVANTURE'),
(209, 1, 6, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 0.70, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_7.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP ADVANTURE'),
(210, 1, 6, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 0.85, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_8.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP ADVANTURE'),
(211, 1, 6, 'DÉP SNEAKER BUZZ Y-STRAP DENIM', 0.65, 'DÉP SNEAKER BUZZ Y-STRAP DENIM', 'snkb_9.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP DENIM'),
(212, 1, 6, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 0.65, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'snkb_10.jpg', 'CONVERSE, CHUCK TAYLOR, 1970S, ORIGIN STORY'),
(213, 1, 6, 'DÉP SNEAKER BUZZ Y-STRAP DECONSTRUCTION', 0.65, 'DÉP SNEAKER BUZZ Y-STRAP DECONSTRUCTION', 'snkb_11.jpg', 'DÉP SNEAKER BUZZ, Y-STRAP DECONSTRUCTION'),
(214, 1, 6, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 0.70, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_12.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE'),
(215, 1, 6, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 0.65, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_13.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE'),
(216, 1, 6, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 0.70, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_14.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE'),
(217, 1, 6, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 0.70, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_15.jpg', 'DÉP SNEAKER BUZZ, CLOUD SLIDE');

-- --------------------------------------------------------

=======

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR SEASONAL COLOR', 5000, 'CONVERSE CHUCK TAYLOR ALL STAR SEASONAL COLOR', 'sale_1.jpg', 'sale1'),
(2, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR DIGITAL DAZE', 25000, 'CONVERSE CHUCK TAYLOR ALL STAR DIGITAL DAZE', 'sale_2.jpg', 'sale2'),
(3, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 30000, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_3.jpg', 'sale3'),
(4, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 32000, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_4.jpg', 'sale4'),
(5, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 10000, 'CONVERSE CHUCK TAYLOR ALL STAR CX', 'sale_5.jpg', 'sale5'),
(6, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR CREATE FUTURE', 35000, 'CONVERSE CHUCK TAYLOR ALL STAR CREATE FUTURE', 'sale_6.jpg', 'sale6'),
(7, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR DOUBLE UPPER LOGO PLAY', 50000, 'CONVERSE CHUCK TAYLOR ALL STAR DOUBLE UPPER LOGO PLAY', 'sale_7.jpg', 'sale7'),
(8, 1, 5, 'Converse Chuck 70 Nautical Tri Blocked', 40000, 'Converse Chuck 70 Nautical Tri Blocked', 'converse_16.jpg', 'conv16'),
(9, 1, 5, 'Converse Chuck Taylor All Star Pro', 12000, 'Converse Chuck Taylor All Star Pro', 'converse_10.jpg', 'conv10'),
(10, 2, 3, 'VANS UA OLD SKOOL CORDURA 1', 2000, 'VANS UA OLD SKOOL CORDURA 1', 'van_1.jpg', 'Van1\r\n'),
(11, 2, 3, 'VANS UA OLD SKOOL CORDURA 2', 1200, 'VANS UA OLD SKOOL CORDURA 2', 'van_2.jpg', 'Van2'),
(12, 2, 3, 'VANS UA OLD SKOOL CORDURA 3', 1500, 'VANS UA OLD SKOOL CORDURA 3', 'van_3.jpg', 'Van3'),
(13, 2, 3, 'VANS UA OLD SKOOL PIG SUEDE', 1200, 'VANS UA OLD SKOOL PIG SUEDE', 'van_4.jpg', 'Van4'),
(14, 2, 3, 'VANS UA KNU SKOOL', 1400, 'VANS UA KNU SKOOL', 'van_6.jpg', 'Van6'),
(15, 2, 3, 'VANS UA SK8-LOW REARRANGE', 1500, 'VANS UA SK8-LOW REARRANGE', 'van_5.jpg', 'Van5'),
(16, 3, 2, 'PALLADIUM PAMPA TRAVEL LITE', 1500, 'PALLADIUM PAMPA TRAVEL LITE', 'palladium_1.jpg', 'palladium1'),
(17, 3, 2, 'PALLADIUM PAMPA HI HTG SUPPLY', 1000, 'PALLADIUM PAMPA HI HTG SUPPLY', 'palladium_2.jpg', 'palladium2'),
(19, 3, 2, 'PALLADIUM PALLABROUSE', 1400, 'PALLADIUM PALLABROUSE', 'palladium_3.jpg', 'palladium3'),
(20, 3, 2, 'PALLADIUM PAMPA HI TICKET TO EARTH', 1000, 'PALLADIUM PAMPA HI TICKET TO EARTH', 'palladium_4.jpg', 'palladium4'),
(21, 3, 2, 'PALLADIUM PAMPA HI TICKET TO EARTH', 1000, 'PALLADIUM PAMPA HI TICKET TO EARTH', 'palladium_5.jpg', 'palladium5'),
(32, 5, 3, 'K-SWISS COURT LITE SPELLOUT S\r\n', 2500, 'K-SWISS COURT LITE SPELLOUT S\r\n', 'k_1.jpg', 'K-SWISS1'),
(50, 3, 2, 'PALLADIUM PAMPA SC RECYCLE WP + N', 1600, 'PALLADIUM PAMPA SC RECYCLE WP + N', 'palladium_6.jpg', 'palladium6'),
(51, 3, 2, 'PALLADIUM PAMPA LITE+ RECYCLE WP', 1500, 'PALLADIUM PAMPA LITE+ RECYCLE WP', 'palladium_7.jpg', 'palladium7'),
(52, 3, 2, 'PALLADIUM PALLABROUSSE LEGION', 1200, 'PALLADIUM PALLABROUSSE LEGION', 'palladium_8.jpg', 'palladium8'),
(53, 3, 2, 'PALLADIUM PAMPA HI MONO CHROME III', 800, 'PALLADIUM PAMPA HI MONO CHROME III', 'palladium_9.jpg', 'palladium9'),
(54, 3, 3, 'PALLADIUM PAMPA HI MONO CHROME', 800, 'PALLADIUM PAMPA HI MONO CHROME', 'palladium_10.jpg', 'palladium10'),
(55, 3, 3, 'PALLADIUM PAMPA SMILEY DT', 1000, 'PALLADIUM PAMPA SMILEY DT', 'palladium_11.jpg', 'palladium11'),
(56, 3, 2, 'PALLADIUM EASY MULE', 500, 'PALLADIUM EASY MULE', 'palladium_12.jpg', 'palladium12'),
(57, 3, 2, 'PALLADIUM EVO LITE+ RCYCL WP+', 1000, 'PALLADIUM EVO LITE+ RCYCL WP+', 'palladium_13.jpg', 'palladium13'),
(58, 3, 2, 'PALLADIUM PALLAPHOENIX FLAME C', 800, 'PALLADIUM PALLAPHOENIX FLAME C', 'palladium_14.jpg', 'palladium14'),
(59, 3, 2, 'PALLADIUM PAMPA HI SHAKE', 800, 'PALLADIUM PAMPA HI SHAKE', 'palladium_15.jpg', 'palladium15'),
(71, 1, 5, 'VANS UA ERA PIG SUEDE', 400, 'VANS UA ERA PIG SUEDE', 'sale_10.jpg', 'sale10'),
(72, 7, 5, 'VANS UA OLD SKOOL LIVE AT HOV', 500, 'VANS UA OLD SKOOL LIVE AT HOV', 'sale_11.jpg', 'sale11'),
(73, 7, 5, 'VANS UA ERA LIVE AT HOV', 500, 'VANS UA ERA LIVE AT HOV', 'sale_12.jpg', 'sale12'),
(74, 1, 5, 'CONS VOLTAGE MADE IT TO THE TOP', 450, 'CONS VOLTAGE MADE IT TO THE TOP', 'sale_13.jpg', 'sale13'),
(75, 1, 5, 'CONVERSE CHUCK TAYLOR ALL STAR MADE IT TO THE TOP', 400, 'CONVERSE CHUCK TAYLOR ALL STAR MADE IT TO THE TOP', 'sale_14.jpg', 'sale14'),
(76, 1, 5, 'Converse Huy Tran', 4500, 'sieu xau ', 'sale_15.jpg', 'sale15'),
(82, 2, 3, 'VANS UA OLD SKOOL BALLISTIC MIX', 1500, 'VANS UA OLD SKOOL BALLISTIC MIX', 'van_7.jpg', 'Van7'),
(83, 2, 3, 'VANS UA OLD SKOOL OVERSIZED LACES', 1300, 'VANS UA OLD SKOOL OVERSIZED LACES', 'van_8.jpg', 'Van8'),
(84, 2, 3, 'VANS UA CLASSIC SLIP-ON VR3 GROWTH GARDEN VR3', 1800, 'VANS UA CLASSIC SLIP-ON VR3 GROWTH GARDEN VR3', 'van_9.jpg', 'Van8'),
(85, 2, 3, 'VANS UA AUTHENTIC VR3 GROWTH GARDEN VR3', 1700, 'VANS UA AUTHENTIC VR3 GROWTH GARDEN VR3', 'van_10.jpg', 'Van10'),
(86, 2, 2, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 1600, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 'van_11.jpg', 'Van11'),
(87, 2, 3, 'VANS UA AUTHENTIC COLOR THEORY', 1900, 'VANS UA AUTHENTIC COLOR THEORY', 'van_13.jpg', 'Van13'),
(88, 2, 3, 'VANS UA OLD SKOOL VR3 GROWTH GARDEN VR3', 1900, 'VANS UA CLASSIC SLIP-ON COLOR THEORY', 'van_12.jpg', 'Van12'),
(89, 2, 2, 'VANS UA OLD SKOOL 36 DX', 1900, 'VANS UA OLD SKOOL 36 DXY', 'van_14.jpg', 'Van14'),
(90, 2, 3, 'VANS UA OLD SKOOL LIVE AT HOV', 1900, 'VANS UA OLD SKOOL LIVE AT HOV', 'van_15.jpg', 'Van15'),
(93, 5, 3, 'K-SWISS COURT LITE SPELLOUT S', 1200, 'K-SWISS COURT LITE SPELLOUT S', 'K_2.jpg', 'K-SWISS2'),
(94, 5, 3, 'K-SWISS SI-DEFIER 7.0', 1200, 'K-SWISS SI-DEFIER 7.0', 'K_3.jpg', 'K-SWISS3'),
(95, 5, 3, 'K-SWISS CLASSIC VN', 1200, 'K-SWISS CLASSIC VN', 'K_4.jpg', 'K-SWISS4'),
(96, 5, 3, 'K-SWISS HOKE CMF', 1200, 'K-SWISS HOKE CMF', 'K_5.jpg', 'K-SWISS5'),
(97, 5, 3, 'K-SWISS ST329 CMF', 1200, 'K-SWISS ST329 CMF', 'K_6.jpg', 'K-SWISS6'),
(98, 5, 3, 'K-SWISS GEN-K ICON KNIT', 1200, 'K-SWISS GEN-K ICON KNIT', 'K_7.jpg', 'K-SWISS7'),
(99, 5, 3, 'K-SWISS AEROSWIFT', 1200, 'K-SWISS AEROSWIFT', 'K_8.jpg', 'K-SWISS8'),
(100, 5, 3, 'K-SWISS TUBES MILLENNIUM', 1200, 'K-SWISS TUBES MILLENNIUM', 'K_9.jpg', 'K-SWISS9'),
(101, 5, 3, 'K-SWISS X-160', 1200, 'K-SWISS X-160', 'K_10.jpg', 'K-SWISS10'),
(102, 5, 3, 'K-SWISS COURT PRO II', 1200, 'K-SWISS COURT PRO II', 'K_11.jpg', 'K-SWISS11'),
(103, 5, 3, 'K-SWISS VENDEN', 1200, 'K-SWISS VENDEN', 'K_12.jpg', 'K-SWISS12'),
(104, 5, 3, 'K-SWISS HOKE VULC', 1200, 'K-SWISS HOKE VULC', 'K_13.jpg', 'K-SWISS13'),
(105, 5, 3, 'K-SWISS X-LITE ATHLETIC', 1200, 'K-SWISS X-LITE ATHLETIC', 'K_14.jpg', 'K-SWISS14'),
(106, 5, 3, 'K-SWISS BIGSHOT LIGHT', 1200, 'K-SWISS BIGSHOT LIGHT', 'K_15.jpg', 'K-SWISS15'),
(107, 4, 3, 'New Balance 530 Retro Khaki', 1300, 'New Balance 530 Retro Khaki', 'nb_1.jpg', 'NewBlance1'),
(108, 4, 3, 'New Balance 530 Retro Running Navy', 1800, 'New Balance 530 Retro Running Navy', 'nb_2.png', 'NewBlance2'),
(109, 4, 3, 'New Balance 530 Beige Angora', 2100, 'New Balance 530 Beige Angora', 'nb_3.jpg', 'NewBlance3'),
(110, 4, 3, 'New Balance 574 Classic Lifestyle', 2300, 'New Balance 574 Classic Lifestyle', 'nb_4.jpg', 'NewBlance4'),
(111, 4, 3, 'New Balance 550 Dusty Blue', 2400, 'New Balance 550 Dusty Blue', 'nb_5.jpg', 'NewBlance5'),
(112, 4, 3, 'New Balance 550 Triple White', 1200, 'New Balance 550 Triple White', 'nb_6.jpg', 'NewBlance6'),
(113, 4, 1, 'New Balance 200v2 Adjustable SUA200K2', 1500, 'New Balance 200v2 Adjustable SUA200K2', 'nb_7.jpg', 'NewBlance7'),
(114, 4, 1, 'New Balance 550 Triple White BB550WWW', 1800, 'New Balance 550 Triple White BB550WWW', 'nb_8.jpg', 'NewBlance8'),
(115, 4, 1, 'New Balance Laser Performance Run Hat LAH21102_WT', 2200, 'New Balance Laser Performance Run Hat LAH21102_WT', 'nb_9.jpg', 'NewBlance9'),
(116, 4, 1, 'New Balance Classic NB Curved Brim Hat LAH91014_BK', 2700, 'New Balance Classic NB Curved Brim Hat LAH91014_BK', 'nb_10.jpg', 'NewBlance10'),
(117, 4, 4, 'New Balance 530 Beige Angora MR530AA', 1200, 'New Balance 530 Beige Angora MR530AA', 'nb_11.jpg', 'NewBlance11'),
(118, 4, 4, 'New Balance 530 Retro Running Navy MR530SG', 1400, 'New Balance 530 Retro Running Navy MR530SG', 'nb_12.jpg', 'NewBlance12'),
(119, 4, 3, 'New Balance 530 Retro Khaki MR530SH', 1200, 'New Balance 530 Retro Khaki MR530SH', 'nb_13.jpg', 'NewBlance13'),
(120, 4, 3, 'New Balance 550 Dusty Blue BB550STG', 1500, 'New Balance 550 Dusty Blue BB550STG', 'nb_14.jpg', 'NewBlance14'),
(121, 4, 3, 'New Balance 550 Dusty Blue BB550STG', 1600, 'New Balance 550 Dusty Blue BB550STG', 'nb_15.jpg', 'NewBlance15'),
(125, 8, 3, 'Supra Stacks II VULC - 08193-069-M', 540000, 'Low-top design Supra Stacks II VULC with Canvas-Suede material, Neon tones Vulcanized sole.', 'supra1.jpg', 'low-top, Supra, Canvas, Suede, Neon'),
(126, 8, 2, 'Supra Aluminum - 05662-816-M', 600000, 'High-top Supra Aluminum with trendy yellow tones, high-quality Canvas, durable rubber sole.', 'supra2.jpg', 'high-top, Supra, Canvas, yellow'),
(127, 8, 2, 'Supra Aluminum - 05662-002-M', 600000, 'Bold high-top Supra Aluminum with black Canvas, Vulcanized rubber sole, metal crown logo.', 'supra3.jpg', 'high-top, Supra, Canvas, black'),
(128, 8, 2, 'Supra Aluminum - 05662-622-M', 600000, 'Stylish high-top Supra Aluminum with trendy Red-White tones, high-quality materials.', 'supra4.jpg', 'high-top, Supra, Red, White'),
(129, 8, 3, 'Supra Chino - 08051-401-M', 450000, 'Simple and youthful Supra Chino with dynamic blue tone, Canvas-suede materials.', 'supra5.jpg', 'simple, youthful, Supra, Canvas, suede, blue'),
(131, 8, 3, 'Supra Hammer VTG - 06123-002-M', 540000, 'Vintage design Supra Hammer VTG with suede-Canvas materials, black tones, white borders.', 'supra7.jpg', 'Vintage, Supra, suede, Canvas, black, white'),
(132, 8, 2, 'Supra Vaider - 08204-049-M', 630000, 'Stylish high-top SUPRA Vaider with Gray-Red tones, premium Canvas-Suede materials.', 'supra8.jpg', 'stylish, high-top, SUPRA, Vaider, Gray, Red, Canvas, Suede'),
(133, 8, 2, 'Supra Vaider - 08044-058-M', 630000, 'High-top style Supra Vaider with minimalist design, premium fabric material.', 'supra9.jpg', 'high-top, Supra, minimalist, premium, fabric'),
(134, 8, 2, 'Supra Skytop - 98002-025-M', 810000, 'Bold camo pattern Supra Skytop, high-quality rubber sole, thicker tongue-collars for comfort.', 'supra10.jpg', 'camo, Supra, Skytop, rubber, anti-slip'),
(135, 8, 2, 'Supra Skytop - 98002-110-M', 810000, 'Fashionable white camo pattern Supra Skytop, high-quality rubber sole, thicker tongue-collars for comfort.', 'supra11.jpg', 'white, camo, Supra, Skytop, rubber, anti-slip'),
(136, 8, 2, 'Supra Stacks Mid - 05903-658-M', 630000, 'Canvas-red suede fabric Supra Stacks Mid with white SUPRA logo, versatile and comfortable.', 'supra12.jpg', 'Canvas, suede, Supra, Stacks Mid, red, white'),
(137, 8, 3, 'SILVER VAIDER', 900000, 'Best choice', 'supra17.jpg', 'silver outdoor'),
(140, 8, 3, 'COURT LEGACY', 1000000, 'Beige', 'supra18.jpg', 'beige running'),
(141, 8, 3, 'Supra Flow - 08325-360-M', 540000, 'Slip-On Supra Flow with camouflage pattern, Suede-Canvas material, horizontal round lace.', 'supra6.jpg', 'Slip-On, Supra, camouflage, Suede, Canvas'),
(142, 8, 3, 'Vaider Yellow', 700000, 'yellow vaider', 'supra16.jpg', 'yellow big boy'),
(143, 8, 3, 'Vaider Maxi', 750000, 'white vaider', 'supra15.jpg', 'white one'),
(145, 8, 3, 'Supra Cobalt - 05663-093-M', 480000, 'Simple black tone Supra Cobalt with gold zigzag stitching, lightweight Canvas, premium rubber sole.', 'supra13.jpg', 'simple, black, Supra, Cobalt, gold, Canvas, rubber'),
(170, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR CONSTRUCT', 2000, 'CONVERSE CHUCK TAYLOR ALL STAR CONSTRUCT', 'converse_1.jpg', 'Converse1'),
(171, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR FUTURE UTILITY', 1200, 'CONVERSE CHUCK TAYLOR ALL STAR FUTURE UTILITY', 'converse_2.jpg', 'Converse2'),
(172, 1, 3, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE LOW TOP', 1500, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE LOW TOP', 'converse_3.jpg', 'Converse3'),
(173, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE HIGH TOP', 2000, 'CONVERSE CHUCK TAYLOR ALL STAR FALL TONE HIGH TOP', 'converse_4.jpg', 'Converse4'),
(174, 1, 2, 'CONVERSE RUN STAR LEGACY CX', 1400, 'CONVERSE RUN STAR LEGACY CX', 'converse_5.jpg', 'Converse5'),
(175, 1, 2, 'CONVERSE RUN STAR LEGACY CX', 1500, 'CONVERSE RUN STAR LEGACY CX', 'converse_6.jpg', 'Converse6'),
(176, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 1500, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 'converse_7.jpg', 'Converse7'),
(177, 1, 3, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 1300, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S TEAL UNIVERSE', 'converse_8.jpg', 'Converse8'),
(178, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 1800, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'converse_9.jpg', 'Converse9'),
(179, 1, 3, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 1700, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'converse_10.jpg', 'Converse10'),
(180, 1, 3, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 1600, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 'converse_11.jpg', 'Converse11'),
(181, 1, 2, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 1900, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM', 'converse_12.jpg', 'Converse13'),
(182, 1, 2, 'CONVERSE CHUCK TAYLOR ALL STAR CX EXPLORE', 1900, 'CONVERSE CHUCK TAYLOR ALL STAR CX EXPLORE', 'converse_13.jpg', 'Converse12'),
(183, 1, 2, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 1900, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 'converse_14.jpg', 'Converse14'),
(185, 7, 4, 'SNEAKER BUZZ SHOE KEYCHAIN - LOGO TAG', 2000, 'SNEAKER BUZZ SHOE KEYCHAIN - LOGO TAG', 'acs_1.jpg', 'acs1'),
(186, 7, 4, 'NEW BALANCE LASER PERFORMANCE RUN HAT', 1200, 'NEW BALANCE LASER PERFORMANCE RUN HAT', 'acs_2.jpg', 'acs2'),
(187, 7, 4, 'VANS WM HALF CREW WMN 6.5-10 1PK', 1500, 'VANS WM HALF CREW WMN 6.5-10 1PK', 'acs_3.jpg', 'acs3'),
(188, 7, 4, 'VANS MN OLD SKOOL DROP V BACKPACK', 2000, 'VANS MN OLD SKOOL DROP V BACKPACK', 'acs_4.jpg', 'acs4'),
(189, 7, 4, 'VANS OC CROSS BODY BAG', 1400, 'VANS OC CROSS BODY BAG', 'acs_5.jpg', 'acs5'),
(190, 7, 4, 'VANS GYM CLASS WAISTBAG', 1500, 'VANS GYM CLASS WAISTBAG', 'acs_6.jpg', 'acs6'),
(191, 7, 4, 'VANS WARD CROSS BODY PACK BAG', 1500, 'VANS WARD CROSS BODY PACK BAG', 'acs_7.jpg', 'acs7'),
(192, 7, 4, 'VANS AP THE ULTRASAKE CROSSBODY', 1300, 'VANS AP THE ULTRASAKE CROSSBODY', 'acs_8.jpg', 'acs8'),
(193, 7, 4, 'V? VANS BROOKLAND CANOODLE', 1800, 'V? VANS BROOKLAND CANOODLE', 'acs_9.jpg', 'acs9'),
(194, 1, 2, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 1900, 'CONVERSE RUN STAR MOTION CANVAS PLATFORM HIGH TOP', 'converse_15.jpg', 'Converse15'),
(195, 7, 4, 'SUPRA TRADEMARK', 1600, 'SUPRA TRADEMARK', 'acs_11.jpg', 'acs11'),
(196, 7, 4, 'SUPRA TRADEMARK', 1900, 'SUPRA TRADEMARK', 'acs_12.jpg', 'acs13'),
(197, 7, 4, 'VANS FULL PATCH T-SHIRT', 1900, 'VANS FULL PATCH T-SHIRT', 'acs_13.jpg', 'acs12'),
(198, 7, 4, 'SUMMER SHIRT', 1900, 'SUMMER SHIRT', 'acs_14.jpg', 'acs14'),
(199, 7, 4, 'BEACH GOING SHIRT', 1900, 'BEACH GOING SHIRT', 'acs_15.jpg', 'acs15'),
(200, 7, 4, 'V? VANS CLASSIC CANOODLE 6.5 - 9 3PK', 1700, 'V? VANS CLASSIC CANOODLE 6.5 - 9 3PK', 'acs_10.jpg', 'acs10'),
(203, 6, 1, 'DÉP BUZZ Y-STRAP DAISY', 80, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_1.jpg', 'SNKB1'),
(204, 6, 1, 'DÉP BUZZ Y-STRAP DAISY', 80, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_2.jpg', 'SNKB2'),
(205, 6, 1, 'DÉP BUZZ Y-STRAP DAISY', 70, 'DÉP BUZZ Y-STRAP DAISY', 'snkb_3.jpg', 'SNKB3'),
(206, 6, 1, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 60, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 'snkb_4.jpg', 'SNKB4'),
(207, 6, 1, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 75, 'DÉP SNEAKER BUZZ CLASSIC SLIDE II', 'snkb_5.jpg', 'SNKB5'),
(208, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 75, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_6.jpg', 'SNKB6'),
(209, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 70, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_7.jpg', 'SNKB7'),
(210, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 85, 'DÉP SNEAKER BUZZ Y-STRAP ADVANTURE', 'snkb_8.jpg', 'SNKB8'),
(211, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP DENIM', 65, 'DÉP SNEAKER BUZZ Y-STRAP DENIM', 'snkb_9.jpg', 'SNKB9'),
(212, 6, 1, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 65, 'CONVERSE CHUCK TAYLOR ALL STAR 1970S ORIGIN STORY', 'snkb_10.jpg', 'SNKB10'),
(213, 6, 1, 'DÉP SNEAKER BUZZ Y-STRAP DECONSTRUCTION', 65, 'DÉP SNEAKER BUZZ Y-STRAP DECONSTRUCTION', 'snkb_11.jpg', 'SNKB11'),
(214, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 70, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_12.jpg', 'SNKB12'),
(215, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 65, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_13.jpg', 'SNKB13'),
(216, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 70, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_14.jpg', 'SNKB14'),
(217, 6, 1, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 70, 'DÉP SNEAKER BUZZ CLOUD SLIDE', 'snkb_15.jpg', 'SNKB15');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

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

<<<<<<< HEAD
=======
--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
  INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
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
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Shohanur', 'Rahman', 'shohan@apricotstore.com', 'shohan', '9448121558', 'DSC', 'Dhaka'),
(15, 'Mehedi', 'Hasan', 'mehedi@apricotstore.com', 'mehedi', '536487276', ',DSC', 'Dhaka'),
(16, 'Asif', 'Rahman', 'asif@apricotstore.com', 'asif', '9877654334', 'DSC', 'Dhaka'),
(19, 'Niloy', 'Hasan', 'niloy@apricotstore.com', 'niloy', '9871236534', 'DSC', 'Dhaka'),
(21, 'Jony', 'Hasan', 'jony@apricotstore.com', 'jony', '202-555-01', 'DSC', 'Dhaka'),
(22, 'Maruf', 'Mia', 'maruf@apricotstore.com', 'maruf', '9877654334', 'DSC', 'Dhaka'),
(23, 'tausif', 'Mia', 'tausif@apricotstore.com', 'tausif', '9876543234', 'DSC', 'Dhaka'),
(24, 'limon', 'Sheikh', 'limon@apricotstore.com', 'limon', '9535688928', 'DSC', 'Dhaka'),
(25, 'rafin', 'Molla', 'rafin@apricotstore.com', 'rafin', '9535688928', 'DSC', 'Dhaka'),
(26, 'Tran', 'Duc', 'ductran@gmail.com', 'Abc123', '014394332', 'Lao Cai', 'Lao Cai'),
(27, 'Hung', 'Ngo', 'hung@gmail.com', '1234567890', '0987654321', 'Hanoi', 'Vietnam'),
(28, 'Tran ', 'Duc', 'tranduc1230@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(29, 'Nigga', 'What', 'nigga@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(30, 'Huong', 'Thanh', 'huongmai@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(31, 'Tran', 'Manh Ngo', 'huy123@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(32, 'Tran', 'Manh Ngo', 'huy123@gmail.com', '0987654321', '0987654321', 'Hanoi', 'Vietnam'),
(33, 'Nigga', 'Hell', 'niogga@gmail.com', '0987654321', '0987654321', 'hanoi', 'vietnam');

--
-- Indexes for dumped tables
--
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

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

<<<<<<< HEAD

=======
--
-- Indexes for table `email_info`
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

<<<<<<< HEAD


=======
--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

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
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `register`
<<<<<<< HEAD

=======
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
<<<<<<< HEAD
=======
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

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

<<<<<<< HEAD
=======
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

<<<<<<< HEAD

=======
--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
<<<<<<< HEAD

=======
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--
>>>>>>> c770efb3c9fe1cadd440c0a939d699cd31ecf3b9

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
