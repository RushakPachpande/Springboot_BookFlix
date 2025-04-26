-- --------------------------------------------------------

-- Dumping data for table `category`

INSERT INTO
    `category` (`id`, `is_active`, `name`)
VALUES (1, b'1', 'Adventure'),
    (2, b'1', 'Comics'),
    (3, b'1', 'Thriller'),
    (4, b'1', 'Love'),
    (5, b'1', 'Mystery'),
    (6, b'1', 'Fiction'),
    (7, b'1', 'Poetry'),
    (8, b'1', 'Science'),
    (9, b'1', 'Educational');

ALTER TABLE `category` ADD PRIMARY KEY (`id`);

ALTER TABLE `category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 10;

COMMIT;

-- --------------------------------------------------------