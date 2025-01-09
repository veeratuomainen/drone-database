SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

INSERT INTO `drone` (`id`, `name`, `brand`, `model`, `additional_info`) VALUES
(1,	'Drone 1',	'DJI',	'Mini 3 Pro',	'Small size'),
(2,	'Drone 2',	'DJI',	'Mavic 3',	NULL),
(3,	'Drone 3',	'DJI',	'Mini 2',	'Small size'),
(4,	'Drone 4',	'Denver',	'DRO-200',	NULL),
(5,	'Drone 5',	'Denver',	'DCW-380',	NULL);

INSERT INTO `user` (`id`, `name`, `username`, `password`, `token`) VALUES
(1,	'Petri Simonen',	'petri_si',	'simonenpe',	'74339574'),
(2,	'Pekka Tukiainen',	'pekka_tu',	'tukiainenpe',	'37017903'),
(3,	'Maija Kimalainen',	'maija_ki',	'kimalainenma',	'66243285'),
(4,	'Heli Makinen',	'heli_ma',	'makinenhe',	'35496700'),
(5,	'Simo Helenius',	'simo_he',	'heleniussi',	'27129147');

INSERT INTO `flight` (`id`, `user_id`, `drone_id`) VALUES
(1,	5,	1),
(2,	2,	5),
(3,	3,	2),
(4,	2,	1),
(5,	4,	3);

INSERT INTO `image` (`id`, `flight_id`, `name`, `analysis`, `location_info`, `image_taken`) VALUES
(1,	1,	'Image 1',	'2 cars in image',	'61,48°N 23,84°E',	'2023-02-13 15:45:56'),
(2,	2,	'Image 2',	'3 persons in image',	'61,50°N 23,81°E',	'2023-03-02 09:28:39'),
(3,	2,	'Image 3',	'6 persons in image',	'61,49°N 23,73°E',	'2023-03-02 11:33:27'),
(4,	3,	'Image 4',	'5 cars in image',	'61,48°N 23,76°E',	'2023-03-26 14:55:14'),
(5,	4,	'Image 5',	'1 car and 2 person in image',	'61,50°N 23,70°E',	'2023-04-09 17:06:48');

INSERT INTO `drone_in_use` (`user_id`, `drone_id`, `start_time`, `end_time`) VALUES
(5,	1,	'2023-02-13 15:00:00',	'2023-02-13 16:00:00'),
(2,	5,	'2023-03-02 09:00:00',	'2023-03-02 10:00:00'),
(3,	2,	'2023-03-26 14:00:00',	'2023-03-26 15:00:00'),
(2,	1,	'2023-04-09 17:00:00',	'2023-04-09 18:00:00'),
(4,	3,	'2023-04-21 12:00:00',	'2023-04-21 13:00:00');
