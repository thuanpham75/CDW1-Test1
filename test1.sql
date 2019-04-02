-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th4 02, 2019 lúc 10:38 AM
-- Phiên bản máy phục vụ: 5.7.24
-- Phiên bản PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `airways`
--

DROP TABLE IF EXISTS `airways`;
CREATE TABLE IF NOT EXISTS `airways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airways_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `airways_id` (`id`),
  KEY `airways_id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `airways`
--

INSERT INTO `airways` (`id`, `airways_name`) VALUES
(1, 'Quatar Airlines'),
(2, 'Vietnam Airlines'),
(3, 'JetStar');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `card`
--

DROP TABLE IF EXISTS `card`;
CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `card_number` int(11) NOT NULL,
  `card_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ccv_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cus_list`
--

DROP TABLE IF EXISTS `cus_list`;
CREATE TABLE IF NOT EXISTS `cus_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flights_booking`
--

DROP TABLE IF EXISTS `flights_booking`;
CREATE TABLE IF NOT EXISTS `flights_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `flist_id` int(11) NOT NULL,
  `fclass_id` int(11) NOT NULL,
  `flight_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_per` int(11) NOT NULL,
  `ticket_buy` datetime NOT NULL,
  `total_price` double NOT NULL,
  `card_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_id` (`flist_id`),
  KEY `flights_booking_ibfk_1` (`user_id`),
  KEY `card_id` (`card_id`),
  KEY `fclass_id` (`fclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_class`
--

DROP TABLE IF EXISTS `flight_class`;
CREATE TABLE IF NOT EXISTS `flight_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fclass_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flight_class`
--

INSERT INTO `flight_class` (`id`, `fclass_name`) VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'Premium Economy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flight_list`
--

DROP TABLE IF EXISTS `flight_list`;
CREATE TABLE IF NOT EXISTS `flight_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airways_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `place_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_from` time NOT NULL,
  `place_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_to` time NOT NULL,
  `duration` text COLLATE utf8_unicode_ci NOT NULL,
  `transit` int(11) NOT NULL,
  `total_sit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airways_id` (`airways_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `list_cities`
--

DROP TABLE IF EXISTS `list_cities`;
CREATE TABLE IF NOT EXISTS `list_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `shortname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `list_cities`
--

INSERT INTO `list_cities` (`id`, `cityname`, `shortname`) VALUES
(1, 'Hồ Chí Minh', 'SGN'),
(2, 'Hà Nội', 'HAN'),
(3, 'Đà Nẵng', 'DN'),
(4, 'Huế', 'HU');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(13) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL,
  `attempt` int(11) NOT NULL,
  `last_access` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`, `active`, `attempt`, `last_access`) VALUES
(12, 'test1@gmail.com', '8so1', '$2y$10$KSGfxtQxWIroWjSP/FvzyOD0M6Dl8h68Rv3DMlN.OH8nnp/Wv9dty', 11111111, NULL, '2019-03-06 15:44:35', '2019-03-06 15:44:35', 0, 0, '0000-00-00 00:00:00'),
(14, 'thuan@gmail.com', 'Thuan 1', '$2y$10$0s/X4Vg8CZTX2tewBfPUU.YbtKiAOs3KV4FYYwI6SKWOcSf0IdUYu', 987654321, 'lcdM8v9Q7g2dh1xueX1dupnLg1SgkfwVWHc27y5tJzx9rBeNvNuZpbc55Jea', '2019-03-07 05:57:42', '2019-03-07 05:57:42', 0, 0, '0000-00-00 00:00:00');

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cus_list`
--
ALTER TABLE `cus_list`
  ADD CONSTRAINT `cus_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `flights_booking`
--
ALTER TABLE `flights_booking`
  ADD CONSTRAINT `flights_booking_ibfk_1` FOREIGN KEY (`flist_id`) REFERENCES `flight_list` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_3` FOREIGN KEY (`card_id`) REFERENCES `card` (`id`),
  ADD CONSTRAINT `flights_booking_ibfk_4` FOREIGN KEY (`fclass_id`) REFERENCES `flight_class` (`id`);

--
-- Các ràng buộc cho bảng `flight_list`
--
ALTER TABLE `flight_list`
  ADD CONSTRAINT `flight_list_ibfk_1` FOREIGN KEY (`airways_id`) REFERENCES `airways` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
