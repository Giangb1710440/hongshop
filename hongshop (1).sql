-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2021 lúc 06:57 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hongshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Dép Nữ', 'dep-nu', '2020-10-26 06:05:48', '2020-10-27 05:01:35'),
(2, NULL, 1, 'Sandal Nữ', 'sandal-nu', '2020-10-26 06:05:48', '2020-10-27 05:01:44'),
(3, NULL, 1, 'Giày Cao Gót', 'cao-got', '2020-10-26 06:25:41', '2020-10-27 05:01:26'),
(4, NULL, 1, 'Sneaker Nữ', 'sneaker-nu', '2020-10-27 04:59:51', '2020-10-27 05:01:07'),
(5, NULL, 1, 'Giày Oxford & Boots', 'giay-oxford-and-boots', '2020-10-27 05:00:51', '2020-10-27 05:00:51'),
(6, NULL, 2, 'Giày Thể Thao Nam', 'giay-the-thao-nam', '2020-10-27 05:02:03', '2020-10-27 05:02:03'),
(7, NULL, 2, 'Boot', 'boot', '2020-10-27 05:02:22', '2020-10-27 05:02:22'),
(8, NULL, 2, 'Sandal & Dép', 'sandal-and-dep', '2020-10-27 05:03:01', '2020-10-27 05:03:01'),
(9, NULL, 2, 'Mọi & Slipon', 'moi-and-slipon', '2020-10-27 05:03:15', '2020-10-27 05:03:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `color`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Xanh Dương', 'ok', '2020-10-26 06:21:00', '2020-10-27 04:50:14'),
(2, 'Đen', 'ok', '2020-10-27 04:47:00', '2020-10-27 04:49:57'),
(3, 'Trắng', 'ok', '2020-10-27 04:48:00', '2020-10-27 04:49:28'),
(4, 'Đỏ', 'ok', '2020-10-27 04:48:00', '2020-10-27 04:51:38'),
(5, 'Xanh Nhạt', 'ok', '2020-11-24 00:22:58', '2020-11-24 00:22:58'),
(8, 'Hồng', 'ok', '2020-10-27 04:51:19', '2020-10-27 04:51:19'),
(9, 'Be', 'ok', '2020-10-27 04:51:52', '2020-10-27 04:51:52'),
(11, 'Tím', 'ok', '2020-10-27 04:52:30', '2020-10-27 04:52:30'),
(12, 'Kem', 'ok', '2020-10-27 04:52:54', '2020-10-27 04:52:54'),
(13, 'Vàng', 'ok', '2020-10-27 04:53:05', '2020-10-27 04:53:05'),
(15, 'Xám', 'ok', '2020-10-27 04:53:47', '2020-10-27 04:53:47'),
(17, 'Nâu', 'ok', '2020-10-31 23:10:38', '2020-10-31 23:10:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color_products`
--

CREATE TABLE `color_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `color_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `color_products`
--

INSERT INTO `color_products` (`id`, `color_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2020-10-27 22:16:09', '2020-10-27 22:16:09'),
(2, 3, 1, '2020-10-27 22:16:37', '2020-10-27 22:16:37'),
(3, 2, 2, '2020-10-31 23:07:06', '2020-10-31 23:07:06'),
(4, 1, 2, '2020-10-31 23:09:28', '2020-10-31 23:09:28'),
(5, 17, 2, '2020-10-31 23:11:02', '2020-10-31 23:11:02'),
(6, 2, 3, '2020-10-31 23:11:16', '2020-10-31 23:11:16'),
(7, 4, 3, '2020-11-23 00:52:47', '2020-11-23 00:52:47'),
(8, 2, 4, '2020-10-31 23:12:38', '2020-10-31 23:12:38'),
(9, 3, 4, '2020-10-31 23:12:50', '2020-10-31 23:12:50'),
(10, 1, 5, '2020-10-31 23:13:00', '2020-11-24 00:20:38'),
(11, 5, 5, '2020-10-31 23:14:00', '2020-11-24 00:23:42'),
(12, 1, 6, '2020-10-31 23:14:00', '2020-11-24 00:20:58'),
(13, 2, 6, '2020-10-31 23:14:48', '2020-10-31 23:14:48'),
(14, 8, 6, '2020-10-31 23:15:01', '2020-10-31 23:15:01'),
(15, 9, 7, '2020-10-31 23:15:43', '2020-10-31 23:15:43'),
(16, 9, 8, '2020-10-31 23:16:03', '2020-10-31 23:16:03'),
(17, 2, 9, '2020-10-31 23:16:18', '2020-10-31 23:16:18'),
(18, 3, 9, '2020-10-31 23:16:33', '2020-10-31 23:16:33'),
(19, 12, 9, '2020-10-31 23:16:00', '2020-11-24 00:32:10'),
(20, 2, 10, '2020-10-31 23:17:03', '2020-10-31 23:17:03'),
(21, 11, 10, '2020-10-31 23:17:16', '2020-10-31 23:17:16'),
(22, 2, 11, '2020-10-31 23:17:33', '2020-10-31 23:17:33'),
(23, 5, 11, '2020-10-31 23:17:00', '2020-11-24 00:33:14'),
(24, 4, 11, '2020-10-31 23:18:00', '2020-11-24 00:33:40'),
(25, 3, 12, '2020-10-31 23:18:22', '2020-10-31 23:18:22'),
(26, 13, 12, '2020-10-31 23:18:41', '2020-10-31 23:18:41'),
(27, 8, 13, '2020-10-31 23:21:03', '2020-10-31 23:21:03'),
(28, 3, 13, '2020-10-31 23:21:15', '2020-10-31 23:21:15'),
(29, 3, 14, '2020-10-31 23:21:34', '2020-10-31 23:21:34'),
(30, 8, 14, '2020-10-31 23:21:50', '2020-10-31 23:21:50'),
(31, 3, 15, '2020-10-31 23:22:02', '2020-10-31 23:22:02'),
(32, 3, 16, '2020-10-31 23:22:14', '2020-10-31 23:22:14'),
(33, 2, 16, '2020-10-31 23:22:24', '2020-10-31 23:22:24'),
(34, 2, 17, '2020-10-31 23:22:37', '2020-10-31 23:22:37'),
(35, 17, 17, '2020-10-31 23:22:49', '2020-10-31 23:22:49'),
(36, 2, 18, '2020-10-31 23:23:15', '2020-10-31 23:23:15'),
(37, 17, 18, '2020-10-31 23:23:29', '2020-10-31 23:23:29'),
(38, 3, 19, '2020-10-31 23:25:33', '2020-10-31 23:25:33'),
(39, 2, 20, '2020-10-31 23:25:59', '2020-10-31 23:25:59'),
(40, 4, 20, '2020-10-31 23:27:00', '2020-11-24 00:48:20'),
(41, 2, 21, '2020-10-31 23:27:22', '2020-10-31 23:27:22'),
(43, 1, 22, '2020-10-31 23:28:00', '2020-11-24 00:20:14'),
(44, 2, 22, '2020-10-31 23:29:01', '2020-10-31 23:29:01'),
(45, 3, 23, '2020-10-31 23:29:18', '2020-10-31 23:29:18'),
(46, 2, 23, '2020-10-31 23:29:29', '2020-10-31 23:29:29'),
(47, 2, 24, '2020-10-31 23:29:47', '2020-10-31 23:29:47'),
(48, 17, 24, '2020-10-31 23:30:03', '2020-10-31 23:30:03'),
(49, 2, 25, '2020-10-31 23:30:18', '2020-10-31 23:30:18'),
(50, 2, 26, '2020-10-31 23:32:19', '2020-10-31 23:32:19'),
(51, 17, 26, '2020-10-31 23:32:32', '2020-10-31 23:32:32'),
(52, 2, 27, '2020-10-31 23:32:52', '2020-10-31 23:32:52'),
(53, 17, 27, '2020-10-31 23:33:09', '2020-10-31 23:33:09'),
(54, 1, 28, '2020-10-31 23:34:00', '2020-11-24 00:19:59'),
(55, 2, 29, '2020-10-31 23:34:19', '2020-10-31 23:34:19'),
(56, 2, 30, '2020-11-02 04:28:00', '2020-11-02 04:28:00'),
(57, 1, 30, '2020-11-02 04:28:21', '2020-11-02 04:28:21'),
(58, 2, 31, '2020-11-02 04:29:21', '2020-11-02 04:29:21'),
(59, 1, 32, '2020-11-02 04:29:00', '2020-11-24 00:19:44'),
(60, 5, 33, '2020-11-02 04:30:00', '2020-11-24 00:53:37'),
(61, 17, 34, '2020-11-02 04:30:00', '2020-11-24 00:53:24'),
(62, 2, 34, '2020-11-02 04:31:00', '2020-11-24 00:53:02'),
(63, 17, 35, '2020-11-02 04:32:00', '2020-11-02 04:32:00'),
(64, 8, 36, '2020-12-20 21:18:01', '2020-12-20 21:18:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Giày rất đẹp', '2021-04-06 09:07:16', '2021-04-06 09:07:16'),
(2, 2, 20, 'sản phẩm rất đẹp', '2021-04-10 23:20:34', '2021-04-10 23:20:34'),
(3, 6, 3, 'Có màu khác không shop', '2021-05-07 09:12:22', '2021-05-07 09:12:22'),
(4, 7, 4, 'giày đẹp', '2021-05-08 04:00:32', '2021-05-08 04:00:32'),
(5, 7, 2, 'đẹp', '2021-05-08 04:08:58', '2021-05-08 04:08:58'),
(6, 7, 3, 'đẹp', '2021-05-08 04:19:33', '2021-05-08 04:19:33'),
(7, 7, 36, 'đẹp', '2021-05-08 04:20:37', '2021-05-08 04:20:37'),
(8, 7, 7, 'đẹp', '2021-05-08 04:21:37', '2021-05-08 04:21:37'),
(9, 2, 5, 'đẹp', '2021-05-08 04:49:07', '2021-05-08 04:49:07'),
(10, 7, 4, 'beautiful', '2021-05-09 01:58:39', '2021-05-09 01:58:39'),
(11, 2, 22, 'dep', '2021-05-09 02:39:07', '2021-05-09 02:39:07'),
(12, 7, 5, 'dep', '2021-05-26 23:46:06', '2021-05-26 23:46:06'),
(13, 7, 10, 'đẹp', '2021-06-01 17:55:04', '2021-06-01 17:55:04'),
(14, 9, 14, 'dep', '2021-10-06 21:49:49', '2021-10-06 21:49:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn A', 'nguyena@gmail.com', '0967356298', 'Ninh Kiều , Cần Thơ', '2020-11-16 07:12:19', '2020-11-16 07:12:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'hidden', 'ID', 1, 1, 1, 1, 1, 1, '{}', 1),
(2, 1, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Password', 0, 0, 0, 1, 1, 0, '{}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, '{}', 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 0, 1, 1, 1, 1, 1, '{}', 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 0, 0, 0, 0, 0, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(56, 7, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(57, 7, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'status', 'text', 'Status', 0, 0, 0, 0, 0, 0, '{}', 3),
(59, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(60, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(61, 8, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(62, 8, 'color_id', 'text', 'Color Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(63, 8, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(64, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(65, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(66, 9, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(67, 9, 'category_id', 'text', 'Category Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(68, 9, 'name_product', 'text', 'Name Product', 0, 1, 1, 1, 1, 1, '{}', 3),
(69, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(70, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(71, 8, 'color_product_belongsto_color_relationship', 'relationship', 'colors', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Color\",\"table\":\"colors\",\"type\":\"belongsTo\",\"column\":\"color_id\",\"key\":\"id\",\"label\":\"color\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 6),
(72, 8, 'color_product_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(73, 9, 'product_belongsto_category_relationship', 'relationship', 'categories', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 6),
(74, 10, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(75, 10, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(77, 10, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 4),
(78, 10, 'describe', 'code_editor', 'Describe', 0, 1, 1, 1, 1, 1, '{}', 5),
(79, 10, 'image', 'multiple_images', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6),
(80, 10, 'status', 'text', 'Status', 0, 1, 1, 1, 1, 1, '{}', 7),
(81, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8),
(82, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9),
(83, 11, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 0),
(84, 11, 'order_id', 'text', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(85, 11, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(86, 11, 'quantity', 'text', 'Quantity', 0, 1, 1, 1, 1, 1, '{}', 4),
(87, 11, 'price', 'text', 'Price', 0, 1, 1, 1, 1, 1, '{}', 5),
(88, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(89, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(90, 12, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(91, 12, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(92, 12, 'order_date', 'text', 'Order Date', 0, 1, 1, 1, 1, 1, '{}', 3),
(93, 12, 'require_date', 'text', 'Require Date', 0, 1, 1, 1, 1, 1, '{}', 4),
(94, 12, 'total_money', 'text', 'Total Money', 0, 1, 1, 1, 1, 1, '{}', 5),
(95, 12, 'status', 'text', 'Status', 0, 0, 0, 0, 0, 0, '{}', 6),
(96, 12, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(97, 12, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(98, 13, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 0),
(99, 13, 'order_id', 'text', 'Order Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(100, 13, 'invoices_date', 'text', 'Invoices Date', 0, 1, 1, 1, 1, 1, '{}', 3),
(101, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(102, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(103, 11, 'order_detail_belongsto_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 8),
(104, 11, 'order_detail_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name_product\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 9),
(105, 10, 'detail_product_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name_product\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(106, 12, 'order_belongsto_user_relationship', 'relationship', 'users', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(107, 13, 'invoice_belongsto_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Order\",\"table\":\"orders\",\"type\":\"belongsTo\",\"column\":\"order_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 6),
(109, 14, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(110, 14, 'size', 'text', 'Size', 0, 1, 1, 1, 1, 1, '{}', 2),
(111, 14, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(112, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(114, 15, 'id', 'text', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(115, 15, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(116, 15, 'size_id', 'text', 'Size Id', 0, 1, 1, 1, 1, 1, '{}', 3),
(117, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4),
(118, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5),
(119, 15, 'size_product_belongsto_product_relationship', 'relationship', 'products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"name_product\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 6),
(120, 15, 'size_product_belongsto_size_relationship', 'relationship', 'sizes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Size\",\"table\":\"sizes\",\"type\":\"belongsTo\",\"column\":\"size_id\",\"key\":\"id\",\"label\":\"size\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":null}', 7),
(121, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 1, 1, 1, 1, 1, '{}', 6),
(122, 1, 'birthday', 'date', 'Birthday', 0, 1, 1, 1, 1, 1, '{}', 12),
(123, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 13),
(124, 1, 'address', 'text_area', 'Address', 0, 1, 1, 1, 1, 1, '{}', 14),
(125, 16, 'id', 'hidden', 'Id', 1, 1, 1, 1, 1, 1, '{}', 1),
(126, 16, 'fullname', 'text', 'Fullname', 0, 1, 1, 1, 1, 1, '{}', 2),
(127, 16, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 3),
(128, 16, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4),
(129, 16, 'address', 'text', 'Address', 0, 1, 1, 1, 1, 1, '{}', 5),
(130, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(131, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(132, 12, 'order_belongsto_customer_relationship', 'relationship', 'customers', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"customers\",\"type\":\"belongsTo\",\"column\":\"customer_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 10),
(133, 12, 'customer_id', 'text', 'Customer Id', 0, 1, 1, 1, 1, 1, '{}', 9),
(135, 16, 'customer_hasmany_order_relationship', 'relationship', 'orders', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Customer\",\"table\":\"orders\",\"type\":\"hasMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"customer_id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-10-26 06:05:46', '2020-11-09 06:08:29'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-10-26 06:05:46', '2020-10-26 06:05:46'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-10-26 06:05:46', '2020-10-26 06:05:46'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-10-26 06:05:48', '2020-12-21 07:09:38'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(7, 'colors', 'colors', 'Color', 'Colors', NULL, 'App\\Color', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-26 06:15:01', '2020-12-26 01:25:48'),
(8, 'color_products', 'color-products', 'Color Product', 'Color Products', NULL, 'App\\ColorProduct', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-26 06:16:49', '2020-10-27 22:15:32'),
(9, 'products', 'products', 'Product', 'Products', NULL, 'App\\Product', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-26 06:18:16', '2020-10-26 06:18:16'),
(10, 'detail_products', 'detail-products', 'Detail Product', 'Detail Products', NULL, 'App\\DetailProduct', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-26 06:31:20', '2020-11-09 05:26:33'),
(11, 'order_details', 'order-details', 'Order Detail', 'Order Details', NULL, 'App\\OrderDetail', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-26 06:31:38', '2020-10-26 06:31:38'),
(12, 'orders', 'orders', 'Order', 'Orders', NULL, 'App\\Order', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-26 06:31:52', '2020-12-26 01:29:37'),
(13, 'invoices', 'invoices', 'Invoice', 'Invoices', NULL, 'App\\Invoice', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-26 06:33:00', '2020-10-26 06:33:00'),
(14, 'sizes', 'sizes', 'Size', 'Sizes', NULL, 'App\\Size', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-29 04:57:16', '2020-10-29 04:57:16'),
(15, 'size_products', 'size-products', 'Size Product', 'Size Products', NULL, 'App\\SizeProduct', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-29 05:01:38', '2020-10-29 05:01:38'),
(16, 'customers', 'customers', 'Customer', 'Customers', NULL, 'App\\Customer', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-16 06:30:41', '2020-12-20 22:53:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detail_products`
--

CREATE TABLE `detail_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `describe` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `detail_products`
--

INSERT INTO `detail_products` (`id`, `product_id`, `price`, `describe`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 260000, '<p>Chiều cao: 7cm.</p>\r\n<p>Chất liệu: PU da mờ.</p>\r\n<p>Giày cao gót 7cm gắn khóa trong với vẻ ngoài mong manh của thiết kế gót nhọn mang tới sự thướt tha, gợi cảm.</p>', '[\"detail-products\\\\October2020\\\\hNT3YnVkDrQm1Xm6FaH0.jpg\",\"detail-products\\\\October2020\\\\rc48UjIy4yMQyDZQhIsZ.jpg\"]', 'Còn hàng', '2020-10-27 22:10:00', '2020-11-18 01:43:14'),
(2, 2, 250000, '<p>Chiều cao: 5cm. </p>\r\n<p>Chất liệu: PU da mờ.</p>\r\n<p>Một đôi sandal cao gót 5cm với kiểu dáng cổ điển được cách điệu bằng phần bít gót bảo vệ chân.</p>', '[\"detail-products\\\\October2020\\\\HGz0vNgJNbR9EFWrnyYT.jpg\",\"detail-products\\\\October2020\\\\jz41Sk7Wng6FOhhBttN3.jpg\",\"detail-products\\\\October2020\\\\HgbRVIsAt9Vyg5bCkhDF.jpg\"]', 'Còn hàng', '2020-10-27 22:18:00', '2020-11-18 01:44:04'),
(3, 3, 300000, '<p>Độ cao gót 10 cm</p>\r\n<p>Chất liệu: Satin</p>\r\n<p>Hoa văn, chi tiết: Đính nơ, Đính đá</p>', '[\"detail-products\\\\October2020\\\\QtV9EZPJs8VrmN8DTkc4.jpg\",\"detail-products\\\\October2020\\\\lF5MUKDXMuzHRcdmPc3D.jpg\"]', 'Còn hàng', '2020-10-27 22:20:00', '2020-11-09 05:30:37'),
(4, 4, 500000, '<p>Độ cao gót: 9 cm</p>\r\n<p>Kiểu gót: Gót nhọn</p>\r\n<p>Chất liệu: Da nhân tạo</p>\r\n<p>Hoa văn, chi tiết: Một màu</p>', '[\"detail-products\\\\October2020\\\\9H7s7pPD4a0EVWMYIqJI.jpg\",\"detail-products\\\\October2020\\\\2EzQWfghfjUSfEOs4REY.jpg\"]', 'Còn hàng', '2020-10-27 22:21:00', '2020-11-09 05:28:27'),
(5, 5, 250000, '<p>Độ cao gót: 1cm. </p>\r\n<p>Kiểu gót: Đế bệt. </p>\r\n<p>Chất liệu: Jean đan. </p>\r\n<p>Hoa văn, chi tiết: Phối màu, quai đan.</p>', '[\"detail-products\\\\October2020\\\\Mxj3OP5RFA95OvXwkdCc.jpg\",\"detail-products\\\\October2020\\\\OJFjyDkVP6pRleBEf6Wk.jpg\"]', 'Còn hàng', '2020-10-27 22:22:00', '2020-11-18 01:50:39'),
(6, 6, 150000, '<p>Kiểu gót: Đế bệt. </p>\r\n<p>Chất liệu: Da nhân tạo. </p>\r\n<p>Hoa văn, chi tiết: Một màu.</p>', '[\"detail-products\\\\October2020\\\\ASZS8Zz08ynZqjZ4uq4E.jpg\",\"detail-products\\\\October2020\\\\fcEgN4wQWUXIvK7MSE0B.jpg\",\"detail-products\\\\October2020\\\\FkzPJypR73iF8y3kwNGY.jpg\"]', 'Còn hàng', '2020-10-27 22:25:00', '2020-11-18 01:53:32'),
(7, 7, 250000, '<p>Kiểu gót: Đế bệt. </p>\r\n<p>Độ cao gót: 1 cm.</p> \r\n<p>Chất liệu: Vải cói. </p>\r\n<p>Hoa văn, chi tiết: Một màu, thêu họa tiết nhiệt đới.</p>', '[\"detail-products\\\\October2020\\\\8NtUhC0dAown8mcHeerG.jpg\"]', 'Còn hàng', '2020-10-27 22:27:00', '2020-11-18 01:57:05'),
(8, 8, 400000, '<p>Kiểu gót: Đế xuồng.</p>\r\n<p>Độ cao gót: 10 cm.</p>\r\n<p>Chất liệu: Microfiber. </p>\r\n<p>Hoa văn, chi tiết: Thêu họa tiết nhiệt đới, quai đan nơ.</p>', '[\"detail-products\\\\October2020\\\\9FRPGTZkGiDZc59xD3HZ.jpg\"]', 'Còn hàng', '2020-10-27 22:28:00', '2020-11-18 01:57:49'),
(9, 9, 350000, '<p>Kiểu dáng: xỏ ngón. </p>\r\n<p>Chiều cao: 7cm. </p>\r\n<p>Chất liệu: PU da mờ.</p>', '[\"detail-products\\\\October2020\\\\H8ghwLlR9eZjT0FqMtrO.jpg\",\"detail-products\\\\October2020\\\\yHoQce3SVuSHAfYqSPNh.jpg\",\"detail-products\\\\October2020\\\\ZbdBmHtcV0Zx6ZjL6t1V.jpg\"]', 'Còn hàng', '2020-10-27 22:29:00', '2020-11-18 01:58:20'),
(10, 10, 300000, '<p>Kiểu dáng: quay ngang. </p>\r\n<p>Chiều cao: 5cm. </p>\r\n<p>Chất liệu: PU da mờ.</p>', '[\"detail-products\\\\October2020\\\\ucz2UOssti9BNfKmbeT4.jpg\",\"detail-products\\\\October2020\\\\DMBlAv6xhARHvjI182JL.jpg\"]', 'Còn hàng', '2020-10-27 22:34:00', '2020-11-18 01:58:50'),
(11, 11, 350000, '<p>Kiểu dáng: bít mũi. </p>\r\n<p>Chiều cao: 6cm. </p>\r\n<p>Chất liệu: PU da mờ.</p>', '[\"detail-products\\\\October2020\\\\6rTD8l6nsZOxNaUTDiVZ.jpg\",\"detail-products\\\\October2020\\\\HBQaZeMbSOT8ZYhuAY7M.jpg\",\"detail-products\\\\October2020\\\\rADzurPUozXfgyRt9t9P.jpg\"]', 'Còn hàng', '2020-10-27 22:37:00', '2020-11-18 01:59:26'),
(12, 12, 700000, 'Kiểu dáng: Cupole với đệm Nike Air', '[\"detail-products\\\\October2020\\\\mVictC5OnKTPvjSdtJnG.jpg\",\"detail-products\\\\October2020\\\\abkgLP5eGXeCG9f1bRSG.jpg\"]', 'Còn hàng', '2020-10-29 04:13:48', '2020-10-29 04:13:48'),
(13, 13, 550000, '<p>Nike Air Max 97 giữ cho một biểu tượng sneaker luôn mạnh mẽ.</p>\r\n<p>Đường gợn nước, đường ống phản chiếu và đệm Max Air dài đầy đủ.</p>', '[\"detail-products\\\\October2020\\\\zSc7rXhtm6nVbWRa95uI.jpg\",\"detail-products\\\\October2020\\\\KoFlXA4f5cY9xsY8UOM0.jpg\",\"detail-products\\\\October2020\\\\HWOz17C1J7C9UJB6yCMK.jpg\"]', 'Còn hàng', '2020-10-29 04:14:00', '2020-11-18 02:00:50'),
(14, 14, 650000, '<p>Ưu điểm vượt trội của Giày Nike M2K Tekno Chất liệu cao cấp rất mềm mại và êm ái. </p>\r\n<p>Phần đế làm bằng cao su tổng hợp với phần rãnh chống trơn trượt, đảm bảo sự an toàn cho người mang.</p>', '[\"detail-products\\\\October2020\\\\LcS06ep1D45iLLTkeJPr.jpg\",\"detail-products\\\\October2020\\\\6W1KQhUkpsCCkD8pTtml.jpg\",\"detail-products\\\\October2020\\\\hQo8eufua3aCWPCayBBC.jpg\"]', 'Còn hàng', '2020-10-29 04:28:00', '2020-11-18 02:06:52'),
(15, 15, 650000, '<p>Giày MLB Big Ball Chunky Screen New York Yankees chính hãng Hàn Quốc</p>\r\n<p>được làm bởi chất liệu da cao cấp mang lại giác thoải mái, êm chân khi đi.</p>\r\n<p>Đôi MLB Big Ball Chunky sở hữu thiết kế độc đáo, phá cách,</p>\r\n<p>tạo nên sự trẻ trung, năng động cho người dùng</p>', '[\"detail-products\\\\December2020\\\\mKVxzYWM5C3INh6KNPxd.jpg\",\"detail-products\\\\December2020\\\\zZix9DhnB6ESsJeEHZgL.jpg\",\"detail-products\\\\December2020\\\\TLyAIeeID9QGw22q3JgY.jpg\"]', 'Còn hàng', '2020-12-19 07:33:34', '2020-12-19 07:33:34'),
(16, 16, 400000, 'Gót chân khối 4,5cm', '[\"detail-products\\\\October2020\\\\nYpXNeSydt7cWIFxkbT3.jpg\",\"detail-products\\\\October2020\\\\xOFHiLhmb5EZYa1VOKER.jpg\"]', 'Còn hàng', '2020-10-29 04:20:21', '2020-10-29 04:20:21'),
(17, 17, 350000, '<p>Họa tiết stud nhỏ màu bạc xung quanh đế ngoài.</p>\r\n<p>Zip buộc ở phía bên trong.</p>\r\n<p>Giày cao gót bọc da 8cm.</p>', '[\"detail-products\\\\October2020\\\\WVtt1E4NevE2vwyIJbfT.jpg\",\"detail-products\\\\October2020\\\\yDRqGd4eHcbR0kleuNdE.jpg\"]', 'Còn hàng', '2020-10-29 04:22:00', '2020-11-18 02:05:01'),
(18, 18, 400000, '<p>Thiết Kế Đẹp, sang trọng, quý phái.</p>\r\n<p>Chất Liệu Tốt, mềm mại, đi không đau chân.</p>\r\n<p>Bạn có thể mang đi dạo phố, picnic cùng bạn bè, đi chơi xa hoặc mang đến công sở.</p>', '[\"detail-products\\\\October2020\\\\pqn3uqzJLdjdzehMEbMN.jpg\",\"detail-products\\\\October2020\\\\EErl5wp2kvxYidinaWJV.jpg\"]', 'Còn hàng', '2020-10-29 04:24:00', '2020-11-18 02:05:46'),
(19, 19, 350000, 'Giày được thiết kế đế cao rất tiện dụng cho các bạn gái mang đến văn phòng hay đi chơi.', '[\"detail-products\\\\October2020\\\\WpNiDgozrj8udyaKMm42.jpg\"]', 'Còn hàng', '2020-10-29 04:29:00', '2020-11-18 02:12:20'),
(20, 20, 500000, 'Chất liệu bề mặt vải dệt nhẹ nhàng, mềm mại và thoáng khí. Mũi giày đầy đặn, form dáng chuẩn giúp bảo vệ đầu ngón chân khi hoạt động.', '[\"detail-products\\\\October2020\\\\xRtk4RVPMsyPhzxtS2wM.jpg\",\"detail-products\\\\October2020\\\\ZGQITfAj0sCdsq3YiGnG.jpg\",\"detail-products\\\\October2020\\\\ZzQooCqtltdSXIJjkAG6.jpg\"]', 'Còn hàng', '2020-10-29 04:31:00', '2020-10-29 04:32:13'),
(21, 21, 500000, '<p>Ưu điểm vượt trội của Giày Nike M2K Tekno Chất liệu cao cấp rất mềm mại và êm ái, tạo cảm giác thoải mái cho từng bước đi. </p>\r\n<p>Phần đế làm bằng cao su tổng hợp với phần rãnh chống trơn trượt, đảm bảo sự an toàn cho người mang.</p>', '[\"detail-products\\\\October2020\\\\tx5XcluMPDKmBskUZVdR.jpg\",\"detail-products\\\\October2020\\\\V2pS8OmXjxqoTeHABkT9.jpg\",\"detail-products\\\\October2020\\\\Oy2Nubmj8eBWeKtmBJWa.jpg\",\"detail-products\\\\October2020\\\\vodS062gNpkwOpgW3jmA.jpg\"]', 'Còn hàng', '2020-10-29 04:33:00', '2020-11-18 02:13:10'),
(22, 22, 550000, '<p>Không thể nào phủ nhận được những thành công đạt được gần đây của Nike với công nghệ bộ đệm React mới.</p> \r\n<p>Đây là thiết kế đầy ấn tượng và công đồng sneakerhead trên khắp thế giới đang rất hào hứng về nó.</p>', '[\"detail-products\\\\October2020\\\\IKevmmDIOfVM6emIDDQD.jpg\",\"detail-products\\\\October2020\\\\2LUNDA4Eq2OrcYq1xkSF.jpg\",\"detail-products\\\\October2020\\\\7OV4iOEIcZSo2HrvY8od.jpg\"]', 'Còn hàng', '2020-10-29 04:35:00', '2020-11-18 02:13:35'),
(23, 23, 650000, '<p>Khó có thể nói Giày_nike_uptempo đã tung ra rất nhiều màu sắc với phối màu đẹp lạ.</p>\r\n<p>Mang đến cho khách hàng những phong cách vô cùng độc lạ.</p>', '[\"detail-products\\\\October2020\\\\T4IsO4jXw91AYvfET5Io.jpg\",\"detail-products\\\\October2020\\\\1TDoYQQzOUzQs6c0BakG.jpg\",\"detail-products\\\\October2020\\\\I0HZQdpsu2kgxPq7Wdvk.jpg\",\"detail-products\\\\October2020\\\\dQ1ZwlhjbTtC4SMc08P8.jpg\"]', 'Còn hàng', '2020-10-29 04:38:00', '2020-11-18 02:15:25'),
(24, 24, 400000, '<p>Bảo hành: Keo vĩnh viễn.</p>\r\n<p>Chất liệu: da tổng hợp.</p>', '[\"detail-products\\\\October2020\\\\D3jeMHYmLpPvUPsrSLLL.jpg\",\"detail-products\\\\October2020\\\\bEqWbWyamIByJzjzGbuB.jpg\"]', 'Còn hàng', '2020-10-29 04:49:00', '2020-11-18 02:14:18'),
(25, 25, 350000, '<p>Bảo hành: Keo Vĩnh Viễn. </p>\r\n<p>Chất liệu: da tổng hợp.</p>', '[\"detail-products\\\\October2020\\\\RnWSLmCsR0rAp1L82z91.jpg\"]', 'Còn hàng', '2020-10-29 04:51:00', '2020-11-18 02:06:21'),
(26, 26, 260000, '<p><p>Bảo hành: Keo Vĩnh Viễn.</p>\r\n<p><p>Chất liệu: da lộn.</p>', '[\"detail-products\\\\October2020\\\\un6qB6PLcvgUKdm81CuM.jpg\",\"detail-products\\\\October2020\\\\sNVWKD5mlIgtu4HHVols.jpg\"]', 'Còn hàng', '2020-10-29 05:46:00', '2020-11-18 01:56:12'),
(27, 27, 400000, '<p>Bảo hành: Keo Vĩnh Viễn.</p>\r\n<p>Chất liệu: da tổng hợp.</p>', '[\"detail-products\\\\October2020\\\\TOG1xl6pR1UAARBTSjTE.jpg\",\"detail-products\\\\October2020\\\\ItmAg2g7VXlyecciLgu5.jpg\"]', 'Còn hàng', '2020-10-29 05:47:00', '2020-11-18 01:55:47'),
(28, 28, 350000, 'Chất Liệu Cao su', '[\"detail-products\\\\October2020\\\\4e0WSn53j33AhPwvCu09.jpg\"]', 'Còn hàng', '2020-10-29 05:48:38', '2020-10-29 05:48:38'),
(29, 29, 250000, 'Chất Liệu Cao su', '[\"detail-products\\\\October2020\\\\fN9yjjAOg9yEvGGYOWUN.jpg\",\"detail-products\\\\October2020\\\\hU4Q8PMk6jrtJSFBGYKC.jpg\"]', 'Còn hàng', '2020-10-29 05:49:16', '2020-10-29 05:49:16'),
(30, 30, 260000, 'Chất Liệu Cao su', '[\"detail-products\\\\October2020\\\\fVnPwqu7pD0ShaBtU03W.jpg\",\"detail-products\\\\October2020\\\\t5aNqw8Vh9E1YU2LIIh4.jpg\"]', 'Còn hàng', '2020-10-29 05:50:05', '2020-10-29 05:50:05'),
(31, 31, 250000, 'Chất Liệu Cao su', '[\"detail-products\\\\October2020\\\\DKtFZ8V4wbkeX4DCODxM.jpg\",\"detail-products\\\\October2020\\\\I8kMo7Z41Vy2lA7RJXty.jpg\"]', 'Còn hàng', '2020-10-29 05:54:00', '2020-10-29 05:54:48'),
(32, 32, 400000, 'Chất Liệu Vải canvas', '[\"detail-products\\\\October2020\\\\pjXzteafNWplS8hjt4I1.jpg\",\"detail-products\\\\October2020\\\\82XnHWXPQnYxPTyz652U.jpg\"]', 'Còn hàng', '2020-10-29 05:55:59', '2020-10-29 05:55:59'),
(33, 34, 350000, 'Chất liệu: Vải lưới', '[\"detail-products\\\\October2020\\\\q4ZNlGI0FLt9kX7vg6QH.jpg\",\"detail-products\\\\October2020\\\\jofFwHCsXJoftgvadchx.jpg\",\"detail-products\\\\October2020\\\\uFR0F2QcZj2NXp8jOZOt.jpg\"]', 'Còn hàng', '2020-10-29 05:56:00', '2020-10-29 05:58:53'),
(34, 33, 400000, '<p>Giày lười nam Aokang màu xanh đen với chất liệu cao cấp\r\nđược thiết kế chuyên biệt cho các hoạt động thể thao, dã ngoại, đi chơi. </p>\r\n<p>Chất liệu cao cấp mang lại cảm giác thoải mái cho bạn trong suốt quá trình.</p>', '[\"detail-products\\\\October2020\\\\Ourgn0zpQ6hYh4NrlFRJ.jpg\",\"detail-products\\\\October2020\\\\12J0JDZCPNxcXDDhaknb.jpg\"]', 'Còn hàng', '2020-10-29 05:58:00', '2020-11-18 01:55:11'),
(35, 35, 400000, '<p>Mặt lót in tên thương hiệu.</p>\r\n<p>Form giày may đúng tiêu chuẩn, đem lại sự thoải mái khi mang.</p>\r\n<p>Đường may tỉ mỉ và tinh xảo giúp sản phẩm luôn bền đẹp theo thời gian.</p>\r\n<p>Màu sắc trang nhã, dễ phối cùng nhiều kiểu trang phục khác nhau.</p>\r\n<p>Là thương hiệu uy tín trên thị trường về chất lượng.</p>', '[\"detail-products\\\\October2020\\\\T4w9YRUFd9meMgnk6CUS.jpg\",\"detail-products\\\\October2020\\\\h2xFkC7QQb3Kq5RQqEel.jpg\"]', 'Còn hàng', '2020-10-29 05:59:00', '2020-11-18 01:54:25'),
(36, 36, 170000, '<p>Dép Quai NgangThời Trang JOTI Nicola Flat 3240VN0 Kem Hồng, được thiết kế kiểu dáng thời trang công sở thanh lịch, trẻ trung và duyên dáng</p>\r\n<p>Kiểu dáng đơn giản, hợp thời trang</p>\r\n<p>Chất liệu da tổng hợp, êm chân</p>\r\n<p>Đường may chắc chắn, tỉ mỉ</p>\r\n<p>Màu sắc tươi trẻ thích hợp cho các bạn trẻ</p>\r\n<p>Dễ dàng đi cùng nhiều phong cách khác nhau</p>', '[\"detail-products\\\\December2020\\\\lt6o5HgPFXdV8Y8xx5Y8.jpg\",\"detail-products\\\\December2020\\\\7o4Jnhtv37k5S1sH9Bp9.jpg\"]', 'Còn hàng', '2020-12-19 07:45:00', '2021-05-27 00:13:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `invoices_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-10-26 06:05:46', '2020-10-26 06:05:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Trang chủ', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2020-10-26 06:05:46', '2021-03-21 07:04:19', 'voyager.dashboard', 'null'),
(3, 1, 'Thành viên', '', '_self', 'voyager-person', '#000000', 25, 2, '2020-10-26 06:05:46', '2021-03-21 07:34:07', 'voyager.users.index', 'null'),
(4, 1, 'Quyền', '', '_self', 'voyager-lock', '#000000', 25, 1, '2020-10-26 06:05:46', '2021-03-21 07:34:04', 'voyager.roles.index', 'null'),
(5, 1, 'Công cụ', '', '_self', 'voyager-tools', '#000000', NULL, 6, '2020-10-26 06:05:46', '2021-04-26 08:16:42', NULL, ''),
(6, 1, 'Thanh chức năng', '', '_self', 'voyager-list', '#000000', 5, 1, '2020-10-26 06:05:46', '2021-03-21 07:33:54', 'voyager.menus.index', 'null'),
(7, 1, 'Dữ liệu', '', '_self', 'voyager-data', '#000000', 5, 2, '2020-10-26 06:05:46', '2021-03-21 07:33:54', 'voyager.database.index', 'null'),
(8, 1, 'Icon', '', '_self', 'voyager-compass', '#000000', 5, 3, '2020-10-26 06:05:46', '2021-03-21 07:34:17', 'voyager.compass.index', 'null'),
(11, 1, 'Loại sản phẩm', '', '_self', 'voyager-categories', '#000000', 26, 1, '2020-10-26 06:05:48', '2021-03-21 07:34:47', 'voyager.categories.index', 'null'),
(15, 1, 'Màu sắc', '', '_self', 'voyager-paw', '#000000', 26, 2, '2020-10-26 06:15:01', '2021-03-21 07:34:50', 'voyager.colors.index', 'null'),
(17, 1, 'Sản phẩm', '', '_self', 'voyager-bag', '#000000', 26, 3, '2020-10-26 06:18:17', '2021-03-21 07:34:54', 'voyager.products.index', 'null'),
(18, 1, 'Chi tiết sản phẩm', '', '_self', 'voyager-window-list', '#000000', 26, 4, '2020-10-26 06:31:20', '2021-03-21 07:35:00', 'voyager.detail-products.index', 'null'),
(20, 1, 'Đơn hàng', '', '_self', 'voyager-file-text', '#000000', NULL, 3, '2020-10-26 06:31:52', '2021-03-21 07:35:14', 'voyager.orders.index', 'null'),
(22, 1, 'Kích thước', '', '_self', 'voyager-resize-full', '#000000', 26, 5, '2020-10-29 04:57:17', '2021-03-21 07:35:07', 'voyager.sizes.index', 'null'),
(24, 1, 'Khách tự do', '', '_self', 'voyager-person', '#000000', 25, 3, '2020-11-16 06:30:41', '2021-03-21 07:34:18', 'voyager.customers.index', 'null'),
(25, 1, 'Quản Lý Tài Khoản', '', '_self', 'voyager-people', '#000000', NULL, 2, '2021-03-21 07:33:43', '2021-03-21 07:35:47', NULL, ''),
(26, 1, 'Quản lý sản phẩm', '', '_self', 'voyager-archive', '#000000', NULL, 5, '2021-03-21 07:34:33', '2021-04-26 08:16:42', NULL, ''),
(27, 1, 'Doanh thu', '/admin/revenue', '_self', 'voyager-dollar', '#000000', NULL, 4, '2021-04-26 08:16:33', '2021-04-26 08:18:06', NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `require_date` date DEFAULT NULL,
  `total_money` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_date`, `require_date`, `total_money`, `status`, `created_at`, `updated_at`, `customer_id`) VALUES
(1, NULL, '2020-11-22', '2020-11-22', 1110000, 1, '2020-11-16 07:10:39', '2020-11-16 07:10:39', 1),
(3, 2, '2020-12-27', '2020-12-27', 260000, 1, '2020-12-20 21:13:09', '2020-12-20 21:13:09', NULL),
(7, 2, '2021-01-12', '2021-01-12', 300000, 1, '2021-01-05 18:10:36', '2021-01-05 18:10:36', NULL),
(8, 2, '2021-01-12', '2021-01-12', 300000, 1, '2021-01-05 18:23:34', '2021-01-05 18:23:34', NULL),
(9, 2, '2021-01-12', '2021-01-12', 260000, 1, '2021-01-05 18:24:40', '2021-01-05 18:24:40', NULL),
(10, 7, '2021-05-14', '2021-05-14', 500000, NULL, '2021-05-08 04:02:28', '2021-05-08 04:02:28', NULL),
(11, 7, '2021-05-14', '2021-05-14', 250000, NULL, '2021-05-08 04:32:36', '2021-05-08 04:32:36', NULL),
(12, 8, '2021-06-02', '2021-06-02', 1800000, NULL, '2021-05-27 00:24:50', '2021-05-27 00:24:50', NULL),
(13, 7, '2021-06-08', '2021-06-08', 600000, 0, '2021-06-01 17:56:18', '2021-06-01 17:56:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 1, 300000, '2020-11-16 07:10:39', '2020-11-16 07:10:39'),
(2, 1, 22, 1, 550000, '2020-11-16 07:10:39', '2020-11-16 07:10:39'),
(3, 1, 1, 1, 260000, '2020-11-16 07:10:39', '2020-11-16 07:10:39'),
(4, 2, 20, 1, 500000, '2020-11-16 07:12:19', '2020-11-16 07:12:19'),
(5, 3, 1, 1, 260000, '2020-12-20 21:13:09', '2020-12-20 21:13:09'),
(6, 4, 3, 1, 300000, '2020-12-26 01:17:20', '2020-12-26 01:17:20'),
(7, 4, 2, 1, 250000, '2020-12-26 01:17:20', '2020-12-26 01:17:20'),
(8, 4, 1, 1, 260000, '2020-12-26 01:17:20', '2020-12-26 01:17:20'),
(9, 5, 2, 1, 250000, '2020-12-26 01:17:40', '2020-12-26 01:17:40'),
(10, 6, 22, 1, 550000, '2020-12-26 01:18:03', '2020-12-26 01:18:03'),
(11, 7, 3, 1, 300000, '2021-01-05 18:10:37', '2021-01-05 18:10:37'),
(12, 8, 3, 1, 300000, '2021-01-05 18:23:34', '2021-01-05 18:23:34'),
(13, 9, 1, 1, 260000, '2021-01-05 18:24:40', '2021-01-05 18:24:40'),
(14, 10, 4, 1, 500000, '2021-05-08 04:02:28', '2021-05-08 04:02:28'),
(15, 11, 7, 1, 250000, '2021-05-08 04:32:36', '2021-05-08 04:32:36'),
(16, 12, 2, 3, 250000, '2021-05-27 00:24:50', '2021-05-27 00:24:50'),
(17, 12, 7, 1, 250000, '2021-05-27 00:24:50', '2021-05-27 00:24:50'),
(18, 12, 10, 1, 300000, '2021-05-27 00:24:50', '2021-05-27 00:24:50'),
(19, 12, 4, 1, 500000, '2021-05-27 00:24:50', '2021-05-27 00:24:50'),
(20, 13, 10, 2, 300000, '2021-06-01 17:56:18', '2021-06-01 17:56:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-10-26 06:05:48', '2020-10-26 06:05:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(2, 'browse_bread', NULL, '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(3, 'browse_database', NULL, '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(4, 'browse_media', NULL, '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(5, 'browse_compass', NULL, '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(6, 'browse_menus', 'menus', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(7, 'read_menus', 'menus', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(8, 'edit_menus', 'menus', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(9, 'add_menus', 'menus', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(10, 'delete_menus', 'menus', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(11, 'browse_roles', 'roles', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(12, 'read_roles', 'roles', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(13, 'edit_roles', 'roles', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(14, 'add_roles', 'roles', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(15, 'delete_roles', 'roles', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(16, 'browse_users', 'users', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(17, 'read_users', 'users', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(18, 'edit_users', 'users', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(19, 'add_users', 'users', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(20, 'delete_users', 'users', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(21, 'browse_settings', 'settings', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(22, 'read_settings', 'settings', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(23, 'edit_settings', 'settings', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(24, 'add_settings', 'settings', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(25, 'delete_settings', 'settings', '2020-10-26 06:05:47', '2020-10-26 06:05:47'),
(26, 'browse_categories', 'categories', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(27, 'read_categories', 'categories', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(28, 'edit_categories', 'categories', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(29, 'add_categories', 'categories', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(30, 'delete_categories', 'categories', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(31, 'browse_posts', 'posts', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(32, 'read_posts', 'posts', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(33, 'edit_posts', 'posts', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(34, 'add_posts', 'posts', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(35, 'delete_posts', 'posts', '2020-10-26 06:05:48', '2020-10-26 06:05:48'),
(41, 'browse_hooks', NULL, '2020-10-26 06:05:49', '2020-10-26 06:05:49'),
(42, 'browse_colors', 'colors', '2020-10-26 06:15:01', '2020-10-26 06:15:01'),
(43, 'read_colors', 'colors', '2020-10-26 06:15:01', '2020-10-26 06:15:01'),
(44, 'edit_colors', 'colors', '2020-10-26 06:15:01', '2020-10-26 06:15:01'),
(45, 'add_colors', 'colors', '2020-10-26 06:15:01', '2020-10-26 06:15:01'),
(46, 'delete_colors', 'colors', '2020-10-26 06:15:01', '2020-10-26 06:15:01'),
(47, 'browse_color_products', 'color_products', '2020-10-26 06:16:49', '2020-10-26 06:16:49'),
(48, 'read_color_products', 'color_products', '2020-10-26 06:16:49', '2020-10-26 06:16:49'),
(49, 'edit_color_products', 'color_products', '2020-10-26 06:16:49', '2020-10-26 06:16:49'),
(50, 'add_color_products', 'color_products', '2020-10-26 06:16:49', '2020-10-26 06:16:49'),
(51, 'delete_color_products', 'color_products', '2020-10-26 06:16:49', '2020-10-26 06:16:49'),
(52, 'browse_products', 'products', '2020-10-26 06:18:17', '2020-10-26 06:18:17'),
(53, 'read_products', 'products', '2020-10-26 06:18:17', '2020-10-26 06:18:17'),
(54, 'edit_products', 'products', '2020-10-26 06:18:17', '2020-10-26 06:18:17'),
(55, 'add_products', 'products', '2020-10-26 06:18:17', '2020-10-26 06:18:17'),
(56, 'delete_products', 'products', '2020-10-26 06:18:17', '2020-10-26 06:18:17'),
(57, 'browse_detail_products', 'detail_products', '2020-10-26 06:31:20', '2020-10-26 06:31:20'),
(58, 'read_detail_products', 'detail_products', '2020-10-26 06:31:20', '2020-10-26 06:31:20'),
(59, 'edit_detail_products', 'detail_products', '2020-10-26 06:31:20', '2020-10-26 06:31:20'),
(60, 'add_detail_products', 'detail_products', '2020-10-26 06:31:20', '2020-10-26 06:31:20'),
(61, 'delete_detail_products', 'detail_products', '2020-10-26 06:31:20', '2020-10-26 06:31:20'),
(62, 'browse_order_details', 'order_details', '2020-10-26 06:31:38', '2020-10-26 06:31:38'),
(63, 'read_order_details', 'order_details', '2020-10-26 06:31:38', '2020-10-26 06:31:38'),
(64, 'edit_order_details', 'order_details', '2020-10-26 06:31:38', '2020-10-26 06:31:38'),
(65, 'add_order_details', 'order_details', '2020-10-26 06:31:38', '2020-10-26 06:31:38'),
(66, 'delete_order_details', 'order_details', '2020-10-26 06:31:38', '2020-10-26 06:31:38'),
(67, 'browse_orders', 'orders', '2020-10-26 06:31:52', '2020-10-26 06:31:52'),
(68, 'read_orders', 'orders', '2020-10-26 06:31:52', '2020-10-26 06:31:52'),
(69, 'edit_orders', 'orders', '2020-10-26 06:31:52', '2020-10-26 06:31:52'),
(70, 'add_orders', 'orders', '2020-10-26 06:31:52', '2020-10-26 06:31:52'),
(71, 'delete_orders', 'orders', '2020-10-26 06:31:52', '2020-10-26 06:31:52'),
(72, 'browse_invoices', 'invoices', '2020-10-26 06:33:00', '2020-10-26 06:33:00'),
(73, 'read_invoices', 'invoices', '2020-10-26 06:33:00', '2020-10-26 06:33:00'),
(74, 'edit_invoices', 'invoices', '2020-10-26 06:33:00', '2020-10-26 06:33:00'),
(75, 'add_invoices', 'invoices', '2020-10-26 06:33:00', '2020-10-26 06:33:00'),
(76, 'delete_invoices', 'invoices', '2020-10-26 06:33:00', '2020-10-26 06:33:00'),
(77, 'browse_sizes', 'sizes', '2020-10-29 04:57:17', '2020-10-29 04:57:17'),
(78, 'read_sizes', 'sizes', '2020-10-29 04:57:17', '2020-10-29 04:57:17'),
(79, 'edit_sizes', 'sizes', '2020-10-29 04:57:17', '2020-10-29 04:57:17'),
(80, 'add_sizes', 'sizes', '2020-10-29 04:57:17', '2020-10-29 04:57:17'),
(81, 'delete_sizes', 'sizes', '2020-10-29 04:57:17', '2020-10-29 04:57:17'),
(82, 'browse_size_products', 'size_products', '2020-10-29 05:01:39', '2020-10-29 05:01:39'),
(83, 'read_size_products', 'size_products', '2020-10-29 05:01:39', '2020-10-29 05:01:39'),
(84, 'edit_size_products', 'size_products', '2020-10-29 05:01:39', '2020-10-29 05:01:39'),
(85, 'add_size_products', 'size_products', '2020-10-29 05:01:39', '2020-10-29 05:01:39'),
(86, 'delete_size_products', 'size_products', '2020-10-29 05:01:39', '2020-10-29 05:01:39'),
(87, 'browse_customers', 'customers', '2020-11-16 06:30:41', '2020-11-16 06:30:41'),
(88, 'read_customers', 'customers', '2020-11-16 06:30:41', '2020-11-16 06:30:41'),
(89, 'edit_customers', 'customers', '2020-11-16 06:30:41', '2020-11-16 06:30:41'),
(90, 'add_customers', 'customers', '2020-11-16 06:30:41', '2020-11-16 06:30:41'),
(91, 'delete_customers', 'customers', '2020-11-16 06:30:41', '2020-11-16 06:30:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts\\November2020\\zlOqZWygxiCTaDDdtahU.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-26 06:05:48', '2020-11-25 02:56:46'),
(2, 2, 1, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n<h2>We can use all kinds of format!</h2>\r\n<p>And include a bunch of other stuff.</p>', 'posts\\November2020\\H7PAdI1YU5bXfBo9WU1n.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-26 06:05:48', '2020-11-25 05:30:33'),
(3, 2, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts\\November2020\\G30F3kmO8YMnyxnJyRZs.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-26 06:05:48', '2020-11-25 05:30:48'),
(4, 2, 1, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts\\November2020\\L3tvrL2o1p8Yzo3WInGt.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-26 06:05:48', '2020-11-25 05:31:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name_product` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `name_product`, `created_at`, `updated_at`) VALUES
(1, 3, 'Giày Cao Gót 7cm Khóa Tròn', '2020-10-27 05:22:00', '2020-10-27 05:27:44'),
(2, 3, 'Giày Cao Gót Đế Vuông Bít Mũi', '2020-10-27 05:23:00', '2020-10-27 05:27:55'),
(3, 3, 'Giày Cao Gót Đính Nơ', '2020-10-27 05:23:00', '2020-10-27 05:28:07'),
(4, 3, 'Giày Slingback Mũi Nhọn', '2020-10-27 05:23:00', '2020-10-27 05:28:16'),
(5, 1, 'Dép Quai Denim Đan Hình Lục Giác ', '2020-10-27 05:24:00', '2020-10-27 05:28:28'),
(6, 1, 'Dép Quai Kẹp', '2020-10-27 05:24:00', '2020-10-27 05:28:39'),
(7, 1, 'Dép Thêu Họa Tiết Nhiệt Đới', '2020-10-27 05:25:00', '2020-10-27 05:28:53'),
(8, 2, 'Giày Đế Xuồng Satin Thêu Họa Tiết Nhiệt Đới', '2020-10-27 05:25:00', '2020-10-27 05:29:08'),
(9, 2, 'Giày Sandal Cao Gót 7cm Xỏ Ngón', '2020-10-27 05:25:00', '2020-10-27 05:29:17'),
(10, 2, 'Giày Sandal Cao Gót 5cm Hoa Cúc', '2020-10-27 05:25:00', '2021-01-04 22:51:45'),
(11, 2, 'Giày Sandal gót 6cm Mix Nhiều Màu', '2020-10-27 05:26:00', '2020-10-27 22:38:17'),
(12, 4, 'Nike Air Force 1 Shadow SE', '2020-10-27 05:27:00', '2020-10-27 05:29:43'),
(13, 4, 'Nike Air Max 97', '2020-10-27 05:27:00', '2020-10-27 05:29:52'),
(14, 4, 'Nike M2K Teckno', '2020-10-27 05:30:19', '2020-10-27 05:30:19'),
(15, 4, 'Giày MLB', '2020-10-27 05:30:38', '2020-10-27 05:30:38'),
(16, 5, 'Giày Boot Nữ Cổ Cao', '2020-10-27 05:31:00', '2020-10-27 05:45:08'),
(17, 5, 'GIày Boot Nữ Cổ Cao', '2020-10-27 05:31:00', '2020-10-29 04:22:29'),
(18, 5, 'Giày Oxford Nữ ', '2020-10-27 05:32:12', '2020-10-27 05:32:12'),
(19, 5, 'Giày Oxford Nữ ', '2020-10-27 05:32:39', '2020-10-27 05:32:39'),
(20, 6, 'Giày Nike Air Max 270', '2020-10-27 05:33:00', '2020-10-29 04:36:20'),
(21, 6, 'Nike M2K Teckno', '2020-10-27 05:33:39', '2020-10-27 05:33:39'),
(22, 6, 'Nike Joyride Run Flyknit', '2020-10-27 05:33:00', '2020-10-29 04:36:33'),
(23, 6, 'Nike Air Uptempo', '2020-10-27 05:34:16', '2020-10-27 05:34:16'),
(24, 7, 'Boot Nam Cổ Cao', '2020-10-27 05:34:00', '2020-10-27 05:44:42'),
(25, 7, 'Boot Nam Dây Kéo', '2020-10-27 05:35:00', '2020-10-27 05:44:17'),
(26, 7, 'Boot Nam Cổ Thấp', '2020-10-27 05:35:00', '2020-10-27 05:43:55'),
(27, 7, 'Boot Nam Cổ Thun', '2020-10-27 05:36:19', '2020-10-27 05:36:19'),
(28, 8, 'Giày Sandal Nam 2 Quai Ngang Rova ', '2020-10-27 05:36:00', '2020-10-27 05:43:36'),
(29, 8, 'Giày Sandal Nam Quai Chéo Vento', '2020-10-27 05:37:00', '2020-10-27 05:43:16'),
(30, 8, 'Dép Kẹp Nam Hiệu Vento', '2020-10-27 05:37:00', '2020-10-27 05:42:40'),
(31, 8, 'Dép Quai Ngang Nam Đúc Nguyên Khối Duwa', '2020-10-27 05:38:00', '2020-10-27 05:42:00'),
(32, 9, 'Giày Slipon Nam Urban', '2020-10-27 05:38:00', '2020-10-27 05:41:28'),
(33, 9, 'Giày lười Nam Aokang', '2020-10-27 05:38:00', '2020-10-29 04:35:54'),
(34, 9, 'Giày Lười Nam Vải Lưới Aokang', '2020-10-27 05:39:00', '2020-10-27 05:40:02'),
(35, 9, 'Giày Mọi Nam Aokang', '2020-10-27 05:39:41', '2020-10-27 05:39:41'),
(36, 1, 'Dép Quai Ngang JOTI Nicola Flat', '2020-12-19 07:41:00', '2020-12-19 07:45:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating_stars`
--

CREATE TABLE `rating_stars` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `rating_star` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `rating_stars`
--

INSERT INTO `rating_stars` (`id`, `user_id`, `product_id`, `rating_star`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 5, '2021-04-06 09:05:04', '2021-04-06 09:05:04'),
(2, 2, 20, 3, '2021-04-10 23:20:15', '2021-04-10 23:20:15'),
(3, 6, 3, 3, '2021-05-07 09:12:01', '2021-05-07 09:12:01'),
(4, 7, 2, 1, '2021-05-08 04:08:46', '2021-05-08 04:08:46'),
(5, 7, 3, 1, '2021-05-08 04:18:27', '2021-05-08 04:18:27'),
(6, 2, 2, 5, '2021-05-08 04:48:39', '2021-05-08 04:48:39'),
(7, 7, 10, 1, '2021-06-01 17:54:38', '2021-06-01 17:54:38'),
(8, 9, 3, 1, '2021-09-23 23:01:44', '2021-09-23 23:01:44'),
(9, 9, 14, 5, '2021-10-06 21:49:33', '2021-10-06 21:49:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-10-26 06:05:46', '2020-10-26 06:05:46'),
(2, 'user', 'Normal User', '2020-10-26 06:05:46', '2020-10-26 06:05:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` int(10) UNSIGNED NOT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `created_at`, `updated_at`) VALUES
(1, 36, '2020-10-29 05:05:00', '2020-11-02 04:35:25'),
(2, 37, '2020-10-29 05:27:00', '2020-11-02 04:35:33'),
(3, 38, '2020-10-29 05:28:00', '2020-11-02 04:35:46'),
(4, 39, '2020-10-29 05:28:00', '2020-11-02 04:35:55'),
(5, 40, '2020-10-29 05:34:00', '2020-11-02 04:36:03'),
(6, 41, '2020-10-29 05:34:00', '2020-11-02 04:36:11'),
(7, 42, '2020-10-29 05:34:00', '2020-11-02 04:36:18'),
(8, 43, '2020-10-29 05:35:00', '2020-11-02 04:36:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `size_products`
--

CREATE TABLE `size_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `size_products`
--

INSERT INTO `size_products` (`id`, `product_id`, `size_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-10-29 05:06:28', '2020-10-29 05:06:28'),
(2, 1, 2, '2020-10-29 05:06:42', '2020-10-29 05:06:42'),
(3, 1, 3, '2020-10-29 06:04:39', '2020-10-29 06:04:39'),
(4, 1, 4, '2020-11-02 04:33:41', '2020-11-02 04:33:41'),
(5, 2, 1, '2020-11-02 04:34:00', '2020-11-02 04:36:57'),
(6, 2, 2, '2020-11-02 04:34:00', '2020-11-02 04:37:27'),
(7, 2, 3, '2020-11-02 04:34:00', '2020-11-02 04:37:39'),
(8, 2, 4, '2020-11-02 04:37:58', '2020-11-02 04:37:58'),
(9, 3, 1, '2020-11-02 04:38:14', '2020-11-02 04:38:14'),
(10, 3, 2, '2020-11-02 04:38:25', '2020-11-02 04:38:25'),
(11, 3, 3, '2020-11-02 04:38:36', '2020-11-02 04:38:36'),
(12, 3, 4, '2020-11-02 04:38:50', '2020-11-02 04:38:50'),
(13, 4, 1, '2020-11-02 04:39:12', '2020-11-02 04:39:12'),
(14, 4, 2, '2020-11-02 04:39:00', '2020-11-02 04:39:41'),
(15, 4, 3, '2020-11-02 04:39:56', '2020-11-02 04:39:56'),
(16, 4, 4, '2020-11-02 04:40:32', '2020-11-02 04:40:32'),
(17, 5, 1, '2020-11-02 04:40:50', '2020-11-02 04:40:50'),
(19, 5, 3, '2020-11-02 04:41:12', '2020-11-02 04:41:12'),
(21, 6, 1, '2020-11-02 04:41:40', '2020-11-02 04:41:40'),
(22, 6, 2, '2020-11-02 04:41:51', '2020-11-02 04:41:51'),
(23, 6, 3, '2020-11-02 04:42:04', '2020-11-02 04:42:04'),
(24, 6, 4, '2020-11-02 04:42:19', '2020-11-02 04:42:19'),
(25, 7, 1, '2020-11-02 04:42:37', '2020-11-02 04:42:37'),
(26, 7, 2, '2020-11-02 04:42:00', '2020-11-02 04:43:30'),
(27, 7, 3, '2020-11-02 04:43:00', '2020-11-02 04:43:53'),
(28, 7, 4, '2020-11-02 04:43:12', '2020-11-02 04:43:12'),
(29, 8, 1, '2020-11-02 04:44:22', '2020-11-02 04:44:22'),
(30, 8, 2, '2020-11-02 04:44:38', '2020-11-02 04:44:38'),
(31, 8, 3, '2020-11-02 04:44:50', '2020-11-02 04:44:50'),
(32, 8, 4, '2020-11-02 04:45:06', '2020-11-02 04:45:06'),
(33, 9, 1, '2020-11-02 04:45:22', '2020-11-02 04:45:22'),
(34, 9, 2, '2020-11-02 04:45:36', '2020-11-02 04:45:36'),
(35, 9, 3, '2020-11-02 04:45:50', '2020-11-02 04:45:50'),
(36, 9, 4, '2020-11-02 04:46:00', '2020-11-02 04:46:11'),
(37, 10, 1, '2020-11-02 04:46:42', '2020-11-02 04:46:42'),
(38, 10, 2, '2020-11-02 04:47:00', '2020-11-02 04:47:10'),
(39, 10, 3, '2020-11-02 04:48:16', '2020-11-02 04:48:16'),
(40, 10, 4, '2020-11-02 04:48:30', '2020-11-02 04:48:30'),
(41, 11, 1, '2020-11-02 04:48:52', '2020-11-02 04:48:52'),
(42, 11, 2, '2020-11-02 04:49:05', '2020-11-02 04:49:05'),
(43, 11, 3, '2020-11-02 04:49:23', '2020-11-02 04:49:23'),
(44, 11, 4, '2020-11-02 04:49:43', '2020-11-02 04:49:43'),
(45, 12, 1, '2020-11-02 04:50:11', '2020-11-02 04:50:11'),
(46, 12, 2, '2020-11-02 04:50:25', '2020-11-02 04:50:25'),
(47, 12, 3, '2020-11-02 04:50:42', '2020-11-02 04:50:42'),
(48, 12, 4, '2020-11-02 04:51:13', '2020-11-02 04:51:13'),
(49, 13, 1, '2020-11-02 04:51:56', '2020-11-02 04:51:56'),
(50, 13, 2, '2020-11-02 04:52:26', '2020-11-02 04:52:26'),
(51, 13, 3, '2020-11-02 04:52:00', '2020-11-02 04:52:59'),
(52, 13, 4, '2020-11-02 04:53:16', '2020-11-02 04:53:16'),
(53, 14, 1, '2020-11-02 04:53:49', '2020-11-02 04:53:49'),
(54, 14, 2, '2020-11-02 04:54:04', '2020-11-02 04:54:04'),
(55, 14, 3, '2020-11-02 04:57:31', '2020-11-02 04:57:31'),
(56, 14, 4, '2020-11-02 04:57:49', '2020-11-02 04:57:49'),
(57, 15, 1, '2020-11-02 04:58:53', '2020-11-02 04:58:53'),
(58, 15, 2, '2020-11-02 04:59:06', '2020-11-02 04:59:06'),
(59, 15, 3, '2020-11-02 04:59:31', '2020-11-02 04:59:31'),
(60, 15, 4, '2020-11-02 04:59:56', '2020-11-02 04:59:56'),
(61, 16, 1, '2020-11-02 05:00:17', '2020-11-02 05:00:17'),
(62, 16, 2, '2020-11-02 05:01:12', '2020-11-02 05:01:12'),
(63, 16, 3, '2020-11-02 05:01:31', '2020-11-02 05:01:31'),
(64, 16, 4, '2020-11-02 05:01:46', '2020-11-02 05:01:46'),
(65, 17, 1, '2020-11-02 05:02:06', '2020-11-02 05:02:06'),
(66, 17, 2, '2020-11-02 05:02:21', '2020-11-02 05:02:21'),
(67, 17, 3, '2020-11-02 05:02:37', '2020-11-02 05:02:37'),
(68, 17, 4, '2020-11-02 05:02:54', '2020-11-02 05:02:54'),
(69, 18, 1, '2020-11-02 05:03:10', '2020-11-02 05:03:10'),
(70, 18, 2, '2020-11-02 05:03:36', '2020-11-02 05:03:36'),
(72, 18, 3, '2020-11-02 05:03:54', '2020-11-02 05:03:54'),
(73, 18, 4, '2020-11-02 05:04:19', '2020-11-02 05:04:19'),
(74, 19, 1, '2020-11-02 05:20:07', '2020-11-02 05:20:07'),
(75, 19, 2, '2020-11-02 05:20:21', '2020-11-02 05:20:21'),
(76, 19, 3, '2020-11-02 05:20:35', '2020-11-02 05:20:35'),
(77, 19, 4, '2020-11-02 05:20:51', '2020-11-02 05:20:51'),
(78, 20, 5, '2020-11-02 22:17:51', '2020-11-02 22:17:51'),
(79, 20, 6, '2020-11-02 22:18:13', '2020-11-02 22:18:13'),
(80, 20, 7, '2020-11-02 22:18:38', '2020-11-02 22:18:38'),
(81, 20, 8, '2020-11-02 22:18:55', '2020-11-02 22:18:55'),
(82, 21, 5, '2020-11-02 22:19:19', '2020-11-02 22:19:19'),
(83, 21, 6, '2020-11-02 22:19:35', '2020-11-02 22:19:35'),
(84, 21, 7, '2020-11-02 22:19:52', '2020-11-02 22:19:52'),
(85, 21, 8, '2020-11-02 22:20:11', '2020-11-02 22:20:11'),
(86, 22, 5, '2020-11-02 22:20:33', '2020-11-02 22:20:33'),
(87, 22, 6, '2020-11-02 22:20:00', '2020-11-02 22:21:08'),
(88, 22, 7, '2020-11-02 22:21:27', '2020-11-02 22:21:27'),
(89, 22, 8, '2020-11-02 22:21:47', '2020-11-02 22:21:47'),
(90, 23, 5, '2020-11-02 22:22:09', '2020-11-02 22:22:09'),
(91, 23, 6, '2020-11-02 22:22:28', '2020-11-02 22:22:28'),
(92, 23, 7, '2020-11-02 22:23:00', '2020-11-02 22:23:33'),
(93, 23, 8, '2020-11-02 22:24:37', '2020-11-02 22:24:37'),
(94, 24, 5, '2020-11-02 22:24:58', '2020-11-02 22:24:58'),
(95, 24, 6, '2020-11-02 22:25:19', '2020-11-02 22:25:19'),
(96, 24, 7, '2020-11-02 22:25:39', '2020-11-02 22:25:39'),
(97, 24, 8, '2020-11-02 22:25:58', '2020-11-02 22:25:58'),
(98, 25, 5, '2020-11-02 22:26:19', '2020-11-02 22:26:19'),
(99, 25, 6, '2020-11-02 22:26:35', '2020-11-02 22:26:35'),
(100, 25, 7, '2020-11-02 22:26:53', '2020-11-02 22:26:53'),
(101, 25, 8, '2020-11-02 22:27:11', '2020-11-02 22:27:11'),
(102, 26, 5, '2020-11-02 22:27:35', '2020-11-02 22:27:35'),
(103, 26, 6, '2020-11-02 22:27:00', '2020-11-02 22:28:20'),
(104, 26, 7, '2020-11-02 22:28:40', '2020-11-02 22:28:40'),
(105, 26, 8, '2020-11-02 22:29:00', '2020-11-02 22:29:00'),
(106, 27, 5, '2020-11-02 22:29:17', '2020-11-02 22:29:17'),
(107, 27, 6, '2020-11-02 22:29:00', '2020-11-02 22:29:51'),
(108, 27, 7, '2020-11-02 22:30:11', '2020-11-02 22:30:11'),
(109, 27, 8, '2020-11-02 22:30:33', '2020-11-02 22:30:33'),
(110, 28, 5, '2020-11-02 22:31:57', '2020-11-02 22:31:57'),
(111, 28, 6, '2020-11-02 22:32:55', '2020-11-02 22:32:55'),
(112, 28, 7, '2020-11-02 22:33:16', '2020-11-02 22:33:16'),
(113, 28, 8, '2020-11-02 22:33:38', '2020-11-02 22:33:38'),
(114, 29, 5, '2020-11-02 22:33:59', '2020-11-02 22:33:59'),
(115, 29, 6, '2020-11-02 22:34:18', '2020-11-02 22:34:18'),
(116, 29, 7, '2020-11-02 22:34:00', '2020-11-02 22:34:53'),
(117, 29, 8, '2020-11-02 22:35:14', '2020-11-02 22:35:14'),
(118, 30, 5, '2020-11-02 22:35:40', '2020-11-02 22:35:40'),
(119, 30, 6, '2020-11-02 22:35:59', '2020-11-02 22:35:59'),
(120, 30, 7, '2020-11-02 22:36:22', '2020-11-02 22:36:22'),
(121, 30, 8, '2020-11-02 22:36:42', '2020-11-02 22:36:42'),
(122, 31, 5, '2020-11-02 22:37:00', '2020-11-02 22:37:00'),
(123, 31, 6, '2020-11-02 22:37:00', '2020-11-02 22:37:30'),
(124, 31, 7, '2020-11-02 22:37:57', '2020-11-02 22:37:57'),
(125, 31, 8, '2020-11-02 22:38:17', '2020-11-02 22:38:17'),
(126, 32, 5, '2020-11-02 22:38:42', '2020-11-02 22:38:42'),
(127, 32, 6, '2020-11-02 22:39:04', '2020-11-02 22:39:04'),
(128, 32, 7, '2020-11-02 22:39:31', '2020-11-02 22:39:31'),
(129, 32, 8, '2020-11-02 22:39:52', '2020-11-02 22:39:52'),
(130, 33, 5, '2020-11-02 22:40:00', '2020-11-02 22:40:26'),
(131, 33, 6, '2020-11-02 22:40:49', '2020-11-02 22:40:49'),
(132, 33, 7, '2020-11-02 22:41:06', '2020-11-02 22:41:06'),
(133, 33, 8, '2020-11-02 22:41:22', '2020-11-02 22:41:22'),
(134, 34, 5, '2020-11-02 22:41:00', '2020-11-02 22:42:54'),
(135, 34, 6, '2020-11-02 22:41:00', '2020-11-02 22:43:14'),
(136, 34, 7, '2020-11-02 22:42:00', '2020-11-02 22:43:27'),
(137, 34, 8, '2020-11-02 22:43:46', '2020-11-02 22:43:46'),
(138, 35, 5, '2020-11-02 22:44:21', '2020-11-02 22:44:21'),
(139, 35, 6, '2020-11-02 22:44:38', '2020-11-02 22:44:38'),
(140, 35, 7, '2020-11-02 22:45:00', '2020-11-02 22:45:00'),
(141, 35, 8, '2020-11-02 22:45:19', '2020-11-02 22:45:19'),
(142, 36, 1, '2020-12-20 21:18:00', '2020-12-20 21:20:01'),
(143, 36, 2, '2020-12-20 21:20:21', '2020-12-20 21:20:21'),
(144, 36, 3, '2020-12-20 21:20:37', '2020-12-20 21:20:37'),
(145, 36, 4, '2020-12-20 21:20:54', '2020-12-20 21:20:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `birthday`, `phone`, `address`) VALUES
(2, 1, 'HongPink', 'pink@gmail.com', 'users\\October2020\\LW5xQ6dd698TL71PidwO.jpg', NULL, '$2y$10$ow3N4pXGbFE.LZRh45WEJexTirRfyX82KRVZ67ctBDXmAONFZT6ei', '0USRYZHy4vAxxYw9jRDQUXiTu4mh50l64doEXdmGLVtAFCRGIGH6Wk3CniXN', '{\"locale\":\"en\"}', '2020-10-26 06:06:23', '2020-10-27 22:06:51', NULL, NULL, NULL),
(3, 2, 'HongPink', 'hong@gmail.com', 'users/default.png', NULL, '$2y$10$ZsxiPyUq5zrDsf2NwwrSDuy3GREHLxBTYlmdC2AtCU7u88B6wIN/q', NULL, NULL, '2020-11-09 06:26:57', '2020-11-09 06:26:57', '1999-07-15', '0864856355', 'Ninh Kiều, Cần Thơ, Việt nam'),
(5, 2, 'Lê Hồng', 'hongluan@gmail.com', 'users/default.png', NULL, '$2y$10$47xmMpIVzTLPnCPVBQNmEuCqrBthp113es1h5QHh7prxBdtp84PQe', NULL, NULL, '2020-12-17 23:39:15', '2020-12-17 23:39:15', '2014-07-18', '0387184290', 'hồng ngự, đồng tháp'),
(6, 2, 'HuynhNet', 'huynhnet27@gmail.com', 'mua.jpg', NULL, '$2y$10$Dhvy/.IvBrXztKqq1rO72uhZJdBnhp6HZIg.QdoZy8OgXqIOYYMbK', NULL, NULL, '2021-04-13 08:19:41', '2021-05-07 09:13:55', '2021-03-30', '0859134539', 'Cà Mau'),
(7, 2, 'thao le', 'thaole@gmail.com', 'users/default.png', NULL, '$2y$10$mI5H7TgKFXsZ4iuqGGO2k.uWNXVW48YvXdxL1aYyieLSScjDCHB1y', NULL, NULL, '2021-05-08 04:00:07', '2021-05-08 04:00:07', '2006-06-25', '0379558157', 'dong thap'),
(8, 2, 'thanhthu', 'nguyen.thai.thanh.thu@gmail.com', 'hh.jpg', NULL, '$2y$10$rNxNko/szJDqR1mo6igkEeCtyuB.zcL5jmXIHxIxGvJ2d8E2hKfpa', NULL, NULL, '2021-05-27 00:21:39', '2021-05-27 00:25:52', '1999-08-20', '0363360425', 'đường ngu sao chỉ, ap hoi làm chi'),
(9, 2, 'le hong', 'hong123@gmail.com', 'users/default.png', NULL, '$2y$10$vOHZCOKu.iev9ZPXq/2dIe1Ce5N9qA/h4tQLwzT.r8rEyQzJJimEa', NULL, NULL, '2021-09-23 23:00:59', '2021-09-23 23:00:59', '2021-04-08', '0387194390', 'dong thap');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `color_products`
--
ALTER TABLE `color_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Chỉ mục cho bảng `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `detail_products`
--
ALTER TABLE `detail_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Chỉ mục cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `rating_stars`
--
ALTER TABLE `rating_stars`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `size_products`
--
ALTER TABLE `size_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `IDX_1483A5E9D60322AC` (`role_id`);

--
-- Chỉ mục cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `color_products`
--
ALTER TABLE `color_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT cho bảng `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `detail_products`
--
ALTER TABLE `detail_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `rating_stars`
--
ALTER TABLE `rating_stars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `size_products`
--
ALTER TABLE `size_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT cho bảng `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
