-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11 يونيو 2026 الساعة 14:56
-- إصدار الخادم: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- بنية الجدول `aid_requests`
--

CREATE TABLE `aid_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_type` enum('document_recovery','housing','education','healthcare','psychosocial','other') NOT NULL,
  `description` text NOT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `status` enum('pending','approved','assigned','completed','rejected') DEFAULT 'pending',
  `assigned_to` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `aid_requests`
--

INSERT INTO `aid_requests` (`id`, `user_id`, `request_type`, `description`, `contact_phone`, `status`, `assigned_to`, `created_at`, `updated_at`) VALUES
(1, 2, 'housing', 'new home::\r\n', NULL, 'completed', NULL, '2026-05-20 09:05:34', '2026-06-07 07:51:13'),
(2, 3, 'healthcare', 'تست\r\n', '0599685685', 'pending', NULL, '2026-05-20 09:26:40', '2026-05-20 09:26:40'),
(3, 4, 'healthcare', 'care__', '0599685685', 'completed', NULL, '2026-05-20 12:01:07', '2026-05-22 12:33:46'),
(4, 2, 'psychosocial', 'testone\r\n', '0599866952', 'pending', NULL, '2026-06-07 08:24:09', '2026-06-07 08:24:09'),
(5, 7, 'psychosocial', 'جلسة علاج ', '0599866952', 'pending', NULL, '2026-06-07 13:10:04', '2026-06-07 13:10:04');

-- --------------------------------------------------------

--
-- بنية الجدول `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `governorate_id` int(11) NOT NULL,
  `area_name` varchar(100) NOT NULL,
  `is_safe` tinyint(1) DEFAULT 0,
  `has_water` tinyint(1) DEFAULT 0,
  `has_electricity` tinyint(1) DEFAULT 0,
  `has_health_center` tinyint(1) DEFAULT 0,
  `has_school` tinyint(1) DEFAULT 0,
  `needs_reconstruction` tinyint(1) DEFAULT 1,
  `safety_level` enum('low','medium','high') DEFAULT 'low',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `areas`
--

INSERT INTO `areas` (`id`, `governorate_id`, `area_name`, `is_safe`, `has_water`, `has_electricity`, `has_health_center`, `has_school`, `needs_reconstruction`, `safety_level`, `created_at`) VALUES
(1, 1, 'جباليا (البلد)', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(2, 1, 'مخيم جباليا', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(3, 1, 'بيت لاهيا', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(4, 1, 'بيت حانون', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(5, 1, 'أم النصر', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(6, 1, 'عزبة بيت حانون', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(7, 1, 'تل الزعتر', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(8, 1, 'بئر النعجة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(9, 2, 'البلدة القديمة', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(10, 2, 'التفاح', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(11, 2, 'الدرج', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(12, 2, 'الرمال (الشمالي والجنوبي)', 1, 1, 1, 1, 1, 0, 'medium', '2026-05-20 09:54:56'),
(13, 2, 'الزيتون', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(14, 2, 'الشجاعية', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(15, 2, 'الشيخ رضوان', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(16, 2, 'الشيخ عجلين', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(17, 2, 'الصبرة', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(18, 2, 'تل الهوى', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(19, 2, 'حي النصر', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(20, 2, 'مخيم الشاطئ', 1, 1, 1, 1, 1, 1, 'medium', '2026-05-20 09:54:56'),
(21, 2, 'الزهراء', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(22, 2, 'المغراقة (أبو مدين)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(23, 2, 'جحر الديك', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(24, 3, 'دير البلح (البلد)', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(25, 3, 'النصيرات', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(26, 3, 'المغازي', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(27, 3, 'البريج', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(28, 3, 'الزوايدة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(29, 3, 'المصدر', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(30, 3, 'وادي السلقا', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(31, 3, 'حي بشارة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(32, 3, 'حي قاعود', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(33, 3, 'حي السلام (دير البلح)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(34, 3, 'حي المشاعلة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(35, 3, 'حي الموراس', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(36, 3, 'حي المطاين', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(37, 3, 'منطقة المحطة', 0, 0, 0, 0, 0, 1, 'high', '2026-05-20 09:54:56'),
(38, 3, 'منطقة البركة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(39, 3, 'منطقة البصة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(40, 3, 'منطقة حكر الجامع', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(41, 3, 'منطقة المعسكر (دير البلح)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(42, 4, 'خان يونس (البلد)', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(43, 4, 'بني سهيلا', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(44, 4, 'عبسان الكبيرة', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(45, 4, 'عبسان الجديدة (الصغير)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(46, 4, 'خزاعة', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(47, 4, 'القرارة', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(48, 4, 'الفخاري', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(49, 4, 'حي مركز المدينة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(50, 4, 'حي الشيخ ناصر', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(51, 4, 'حي البطن السمين', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(52, 4, 'حي المعسكر (خان يونس)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(53, 4, 'حي الأمل', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(54, 4, 'حي معن', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(55, 4, 'حي جورت اللوت', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(56, 4, 'حي قيزان النجار', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(57, 4, 'حي قيزان أبو رشوان', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(58, 4, 'حي قاع القرين', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(59, 4, 'حي المنارة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(60, 4, 'حي المحطة', 0, 0, 1, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(61, 4, 'حي الكتيبة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(62, 4, 'حي السطر', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(63, 4, 'حي الجلاء', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(64, 4, 'حي النصر (خان يونس)', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(65, 4, 'حي التحرير', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(66, 4, 'المواصي', 1, 1, 1, 1, 1, 0, 'high', '2026-05-20 09:54:56'),
(67, 5, 'رفح (البلد)', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(68, 5, 'مخيم رفح', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(69, 5, 'حي البرازيل', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(70, 5, 'حي الجنينة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(71, 5, 'خربة العدس', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(72, 5, 'التنور والمشروع', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(73, 5, 'حي السلام', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(74, 5, 'الشعوث والبراهمة', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(75, 5, 'حي الزعاربة (رفح الغربية)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(76, 5, 'حي الحشاش', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(77, 5, 'تل السلطان', 0, 1, 1, 1, 1, 1, 'low', '2026-05-20 09:54:56'),
(78, 5, 'شوكة الصوفي', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(79, 5, 'البيوك', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(80, 5, 'مصبح', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(81, 5, 'مشروع عامر', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(82, 5, 'النصر (رفح)', 0, 0, 0, 0, 0, 1, 'low', '2026-05-20 09:54:56'),
(84, 4, 'شارع البحر', 1, 1, 1, 1, 1, 1, 'high', '2026-05-22 12:14:53');

-- --------------------------------------------------------

--
-- بنية الجدول `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `governorates`
--

CREATE TABLE `governorates` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `governorates`
--

INSERT INTO `governorates` (`id`, `name`) VALUES
(4, 'خان يونس'),
(3, 'دير البلح'),
(5, 'رفح'),
(1, 'شمال غزة'),
(2, 'غزة');

-- --------------------------------------------------------

--
-- بنية الجدول `losses`
--

CREATE TABLE `losses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_type` enum('id_card','property_deed','medical_report','education_cert','house_damage','personal_item','other') NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file_path` varchar(500) NOT NULL,
  `loss_date` date DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `losses`
--

INSERT INTO `losses` (`id`, `user_id`, `document_type`, `title`, `description`, `file_path`, `loss_date`, `status`, `created_at`) VALUES
(1, 4, 'education_cert', 'شهادة ثانوية عامة', '..........', 'uploads/losses/1779278383_iesco.jpeg', '2026-05-08', 'pending', '2026-05-20 11:59:43'),
(2, 4, 'id_card', 'هويتي', '.........هوية 2019', 'uploads/losses/1779278431_Laptop.jpg', '2026-05-13', 'pending', '2026-05-20 12:00:31'),
(3, 3, 'medical_report', 'medical_', 'medical page report...', 'uploads/losses/1779363687_التعامل مع الملفات في بايثون.pdf', '2026-05-12', 'pending', '2026-05-21 11:41:27'),
(4, 3, 'id_card', 'iiii', 'oo', 'uploads/losses/1779619950_Database project description.pdf', '2026-05-24', 'pending', '2026-05-24 10:52:30'),
(5, 2, 'personal_item', 'جواز سفر', 'جوازي لونه اخضر', 'uploads/losses/1780819252_Laptop.jpg', '2026-06-05', 'pending', '2026-06-07 08:00:52'),
(6, 2, '', 'عقار', 'شركة مبنى', 'uploads/losses/1780819802_Guidelines for High Quality PPT_Designer_EN_0527 (1).pdf', '2024-02-11', 'pending', '2026-06-07 08:10:02'),
(7, 2, 'personal_item', 'شهادة جامعة', 'شهادة تخرج', 'uploads/losses/1781090741_Certificate of Completion (4) (1).pdf', '2026-06-12', 'pending', '2026-06-10 11:25:41');

-- --------------------------------------------------------

--
-- بنية الجدول `mental_appointments`
--

CREATE TABLE `mental_appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `specialist_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `communication_method` enum('call','video') DEFAULT 'video',
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mental_appointments`
--

INSERT INTO `mental_appointments` (`id`, `user_id`, `specialist_id`, `appointment_date`, `appointment_time`, `communication_method`, `status`, `created_at`) VALUES
(1, 3, 2, '2026-06-06', '10:00:00', 'call', 'pending', '2026-06-06 15:34:47'),
(2, 3, 1, '2026-06-06', '10:00:00', 'video', 'pending', '2026-06-06 15:41:02'),
(3, 3, 1, '2026-06-06', '10:00:00', 'call', 'pending', '2026-06-06 15:42:24'),
(4, 3, 1, '2026-06-06', '10:00:00', 'call', 'cancelled', '2026-06-06 15:45:25'),
(5, 3, 3, '2026-06-06', '10:00:00', 'call', 'pending', '2026-06-06 15:47:47'),
(6, 3, 2, '2026-06-06', '10:00:00', 'call', 'pending', '2026-06-06 15:52:58'),
(7, 3, 3, '2026-06-06', '10:00:00', 'call', 'cancelled', '2026-06-06 15:54:16'),
(8, 3, 2, '2026-06-06', '10:00:00', 'call', 'pending', '2026-06-06 16:04:44'),
(9, 3, 2, '2026-06-07', '10:00:00', 'call', 'cancelled', '2026-06-06 16:05:28'),
(10, 3, 3, '2026-06-07', '12:00:00', 'call', 'pending', '2026-06-06 16:05:52'),
(11, 7, 2, '2026-06-08', '14:00:00', 'call', 'pending', '2026-06-07 10:36:06'),
(12, 7, 1, '2026-06-09', '14:00:00', 'call', 'pending', '2026-06-07 11:55:55'),
(13, 2, 2, '2026-06-11', '14:00:00', 'call', 'pending', '2026-06-10 11:27:50');

-- --------------------------------------------------------

--
-- بنية الجدول `mental_articles`
--

CREATE TABLE `mental_articles` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(100) NOT NULL,
  `read_time` varchar(50) NOT NULL,
  `badge_text` varchar(50) NOT NULL,
  `badge_color` varchar(30) DEFAULT 'pink',
  `card_color` varchar(30) DEFAULT 'pink',
  `content` text DEFAULT NULL,
  `link` varchar(255) DEFAULT '#',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mental_articles`
--

INSERT INTO `mental_articles` (`id`, `title`, `category`, `read_time`, `badge_text`, `badge_color`, `card_color`, `content`, `link`, `created_at`) VALUES
(1, 'كيفية التعامل مع التوتر في أوقات الأزمات', 'إدارة التوتر', '5 دقائق', 'إدارة التوتر', 'pink', 'pink', NULL, '#', '2026-06-06 15:32:55'),
(2, 'دعم الأطفال نفسياً خلال النزوح', 'دعم الأطفال', '7 دقائق', 'دعم الأطفال', 'purple', 'purple', NULL, '#', '2026-06-06 15:32:55'),
(3, 'تقنيات التنفس للتهدئة السريعة', 'تمارين التهدئة', '3 دقائق', 'تمارين التهدئة', 'blue', 'blue', NULL, '#', '2026-06-06 15:32:55'),
(4, 'بناء الصلابة النفسية بعد الصدمة', 'التعافي', '10 دقائق', 'التعافي', 'green', 'green', NULL, '#', '2026-06-06 15:32:55');

-- --------------------------------------------------------

--
-- بنية الجدول `mental_centers`
--

CREATE TABLE `mental_centers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `area` varchar(150) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `working_hours` varchar(200) DEFAULT NULL,
  `services` text DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mental_centers`
--

INSERT INTO `mental_centers` (`id`, `name`, `area`, `address`, `phone`, `working_hours`, `services`, `image_url`, `latitude`, `longitude`, `created_at`) VALUES
(1, 'برنامج غزة للصحة النفسية (GCMHP) - المقر الرئيسي', 'غزة - تل الهوى', 'غرب دوار الدحدوح، مدينة غزة', '+970 8 2641512', '08:00 ص - 04:00 م (يمكن أن تختلف)', 'استشارات فردية، جلسات جماعية، دعم هاتفي، خدمات للأطفال، تدريب مهني', 'https://via.placeholder.com/400x200?text=GCMHP', NULL, NULL, '2026-05-20 12:49:34'),
(2, 'برنامج غزة للصحة النفسية (GCMHP) - مركز خان يونس', 'خان يونس', 'بجوار الكلية الجامعية', '+970 8 2641512', '08:00 ص - 04:00 م (يمكن أن تختلف)', 'خدمات مجتمعية، دعم نفسي واجتماعي، استشارات قانونية وإنسانية', 'https://via.placeholder.com/400x200?text=GCMHP+Khan+Younis', NULL, NULL, '2026-05-20 12:49:34'),
(3, 'برنامج غزة للصحة النفسية (GCMHP) - مركز دير البلح', 'دير البلح', 'دير البلح', '+970 8 2641512', '08:00 ص - 04:00 م (يمكن أن تختلف)', 'خدمات مجتمعية، دعم نفسي واجتماعي، استشارات قانونية وإنسانية', 'https://via.placeholder.com/400x200?text=GCMHP+Deir+Al-Balah', NULL, NULL, '2026-05-20 12:49:34'),
(4, 'مستشفى غزة للطب النفسي', 'غزة - حي النصر', 'حي النصر، شارع العيون، مدينة غزة', '(08) 284 7664', 'طوارئ 24 ساعة، العيادات الخارجية أوقات دوام محدودة', 'خدمات علاجية نفسية للمرضى المقيمين، عيادات خارجية', 'https://via.placeholder.com/400x200?text=Gaza+Psychiatric+Hospital', NULL, NULL, '2026-05-20 12:49:34'),
(5, 'الهيئة الفلسطينية للصحة النفسية (PCMH)', 'غزة', 'مقرها الرئيسي في غزة', '800900700', '24 ساعة يوميًا (خدمة الطوارئ)', 'تقييم نفسي، طوارئ نفسية، إرشاد وعلاج نفسي فردي وجماعي', 'https://via.placeholder.com/400x200?text=PCMH', NULL, NULL, '2026-05-20 12:49:34'),
(6, 'صحة غزة (GxzaHealth)', 'خدمة عن بُعد عن بُعد', 'للتواصل عبر منصتهم الإلكترونية', '(تطبيق واتساب)', '24 ساعة يوميًا', 'استشارات طبية ونفسية مجانية عن بُعد', 'https://via.placeholder.com/400x200?text=GxzaHealth', NULL, NULL, '2026-05-20 12:49:34'),
(7, 'عيادة خانيونس للصحة النفسية المجتمعية', 'خان يونس', 'خان يونس - بالتعاون مع وزارة الصحة', '+970 598785007', 'الأحد - الخميس 09:00 ص - 02:00 م', 'علاج دوائي ونفسي لاضطرابات القلق، الاكتئاب، إدمان، وصدمات الأطفال والبالغين', 'https://via.placeholder.com/400x200?text=Khan+Younis+Psychiatric+Clinic', NULL, NULL, '2026-05-20 12:49:34'),
(8, 'HEAL Palestine - عيادة الصحة النفسية', 'شمال غزة', 'تخدم مناطق شمال غزة', 'يمكن التواصل عبر المنصة', 'أوقات غير منتظمة بسبب الوضع الراهن', 'دعم نفسي متخصص للأطفال المصابين بصدمات الحرب', 'https://via.placeholder.com/400x200?text=HEAL+Palestine', NULL, NULL, '2026-05-20 12:49:34'),
(9, 'MAP - عيادة التضامن (Solidarity Polyclinic)', 'دير البلح', 'دير البلح', 'من خلال خدمات الإغاثة', '08:00 ص - 06:00 م', 'دعم نفسي، رعاية جروح، لقاحات وطب أسرة', 'https://via.placeholder.com/400x200?text=MAP+Clinic', NULL, NULL, '2026-05-20 12:49:34'),
(10, 'عيادة الطب النفسي - جمعية الإغاثة الطبية', 'غزة', 'جمعية الإغاثة الطبية، مدينة غزة', '(08) 264 1512', 'الأحد - ثلاثاء 04:00 م - 07:00 م', 'علاج نفسي، تخطيط دماغ، استشارات فردية وجلسات دعم', 'https://via.placeholder.com/400x200?text=Medical+Relief+Society', NULL, NULL, '2026-05-20 12:49:34'),
(11, 'مركز ناصر الطبي - قسم الصحة النفسية', 'خان يونس', 'مجمع ناصر الطبي، خان يونس', '(08) 284 7664', '08:00 ص - 02:00 م (يمكن أن يختلف)', 'تشخيص وعلاج الأمراض النفسية، دواء، استشارات', 'https://via.placeholder.com/400x200?text=Nasser+Medical+Complex', NULL, NULL, '2026-05-20 12:49:34'),
(12, 'مجمع الشفاء الطبي - الخدمات النفسية', 'غزة - الرمال', 'مجمع الشفاء الطبي، حي الرمال، مدينة غزة', '(08) 284 7664', '08:00 ص - 02:00 م (يمكن أن يختلف)', 'خدمات نفسية واستشارات (حسب توفر الطاقم الطبي)', 'https://via.placeholder.com/400x200?text=Al+Shifa+Hospital', NULL, NULL, '2026-05-20 12:49:34'),
(13, 'مركز حياة للاستشارات والتدريب', 'غزة', 'المقر الرئيسي في غزة', 'غير متوفر', '08:00 ص - 04:00 م', 'استشارات نفسية وأسرية ودعم قانوني، برامج تدريب وتأهيل', 'https://via.placeholder.com/400x200?text=Hayat+Center', NULL, NULL, '2026-05-20 12:49:34'),
(14, 'المستشفى الميداني الأردني', 'خان يونس', 'خان يونس', 'غير متوفر', 'يعمل بشكل متقطع 24 ساعة', 'خدمات إسعافية، جراحة، وخدمات دعم نفسي أساسية', 'https://via.placeholder.com/400x200?text=Jordanian+Field+Hospital', NULL, NULL, '2026-05-20 12:49:34'),
(15, 'عيادة الدكتور فضل عفانه النفسية', 'فلسطين - غزة', 'العيادة النفسية التخصصية، غزة', '+970598785007', 'حسب المواعيد', 'علاج اضطرابات القلق، الاكتئاب، الإدمان، الصدمات النفسية للأطفال والبالغين', 'https://via.placeholder.com/400x200?text=Dr.+Fadel+Affanah+Clinic', NULL, NULL, '2026-05-20 12:49:34');

-- --------------------------------------------------------

--
-- بنية الجدول `mental_crisis_lines`
--

CREATE TABLE `mental_crisis_lines` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `action_text` varchar(100) NOT NULL,
  `icon_class` varchar(50) NOT NULL,
  `bg_color` varchar(50) DEFAULT 'pink',
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mental_crisis_lines`
--

INSERT INTO `mental_crisis_lines` (`id`, `title`, `description`, `action_text`, `icon_class`, `bg_color`, `is_active`) VALUES
(1, 'خط الأزمات', 'متاح 24/7', 'SUPPORT-1800', 'fa-phone-alt', 'pink', 1),
(2, 'جلسات فورية', 'بدون موعد مسبق', 'ابدأ جلسة الآن', 'fa-video', 'purple', 1),
(3, 'مكتبة الموارد', 'أكثر من 50 مقال', 'مجانية', 'fa-book-open', 'blue', 1);

-- --------------------------------------------------------

--
-- بنية الجدول `mental_daily_tips`
--

CREATE TABLE `mental_daily_tips` (
  `id` int(11) NOT NULL,
  `tip_text` text NOT NULL,
  `display_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mental_daily_tips`
--

INSERT INTO `mental_daily_tips` (`id`, `tip_text`, `display_date`, `created_at`) VALUES
(1, 'خذ بضع دقائق كل يوم للتنفس العميق والتأمل، هذا يساعد على تقليل التوتر وتحسين الصحة النفسية.', '2026-06-06', '2026-06-06 15:32:55');

-- --------------------------------------------------------

--
-- بنية الجدول `mental_specialists`
--

CREATE TABLE `mental_specialists` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `avatar_letter` varchar(2) DEFAULT 'DR',
  `is_available` tinyint(1) DEFAULT 1,
  `phone` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `mental_specialists`
--

INSERT INTO `mental_specialists` (`id`, `name`, `specialty`, `avatar_letter`, `is_available`, `phone`, `whatsapp`, `created_at`) VALUES
(1, 'د. ليلى أحمد', 'استشارات نفسية', 'LA', 1, '+970591112222', '+970591112222', '2026-06-06 15:32:55'),
(2, 'د. كريم يوسف', 'علاج الصدمات', 'KY', 1, '+970592223333', '+970592223333', '2026-06-06 15:32:55'),
(3, 'د. مريم حسن', 'استشارات عائلية', 'MH', 1, NULL, '972592038364', '2026-06-06 15:32:55');

-- --------------------------------------------------------

--
-- بنية الجدول `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- بنية الجدول `roadmap_tasks`
--

CREATE TABLE `roadmap_tasks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_category` enum('health','education','housing','psychological','infrastructure','employment') DEFAULT 'health',
  `task_name` varchar(255) NOT NULL,
  `status` enum('pending','in_progress','completed') DEFAULT 'pending',
  `due_date` date DEFAULT NULL,
  `completed_at` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `roadmap_tasks`
--

INSERT INTO `roadmap_tasks` (`id`, `user_id`, `task_category`, `task_name`, `status`, `due_date`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 4, 'health', 'فحص طبي شامل', 'completed', '2026-06-20', '2026-05-20', '2026-05-20 11:10:23', '2026-05-20 11:21:08'),
(2, 4, 'health', 'استشارة نفسية', 'completed', '2026-06-04', '2026-05-20', '2026-05-20 11:10:23', '2026-05-20 11:20:58'),
(3, 4, 'education', 'تسجيل الأطفال في المدرسة', 'pending', '2026-07-20', NULL, '2026-05-20 11:10:23', '2026-05-20 11:10:23'),
(4, 4, 'housing', 'تقديم طلب إعمار', 'in_progress', '2026-08-20', NULL, '2026-05-20 11:10:23', '2026-05-20 11:21:04'),
(5, 4, 'infrastructure', 'صيانة شبكة المياه', 'in_progress', '2026-07-04', NULL, '2026-05-20 11:10:23', '2026-05-22 12:39:59'),
(6, 4, 'employment', 'البحث عن فرصة عمل', 'pending', '2026-07-19', NULL, '2026-05-20 11:10:23', '2026-05-20 11:10:23'),
(7, 2, 'health', 'فحص طبي شامل', 'completed', '2026-06-20', '2026-06-06', '2026-05-21 13:19:41', '2026-06-06 16:15:32'),
(8, 2, 'health', 'استشارة نفسية', 'completed', '2026-06-05', '2026-06-06', '2026-05-21 13:19:41', '2026-06-06 16:15:27'),
(9, 2, 'education', 'تسجيل الأطفال في المدرسة', 'completed', '2026-07-20', '2026-06-06', '2026-05-21 13:19:41', '2026-06-06 16:15:40'),
(10, 2, 'housing', 'تقديم طلب إعمار', 'completed', '2026-08-19', '2026-06-10', '2026-05-21 13:19:41', '2026-06-10 11:26:29'),
(11, 2, 'infrastructure', 'صيانة شبكة المياه', 'completed', '2026-07-05', '2026-06-06', '2026-05-21 13:19:41', '2026-06-06 16:15:35'),
(12, 2, 'employment', 'البحث عن فرصة عمل', 'completed', '2026-07-20', '2026-06-10', '2026-05-21 13:19:41', '2026-06-10 11:26:21'),
(13, 5, 'health', 'فحص طبي شامل', 'completed', '2026-06-21', '2026-05-21', '2026-05-21 13:22:21', '2026-05-21 13:27:05'),
(14, 5, 'health', 'استشارة نفسية', 'completed', '2026-06-05', '2026-05-21', '2026-05-21 13:22:22', '2026-05-21 13:27:02'),
(15, 5, 'education', 'تسجيل الأطفال في المدرسة', 'completed', '2026-07-21', '2026-05-21', '2026-05-21 13:22:22', '2026-05-21 13:26:58'),
(16, 5, 'housing', 'تقديم طلب إعمار', 'pending', '2026-08-21', NULL, '2026-05-21 13:22:22', '2026-05-21 13:22:22'),
(17, 5, 'infrastructure', 'صيانة شبكة المياه', 'pending', '2026-07-05', NULL, '2026-05-21 13:22:22', '2026-05-21 13:22:22'),
(18, 5, 'employment', 'البحث عن فرصة عمل', 'pending', '2026-07-20', NULL, '2026-05-21 13:22:22', '2026-05-21 13:22:22'),
(19, 6, 'health', 'فحص طبي شامل', 'pending', '2026-06-24', NULL, '2026-05-24 10:55:25', '2026-05-24 10:55:25'),
(20, 6, 'health', 'استشارة نفسية', 'pending', '2026-06-08', NULL, '2026-05-24 10:55:25', '2026-05-24 10:55:25'),
(21, 6, 'education', 'تسجيل الأطفال في المدرسة', 'pending', '2026-07-24', NULL, '2026-05-24 10:55:25', '2026-05-24 10:55:25'),
(22, 6, 'housing', 'تقديم طلب إعمار', 'pending', '2026-08-24', NULL, '2026-05-24 10:55:25', '2026-05-24 10:55:25'),
(23, 6, 'infrastructure', 'صيانة شبكة المياه', 'pending', '2026-07-08', NULL, '2026-05-24 10:55:25', '2026-05-24 10:55:25'),
(24, 6, 'employment', 'البحث عن فرصة عمل', 'pending', '2026-07-23', NULL, '2026-05-24 10:55:25', '2026-05-24 10:55:25'),
(25, 7, 'health', 'فحص طبي شامل', 'completed', '2026-07-07', '2026-06-07', '2026-06-07 10:34:37', '2026-06-07 10:35:41'),
(26, 7, 'health', 'استشارة نفسية', 'completed', '2026-06-22', '2026-06-07', '2026-06-07 10:34:37', '2026-06-07 10:35:33'),
(27, 7, 'education', 'تسجيل الأطفال في المدرسة', 'pending', '2026-08-07', NULL, '2026-06-07 10:34:37', '2026-06-07 10:34:37'),
(28, 7, 'housing', 'تقديم طلب إعمار', 'pending', '2026-09-07', NULL, '2026-06-07 10:34:37', '2026-06-07 10:34:37'),
(29, 7, 'infrastructure', 'صيانة شبكة المياه', 'pending', '2026-07-22', NULL, '2026-06-07 10:34:37', '2026-06-07 10:34:37'),
(30, 7, 'employment', 'البحث عن فرصة عمل', 'pending', '2026-08-06', NULL, '2026-06-07 10:34:37', '2026-06-07 10:34:37'),
(31, 8, 'health', 'فحص طبي شامل', 'pending', '2026-07-10', NULL, '2026-06-10 12:10:35', '2026-06-10 12:10:35'),
(32, 8, 'health', 'استشارة نفسية', 'pending', '2026-06-25', NULL, '2026-06-10 12:10:36', '2026-06-10 12:10:36'),
(33, 8, 'education', 'تسجيل الأطفال في المدرسة', 'pending', '2026-08-10', NULL, '2026-06-10 12:10:36', '2026-06-10 12:10:36'),
(34, 8, 'housing', 'تقديم طلب إعمار', 'pending', '2026-09-10', NULL, '2026-06-10 12:10:36', '2026-06-10 12:10:36'),
(35, 8, 'infrastructure', 'صيانة شبكة المياه', 'pending', '2026-07-25', NULL, '2026-06-10 12:10:36', '2026-06-10 12:10:36'),
(36, 8, 'employment', 'البحث عن فرصة عمل', 'pending', '2026-08-09', NULL, '2026-06-10 12:10:36', '2026-06-10 12:10:36');

-- --------------------------------------------------------

--
-- بنية الجدول `support_team`
--

CREATE TABLE `support_team` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `avatar_letters` varchar(2) NOT NULL,
  `avatar_color` varchar(20) DEFAULT 'blue',
  `status` enum('online','away','offline') DEFAULT 'online',
  `phone` varchar(20) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `support_team`
--

INSERT INTO `support_team` (`id`, `name`, `role`, `avatar_letters`, `avatar_color`, `status`, `phone`, `whatsapp`, `display_order`, `is_active`) VALUES
(1, 'سارة حسن', 'مسؤولة الحالة الرئيسية', 'سح', 'blue', 'online', NULL, '972592038364', 1, 1),
(2, 'د. رامي يوسف', 'مستشار الصحة النفسية', 'دي', 'pink', 'away', NULL, '972592038369', 2, 1);

-- --------------------------------------------------------

--
-- بنية الجدول `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `governorate` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('family','admin','organization') DEFAULT 'family',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `phone`, `governorate`, `area`, `street_address`, `password`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@liferebuild.com', '123456789', NULL, NULL, NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', '2026-05-20 08:57:51'),
(2, 'reeman Mohammed', 'r40@gmail.com', '0592038364', '4', 'المواصي', '', '$2y$10$lHJ0AWUBXyMj8cpluC6dyOsAzh/9EVZbH2YU6BittRlLOTEGUbGki', 'family', '2026-05-20 09:01:26'),
(3, 'ADMIN', 'r409456712@gmail.com', '0592038364', '4', 'المواصي', 'النص', '$2y$10$Vw6FN5PeTP7tieJ0FJwk1OpHwXh03cLqERSazhqIRgmFURMiqSDmi', 'admin', '2026-05-20 09:06:29'),
(4, 'newuser', 'test@gmail.com', '0592038364', '4', 'حي المحطة', 'البلد', '$2y$10$wSFP58/Ww247G/GAcUo/pe1KzzGWedDFppfh2i9J8nLi.x1cuf9ji', 'family', '2026-05-20 11:10:23'),
(5, 'mo', 'mo@gmail.com', '0592038364', '4', 'المواصي', '_', '$2y$10$n07QZTOuYBtyr4.H0BDlW.ld9gxG62B0HRTvmbYYXKJTATc9zhPse', 'admin', '2026-05-21 13:22:21'),
(6, 'mahmod', 'mahmod@g.c', '059555055', '5', 'رفح (البلد)', 'السكة', '$2y$10$Vyx9YhP9oj3k6atllNkMNeJUA.0/tTgJPUo.B.2cxKhYMXMaaO8Wu', 'admin', '2026-05-24 10:55:25'),
(7, 'shahd', 'sh@gmail.com', '0592038364', '1', 'بيت لاهيا', '1111', '$2y$10$ZhqZbdx2b8r7Idv2yq2DdOLXKesmXcc4JLlhIKYRe335CjYTa/TYe', 'family', '2026-06-07 10:34:37'),
(8, 'admin', 'admin@life.com', '0599555555', '1', 'بيت لاهيا', '1111', '$2y$10$2ToZ5jKum93gN391yQu4leaa7DXZyjv8ca91WIDnZkr2TmIY7UQ.m', 'admin', '2026-06-10 12:10:27');

-- --------------------------------------------------------

--
-- بنية الجدول `volunteer_organizations`
--

CREATE TABLE `volunteer_organizations` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `area` varchar(150) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `services` text DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `volunteer_organizations`
--

INSERT INTO `volunteer_organizations` (`id`, `name`, `area`, `phone`, `whatsapp`, `services`, `image_url`, `created_at`) VALUES
(1, 'الهلال الأحمر الفلسطيني', 'غزة', '082888888', '599123456', 'إسعاف، إيواء مؤقت، توزيع طرود غذائية', 'https://via.placeholder.com/150?text=Red+Crescent', '2026-05-20 13:02:03'),
(2, 'أونروا - برنامج الطوارئ', 'جميع المحافظات', '082666666', '599111222', 'مساعدات غذائية، إيواء، كسوة', 'https://via.placeholder.com/150?text=UNRWA', '2026-05-20 13:02:03'),
(3, 'فريق \"نخوة\" التطوعي', 'شمال غزة - جباليا', '0599123456', '0599123456', 'إصلاح منازل، نقل عائلات، توزيع وجبات', 'https://via.placeholder.com/150?text=Nakhwa', '2026-05-20 13:02:03'),
(4, 'لجان الإغاثة الطبية', 'غزة', '082554433', '599887766', 'عيادات متنقلة، أدوية، دعم نفسي', 'https://via.placeholder.com/150?text=Medical+Relief', '2026-05-20 13:02:03'),
(5, 'مركز women\'s affairs', 'غزة - الرمال', '082223344', '598765432', 'دعم نفسي للنساء، حماية، توزيع مستلزمات صحية', 'https://via.placeholder.com/150?text=Woman+Center', '2026-05-20 13:02:03');

-- --------------------------------------------------------

--
-- بنية الجدول `volunteer_requests`
--

CREATE TABLE `volunteer_requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_type` enum('food','shelter','medical','psychological','education','water','clothes','other') NOT NULL,
  `details` text DEFAULT NULL,
  `status` enum('pending','assigned','completed','cancelled') DEFAULT 'pending',
  `preferred_contact` enum('phone','whatsapp','in_app') DEFAULT 'phone',
  `contact_info` varchar(100) DEFAULT NULL,
  `assigned_to` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `contact_method` varchar(20) DEFAULT 'phone',
  `contact_value` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `volunteer_requests`
--

INSERT INTO `volunteer_requests` (`id`, `user_id`, `request_type`, `details`, `status`, `preferred_contact`, `contact_info`, `assigned_to`, `created_at`, `contact_method`, `contact_value`, `contact_phone`) VALUES
(2, 4, 'food', 'كيلو منيح خضار', 'pending', 'phone', '059989898', NULL, '2026-05-20 13:07:43', 'phone', NULL, NULL),
(3, 4, 'clothes', 'ملابسسس', 'pending', 'phone', '059000000', NULL, '2026-05-20 13:08:22', 'phone', NULL, NULL),
(4, 3, 'shelter', 'انا احتاج الى خيمة', 'pending', 'phone', '0595555555', NULL, '2026-05-24 10:41:49', 'phone', NULL, NULL),
(5, 2, 'medical', 'علاج للسكري', 'pending', 'phone', '0599877452', NULL, '2026-06-07 08:16:28', 'phone', NULL, NULL),
(6, 2, 'shelter', 'فف', 'pending', 'phone', '0599877452', NULL, '2026-06-07 08:18:24', 'phone', NULL, NULL),
(9, 2, 'food', 'يي', 'cancelled', 'phone', NULL, NULL, '2026-06-07 08:56:15', 'phone', NULL, 'phone: 0599877452'),
(10, 2, 'medical', 'علاجات', 'pending', 'phone', NULL, NULL, '2026-06-07 08:56:38', 'phone', NULL, ': '),
(11, 2, 'medical', 'علاجات', 'pending', 'phone', NULL, NULL, '2026-06-07 08:58:01', 'phone', '0599866952', NULL),
(12, 2, 'education', 'معلم', 'pending', 'phone', NULL, NULL, '2026-06-07 08:58:52', 'phone', '0599866952', NULL),
(13, 2, 'clothes', 'ملابس', 'pending', 'phone', NULL, NULL, '2026-06-07 09:00:28', 'phone', '0599866952', NULL),
(14, 2, 'clothes', 'ملابس', 'pending', 'phone', NULL, NULL, '2026-06-07 09:02:29', 'phone', '0599866952', NULL),
(15, 2, 'clothes', 'ملابس', 'cancelled', 'phone', NULL, NULL, '2026-06-07 09:02:41', 'phone', '0599866952', NULL),
(16, 2, 'education', 'rr', 'cancelled', 'phone', NULL, NULL, '2026-06-07 09:04:15', 'phone', '0599866952', NULL),
(17, 2, 'food', 'l', 'pending', 'phone', NULL, NULL, '2026-06-07 09:05:42', 'phone', '0599866952', NULL),
(18, 2, 'food', 'l', 'pending', 'phone', NULL, NULL, '2026-06-07 09:07:38', 'phone', '0599866952', NULL),
(19, 2, 'water', '44', 'pending', 'phone', NULL, NULL, '2026-06-07 09:24:01', 'phone', NULL, '0599866952'),
(20, 2, 'clothes', '4343', 'pending', 'phone', NULL, NULL, '2026-06-07 09:24:20', 'phone', NULL, '0599866952');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aid_requests`
--
ALTER TABLE `aid_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `governorate_id` (`governorate_id`,`area_name`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `losses`
--
ALTER TABLE `losses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `mental_appointments`
--
ALTER TABLE `mental_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `specialist_id` (`specialist_id`);

--
-- Indexes for table `mental_articles`
--
ALTER TABLE `mental_articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mental_centers`
--
ALTER TABLE `mental_centers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mental_crisis_lines`
--
ALTER TABLE `mental_crisis_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mental_daily_tips`
--
ALTER TABLE `mental_daily_tips`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mental_specialists`
--
ALTER TABLE `mental_specialists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `support_team`
--
ALTER TABLE `support_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `volunteer_organizations`
--
ALTER TABLE `volunteer_organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `volunteer_requests`
--
ALTER TABLE `volunteer_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aid_requests`
--
ALTER TABLE `aid_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `losses`
--
ALTER TABLE `losses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mental_appointments`
--
ALTER TABLE `mental_appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mental_articles`
--
ALTER TABLE `mental_articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mental_centers`
--
ALTER TABLE `mental_centers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mental_crisis_lines`
--
ALTER TABLE `mental_crisis_lines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mental_daily_tips`
--
ALTER TABLE `mental_daily_tips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mental_specialists`
--
ALTER TABLE `mental_specialists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `support_team`
--
ALTER TABLE `support_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `volunteer_organizations`
--
ALTER TABLE `volunteer_organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `volunteer_requests`
--
ALTER TABLE `volunteer_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- قيود الجداول المُلقاة.
--

--
-- قيود الجداول `aid_requests`
--
ALTER TABLE `aid_requests`
  ADD CONSTRAINT `aid_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_ibfk_1` FOREIGN KEY (`governorate_id`) REFERENCES `governorates` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `aid_requests` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `losses`
--
ALTER TABLE `losses`
  ADD CONSTRAINT `losses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `mental_appointments`
--
ALTER TABLE `mental_appointments`
  ADD CONSTRAINT `mental_appointments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `mental_appointments_ibfk_2` FOREIGN KEY (`specialist_id`) REFERENCES `mental_specialists` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `roadmap_tasks`
--
ALTER TABLE `roadmap_tasks`
  ADD CONSTRAINT `roadmap_tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- قيود الجداول `volunteer_requests`
--
ALTER TABLE `volunteer_requests`
  ADD CONSTRAINT `volunteer_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
