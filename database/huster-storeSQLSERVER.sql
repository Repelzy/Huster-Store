-- Create the database
CREATE DATABASE ShoppingWeb;
GO

-- Use the created database
USE ShoppingWeb;
GO

-- Table structure for admin_info
CREATE TABLE admin_info (
    admin_id INT NOT NULL PRIMARY KEY,
    admin_name VARCHAR(100) NOT NULL,
    admin_email VARCHAR(255) NOT NULL UNIQUE,
    admin_password VARCHAR(60) NOT NULL
);
GO


-- Table structure for user_info


CREATE TABLE user_info (
    user_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(60) NOT NULL,
    phone VARCHAR(15),
    address1 VARCHAR(255),
    address2 VARCHAR(255)
);
GO

-- Table structure for brands
CREATE TABLE brands (
    brand_id INT NOT NULL PRIMARY KEY,
    brand_title VARCHAR(100) NOT NULL
);
GO

-- Table structure for categories
CREATE TABLE categories (
    cat_id INT NOT NULL PRIMARY KEY,
    cat_title VARCHAR(100) NOT NULL
);
GO

-- Table structure for products
CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    product_cat INT NOT NULL,
    product_brand INT NOT NULL,
    product_title VARCHAR(100) NOT NULL,
    product_price DECIMAL(10,2) NOT NULL,
    product_desc TEXT,
    product_image VARCHAR(255),
    product_keywords VARCHAR(255),
    FOREIGN KEY (product_cat) REFERENCES categories(cat_id),
    FOREIGN KEY (product_brand) REFERENCES brands(brand_id)
);
GO



-- Table structure for email_info
CREATE TABLE email_info (
    email_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    email_address VARCHAR(255) NOT NULL UNIQUE
);
GO

-- Table structure for orders_info
CREATE TABLE orders_info (
    order_id INT NOT NULL PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    cardname VARCHAR(100) NOT NULL,
    cardnumber VARCHAR(19) NOT NULL,
    expdate VARCHAR(5) NOT NULL,
    prod_count INT NOT NULL,
    total_amt DECIMAL(10,2) NOT NULL,
    p_status VARCHAR(50) NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    trx_id VARCHAR(255) NOT NULL DEFAULT,
    FOREIGN KEY (user_id) REFERENCES user_info(user_id)
);
GO

-- Table structure for order_products
CREATE TABLE order_products (
    order_pro_id INT NOT NULL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    qty INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders_info(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
GO

-- Table structure for cart
CREATE TABLE cart (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    product_id INT NOT NULL,
    ip_add VARCHAR(250),
    user_id INT NOT NULL,
    qty INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (user_id) REFERENCES user_info(user_id),
);
GO


-- Insert data into categories
INSERT INTO categories (cat_id, cat_title) VALUES
(1, 'Slippers'),
(2, 'High-Top Sneakers'),
(3, 'Low-Top Sneakers'),
(4, 'Accessories'),
(5, 'For Sales');
GO

-- Insert data into brands
INSERT INTO brands (brand_id, brand_title) VALUES
(1, 'CONVERSE'),
(2, 'VANS'),
(3, 'PALLADIUM'),
(4, 'NEW BALANCE'),
(5, 'K-SWISS'),
(6, 'SNEAKER BUZZ'),
(7, 'ACCESSORIES'),
(8, 'SUPRA');
GO

INSERT INTO products (product_id, product_brand ,  product_cat ,  product_title ,  product_price ,  product_desc ,  product_image ,  product_keywords ) VALUES
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
(70, 3, 2, 'PALLADIUM PAMPALICIOUS POP CORN', 56, 'PALLADIUM PAMPALICIOUS POP CORN', 'palladium_16.jpg', 'PALLADIUM, POP CORN'),
(71, 1, 5, 'Chuck Taylor All Star 1970s', 4, 'Chuck Taylor All Star 1970s', 'converse_17.jpg', 'Chuck, 1970s'),
(72, 7, 5, 'CONVERSE T-SHIRT GRAPHICS-SS ICON T', 5, 'CONVERSE T-SHIRT GRAPHICS-SS ICON T', 'acs_18.jpg', 'CONVERSE, T-SHIRT'),
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

-- Creating indexes for admin_info
CREATE UNIQUE NONCLUSTERED INDEX IX_AdminInfo_Email ON admin_info(admin_email);
-- Creating indexes for user_info
CREATE UNIQUE NONCLUSTERED INDEX IX_UsersInfo_Email ON user_info(email);
-- Creating indexes for email_info
CREATE UNIQUE NONCLUSTERED INDEX IX_EmailInfo_EmailAddress ON email_info(email_address);
-- Creating indexes for orders_info
CREATE NONCLUSTERED INDEX IX_OrdersInfo_UserID ON orders_info(user_id);
CREATE NONCLUSTERED INDEX IX_OrdersInfo_Email_UserID ON orders_info(email, user_id);
-- Creating indexes for order_products
CREATE NONCLUSTERED INDEX IX_OrderProducts_OrderID ON order_products(order_id);
CREATE NONCLUSTERED INDEX IX_OrderProducts_ProductID ON order_products(product_id);
CREATE NONCLUSTERED INDEX IX_OrderProducts_OrderID_ProductID ON order_products(order_id, product_id);
-- Creating indexes for products
CREATE NONCLUSTERED INDEX IX_Products_ProductCat ON products(product_cat);
CREATE NONCLUSTERED INDEX IX_Products_ProductBrand ON products(product_brand);
CREATE NONCLUSTERED INDEX IX_Products_ProductTitle ON products(product_title);
CREATE NONCLUSTERED INDEX IX_Products_ProductCat_Brand_Title ON products(product_cat, product_brand, product_title);


-- Add to cart
CREATE PROCEDURE AddToCart
    @p_product_id INT,
    @p_user_id INT,
    @p_qty INT
AS
BEGIN
    INSERT INTO cart (product_id, user_id, qty)
    VALUES (@p_product_id, @p_user_id, @p_qty);
END;
GO


-- Update user's information
CREATE PROCEDURE UpdateUser
    @p_user_id INT,
    @p_first_name VARCHAR(50),
    @p_last_name VARCHAR(50),
    @p_email VARCHAR(255),
    @p_phone VARCHAR(15),
    @p_address1 VARCHAR(255),
    @p_address2 VARCHAR(255)
AS
BEGIN
    UPDATE user_info
    SET first_name = @p_first_name,
        last_name = @p_last_name,
        email = @p_email,
        phone = @p_phone,
        address1 = @p_address1,
        address2 = @p_address2
    WHERE user_id = @p_user_id;
END;
GO

CREATE PROCEDURE DeleteUser
    @p_user_id INT
AS
BEGIN
    DELETE FROM user_info WHERE user_id = @p_user_id;
END;
GO

-- Trigger for inserting data
CREATE TRIGGER after_order_product_insert
ON order_products
AFTER INSERT
AS
BEGIN
    UPDATE orders_info
    SET prod_count = prod_count + inserted.qty
    FROM orders_info
    INNER JOIN inserted ON orders_info.order_id = inserted.order_id;
END;
GO

-- Trigger for deleting data
CREATE TRIGGER after_order_product_delete
ON order_products
AFTER DELETE
AS
BEGIN
    UPDATE orders_info
    SET prod_count = prod_count - deleted.qty
    FROM orders_info
    INNER JOIN deleted ON orders_info.order_id = deleted.order_id;
END;
GO


EXEC AddToCart @p_product_id = 1, @p_user_id = 123, @p_qty = 2, @p_ip_add = '192.168.1.1';
EXEC UpdateUser 
    @p_user_id = 1, 
    @p_first_name = 'John', 
    @p_last_name = 'Doe', 
    @p_email = 'john.doe@example.com', 
    @p_phone = '123-456-7890', 
    @p_address1 = '123 Elm Street', 
    @p_address2 = 'Apt 4B';
EXEC DeleteUser @p_user_id = 1;



