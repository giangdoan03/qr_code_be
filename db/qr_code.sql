-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2025 at 09:38 AM
-- Server version: 8.4.3
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qr_code`
--

-- --------------------------------------------------------

--
-- Table structure for table `businesses`
--

CREATE TABLE `businesses` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `career` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `library_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `video_intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `extra_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `display_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `tax_code`, `country`, `city`, `district`, `ward`, `address`, `phone`, `email`, `website`, `description`, `career`, `facebook_link`, `other_links`, `logo`, `cover_image`, `library_images`, `video_intro`, `certificate_file`, `lat`, `lng`, `extra_info`, `status`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `display_settings`) VALUES
(1, 'xxx', '32423234', 'việt nam', 'ha noi', 'ba đình', 'cống vị ba đình', 'xóm liều', '0387409300', 'doangiang665@gmail.com', 'develop.io.vn', 'xxxxx', '2344324', '2343244', '[]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745030227_a219e8b45e3cc12378d8.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745030230_ffa313e9284e59d34cdf.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745030232_e04bed398cc255350886.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745030234_7f855fad911edf3ee922.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745030254_d9af1ae6c177f1e36141.xls\"]', NULL, NULL, '[]', 1, '2025-04-13 16:14:26', '2025-05-11 20:56:04', NULL, 1, '{\"selectedTemplate\":\"tpl-3\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"1\",\"2\",\"3\",\"4\",\"5\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\",\"4\",\"5\"],\"store\":\"selected\",\"selectedStores\":[\"1\"]}'),
(2, 'Xiaomi', 'xxxxxxxxxxxiiiiiiiiiiiiiiiiiii', 'Trung quốc', 'Thượng hải', 'Thượng hải', 'Thượng hải', 'Thượng hải', '0387409300', 'doangiang665@gmail.com', 'https://shopee.vn/', '★ Kệ máy tính để bàn còn giúp sắp xếp tài liệu, đồ dùng gọn gàng, tiện ích, khoa học\n\n★ Sử dụng chiếc kệ màn hình này giúp bạn không phải cúi người trong khi làm việc, cải thiện tư thế cổ vai gáy, bảo vệ vóc dáng\n\n★ Đáy kệ đồng thời làm hộc để đồ, bàn phím, chuột ngăn nắp tạo không làm việc gọn gàng\n\n★ TopV sở hữu công nghệ sản xuất CNC tiên tiến bậc nhất hiện nay, giúp cho sản phẩm được gia công chính xác tới 0.1mm\n\n★ Kệ màn hình TOPV được thiết kế thông minh để dấu đinh vít do đó sản phẩm nhìn rất đẹp và sang trọng\n\n★ Chất liệu: Gỗ công nghiệp MDF nhập khẩu Malaisia phủ melamine, chống ẩm mối mọt\n\n★ Gỗ dày tới 1.6cm, không mỏng như những sản phẩm khác trên thị trường (thường dày 1-1.2cm)', 'dev', 'facebook.com', '[\"facebook.com\"]', '[\"http:\\/\\/assets.giang.test\\/files\\/1748189272_82ed49bebc814ccd4b64.jpg\"]', '[\"http:\\/\\/assets.giang.test\\/files\\/1748189276_a162a866236138e85061.jpg\"]', '[]', '[]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745505471_4c70ac8ebced86736d2e.txt\"]', NULL, NULL, '[]', 1, '2025-04-24 14:40:00', '2025-05-25 16:07:58', NULL, 3, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[]}'),
(3, 'abc', '435344353', 'Viet nam', 'ha noi', 'Tay mo', 'vin home', 'vin smart', '0387409300', 'doangiang665@gmail.com', 'vnexpress.vn', 'công ty truyền thông', 'dev code', '', '[\"demo demo\"]', '[\"http:\\/\\/assets.giang.test\\/files\\/1748189286_9fda48b874c7b8133fe1.jpg\"]', '[]', '[]', '[]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745514094_a682714304111395c58a.xlsx\"]', NULL, NULL, '[]', 1, '2025-04-24 17:02:42', '2025-05-25 16:08:08', NULL, 3, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[]}'),
(4, 'xxxxxxxx', '3424324', 'viet nam', 'ha noi', 'ba dinh', 'cong vi', 'ngoc khanh ba dinh ha noi', '0387409300', 'doangiang@gmail.com', '', '', '', '', '[]', '[\"https:\\/\\/assets.labit365.com\\/image\\/1746976596_0b8b39bd1e08f0d2f8a2.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746257913_e9957ca23bd689ae3c96.png\"]', '[]', '[]', '[]', NULL, NULL, '[]', 1, '2025-05-03 07:33:03', '2025-05-11 15:16:40', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"1\",\"3\"],\"company\":\"selected\",\"selectedCompanies\":[\"4\",\"1\"],\"store\":\"selected\",\"selectedStores\":[\"1\",\"6\"]}'),
(5, 'cty abc', '34243242', 'việt nam', 'hà nội', 'tây mỗ', 'vinsmart', 'vinhome smart city tây mỗ nam từ liêm hà nội', '0912345678', 'doangiang665@gmail.com', '', '', '', '', '[]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746869166_4aaee2d183f1b3372233.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746869179_ed40f70ca9428ccd0459.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746869182_d56d090b39c09ae12cad.jpg\",\"http:\\/\\/assets.labit365.com\\/image\\/1746869184_447d6fdf5333146ce68d.jpg\"]', '[]', '[]', NULL, NULL, '[]', 1, '2025-05-10 09:27:33', '2025-05-11 20:55:41', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[]}'),
(6, 'doanh nghiep test', '42434324', 'viet nam', 'ha noi', 'nam tu liem', 'nam tu liem', 'tay mo, nam tu liem', '0387409300', 'doangiang665@gmail.com', '', '', '', '', '[]', '[\"http:\\/\\/assets.giang.test\\/files\\/1749277643_607a86e17716e2d078a8.jpg\"]', '[\"http:\\/\\/assets.giang.test\\/files\\/1749277647_0a3670372f5e74253c82.png\"]', '[]', '[]', '[]', NULL, NULL, '[]', 1, '2025-06-07 13:28:21', '2025-06-07 13:28:21', NULL, 12, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `business_extra_info`
--

CREATE TABLE `business_extra_info` (
  `id` bigint NOT NULL,
  `business_id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Điện thoại & Máy tính bảng', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(2, 'Laptop & Máy tính để bàn', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(3, 'Phụ kiện công nghệ', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(4, 'TV & Thiết bị gia dụng', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(5, 'Thời trang nam', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(6, 'Thời trang nữ', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(7, 'Giày dép & Túi xách', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(8, 'Mẹ & Bé', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(9, 'Sức khoẻ & Làm đẹp', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(10, 'Đồ dùng gia đình', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(11, 'Thể thao & Dã ngoại', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(12, 'Ô tô & Xe máy & Xe đạp', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(13, 'Sách, Văn phòng phẩm & Quà tặng', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(14, 'Đồ chơi & Giải trí', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(15, 'Nhà cửa & Đời sống', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(16, 'Thiết bị điện tử', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(17, 'Thiết bị y tế & Chăm sóc sức khoẻ', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(18, 'Nội thất & Trang trí', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(19, 'Đồng hồ & Trang sức', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(20, 'Dụng cụ & Thiết bị công nghiệp', '2025-04-12 23:49:55', '2025-04-12 23:49:55'),
(21, 'Thiết bị mạng & Camera giám sát', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(22, 'Vật liệu xây dựng & Công cụ', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(23, 'Đồ dùng học tập & Văn phòng', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(24, 'Thực phẩm & Đồ uống', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(25, 'Nhạc cụ & Thiết bị âm thanh', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(26, 'Dịch vụ & Voucher', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(27, 'Vé sự kiện & Giải trí', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(28, 'Phim ảnh & Âm nhạc', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(29, 'Mỹ phẩm & Chăm sóc cá nhân', '2025-04-12 23:50:08', '2025-04-12 23:50:08'),
(30, 'Quà lưu niệm & Thủ công mỹ nghệ', '2025-04-12 23:50:08', '2025-04-12 23:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_interaction` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  `payment_status` enum('paid','unpaid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'unpaid',
  `is_expired` tinyint(1) DEFAULT '0',
  `package_id` int DEFAULT NULL,
  `package_start_date` date DEFAULT NULL,
  `package_end_date` date DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customer_status` enum('new','active','inactive','vip') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'new'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `city`, `avatar`, `last_interaction`, `created_at`, `updated_at`, `user_id`, `payment_status`, `is_expired`, `package_id`, `package_start_date`, `package_end_date`, `note`, `customer_status`) VALUES
(1, 'aa', '0912345678', 'assss@gmail.com', 'tay mo', 'ha noi', NULL, NULL, '2025-05-18 16:24:07', '2025-05-18 16:24:07', NULL, 'unpaid', 0, NULL, NULL, NULL, NULL, 'new'),
(2, 'haana', '0912345678', 'hana@gmail.com', 'tay mo', 'ha noi', NULL, NULL, '2025-05-18 16:28:07', '2025-05-18 16:28:07', 3, 'unpaid', 0, NULL, '2025-05-19', '2026-05-19', NULL, 'new'),
(10, 'dsadad', '0912345678', NULL, NULL, NULL, NULL, NULL, '2025-05-18 17:40:35', '2025-05-18 17:40:35', 3, 'unpaid', 0, NULL, '2025-05-19', '2026-05-19', NULL, 'new');

-- --------------------------------------------------------

--
-- Table structure for table `entity_images`
--

CREATE TABLE `entity_images` (
  `id` int UNSIGNED NOT NULL,
  `entity_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entity_id` int UNSIGNED NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_cover` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'online',
  `is_enabled` tinyint(1) DEFAULT '1',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `social_links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `format_type` enum('online','offline') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'offline',
  `display_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `name`, `banner`, `location`, `event_mode`, `is_enabled`, `start_time`, `end_time`, `description`, `created_at`, `updated_at`, `country`, `city`, `district`, `contact_first_name`, `contact_last_name`, `contact_phone`, `contact_email`, `ticket_options`, `social_links`, `images`, `video`, `format_type`, `display_settings`) VALUES
(1, 1, 'abc', 'http://assets.labit365.com/image/1746037955_5db3c563bd96591ec624.jpg', 'ty mo nam tu liem', 'online', 1, '2025-04-02 05:55:14', '2025-04-09 05:55:17', '[{\"title\":\"ewqeqwqeqwe\",\"content\":\"<p>dsadsadda<\\/p>\"},{\"title\":\"57567567657\",\"content\":\"<p>fsdfdsfsfsf<\\/p>\"},{\"title\":\"mmmmmmmmmmmmmm\",\"content\":\"<p>nnnnnnnnnnnnnnnnnn<\\/p>\"}]', '2025-04-19 03:55:21', '2025-05-11 21:00:24', 'viet nam', 'ha noi', 'nam tu liem', 'doan', 'giang', '0387409300', 'doangiang665@gmail.com', '\"[{\\\"title\\\":\\\"111111111\\\",\\\"description\\\":\\\"\\\",\\\"price\\\":10000000000},{\\\"title\\\":\\\"33333333333\\\",\\\"description\\\":\\\"\\\",\\\"price\\\":6666666666666666}]\"', '\"[{\\\"type\\\":\\\"facebook\\\",\\\"url\\\":\\\"https:\\/\\/dantri.com.vn\\/giao-duc\\/top-9-truong-dai-hoc-tot-nhat-nhat-ban-nam-2025-20250501202923859.htm\\\",\\\"icon\\\":\\\"http:\\/\\/assets.giang.test\\/image\\/1746201737_6b8aef50c620203911ef.jpg\\\"},{\\\"type\\\":\\\"linkedin\\\",\\\"url\\\":\\\"https:\\/\\/cdnphoto.dantri.com.vn\\/7SRYiJD05ukrmyoV6TZx1k3sAZM=\\/thumb_w\\/1020\\/2025\\/05\\/02\\/tbt-1746158118574.jpg\\\",\\\"icon\\\":\\\"http:\\/\\/assets.giang.test\\/image\\/1746201920_c5131d2c0c5858f4bedb.jpg\\\"}]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746029417_20453b5636ecffe9887d.jpg\\\",\\\"is_main\\\":true},{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746030360_c16844c25c41255be6e4.jpg\\\",\\\"is_main\\\":false},{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746032537_8307b0403fe457e20580.jpg\\\",\\\"is_main\\\":false},{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746032541_35aea3dbeaa439d9cedd.jpg\\\",\\\"is_main\\\":false},{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746032548_88a4a4a19cbe5408828d.jpg\\\",\\\"is_main\\\":false},{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746037959_aff78cc90d81287f74e4.jpg\\\",\\\"is_main\\\":false},{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746037963_57a3d4cbb59f554357b3.jpg\\\",\\\"is_main\\\":false}]\"', '\"[{\\\"uid\\\":\\\"1746037845545\\\",\\\"url\\\":\\\"https:\\/\\/www.youtube.com\\/watch?v=R3GfuzLMPkA\\\",\\\"preview\\\":\\\"https:\\/\\/img.youtube.com\\/vi\\/R3GfuzLMPkA\\/hqdefault.jpg\\\",\\\"isCover\\\":false,\\\"isYoutube\\\":true},{\\\"uid\\\":\\\"1746037969377\\\",\\\"url\\\":\\\"https:\\/\\/www.youtube.com\\/watch?v=G5RpJwCJDqc\\\",\\\"preview\\\":\\\"https:\\/\\/img.youtube.com\\/vi\\/G5RpJwCJDqc\\/hqdefault.jpg\\\",\\\"isCover\\\":false,\\\"isYoutube\\\":true}]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-3\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"selected\\\",\\\"selectedCompanies\\\":[\\\"1\\\",\\\"4\\\"],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[]}\"'),
(2, 1, 'xxxxxxx', 'http://assets.labit365.com/image/1746202553_13787ae765a78b8865a6.jpg', 'nmnnmmnbnmbm', 'online', 1, '2025-05-02 02:16:56', '2025-05-15 02:17:01', '[{\"title\":\"6546546546\",\"content\":\"<p>t\\u1ebbtretete<\\/p>\"},{\"title\":\"rtetretet\",\"content\":\"<p>\\u1ec3trtret<\\/p>\"}]', '2025-05-02 16:15:40', '2025-05-11 21:00:24', 'vvvvvvvvvv', 'bbbbbbbbbb', 'ruiyiuyii', 'rewrewr', '56757567', '0387409300', 'doangiang665@gmail.com', '\"[{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"price\\\":0}]\"', '\"[{\\\"type\\\":\\\"instagram\\\",\\\"url\\\":\\\"https:\\/\\/antdv.com\\/components\\/upload\\/#Upload\\\",\\\"icon\\\":\\\"http:\\/\\/assets.giang.test\\/image\\/1746202636_55513f183c5978bf4488.jpg\\\"}]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746202521_8a81f574aeeac142dd3c.jpg\\\",\\\"is_main\\\":true}]\"', '\"[{\\\"uid\\\":\\\"1746202578711\\\",\\\"url\\\":\\\"https:\\/\\/www.youtube.com\\/watch?v=gTkV0z3NTcA\\\",\\\"preview\\\":\\\"https:\\/\\/img.youtube.com\\/vi\\/gTkV0z3NTcA\\/hqdefault.jpg\\\",\\\"isCover\\\":false,\\\"isYoutube\\\":true}]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"selected\\\",\\\"selectedCompanies\\\":[\\\"1\\\",\\\"4\\\"],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[]}\"'),
(3, 1, '33333', 'http://assets.labit365.com/image/1746258612_4f4625f74cb3d27de0e4.png', 'gggggggg', 'online', 1, '2025-05-03 00:50:24', '2025-05-30 00:50:27', '[{\"title\":\"\",\"content\":\"<p><br><\\/p>\"}]', '2025-05-03 06:19:35', '2025-05-11 21:00:24', NULL, NULL, NULL, '', '', '', '', '\"[{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"\\\",\\\"price\\\":0}]\"', '\"[]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746258610_ada5434eb10a8d6fd757.png\\\",\\\"is_main\\\":false}]\"', '\"[]\"', 'offline', '[]'),
(4, 1, 'ccccccccccccccc', 'https://assets.labit365.com/image/1746976655_7031735c653bee07c862.png', 'xxxxxxxxxxxxxxxx', 'online', 1, '2025-05-02 03:16:00', '2025-05-20 03:16:04', '[{\"title\":\"\",\"content\":\"<p><br><\\/p>\"}]', '2025-05-03 06:25:47', '2025-05-11 15:17:37', NULL, NULL, NULL, '', '', '', '', '\"[{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"<p><br><\\/p>\\\",\\\"price\\\":0}]\"', '\"[]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746256530_959ce70527ba750584b2.jpg\\\",\\\"is_main\\\":false}]\"', '\"[]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[]}\"'),
(5, 1, 'xxxxxxxxxx', 'https://assets.labit365.com/image/1746976673_1a1476b2ba639b2c32fd.png', 'vvvvvvvvvvvvvv', 'online', 1, '2025-04-27 17:33:53', '2025-05-25 17:33:56', '[{\"title\":\"xxxxxxx\",\"content\":\"<p>vvvvvvvv<\\/p>\"},{\"title\":\"bbbbbbbbbb\",\"content\":\"<p>vvvvvvvvvvvv<\\/p>\"}]', '2025-05-03 06:30:22', '2025-05-11 15:17:56', NULL, NULL, NULL, '', '', '', '', '\"[{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"<p><br><\\/p>\\\",\\\"price\\\":0}]\"', '\"[{\\\"type\\\":\\\"facebook\\\",\\\"url\\\":\\\"https:\\/\\/www.youtube.com\\/watch?v=QEjB71pQDf8\\\",\\\"icon\\\":\\\"http:\\/\\/assets.giang.test\\/image\\/1746261130_c74cd26ffad1ebd88c80.png\\\"}]\"', '\"[{\\\"url\\\":\\\"https:\\/\\/assets.labit365.com\\/image\\/1746976668_61d8b5f902642f2cec88.png\\\",\\\"is_main\\\":false}]\"', '\"[]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"selected\\\",\\\"selectedCompanies\\\":[\\\"1\\\"],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[],\\\"productLinks\\\":[]}\"'),
(6, 1, 'xddddddddddddddd', 'http://assets.labit365.com/image/1746893848_04a860422184c36c2441.jpg', 'san van dong my dinh', 'online', 1, '2025-05-10 16:21:43', '2025-05-30 16:22:46', '[{\"title\":\"concert Anh tra vuot ngan chong gai\",\"content\":\"<p>hay<\\/p>\"}]', '2025-05-10 16:19:28', '2025-05-11 21:00:24', 'viet nam', 'ha noi', 'nam tu liem', 'Doan', 'Giang', '09123456778', 'doangiang665@gmail.com', '\"[{\\\"title\\\":\\\"ve vip\\\",\\\"description\\\":\\\"<p>ghe vip gan khan dai<\\/p>\\\",\\\"price\\\":200000},{\\\"title\\\":\\\"ve sieu vip\\\",\\\"description\\\":\\\"<p>gan khan dai A<\\/p>\\\",\\\"price\\\":500000}]\"', '\"[{\\\"type\\\":\\\"facebook\\\",\\\"url\\\":\\\"tuoitre.vn\\\",\\\"icon\\\":\\\"http:\\/\\/assets.giang.test\\/image\\/1746893956_41e907f66020bf591a82.jpg\\\"}]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.labit365.com\\/image\\/1746893846_5fa0e620c9487a412a22.jpg\\\",\\\"is_main\\\":false}]\"', '\"[]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[]}\"'),
(7, 3, 'anh trai vuot ngan chong gai', 'http://assets.giang.test/files/1749138650_e57fd0b3b374ce143a52.png', 'san vd my dinh', 'online', 1, '2025-06-05 15:53:12', '2025-06-27 15:53:15', '[{\"title\":\"\",\"content\":\"<p><br><\\/p>\"}]', '2025-06-05 22:53:49', '2025-06-05 22:53:49', 'viet nam', 'ha noi', 'nam tu liem', 'aloha', 'ok', '0912345677', 'doangiang665@gmail.com', '\"[{\\\"title\\\":\\\"\\\",\\\"description\\\":\\\"<p><br><\\/p>\\\",\\\"price\\\":0}]\"', '\"[]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.giang.test\\/files\\/1749138643_6d9033882b6b41df9dd1.png\\\",\\\"is_main\\\":false}]\"', '\"[]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[]}\"'),
(8, 12, 'anh trai chông gai', 'http://assets.giang.test/files/1749279164_0279fb51a111df9a6da0.jpg', 'svd my dinh', 'online', 1, '2025-06-07 06:53:56', '2025-06-26 06:53:59', '[{\"title\":\"su kien ho\\u00e0nh t\\u00e1ng\",\"content\":\"<p>su kien ho\\u00e0nh t\\u00e1ng<\\/p>\"}]', '2025-06-07 13:54:20', '2025-06-07 13:54:20', 'viet nam', 'ha noi', 'nam tu liem', 'Doan', 'Giang', '0912345678', 'doangiang665@gmail.com', '\"[{\\\"title\\\":\\\"v\\u00e9 v\\u00edp\\\",\\\"description\\\":\\\"<p>v\\u00e9 ng\\u1ed3i g\\u1ea7n<\\/p>\\\",\\\"price\\\":20000},{\\\"title\\\":\\\"v\\u00e9 b\\u00ecnh th\\u01b0\\u1eddng\\\",\\\"description\\\":\\\"<p>ng\\u1ed3i xa<\\/p>\\\",\\\"price\\\":15000}]\"', '\"[]\"', '\"[{\\\"url\\\":\\\"http:\\/\\/assets.giang.test\\/files\\/1749279062_316589d384687c80ecaf.jpg\\\",\\\"is_main\\\":false}]\"', '\"[]\"', 'offline', '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"topProductsMode\\\":\\\"all\\\",\\\"topProducts\\\":[]}\"');

-- --------------------------------------------------------

--
-- Table structure for table `landing_pages`
--

CREATE TABLE `landing_pages` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('draft','published') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'draft',
  `access_count` int UNSIGNED DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_gifts`
--

CREATE TABLE `loyalty_gifts` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('item','vnpoint') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'item',
  `value` int DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_histories`
--

CREATE TABLE `loyalty_histories` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `program_id` int DEFAULT NULL,
  `type` enum('participation','winning') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_participation_logs`
--

CREATE TABLE `loyalty_participation_logs` (
  `id` int UNSIGNED NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gift_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_winner` tinyint(1) DEFAULT '0',
  `joined_at` datetime DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_programs`
--

CREATE TABLE `loyalty_programs` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `video` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `status` tinyint(1) DEFAULT '1',
  `social_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `display_settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_vouchers`
--

CREATE TABLE `loyalty_vouchers` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int DEFAULT '0',
  `quantity` int DEFAULT '0',
  `issued` int DEFAULT '0',
  `used` int DEFAULT '0',
  `max_per_voucher` int DEFAULT '1',
  `max_per_user` int DEFAULT '1',
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `duration_after_issued` int DEFAULT NULL,
  `require_owner` tinyint(1) DEFAULT '0',
  `is_lucky_draw` tinyint(1) DEFAULT '0',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `user_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_winner_logs`
--

CREATE TABLE `loyalty_winner_logs` (
  `id` int UNSIGNED NOT NULL,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_recharge` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `gift_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `program_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `won_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `key_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'product.view', 'Xem sản phẩm', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(2, 'product.create', 'Tạo sản phẩm', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(3, 'product.update', 'Cập nhật sản phẩm', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(4, 'product.delete', 'Xoá sản phẩm', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(5, 'category.view', 'Xem danh mục', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(6, 'category.create', 'Tạo danh mục', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(7, 'category.update', 'Cập nhật danh mục', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(8, 'category.delete', 'Xoá danh mục', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(9, 'business.view', 'Xem doanh nghiệp', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(10, 'business.create', 'Tạo doanh nghiệp', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(11, 'business.update', 'Cập nhật doanh nghiệp', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(12, 'business.delete', 'Xoá doanh nghiệp', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(13, 'person.view', 'Xem cá nhân', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(14, 'person.create', 'Tạo cá nhân', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(15, 'person.update', 'Cập nhật cá nhân', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(16, 'person.delete', 'Xoá cá nhân', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(17, 'store.view', 'Xem cửa hàng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(18, 'store.create', 'Tạo cửa hàng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(19, 'store.update', 'Cập nhật cửa hàng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(20, 'store.delete', 'Xoá cửa hàng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(21, 'event.view', 'Xem sự kiện', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(22, 'event.create', 'Tạo sự kiện', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(23, 'event.update', 'Cập nhật sự kiện', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(24, 'event.delete', 'Xoá sự kiện', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(25, 'qr.view', 'Xem QR Code', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(26, 'qr.create', 'Tạo QR Code', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(27, 'qr.update', 'Cập nhật QR Code', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(28, 'qr.delete', 'Xoá QR Code', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(29, 'loyalty.view', 'Xem chương trình loyalty', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(30, 'loyalty.create', 'Tạo chương trình loyalty', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(31, 'loyalty.update', 'Cập nhật chương trình loyalty', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(32, 'loyalty.delete', 'Xoá chương trình loyalty', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(33, 'user.view', 'Xem người dùng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(34, 'user.create', 'Tạo người dùng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(35, 'user.update', 'Cập nhật người dùng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(36, 'user.delete', 'Xoá người dùng', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(37, 'setting.view', 'Xem cấu hình', '2025-04-21 00:15:39', '2025-04-21 00:15:39'),
(38, 'setting.update', 'Cập nhật cấu hình', '2025-04-21 00:15:39', '2025-04-21 00:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `job_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `display_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`id`, `user_id`, `first_name`, `last_name`, `name`, `avatar`, `video_url`, `phone`, `email`, `website`, `country`, `address`, `social_links`, `job_title`, `bio`, `created_at`, `updated_at`, `display_settings`) VALUES
(1, 1, NULL, NULL, 'demo 1', 'http://assets.labit365.com/image/1745030161_1629c049dd5304b986df.jpg', NULL, '0387409300', 'doangiang665@gmail.com', NULL, NULL, 'acb xyz', NULL, 'dev web', 'dev web', '2025-04-12 17:20:19', '2025-05-11 20:57:40', '{\"selectedTemplate\":\"tpl-3\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"1\",\"2\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"selected\",\"selectedStores\":[\"1\"],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"selected\",\"topProducts\":[\"2\",\"9\",\"5\"],\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"https://shopee.vn/\"},{\"platform\":\"Lazada\",\"url\":\"https://tiki.vn/\"},{\"platform\":\"Tiki\",\"url\":\"https://www.lazada.vn/\"}]}'),
(2, 1, NULL, NULL, 'chaiel', 'http://assets.labit365.com/image/1745033604_a1290dbd357f8d81b784.jpg', NULL, '0387409300', 'chaiel@gmail.com', NULL, NULL, NULL, NULL, 'dev', 'dev', '2025-04-19 03:33:52', '2025-05-11 20:57:40', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"2\",\"3\",\"4\",\"5\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"selected\",\"selectedStores\":[\"1\"]}'),
(3, 1, NULL, NULL, 'xxxxxxxxx', 'https://assets.labit365.com/image/1746976614_dc22b5561dd32857e119.png', NULL, '0387409300', 'giang@gmail.com', NULL, NULL, NULL, NULL, 'dev', '', '2025-05-03 07:05:38', '2025-05-11 20:57:40', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"1\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"selected\",\"selectedStores\":[\"6\"]}'),
(4, 3, NULL, NULL, 'khach hang moi', 'http://assets.giang.test/files/1749138579_f47388db4515f6801f46.png', NULL, '0387409300', 'khachmoi1@gmail.com', NULL, NULL, NULL, NULL, 'nhân viên', '', '2025-06-05 22:50:20', '2025-06-05 22:50:20', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[]}'),
(5, 12, NULL, NULL, 'Doan Van Giang', 'http://assets.giang.test/files/1749279407_f71c589d49660dc0230e.png', NULL, '0387409300', 'doangiang665@gmail.com', NULL, NULL, NULL, NULL, 'nhân viên', '', '2025-06-07 13:57:28', '2025-06-07 13:57:28', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint NOT NULL,
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `price_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'single',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_from` decimal(15,2) DEFAULT '0.00',
  `price_to` decimal(15,2) DEFAULT '0.00',
  `show_contact_price` tinyint(1) DEFAULT '0',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `certificate_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attributes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `display_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `name`, `category_id`, `price_mode`, `price`, `price_from`, `price_to`, `show_contact_price`, `contact_phone`, `avatar`, `images`, `video`, `certificate_file`, `description`, `attributes`, `status`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `display_settings`, `product_links`) VALUES
(1, '5424324324kkk', 'demo 1', 1, 'range', 120000.00, 10000.00, 150000.00, 0, '0913577896', '[{\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1745030163_2becc0716ebd8871b505.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030163_2becc0716ebd8871b505.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746721974938\",\"is_main\":false},{\"uid\":\"1746722023534\",\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746722023_7a6443cc59ab292b1881.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746722023_7a6443cc59ab292b1881.png\",\"isCover\":false,\"isYoutube\":false,\"is_main\":false},{\"uid\":\"1746970327537\",\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1746970327_5328cd3f3906a864d3b9.png\",\"preview\":\"https:\\/\\/assets.labit365.com\\/image\\/1746970327_5328cd3f3906a864d3b9.png\",\"isCover\":true,\"isYoutube\":false,\"is_main\":true}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030163_2becc0716ebd8871b505.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030163_2becc0716ebd8871b505.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746721974938\",\"is_main\":false},{\"uid\":\"1746722023534\",\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746722023_7a6443cc59ab292b1881.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746722023_7a6443cc59ab292b1881.png\",\"isCover\":false,\"isYoutube\":false,\"is_main\":false},{\"uid\":\"1746970327537\",\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1746970327_5328cd3f3906a864d3b9.png\",\"preview\":\"https:\\/\\/assets.labit365.com\\/image\\/1746970327_5328cd3f3906a864d3b9.png\",\"isCover\":false,\"isYoutube\":false,\"is_main\":false},{\"uid\":\"1746974340754\",\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1746974340_2d9c430d10e1f162b17d.jpg\",\"preview\":\"https:\\/\\/assets.labit365.com\\/image\\/1746974340_2d9c430d10e1f162b17d.jpg\",\"isCover\":true,\"isYoutube\":false,\"is_main\":true}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030163_2becc0716ebd8871b505.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030163_2becc0716ebd8871b505.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746721974938\",\"is_main\":false},{\"uid\":\"1746722023534\",\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746722023_7a6443cc59ab292b1881.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746722023_7a6443cc59ab292b1881.png\",\"isCover\":false,\"isYoutube\":false,\"is_main\":false},{\"uid\":\"1746970327537\",\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1746970327_5328cd3f3906a864d3b9.png\",\"preview\":\"https:\\/\\/assets.labit365.com\\/image\\/1746970327_5328cd3f3906a864d3b9.png\",\"isCover\":true,\"isYoutube\":false,\"is_main\":true}]', '[\"http:\\/\\/assets.labit365.com\\/uploads\\/1744558167_bca4a4605e98ca0c07e5.pdf\"]', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">- Xuất xứ : Trung Quốc</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Thiết kế nhỏ gọn, vừa tầm tay.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Các phím to, rõ, dễ nhìn, không bị phai mờ theo thời gian.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Sử dụng 2 pin AAA, không cần thiết lập cài đặt.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Khoảng cách khiển lên đến 8m.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-An toàn cho người sử dụng.</span></p><p><br></p>', '[]', 1, '2025-04-12 17:20:19', '2025-05-11 21:40:40', NULL, 1, '{\"selectedTemplate\":\"tpl-3\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"selected\",\"selectedStores\":[\"1\"],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"https://shopee.vn/\"},{\"platform\":\"Lazada\",\"url\":\"https://tiki.vn/\"},{\"platform\":\"Tiki\",\"url\":\"https://www.lazada.vn/\"}]}', NULL),
(2, '23424244', 'demo sp', 1, 'range', 120000.00, 40000.00, 60000.00, 0, '0910740748', '[{\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1745030183_b10b3ec25f2fcedf2095.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030183_b10b3ec25f2fcedf2095.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746723245921\",\"is_main\":false},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745552471_508fb17cc865c1cd3bea.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745552471_508fb17cc865c1cd3bea.png\",\"isYoutube\":false,\"isCover\":true,\"uid\":\"1746723245921\",\"is_main\":true}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030183_b10b3ec25f2fcedf2095.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030183_b10b3ec25f2fcedf2095.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746723245921\",\"is_main\":false},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745552471_508fb17cc865c1cd3bea.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745552471_508fb17cc865c1cd3bea.png\",\"isYoutube\":false,\"isCover\":true,\"uid\":\"1746723245921\",\"is_main\":true}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030183_b10b3ec25f2fcedf2095.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030183_b10b3ec25f2fcedf2095.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746723245921\",\"is_main\":false},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745552471_508fb17cc865c1cd3bea.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745552471_508fb17cc865c1cd3bea.png\",\"isYoutube\":false,\"isCover\":true,\"uid\":\"1746723245921\",\"is_main\":true}]', '[\"http:\\/\\/assets.labit365.com\\/uploads\\/1744558212_d3135ea188a37ab7205c.pdf\"]', '<p>demo demo</p>', '[{\"name\":\"m\\u00e0u\",\"value\":\"v\\u00e0ng\"},{\"name\":\"k\\u00edc th\\u01b0\\u1edbc\",\"value\":\"xl\"}]', 1, '2025-04-13 14:58:36', '2025-05-11 21:40:46', NULL, 1, '{\"selectedTemplate\":\"tpl-2\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"5\",\"4\",\"6\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"selected\",\"selectedStores\":[\"1\"],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"https://vnexpress.net/\"},{\"platform\":\"Lazada\",\"url\":\"https://vnexpress.net/\"},{\"platform\":\"Tiki\",\"url\":\"https://vnexpress.net/\"}]}', NULL),
(3, '43243242', 'demo demo', 1, 'single', 100000.00, NULL, NULL, 0, '0912970058', '[{\"url\":\"https:\\/\\/assets.labit365.com\\/image\\/1745030201_92e108209607bc4142c8.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030201_92e108209607bc4142c8.jpg\",\"isYoutube\":false,\"isCover\":true,\"uid\":\"1746723229843\",\"is_main\":true}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030201_92e108209607bc4142c8.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030201_92e108209607bc4142c8.jpg\",\"isYoutube\":false,\"isCover\":true,\"uid\":\"1746723229843\",\"is_main\":true}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030201_92e108209607bc4142c8.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1745030201_92e108209607bc4142c8.jpg\",\"isYoutube\":false,\"isCover\":true,\"uid\":\"1746723229843\",\"is_main\":true}]', '[\"http:\\/\\/assets.labit365.com\\/uploads\\/1744557413_41644f144bdb597f2bae.pdf\"]', '<p>demo demo</p>', '[]', 1, '2025-04-13 15:17:23', '2025-05-11 21:40:51', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(4, '435435436787AAAAAAAAAA', 'Nước rau má', NULL, 'single', 25000.00, NULL, NULL, 0, '0932628047', '[\"https:\\/\\/assets.labit365.com\\/image\\/1745479579_fc31d80c0b144d95d3a9.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745479579_fc31d80c0b144d95d3a9.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745479579_fc31d80c0b144d95d3a9.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745479579_fc31d80c0b144d95d3a9.png\"]', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">- Xuất xứ : Trung Quốc</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Thiết kế nhỏ gọn, vừa tầm tay.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Các phím to, rõ, dễ nhìn, không bị phai mờ theo thời gian.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Sử dụng 2 pin AAA, không cần thiết lập cài đặt.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Khoảng cách khiển lên đến 8m.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-An toàn cho người sử dụng.</span></p><p><br></p>', '[{\"name\":\"xl\",\"value\":\"40000\"}]', 1, '2025-04-24 07:27:16', '2025-05-11 21:40:57', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(5, '454657AADĐGGG', 'rau má', NULL, 'single', 10000.00, NULL, NULL, 0, '0924230068', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480305_272f716996ccae559ffb.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480305_272f716996ccae559ffb.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480305_272f716996ccae559ffb.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480305_272f716996ccae559ffb.png\"]', '<p><span style=\"background-color: rgb(252, 250, 246); color: rgb(34, 34, 34);\">Từ ngày 10/5, mỗi kWh điện có giá hơn 2.204,7 đồng áp dụng, theo quyết định của Tập đoàn Điện lực Việt Nam (EVN).</span></p><p><span style=\"background-color: rgb(252, 250, 246); color: rgb(34, 34, 34);\">Tại họp báo chiều 9/5, EVN thông báo giá bán lẻ điện bình quân tăng từ 2.103,11 đồng lên 2.204,07 đồng một kWh (chưa gồm thuế VAT), tương đương tăng 4,8%. Mức tăng này tương tự hồi tháng 10/2024.</span></p><p><span style=\"background-color: rgb(252, 250, 246); color: rgb(34, 34, 34);\">Giá điện được xét thay đổi ba tháng một lần, khi chi phí đầu vào tăng từ 2% trở lên, theo Nghị định 72 của Chính phủ. Tức là, mỗi năm sẽ có 4 đợt thay đổi giá. Gần nhất giá điện được điều chỉnh vào 11/10/2024, duy trì từ đó cho đến nay. Như vậy, sau 8 tháng giá mới được thay đổi và đây là lần tăng đầu tiên trong năm nay.</span></p><p><br></p>', '[{\"id\":\"71\",\"product_id\":\"5\",\"name\":\"L\",\"value\":\"10000\",\"created_at\":\"2025-04-24 07:39:06\",\"updated_at\":\"2025-04-24 07:39:06\"}]', 0, '2025-04-24 07:39:06', '2025-05-11 20:51:28', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(6, '4535353hhhhhhhh', 'Sữa đậu fami', NULL, 'single', 20000.00, NULL, NULL, 0, '0923266199', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"}]', '[{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588542_19bc23f70285d1047e52.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588551_ad655404aa05b59bd397.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588566_5cf4df87782da1a45f51.jpg\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588590_caab2f3fd4acf9c458c0.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"},{\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746588636_ae4f0d4d5e1aeeebb28d.png\",\"isYoutube\":false,\"isCover\":false,\"uid\":\"1746850028886\"}]', '<p><span style=\"background-color: rgb(252, 250, 246); color: rgb(34, 34, 34);\">Tổng Bí thư chỉ ra Việt Nam và Kazakhstan chia sẻ nhiều điểm tương đồng về vị trí địa chiến lược, lịch sử phát triển và văn hoá, đều đề cao truyền thống hiếu học, lòng hiếu khách cũng như tinh thần đoàn kết. Hai nước đều vượt qua những giai đoạn kinh tế khó khăn và đã vươn lên mạnh mẽ nhờ tinh thần đổi mới, sáng tạo, dám nghĩ, dám làm.</span></p>', '[{\"id\":\"131\",\"product_id\":\"6\",\"name\":\"xl\",\"value\":\"10000\",\"created_at\":\"2025-05-07 03:30:38\",\"updated_at\":\"2025-05-07 03:30:38\"}]', 1, '2025-04-24 07:43:52', '2025-05-11 20:51:28', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"1\",\"2\",\"3\",\"4\"],\"company\":\"selected\",\"selectedCompanies\":[\"4\"],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":true,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"https://shopee.vn/list/k%E1%BB%87%20m%C3%A0n%20h%C3%ACnh\"},{\"platform\":\"Lazada\",\"url\":\"https://www.lazada.vn/?spm=a2o4n.homepage.header.dhome.3e353bdcssbVvZ#?\"},{\"platform\":\"Tiki\",\"url\":\"https://tiki.vn/\"}]}', NULL),
(7, '3453454353', 'bún đậu', NULL, 'single', 140000.00, NULL, NULL, 0, '0943640797', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480970_347dc3ef1b43bf24cf4c.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480970_347dc3ef1b43bf24cf4c.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480970_347dc3ef1b43bf24cf4c.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745480970_347dc3ef1b43bf24cf4c.png\"]', '', '[{\"name\":\"L\",\"value\":\"10000\"}]', 1, '2025-04-24 07:50:14', '2025-05-11 20:51:28', NULL, 0, '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"productLinks\\\":[{\\\"platform\\\":\\\"Shopee\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Lazada\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Tiki\\\",\\\"url\\\":\\\"\\\"}]}\"', NULL),
(8, '34234242', 'nem nuong nha trang', NULL, 'single', 23000.00, NULL, NULL, 0, '0948405390', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745481481_adca135c4dae226d93bb.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745481481_adca135c4dae226d93bb.png\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745481481_adca135c4dae226d93bb.png\"]', '[]', '', '[{\"name\":\"X\",\"value\":\"23000\"}]', 1, '2025-04-24 07:58:36', '2025-05-11 20:50:56', NULL, 0, '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"productLinks\\\":[{\\\"platform\\\":\\\"Shopee\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Lazada\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Tiki\\\",\\\"url\\\":\\\"\\\"}]}\"', NULL),
(9, '4353543535435', 'Vịt om sấu', NULL, 'single', 124000.00, NULL, NULL, 0, '0911104564', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746548943_67bbb734b9e15dfd1295.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746548943_67bbb734b9e15dfd1295.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746548943_67bbb734b9e15dfd1295.jpg\"]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1746548943_67bbb734b9e15dfd1295.jpg\"]', '<p><br></p>', '[{\"id\":\"75\",\"product_id\":\"9\",\"name\":\"L\",\"value\":\"120000\",\"created_at\":\"2025-04-24 08:02:04\",\"updated_at\":\"2025-04-24 08:02:04\"}]', 1, '2025-04-24 08:02:04', '2025-05-11 20:51:28', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"company\":\"all\",\"store\":\"all\",\"enableSurvey\":true,\"enableOrderButton\":true}', NULL),
(10, '54356465464', 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 1, 'single', 1500000.00, NULL, NULL, 0, '0910306652', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745481785_7e1b5ecc5e060c8a96fe.png\",\"http:\\/\\/assets.labit365.com\\/image\\/1745506019_855fbb66bf4f40091f09.jpg\",\"http:\\/\\/assets.labit365.com\\/image\\/1745507157_375fc75b50de8a6ad20b.jpg\"]', '[{\"uid\":\"1748188828114\",\"url\":\"http:\\/\\/assets.giang.test\\/files\\/1748188828_551e6e0e7bb88cf5305e.jpg\",\"preview\":\"http:\\/\\/assets.giang.test\\/files\\/1748188828_551e6e0e7bb88cf5305e.jpg\",\"isCover\":false,\"isYoutube\":false}]', '[]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745481785_7e1b5ecc5e060c8a96fe.png\",\"http:\\/\\/assets.labit365.com\\/image\\/1745506019_855fbb66bf4f40091f09.jpg\",\"http:\\/\\/assets.labit365.com\\/image\\/1745507157_375fc75b50de8a6ad20b.jpg\"]', '<p>Các trường hợp bảo hành cụ thể\n\n- Sản phẩm bị hư hỏng/ bể vỡ trong quá trình vận chuyển \n\n- Sản phẩm bị lỗi do lỗi từ nhà sản xuất \n\n- Sản phẩm giao đến không đúng với đơn hàng đã đặt \n\n- Sản phẩm được giao không đủ số lượng theo đơn hàng đã đặt \n\n- Những lỗi khác do kỹ thuật, chất liệu của sản phẩm </p>', '[{\"id\":\"99\",\"product_id\":\"10\",\"name\":\"XL\",\"value\":\"2000000\",\"created_at\":\"2025-04-24 16:32:03\",\"updated_at\":\"2025-04-24 16:32:03\"}]', 1, '2025-04-24 08:05:05', '2025-06-06 10:36:10', NULL, 3, '{\"selectedTemplate\":\"tpl-2\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"10\",\"11\"],\"company\":\"selected\",\"selectedCompanies\":[\"2\",\"3\"],\"store\":\"selected\",\"selectedStores\":[\"2\",\"3\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"https://shopee.vn/\"},{\"platform\":\"Lazada\",\"url\":\"https://www.lazada.vn/\"},{\"platform\":\"Tiki\",\"url\":\"https://tiki.vn/\"}]}', NULL),
(11, '54353453535', 'Điều khiển điều hòa NAGAKAWA - Remote máy lạnh Nagakawa hàng loại 1 bảo hành đổi trả 30 ngày', 5, 'single', 120000.00, NULL, NULL, 0, '0918219572', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745482473_c82e19525025ad5852fe.png\"]', '[{\"uid\":\"1748188868741\",\"url\":\"http:\\/\\/assets.giang.test\\/files\\/1748188868_82b570cb7608eceeab81.jpg\",\"preview\":\"http:\\/\\/assets.giang.test\\/files\\/1748188868_82b570cb7608eceeab81.jpg\",\"isCover\":false,\"isYoutube\":false}]', '[]', '[\"http:\\/\\/assets.labit365.com\\/image\\/1745482473_c82e19525025ad5852fe.png\"]', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">- Xuất xứ : Trung Quốc</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Thiết kế nhỏ gọn, vừa tầm tay.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Các phím to, rõ, dễ nhìn, không bị phai mờ theo thời gian.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Sử dụng 2 pin AAA, không cần thiết lập cài đặt.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Khoảng cách khiển lên đến 8m.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-An toàn cho người sử dụng.</span></p><p><br></p>', '[{\"id\":\"88\",\"product_id\":\"11\",\"name\":\"XL\",\"value\":\"230000\",\"created_at\":\"2025-04-24 15:16:05\",\"updated_at\":\"2025-04-24 15:16:05\"}]', 1, '2025-04-24 08:15:54', '2025-05-25 16:01:10', NULL, 3, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"10\",\"11\"],\"company\":\"selected\",\"selectedCompanies\":[\"2\"],\"store\":\"selected\",\"selectedStores\":[\"2\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(12, '444444444444', 'demo 3424', 2, 'single', 4555000.00, NULL, NULL, 0, '0960177910', '[]', '[{\"uid\":\"1746719702331\",\"url\":\"http://assets.labit365.com/image/1746719702_42df0a8126c4f17fe087.png\",\"preview\":\"http://assets.labit365.com/image/1746719702_42df0a8126c4f17fe087.png\",\"isCover\":true,\"isYoutube\":false,\"is_main\":true}]', '[]', '[]', '<p>xxxxxxxxxxxxxx</p>', '[{\"id\":\"137\",\"product_id\":\"12\",\"name\":\"xl\",\"value\":\"x\",\"created_at\":\"2025-05-08 15:52:15\",\"updated_at\":\"2025-05-08 15:52:15\"}]', 1, '2025-05-08 15:11:39', '2025-05-11 20:49:31', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"10\",\"11\"],\"company\":\"selected\",\"selectedCompanies\":[\"2\"],\"store\":\"selected\",\"selectedStores\":[\"2\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(13, '34435345', 'tểtrtetertet', 2, 'single', 200000.00, NULL, NULL, 0, '0946230835', '[]', '[{\"uid\":\"1746719991343\",\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746719991_244ff8f118a2af43c7ed.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746719991_244ff8f118a2af43c7ed.png\",\"isCover\":false,\"isYoutube\":false}]', '[]', '[]', '<p>cccccccccccccc</p>', '[{\"name\":\"xxxxx\",\"value\":\"3333\"}]', 1, '2025-05-08 16:00:56', '2025-05-11 20:49:31', NULL, 1, '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"productLinks\\\":[{\\\"platform\\\":\\\"Shopee\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Lazada\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Tiki\\\",\\\"url\\\":\\\"\\\"}]}\"', NULL),
(14, '3424324234', 'utyuututu', 2, 'single', 566666.00, NULL, NULL, 0, '0950620450', '[]', '[{\"uid\":\"1746720181709\",\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746720181_d7ddd9602e30e4878ab8.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746720181_d7ddd9602e30e4878ab8.png\",\"isCover\":true,\"isYoutube\":false,\"is_main\":true},{\"uid\":\"1746721929024\",\"url\":\"http:\\/\\/assets.labit365.com\\/image\\/1746721929_d6011647c13941e37ec9.png\",\"preview\":\"http:\\/\\/assets.labit365.com\\/image\\/1746721929_d6011647c13941e37ec9.png\",\"isCover\":false,\"isYoutube\":false}]', '[{\"uid\":\"1746721934773\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=uSGJcjLJok4\",\"preview\":\"https:\\/\\/img.youtube.com\\/vi\\/uSGJcjLJok4\\/hqdefault.jpg\",\"isCover\":false,\"isYoutube\":true}]', '[]', '<p>cccccccccccc</p>', '[]', 1, '2025-05-08 16:03:24', '2025-05-11 20:49:31', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(15, 'SKU001', 'Sản phẩm A', NULL, '1', 0.00, 100000.00, NULL, 0, '0914409747', NULL, NULL, NULL, NULL, '0', NULL, 1, '2025-05-08 17:17:41', '2025-05-09 21:13:09', '2025-05-09 13:45:46', 1, NULL, NULL),
(16, 'SKU002', 'Sản phẩm B', 250000, '2', 0.00, 200000.00, 150000.00, 0, '0920187389', NULL, NULL, NULL, NULL, '1', NULL, 0, '2025-05-08 17:17:41', '2025-05-09 21:13:09', '2025-05-09 13:45:42', 1, NULL, NULL),
(17, 'SP001', 'Sản phẩm mẫu', 1, 'single', 100000.00, NULL, NULL, 1, '0957707707', NULL, '[{\"url\": \"https://i.imgur.com/yigrfKn.png\", \"isCover\": true}]', NULL, NULL, 'Mô tả sản phẩm mẫu', NULL, 1, '2025-05-08 17:29:49', '2025-05-09 21:13:09', NULL, 1, NULL, NULL),
(18, 'SP001', 'Sản phẩm mẫu 2', 1, 'single', 100000.00, NULL, NULL, 0, '0927976370', '[]', '[{\"url\":\"https:\\/\\/i.imgur.com\\/5WZleXo.png\",\"isCover\":true}]', '[]', '[]', '<p>Mô tả sản phẩm mẫu</p>', '[]', 1, '2025-05-08 17:34:02', '2025-05-10 10:22:34', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"1\",\"4\",\"9\"],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"selected\",\"selectedStores\":[\"4\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(19, 'SP001', 'Sản phẩm mẫu 3', 1, 'single', 100000.00, NULL, NULL, 1, '0966758735', NULL, '[{\"url\": \"https://i.imgur.com/5WZleXo.png\", \"isCover\": true}]', NULL, NULL, 'Mô tả sản phẩm mẫu', NULL, 1, '2025-05-08 17:38:19', '2025-05-09 21:13:09', NULL, 1, NULL, NULL),
(20, 'SP001', 'Sản phẩm mẫu 3xxxxx', 1, 'single', 100000.00, NULL, NULL, 0, '0949864570', '[]', '[{\"url\":\"https:\\/\\/i.imgur.com\\/7T2xp6A.jpeg\",\"isCover\":true}]', '[]', '[]', '<p>Mô tả sản phẩm mẫu</p>', '[{\"name\":\"l\",\"value\":\"20000\"}]', 1, '2025-05-08 17:43:44', '2025-05-09 21:13:09', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(21, 'SP001', 'Sản phẩm mẫu 3xxxxx', 1, 'single', 100000.00, NULL, NULL, 1, '0949046646', NULL, '[{\"url\":\"https:\\/\\/i.imgur.com\\/GdvX1Tm.png\",\"isCover\":true}]', NULL, NULL, 'Mô tả sản phẩm mẫu', '[{\"name\":\"Size\",\"value\":\"L\"},{\"name\":\"M\\u00e0u\",\"value\":\"\\u0110\\u1ecf\"}]', 1, '2025-05-08 17:56:06', '2025-05-09 21:13:09', NULL, 1, NULL, NULL),
(22, 'SP001', 'sản phẩm demo new', 1, 'single', 100000.00, NULL, NULL, 0, '0995639999', '[]', '[{\"url\":\"https:\\/\\/i.imgur.com\\/GdvX1Tm.png\",\"isCover\":true}]', '[]', '[]', '<p>Mô tả sản phẩm mẫu</p>', '[{\"name\":\"Size\",\"value\":\"XL\"},{\"name\":\"M\\u00e0u\",\"value\":\"Cam\"}]', 1, '2025-05-09 13:48:18', '2025-05-09 14:25:24', NULL, 1, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(23, 'SP001', 'sản phẩm demo new 2', 1, 'single', 100000.00, NULL, NULL, 1, '912345678', NULL, '[{\"url\":\"https:\\/\\/i.imgur.com\\/GdvX1Tm.png\",\"isCover\":true}]', NULL, NULL, 'Mô tả sản phẩm mẫu', '[{\"name\":\"Size\",\"value\":\"XL\"},{\"name\":\"M\\u00e0u\",\"value\":\"Cam\"}]', 1, '2025-05-09 14:33:40', '2025-05-09 14:33:40', NULL, 1, NULL, NULL),
(24, '001', 'test 1', 1, 'single', 5600000.00, NULL, NULL, 0, '0912345678', '[]', '[{\"uid\":\"1747038822948\",\"url\":\"https://assets.labit365.com/image/1747038822_ca03017ddea3d0a009f3.png\",\"preview\":\"https://assets.labit365.com/image/1747038822_ca03017ddea3d0a009f3.png\",\"isCover\":true,\"isYoutube\":false,\"is_main\":true}]', '[]', '[]', '<p>ABC </p>', '[{\"name\":\"Kh\\u1ed1i l\\u01b0\\u1ee3ng\",\"value\":\"100g\"}]', 1, '2025-05-12 08:34:43', '2025-05-18 10:34:37', NULL, 5, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(25, '4242343242424', 'san pham tesst', NULL, 'single', 300000.00, NULL, NULL, 0, '0387409300', '[]', '[{\"uid\":\"1749260309681\",\"url\":\"http:\\/\\/assets.giang.test\\/files\\/1749260309_cffa0e154fd3f3a66085.png\",\"preview\":\"http:\\/\\/assets.giang.test\\/files\\/1749260309_cffa0e154fd3f3a66085.png\",\"isCover\":false,\"isYoutube\":false}]', '[]', '[]', '<p><br></p>', '[{\"name\":\"xl\",\"value\":\"24000\"}]', 1, '2025-06-07 08:39:12', '2025-06-07 08:39:12', NULL, 7, '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"productLinks\\\":[{\\\"platform\\\":\\\"Shopee\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Lazada\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Tiki\\\",\\\"url\\\":\\\"\\\"}]}\"', NULL),
(26, '534535435', 'san pham test 2', NULL, 'single', 25000.00, NULL, NULL, 0, '0912345678', '[]', '[{\"uid\":\"1749267066049\",\"url\":\"http:\\/\\/assets.giang.test\\/files\\/1749267066_188de968c465abf341c3.jpg\",\"preview\":\"http:\\/\\/assets.giang.test\\/files\\/1749267066_188de968c465abf341c3.jpg\",\"isCover\":false,\"isYoutube\":false}]', '[]', '[]', '<p><br></p>', '[{\"name\":\"xl\",\"value\":\"12000\"},{\"name\":\"xxl\",\"value\":\"14000\"}]', 1, '2025-06-07 10:31:49', '2025-06-07 15:57:24', NULL, 12, '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"26\"],\"company\":\"selected\",\"selectedCompanies\":[\"6\"],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"productLinks\":[{\"platform\":\"Shopee\",\"url\":\"\"},{\"platform\":\"Lazada\",\"url\":\"\"},{\"platform\":\"Tiki\",\"url\":\"\"}]}', NULL),
(27, '435435435', 'san test het han', NULL, 'single', 100000.00, NULL, NULL, 0, '0912345678', '[]', '[{\"uid\":\"1749284962346\",\"url\":\"http:\\/\\/assets.giang.test\\/files\\/1749284962_acc26950a7a532e479b3.jpg\",\"preview\":\"http:\\/\\/assets.giang.test\\/files\\/1749284962_acc26950a7a532e479b3.jpg\",\"isCover\":false,\"isYoutube\":false}]', '[]', '[]', '<p>he han</p>', '[]', 1, '2025-06-07 15:29:54', '2025-06-07 15:29:54', NULL, 10, '\"{\\\"selectedTemplate\\\":\\\"tpl-1\\\",\\\"relatedProducts\\\":\\\"all\\\",\\\"selectedProducts\\\":[],\\\"company\\\":\\\"all\\\",\\\"selectedCompanies\\\":[],\\\"store\\\":\\\"all\\\",\\\"selectedStores\\\":[],\\\"enableSurvey\\\":false,\\\"selectedSurveys\\\":[],\\\"enableOrderButton\\\":true,\\\"productLinks\\\":[{\\\"platform\\\":\\\"Shopee\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Lazada\\\",\\\"url\\\":\\\"\\\"},{\\\"platform\\\":\\\"Tiki\\\",\\\"url\\\":\\\"\\\"}]}\"', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(32, 3, 'xl ', '12000', '2025-04-20 04:09:53', '2025-04-20 04:09:53'),
(33, 3, 'xxl', '20000', '2025-04-20 04:09:53', '2025-04-20 04:09:53'),
(73, 7, 'L', '10000', '2025-04-24 07:50:14', '2025-04-24 07:50:14'),
(74, 8, 'X', '23000', '2025-04-24 07:58:36', '2025-04-24 07:58:36'),
(119, 1, 'XL', '342424324', '2025-05-04 09:14:42', '2025-05-04 09:14:42'),
(120, 1, 'M', '11111', '2025-05-04 09:14:42', '2025-05-04 09:14:42'),
(122, 9, 'L', '120000', '2025-05-06 16:29:06', '2025-05-06 16:29:06'),
(139, 12, 'xl', 'x', '2025-05-08 15:59:22', '2025-05-08 15:59:22'),
(140, 13, 'xxxxx', '3333', '2025-05-08 16:00:56', '2025-05-08 16:00:56'),
(141, 14, 'gggg', '675775', '2025-05-08 16:03:24', '2025-05-08 16:03:24'),
(144, 17, '[{\"name\"', '\"Size\"', '2025-05-08 17:29:49', '2025-05-08 17:29:49'),
(145, 17, '\"value\"', '\"L\"}]', '2025-05-08 17:29:49', '2025-05-08 17:29:49'),
(146, 18, 'Size', 'L', '2025-05-08 17:34:02', '2025-05-08 17:34:02'),
(147, 19, 'Size', 'L', '2025-05-08 17:38:19', '2025-05-08 17:38:19'),
(148, 19, 'Màu', 'Đỏ', '2025-05-08 17:38:19', '2025-05-08 17:38:19'),
(151, 4, 'xl', '40000', '2025-05-08 17:44:29', '2025-05-08 17:44:29'),
(153, 20, 'l', '20000', '2025-05-08 17:47:54', '2025-05-08 17:47:54'),
(154, 5, 'L', '10000', '2025-05-09 13:56:27', '2025-05-09 13:56:27'),
(155, 2, 'màu', 'vàng', '2025-05-09 14:00:04', '2025-05-09 14:00:04'),
(156, 2, 'kíc thước', 'xl', '2025-05-09 14:00:04', '2025-05-09 14:00:04'),
(161, 22, 'Size', 'XL', '2025-05-09 14:25:24', '2025-05-09 14:25:24'),
(162, 22, 'Màu', 'Cam', '2025-05-09 14:25:24', '2025-05-09 14:25:24'),
(164, 6, 'xl', '10000', '2025-05-10 05:25:23', '2025-05-10 05:25:23'),
(166, 24, 'Khối lượng', '100g', '2025-05-13 15:17:50', '2025-05-13 15:17:50'),
(172, 11, 'XL', '230000', '2025-05-25 16:01:10', '2025-05-25 16:01:10'),
(173, 10, 'XL', '2000000', '2025-06-06 10:36:10', '2025-06-06 10:36:10'),
(174, 25, 'xl', '24000', '2025-06-07 08:39:12', '2025-06-07 08:39:12'),
(179, 26, 'xl', '12000', '2025-06-07 15:57:24', '2025-06-07 15:57:24'),
(180, 26, 'xxl', '14000', '2025-06-07 15:57:24', '2025-06-07 15:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_histories`
--

CREATE TABLE `purchase_histories` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int DEFAULT '1',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `purchased_at` datetime DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0',
  `starts_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_histories`
--

INSERT INTO `purchase_histories` (`id`, `customer_id`, `product_name`, `amount`, `quantity`, `note`, `purchased_at`, `is_paid`, `is_active`, `starts_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(5, 7, 'Gói Premium', 0.00, 2, NULL, '2025-06-01 12:57:27', 1, 1, '2025-06-01 12:57:27', '2026-06-01 12:57:27', '2025-06-01 12:57:27', '2025-06-07 15:56:35'),
(6, 7, 'Gói Premium', 0.00, 5, NULL, '2025-06-01 15:52:18', 0, 0, '2025-06-01 15:52:18', '2030-06-01 15:52:18', '2025-06-01 15:52:18', '2025-06-07 15:56:35'),
(7, 7, 'Gói Premium', 0.00, 2, NULL, '2025-06-01 15:52:30', 0, 0, '2025-06-01 15:52:30', '2027-06-01 15:52:30', '2025-06-01 15:52:30', '2025-06-07 15:56:35'),
(8, 8, 'Gói Premium', 0.00, 3, NULL, '2025-06-01 17:26:36', 1, 1, '2025-06-01 17:26:36', '2028-06-01 17:26:36', '2025-06-01 17:26:36', '2025-06-07 15:56:35'),
(9, 10, 'Gói Premium', 0.00, 3, NULL, '2025-06-01 17:29:04', 1, 0, '2025-06-01 17:29:04', '2025-05-31 17:39:40', '2025-06-01 17:29:04', '2025-06-07 15:56:35'),
(10, 9, 'Gói Premium', 0.00, 1, NULL, '2025-06-01 17:58:24', 1, 1, '2025-06-01 17:58:24', '2026-06-01 17:58:24', '2025-06-01 17:58:24', '2025-06-07 15:56:35'),
(11, 11, 'Gói Premium', 0.00, 3, NULL, '2025-06-01 18:01:20', 0, 0, '2025-06-01 18:01:20', '2028-06-01 18:01:20', '2025-06-01 18:01:20', '2025-06-07 15:56:35'),
(12, 7, 'Gói Premium', 0.00, 1, NULL, '2025-06-02 23:54:06', 0, 0, '2025-06-02 23:54:06', '2026-06-02 23:54:06', '2025-06-02 23:54:06', '2025-06-07 15:56:35'),
(13, 7, 'Gói Premium', 0.00, 5, NULL, '2025-06-02 23:54:26', 0, 0, '2025-06-02 23:54:26', '2030-06-02 23:54:26', '2025-06-02 23:54:26', '2025-06-07 15:56:35'),
(14, 8, 'Gói Premium', 0.00, 3, NULL, '2025-06-02 23:54:49', 0, 0, '2025-06-02 23:54:49', '2028-06-02 23:54:49', '2025-06-02 23:54:49', '2025-06-07 15:56:35'),
(15, 8, 'Gói Premium', 0.00, 1, NULL, '2025-06-02 23:55:03', 1, 1, '2025-06-02 23:55:03', '2026-06-02 23:55:03', '2025-06-02 23:55:03', '2025-06-07 15:56:35'),
(16, 13, 'Gói Premium', 0.00, 1, NULL, '2025-06-05 15:56:28', 1, 1, '2025-06-05 15:56:28', '2026-06-05 15:56:28', '2025-06-05 15:56:28', '2025-06-07 15:56:35'),
(17, 12, 'Gói Premium', 0.00, 1, NULL, '2025-06-05 15:58:35', 1, 1, '2025-06-05 15:58:35', '2026-06-05 15:58:35', '2025-06-05 15:58:35', '2025-06-07 15:56:35'),
(18, 11, 'Gói Premium', 0.00, 4, NULL, '2025-06-05 15:59:53', 1, 1, '2025-06-05 15:59:53', '2029-06-05 15:59:53', '2025-06-05 15:59:53', '2025-06-07 15:56:35');

-- --------------------------------------------------------

--
-- Table structure for table `qr_codes`
--

CREATE TABLE `qr_codes` (
  `id` int NOT NULL,
  `short_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `target_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `qr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_type` enum('free','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'free',
  `campaign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `expires_at` datetime DEFAULT NULL,
  `qr_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scan_count` int DEFAULT '0',
  `last_scanned_at` datetime DEFAULT NULL,
  `settings_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qr_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_codes`
--

INSERT INTO `qr_codes` (`id`, `short_code`, `user_id`, `target_type`, `target_id`, `qr_name`, `qr_type`, `campaign`, `is_active`, `expires_at`, `qr_url`, `scan_count`, `last_scanned_at`, `settings_json`, `note`, `created_at`, `updated_at`, `qr_id`, `purchase_id`) VALUES
(1, 'beaf3e3a', 1, 'product', 5, 'xxxxxxxxxxxxx', 'free', NULL, 1, NULL, 'http://qrcode.io/d9bff865', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-05 09:43:03', '2025-05-18 22:06:05', 'd9bff865', 1),
(2, '31b1ff2f', 1, 'product', 6, 'vvvvvvvvvvvvvvv', 'free', NULL, 1, NULL, 'http://qrcode.io/d9c0bb17', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-05 09:44:19', '2025-05-18 22:06:05', 'd9c0bb17', 1),
(3, '3d0dc909', 1, 'product', 2, 'tttttt222', 'free', NULL, 1, NULL, 'http://qrcode.io/d9c0c140', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-05 09:46:17', '2025-05-18 22:06:05', 'd9c0c140', 1),
(4, 'a2868812', 1, 'product', 5, 'tttttttttttttt', 'free', NULL, 1, NULL, 'http://qrcode.io/d9c0c74a', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-05 09:46:57', '2025-05-18 22:06:05', 'd9c0c74a', 1),
(5, '7cc36059', 1, 'product', 1, 'tyiuuuuuu', 'free', NULL, 1, NULL, 'http://qrcode.io/d9c0d21f', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-05 09:47:00', '2025-05-18 22:06:05', 'd9c0d21f', 1),
(6, '6cbeb6a2', 1, 'product', 9, 'weeeeee', 'free', NULL, 1, NULL, 'http://qrcode.io/d9c0dad2', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-05 09:47:11', '2025-05-18 22:06:05', 'd9c0dad2', 1),
(23, 'eb9710d2', 1, 'store', 1, '5434353535', 'free', NULL, 1, NULL, 'http://qrcode.io/bi9u4h4n', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1746810249_b0b00be8a7367f640842.png\"}', NULL, '2025-05-09 17:04:10', '2025-05-18 22:06:05', 'bi9u4h4n', 1),
(24, '85cc8abc', 1, 'product', 18, '43535355', 'free', NULL, 1, NULL, 'http://qrcode.io/0b3m3wz3', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1746810294_4a0bf9582d7c59a7e12c.png\"}', NULL, '2025-05-09 17:04:55', '2025-05-18 22:06:05', '0b3m3wz3', 1),
(25, '2fe5f523', 1, 'person', 2, '3424224424242', 'free', NULL, 1, NULL, 'http://qrcode.io/ugduxaix', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1746873746_6ac814af1c690e9ac7dc.jpg\"}', NULL, '2025-05-10 10:42:28', '2025-05-18 22:06:05', 'ugduxaix', 1),
(26, '94f8dc13', 1, 'event', 4, '4353453535', 'free', NULL, 1, NULL, 'http://qrcode.io/hioaoomz', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1746880311_5ae69d91fd5cff5e067b.jpg\"}', NULL, '2025-05-10 12:31:55', '2025-05-18 22:06:05', 'hioaoomz', 1),
(27, 'b04fd0b7', 1, 'event', 1, '453454353535', 'free', NULL, 1, NULL, 'http://qrcode.io/kmlccxl6', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-10 13:34:01', '2025-05-18 22:06:05', 'kmlccxl6', 1),
(28, '20616c7e', 1, 'event', 6, 'Anh trai say 2', 'free', NULL, 1, NULL, 'http://qrcode.io/t3obq9eo', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1746894014_0070f8c1f0029856e73e.jpg\"}', NULL, '2025-05-10 16:20:16', '2025-05-18 22:06:05', 't3obq9eo', 1),
(32, 'c2c10652', 1, 'business', 4, 'ma moi', 'free', NULL, 1, NULL, 'http://qrcode.io/p7k0b6ks', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-10 17:44:03', '2025-05-18 22:06:05', 'p7k0b6ks', 1),
(33, '4cf20fa6', 1, 'business', 5, '454353543535', 'free', NULL, 1, NULL, 'http://qrcode.io/flojlg2z', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1746973048_ca04d6ad3d496813d81d.png\"}', NULL, '2025-05-10 18:14:37', '2025-05-18 22:06:05', 'flojlg2z', 1),
(34, '754c70d1', 0, 'product', 24, 'test 1', 'free', NULL, 1, NULL, 'http://qrcode.io/n43ynz8h', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-12 08:35:19', '2025-05-18 22:06:05', 'n43ynz8h', 1),
(35, 'e27df95f', 0, 'product', 24, 'test 11', 'free', NULL, 1, NULL, 'http://qrcode.io/454wqcmc', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-12 08:37:37', '2025-05-18 22:06:05', '454wqcmc', 1),
(36, '6f9bc3dd', 0, 'product', 24, 'test', 'free', NULL, 1, NULL, 'http://qrcode.io/lticdvef', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-12 08:39:55', '2025-05-18 22:06:05', 'lticdvef', 1),
(37, '0b92f670', 0, 'product', 24, 'test', 'free', NULL, 1, NULL, 'http://qrcode.io/pm9m6qfx', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-12 08:47:18', '2025-05-18 22:06:05', 'pm9m6qfx', 1),
(38, '79d63e39', 5, 'product', 24, 'test', 'free', NULL, 1, NULL, 'http://qrcode.io/fwppqenw', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-12 08:51:52', '2025-05-18 22:06:05', 'fwppqenw', 1),
(45, '328d3ecc', 5, 'url', NULL, 'mã code url', 'free', NULL, 1, NULL, 'http://vnexpress.net/', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"https://vnexpress.net/\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-13 18:02:25', '2025-05-18 22:06:05', '84odyuoq', 1),
(46, '59bc1512', 5, 'url', NULL, 'mã dân trí url', 'free', NULL, 1, NULL, 'http://dantri.com.vn/noi-vu/nhom-can-bo-cong-chuc-duoc-uu-tien-nghi-huu-truoc-tuoi-20250322153127598.htm', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"https://dantri.com.vn/noi-vu/nhom-can-bo-cong-chuc-duoc-uu-tien-nghi-huu-truoc-tuoi-20250322153127598.htm\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"http://assets.giang.test/image/1747159674_6deabb4c4d0ba9a3481f.png\"}', NULL, '2025-05-13 18:06:35', '2025-05-18 22:06:05', '8ul1bjsv', 1),
(47, '52b40cc3', 5, 'product', 24, 'ma sp 2', 'free', NULL, 1, NULL, 'http://qrcode.io/8xxwifwz', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-13 18:12:04', '2025-05-18 22:06:05', '8xxwifwz', 1),
(48, '796e6a85', 1, 'text', NULL, '', 'free', NULL, 1, NULL, 'vvvvvvvvvvvv', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"vvvvvvvvvvvv\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-15 17:09:29', '2025-05-18 22:06:05', 'nycu0hlb', 1),
(49, 'b560bc5a', 1, 'url', NULL, 'qr dan tri', 'free', NULL, 1, NULL, 'dantri.com', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"dantri.com\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-16 15:05:07', '2025-05-18 22:06:05', 'xzdb3gwb', 1),
(50, 'a34ee980', 1, 'person', 2, 'xxxxxx', 'free', NULL, 1, NULL, 'http://qrcode.io/qj5i2h23', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-16 15:06:18', '2025-05-18 22:06:05', 'qj5i2h23', 1),
(51, '6e752f5d', 1, 'person', 3, '4354355355', 'free', NULL, 1, NULL, 'http://qrcode.io/ldbq4gse', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-16 15:23:44', '2025-05-18 22:06:05', 'ldbq4gse', 1),
(52, '597818ae', 1, 'text', NULL, 'xxxxxxxxxxxx', 'free', NULL, 1, NULL, 'Quốc hội xem xét nới lỏng chính sách nhập tịch\nChính phủ muốn tạo điều kiện thuận lợi cho nhà đầu tư, nhà khoa học, chuyên gia nước ngoài được nhập quốc tịch Việt Nam nhằm thu hút nguồn lực chất lượng cao.', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"Quốc hội xem xét nới lỏng chính sách nhập tịch\\nChính phủ muốn tạo điều kiện thuận lợi cho nhà đầu tư, nhà khoa học, chuyên gia nước ngoài được nhập quốc tịch Việt Nam nhằm thu hút nguồn lực chất lượng cao.\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"L\"},\"image\":\"\"}', NULL, '2025-05-17 02:32:32', '2025-05-18 22:06:05', '9u9m20xo', 1),
(53, '5e671b27', 1, 'url', NULL, 'vcccccc', 'free', NULL, 1, NULL, 'https://vnexpress.net/', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"https://vnexpress.net/\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-17 05:00:53', '2025-05-18 22:06:05', '1317ifwa', 1),
(55, '02bf968c', 1, 'url', NULL, 'xxxxxxxxxxxx', 'free', NULL, 1, NULL, 'https://vnexpress.net/', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"https://vnexpress.net/\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-17 05:03:08', '2025-05-18 22:06:05', 'g1e8uyvf', 1),
(58, 'e6cb6755', 1, 'text', NULL, 'xxxxxxxxx', 'free', NULL, 1, NULL, 'Nhóm cán bộ, công chức được ưu tiên nghỉ hưu trước tuổi', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"Nhóm cán bộ, công chức được ưu tiên nghỉ hưu trước tuổi\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-17 16:33:25', '2025-05-18 22:06:05', 'g4ov5u09', 1),
(59, '5a5b766d', 1, 'text', NULL, 'dantri.com.vn', 'free', NULL, 1, NULL, 'http://qrcode.io/5a5b766d', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"Tổng Bí thư Tô Lâm nói về \'bộ tứ trụ cột\'\\nTổng Bí thư Tô Lâm nói Nghị quyết 57 thúc đẩy khoa học công nghệ và đổi mới sáng tạo, Nghị quyết 59 về chủ động hội nhập quốc tế, Nghị quyết 68 phát triển kinh tế tư nhân và Nghị quyết 66 đổi mới toàn diện thể chế là \\\"bộ tứ trụ cột\\\" giúp đất nước cất cánh.\\n\\nSáng 18/5, Bộ Chính trị, Ban Bí thư tổ chức Hội nghị toàn quốc quán triệt và triển khai thực hiện Nghị quyết 66 về đổi mới công tác xây dựng và thi hành pháp luật đáp ứng yêu cầu phát triển đất nước trong kỷ nguyên mới và Nghị quyết số 68 về phát triển kinh tế tư nhân. Hội nghị được kết nối từ Hội trường Diên Hồng Nhà Quốc hội đến hơn 37.000 điểm cầu trên toàn quốc với hơn 1,5 triệu đại biểu tham dự.\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-17 16:48:44', '2025-05-18 22:06:05', 'hfwzt736', 1),
(60, 'PR-109362', 1, 'product', 2, 'xxxxxxxxxx', 'free', NULL, 1, NULL, 'http://qrcode.io/i49b3yp6', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-18 04:38:04', '2025-05-18 22:06:05', 'i49b3yp6', 1),
(61, '65b53209', 1, 'person', 3, 'vvvvvvvvvvvvvvvvv', 'free', NULL, 1, NULL, 'http://qrcode.io/wqbz8vhi', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-18 04:41:17', '2025-05-18 22:06:05', 'wqbz8vhi', 1),
(62, 'cd774e40', 3, 'product', 10, 'test ma qr', 'free', NULL, 1, NULL, 'http://qrcode.io/oxzici8m', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-05-26 17:15:16', '2025-05-26 17:15:16', 'oxzici8m', NULL),
(63, '1377c051', 3, 'product', 10, 'san pham 1', 'free', NULL, 1, NULL, 'http://qrcode.io/4gvy6uwn', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-05 22:54:25', '2025-06-05 22:54:25', '4gvy6uwn', NULL),
(64, '06f0ebaa', 7, 'product', 25, 'qr code san pham test 1', 'free', NULL, 1, NULL, 'http://qrcode.io/jhnsgutb', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 08:39:51', '2025-06-07 08:39:51', 'jhnsgutb', NULL),
(65, '154e607a', 12, 'product', 26, 'qr test 2', 'free', NULL, 1, NULL, 'http://qrcode.io/sf1cx3rv', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 10:32:17', '2025-06-07 10:32:17', 'sf1cx3rv', NULL),
(66, '136b5c0f', 12, 'business', 6, 'qr test cong ty', 'free', NULL, 1, NULL, 'http://qrcode.io/vo5lumq8', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"qr cong ty test\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 13:28:53', '2025-06-07 13:28:53', 'vo5lumq8', NULL),
(67, '1b4c3d59', 12, 'event', 8, 'qr code anh trai chông gai', 'free', NULL, 1, NULL, 'http://qrcode.io/hqnwitd9', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 13:54:43', '2025-06-07 13:54:43', 'hqnwitd9', NULL),
(68, '9c3d8f0c', 12, 'person', 5, 'test qr người dùng', 'free', NULL, 1, NULL, 'http://qrcode.io/pzdb08dt', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 13:57:50', '2025-06-07 13:57:50', 'pzdb08dt', NULL),
(69, 'f24ad868', 12, 'store', 8, 'mã cửa hàng tiện lợi', 'free', NULL, 1, NULL, 'http://qrcode.io/yiycuv7b', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 14:04:20', '2025-06-07 14:04:20', 'yiycuv7b', NULL),
(70, 'd388a499', 7, 'product', 25, 'san phẩm test hết hạn', 'free', NULL, 1, NULL, 'http://qrcode.io/rxc7e620', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 15:28:06', '2025-06-07 15:28:06', 'rxc7e620', NULL),
(71, '4c4f7a76', 7, 'product', 25, 'test sp het han', 'free', NULL, 1, NULL, 'http://qrcode.io/v072mj35', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 15:34:22', '2025-06-07 15:34:22', 'v072mj35', NULL),
(72, 'ea7ad251', 3, 'product', 10, 'test sp pro', '', NULL, 1, NULL, 'http://qrcode.io/gac4x6fn', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 16:28:48', '2025-06-07 16:28:48', 'gac4x6fn', NULL),
(73, '7142a172', 3, 'store', 3, 'test cửa hàng pro', '', NULL, 1, NULL, 'http://qrcode.io/pi9j16yq', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 16:30:02', '2025-06-07 16:30:02', 'pi9j16yq', NULL),
(74, '36f60359', 7, 'store', 9, 'test mã pro code', '', NULL, 1, NULL, 'http://qrcode.io/g62rzwwq', 0, NULL, '{\"width\":300,\"height\":300,\"margin\":0,\"data\":\"\",\"dotsOptions\":{\"color\":\"#800053\",\"type\":\"extra-rounded\"},\"cornersSquareOptions\":{\"type\":\"extra-rounded\",\"color\":\"#000000\"},\"cornersDotOptions\":{\"type\":\"dot\",\"color\":\"#000000\"},\"backgroundOptions\":{\"color\":\"#eeeeee\"},\"imageOptions\":{\"imageSize\":0.4,\"hideBackgroundDots\":true,\"margin\":0},\"qrOptions\":{\"typeNumber\":0,\"mode\":\"Byte\",\"errorCorrectionLevel\":\"Q\"},\"image\":\"\"}', NULL, '2025-06-07 16:32:18', '2025-06-07 16:32:18', 'g62rzwwq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `qr_scan_logs`
--

CREATE TABLE `qr_scan_logs` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `qr_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_id` int DEFAULT NULL,
  `object_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scan_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_unique` tinyint(1) DEFAULT '1',
  `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `qr_scan_logs`
--

INSERT INTO `qr_scan_logs` (`id`, `user_id`, `qr_id`, `qr_name`, `qr_type`, `tracking_code`, `short_code`, `qr_url`, `type`, `target_id`, `object_name`, `object_image`, `user_agent`, `os`, `app`, `device_type`, `browser`, `ip_address`, `referer`, `scan_source`, `is_unique`, `country`, `city`, `latitude`, `longitude`, `phone_number`, `customer`, `created_at`, `updated_at`) VALUES
(310, NULL, 'oxzici8m', NULL, NULL, 'FZva4Azh', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'PostmanRuntime/7.44.0', 'Unknown Platform', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-05-27 16:43:00', '2025-05-27 16:43:00'),
(311, NULL, 'oxzici8m', NULL, NULL, 'NX5BvIfA', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-05-27 16:43:13', '2025-05-27 16:43:13'),
(312, NULL, 'oxzici8m', NULL, NULL, '33ue0xhT', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-05-27 16:49:52', '2025-05-27 16:49:52'),
(314, NULL, 'oxzici8m', 'test ma qr', 'free', '6RhJRKsW', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:01:46', '2025-05-27 17:01:46'),
(315, NULL, 'oxzici8m', 'test ma qr', 'free', 'pdFhayOc', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:06:12', '2025-05-27 17:06:12'),
(316, NULL, 'oxzici8m', 'test ma qr', 'free', 'TlpcgUnD', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'Windows 10', 'Edge', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:15:21', '2025-05-27 17:15:21'),
(317, NULL, 'oxzici8m', 'test ma qr', 'free', 'jirDmZln', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:15:43', '2025-05-27 17:15:43'),
(318, NULL, 'oxzici8m', 'test ma qr', 'free', 'cCbC8lik', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0', 'Windows 10', 'Firefox', 'Desktop', 'Firefox', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:16:10', '2025-05-27 17:16:10'),
(319, NULL, 'oxzici8m', 'test ma qr', 'free', '4ymowSIM', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:20:24', '2025-05-27 17:20:24'),
(320, NULL, 'oxzici8m', 'test ma qr', 'free', '2mkCEPew', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:20:42', '2025-05-27 17:20:42'),
(321, NULL, 'oxzici8m', 'test ma qr', 'free', 'LiXHLlSm', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:21:42', '2025-05-27 17:21:42'),
(322, NULL, 'oxzici8m', 'test ma qr', 'free', 'HCZyzgmV', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:28:22', '2025-05-27 17:28:22'),
(323, NULL, 'oxzici8m', 'test ma qr', 'free', 'Rp2CZpbk', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-27 17:29:21', '2025-05-27 17:29:21'),
(324, NULL, 'oxzici8m', 'test ma qr', 'free', '5CXDXr7M', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-28 00:33:16', '2025-05-28 00:33:16'),
(325, NULL, 'oxzici8m', 'test ma qr', 'free', 'IhwXb3GZ', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'Windows 10', 'Edge', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-28 00:33:57', '2025-05-28 00:33:57'),
(326, NULL, 'oxzici8m', 'test ma qr', 'free', 'oZVBYduq', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'Windows 10', 'Edge', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-28 00:34:09', '2025-05-28 00:34:09'),
(327, NULL, 'oxzici8m', 'test ma qr', 'free', 'ACztdZo5', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-28 23:05:50', '2025-05-28 23:05:50'),
(328, NULL, 'oxzici8m', 'test ma qr', 'free', 'dW2j5ks4', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-28 23:06:01', '2025-05-28 23:06:01'),
(329, NULL, 'oxzici8m', 'test ma qr', 'free', '7x24QJwG', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-05-28 23:06:22', '2025-05-28 23:06:22'),
(330, NULL, 'oxzici8m', 'test ma qr', 'free', 'SroWRoka', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-01 11:02:39', '2025-06-01 11:02:39'),
(331, NULL, 'oxzici8m', 'test ma qr', 'free', 'dlS14sky', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-01 11:02:58', '2025-06-01 11:02:58'),
(332, NULL, 'oxzici8m', 'test ma qr', 'free', 'dbMNM0Hw', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-05 13:50:39', '2025-06-05 13:50:39'),
(333, NULL, 'oxzici8m', 'test ma qr', 'free', 'HM7TrDoT', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-05 22:22:22', '2025-06-05 22:22:22'),
(334, NULL, '4gvy6uwn', 'san pham 1', 'free', 'P4kwZLZO', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-06 08:29:01', NULL),
(335, NULL, '4gvy6uwn', 'san pham 1', 'free', 'UXFt6wvc', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-06 08:29:12', NULL),
(336, NULL, '4gvy6uwn', 'san pham 1', 'free', '8Pajwb6L', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-06 08:29:14', NULL),
(337, NULL, '4gvy6uwn', 'san pham 1', 'free', 'cxqXigXq', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'Windows 10', 'Edge', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-06 08:29:39', NULL),
(338, NULL, '4gvy6uwn', 'san pham 1', 'free', 'RkKgVXFp', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-06 08:33:28', NULL),
(339, NULL, '4gvy6uwn', 'san pham 1', 'free', '87b2A2t0', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, 'Giường gấp văn phòng cao cấp gấp gọn 4 khúc H2Home khung hợp kim sơn tĩnh điện chắc chắn bảo hành 12 tháng', 'http://assets.labit365.com/image/1745481785_7e1b5ecc5e060c8a96fe.png', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', 'Khách hàng #id_3', '2025-06-06 08:41:05', NULL),
(340, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', '08XXsSZZ', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:40:01', NULL),
(341, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', 'yTnMleGe', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:40:07', NULL),
(342, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', 'ZRSsnXAy', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:42:02', NULL),
(343, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', 'EkdfrQbE', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', 'Windows 10', 'Edge', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:42:11', NULL),
(344, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', '6tEDUNeQ', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:43:18', NULL),
(345, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', 'z2Rztvev', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:43:22', NULL),
(346, NULL, 'jhnsgutb', 'qr code san pham test 1', 'free', 'b4MUpLNH', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, 'san pham tesst', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', 'Chrome', 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', 'Khách hàng #id_7', '2025-06-07 08:44:20', NULL),
(347, NULL, 'jhnsgutb', NULL, NULL, '9UJMp5cE', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 08:55:45', NULL),
(348, NULL, 'jhnsgutb', NULL, NULL, 'gS83AXVk', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 08:55:49', NULL),
(349, NULL, 'jhnsgutb', NULL, NULL, 'qC6e0PiK', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 08:57:35', NULL),
(350, NULL, 'jhnsgutb', NULL, NULL, 'y3GXBOob', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:02:48', NULL),
(351, NULL, 'jhnsgutb', NULL, NULL, 'iMSULmRh', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:18:36', NULL),
(352, NULL, 'jhnsgutb', NULL, NULL, 'XkUcV5Vk', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:18:37', NULL),
(353, NULL, 'jhnsgutb', NULL, NULL, 'FvomlyQo', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:18:55', NULL),
(354, NULL, 'jhnsgutb', NULL, NULL, 'ft8IgFL4', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:19:35', NULL),
(355, NULL, 'jhnsgutb', NULL, NULL, 'o2AP7l9o', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:25:14', NULL),
(356, NULL, 'jhnsgutb', NULL, NULL, 'c6XlYvDI', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:31:14', NULL),
(357, NULL, 'jhnsgutb', NULL, NULL, 'Qx2daoDo', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:33:30', NULL),
(358, NULL, 'jhnsgutb', NULL, NULL, 'upPkYo4F', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:33:50', NULL),
(359, NULL, 'jhnsgutb', NULL, NULL, 'NhVFhrIF', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:34:07', NULL),
(360, NULL, 'jhnsgutb', NULL, NULL, 'mLgCOJdq', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:36:58', NULL),
(361, NULL, 'jhnsgutb', NULL, NULL, 'PpgduBKl', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:37:03', NULL),
(362, NULL, 'jhnsgutb', NULL, NULL, 'aJq6mr7O', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:43:50', NULL),
(363, NULL, 'jhnsgutb', NULL, NULL, 'EAb7v0VM', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:43:56', NULL),
(364, NULL, 'jhnsgutb', NULL, NULL, 'iMJI5I4W', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:43:59', NULL),
(365, NULL, 'jhnsgutb', NULL, NULL, 'jYRdcLzU', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:46:41', NULL),
(366, NULL, 'jhnsgutb', NULL, NULL, 'rdO2xBfk', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 09:46:43', NULL),
(367, NULL, 'jhnsgutb', NULL, NULL, 't5IPCPJV', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 10:21:04', NULL),
(368, NULL, 'jhnsgutb', NULL, NULL, 'Qv14emid', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 10:26:06', NULL),
(369, NULL, 'jhnsgutb', NULL, NULL, 'xjYektEJ', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 10:26:12', NULL),
(370, 7, 'jhnsgutb', NULL, NULL, 'EzelMBZC', NULL, 'http://qrcode.io/views/product.html?jhnsgutb', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 10:29:49', NULL),
(371, 12, 'sf1cx3rv', NULL, NULL, 'ylq6vFs0', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 10:32:41', NULL),
(372, 12, 'sf1cx3rv', NULL, NULL, 'EV6GQL10', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 10:33:31', NULL),
(373, 12, 'sf1cx3rv', NULL, NULL, 'krg3ChSZ', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:35:15', NULL),
(374, 12, 'sf1cx3rv', NULL, NULL, 'dDJKDHmj', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:35:20', NULL),
(375, 12, 'sf1cx3rv', NULL, NULL, 'ZhjCg2Sn', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:35:38', NULL),
(376, 12, 'sf1cx3rv', NULL, NULL, 'TXU5DnE9', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:35:47', NULL),
(377, 12, 'sf1cx3rv', NULL, NULL, 'qA2CVlNd', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:38:49', NULL),
(378, 12, 'sf1cx3rv', NULL, NULL, '5T4UvweX', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:38:54', NULL),
(379, 12, 'vo5lumq8', NULL, NULL, 'R1DcVlyk', NULL, 'http://qrcode.io/views/business.html?vo5lumq8', 'business', 6, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:39:55', NULL),
(380, 12, 'vo5lumq8', NULL, NULL, 'LFLCFpUC', NULL, 'http://qrcode.io/views/business.html?vo5lumq8', 'business', 6, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:40:04', NULL),
(381, 12, 'vo5lumq8', NULL, NULL, 'LTwpPK7E', NULL, 'http://qrcode.io/views/business.html?vo5lumq8', 'business', 6, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:40:43', NULL),
(382, 12, 'hqnwitd9', NULL, NULL, '7fmz7xwe', NULL, 'http://qrcode.io/views/event.html?hqnwitd9', 'event', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:54:54', NULL),
(383, 12, 'hqnwitd9', NULL, NULL, 'PwirLXZ2', NULL, 'http://qrcode.io/views/event.html?hqnwitd9', 'event', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 13:55:03', NULL),
(384, 12, 'pzdb08dt', NULL, NULL, 'HAyFO5FU', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:57:58', NULL),
(385, 12, 'pzdb08dt', NULL, NULL, 'von1FOq9', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:58:00', NULL),
(386, 12, 'pzdb08dt', NULL, NULL, 'xPW8NH0N', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:58:03', NULL),
(387, 12, 'pzdb08dt', NULL, NULL, 'Vuyu8VJY', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:58:05', NULL),
(388, 12, 'pzdb08dt', NULL, NULL, 'k1f6iBpA', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 13:59:20', NULL),
(389, 12, 'yiycuv7b', NULL, NULL, '5zPkj3G5', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:04:29', NULL),
(390, 12, 'yiycuv7b', NULL, NULL, 'jtN1A1dz', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:04:31', NULL),
(391, 12, 'yiycuv7b', NULL, NULL, 'x8fjXBEp', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:04:55', NULL),
(392, 12, 'yiycuv7b', NULL, NULL, 'PNidykYc', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:05:03', NULL),
(393, 12, 'yiycuv7b', NULL, NULL, 'rsFi4qkg', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:16:28', NULL),
(394, 12, 'yiycuv7b', NULL, NULL, 'G9HnddWK', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:41:33', NULL),
(395, 12, 'yiycuv7b', NULL, NULL, 'jxYBFi0q', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 14:44:55', NULL),
(396, 12, 'sf1cx3rv', NULL, NULL, 'KAUIZWbk', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 14:49:10', NULL),
(397, 12, 'hqnwitd9', NULL, NULL, '8f4Df1Z6', NULL, 'http://qrcode.io/views/event.html?hqnwitd9', 'event', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 14:52:55', NULL),
(398, 1, 'd9bff865', NULL, NULL, 'x42BfrIr', NULL, 'http://qrcode.io/views/product.html?d9bff865', 'product', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0924230068', NULL, '2025-06-07 15:08:45', NULL),
(399, 7, 'v072mj35', NULL, NULL, 'tsSArkQi', NULL, 'http://qrcode.io/views/product.html?v072mj35', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 15:34:29', NULL),
(400, 12, 'hqnwitd9', NULL, NULL, 'HpXTbFLL', NULL, 'http://qrcode.io/views/event.html?hqnwitd9', 'event', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 15:46:59', NULL),
(401, 12, 'sf1cx3rv', NULL, NULL, 'xcGNHIn1', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 15:48:13', NULL),
(402, 3, 'oxzici8m', NULL, NULL, 'rMs2hOtJ', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 15:48:23', NULL),
(403, 3, 'oxzici8m', NULL, NULL, 's97ZTAo7', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 15:56:09', NULL),
(404, 12, 'yiycuv7b', NULL, NULL, 'dqU5oUn5', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 15:57:44', NULL),
(405, 12, 'pzdb08dt', NULL, NULL, 'EAjgEP6K', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 15:57:50', NULL),
(406, 12, 'yiycuv7b', NULL, NULL, '3aOphUJh', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 15:59:09', NULL),
(407, 12, 'yiycuv7b', NULL, NULL, 'dBlXIkCc', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:02:55', NULL),
(408, 3, 'oxzici8m', NULL, NULL, '27AIBDlu', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 16:05:25', NULL),
(409, 3, 'oxzici8m', NULL, NULL, 'uoufbjje', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 16:06:02', NULL),
(410, 3, 'oxzici8m', NULL, NULL, 'BunEuHg3', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 16:07:32', NULL),
(411, 3, 'oxzici8m', NULL, NULL, 'CuXilKQZ', NULL, 'http://qrcode.io/views/product.html?oxzici8m', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 16:07:48', NULL),
(412, 12, 'yiycuv7b', NULL, NULL, 'YiIaZYQh', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:08:10', NULL),
(413, 12, 'sf1cx3rv', NULL, NULL, 'VxHnY7Xv', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 16:08:29', NULL),
(414, 12, 'yiycuv7b', NULL, NULL, 'HjHp4Z5p', NULL, 'http://qrcode.io/views/store.html?yiycuv7b', 'store', 8, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:12:07', NULL),
(415, 12, 'pzdb08dt', NULL, NULL, 'XmCnutfg', NULL, 'http://qrcode.io/views/person.html?pzdb08dt', 'person', 5, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:12:11', NULL),
(416, 12, 'sf1cx3rv', NULL, NULL, 'gnsZqakt', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 16:12:15', NULL),
(417, 12, 'vo5lumq8', NULL, NULL, '2qDfHz6k', NULL, 'http://qrcode.io/views/business.html?vo5lumq8', 'business', 6, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:12:20', NULL),
(418, 7, 'v072mj35', NULL, NULL, 'cHT12vWz', NULL, 'http://qrcode.io/views/product.html?v072mj35', 'product', 25, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:13:20', NULL),
(419, 12, 'sf1cx3rv', NULL, NULL, 'YDBMuy5Q', NULL, 'http://qrcode.io/views/product.html?sf1cx3rv', 'product', 26, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0912345678', NULL, '2025-06-07 16:13:26', NULL),
(420, 3, '4gvy6uwn', NULL, NULL, 'auylCMLb', NULL, 'http://qrcode.io/views/product.html?4gvy6uwn', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 16:13:31', NULL),
(421, 3, 'gac4x6fn', NULL, NULL, 'PwmXZiJx', NULL, 'http://qrcode.io/views/product.html?gac4x6fn', 'product', 10, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0910306652', NULL, '2025-06-07 16:29:00', NULL),
(422, 3, 'pi9j16yq', NULL, NULL, 'ztULAQiQ', NULL, 'http://qrcode.io/views/store.html?pi9j16yq', 'store', 3, NULL, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'Windows 10', NULL, 'Desktop', 'Chrome', '127.0.0.1', '', NULL, 1, 'VN', 'Hà Nội', NULL, NULL, '0387409300', NULL, '2025-06-07 16:30:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'Toàn quyền', '2025-04-21 00:06:00', '2025-04-21 00:06:00'),
(2, 'admin', 'Quản trị viên', '2025-04-21 00:06:00', '2025-04-21 00:06:00'),
(3, 'user', 'Người dùng', '2025-04-21 00:06:00', '2025-04-21 00:06:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int NOT NULL,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`) VALUES
(4, 3, 1, '2025-04-21 00:35:31'),
(5, 3, 2, '2025-04-21 00:35:31'),
(6, 3, 3, '2025-04-21 00:35:31'),
(7, 1, 1, '2025-04-21 21:48:03'),
(8, 1, 2, '2025-04-21 21:48:03'),
(9, 1, 7, '2025-04-21 21:48:03'),
(10, 1, 18, '2025-04-21 21:48:03');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `user_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'xxxxx', '2222', '2025-05-04 15:10:39', '2025-05-04 15:10:39'),
(2, 1, 'vvvvv', '222211111', '2025-05-04 15:10:48', '2025-05-04 15:10:48'),
(3, 4, 'xl', '10000', '2025-05-11 06:32:45', '2025-05-11 06:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `display_settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `product_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `user_id`, `name`, `logo`, `address`, `phone`, `email`, `website`, `description`, `created_at`, `updated_at`, `display_settings`, `status`, `product_ids`) VALUES
(1, 1, 'demo 1', 'http://assets.labit365.com/image/1745041561_cfb1a46ffe8605a53362.png', 'acb xyz', '0387409300', 'doangiang665@gmail.com', NULL, '<p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">- Xuất xứ : Trung Quốc</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Thiết kế nhỏ gọn, vừa tầm tay.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Các phím to, rõ, dễ nhìn, không bị phai mờ theo thời gian.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Sử dụng 2 pin AAA, không cần thiết lập cài đặt.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-Khoảng cách khiển lên đến 8m.</span></p><p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">-An toàn cho người sử dụng.</span></p><p><br></p>', '2025-04-19 04:05:19', '2025-05-11 20:58:47', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"3\",\"4\",\"5\",\"6\",\"9\",\"2\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"all\",\"selectedStores\":[\"1\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"selected\",\"topProducts\":[\"2\",\"3\",\"5\"]}', 1, '[\"3\",\"4\",\"5\",\"6\",\"9\",\"2\"]'),
(2, 3, 'Cửa hàng demo 2', 'http://assets.giang.test/files/1748189332_f0047526a942d1da5bc7.jpg', 'tây mỗ, nam từ liêm', '0387409300', 'doangiang665@gmail.com', NULL, '<p><span style=\"background-color: rgb(255, 255, 255); color: rgba(0, 0, 0, 0.8);\">Kệ để màn hình máy tính Homeline kệ để PC decor bàn làm việc, bàn học chất liệu gỗ MDF cao cấp chống xước - D48</span></p>', '2025-04-24 15:26:22', '2025-05-25 16:08:53', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[\"10\",\"11\"],\"company\":\"all\",\"selectedCompanies\":[\"2\",\"3\"],\"store\":\"all\",\"selectedStores\":[\"2\",\"3\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"all\",\"topProducts\":[\"10\",\"11\"]}', 1, '[\"10\",\"11\"]'),
(3, 3, 'Cửa hàng tạp hóa pew pew', 'http://assets.giang.test/files/1748189339_007dfee953b19c6bfeca.jpg', 'nam từ liêm, hà nội', '0387409300', 'doangiang665@gmail.com', NULL, '<p>cửa hàng tạp hóa 10k</p>', '2025-04-24 17:03:43', '2025-05-25 16:09:01', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[\"10\",\"11\"],\"company\":\"all\",\"selectedCompanies\":[\"2\",\"3\"],\"store\":\"all\",\"selectedStores\":[\"2\",\"3\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"all\",\"topProducts\":[\"10\",\"11\"]}', 1, '[\"10\",\"11\"]'),
(4, 1, 'cửa hàng 2', 'https://assets.labit365.com/image/1746976626_2fd91673a45a7750b266.png', 'tay mo nam tu liem', '0387409300', 'giang@gmail.com', NULL, '<p><br></p>', '2025-04-29 04:56:33', '2025-05-11 15:17:07', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"4\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"all\",\"selectedStores\":[\"1\",\"4\",\"5\",\"6\",\"7\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"selected\",\"topProducts\":[\"2\"]}', 1, '[\"4\"]'),
(5, 1, 'gggggggg', 'http://assets.labit365.com/image/1746258587_08836e9fa786a9d22f76.png', 'xuan thuy, cau giay', '0387409300', 'qe@gmail.com', NULL, '<p>gggggggggggggg</p>', '2025-05-03 06:23:25', '2025-05-11 20:58:47', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"3\",\"4\",\"6\"],\"company\":\"selected\",\"selectedCompanies\":[\"4\"],\"store\":\"all\",\"selectedStores\":[\"1\",\"4\",\"5\",\"6\",\"7\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"selected\",\"topProducts\":[\"1\",\"2\",\"4\"]}', 1, '[\"3\",\"4\",\"6\"]'),
(6, 1, 'xxxxx', 'http://assets.labit365.com/image/1746254862_8f14809456d38f343fe2.jpg', 'le duc tho nam tu liem ha noi', '0387409300', 'xxx@gmail.com', NULL, '<p><br></p>', '2025-05-03 06:34:23', '2025-05-11 20:58:47', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"selected\",\"selectedProducts\":[\"3\"],\"company\":\"selected\",\"selectedCompanies\":[\"1\"],\"store\":\"all\",\"selectedStores\":[\"1\",\"4\",\"5\",\"6\",\"7\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"selected\",\"topProducts\":[\"2\"]}', 1, '[\"3\"]'),
(7, 1, 'xxxxxxxxxx', 'https://assets.labit365.com/image/1746976637_486087fa833dd932fcd1.png', 'tay mo', '0387409300', 'giang@gmail.com', NULL, '<p><br></p>', '2025-05-03 06:37:42', '2025-05-11 15:17:19', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"9\",\"12\",\"13\",\"14\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\"],\"company\":\"all\",\"selectedCompanies\":[\"1\",\"4\",\"5\"],\"store\":\"all\",\"selectedStores\":[\"1\",\"4\",\"5\",\"6\",\"7\"],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"all\",\"topProducts\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"9\",\"12\",\"13\",\"14\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\"]}', 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"9\",\"12\",\"13\",\"14\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\",\"23\"]'),
(8, 12, 'cừa hàng demo 1', 'http://assets.giang.test/files/1749279828_344bdb2c3d324b8e8c75.png', 'nghia hung nam dinh', '0387409300', 'cuahang@gmail.com', NULL, '<p>của hang tien loi 24/7</p>', '2025-06-07 14:03:49', '2025-06-07 14:03:49', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"all\",\"topProducts\":[]}', 1, '[]'),
(9, 7, 'test cua hang pro 1111', 'http://assets.giang.test/files/1749288713_40d438b9703eaa657dd2.png', 'ha noi', '0912345678', 'pro11@gmail.com', NULL, '<p>test sp pro</p>', '2025-06-07 16:31:55', '2025-06-07 16:31:55', '{\"selectedTemplate\":\"tpl-1\",\"relatedProducts\":\"all\",\"selectedProducts\":[],\"company\":\"all\",\"selectedCompanies\":[],\"store\":\"all\",\"selectedStores\":[],\"enableSurvey\":false,\"selectedSurveys\":[],\"enableOrderButton\":true,\"topProductsMode\":\"all\",\"topProducts\":[]}', 1, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` bigint DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `role` enum('admin','customer') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `role_id` int DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_interaction` datetime DEFAULT NULL,
  `max_qr_limit` int DEFAULT '200'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`, `updated_at`, `name`, `phone`, `avatar`, `status`, `role`, `role_id`, `address`, `city`, `last_interaction`, `max_qr_limit`) VALUES
(3, 'admin@example.com', '$2y$10$X0AYs8k7Dw8fbMqF9DzxiuBhQzGzu.ehudtC.2SWOjA4tsTZK0sYG', '2025-04-20 14:02:38', '2025-05-26 17:10:37', 'Admin', '0988888888', 'http://assets.giang.test/files/1748279435_dad3cfbf5ca25d45c62e.png', 1, 'admin', 1, NULL, NULL, NULL, 200),
(7, 'john@gmail.com', '$2y$10$2v4/oqgsxoozV3liS465m.NuJzAZsE8lABLNbXCLf.a79YK1n9rqK', '2025-05-20 14:55:33', '2025-06-05 16:16:08', 'John Doe', '0912345678', 'http://assets.giang.test/files/1748279389_23bf67676026a2c14db4.jpg', 1, 'customer', NULL, 'tay mo', 'ha noi', NULL, 200),
(8, 'samsung@gmail.com', '$2y$10$nF2YB/m8otCfBgUyd/QIKe5j4Zm6pmqGN/LFrmRWzM2ZBtx0p7U3m', '2025-05-21 16:50:03', '2025-06-05 13:49:24', 'samsung', '0912345678', 'http://assets.giang.test/files/1748279470_a8bb49c7c783d253916b.png', 1, 'customer', NULL, 'tay mo', 'ha noi', NULL, 200),
(9, 'trananh@gmail.com', '$2y$10$nNeGXdlbcDHKxHifYPsT2uz2lls4FPf2Nurx6t4Nisof.MyJ1MmSa', '2025-06-01 16:49:16', '2025-06-01 18:00:09', 'tran anh', '0912345688', NULL, 1, 'customer', NULL, 'doi can ba dinh', 'ha noi', NULL, 200),
(10, 'khachhangmoi1@gmail.com', '$2y$10$NpotBb/yT0w.bLF1vERfb./fvBRAfbXtgiQfAXkuRqZ0OhOS.4xoS', '2025-06-01 17:28:44', '2025-06-01 17:48:34', 'khách hàng mới 1', '0912345622', NULL, 4, 'customer', NULL, 'yen lang, dong da', 'ha noi', NULL, 200),
(11, 'khachhangmoi2@gmail.com', '$2y$10$O465xwdLuFvG.YB1eqCa6OQjNckRIQg7kdDjb4.G5UEMoqLgXe9U2', '2025-06-01 18:00:55', '2025-06-02 22:21:32', 'khách hàng mới 2', '0912345622', NULL, 2, 'customer', NULL, 'xuan thuy, cau giay', 'ha noi', NULL, 200),
(12, 'khach3@gmail.com', '$2y$10$Ncowt9au3AthvxUdHYC2GeHcqOd8nEb/FZ/Ok1Z7VXNmlhTvgs5YG', '2025-06-05 15:38:24', '2025-06-05 15:55:22', 'khách 3', '0977507587', NULL, 1, 'customer', NULL, 'tây mỗ', 'hà nội', NULL, 200),
(13, 'khanh4@gmail.com', '$2y$10$ErEN.i72If.vE9sqTnpkjevLvlCtRVuNBkOW3V8/0bJgBbLQuiI3S', '2025-06-05 15:56:04', '2025-06-05 15:56:47', 'khach 4', '0977507587', NULL, 1, 'customer', NULL, 'tay mo', 'ha noi', NULL, 200);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_extra_info`
--
ALTER TABLE `business_extra_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity_images`
--
ALTER TABLE `entity_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `landing_pages`
--
ALTER TABLE `landing_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_gifts`
--
ALTER TABLE `loyalty_gifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_histories`
--
ALTER TABLE `loyalty_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_participation_logs`
--
ALTER TABLE `loyalty_participation_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_programs`
--
ALTER TABLE `loyalty_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `loyalty_vouchers`
--
ALTER TABLE `loyalty_vouchers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyalty_winner_logs`
--
ALTER TABLE `loyalty_winner_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_histories`
--
ALTER TABLE `purchase_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qr_codes`
--
ALTER TABLE `qr_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `qr_id` (`qr_id`);

--
-- Indexes for table `qr_scan_logs`
--
ALTER TABLE `qr_scan_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_code` (`tracking_code`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_extra_info`
--
ALTER TABLE `business_extra_info`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `entity_images`
--
ALTER TABLE `entity_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `landing_pages`
--
ALTER TABLE `landing_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_gifts`
--
ALTER TABLE `loyalty_gifts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_histories`
--
ALTER TABLE `loyalty_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_participation_logs`
--
ALTER TABLE `loyalty_participation_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_programs`
--
ALTER TABLE `loyalty_programs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_vouchers`
--
ALTER TABLE `loyalty_vouchers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_winner_logs`
--
ALTER TABLE `loyalty_winner_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `purchase_histories`
--
ALTER TABLE `purchase_histories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `qr_codes`
--
ALTER TABLE `qr_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `qr_scan_logs`
--
ALTER TABLE `qr_scan_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
