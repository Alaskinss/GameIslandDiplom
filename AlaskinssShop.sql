-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 06 2023 г., 18:30
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `AlaskinssShop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(26, 1, 4, 1, '2023-05-08 10:59:34', '2023-05-08 10:59:34');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `states` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`code`, `name`, `states`) VALUES
('geo', 'Georgia', NULL),
('ger', 'Germany', NULL),
('ind', 'India', NULL),
('usa', 'United States of America', '{\"AK\": \"Alaska\", \"AL\": \"Alabama\", \"AR\": \"Arkansas\", \"AZ\": \"Arizona\", \"CA\": \"California\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `user_id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`user_id`, `first_name`, `last_name`, `phone`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'gfhfgnffgj', 'gjfgjfgjfg', '2354256252', '1', '2023-05-08 14:58:47', '2023-05-08 14:58:47', NULL, NULL),
(7, 'test6', '', NULL, NULL, '2023-05-08 10:14:34', '2023-05-08 10:14:34', NULL, NULL),
(8, 'test7', '', NULL, NULL, '2023-05-08 10:27:03', '2023-05-08 10:27:03', NULL, NULL),
(9, 'test8', '', NULL, NULL, '2023-05-08 10:31:24', '2023-05-08 10:31:24', NULL, NULL),
(10, 'test1', '', NULL, NULL, '2023-05-08 10:36:35', '2023-05-08 10:36:35', NULL, NULL),
(11, 'test2', '', NULL, NULL, '2023-05-08 10:45:15', '2023-05-08 10:45:15', NULL, NULL),
(12, 'test3', '', NULL, NULL, '2023-05-08 10:46:47', '2023-05-08 10:46:47', NULL, NULL),
(13, 'test4', '', NULL, 'active', '2023-05-08 10:48:15', '2023-05-08 10:48:15', NULL, NULL),
(14, 'test5', '', NULL, NULL, '2023-05-08 11:46:58', '2023-05-08 11:46:58', NULL, NULL),
(15, 'Tester', '', NULL, NULL, '2023-06-01 03:24:47', '2023-06-01 03:24:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_09_004121_create_products_table', 1),
(6, '2022_07_09_004135_create_orders_table', 1),
(7, '2022_07_09_004342_create_countries_table', 1),
(8, '2022_07_09_004403_create_cart_items_table', 1),
(9, '2022_07_09_004417_create_order_details_table', 1),
(10, '2022_07_09_004430_create_order_items_table', 1),
(11, '2022_07_09_004446_create_payments_table', 1),
(12, '2022_07_09_004505_create_customers_table', 1),
(13, '2022_07_09_004515_create_customer_addresses_table', 1),
(14, '2022_07_11_043258_add_is_admin_column_to_users_table', 1),
(15, '2022_09_11_142434_rename_customer_id_column', 1),
(16, '2022_09_17_025414_change_countries_states_column_into_json', 1),
(17, '2022_10_01_142356_add_session_id_to_payments_table', 1),
(18, '2022_10_09_171628_add_published_column_to_products', 1),
(19, '2022_11_28_194915_update_order_items_order_id', 1),
(20, '2022_11_28_194929_update_payments_order_id', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `total_price` decimal(20,2) NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `total_price`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, '124124.00', 'unpaid', '2023-05-08 11:16:56', '2023-05-08 11:16:56', 13, 13),
(2, '5.00', 'unpaid', '2023-05-08 11:17:16', '2023-05-08 11:17:16', 13, 13),
(3, '5.00', 'unpaid', '2023-05-08 11:20:52', '2023-05-08 11:20:52', 13, 13),
(4, '5.00', 'unpaid', '2023-05-08 11:31:14', '2023-05-08 11:31:14', 13, 13),
(5, '0.00', 'unpaid', '2023-05-08 11:33:14', '2023-05-08 11:33:14', 13, 13),
(6, '0.00', 'unpaid', '2023-05-08 11:35:58', '2023-05-08 11:35:58', 13, 13),
(7, '124124.00', 'unpaid', '2023-05-08 11:38:14', '2023-05-08 11:38:14', 13, 13),
(8, '5.00', 'unpaid', '2023-05-08 11:39:40', '2023-05-08 11:39:40', 13, 13),
(9, '124124.00', 'unpaid', '2023-05-08 11:41:02', '2023-05-08 11:41:02', 13, 13),
(10, '5.00', 'unpaid', '2023-05-08 11:41:29', '2023-05-08 11:41:29', 13, 13),
(11, '1.00', 'unpaid', '2023-05-08 11:54:56', '2023-05-08 11:54:56', 14, 14),
(12, '13.00', 'unpaid', '2023-06-01 03:28:01', '2023-06-01 03:28:01', 15, 15);

-- --------------------------------------------------------

--
-- Структура таблицы `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, '124124.00', '2023-05-08 11:16:56', '2023-05-08 11:16:56'),
(2, 2, 4, 1, '5.00', '2023-05-08 11:17:16', '2023-05-08 11:17:16'),
(3, 3, 3, 1, '5.00', '2023-05-08 11:20:52', '2023-05-08 11:20:52'),
(4, 4, 4, 1, '5.00', '2023-05-08 11:31:14', '2023-05-08 11:31:14'),
(5, 7, 6, 1, '124124.00', '2023-05-08 11:38:14', '2023-05-08 11:38:14'),
(6, 8, 3, 1, '5.00', '2023-05-08 11:39:40', '2023-05-08 11:39:40'),
(7, 9, 6, 1, '124124.00', '2023-05-08 11:41:02', '2023-05-08 11:41:02'),
(8, 10, 4, 1, '5.00', '2023-05-08 11:41:29', '2023-05-08 11:41:29'),
(9, 11, 7, 1, '1.00', '2023-05-08 11:54:56', '2023-05-08 11:54:56'),
(10, 12, 10, 1, '5.00', '2023-06-01 03:28:01', '2023-06-01 03:28:01'),
(11, 12, 11, 1, '8.00', '2023-06-01 03:28:01', '2023-06-01 03:28:01');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `amount`, `status`, `type`, `created_at`, `updated_at`, `created_by`, `updated_by`, `session_id`) VALUES
(1, 1, '124124.00', 'pending', 'cc', '2023-05-08 11:16:56', '2023-05-08 11:16:56', 13, 13, NULL),
(2, 2, '5.00', 'pending', 'cc', '2023-05-08 11:17:16', '2023-05-08 11:17:16', 13, 13, NULL),
(3, 3, '5.00', 'pending', 'cc', '2023-05-08 11:20:52', '2023-05-08 11:20:52', 13, 13, NULL),
(4, 4, '5.00', 'pending', 'cc', '2023-05-08 11:31:14', '2023-05-08 11:31:14', 13, 13, NULL),
(5, 5, '0.00', 'pending', 'cc', '2023-05-08 11:33:14', '2023-05-08 11:33:14', 13, 13, NULL),
(6, 6, '0.00', 'pending', 'cc', '2023-05-08 11:35:58', '2023-05-08 11:35:58', 13, 13, NULL),
(7, 7, '124124.00', 'pending', 'cc', '2023-05-08 11:38:14', '2023-05-08 11:38:14', 13, 13, NULL),
(8, 8, '5.00', 'pending', 'cc', '2023-05-08 11:39:40', '2023-05-08 11:39:40', 13, 13, NULL),
(9, 9, '124124.00', 'pending', 'cc', '2023-05-08 11:41:02', '2023-05-08 11:41:02', 13, 13, NULL),
(10, 10, '5.00', 'pending', 'cc', '2023-05-08 11:41:29', '2023-05-08 11:41:29', 13, 13, NULL),
(11, 11, '1.00', 'pending', 'cc', '2023-05-08 11:54:56', '2023-05-08 11:54:56', 14, 14, NULL),
(12, 12, '13.00', 'pending', 'cc', '2023-06-01 03:28:01', '2023-06-01 03:28:01', 15, 15, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'main', 'd04f9f4c8fab019f95b166ab3fb30126d004963296e57189cd8148409f8d6f11', '[\"*\"]', '2023-04-12 08:33:47', '2023-04-12 08:28:32', '2023-04-12 08:33:47'),
(2, 'App\\Models\\User', 1, 'main', 'c377e223e2e79dad55c8453adc056f54eef44e546cc9c15fdc791a4d6ef4144c', '[\"*\"]', '2023-04-12 11:44:18', '2023-04-12 09:12:53', '2023-04-12 11:44:18'),
(3, 'App\\Models\\User', 1, 'main', '5706cdbdebc752536800e559c9306079f51ea3f6028e4b1d0adfe4832872584f', '[\"*\"]', '2023-04-15 06:28:59', '2023-04-15 06:25:21', '2023-04-15 06:28:59'),
(4, 'App\\Models\\User', 1, 'main', '020c2492cd5f9773583bd343ced1e5d9f26b7c594d12f3974066cc61e5e5729b', '[\"*\"]', '2023-04-19 09:12:19', '2023-04-19 09:11:16', '2023-04-19 09:12:19'),
(5, 'App\\Models\\User', 1, 'main', '70e9969076f146185d8d93ef2c989cb17c77a6d998c93b109a310dea43ead556', '[\"*\"]', '2023-04-22 00:49:39', '2023-04-22 00:47:41', '2023-04-22 00:49:39'),
(6, 'App\\Models\\User', 1, 'main', '2053c3190d8d9152368f6d676752b9bd06a52c96cf78f7ebdf208cad6ffc86d9', '[\"*\"]', '2023-05-06 10:23:27', '2023-05-06 10:19:55', '2023-05-06 10:23:27'),
(7, 'App\\Models\\User', 1, 'main', '12070dddc10120db6564546318e797bf8986c1b3f7c60e261f263d232530460c', '[\"*\"]', '2023-05-08 11:55:36', '2023-05-08 10:54:53', '2023-05-08 11:55:36'),
(8, 'App\\Models\\User', 1, 'main', '2ff2a9e5261edd0ff3d757827cfd552e89745cd45436f38478c77db1f05f07b3', '[\"*\"]', '2023-06-01 03:23:02', '2023-06-01 03:17:10', '2023-06-01 03:23:02');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_mime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_size` int DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `created_by` bigint UNSIGNED DEFAULT NULL,
  `updated_by` bigint UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `image`, `image_mime`, `image_size`, `description`, `price`, `created_by`, `updated_by`, `deleted_at`, `deleted_by`, `created_at`, `updated_at`, `published`) VALUES
(1, 'Stardew Valley', 'stardew-valley', 'http://localhost:8000/storage/images/LT0OlMYzHnNMAYpx/Без названия.jpg', 'image/jpeg', 12226, 'Тут суперское описание игры', '23.00', 1, 1, '2023-04-12 10:09:18', NULL, '2023-04-12 08:32:02', '2023-04-12 10:09:18', 1),
(2, '111', '111', '', NULL, NULL, '1111', '22.00', NULL, NULL, '2023-06-01 03:17:51', NULL, NULL, '2023-06-01 03:17:51', 0),
(3, 'Игра 1', 'igra-1', 'http://localhost:8000/storage/images/QxHtOKsqSGKcjOGF/Без названия.jpg', 'image/jpeg', 12226, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam faucibus urna vestibulum arcu pulvinar, quis lobortis lacus consequat. Etiam euismod diam sed neque dapibus luctus. Cras id rhoncus dolor, eu dignissim metus. Maecenas eget ante aliquam, ultrices nibh a, convallis lacus. Etiam iaculis eget ex quis ultricies. Donec nec lectus sit amet neque viverra gravida eu sit amet urna. Sed maximus iaculis tempor. Morbi sit amet sapien efficitur, faucibus tortor et, hendrerit nisi. Nullam a orci nec odio tempus mollis. Cras dapibus felis vel nibh vestibulum dapibus. Vestibulum interdum justo leo, consequat fermentum lectus porta sed. Maecenas erat lectus, ultricies eu mollis in, finibus vel justo. Sed sollicitudin gravida mi. Mauris consequat, magna sed efficitur cursus, neque nunc pulvinar ex, dignissim laoreet eros quam a dolor.\r\n\r\nAliquam purus orci, finibus non pellentesque a, mollis id dui. Donec consequat, ipsum semper vulputate bibendum, libero ipsum mollis leo, a volutpat risus arcu sed metus. Sed a mattis magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aliquam interdum aliquet erat, a condimentum lacus efficitur id. Nunc quis tellus id diam tempus elementum et ut tellus. Pellentesque auctor dui et consectetur convallis. Sed porta tellus quis convallis bibendum. Fusce arcu arcu, venenatis dignissim dictum vitae, sollicitudin ac augue. Sed a nisi feugiat, luctus magna nec, blandit eros. Suspendisse potenti. Ut viverra nunc non nisi placerat finibus. Donec egestas nunc non augue bibendum, ut consequat risus malesuada. Vivamus sed tortor est. Maecenas rhoncus tempus purus, quis dapibus dui venenatis eu.', '5.00', 1, 1, '2023-06-01 03:17:47', NULL, '2023-04-12 10:09:37', '2023-06-01 03:17:47', 1),
(4, 'Игра 2', 'igra-2', 'http://localhost:8000/storage/images/cixgX7D44NjKrrnA/deabcedf9d1491725bbc616a47204ded.jpg', 'image/jpeg', 50061, 'Описание игры 2', '5.00', 1, 1, '2023-06-01 03:17:44', NULL, '2023-04-19 09:12:18', '2023-06-01 03:17:44', 1),
(5, '3', '3', NULL, NULL, NULL, '3', '2.00', 1, 1, '2023-06-01 03:17:41', NULL, '2023-04-22 00:48:14', '2023-06-01 03:17:41', 1),
(6, '124124124', '124124124', 'http://localhost:8000/storage/images/eGVdcNKRnsFg5dny/image_2023-01-31_22-47-03.png', 'image/png', 353870, '124124', '124124.00', 1, 1, '2023-06-01 03:17:38', NULL, '2023-05-06 10:20:57', '2023-06-01 03:17:38', 1),
(7, 'starbound', 'starbound', 'http://localhost:8000/storage/images/uNU5CbSdPODZiPAB/photo_2022-03-26_11-16-16.jpg', 'image/jpeg', 121987, 'ggggg', '1.00', 1, 1, '2023-06-01 03:17:34', NULL, '2023-05-08 11:54:38', '2023-06-01 03:17:34', 1),
(8, 'Starbound', 'starbound-1', 'http://localhost:8000/storage/images/PhGbDapbXLX1hn4d/starbound-pc-mac-game-steam-cover.jpg', 'image/jpeg', 45211, 'Starbound — компьютерная игра, разработанная независимой британской игровой студией Chucklefish. Игра представляет собой двухмерную приключенческую песочницу.', '5.00', 1, 1, NULL, NULL, '2023-06-01 03:18:47', '2023-06-01 03:18:47', 1),
(9, 'stardev valley', 'stardev-valley', 'http://localhost:8000/storage/images/rOyezwWyOgKYBfTS/82749fc7ad33c8169469d99c2bdce6ab99a601de598b3a014015cafe5968c217.jpg', 'image/jpeg', 448461, 'Stardew Valley — компьютерная игра в жанре симулятора жизни фермера с элементами ролевой игры, разработанная игровым дизайнером Эриком Бароном и изданная Chucklefish Games для Microsoft Windows в 2016 году. Позже игра была портирована на платформы macOS, Linux, PlayStation 4, Xbox One, Nintendo Switch, iOS и Android.', '10.00', 1, 1, NULL, NULL, '2023-06-01 03:19:43', '2023-06-01 03:19:43', 1),
(10, 'Tiny bunny', 'tiny-bunny', 'http://localhost:8000/storage/images/f7W6WqxuYRpSATJW/capsule_616x353.jpg', 'image/jpeg', 39172, '«Зайчик» — визуальная новелла в жанре хоррора. Создана группой российских разработчиков, называющих себя SAIKONO GAMES, по мотивам одноимённого рассказа интернет-писателя Дмитрия Мордаса. Издана ей же. демо-версия вышла 20 марта 2020 года, а 16 апреля 2021 года в Steam вышли первые два эпизода.', '5.00', 1, 1, NULL, NULL, '2023-06-01 03:20:44', '2023-06-01 03:20:44', 1),
(11, 'deep rock galactic', 'deep-rock-galactic', 'http://localhost:8000/storage/images/MVvucdCQpFl1TqSb/Deep_Rock_Galactic_cover.jpeg', 'image/jpeg', 246310, 'Deep Rock Galactic — компьютерная игра в жанре кооперативного шутера от первого лица, разработанная датской студией Ghost Ship Games и изданная компанией Coffee Stain Publishing для Microsoft Windows и Xbox One в 2020 году, для PlayStation 4 и PlayStation 5 в январе 2022 года.', '8.00', 1, 1, NULL, NULL, '2023-06-01 03:21:32', '2023-06-01 03:21:32', 1),
(12, 'the beast inside', 'the-beast-inside', 'http://localhost:8000/storage/images/c5SrjU2Rk0Sl2cAG/01-the-beast-inside.jpg', 'image/jpeg', 104617, 'The Beast Inside — отличный бюджетный хоррор. У игры не самое лучшее техническое исполнение, анимация и графика. Но насыщенное повествование с интересной подачей сюжета и постоянное сочетание разных действий делают игру хорошим виртуальным приключением.', '5.00', 1, 1, NULL, NULL, '2023-06-01 03:22:09', '2023-06-01 03:22:09', 1),
(13, 'Tropico 5', 'tropico-5', 'http://localhost:8000/storage/images/PchUqC1smZiPpJxL/9aa36a61-f635-4285-b0de-cb8320403f62.jpg', 'image/jpeg', 322622, 'Tropico 5 — компьютерная игра в жанре экономическая стратегия, градостроительный симулятор из серии Tropico, разработанная болгарской студией Haemimont Games и издаваемая немецкой фирмой Kalypso Media. Игра вышла 23 мая 2014 года для ПК. Версия для России выпускается компанией Бука.', '10.00', 1, 1, NULL, NULL, '2023-06-01 03:23:01', '2023-06-01 03:23:01', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_admin`) VALUES
(1, 'Admin', 'admin@example.com', '2023-04-12 08:24:22', '$2y$10$W6K8WPWuowcPlrHFWkAvHuN9qmGG2LvFx2xbTwm/6Y/jVcwQHrf5y', 'RpCKVOy4DQZNtJkZZ07CXcliSJUVsA4ItNeHUVj5rJmldDzORqUsAOIOnDeW', '2023-04-12 08:24:22', '2023-04-12 08:24:22', 1),
(10, 'test1', 'test1@example.com', NULL, '$2y$10$D72E1B7QS2IdBICypkgN8ObetRkON7b6yCi7hZuLINpF9cDnUOhQC', NULL, '2023-05-08 10:36:35', '2023-05-08 10:36:35', 0),
(11, 'test2', 'test2@example.com', NULL, '$2y$10$QcVwwmMInyAISO0WEMXtZe77dZSiW8M6XJ5wf0qznStLV3e9HHx52', NULL, '2023-05-08 10:45:15', '2023-05-08 10:45:15', 0),
(12, 'test3', 'test3@example.com', NULL, '$2y$10$7T5LSTqJBB2DhsbYDiKCCOWrfnFOpFW.fGCbCZb/6M9eBqGnQbBnm', NULL, '2023-05-08 10:46:47', '2023-05-08 10:46:47', 0),
(13, 'test4', 'test4@example.com', '2023-05-08 14:48:39', '$2y$10$rhYoneRGyvL1a4NduXNUleP6sr7faZaX75nX27.4LGPBGYHcRbSCG', 'VSoFGx4AN3aN9NmEyKeoMD6Q8QjNmiq8SnA1N9O3rERcJNkB2IwvJbSJ200t', '2023-05-08 10:48:15', '2023-05-08 10:48:15', 0),
(14, 'test5', 'test5@example.com', '2023-05-08 15:47:14', '$2y$10$1r/8lt0Wx6zFiFeixYVr..Cb2L0G5lU0YA0ycS5L.qPgMg6fHLfUC', NULL, '2023-05-08 11:46:58', '2023-05-08 11:46:58', 0),
(15, 'Tester', 'Tester@example.com', '2023-06-01 12:25:47', '$2y$10$mBGvJ.OmhGESXxjG8ELCXucqz/x0zPknk8iRgCWuw/cSQD10g2JsK', NULL, '2023-06-01 03:24:47', '2023-06-01 03:24:47', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`code`);

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `customer_addresses_country_code_foreign` (`country_code`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `user_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_country_code_foreign` FOREIGN KEY (`country_code`) REFERENCES `countries` (`code`),
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
