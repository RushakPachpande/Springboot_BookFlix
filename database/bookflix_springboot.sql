CREATE DATABASE IF NOT EXISTS `bookflix_springboot`;

USE `bookflix_springboot`;

--
-- Table structure for table `user_dtls`
--

-- DROP TABLE IF EXISTS `user_dtls`;

CREATE TABLE IF NOT EXISTS `user_dtls` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `mobile_number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `state` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `pincode` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `profile_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `role` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    `failed_attempt` int DEFAULT NULL,
    `is_enable` TINYINT(1) DEFAULT NULL,
    `lock_time` datetime(6) DEFAULT NULL,
    `account_non_locked` TINYINT(1) DEFAULT NULL,
    `reset_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Dumping data for table `user_dtls`
--

LOCK TABLES `user_dtls` WRITE;

INSERT INTO
    `user_dtls`
VALUES (
        1,
        'Super Admin',
        'super@admin.com',
        '',
        '$2a$10$RY.KeRYmiEIMyHFi5/ne9.lGUGk4jgnbWALZ.ONw6Rlgy8kGLcLq6',
        '',
        '',
        '',
        '',
        'user.png',
        'ROLE_ADMIN',
        0,
        1,
        NULL,
        1,
        NULL
    ),
    (
        2,
        'Rushak Pachpande',
        'rushakgp@gmail.com',
        '9898989898',
        '$2a$10$a2FM3CBoKk3yaUJur6WS1Os8R3C1PRbR8.yyLicDl.fr4u8U/8OmG',
        'PCMC',
        'Pune',
        'Maharashtra',
        '411019',
        'Bunny.png',
        'ROLE_USER',
        0,
        0,
        NULL,
        1,
        NULL
    ),
    (
        3,
        'Admin',
        'admin@bookflix.com',
        '',
        '$2a$10$3IZXszUn19OJ5Wm.qkov8OH9s8TqlJssXCIU06rgPTQw98ePai1Iy',
        '',
        '',
        '',
        '',
        'admin.png',
        'ROLE_ADMIN',
        0,
        1,
        NULL,
        1,
        NULL
    ),
    (
        4,
        'Test User',
        'test@mail.com',
        '9876540123',
        '$2a$10$HG27GeoexVMwA08wgQUhJ.E97n4ri4StjPUt48Qfl04BqQAdX8yEC',
        'Address',
        'City',
        'State',
        '123456',
        'default.jpg',
        'ROLE_USER',
        0,
        1,
        NULL,
        1,
        NULL
    ),
    (
        5,
        'BookFlix User',
        'bookflix31@gmail.com',
        '7894561231',
        '$2a$10$8D31IrkgnOh.UhrfNG0oIOwFeWF5nMVRVcIUHiK8tezSXfZbWj0NS',
        'Somewhere',
        'Pune',
        'Maharashtra',
        '000000',
        'default.jpg',
        'ROLE_USER',
        0,
        1,
        NULL,
        1,
        NULL
    );

UNLOCK TABLES;

--
-- Table structure for table `category`
--

-- DROP TABLE IF EXISTS `category`;

CREATE TABLE IF NOT EXISTS `category` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(255) DEFAULT NULL,
    `is_active` tinyint(1) DEFAULT '1',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf32;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;

INSERT INTO
    `category`
VALUES (1, 'Adventure', 1),
    (2, 'Comics', 1),
    (3, 'Autobiography', 1),
    (4, 'Love', 1),
    (5, 'Mystery', 1),
    (6, 'Fiction', 1),
    (7, 'Poetry', 1),
    (8, 'Religious', 1),
    (9, 'Educational', 1),
    (10, 'Novel', 1);

UNLOCK TABLES;

--
-- Table structure for table `product`
--

-- DROP TABLE IF EXISTS `product`;

CREATE TABLE IF NOT EXISTS `product` (
    `id` int NOT NULL AUTO_INCREMENT,
    `author` varchar(100) DEFAULT NULL,
    `category` varchar(30) DEFAULT NULL,
    `discount` int NOT NULL,
    `discount_price` double DEFAULT NULL,
    `image` varchar(255) DEFAULT NULL,
    `is_active` TINYINT(1) DEFAULT NULL,
    `price` double DEFAULT NULL,
    `stock` int NOT NULL,
    `title` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 84 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;

INSERT INTO
    `product`
VALUES (
        1,
        'Colby Wilkens',
        'Adventure',
        15,
        1308.15,
        'If I Dig You.jpg',
        1,
        1539,
        500,
        'If I Dig You'
    ),
    (
        3,
        'Rick Riordan',
        'Adventure',
        5,
        190,
        'The Lightening Thief.jpg',
        1,
        200,
        500,
        'The Lightening Thief'
    ),
    (
        4,
        'J.R.R. Tolkien',
        'Adventure',
        12,
        264,
        'The Hobbit.jpg',
        1,
        300,
        500,
        'The Hobbit'
    ),
    (
        5,
        'Ross Welford',
        'Adventure',
        0,
        257,
        ' The Kid who came form Space.jpg',
        1,
        257,
        500,
        ' The Kid who came form Space'
    ),
    (
        6,
        'Kelly Barnhill',
        'Adventure',
        0,
        100,
        'The Girl who drank the Moon.jpg',
        1,
        100,
        500,
        'The Girl who drank the Moon'
    ),
    (
        7,
        'Hayley Lawrence',
        'Adventure',
        20,
        640,
        'Into The WILD.png',
        1,
        800,
        250,
        'Into The WILD'
    ),
    (
        8,
        'Kingfisher Classics',
        'Adventure',
        5,
        189.05,
        'Treasure Island.jpg',
        1,
        199,
        200,
        'Treasure Island'
    ),
    (
        9,
        'Rick Riordan',
        'Adventure',
        2,
        245,
        'The Titans Curse.jpg',
        1,
        250,
        500,
        'The Titans Curse'
    ),
    (
        10,
        'Kelly McWilliams',
        'Adventure',
        25,
        299.25,
        'Agnes at the End of the World.png',
        1,
        399,
        500,
        'Agnes at the End of the World'
    ),
    (
        11,
        'Durjoy Datta, Nikita Singh',
        'Love',
        10,
        270,
        'If it\'s not Forever, It\'s not Love.jpg',
        1,
        300,
        250,
        'If it\'s not Forever, It\'s not Love'
    ),
    (
        12,
        'Hector Garcia, Francesc Miralles',
        'Educational',
        25,
        112.5,
        'IKIGAI.jpeg',
        1,
        150,
        500,
        'IKIGAI'
    ),
    (
        13,
        'Paramahansa Yogananda',
        'Autobiography',
        5,
        189.05,
        'The Autobiography of a Yogi.jpg',
        1,
        199,
        200,
        'The Autobiography of a Yogi'
    ),
    (
        14,
        'Andrea Hylen',
        'Fiction',
        5,
        190,
        'An Evolutionary Woman\'s Journey.jpg',
        1,
        200,
        250,
        'An Evolutionary Woman\'s Journey'
    ),
    (
        15,
        'Anuj Dhar',
        'Autobiography',
        5,
        161.5,
        'What Happened to Netaji.jpg',
        1,
        170,
        200,
        'What Happened to Netaji'
    ),
    (
        16,
        'Khushwant Singh',
        'Adventure',
        0,
        99,
        'Train to Pakistan.jpg',
        1,
        99,
        200,
        'Train to Pakistan'
    ),
    (
        17,
        'Oliver Tearle',
        'Mystery',
        15,
        425,
        'The Secret Library.jpg',
        1,
        500,
        250,
        'The Secret Library'
    ),
    (
        18,
        'J.R.R. Tolkien',
        'Fiction',
        5,
        237.5,
        'The Lord of the Rings.jpg',
        1,
        250,
        250,
        'The Lord of the Rings'
    ),
    (
        19,
        'Dr. Prakash Amte',
        'Fiction',
        5,
        285,
        'Prakashwata.jpg',
        1,
        300,
        250,
        'Prakashwata'
    ),
    (
        20,
        'Rahul Pandita',
        'Fiction',
        5,
        141.55,
        'Our Moon has Blood Clots.jpg',
        1,
        149,
        250,
        'Our Moon has Blood Clots'
    ),
    (
        21,
        'Nathaniel Philbrick',
        'Mystery',
        15,
        255,
        'In the Heart of the SEA.jpg',
        1,
        300,
        250,
        'In the Heart of the SEA'
    ),
    (
        22,
        'Chetan Bhagat',
        'Love',
        20,
        239.2,
        'Half Girlfriend.jpg',
        1,
        299,
        100,
        'Half Girlfriend'
    ),
    (
        23,
        'Premchand',
        'Educational',
        0,
        59,
        'Godaan.jpg',
        1,
        59,
        200,
        'Godaan'
    ),
    (
        24,
        'Donald J. Sobol',
        'Mystery',
        5,
        113.05,
        'Boy Detective - Encyclopedia Brown.jpg',
        1,
        119,
        250,
        'Boy Detective - Encyclopedia Brown'
    ),
    (
        25,
        'Devi Yesodharan',
        'Novel',
        5,
        209,
        'Empire.jpg',
        1,
        220,
        250,
        'Empire'
    ),
    (
        26,
        'Romila Thapar',
        'Mystery',
        10,
        180,
        'Early India.jpg',
        1,
        200,
        250,
        'Early India'
    ),
    (
        27,
        'Shivaji Savant',
        'Religious',
        25,
        194.25,
        'Chhawa.jpg',
        1,
        259,
        250,
        'Chhawa'
    ),
    (
        28,
        'Advaita Kala',
        'Love',
        5,
        95,
        'Almost Single.jpg',
        1,
        100,
        200,
        'Almost Single'
    ),
    (
        29,
        'Arun Tiwari',
        'Autobiography',
        25,
        375,
        'Agnipankh.jpg',
        1,
        500,
        250,
        'Agnipankh'
    ),
    (
        30,
        'Robert Jordan',
        'Fiction',
        5,
        332.5,
        'The wheel of Time.jpg',
        1,
        350,
        200,
        'The wheel of Time'
    ),
    (
        31,
        'Jodi Lynn Anderson',
        'Mystery',
        5,
        237.5,
        'Thirteen Witches.jpg',
        1,
        250,
        200,
        'Thirteen Witches'
    ),
    (
        32,
        'Christine Cohen',
        'Mystery',
        20,
        360,
        'The Winter King.jpg',
        1,
        450,
        200,
        'The Winter King'
    ),
    (
        33,
        'William Goldman',
        'Love',
        12,
        263.12,
        'The Princess Bride.jpg',
        1,
        299,
        200,
        'The Princess Bride'
    ),
    (
        34,
        'O Henry, Jack London',
        'Adventure',
        5,
        142.5,
        'The Most Dangerous Game.png',
        1,
        150,
        200,
        'The Most Dangerous Game'
    ),
    (
        35,
        'Paula Coelho',
        'Mystery',
        5,
        95,
        'The Alchemist.jpg',
        1,
        100,
        100,
        'The Alchemist'
    ),
    (
        36,
        'NA',
        'Fiction',
        25,
        225,
        'SUNRISE.jpg',
        1,
        300,
        100,
        'SUNRISE'
    ),
    (
        37,
        'Carrie',
        'Novel',
        15,
        425,
        'Stephan King.jpg',
        1,
        500,
        200,
        'Stephan King'
    ),
    (
        38,
        'K.K. Agarwal',
        'Educational',
        30,
        490,
        'Software Engineering.jpeg',
        1,
        700,
        500,
        'Software Engineering'
    ),
    (
        39,
        'Daisy Johnson',
        'Novel',
        5,
        95,
        'Sisters.jpg',
        1,
        100,
        100,
        'Sisters'
    ),
    (
        40,
        'Lani Forbes',
        'Fiction',
        5,
        95,
        'Seventh Sun.jpg',
        1,
        100,
        100,
        'Seventh Sun'
    ),
    (
        41,
        'Adrienne Young',
        'Mystery',
        50,
        250,
        'The Girl the Sea gave back.jpg',
        1,
        500,
        200,
        'The Girl the Sea gave back'
    ),
    (
        42,
        'Jordhan Ifueko',
        'Fiction',
        25,
        375,
        'RAYBEARER.jpg',
        1,
        500,
        200,
        'RAYBEARER'
    ),
    (
        43,
        'Xander Alex',
        'Mystery',
        30,
        419.3,
        'Red Mist.jpg',
        0,
        599,
        100,
        'Red Mist'
    ),
    (
        44,
        'Timothy C. Needham',
        'Educational',
        5,
        190,
        'Python for Beginners.jpg',
        1,
        200,
        200,
        'Python for Beginners'
    ),
    (
        45,
        'Robert J. Weber',
        'Educational',
        5,
        142.5,
        'Pioneers of Science.jpg',
        1,
        150,
        100,
        'Pioneers of Science'
    ),
    (
        46,
        'Rick Riordan',
        'Fiction',
        50,
        399.5,
        'Percy Jackson and the Oympians.jpg',
        0,
        799,
        200,
        'Percy Jackson and the Oympians'
    ),
    (
        47,
        'Kathryn Bywaters',
        'Mystery',
        10,
        180,
        'The Past is Rising.jpg',
        1,
        200,
        200,
        'The Past is Rising'
    ),
    (
        48,
        'Woug Lowe',
        'Educational',
        35,
        292.5,
        'Networking.jpg',
        1,
        450,
        200,
        'Networking'
    ),
    (
        49,
        'Patrick Rothfuss',
        'Fiction',
        40,
        168,
        'The Neame of the Wind.jpg',
        1,
        280,
        200,
        'The Neame of the Wind'
    ),
    (
        50,
        'Salman Rushdie',
        'Love',
        32,
        407.32,
        'Midnight\'s Children.jpg',
        1,
        599,
        250,
        'Midnight\'s Children'
    ),
    (
        51,
        'Terry Crosby',
        'Fiction',
        8,
        183.08,
        'Lunar Strom.jpeg',
        1,
        199,
        100,
        'Lunar Strom'
    ),
    (
        52,
        'Abigail Hing Wen',
        'Love',
        10,
        270,
        'Loveboat Taipei.jpg',
        1,
        300,
        100,
        'Loveboat Taipei'
    ),
    (
        53,
        'Alexandra Gregg',
        'Fiction',
        25,
        375,
        'Last Blood.jpg',
        1,
        500,
        200,
        'Last Blood'
    ),
    (
        54,
        'Nora Barrett',
        'Autobiography',
        50,
        300,
        'The King of Drugs.jpg',
        1,
        600,
        100,
        'The King of Drugs'
    ),
    (
        55,
        'Angelina Aludo',
        'Love',
        5,
        142.5,
        'Memory.jpg',
        1,
        150,
        250,
        'Memory'
    ),
    (
        56,
        'J.K. Rowling',
        'Adventure',
        30,
        350,
        'Harry Potter and the Chambers of Secrets.png',
        1,
        500,
        500,
        'Harry Potter and the Chambers of Secrets'
    ),
    (
        57,
        'R.J. Blain',
        'Mystery',
        5,
        190,
        'The House Lost at Sea.jpg',
        1,
        200,
        250,
        'The House Lost at Sea'
    ),
    (
        58,
        'Barbara Bushman',
        'Educational',
        5,
        95,
        'Fitness & Health.jpg',
        1,
        100,
        200,
        'Fitness & Health'
    ),
    (
        59,
        'Frank S. Ring',
        'Educational',
        10,
        180,
        'Walking for Health & Fitness.jpg',
        1,
        200,
        200,
        'Walking for Health & Fitness'
    ),
    (
        60,
        'NA',
        'Educational',
        7,
        119.97,
        'How to Improve your Health.jpg',
        1,
        129,
        100,
        'How to Improve your Health'
    ),
    (
        61,
        'NA',
        'Educational',
        5,
        190,
        'PATH-FIT 1.jpg',
        1,
        200,
        100,
        'PATH-FIT 1'
    ),
    (
        62,
        'C. Robert Line',
        'Religious',
        5,
        114,
        'Understanding GOD\'s Time.jpg',
        1,
        120,
        200,
        'Understanding GOD\'s Time'
    ),
    (
        63,
        'George R.R. Martin',
        'Fiction',
        15,
        934.15,
        'Game of Thrones.jpg',
        1,
        1099,
        500,
        'Game of Thrones'
    ),
    (
        64,
        'Vibrant Publishers',
        'Educational',
        5,
        474.05,
        'DSA.jpg',
        1,
        499,
        250,
        'DSA'
    ),
    (
        65,
        'Terry Pratchett',
        'Novel',
        45,
        549.45,
        'The Colour of Magic.jpg',
        1,
        999,
        200,
        'The Colour of Magic'
    ),
    (
        66,
        'Srijan Pal Singh',
        'Autobiography',
        10,
        225,
        'Childhood of KALAM.jpg',
        1,
        250,
        250,
        'Childhood of KALAM'
    ),
    (
        67,
        'Rose King',
        'Love',
        25,
        375,
        'Blood Thirst.jpg',
        1,
        500,
        250,
        'Blood Thirst'
    ),
    (
        68,
        'NA',
        'Fiction',
        35,
        325,
        'The Battle for the FAE King Throne.jpg',
        1,
        500,
        200,
        'The Battle for the FAE King Throne'
    ),
    (
        69,
        'Stephen C. Meyer',
        'Educational',
        5,
        190,
        'Darwin\'s Doubt.jpg',
        1,
        200,
        100,
        'Darwin\'s Doubt'
    ),
    (
        70,
        'James Clear',
        'Educational',
        25,
        674.25,
        'Atomic Habits.png',
        1,
        899,
        250,
        'Atomic Habits'
    ),
    (
        71,
        'Loryn Brantz',
        'Poetry',
        30,
        1161.3,
        'Poems of Parenting.jpg',
        1,
        1659,
        100,
        'Poems of Parenting'
    ),
    (
        72,
        'Rupi Kaur',
        'Poetry',
        40,
        1019.4,
        'The Sun and Her Flowers.jpg',
        1,
        1699,
        100,
        'The Sun and Her Flowers'
    ),
    (
        73,
        'Josie Balka',
        'Poetry',
        5,
        217.55,
        'I Hope You Remember.jpg',
        1,
        229,
        100,
        'I Hope You Remember'
    ),
    (
        74,
        'Anonymous',
        'Poetry',
        2,
        205.8,
        'Poetry Is Not a Luxury.jpg',
        1,
        210,
        100,
        'Poetry Is Not a Luxury'
    ),
    (
        75,
        'Dav Pilkey',
        'Comics',
        0,
        299,
        'The Adventures of Captain Underpants.jpg',
        1,
        299,
        200,
        'The Adventures of Captain Underpants'
    ),
    (
        76,
        'Dav Pilkey',
        'Comics',
        5,
        190,
        'Cat Kid Comic Club.jpg',
        1,
        200,
        200,
        'Cat Kid Comic Club'
    ),
    (
        77,
        'DC Comics',
        'Comics',
        20,
        400,
        'Batman Knight.jpg',
        1,
        500,
        500,
        'Batman Knight'
    ),
    (
        78,
        'Santa Harukaze',
        'Comics',
        10,
        359.1,
        'Pokemon X . Y.jpg',
        1,
        399,
        250,
        'Pokemon X . Y'
    ),
    (
        79,
        ' Goswami Tulsidas',
        'Religious',
        20,
        239.2,
        'Hanuman Chalisa.jpg',
        1,
        299,
        250,
        'Hanuman Chalisa'
    ),
    (
        80,
        'Bhaktivedanta Swami Prabhupada',
        'Religious',
        25,
        749.25,
        'Bhagvad Gita.jpg',
        1,
        999,
        500,
        'Bhagvad Gita'
    ),
    (
        81,
        'KAMALA CHANDRAKANT',
        'Religious',
        5,
        113.05,
        'Mahabharata (Amar Chitra Katha).jpg',
        1,
        119,
        500,
        'Mahabharata (Amar Chitra Katha)'
    ),
    (
        83,
        ' Joseph Murphy',
        'Educational',
        0,
        149,
        'The Power of Your Subconscious Mind - Original Classic Edition.jpg',
        1,
        149,
        250,
        'The Power of Your Subconscious Mind - Original Classic Edition'
    );

UNLOCK TABLES;

--
-- Table structure for table `cart`
--

-- DROP TABLE IF EXISTS `cart`;

CREATE TABLE IF NOT EXISTS `cart` (
    `id` int NOT NULL AUTO_INCREMENT,
    `quantity` int DEFAULT NULL,
    `product_id` int DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
    KEY `FK9x4wn098i53ikun1ynxet2ynj` (`user_id`),
    CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
    CONSTRAINT `FK9x4wn098i53ikun1ynxet2ynj` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Table structure for table `order_address`
--

-- DROP TABLE IF EXISTS `order_address`;

CREATE TABLE IF NOT EXISTS `order_address` (
    `id` int NOT NULL AUTO_INCREMENT,
    `address` varchar(255) DEFAULT NULL,
    `city` varchar(255) DEFAULT NULL,
    `email` varchar(255) DEFAULT NULL,
    `full_name` varchar(255) DEFAULT NULL,
    `mobile_no` varchar(255) DEFAULT NULL,
    `pincode` varchar(255) DEFAULT NULL,
    `state` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--
-- Table structure for table `product_order`
--

-- DROP TABLE IF EXISTS `product_order`;

CREATE TABLE IF NOT EXISTS `product_order` (
    `id` int NOT NULL AUTO_INCREMENT,
    `order_date` date DEFAULT NULL,
    `order_id` varchar(255) DEFAULT NULL,
    `payment_type` varchar(255) DEFAULT NULL,
    `price` double DEFAULT NULL,
    `quantity` int DEFAULT NULL,
    `status` varchar(255) DEFAULT NULL,
    `order_address_id` int DEFAULT NULL,
    `product_id` int DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UKqcdbxaeuc7c5gahwh0dutg04r` (`order_address_id`),
    KEY `FKh73acsd9s5wp6l0e55td6jr1m` (`product_id`),
    KEY `FK4f2ycr32kigtux5ag3tv0xu5m` (`user_id`),
    CONSTRAINT `FK4f2ycr32kigtux5ag3tv0xu5m` FOREIGN KEY (`user_id`) REFERENCES `user_dtls` (`id`),
    CONSTRAINT `FK8frxalwc79tpxo7hgqp3hsjck` FOREIGN KEY (`order_address_id`) REFERENCES `order_address` (`id`),
    CONSTRAINT `FKh73acsd9s5wp6l0e55td6jr1m` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;