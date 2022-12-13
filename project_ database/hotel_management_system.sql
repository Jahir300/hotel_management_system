-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 03:14 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `checkin_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `facilities` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` int(1) DEFAULT NULL,
  `transection_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Master', 'master', 'master-2022-06-22-62b2f011a12f9.jpeg', '2022-06-22 04:33:53', '2022-06-22 04:33:53'),
(7, 'Deluxe', 'deluxe', 'deluxe-2022-06-22-62b30bdecb3e5.jpg', '2022-06-22 06:32:30', '2022-06-22 06:32:30'),
(8, 'Luxury', 'luxury', 'luxury-2022-06-22-62b36695f1d89.jpg', '2022-06-22 12:59:33', '2022-06-22 12:59:33'),
(9, 'Classic', 'classic', 'classic-2022-06-23-62b41e33c8175.jpg', '2022-06-23 02:02:59', '2022-06-23 02:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Ahmed', 'ahmedali@gmail.com', 'To make a reservation', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 0, '2022-07-27 15:46:33', '2022-07-27 15:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `facilitiys`
--

CREATE TABLE `facilitiys` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(9) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `facilitiys`
--

INSERT INTO `facilitiys` (`id`, `category_id`, `name`, `slug`, `description`, `image`, `price`, `created_at`, `updated_at`) VALUES
(5, 7, 'Breakfast', 'breakfast', 'Parotta with omelets. with free coffee!', 'breakfast-2022-06-22-62b32a13f3cdf.jpg', 120, '2022-06-22 08:41:24', '2022-10-26 01:50:43'),
(9, 2, 'Launch', 'launch', 'Kacci biriyani.', 'launch-2022-06-25-62b76b20e5db9.jpg', 200, '2022-06-25 14:08:00', '2022-10-26 01:51:25'),
(12, 2, 'Dinner', 'dinner', 'Dinner facility example are showing below.', 'dinner-2022-06-25-62b77020d9936.jpg', 200, '2022-06-25 14:29:20', '2022-10-26 01:51:20'),
(13, 7, 'Menu 4', 'menu-4', 'example menu four', 'menu-4-2022-06-25-62b77104dfa25.jpg', 220, '2022-06-25 14:33:08', '2022-10-26 01:51:10'),
(14, 7, 'Menu 5', 'menu-5', 'example menu five', 'menu-5-2022-06-25-62b7712725d66.jpg', 230, '2022-06-25 14:33:43', '2022-10-26 01:51:00'),
(15, 2, 'Menu 6', 'menu-6', 'example menu six', 'menu-6-2022-06-25-62b771582c8c0.jpg', 299, '2022-06-25 14:34:32', '2022-10-26 01:50:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2022_06_19_180326_create_roles_table', 1),
(8, '2022_06_21_194204_create_categories_table', 1),
(9, '2022_06_22_124110_create_facilitiys_table', 2),
(10, '2022_06_22_174327_create_rooms_table', 3),
(11, '2022_06_30_052912_create_bookings_table', 4),
(12, '2022_07_25_174523_create_pendings_table', 5),
(13, '2022_07_27_142745_create_contacts_table', 6),
(14, '2022_07_29_063514_create_notifications_table', 7),
(15, '2022_08_07_183210_create_payments_table', 8),
(16, '2022_11_29_175517_create_sliders_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptions` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `descriptions`, `created_at`, `updated_at`) VALUES
(1, 'New Notification', 'This is the new notification from admin.', '2022-07-29 01:01:11', '2022-07-29 01:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `room_id` int(10) UNSIGNED NOT NULL,
  `transection_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendings`
--

CREATE TABLE `pendings` (
  `id` int(10) UNSIGNED NOT NULL,
  `checkin_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checkout_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', NULL, NULL),
(2, 'Guest', 'guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bed` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `person` int(9) NOT NULL,
  `price` int(9) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `category_id`, `name`, `slug`, `description`, `image`, `bed`, `person`, `price`, `is_available`, `created_at`, `updated_at`) VALUES
(1, 7, 'Hill View', 'hill-view', 'No need to go outside. Hill can be visible in this room.', 'hill-view-2022-06-22-62b35a8476757.jpg', 'single', 1, 4500, 1, '2022-06-22 12:08:04', '2022-10-31 16:35:57'),
(2, 7, 'Ocean View', 'ocean-view', 'ocean view room', 'ocean-view-2022-06-22-62b35ebd0359a.jpg', 'single', 1, 5000, 1, '2022-06-22 12:26:05', '2022-10-31 15:18:36'),
(6, 8, 'Luxury', 'luxury', 'luxurious bedroom', 'luxury-2022-06-26-62b83e7086bb1.jpg', 'single', 1, 6200, 1, '2022-06-22 13:00:28', '2022-10-26 01:49:26'),
(7, 8, 'Luxury 2', 'luxury-2', 'luxurious bedroom 2', 'luxury-2-2022-06-22-62b366e97869a.jpg', 'single', 1, 4000, 1, '2022-06-22 13:00:57', '2022-10-26 01:48:50'),
(8, 8, 'Luxury 3', 'luxury-3', 'luxurious bedroom 2', 'luxury-3-2022-06-22-62b3670724bf1.jpg', 'single', 1, 2500, 1, '2022-06-22 13:01:27', '2022-10-26 01:49:07'),
(9, 2, 'Ocean View 2', 'ocean-view-2', '\'ocean-view\' simply means you get at least a sliver of a view from somewhere in the room.', 'ocean-view-2-2022-06-26-62b83dbf3b6a4.jpg', 'single', 1, 3010, 1, '2022-06-26 05:06:39', '2022-10-26 01:48:21'),
(10, 2, 'Ocean View 3', 'ocean-view-3', '\'ocean-view\' simply means you get at least a sliver of a view from somewhere in the room.', 'ocean-view-3-2022-06-26-62b83de88951c.jpg', 'single', 1, 3300, 1, '2022-06-26 05:07:20', '2022-10-26 01:50:05'),
(11, 9, 'Classic room', 'classic-room', 'Bedroom. Comfortable room decorated in pastel tones. Standard rooms are equipped with shower or bathtub.', 'classic-room-2022-06-26-62b83f916b31e.jpg', 'single', 1, 2900, 1, '2022-06-26 05:14:25', '2022-10-26 01:50:19'),
(14, 9, 'Classic 2', 'classic-2', 'Classic room', 'classic-2-2022-10-26-6358e4b041caf.jpg', 'single', 1, 5500, 1, '2022-10-26 01:34:41', '2022-10-26 01:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `description`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'New on Deluxe!', 'Start from January.', 'slider-1-2022-11-29-63866638d587d.jpg', 1, '2022-11-29 14:05:59', '2022-11-29 15:12:28'),
(3, '24/7 Security', 'We ensure the safety first', '2022-11-29-6386672ca2a20.jpg', 1, '2022-11-29 14:10:20', '2022-11-29 14:10:20'),
(4, 'Visit our Restaurant', 'Don\'t miss to visit our reataurant', '2022-11-29-638667f9cc231.jpg', 0, '2022-11-29 14:13:45', '2022-12-13 07:27:52'),
(5, 'Friendly Environment', 'Calm and Quite AC room', '2022-11-29-6386888b6bab2.jpg', 1, '2022-11-29 16:32:43', '2022-11-29 16:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 2,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `email`, `password`, `remember_token`, `image`, `created_at`, `updated_at`) VALUES
(2, 2, 'Guest', 'Guest', 'guest@gmail.com', '$2y$10$0Gvz89XfB3vy.SvNhUlz2.yxT1tXu81l0jtna55kyPBit5YbRA4cm', 'SB5DjqdFQcR2DMmIsi6snD94rbMsIXvKyLB5IU3MN2ylO96dQrltljxkc68L', NULL, '2022-06-11 07:27:45', '2022-07-29 00:05:13'),
(5, 1, 'Tasnim', 'Tasnim', 'tasnim@gmail.com', '$2y$10$1KplU7NuY9UT8YGUC7pwq.FmqsgmKtrC.hOquTsVjac25cKLmc1f2', 'JMiX9lUz5PVUyhte0ZHd9r2HThB79nUiyaOF1MgFllIZBAuQU3GBEtb42KZU', NULL, '2022-11-27 01:25:42', '2022-11-27 01:25:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_room_id_foreign` (`room_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facilitiys`
--
ALTER TABLE `facilitiys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facilitiys_category_id_foreign` (`category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_room_id_foreign` (`room_id`);

--
-- Indexes for table `pendings`
--
ALTER TABLE `pendings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_category_id_foreign` (`category_id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `facilitiys`
--
ALTER TABLE `facilitiys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pendings`
--
ALTER TABLE `pendings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `facilitiys`
--
ALTER TABLE `facilitiys`
  ADD CONSTRAINT `facilitiys_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
