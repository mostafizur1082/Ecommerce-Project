-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2023 at 02:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Admin1', 'admin@gmail.com', '2023-06-04 06:44:04', '$2y$10$1MVA67vTow2NRAMEUmfjKuooUCrdM8S18Xfo4ahrHrw5I.MUIL6CC', 'nGRlRFO2iBh3Elx52UfNDAIMficK0wd3aNnVbGlcsgh3T4fBj4EBb2Edaef8', NULL, '2023060617571.jpg', '2023-06-04 06:44:04', '2023-06-11 02:40:25');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name_en` varchar(255) NOT NULL,
  `brand_name_bn` varchar(255) NOT NULL,
  `brand_slug_en` varchar(255) NOT NULL,
  `brand_slug_bn` varchar(255) NOT NULL,
  `brand_image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name_en`, `brand_name_bn`, `brand_slug_en`, `brand_slug_bn`, `brand_image`, `created_at`, `updated_at`) VALUES
(2, 'Get Lucky', 'ভাগ্যবান', 'get-lucky', 'ভাগ্যবান', 'upload/brand/1768423846259735.png', NULL, NULL),
(3, 'Blue Line', 'নীল রেখা', 'blue-line', 'নীল-রেখা', 'upload/brand/1768426827363550.png', NULL, '2023-06-11 11:07:25'),
(4, 'Just Ride', 'জাস্ট রাইড', 'just-ride', 'জাস্ট-রাইড', 'upload/brand/1768423917182983.png', NULL, NULL),
(5, 'Logo', 'লোগো 1', 'logo', 'লোগো-1', 'upload/brand/1768423945077596.png', NULL, '2023-07-18 02:37:58'),
(6, 'Your Logo1', 'আপনার লোগো1', 'your-logo1', 'আপনার-লোগো1', 'upload/brand/1768426970811522.png', NULL, '2023-06-11 11:09:42'),
(7, 'Hot Foil', 'গরম ফয়েল', 'hot-foil', 'গরম-ফয়েল', 'upload/brand/1768424197677358.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name_en` varchar(255) NOT NULL,
  `category_name_bn` varchar(255) NOT NULL,
  `category_slug_en` varchar(255) NOT NULL,
  `category_slug_bn` varchar(255) NOT NULL,
  `category_icon` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name_en`, `category_name_bn`, `category_slug_en`, `category_slug_bn`, `category_icon`, `created_at`, `updated_at`) VALUES
(7, 'Fashion', 'ফ্যাশন', 'fashion', 'ফ্যাশন', 'fa fa-fw fa-shirtsinbulk', NULL, NULL),
(8, 'Mobiles ', 'মোবাইল ', 'mobiles-&-tablets', 'মোবাইল', 'fa fa-mobile', NULL, NULL),
(9, 'Electronics', 'ইলেকট্রনিক্স', 'electronics', 'ইলেকট্রনিক্স', 'fa fa-laptop', NULL, NULL),
(10, 'TVs ', 'টিভি', 'tvs-&-appliances', 'টিভি', 'fa fa-tv', NULL, NULL),
(11, 'Beauty', 'সৌন্দর্য', 'beauty', 'সৌন্দর্য', 'fa fa-heartbeat', NULL, '2023-07-18 02:41:17'),
(12, 'Kitchen', 'রান্নাঘর', 'home-&-kitchen', 'বাড়ি', 'fa fa-hotel', NULL, NULL),
(13, 'Furniture', 'আসবাবপত্র', 'furniture', 'আসবাবপত্র', 'fa fa-wheelchair', NULL, NULL),
(14, 'Grocery', 'মুদিখানা', 'grocery', 'মুদিখানা', 'fa fa-fw fa-hand-paper-o', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_discount` int(11) NOT NULL,
  `coupon_validity` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `coupon_discount`, `coupon_validity`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HAPPY NEW YEAR', 15, '2023-08-05', 1, '2023-07-26 00:01:56', NULL),
(3, 'ECOM', 20, '2023-08-03', 1, '2023-07-26 00:17:20', NULL),
(4, 'GET', 10, '2023-08-02', 1, '2023-07-26 00:17:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_06_02_135513_create_sessions_table', 1),
(7, '2023_06_04_122244_create_admins_table', 2),
(8, '2023_06_11_094307_create_brands_table', 3),
(9, '2023_06_12_092534_create_categories_table', 4),
(10, '2023_06_12_140921_create_sub_categories_table', 5),
(11, '2023_06_12_163439_create_sub_sub_categories_table', 6),
(12, '2023_06_13_090146_create_products_table', 7),
(13, '2023_06_13_090945_create_multi_imgs_table', 7),
(14, '2023_07_17_124150_create_sliders_table', 8),
(15, '2023_07_25_043645_create_wishlists_table', 9),
(16, '2023_07_26_054049_create_coupons_table', 10),
(17, '2023_07_26_062011_create_ship_divisions_table', 11),
(18, '2023_07_26_063744_create_ship_districts_table', 12),
(19, '2023_07_26_065437_create_ship_states_table', 13),
(20, '2023_07_27_082530_create_shippings_table', 14),
(21, '2023_07_27_141027_create_orders_table', 15),
(22, '2023_07_27_141111_create_order_items_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `photo_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `product_id`, `photo_name`, `created_at`, `updated_at`) VALUES
(6, 3, 'upload/products/multi-image/1768613802536198.jpeg', '2023-06-13 12:39:19', NULL),
(7, 3, 'upload/products/multi-image/1768613802726689.jpeg', '2023-06-13 12:39:19', NULL),
(8, 3, 'upload/products/multi-image/1768613802890164.jpeg', '2023-06-13 12:39:19', NULL),
(9, 3, 'upload/products/multi-image/1768613803046594.jpeg', '2023-06-13 12:39:19', NULL),
(10, 4, 'upload/products/multi-image/1768614691518138.jpeg', '2023-06-13 12:53:27', NULL),
(11, 4, 'upload/products/multi-image/1768614691712764.jpeg', '2023-06-13 12:53:27', NULL),
(12, 4, 'upload/products/multi-image/1768614691877699.jpeg', '2023-06-13 12:53:27', NULL),
(13, 4, 'upload/products/multi-image/1768614692024916.jpeg', '2023-06-13 12:53:27', NULL),
(14, 5, 'upload/products/multi-image/1771666499762293.jpeg', '2023-07-17 05:20:38', NULL),
(15, 5, 'upload/products/multi-image/1771666499910545.jpeg', '2023-07-17 05:20:38', NULL),
(16, 5, 'upload/products/multi-image/1771666500067661.jpeg', '2023-07-17 05:20:38', NULL),
(17, 5, 'upload/products/multi-image/1771666500222363.jpeg', '2023-07-17 05:20:38', NULL),
(18, 6, 'upload/products/multi-image/1771754474323377.jpeg', '2023-07-18 04:38:57', NULL),
(19, 6, 'upload/products/multi-image/1771754474521913.jpeg', '2023-07-18 04:38:57', NULL),
(20, 7, 'upload/products/multi-image/1771754694443666.jpeg', '2023-07-18 04:42:27', NULL),
(21, 7, 'upload/products/multi-image/1771754694584502.jpeg', '2023-07-18 04:42:27', NULL),
(22, 8, 'upload/products/multi-image/1771754892487287.jpeg', '2023-07-18 04:45:36', NULL),
(23, 8, 'upload/products/multi-image/1771754892675708.jpeg', '2023-07-18 04:45:36', NULL),
(24, 8, 'upload/products/multi-image/1771754892823635.jpeg', '2023-07-18 04:45:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `post_code` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `payment_type` varchar(255) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `order_month` varchar(255) NOT NULL,
  `order_year` varchar(255) NOT NULL,
  `confirmed_date` varchar(255) DEFAULT NULL,
  `processing_date` varchar(255) DEFAULT NULL,
  `picked_date` varchar(255) DEFAULT NULL,
  `shipped_date` varchar(255) DEFAULT NULL,
  `delivered_date` varchar(255) DEFAULT NULL,
  `cancel_date` varchar(255) DEFAULT NULL,
  `return_date` varchar(255) DEFAULT NULL,
  `return_reason` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `division_id`, `district_id`, `state_id`, `name`, `email`, `phone`, `post_code`, `notes`, `payment_type`, `payment_method`, `transaction_id`, `currency`, `amount`, `order_number`, `invoice_no`, `order_date`, `order_month`, `order_year`, `confirmed_date`, `processing_date`, `picked_date`, `shipped_date`, `delivered_date`, `cancel_date`, `return_date`, `return_reason`, `status`, `created_at`, `updated_at`) VALUES
(12, 1, 1, 11, 5, 'user', 'user@gmail.com', '01752505549', 1202, 'test', 'card_1NZ8cQBGe0dcTl66XQvXgfji', 'Stripe', 'txn_3NZ8cRBGe0dcTl661ljEXaRd', 'usd', 7290.00, '64c4cf4aac942', 'EOS34440501', '29 July 2023', 'July', '2023', NULL, NULL, NULL, NULL, NULL, NULL, '30 July 2023', 'Wrong Product', 'Delivered', '2023-07-29 02:35:24', '2023-07-30 04:16:50'),
(18, 1, 1, 8, 3, 'user', 'user@gmail.com', '01752505549', 1234, 'ggggggg', 'Cash On Delivery', 'Cash On Delivery', NULL, 'Usd', 2700.00, NULL, 'EOS52447773', '29 July 2023', 'July', '2023', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Confirmed', '2023-07-29 07:01:20', '2023-07-30 03:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `qty` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `color`, `size`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(2, 12, 8, 'red', 'Small', '3', 2700.00, '2023-07-29 02:35:24', NULL),
(4, 18, 8, 'red', 'Small', '1', 2700.00, '2023-07-29 07:01:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_id` int(11) NOT NULL,
  `product_name_en` varchar(255) NOT NULL,
  `product_name_bn` varchar(255) NOT NULL,
  `product_slug_en` varchar(255) NOT NULL,
  `product_slug_bn` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_qty` varchar(255) NOT NULL,
  `product_tags_en` varchar(255) NOT NULL,
  `product_tags_bn` varchar(255) NOT NULL,
  `product_size_en` varchar(255) DEFAULT NULL,
  `product_size_bn` varchar(255) DEFAULT NULL,
  `product_color_en` varchar(255) NOT NULL,
  `product_color_bn` varchar(255) NOT NULL,
  `selling_price` varchar(255) NOT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `short_descp_en` varchar(255) NOT NULL,
  `short_descp_bn` varchar(255) NOT NULL,
  `long_descp_en` varchar(255) NOT NULL,
  `long_descp_bn` varchar(255) NOT NULL,
  `product_thambnail` varchar(255) NOT NULL,
  `hot_deals` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `special_offer` int(11) DEFAULT NULL,
  `special_deals` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `subcategory_id`, `subsubcategory_id`, `product_name_en`, `product_name_bn`, `product_slug_en`, `product_slug_bn`, `product_code`, `product_qty`, `product_tags_en`, `product_tags_bn`, `product_size_en`, `product_size_bn`, `product_color_en`, `product_color_bn`, `selling_price`, `discount_price`, `short_descp_en`, `short_descp_bn`, `long_descp_en`, `long_descp_bn`, `product_thambnail`, `hot_deals`, `featured`, `special_offer`, `special_deals`, `status`, `created_at`, `updated_at`) VALUES
(3, 2, 7, 17, 22, 'Guchi', 'গুচি', 'guchi', 'গুচি', 'g100', '25', 'guchi,jacket', 'গুচি,জ্যাকেট', 'Small,Midium,Large', 'ছোট ,মাঝারি ,বড়', 'red,Black,Amet', 'লাল ,কালো ,আমেট', '1800', '1700', 'Body-camera footage shows the officer walking into a Tufesa bus station', 'বডি-ক্যামেরার ফুটেজে দেখা যাচ্ছে অফিসার তুফেসা বাস স্টেশনে হেঁটে যাচ্ছেন', '<p>These examples are programmatically compiled from various online sources to illustrate current usage of the word &#39;sports jacket.&#39; Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors</p>', '<p>এই উদাহরণগুলি &#39;স্পোর্টস জ্যাকেট&#39; শব্দের বর্তমান ব্যবহার চিত্রিত করার জন্য বিভিন্ন অনলাইন উত্স থেকে প্রোগ্রামেটিকভাবে সংকলিত হয়েছে৷ উদাহরণগুলিতে প্রকাশিত কোনও মতামত মেরিয়াম-ওয়েবস্টার বা এর সম্পাদকদের প্রতিনিধিত্ব করে না</p>', 'upload/products/thambnail/1768613802279467.jpeg', 1, 1, 1, 1, 1, '2023-06-13 12:39:19', '2023-07-17 04:58:52'),
(4, 7, 10, 27, 32, 'Xtreme K911 USB Mini Keyboard', 'Xtreme K911 USB মিনি কীবোর্ড', 'xtreme-k911-usb-mini-keyboard', 'Xtreme-K911-USB-মিনি-কীবোর্ড', 'x101', '10', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'Small,Midium,Large', 'red,Black,Amet', 'red,Black,Large', '720', '700', 'Adjustable breathing speed rate of LED light', 'LED আলোর সামঞ্জস্যযোগ্য শ্বাসের গতির হার', '<p>Adjustable breathing speed rate of LED light,<br />\r\n104 standard keys, 2 adjusting gears for input speed,<br />\r\n19 non-conflict keys &amp; 12 multimedia keys,<br />\r\nUnremovable laser-engraved chocolate keycaps</p>', '<p>LED আলোর সামঞ্জস্যযোগ্য শ্বাসের গতির হার,<br />\r\n104টি স্ট্যান্ডার্ড কী, ইনপুট গতির জন্য 2টি সামঞ্জস্যকারী গিয়ার,<br />\r\n19টি অ-দ্বন্দ্ব কী এবং 12টি মাল্টিমিডিয়া কী,<br />\r\nঅপসারণযোগ্য লেজার-খোদাই করা চকোলেট কীক্যাপ</p>', 'upload/products/thambnail/1768614691353240.jpeg', 1, 1, 1, 1, 1, '2023-06-13 12:53:26', NULL),
(5, 4, 7, 16, 20, 'Polo t-shirt', 'পোলো টি-শার্ট', 'polo-t-shirt', 'পোলো-টি-শার্ট', 'p101', '40', 'Lorem,Ipsum,Amet', 'সুন্দর,শার্ট', 'Small,Midium,Large', 'ছোট,বড়,মধ্যম', 'red,Black,Amet', 'লাল,কালো', '1120', NULL, 'Product Type: Polo', 'বিজ্ঞানের চাইতেও সুন্দর', '<pre style=\"text-align:left\">\r\nMore beautiful than the picture/science, in short you can&#39;t get better than this at this price, impossibly beautiful seller&#39;s use is very sincere❤️❤️❤️</pre>', '<p>ছবি/বিজ্ঞানের চাইতেও সুন্দর, এক কথায় এই মূল্যে এর চাইতে ভালো আর আসা করা যায়না, অসম্ভব সু-ন্দ-র বিক্রেতার ব্যবহার খুবই আন্তরিক❤️❤️❤️</p>', 'upload/products/thambnail/1771666499551626.jpeg', NULL, 1, NULL, 1, 1, '2023-07-17 05:20:38', NULL),
(6, 7, 7, 15, 21, 'Apex', 'এপেক্স', 'apex', 'এপেক্স', 'a1', '56', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'Small,Midium,Large', 'red,Black,Amet', 'red,Black,Large', '900', '850', 'Stylish Running Sports Sneakers Casual Lace-Up Shoes Winter And Summer Men\'S Shoes', 'স্টাইলিশ রানিং স্পোর্টস স্নিকার্স নৈমিত্তিক লেস-আপ জুতা শীত এবং গ্রীষ্মে পুরুষদের জুতা - ছেলেদের জন্য জুতা', '<p>Stylish Running Sports Sneakers Casual Lace-Up Shoes Winter And Summer Men&#39;S Shoes - Shoe For Boys - Shoe For Boys - Insoles For Shoes - Shoe For Boys - White Shoes</p>', '<p>স্টাইলিশ রানিং স্পোর্টস স্নিকার্স নৈমিত্তিক লেস-আপ জুতা শীত এবং গ্রীষ্মে পুরুষদের জুতা - ছেলেদের জন্য জুতা - ছেলেদের জন্য জুতা - জুতার জন্য ইনসোল - ছেলেদের জন্য জুতা - সাদা জুতা</p>', 'upload/products/thambnail/1771754473713961.jpeg', NULL, NULL, 1, 1, 1, '2023-07-18 04:38:57', '2023-07-18 04:38:57'),
(7, 2, 9, 14, 19, 'router', 'ক্যামেরা', 'router', 'ক্যামেরা', 'c1', '12', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'Small,Midium,Large', 'red,Black,Amet', 'red,Black,Large', '12000', '11000', 'A router receives and sends data on computer networks.', 'একটি রাউটার কম্পিউটার নেটওয়ার্কে ডেটা গ্রহণ করে এবং পাঠায়।', '<p>Routers are sometimes confused with network hubs, modems, or network switches. However, routers can combine the functions of these components, and connect with these devices, to improve Internet access or help create business networks.</p>', '<p>রাউটারগুলি কখনও কখনও নেটওয়ার্ক হাব, মডেম বা নেটওয়ার্ক সুইচগুলির সাথে বিভ্রান্ত হয়। যাইহোক, রাউটারগুলি এই উপাদানগুলির ফাংশনগুলিকে একত্রিত করতে পারে এবং ইন্টারনেট অ্যাক্সেস উন্নত করতে বা ব্যবসায়িক</p>', 'upload/products/thambnail/1771754694236737.jpeg', 1, NULL, NULL, 1, 1, '2023-07-18 04:42:27', '2023-07-18 04:42:27'),
(8, 4, 10, 27, 32, 'Monitor', 'মনিটর', 'monitor', 'মনিটর', 'r1', '12', 'Lorem,Ipsum,Amet', 'Lorem,Ipsum,Amet', 'Small,Midium,Large', 'Small,Midium,Large', 'red,Black,Amet', 'red,Black,Large', '3000', '2700', 'A monitor is a piece of computer hardware that displays the video and graphics', 'মনিটর হল কম্পিউটার হার্ডওয়্যারের একটি অংশ যা কম্পিউটারের ভিডিও', '<p>A monitor is <strong>a piece of computer hardware that displays the video and graphics information generated by a connected computer through the computer&#39;s video card</strong>.</p>', '<pre style=\"text-align:left\">\r\nমনিটর হল কম্পিউটার হার্ডওয়্যারের একটি অংশ যা কম্পিউটারের ভিডিও কার্ডের মাধ্যমে সংযুক্ত কম্পিউটার দ্বারা উত্পন্ন ভিডিও এবং গ্রাফিক্স তথ্য প্রদর্শন করে।</pre>', 'upload/products/thambnail/1771754892332536.jpeg', NULL, 1, 1, NULL, 1, '2023-07-18 04:45:35', '2023-07-18 04:45:35');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bT17m2bB3swawaQeF6yTQg7NYULyGfazmfqLRSdY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjVsSWFwS0Y2cjY2NW9neFZtUlE2SWZDVHNkY1RwT1lPc1pVRjRHYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1690966260),
('vNGHqIAzFsIjjKX3ZI0n2z8Lp3NEytzKom5qMB32', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', 'YTo1OntzOjM6InVybCI7YTowOnt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NjoiX3Rva2VuIjtzOjQwOiJsUG41N1VqM0hrSjNJZ2NNbVNna1l5Y0JiN3NTUWhDcERka2VsZnBJIjtzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCROOHJweGpmRXZ2Q3AyQVIyZzNEOHJ1N3gyMzgvMkdDd0x3cU1mSlBxWEExR3YvNFJWcUVSVyI7fQ==', 1690966650);

-- --------------------------------------------------------

--
-- Table structure for table `ship_districts`
--

CREATE TABLE `ship_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_districts`
--

INSERT INTO `ship_districts` (`id`, `division_id`, `district_name`, `created_at`, `updated_at`) VALUES
(1, 2, 'Savar', '2023-07-26 00:47:05', NULL),
(3, 2, 'Narayangonj', '2023-07-26 00:47:56', NULL),
(4, 8, 'Barguna', '2023-07-26 00:48:16', NULL),
(5, 4, 'Cox\'s Bazar', '2023-07-26 00:48:33', NULL),
(6, 6, 'Jhenaidah', '2023-07-26 00:48:49', NULL),
(7, 5, 'Jamalpur', '2023-07-26 00:49:56', NULL),
(8, 1, 'Chapainawabgonj', '2023-07-26 00:50:11', NULL),
(9, 7, 'ponchogor', '2023-07-26 00:50:24', NULL),
(10, 9, 'Sunamgonj', '2023-07-26 00:50:36', NULL),
(11, 1, 'Naogoan', '2023-07-27 04:56:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_divisions`
--

CREATE TABLE `ship_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_divisions`
--

INSERT INTO `ship_divisions` (`id`, `division_name`, `created_at`, `updated_at`) VALUES
(1, 'Rajshahi', '2023-07-26 00:27:10', NULL),
(2, 'Dhaka', '2023-07-26 00:27:21', NULL),
(4, 'Chittagong', '2023-07-26 00:32:33', NULL),
(5, 'Mymensing', '2023-07-26 00:32:46', NULL),
(6, 'Khulna', '2023-07-26 00:33:03', NULL),
(7, 'Rangpur', '2023-07-26 00:33:14', NULL),
(8, 'Barishal', '2023-07-26 00:33:43', NULL),
(9, 'Shylet', '2023-07-26 00:33:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ship_states`
--

CREATE TABLE `ship_states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ship_states`
--

INSERT INTO `ship_states` (`id`, `division_id`, `district_id`, `state_name`, `created_at`, `updated_at`) VALUES
(2, 1, 8, 'Ranihati', '2023-07-26 01:08:19', NULL),
(3, 1, 8, 'Shibganj', '2023-07-27 04:37:15', NULL),
(4, 2, 3, 'Fatulla', '2023-07-27 04:37:45', NULL),
(5, 1, 11, 'Sapahar', '2023-07-27 04:56:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_img` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_img`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'upload/slider/1771675309900122.jpg', 'New Collection', 'Slider one is now visable', 1, NULL, '2023-07-17 07:50:45'),
(2, 'upload/slider/1771673455709283.jpg', 'Slider Two', 'Slider two is now visable', 1, NULL, NULL),
(4, 'upload/slider/1771675715734214.jpg', 'New arraiva', 'New arraival product is here', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name_en` varchar(255) NOT NULL,
  `subcategory_name_bn` varchar(255) NOT NULL,
  `subcategory_slug_en` varchar(255) NOT NULL,
  `subcategory_slug_bn` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `subcategory_name_en`, `subcategory_name_bn`, `subcategory_slug_en`, `subcategory_slug_bn`, `created_at`, `updated_at`) VALUES
(9, 11, 'Makeup', 'মেকআপ', 'makeup', 'মেকআপ', NULL, NULL),
(10, 11, 'Skin', 'চামড়া', 'skin', 'চামড়া', NULL, NULL),
(11, 11, 'Hair', 'চুল', 'hair', 'চুল', NULL, NULL),
(12, 9, 'Camera', 'ক্যামেরা', 'camera', 'ক্যামেরা', NULL, NULL),
(13, 9, 'Camera Accessories', 'ক্যামেরা আনুষাঙ্গিক', 'camera-accessories', 'ক্যামেরা-আনুষাঙ্গিক', NULL, NULL),
(14, 9, 'Health Care Appliances', 'স্বাস্থ্য পরিচর্যা যন্ত্রপাতি', 'health-care-appliances', 'স্বাস্থ্য-পরিচর্যা-যন্ত্রপাতি', NULL, NULL),
(15, 7, 'Footwear', 'পাদুকা', 'footwear', 'পাদুকা', NULL, NULL),
(16, 7, 'Clothing', 'পোশাক', 'clothing', 'পোশাক', NULL, NULL),
(17, 7, 'Winter Wear', 'Winter Wear', 'winter-wear', 'Winter-Wear', NULL, NULL),
(18, 13, 'Kitchen, Cookware & Serveware', 'রান্নাঘর, কুকওয়্যার এবং সার্ভওয়্যার', 'kitchen,-cookware-&-serveware', 'রান্নাঘর,-কুকওয়্যার-এবং-সার্ভওয়্যার', NULL, NULL),
(19, 13, 'Home Decor', 'ঘর সজ্জা', 'home-decor', 'ঘর-সজ্জা', NULL, NULL),
(20, 14, 'Rice', 'ভাত', 'rice', 'ভাত', NULL, NULL),
(21, 14, 'Oil', 'তেল', 'oil', 'তেল', NULL, NULL),
(22, 12, 'Kitchen Storage', 'রান্নাঘর স্টোরেজ', 'kitchen-storage', 'রান্নাঘর-স্টোরেজ', NULL, NULL),
(23, 12, 'Home Improvement', 'হোম উন্নতি', 'home-improvement', 'হোম-উন্নতি', NULL, NULL),
(24, 8, 'Xiaomi', 'শাওমি', 'xiaomi', 'শাওমি', NULL, NULL),
(25, 8, 'iPhone', 'আইফোন', 'iphone', 'আইফোন', NULL, NULL),
(26, 10, 'Kitchen Appliances', 'রান্নাঘর যন্ত্রপাতি', 'kitchen-appliances', 'রান্নাঘর-যন্ত্রপাতি', NULL, NULL),
(27, 10, 'Top Brands', 'শীর্ষ ব্র্যান্ড', 'top-brands', 'শীর্ষ-ব্র্যান্ড', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_sub_categories`
--

CREATE TABLE `sub_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `subsubcategory_name_en` varchar(255) NOT NULL,
  `subsubcategory_name_bn` varchar(255) NOT NULL,
  `subsubcategory_slug_en` varchar(255) NOT NULL,
  `subsubcategory_slug_bn` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_sub_categories`
--

INSERT INTO `sub_sub_categories` (`id`, `category_id`, `subcategory_id`, `subsubcategory_name_en`, `subsubcategory_name_bn`, `subsubcategory_slug_en`, `subsubcategory_slug_bn`, `created_at`, `updated_at`) VALUES
(11, 11, 11, 'Hair Care', 'চুলের যত্ন', 'hair-care', 'চুলের-যত্ন', NULL, NULL),
(12, 11, 11, 'Hair styling', 'চুলের সুন্দর্য', 'hair-styling', 'চুলের-সুন্দর্য', NULL, NULL),
(13, 11, 9, 'Face', 'মুখ', 'face', 'মুখ', NULL, NULL),
(14, 11, 9, 'Eyes', 'চোখ', 'eyes', 'চোখ', NULL, NULL),
(15, 11, 10, 'K- Beauty', 'কে- সৌন্দর্য', 'k--beauty', 'কে--সৌন্দর্য', NULL, NULL),
(16, 11, 10, 'Skin Lightening', 'স্কিন লাইটেনিং', 'skin-lightening', 'স্কিন-লাইটেনিং', NULL, NULL),
(17, 9, 12, 'DSLR & Mirrorless', 'DSLR এবং মিররলেস', 'dslr-&-mirrorless', 'DSLR-এবং-মিররলেস', NULL, NULL),
(18, 9, 13, 'Lens', 'লেন্স', 'lens', 'লেন্স', NULL, NULL),
(19, 9, 14, 'Weighing Scale', 'ওজন মাপকাঠি', 'weighing-scale', 'ওজন-মাপকাঠি', NULL, NULL),
(20, 7, 16, 'T-Shirts', 'টি-শার্ট', 't-shirts', 'টি-শার্ট', NULL, NULL),
(21, 7, 15, 'Heels', 'হিল', 'heels', 'হিল', NULL, NULL),
(22, 7, 17, 'Jackets', 'জ্যাকেট', 'jackets', 'জ্যাকেট', NULL, NULL),
(23, 13, 19, 'Paintings', 'পেইন্টিং', 'paintings', 'পেইন্টিং', NULL, NULL),
(24, 13, 18, 'Pressure Cookers', 'প্রেসার কুকার', 'pressure-cookers', 'প্রেসার-কুকার', NULL, NULL),
(25, 14, 20, 'Nazirshail Rice Premium', 'নাজিরশাইল রাইস প্রিমিয়াম', 'nazirshail-rice-premium', 'নাজিরশাইল-রাইস-প্রিমিয়াম', NULL, NULL),
(26, 14, 21, 'Teer Fortified Soyabean Oil', 'Teer Fortified সয়াবিন তেল', 'teer-fortified-soyabean-oil', 'Teer-Fortified-সয়াবিন-তেল', NULL, NULL),
(27, 12, 23, 'Home Utilities & Organizers', 'হোম ইউটিলিটি এবং সংগঠক', 'home-utilities-&-organizers', 'হোম-ইউটিলিটি-এবং-সংগঠক', NULL, NULL),
(28, 12, 22, 'Lunch Boxes', 'দুপুরের খাবারের বাক্স', 'lunch-boxes', 'দুপুরের-খাবারের-বাক্স', NULL, NULL),
(29, 8, 25, 'Apple IPhone SE 2020', 'অ্যাপল আইফোন এসই 2020', 'apple-iphone-se-2020', 'অ্যাপল-আইফোন-এসই-2020', NULL, NULL),
(30, 8, 25, 'realme Narzo 10', 'রেলমে নাৰ্জা ১০', 'realme-narzo-10', 'রেলমে-নাৰ্জা-১০', NULL, NULL),
(31, 10, 26, 'Induction Cooktops', 'ইন্ডাকশন কুকটপস', 'induction-cooktops', 'ইন্ডাকশন-কুকটপস', NULL, NULL),
(32, 10, 27, 'Livpure', 'লিভপুর', 'livpure', 'লিভপুর', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `last_seen` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `last_seen`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'user', 'user@gmail.com', '01752505549', NULL, NULL, '$2y$10$kAr8hbDv7yNMySbkQxcxiOmfz/i2kLQbbRI5h8yf/vGleSCG54RbK', NULL, NULL, NULL, '1IEJFKRxcivwlMYAbdhOt9dy1WIunUyvoPaA5bdoORKmSlzGjzvICemiLv3p', NULL, '2023061108012.png', '2023-06-02 07:57:54', '2023-06-11 02:38:31'),
(2, 'ab', 'ab@gmail.com', '0187325454', NULL, NULL, '$2y$10$CYTXPTqAx5vwGJ3V0mstq.DwChxy40Eq8cF6eCmDTFl4hLzuRNQ5C', NULL, NULL, NULL, '1Czg3uLRFmsXzKzkimhZgO4L8tyVaON0mOdw75ZkS0DOTkbVRzk0jWut1Ids', NULL, '202307290859avatar-1.png', '2023-06-07 05:07:04', '2023-07-29 02:59:25'),
(3, 'test', 'test@gmail.com', NULL, NULL, NULL, '$2y$10$NXw4FQf54Ky2kirID9fJuOIRKxmiT9jEo5pHC0SJsghWqd.ct4qfe', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-02 02:44:58', '2023-08-02 02:44:58'),
(4, 'cc', 'cc@gmail.com', NULL, NULL, NULL, '$2y$10$N8rpxjfEvvCp2AR2g3D8ru7x238/2GCwLwqMfJPqXA1Gv/4RVqERW', NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-02 02:57:20', '2023-08-02 02:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(3, 1, 4, '2023-07-25 00:02:32', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `ship_districts`
--
ALTER TABLE `ship_districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_divisions`
--
ALTER TABLE `ship_divisions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ship_states`
--
ALTER TABLE `ship_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ship_districts`
--
ALTER TABLE `ship_districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ship_divisions`
--
ALTER TABLE `ship_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `ship_states`
--
ALTER TABLE `ship_states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sub_sub_categories`
--
ALTER TABLE `sub_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
