-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- 主機： localhost:3306
-- 產生時間： 2024 年 06 月 04 日 14:41
-- 伺服器版本： 8.0.30-0ubuntu0.20.04.2
-- PHP 版本： 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `beautyappdemo`
--

-- --------------------------------------------------------

--
-- 資料表結構 `tp_admin`
--

CREATE TABLE `tp_admin` (
  `uid` int NOT NULL,
  `staffCode` varchar(10) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `addDate` datetime DEFAULT NULL,
  `isdel` varchar(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_admin`
--

INSERT INTO `tp_admin` (`uid`, `staffCode`, `userName`, `password`, `name`, `addDate`, `isdel`) VALUES
(1, NULL, 'admin', '123456', 'admin', '2020-10-01 19:28:06', '0'),
(3, '804', '804TESTING', '028245', 'TESTING', '2023-07-03 17:02:39', '0'),
(4, '302', '302Raymond', '013815', 'Raymond', '2023-07-03 17:02:39', '0'),
(5, '301', '301Daphne ', '016555', 'Daphne ', '2023-07-03 17:02:39', '0'),
(6, '204', '204Vonny', '029560', 'Vonny', '2023-07-03 17:02:39', '0'),
(7, '203', '203Miki', '095393', 'Miki', '2023-07-03 17:02:39', '0'),
(8, '202', '202Suvee', '024081', 'Suvee', '2023-07-03 17:02:39', '0'),
(9, '201', '201Becca', '094973', 'Becca', '2023-07-03 17:02:39', '0'),
(10, '104', '104Yoyo', '061754', 'Yoyo', '2023-07-03 17:02:39', '0'),
(11, '103', '103Zoe', '041265', 'Zoe', '2023-07-03 17:02:39', '0'),
(12, '102', '102Dora ', '041267', 'Dora ', '2023-07-03 17:02:39', '0'),
(13, '101', '101Miko ', '083162', 'Miko ', '2023-07-03 17:02:39', '0'),
(14, NULL, 'Aaron', '1234', '', '2023-07-07 12:55:38', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_branch`
--

CREATE TABLE `tp_branch` (
  `branchId` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isdel` int DEFAULT '1',
  `address` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `addressEN` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `branchPhone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_branch`
--

INSERT INTO `tp_branch` (`branchId`, `name`, `isdel`, `address`, `addressEN`, `branchPhone`) VALUES
(29, 'Chu Me Beauty (荔枝角)', 1, '長沙灣青山道489-491號香港工業中心B座811 C室', 'Room 811C, Block B, Hong Kong Industrial Centre, 489-491 Castle Peak Road, Cheung Sha Wan', '96357764\r'),
(28, 'Chu Me Beauty (觀塘)', 1, '觀塘一號店', '', '55960848'),
(30, 'Chu Me Beauty (北角)', 1, '北角渣華道128號渣華商業中心21樓01B室', 'Room 01B, 21/F, Java Commercial Centre, 128 Java Road, North Point', '67198212');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_cart`
--

CREATE TABLE `tp_cart` (
  `cartId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `goodsId` int DEFAULT NULL,
  `price` text NOT NULL,
  `quantity` int DEFAULT '1',
  `uid` int DEFAULT NULL,
  `customer` text,
  `email` text,
  `phone` varchar(255) DEFAULT NULL,
  `location` text,
  `locations` text,
  `booktime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `goodsType` int NOT NULL DEFAULT '0',
  `status` int NOT NULL,
  `out_trade_no` varchar(30) DEFAULT NULL,
  `dName` varchar(255) NOT NULL,
  `dPhone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

--
-- 傾印資料表的資料 `tp_cart`
--

INSERT INTO `tp_cart` (`cartId`, `name`, `goodsId`, `price`, `quantity`, `uid`, `customer`, `email`, `phone`, `location`, `locations`, `booktime`, `goodsType`, `status`, `out_trade_no`, `dName`, `dPhone`, `address`) VALUES
(663, '奇蹟抗紋修復療程', 188, '1588.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-06-28 10:00:11', 0, 1, '3GN849871A087761K', '', '', ''),
(661, '一字膊筋膜放鬆還原術', 191, '1088.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-06-28 03:40:07', 0, 2, NULL, '', '', ''),
(662, '陶瓷肌身體(一樽粉扣一次)', 187, '1588.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-06-28 03:54:34', 0, 1, NULL, '', '', ''),
(665, 'X9隔空殺脂排油療程(2PART)', NULL, '2088.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-05 00:47:11', 0, 0, NULL, '', '', ''),
(667, 'VMAX HIFU 收緊(2PART)', 190, '1588.00', 1, 209, NULL, NULL, NULL, NULL, NULL, '2023-07-05 07:52:25', 0, 0, NULL, '', '', ''),
(671, '膠原2.0 AKA食屎啦 禾唔會再改特別既名 改完冇人讀原價', 177, '5288.00', 1, 214, NULL, NULL, NULL, NULL, NULL, '2023-07-07 03:53:30', 0, 1, NULL, '', '', ''),
(670, '陶瓷肌身體(一樽粉扣一次)', 187, '1588.00', 1, 210, NULL, NULL, NULL, NULL, NULL, '2023-07-06 06:19:12', 0, 0, NULL, '', '', ''),
(672, 'testing product', 204, '1.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-07 05:46:55', 0, 1, NULL, '', '', ''),
(673, '人手造乳', 189, '2888.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-09 02:17:57', 0, 1, NULL, '', '', ''),
(674, '測試', 206, '148.00', 1, 217, NULL, NULL, NULL, NULL, NULL, '2023-07-13 03:34:36', 0, 0, NULL, '', '', ''),
(675, 'Nail Polish', 207, '1.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-14 08:51:43', 0, 1, NULL, '', '', ''),
(676, 'Nail Polish', 207, '1.00', 1, 211, NULL, NULL, NULL, NULL, NULL, '2023-07-18 10:49:53', 0, 1, NULL, '', '', ''),
(677, 'VMAX HIFU 收緊(2PART)', 190, '1588.00', 1, 211, NULL, NULL, NULL, NULL, NULL, '2023-07-18 11:41:09', 0, 0, NULL, '', '', ''),
(678, '脂肪面殺脂空氣炮AKA FAT FACE KILL FAT AIR BOMB', 178, '5288.00', 1, 211, NULL, NULL, NULL, NULL, NULL, '2023-07-18 11:45:10', 0, 0, NULL, '', '', ''),
(679, 'Nail Polish', 207, '1.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-26 04:23:43', 0, 1, NULL, '', '', ''),
(680, 'Nail Polish', 207, '1.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-26 06:00:49', 0, 1, NULL, '', '', ''),
(681, '奇蹟抗紋修復療程', 188, '1588.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-26 06:02:41', 0, 1, NULL, '', '', ''),
(682, 'Nail Polish', 207, '1.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-26 06:02:49', 0, 1, NULL, '', '', ''),
(683, 'Nail Polish', 207, '1.00', 1, 211, NULL, NULL, NULL, NULL, NULL, '2023-07-27 02:46:10', 0, 1, NULL, '', '', ''),
(684, '膠原2.0 AKA食屎啦 禾唔會再改特別既名 改完冇人讀原價', 177, '5288.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-27 05:51:44', 0, 1, NULL, '', '', ''),
(685, '10次觀塘屎屎大優惠', 201, '3888.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-27 05:52:47', 0, 2, NULL, '', '', ''),
(686, 'Nail Polish', 207, '1.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-07-27 05:55:10', 0, 2, NULL, '', '', ''),
(687, '脂肪面殺脂空氣炮AKA FAT FACE KILL FAT AIR BOMB', 178, '5288.00', 1, 217, NULL, NULL, NULL, NULL, NULL, '2023-07-31 03:23:40', 0, 0, NULL, '', '', ''),
(688, '美白倉任做三個月', 197, '2388.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-11 03:36:26', 0, 1, NULL, '', '', ''),
(689, 'Nail Polish', 208, '500.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-11 03:40:24', 0, 1, NULL, '', '', ''),
(690, '美白倉+暖宮機+收陰機 任做三個月', 200, '4000.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:17:02', 0, 2, NULL, '', '', ''),
(691, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:17:11', 0, 1, NULL, '', '', ''),
(692, 'Body Massage Treatment Package', 209, '3400.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:36:52', 0, 1, NULL, '', '', ''),
(693, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:37:43', 0, 1, NULL, '', '', ''),
(694, 'Nail Polish', 210, '350.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:37:57', 0, 1, NULL, '', '', ''),
(695, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-14 08:42:43', 0, 1, NULL, '', '', ''),
(696, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-15 08:24:00', 0, 1, NULL, '', '', ''),
(697, 'Deep Clean Facial Treatment', 196, '1888.00', 3, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-18 03:28:39', 0, 1, NULL, '', '', ''),
(698, 'Nail Polish', 210, '350.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-18 03:29:15', 0, 1, NULL, '', '', ''),
(699, 'HIFU V Shape Treatment', 208, '12888.00', 9, 221, NULL, NULL, NULL, NULL, NULL, '2023-08-18 13:38:31', 0, 1, NULL, '', '', ''),
(700, 'Body Massage Treatment Package', 209, '3400.00', 2, 221, NULL, NULL, NULL, NULL, NULL, '2023-08-18 13:44:22', 0, 1, NULL, '', '', ''),
(701, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-21 14:51:38', 0, 1, NULL, '', '', ''),
(702, 'Body Massage Treatment Package', 209, '3400.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-21 15:04:30', 0, 1, NULL, '', '', ''),
(703, 'Deep Clean Facial Treatment', 196, '1888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-22 03:49:59', 0, 1, NULL, '', '', ''),
(704, 'Body Massage Treatment Package', 209, '3400.00', 1, 221, NULL, NULL, NULL, NULL, NULL, '2023-08-22 07:38:14', 0, 0, NULL, '', '', ''),
(705, 'HIFU V Shape Treatment', 208, '12888.00', 4, 221, NULL, NULL, NULL, NULL, NULL, '2023-08-22 09:59:20', 0, 1, NULL, '', '', ''),
(706, 'Deep Clean Facial Treatment', 196, '1888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-22 09:59:49', 0, 1, NULL, '', '', ''),
(707, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-25 08:10:35', 0, 1, NULL, '', '', ''),
(708, 'Hot Stone Spa Treatment for Belly', 197, '2388.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-25 09:56:51', 0, 1, NULL, '', '', ''),
(709, 'Deep Clean Facial Treatment', 196, '1888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-25 09:57:10', 0, 1, NULL, '', '', ''),
(710, 'X9隔空殺脂排油療程(2PART)', NULL, '2088.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-27 00:55:27', 0, 0, NULL, '', '', ''),
(711, 'X9隔空殺脂排油療程(2PART)', NULL, '2088.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-28 01:44:41', 0, 0, NULL, '', '', ''),
(712, 'HIFU V Shape Treatment', 208, '12888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2023-08-29 07:31:54', 0, 1, NULL, '', '', ''),
(713, 'X9隔空殺脂排油療程(2PART)', NULL, '2088.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2023-08-30 00:48:36', 0, 0, NULL, '', '', ''),
(714, 'HIFU V Shape Treatment', 208, '12888.00', 11, 223, NULL, NULL, NULL, NULL, NULL, '2023-08-30 03:16:01', 0, 1, NULL, '', '', ''),
(715, 'Body Massage Treatment Package', 209, '3400.00', 1, 219, NULL, NULL, NULL, NULL, NULL, '2023-09-05 14:44:30', 0, 0, NULL, '', '', ''),
(716, 'HIFU V Shape Treatment', 208, '12888.00', 1, 219, NULL, NULL, NULL, NULL, NULL, '2023-09-05 14:56:39', 0, 1, NULL, '', '', ''),
(717, '美白倉+暖宮機+收陰機 任做三個月', 200, '4000.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-09-05 15:08:41', 0, 0, NULL, '', '', ''),
(718, 'HIFU V Shape Treatment', 208, '12888.00', 4, 221, NULL, NULL, NULL, NULL, NULL, '2023-09-07 01:08:10', 0, 1, NULL, '', '', ''),
(719, 'HIFU V Shape Treatment', 208, '12888.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-09-07 09:16:25', 0, 1, NULL, '', '', ''),
(720, 'HIFU V Shape Treatment', 208, '12888.00', 1, 224, NULL, NULL, NULL, NULL, NULL, '2023-09-11 10:58:37', 0, 1, NULL, '', '', ''),
(721, 'Nail Polish', 210, '350.00', 1, 221, NULL, NULL, NULL, NULL, NULL, '2023-09-12 05:42:28', 0, 1, NULL, '', '', ''),
(722, 'HIFU V Shape Treatment', 208, '12888.00', 3, 221, NULL, NULL, NULL, NULL, NULL, '2023-09-15 12:13:57', 0, 1, NULL, '', '', ''),
(723, 'Nail Polish', 210, '350.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-09-22 08:39:25', 0, 1, NULL, '', '', ''),
(724, 'Deep Clean Facial Treatment', 196, '1888.00', 2, 226, NULL, NULL, NULL, NULL, NULL, '2023-09-25 12:06:49', 0, 1, '4XE78987JR902314E', '', '', ''),
(725, 'Deep Clean Facial Treatment', 196, '1888.00', 2, 227, NULL, NULL, NULL, NULL, NULL, '2023-09-25 18:39:33', 0, 1, '8DD774973G0031440', '', '', ''),
(726, 'Hot Stone Spa Treatment for Belly', 197, '2388.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-09-26 10:11:47', 0, 1, NULL, '', '', ''),
(727, 'Hot Stone Spa Treatment for Belly', 197, '2388.00', 1, 228, NULL, NULL, NULL, NULL, NULL, '2023-09-26 10:16:51', 0, 1, '6A66066337704205P', '', '', ''),
(728, 'HIFU V Shape Treatment', 208, '12888.00', 3, 228, NULL, NULL, NULL, NULL, NULL, '2023-09-26 10:16:53', 0, 1, '6A66066337704205P', '', '', ''),
(729, 'Deep Clean Facial Treatment', 196, '1888.00', 1, 229, NULL, NULL, NULL, NULL, NULL, '2023-10-12 07:03:12', 0, 1, NULL, '', '', ''),
(730, 'Nail Polish', 210, '350.00', 2, 229, NULL, NULL, NULL, NULL, NULL, '2023-10-12 07:06:15', 0, 1, NULL, '', '', ''),
(731, 'HIFU V Shape Treatment', 208, '12888.00', 1, 229, NULL, NULL, NULL, NULL, NULL, '2023-10-12 07:07:33', 0, 1, NULL, '', '', ''),
(732, 'Hot Stone Spa Treatment for Belly', 197, '2388.00', 1, 229, NULL, NULL, NULL, NULL, NULL, '2023-10-12 09:02:11', 0, 1, NULL, '', '', ''),
(733, 'Deep Clean Facial Treatment', 196, '1888.00', 1, 230, NULL, NULL, NULL, NULL, NULL, '2023-10-14 06:44:56', 0, 1, NULL, '', '', ''),
(734, 'HIFU V Shape Treatment', 208, '12888.00', 5, 230, NULL, NULL, NULL, NULL, NULL, '2023-10-14 06:45:54', 0, 1, NULL, '', '', ''),
(735, 'Deep Clean Facial Treatment', 196, '1888.00', 1, 230, NULL, NULL, NULL, NULL, NULL, '2023-10-18 09:34:33', 0, 1, NULL, '', '', ''),
(736, 'HIFU V Shape Treatment', 208, '12888.00', 1, 128, NULL, NULL, NULL, NULL, NULL, '2023-10-27 08:28:35', 0, 1, NULL, '', '', ''),
(737, 'HIFU V Shape Treatment', 208, '12888.00', 1, 219, NULL, NULL, NULL, NULL, NULL, '2023-11-17 08:51:45', 0, 1, NULL, '', '', ''),
(738, 'Deep Clean Facial Treatment', 196, '1888.00', 1, 219, NULL, NULL, NULL, NULL, NULL, '2023-11-17 08:52:10', 0, 0, NULL, '', '', ''),
(739, 'Deep Clean Facial Treatment', 196, '1888.00', 1, 221, NULL, NULL, NULL, NULL, NULL, '2023-11-22 09:32:05', 0, 0, NULL, '', '', ''),
(740, 'Hot Stone Spa Treatment for Belly', 197, '2388.00', 1, 231, NULL, NULL, NULL, NULL, NULL, '2023-12-02 09:08:08', 0, 0, NULL, '', '', ''),
(741, 'Deep Clean Facial Treatment', 196, '1888.00', 2, 128, NULL, NULL, NULL, NULL, NULL, '2024-02-22 09:17:47', 0, 0, NULL, '', '', ''),
(742, 'X9隔空殺脂排油療程(2PART)', NULL, '2088.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-28 02:10:09', 0, 0, NULL, '', '', ''),
(743, 'X9隔空殺脂排油療程(2PART)', NULL, '2088.00', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-29 20:36:14', 0, 0, NULL, '', '', ''),
(744, 'HIFU V Shape Treatment', 208, '12888.00', 1, 221, NULL, NULL, NULL, NULL, NULL, '2024-06-04 04:16:56', 0, 0, NULL, '', '', '');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_cartlistpay`
--

CREATE TABLE `tp_cartlistpay` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `goodsId` int DEFAULT NULL,
  `totalamt` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `out_trade_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `payStatus` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `goodsType` int DEFAULT NULL,
  `booktime` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_cartlistpay`
--

INSERT INTO `tp_cartlistpay` (`id`, `uid`, `goodsId`, `totalamt`, `price`, `quantity`, `out_trade_no`, `payStatus`, `goodsType`, `booktime`) VALUES
(301, 7, 1, 30, 10, 3, '2022021506572367527', '1', 4, '2022-02-15 18:57:23'),
(300, 7, 2, 100, 20, 5, '2022021506572367527', '1', 4, '2022-02-15 18:57:23'),
(299, 7, 1, 30, 10, 3, '2022021503214816098', '1', 4, '2022-02-15 15:21:48'),
(298, 7, 2, 60, 20, 3, '2022021503214816098', '1', 4, '2022-02-15 15:21:48'),
(297, 7, 1, NULL, 10, 1, '2022021503164787802', '1', 4, '2022-02-15 15:16:47'),
(302, 7, 16, 204, 68, 3, '2022021801594923061', '0', NULL, '2022-02-18 13:59:49'),
(303, 7, 2, 40, 20, 2, '2022021801594923061', '0', NULL, '2022-02-18 13:59:49'),
(304, 7, 1, 10, 10, 1, '2022021801594923061', '0', NULL, '2022-02-18 13:59:49'),
(305, 7, 16, 68, 68, 1, '2022021802040143722', '0', 1, '2022-02-18 14:04:01'),
(306, 7, 1, 10, 10, 1, '2022021802040143722', '0', 4, '2022-02-18 14:04:01'),
(307, 7, 2, 20, 20, 1, '2022021802040143722', '0', 4, '2022-02-18 14:04:01'),
(308, 7, 23, 3100, 1550, 2, '2022022404404999308', '0', 1, '2022-02-24 16:40:49'),
(309, 7, 24, 600, 150, 4, '2022022404404999308', '0', 1, '2022-02-24 16:40:49'),
(310, 7, 24, 300, 150, 2, '2022022405535643316', '0', 1, '2022-02-24 17:53:56'),
(311, 102, 38, 33000, 33000, 1, '2022022809461648657', '0', 1, '2022-02-28 09:46:16'),
(312, 102, 41, 0, 0, 1, '2022022810180843157', '0', 1, '2022-02-28 10:18:08'),
(313, 102, 40, 1980, 1980, 1, '2022022810183625140', '0', 1, '2022-02-28 10:18:36'),
(314, 103, 15, 4000, 4000, 1, '2022022810261250251', '0', 1, '2022-02-28 10:26:12'),
(315, 102, 15, 4000, 4000, 1, '2022022810512265889', '0', 1, '2022-02-28 10:51:22'),
(316, 102, 41, 0, 0, 1, '2022022810521415061', '0', 1, '2022-02-28 10:52:14'),
(317, 102, 38, 33000, 33000, 1, '2022022810525170988', '0', 1, '2022-02-28 10:52:51');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_cate`
--

CREATE TABLE `tp_cate` (
  `cateId` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `twName` varchar(255) NOT NULL,
  `cnName` varchar(255) NOT NULL,
  `pid` int DEFAULT '0',
  `rand` varchar(20) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `cateDesc` text,
  `cateImage` varchar(100) DEFAULT NULL,
  `isdel` int DEFAULT '1',
  `status` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `tp_cate`
--

INSERT INTO `tp_cate` (`cateId`, `name`, `twName`, `cnName`, `pid`, `rand`, `sort`, `cateDesc`, `cateImage`, `isdel`, `status`) VALUES
(86, 'Facial Treatment', '美容護理療程', '美容护理疗程', 0, '3182', 0, '', './Public/Uploads/goods/2023-07-14/64b10716f4030.jpg', 0, ''),
(87, 'Body Treatment', '身體護理療程', '身体护理疗程', 0, '5858', 0, '', './Public/Uploads/goods/2023-07-14/64b107216e235.jpg', 0, '\r'),
(88, 'Facial', '面部療程', '面部疗程', 0, '7927', 0, '', './Public/Uploads/goods/2023-08-22/64e429fee7105.jpg', 1, NULL),
(89, 'test', '測試', '測試', 0, '8548', NULL, NULL, NULL, 0, NULL),
(90, '搞笑', '玩', '玩', 0, '9574', NULL, NULL, './Public/Uploads/goods/2023-07-07/64a79f0de6eb2.jpg', 0, NULL),
(91, 'test', '測試', '測試', 0, NULL, NULL, NULL, './Public/Uploads/goods/2023-07-13/64af6fdf73a7c.jpeg', 0, NULL),
(92, 'Body', '身體療程', '身体疗程', 0, '7267', NULL, NULL, './Public/Uploads/goods/2023-08-22/64e48bf6f3e1c.jpg', 1, NULL),
(93, 'Other', '其他', '其他', 0, '5361', NULL, NULL, './Public/Uploads/goods/2023-08-22/64e42a1d153dd.jpg', 1, NULL),
(94, 'Package', '組合療程', '组合疗程', 0, '2193', NULL, NULL, './Public/Uploads/goods/2023-08-22/64e42a2db9259.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_class`
--

CREATE TABLE `tp_class` (
  `classId` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pid` int DEFAULT '0',
  `level` int DEFAULT NULL,
  `rand` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `classDesc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `classImage` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isdel` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_class`
--

INSERT INTO `tp_class` (`classId`, `name`, `pid`, `level`, `rand`, `sort`, `classDesc`, `classImage`, `isdel`) VALUES
(1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1),
(22, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_favorite`
--

CREATE TABLE `tp_favorite` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `goodsId` int NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- 傾印資料表的資料 `tp_favorite`
--

INSERT INTO `tp_favorite` (`id`, `uid`, `goodsId`, `create_date`, `status`) VALUES
(194, 128, 123, '2023-03-24 09:24:31', 0),
(195, 208, 114, '2023-04-04 08:53:40', 0),
(202, 128, 114, '2023-04-16 04:04:53', 0),
(196, 208, 117, '2023-04-11 06:36:27', 0),
(197, 208, 116, '2023-04-12 10:00:02', 0),
(198, 208, 112, '2023-04-14 03:46:54', 0),
(199, 208, 122, '2023-04-14 03:47:04', 0),
(200, 208, 115, '2023-04-14 04:01:23', 0),
(201, 0, 119, '2023-04-14 04:12:05', 0),
(207, 0, 196, '2023-08-30 03:15:06', 0),
(204, 214, 175, '2023-07-07 05:07:16', 0),
(208, 223, 208, '2023-08-30 03:27:03', 0),
(206, 128, 208, '2023-08-15 08:24:05', 0),
(209, 227, 196, '2023-09-25 18:39:32', 0),
(210, 230, 208, '2023-10-18 09:35:17', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_getyhcard`
--

CREATE TABLE `tp_getyhcard` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `yhId` int DEFAULT NULL,
  `addDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT '0' COMMENT '0未抵扣，1抵扣了',
  `orderId` varchar(50) DEFAULT NULL,
  `score` int DEFAULT '0',
  `isdel` int DEFAULT '1',
  `usableTime` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

--
-- 傾印資料表的資料 `tp_getyhcard`
--

INSERT INTO `tp_getyhcard` (`id`, `uid`, `yhId`, `addDate`, `status`, `orderId`, `score`, `isdel`, `usableTime`) VALUES
(172, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(173, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(174, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(175, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(176, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(177, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(178, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(179, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(180, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(181, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(182, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(183, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(184, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(185, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(186, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(187, 128, NULL, '2023-03-30 03:57:36', 0, NULL, NULL, 1, 1),
(188, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(189, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(190, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(191, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(192, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(193, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(194, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(195, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(196, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(197, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(198, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(199, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(200, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(201, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(202, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(203, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(204, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(205, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(206, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(207, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(208, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(209, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(210, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(211, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(212, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(213, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(214, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(215, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(216, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(217, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(218, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(219, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(220, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(221, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(222, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(223, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(224, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(225, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(226, 128, NULL, '2023-03-30 03:57:37', 0, NULL, NULL, 1, 1),
(227, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(228, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(229, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(230, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(231, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(232, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(233, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(234, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(235, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(236, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(237, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(238, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(239, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(240, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(241, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(242, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(243, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(244, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(245, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(246, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(247, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(248, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(249, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(250, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(251, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(252, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(253, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(254, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(255, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(256, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(257, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(258, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(259, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(260, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(261, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(262, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(263, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(264, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(265, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(266, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(267, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(268, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(269, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(270, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(271, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(272, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(273, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(274, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(275, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(276, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(277, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(278, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(279, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(280, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(281, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(282, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(283, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(284, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(285, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(286, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(287, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(288, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(289, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(290, 128, NULL, '2023-03-30 03:57:38', 0, NULL, NULL, 1, 1),
(291, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(292, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(293, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(294, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(295, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(296, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(297, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(298, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(299, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(300, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(301, 128, NULL, '2023-03-30 03:57:39', 0, NULL, NULL, 1, 1),
(302, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(303, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(304, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(305, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(306, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(307, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(308, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(309, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(310, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(311, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(312, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(313, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(314, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(315, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(316, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(317, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(318, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(319, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(320, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(321, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(322, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(323, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(324, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(325, 128, NULL, '2023-03-30 03:57:40', 0, NULL, NULL, 1, 1),
(326, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(327, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(328, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(329, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(330, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(331, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(332, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(333, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(334, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(335, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(336, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(337, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(338, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(339, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(340, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(341, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(342, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(343, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(344, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(345, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(346, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(347, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(348, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(349, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(350, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(351, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(352, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(353, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(354, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(355, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(356, 128, NULL, '2023-03-30 03:57:41', 0, NULL, NULL, 1, 1),
(357, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(358, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(359, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(360, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(361, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(362, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(363, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(364, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(365, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(366, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(367, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(368, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(369, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(370, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(371, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(372, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(373, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(374, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(375, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(376, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(377, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(378, 128, NULL, '2023-03-30 03:57:42', 0, NULL, NULL, 1, 1),
(379, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(380, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(381, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(382, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(383, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(384, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(385, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(386, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(387, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(388, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(389, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(390, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(391, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(392, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(393, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(394, 128, NULL, '2023-03-30 03:57:43', 0, NULL, NULL, 1, 1),
(395, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(396, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(397, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(398, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(399, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(400, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(401, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(402, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(403, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(404, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(405, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(406, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(407, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(408, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(409, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(410, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(411, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(412, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(413, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(414, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(415, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(416, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(417, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(418, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(419, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(420, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(421, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(422, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(423, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(424, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(425, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(426, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(427, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(428, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(429, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(430, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(431, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(432, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(433, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(434, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(435, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(436, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(437, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(438, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(439, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(440, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(441, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(442, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(443, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(444, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(445, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(446, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(447, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(448, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(449, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(450, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(451, 128, NULL, '2023-03-30 03:57:44', 0, NULL, NULL, 1, 1),
(452, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(453, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(454, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(455, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(456, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(457, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(458, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(459, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(460, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(461, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(462, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(463, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(464, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(465, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(466, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(467, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(468, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(469, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(470, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(471, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(472, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(473, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(474, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(475, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(476, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(477, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(478, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(479, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(480, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(481, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(482, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(483, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(484, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(485, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(486, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(487, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(488, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(489, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(490, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(491, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(492, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(493, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(494, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(495, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(496, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(497, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(498, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(499, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(500, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(501, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(502, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(503, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(504, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(505, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(506, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(507, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(508, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(509, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(510, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(511, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(512, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(513, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(514, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(515, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(516, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(517, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(518, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(519, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(520, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(521, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(522, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(523, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(524, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(525, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(526, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(527, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(528, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(529, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(530, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(531, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(532, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(533, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(534, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(535, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(536, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(537, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(538, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(539, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(540, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(541, 128, NULL, '2023-03-30 03:57:45', 0, NULL, NULL, 1, 1),
(542, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(543, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(544, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(545, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(546, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(547, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(548, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(549, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(550, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(551, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(552, 128, NULL, '2023-03-30 03:57:46', 0, NULL, NULL, 1, 1),
(553, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(554, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(555, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(556, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(557, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(558, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(559, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(560, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(561, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(562, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(563, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(564, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(565, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(566, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(567, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(568, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(569, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(570, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(571, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(572, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(573, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(574, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(575, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(576, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(577, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(578, 128, NULL, '2023-03-30 03:57:47', 0, NULL, NULL, 1, 1),
(579, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(580, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(581, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(582, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(583, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(584, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(585, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(586, 128, NULL, '2023-03-30 03:57:48', 0, NULL, NULL, 1, 1),
(587, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(588, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(589, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(590, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(591, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(592, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(593, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(594, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(595, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(596, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(597, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(598, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(599, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(600, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(601, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(602, 128, NULL, '2023-03-30 03:57:50', 0, NULL, NULL, 1, 1),
(603, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(604, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(605, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(606, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(607, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(608, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(609, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(610, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(611, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(612, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(613, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(614, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(615, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(616, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(617, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(618, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(619, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(620, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(621, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(622, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(623, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(624, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(625, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(626, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(627, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(628, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(629, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(630, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(631, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(632, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(633, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(634, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(635, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(636, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(637, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(638, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(639, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(640, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(641, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(642, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(643, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(644, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(645, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(646, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(647, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(648, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(649, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(650, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(651, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(652, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(653, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(654, 128, NULL, '2023-03-30 03:57:51', 0, NULL, NULL, 1, 1),
(655, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(656, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(657, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(658, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(659, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(660, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(661, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(662, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(663, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(664, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(665, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(666, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(667, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(668, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(669, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(670, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(671, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(672, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(673, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(674, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(675, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(676, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(677, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(678, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(679, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(680, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(681, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(682, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(683, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(684, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(685, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(686, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(687, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(688, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(689, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(690, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(691, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(692, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(693, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(694, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(695, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(696, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(697, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(698, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(699, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(700, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(701, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(702, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(703, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(704, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(705, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(706, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(707, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(708, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(709, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(710, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(711, 128, NULL, '2023-03-30 03:57:52', 0, NULL, NULL, 1, 1),
(712, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(713, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(714, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(715, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(716, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(717, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(718, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(719, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(720, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(721, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(722, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(723, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(724, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(725, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(726, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(727, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(728, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(729, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(730, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(731, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(732, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(733, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(734, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(735, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(736, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(737, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(738, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(739, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(740, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(741, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(742, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(743, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(744, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(745, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(746, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(747, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(748, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(749, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(750, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(751, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(752, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(753, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(754, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(755, 128, NULL, '2023-03-30 03:57:53', 0, NULL, NULL, 1, 1),
(756, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(757, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(758, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(759, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(760, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(761, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(762, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(763, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(764, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(765, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(766, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(767, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(768, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(769, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(770, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(771, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(772, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(773, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(774, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(775, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(776, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(777, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(778, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(779, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(780, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(781, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(782, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(783, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(784, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(785, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(786, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(787, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(788, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(789, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(790, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(791, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(792, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(793, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(794, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(795, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(796, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(797, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(798, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(799, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(800, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(801, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(802, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(803, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(804, 128, NULL, '2023-03-30 03:57:54', 0, NULL, NULL, 1, 1),
(805, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(806, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(807, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(808, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(809, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(810, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(811, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(812, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(813, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(814, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(815, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(816, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(817, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(818, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(819, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(820, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(821, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(822, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(823, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(824, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(825, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(826, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(827, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(828, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(829, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(830, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(831, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(832, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(833, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(834, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(835, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(836, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(837, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(838, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(839, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(840, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(841, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(842, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(843, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(844, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(845, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(846, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(847, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(848, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(849, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(850, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(851, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(852, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(853, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(854, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(855, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(856, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(857, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(858, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(859, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(860, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(861, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(862, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(863, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(864, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(865, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(866, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(867, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(868, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(869, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(870, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(871, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(872, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(873, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(874, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(875, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(876, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(877, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(878, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(879, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(880, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(881, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(882, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(883, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(884, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(885, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(886, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(887, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(888, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(889, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(890, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(891, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(892, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(893, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(894, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(895, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(896, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(897, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(898, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(899, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(900, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(901, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(902, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(903, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(904, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(905, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(906, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(907, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(908, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(909, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(910, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(911, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(912, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(913, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(914, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(915, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(916, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(917, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(918, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(919, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(920, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(921, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(922, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(923, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(924, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(925, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(926, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(927, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(928, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(929, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(930, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(931, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(932, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(933, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(934, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(935, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(936, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(937, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(938, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(939, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(940, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(941, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(942, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(943, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(944, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(945, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(946, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(947, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(948, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(949, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(950, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(951, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(952, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(953, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(954, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(955, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(956, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(957, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(958, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(959, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(960, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(961, 128, NULL, '2023-03-30 03:57:55', 0, NULL, NULL, 1, 1),
(962, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(963, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(964, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(965, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(966, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(967, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(968, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(969, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(970, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(971, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(972, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(973, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(974, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(975, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(976, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(977, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(978, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(979, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(980, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(981, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(982, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(983, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(984, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(985, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(986, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(987, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(988, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(989, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(990, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(991, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(992, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(993, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(994, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(995, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(996, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(997, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(998, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(999, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1000, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1001, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1002, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1);
INSERT INTO `tp_getyhcard` (`id`, `uid`, `yhId`, `addDate`, `status`, `orderId`, `score`, `isdel`, `usableTime`) VALUES
(1003, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1004, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1005, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1006, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1007, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1008, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1009, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1010, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1011, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1012, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1013, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1014, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1015, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1016, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1017, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1018, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1019, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1020, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1021, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1022, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1023, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1024, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1025, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1026, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1027, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1028, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1029, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1030, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1031, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1032, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1033, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1034, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1035, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1036, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1037, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1038, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1039, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1040, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1041, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1042, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1043, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1044, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1045, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1046, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1047, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1048, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1049, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1050, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1051, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1052, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1053, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1054, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1055, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1056, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1057, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1058, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1059, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1060, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1061, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1062, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1063, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1064, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1065, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1066, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1067, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1068, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1069, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1070, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1071, 128, NULL, '2023-03-30 03:57:56', 0, NULL, NULL, 1, 1),
(1119, 128, 5, '2023-04-18 06:05:25', 0, NULL, 200, 0, 1),
(1118, 128, 4, '2023-04-18 06:05:24', 0, NULL, 200, 1, 1),
(1117, 208, 4, '2023-04-12 02:53:34', 0, NULL, 200, 1, 1),
(1116, 208, 5, '2023-04-04 09:38:38', 0, NULL, 200, 0, 1),
(1115, 207, 4, '2023-03-31 04:08:16', 0, NULL, 200, 1, 1),
(1114, 207, 5, '2023-03-31 04:07:29', 0, NULL, 200, 0, 1),
(1122, 128, 16, '2023-06-28 10:18:21', 0, NULL, NULL, 0, 1),
(1123, 128, 15, '2023-06-28 10:22:01', 0, NULL, 100, 1, 1),
(1124, 209, 17, '2023-07-05 07:53:03', 0, NULL, 0, 0, 1),
(1125, 214, 18, '2023-07-07 05:06:17', 0, NULL, 0, 0, 1),
(1126, 210, 17, '2023-07-07 12:40:11', 0, NULL, 0, 0, 1),
(1127, 217, 17, '2023-07-13 03:46:46', 0, NULL, 0, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_goods`
--

CREATE TABLE `tp_goods` (
  `id` int NOT NULL,
  `title` text,
  `name` varchar(255) NOT NULL,
  `twName` varchar(255) NOT NULL,
  `cnName` varchar(255) NOT NULL,
  `place` text,
  `coverImg` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `cateId` int DEFAULT NULL,
  `stock` int DEFAULT '0',
  `isShow` varchar(10) DEFAULT '1',
  `addDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rand` varchar(10) DEFAULT NULL,
  `goodsType` int DEFAULT '1' COMMENT '1商品，2优惠服务，3预约服务',
  `endDate` date DEFAULT NULL,
  `score` int DEFAULT '0',
  `isdel` int DEFAULT '1' COMMENT '0: 刪除 1:可用',
  `hour` float DEFAULT '0',
  `isPackage` int NOT NULL DEFAULT '0',
  `numberOfTimes` varchar(11) NOT NULL DEFAULT '0',
  `status` varchar(123) DEFAULT '1',
  `desc` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_goods`
--

INSERT INTO `tp_goods` (`id`, `title`, `name`, `twName`, `cnName`, `place`, `coverImg`, `price`, `cateId`, `stock`, `isShow`, `addDate`, `rand`, `goodsType`, `endDate`, `score`, `isdel`, `hour`, `isPackage`, `numberOfTimes`, `status`, `desc`) VALUES
(192, NULL, 'X9隔空殺脂排油療程(2PART)', 'X9隔空殺脂排油療程(2PART)', 'X9隔空殺脂排油療程(2PART)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '2088.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(190, NULL, 'VMAX HIFU 收緊(2PART)', 'VMAX HIFU 收緊(2PART)', 'VMAX HIFU 收緊(2PART)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(191, NULL, '一字膊筋膜放鬆還原術', '一字膊筋膜放鬆還原術', '一字膊筋膜放鬆還原術', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1088.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(188, NULL, '奇蹟抗紋修復療程', '奇蹟抗紋修復療程', '奇蹟抗紋修復療程', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(189, NULL, '人手造乳', '人手造乳', '人手造乳', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '2888.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(187, NULL, '陶瓷肌身體(一樽粉扣一次)', '陶瓷肌身體(一樽粉扣一次)', '陶瓷肌身體(一樽粉扣一次)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(186, NULL, '暖宮機', '暖宮機', '暖宮機', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 0.7, 0, '0', '', NULL),
(184, NULL, '收陰機(2PART)', '收陰機(2PART)', '收陰機(2PART)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(185, NULL, '無針注脂豐胸提升療程 可升級0.5次 UPGADE電波美乳', '無針注脂豐胸提升療程 可升級0.5次 UPGADE電波美乳', '無針注脂豐胸提升療程 可升級0.5次 UPGADE電波美乳', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(183, NULL, '增肌減脂(2PART)', '增肌減脂(2PART)', '增肌減脂(2PART)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(181, NULL, '360全身美白倉', '360全身美白倉', '360全身美白倉', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(182, NULL, '冷凍溶脂(2PART)', '冷凍溶脂(2PART)', '冷凍溶脂(2PART)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(180, NULL, 'PLASMA等離子無瑕背部', 'PLASMA等離子無瑕背部', 'PLASMA等離子無瑕背部', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '888.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(179, NULL, '勁量泡泡背部深層喚醒清潔', '勁量泡泡背部深層喚醒清潔', '勁量泡泡背部深層喚醒清潔', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1088.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(178, NULL, '脂肪面殺脂空氣炮AKA FAT FACE KILL FAT AIR BOMB', '脂肪面殺脂空氣炮AKA FAT FACE KILL FAT AIR BOMB', '脂肪面殺脂空氣炮AKA FAT FACE KILL FAT AIR BOMB', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '5288.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(176, NULL, '全效光子掃射儀', '全效光子掃射儀', '全效光子掃射儀', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '4888.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(177, NULL, '膠原2.0 AKA食屎啦 禾唔會再改特別既名 改完冇人讀原價', '膠原2.0 AKA食屎啦 禾唔會再改特別既名 改完冇人讀原價', '膠原2.0 AKA食屎啦 禾唔會再改特別既名 改完冇人讀原價', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '5288.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(175, NULL, '無痕填充納米彈滑鴨蛋炮AKA三號風球', '無痕填充納米彈滑鴨蛋炮AKA三號風球', '無痕填充納米彈滑鴨蛋炮AKA三號風球', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '5288.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(174, NULL, '醫療級FROZEN粉餅激光槍', '醫療級FROZEN粉餅激光槍', '醫療級FROZEN粉餅激光槍', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '5288.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(173, NULL, 'TITANIUM超微點點剝脫凹凸洞', 'TITANIUM超微點點剝脫凹凸洞', 'TITANIUM超微點點剝脫凹凸洞', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '2288.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(171, NULL, '終極皇牌HIFU', '終極皇牌HIFU', '終極皇牌HIFU', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '4288.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(172, NULL, '珊瑚針 x MASK ON! 百萬離子去黃抗敏注養機', '珊瑚針 x MASK ON! 百萬離子去黃抗敏注養機', '珊瑚針 x MASK ON! 百萬離子去黃抗敏注養機', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(170, NULL, '超強暗瘡終結PUMPS UPxEDELxPLASMA暗瘡抗糖化美白淡印療程', '超強暗瘡終結PUMPS UPxEDELxPLASMA暗瘡抗糖化美白淡印療程', '超強暗瘡終結PUMPS UPxEDELxPLASMA暗瘡抗糖化美白淡印療程', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(169, NULL, '全新排毒升級保濕泡泡收毛孔口罩肌', '全新排毒升級保濕泡泡收毛孔口罩肌', '全新排毒升級保濕泡泡收毛孔口罩肌', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(168, NULL, 'PLASMA等離子無瑕肌', 'PLASMA等離子無瑕肌', 'PLASMA等離子無瑕肌', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(166, NULL, '勁量泡泡面部深層喚醒清潔', '勁量泡泡面部深層喚醒清潔', '勁量泡泡面部深層喚醒清潔', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '888.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(167, NULL, '泰精靈霹靂閃亮眼部拉皮療程', '泰精靈霹靂閃亮眼部拉皮療程', '泰精靈霹靂閃亮眼部拉皮療程', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '2388.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(165, NULL, '皇牌膠原蛋白槍', '皇牌膠原蛋白槍', '皇牌膠原蛋白槍', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(163, NULL, '超強細胞BOOST UP療程', '超強細胞BOOST UP療程', '超強細胞BOOST UP療程', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1388.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(164, NULL, '淨白淡斑初戀肌療程', '淨白淡斑初戀肌療程', '淨白淡斑初戀肌療程', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1388.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(162, NULL, '強效保濕水光機/槍', '強效保濕水光機/槍', '強效保濕水光機/槍', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '488.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(161, NULL, '升級鑽石泡泡極致美白肌', '升級鑽石泡泡極致美白肌', '升級鑽石泡泡極致美白肌', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1088.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(160, NULL, '無針埋線', '無針埋線', '無針埋線', '-', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(159, NULL, '泰好玩霹靂頸部抗皺療程', '泰好玩霹靂頸部抗皺療程', '泰好玩霹靂頸部抗皺療程', '-', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1588.00', 86, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(193, NULL, '終極皇牌C7無創標靶抽脂療程(2PART)', '終極皇牌C7無創標靶抽脂療程(2PART)', '終極皇牌C7無創標靶抽脂療程(2PART)', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '4288.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(194, NULL, '腋下美白療程', '腋下美白療程', '腋下美白療程', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '4288.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(195, NULL, '身體光子 濕疹/暗瘡/毛囊角化症/美白淡印', '身體光子 濕疹/暗瘡/毛囊角化症/美白淡印', '身體光子 濕疹/暗瘡/毛囊角化症/美白淡印', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '3288.00', 87, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', NULL),
(196, NULL, 'Deep Clean Facial Treatment', '10次深層清潔療程', '10次深层清洁疗程', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-08-22\\/64e48ad6371c0.jpg\"]', '1888.00', 88, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 1, 0.35, 0, '0', '', '5LiA5YCL55mC56iL5Y+v6YGU6Ie05rex5bGk5riF5r2U44CB5rOo5rCn5pu05paw44CB57eK57e75o+Q5Y2H44CB6Iag5Y6f5aKe6ZW35Lul5Y+K5ruL5r2k5L+u5b6p77yB'),
(197, NULL, 'Hot Stone Spa Treatment for Belly', '熱石暖宮療程', '热石暖宫疗程', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-08-22\\/64e48ac444343.jpg\"]', '2388.00', 92, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 1, 0.35, 0, '0', '', '5rex5Y+X5a6i5Lq65q2h6L+O55qE44CM54ax55+z5pqW5a6u5pS+6ayG57WE5ZCI44CN77yM5YWo6Lqr57aT57Wh6YO95b6X5Lul5pS+6ayG5aSW77yM5pu05pyD6YeN6bue5oyJ5pGp6IW56YOo5ZKM6aCt6YOo77yM5pei6aSK55Sf5Y+I5Y+v6IiS57ep55ay5Yue44CC'),
(198, NULL, '8次暖宮機20MINS+收陰機15MINS', '8次暖宮機20MINS+收陰機15MINS', '8次暖宮機20MINS+收陰機15MINS', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1888.00', 88, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 0.6, 0, '0', '', NULL),
(199, NULL, '暖宮機20MINS+收陰機15MINS 任做三個月', '暖宮機20MINS+收陰機15MINS 任做三個月', '暖宮機20MINS+收陰機15MINS 任做三個月', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '2388.00', 88, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 0.6, 0, '0', '', NULL),
(200, NULL, '美白倉+暖宮機+收陰機 任做三個月', '美白倉+暖宮機+收陰機 任做三個月', '美白倉+暖宮機+收陰機 任做三個月', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-08-16\\/64dc3d2827f4d.jpg\"]', '4000.00', 94, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 1, 1, 1, '1000', '', '57WE5ZCI6aCF55uu5LuL57S5DQrljIXlkKvkuIDmrKHnvo7nmb3poIXnm64NCuWMheWQq+S4gOasoea4hea9lOmgheebrg=='),
(201, NULL, '10次觀塘屎屎大優惠', '10次觀塘屎屎大優惠', '10次觀塘屎屎大優惠', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '3888.00', 88, 1, '1', '2023-06-21 07:03:08', NULL, 1, NULL, 1, 0, 1, 0, '0', '', 'IA=='),
(202, NULL, 'Wedding Makeup Services', '123', '123', '123', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1.00', 89, 1, '1', '2023-07-04 07:19:25', NULL, 1, NULL, 0, 0, 0, 0, '0', '1', 'MTIz'),
(204, NULL, 'testing product', '測試', '測試', '', '[\"./Public/Uploads/goods/2023-07-05/64a518feb72f2.jpeg\"]', '1.00', 86, 1, '1', '2023-07-05 03:34:17', NULL, 1, NULL, 0, 0, 2, 1, '2', '1', '5ris6Kmm55Si5ZOB'),
(205, NULL, 'Test200', '測試200', '测试200', '2', '[\".\\/Public\\/Uploads\\/goods\\/2023-07-07\\/64a79f63f1a29.png\"]', '1.00', 87, 22, '1', '2023-07-07 05:15:15', NULL, 1, NULL, 0, 0, 0, 0, '0', '1', '6Ieq5bex552H5ZWm'),
(206, NULL, '測試', '測試', '測試', '1', '[\".\\/Public\\/Uploads\\/goods\\/2023-07-13\\/64af7074ea7a2.jpeg\"]', '148.00', 89, 10, '1', '2023-07-13 03:33:08', NULL, 1, NULL, 0, 0, 2, 0, '0', '1', '5ris6Kmm'),
(207, NULL, 'Nail Polish', '美甲', '美甲', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-07-14\\/64b10b99f2164.jpg\"]', '1.00', 92, 10000, '1', '2023-07-14 08:47:21', NULL, 1, NULL, 0, 0, 2, 1, '5', '1', '5ris6Kmm'),
(208, NULL, 'HIFU V Shape Treatment', 'HIFU V面療程', 'HIFU V面療程', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-08-16\\/64dc3d17020d6.jpg\"]', '12888.00', 88, 1111, '1', '2023-08-11 03:39:38', NULL, 1, NULL, 0, 1, 2, 1, '5', '1', '5LiA5YCL55mC56iL77yM55im6Z2i44CB55im6ZuZ5LiL5be044CBVumdog0KDQrpnZ7kuIDoiKwgSElGVeapn+aViOaenO+8gTPmraXnt4rnt7vpnaLpg6jovKrlu5PvvIzmv4DmtLvohqDljp/lop7nlJ/vvIzmt7HlsaTkv53mv5Xms6jppIrlu7bmlYjjgIINCg0K'),
(209, NULL, 'Body Massage Treatment Package', '肩頸經絡放鬆按摩療程', '肩颈经络放松按摩疗程', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-08-22\\/64e48a56d5c9e.jpg\"]', '3400.00', 92, 200, '1', '2023-08-14 07:18:29', NULL, 1, NULL, 0, 1, 1, 1, '10', '1', '6IKp6aC46IaK5pS+6ayG55mC56iLLiDpgI/pgY7msrvnmYLluKvku5TntLDnmoToqZXkvLDlj4rop7joqLrvvIzmib7lh7rmgqPogIXnmoTogqnpoLjohorpg6jnl5vnl4fogoznvqTvvIzpgLLooYzmiYvms5XmjInmkanlkoznnJ/nqbrmu5HnvZDmsrvnmYLjgII='),
(210, NULL, 'Nail Polish', '美甲', '美甲', '', '[\".\\/Public\\/Uploads\\/goods\\/2023-08-22\\/64e48a4a34038.jpg\"]', '350.00', 93, 100, '1', '2023-08-14 07:55:43', NULL, 1, NULL, 0, 1, 2, 0, '0', '1', '5Li75omT5bm06LyV5pel57O76Lev57ea55qE576O55Sy6Kit6KiI5qy+5byP');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_homebanner`
--

CREATE TABLE `tp_homebanner` (
  `id` int NOT NULL,
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_icelandic_ci DEFAULT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_icelandic_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_icelandic_ci NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `isdel` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `tp_homebanner`
--

INSERT INTO `tp_homebanner` (`id`, `title`, `subtitle`, `content`, `image`, `isdel`) VALUES
(53, 'eshkhk', '', '', './Public/Uploads/goods/2023-07-07/64a79ff6c4531.jpg', 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_html`
--

CREATE TABLE `tp_html` (
  `id` int NOT NULL,
  `navTitle` varchar(50) DEFAULT NULL,
  `content` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_html`
--

INSERT INTO `tp_html` (`id`, `navTitle`, `content`) VALUES
(1, 'City Computer Limited', '城市電腦有限公司（CITY ）主要售賣電腦零件，周邊設備， 維修等。');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_location`
--

CREATE TABLE `tp_location` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isdel` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_location`
--

INSERT INTO `tp_location` (`id`, `name`, `isdel`) VALUES
(3, '香港島', '1'),
(1, '九龍', '1'),
(2, '新界', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_locations`
--

CREATE TABLE `tp_locations` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cateId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `isdel` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_locations`
--

INSERT INTO `tp_locations` (`id`, `name`, `code`, `cateId`, `isdel`) VALUES
(234, '香港新界沙田區大圍美田路1號名城一期C層中轉大堂順豐智能櫃(只供住戶使用)', 'H852FG61P', '2', '1'),
(235, '香港新界沙田區大圍美田路1號名城三期中轉大堂單車停泊區旁順豐智能櫃(只供住戶使用)+', 'H852FG63P', '2', '1'),
(236, '香港新界沙田區大圍翠田街5-7號金獅花園一期E座地下順豐智能櫃(只供住戶使用)+', 'H852FE18P', '2', '1'),
(237, '香港新界沙田區大圍隔田街1-3號金獅花園二期金福閣地下順豐智能櫃(只供住戶使用)', 'H852FE35P', '2', '1'),
(238, '香港新界沙田區大圍金獅花園二期金福閣地下二號順豐智能櫃(只供住戶使用)', 'H852FG93P', '2', '1'),
(239, '香港新界沙田區大圍美田商場2樓順豐智能櫃(落地玻璃旁)', 'H852FE06P', '2', '1'),
(240, '香港新界沙田區大圍美田路30號美林商場1樓順豐智能櫃(郵政局旁)', 'H852FE01P', '2', '1'),
(241, '香港新界沙田區大圍海福花園地下16A及17號舖順豐智能櫃(順豐站旁)^', 'H852FG96P', '2', '1'),
(242, '香港新界沙田區大圍海福花園地下16A及17舖(順豐站)二號順豐智能櫃^', 'H852FG97P', '2', '1'),
(243, '香港新界沙田區大圍隆亨商場2樓LK02位置順豐智能櫃 (近酒樓正門)', 'H852FG64P', '2', '1'),
(244, '香港新界沙田區大圍翠田街2號新翠商場2樓順豐智能櫃(稻香酒樓轉彎,診所對面)', 'H852FE04P', '2', '1'),
(245, '香港新界沙田區大圍車公廟路8號溱岸8號地下順豐智能櫃(電梯大堂外面)(只供住戶使用)', 'H852FG65P', '2', '1'),
(246, '香港新界沙田區大圍顯徑商場地下順豐智能櫃(萬寧旁)', 'H852FE08P', '2', '1'),
(247, '香港新界沙田區大圍雲頂峰大堂禮賓部順豐智能櫃(只供雲頂峰住戶使用)', 'H852FG02P', '2', '1'),
(248, '香港新界沙田區大圍美柏苑正門地下順豐智能櫃(只供住戶使用)', 'H852FG03P', '2', '1'),
(249, '香港新界沙田區大圍瑞峰花園2座平台順豐智能櫃(只供住戶使用)', 'H852FG04P', '2', '1'),
(250, '香港新界沙田區大圍顯泰街8號聚龍居停車場順豐智能櫃(只供住戶使用)', 'H852FH01P', '2', '1'),
(251, '香港新界沙田區大圍碧田街18號恒峰花園平台順豐智能櫃(只供住戶使用)+', 'H852FH02P', '2', '1'),
(252, '香港新界沙田區沙田水泉澳邨水泉澳廣場2樓210號舖順豐智能櫃(附設特大格口靠左邊櫃機)+', 'H852FE34P', '2', '1'),
(253, '香港新界沙田區沙田水泉澳邨水泉澳廣場2樓210號舖二號順豐智能櫃(沒有特大格口靠右邊櫃機)', 'H852FE32P', '2', '1'),
(254, '香港新界沙田區沙田崗背街9-11號全輝中心商埸地下7號舖(LaundrYup洗衣店)順豐智能櫃', 'H852FE43P', '2', '1'),
(255, '香港新界沙田區沙田好運中心L4平台技工房外牆順豐智能櫃(近5號梯)', 'H852FE71P', '2', '1'),
(256, '香港新界沙田區沙田玖瓏山地庫停車場順豐智能櫃(只供住戶使用)', 'H852F069P', '2', '1'),
(257, '香港新界沙田區沙田京瑞廣場二期2樓238-239號舖順豐智能櫃+', 'H852FB90P', '2', '1'),
(258, '香港新界沙田區沙田京瑞廣場二期2樓238-239號舖二號順豐智能櫃+', 'H852FB91P', '2', '1'),
(259, '香港新界沙田區沙田京瑞廣場二期2樓238-239號舖三號順豐智能櫃+', 'H852FB92P', '2', '1'),
(260, '香港新界沙田區沙田圓洲角源順圍2號冠華大廈地下順豐智能櫃(面向愉翠苑)', 'H852FB25P', '2', '1'),
(261, '香港新界沙田區沙田小瀝源小瀝源路68號康林苑圓形廣場順豐智能櫃', 'H852FE48P', '2', '1'),
(262, '香港新界沙田區沙田沙角街6號博康邨博安樓地下順豐智能櫃(近互委會)+', 'H852FE14P', '2', '1'),
(263, '香港新界沙田區沙田沙角街6號博康邨博智樓地下順豐智能櫃', 'H852FE47P', '2', '1'),
(264, '香港新界沙田區沙田沙角街6號博康邨博裕樓地下順豐智能櫃(近正門)+', 'H852FE15P', '2', '1'),
(265, '香港新界沙田區沙田大涌橋路52號富豪花園商場地下順豐智能櫃(近Neway卡拉OK)+', 'H852FE16P', '2', '1'),
(266, '香港新界沙田區沙田銀城街11-23號愉田苑F座愉悅閣地下順豐智能櫃(近惠康超級市場)', 'H852FE03P', '2', '1'),
(267, '香港新界沙田區沙田正街2-8號新城市廣場三期住宅B大堂地庫1樓順豐智能櫃(只供住戶使用)+', 'H852FE10P', '2', '1'),
(268, '香港新界沙田區沙田翠湖花園一期C座平台地下順豐智能櫃(只供住戶使用)', 'H852FE98P', '2', '1'),
(269, '香港新界沙田區沙田小瀝源廣源商場2座1樓順豐智能櫃(近髮廊與八方雲集)', 'H852FE95P', '2', '1'),
(270, '香港新界沙田區沙田小瀝源牛皮沙街2號愉翠商場平台順豐智能櫃', 'H852FB02P', '2', '1'),
(271, '香港新界沙田區沙田穗禾苑詠茂閣(G座)地下順豐智能櫃(只供住戶使用)', 'H852F082P', '2', '1'),
(272, '香港新界沙田區沙田穗禾苑慶宏閣(D座)地下順豐智能櫃(只供住戶使用)+', 'H852F081P', '2', '1'),
(273, '香港新界沙田區沙田穗禾苑豐裕閣(A座)地下順豐智能櫃(只供住戶使用)', 'H852F080P', '2', '1'),
(274, '香港新界沙田區沙田禾輋街市地下順豐智能櫃(近花店出入口)', 'H852F002P', '2', '1'),
(275, '香港新界沙田區沙田帝堡城1座地下順豐智能櫃(上落貨區)(只供住戶使用)', 'H852FE49P', '2', '1'),
(276, '香港新界沙田區沙田豐盛苑A座地下順豐智能櫃', 'H852FG01P', '2', '1'),
(277, '香港新界沙田區沙田沙田廣場平台花園L4順豐智能櫃', 'H852FE70P', '2', '1'),
(278, '香港新界沙田區沙田沙角商場2樓順豐智能櫃', 'H852FE65P', '2', '1'),
(279, '香港新界沙田區馬鞍山沙安街23號利安商場LG1層順豐智能櫃(郵局對面)', 'H852FE55P', '2', '1'),
(280, '香港新界沙田區馬鞍山沙安街23號利安商場LG2層順豐智能櫃(日本城對面)', 'H852FE56P', '2', '1'),
(281, '香港新界沙田區馬鞍山利安商場LG3 層順豐智能櫃(電梯背面，近麥當勞)', 'H852FE57P', '2', '1'),
(282, '香港新界沙田區馬鞍山恆智街3號欣安邨欣悅樓地下順豐智能櫃+', 'H852FE27P', '2', '1'),
(283, '香港新界沙田區馬鞍山迎海笫18,19座(21號穿梭電梯)B層停車場地庫大堂順豐智能櫃(只供住戶使用)', 'H852FE79P', '2', '1'),
(284, '香港新界沙田區馬鞍山鞍駿街23號迎濤灣廣場1樓順豐智能櫃(扶手電梯附近)+', 'H852FE17P', '2', '1'),
(285, '香港新界沙田區馬鞍山恆安邨恆峰樓地下順豐智能櫃+', 'H852FE13P', '2', '1'),
(286, '香港新界沙田區馬鞍山恆安邨順豐智能櫃(巴士總站對出位置)', 'H852FE31P', '2', '1'),
(287, '香港新界沙田區馬鞍山恆安邨巴士總站對出位置二號順豐智能櫃', 'H852FE86P', '2', '1'),
(288, '香港新界沙田區馬鞍山恆安邨恆峰樓地下二號順豐智能櫃+', 'H852FE30P', '2', '1'),
(289, '香港新界沙田區馬鞍山恆信街2號富安花園商場地下順豐智能櫃(商場外/近10座)', 'H852FE51P', '2', '1'),
(290, '香港新界沙田區馬鞍山錦英路6號富寶花園商場F20號舖順豐智能櫃', 'H852FE02P', '2', '1'),
(291, '香港新界沙田區馬鞍山富寶花園2座地下順豐智能櫃(只供住戶使用)', 'H852FE67P', '2', '1'),
(292, '香港新界沙田區馬鞍山新港城2期地下近C座停車場順豐智能櫃(只供住戶使用) +', 'H852FE68P', '2', '1'),
(293, '香港新界沙田區馬鞍山鞍誠街18號新港城一期A及B座地下停車場順豐智能櫃+', 'H852FE78P', '2', '1'),
(294, '香港新界沙田區馬鞍山鞍祿街18號新港城四期F座地下順豐智能櫃(近電梯大堂)+', 'H852FE40P', '2', '1'),
(295, '香港新界沙田區馬鞍山鞍祿街18號新港城四期H座地下順豐智能櫃(近電梯大堂)+', 'H852FE41P', '2', '1'),
(296, '香港新界沙田區馬鞍山頌安商場地下順豐智能櫃(往街市通道)', 'H852FE07P', '2', '1'),
(297, '香港新界沙田區馬鞍山沙安街9號翠擁華庭6座地下順豐智能櫃(對面L1停車場)(只供住戶使用)+', 'H852FE23P', '2', '1'),
(298, '香港新界沙田區馬鞍山銀湖天峰2樓順豐智能櫃(管理處側)(只供住戶使用)', 'H852FE99P', '2', '1'),
(299, '香港新界沙田區馬鞍山沃泰街8號曉峯灣畔主大堂上層順豐智能櫃(只供住戶使用)+', 'H852FE22P', '2', '1'),
(300, '香港新界沙田區馬鞍山錦英商場2樓順豐智能櫃(惠康超級市場對出)+', 'H852FE05P', '2', '1'),
(301, '香港新界沙田區馬鞍山錦英路9號錦英商場2樓二號順豐智能櫃(街市門外)+', 'H852FE29P', '2', '1'),
(302, '香港新界沙田區馬鞍山錦泰苑錦泰商場地下順豐智能櫃(近電梯大堂)', 'H852FE58P', '2', '1'),
(303, '香港新界沙田區馬鞍山錦龍苑龍昇閣地下順豐智能櫃', 'H852FE33P', '2', '1'),
(304, '香港新界沙田區馬鞍山恆康街6號錦禧苑錦榮閣地下順豐智能櫃', 'H852FE75P', '2', '1'),
(305, '香港新界沙田區馬鞍山錦豐苑錦菱閣地下順豐智能櫃(管理處旁)(只供錦豐苑住戶使用)+', 'H852FE44P', '2', '1'),
(306, '香港新界沙田區馬鞍山西沙路638號錦豐苑錦蘭閣地下順豐智能櫃', 'H852FE54P', '2', '1'),
(307, '香港新界沙田區馬鞍山恆康街2號耀安邨耀和樓天橋順豐智能櫃+', 'H852FE21P', '2', '1'),
(308, '香港新界沙田區馬鞍山耀安邨耀和樓行人天橋二號順豐智能櫃', 'H852FE66P', '2', '1'),
(309, '香港新界沙田區馬鞍山恆康街2號耀安邨耀和樓地下順豐智能櫃', 'H852FE20P', '2', '1'),
(310, '香港新界沙田區馬鞍山恆康街2號耀安邨耀欣樓地下順豐智能櫃', 'H852FE19P', '2', '1'),
(311, '香港新界沙田區馬鞍山聽濤雅苑停車場入口地下順豐智能櫃(只供住戶使用)', 'H852FE88P', '2', '1'),
(312, '香港新界沙田區馬鞍山聽濤雅苑會所4號升降機大堂地下順豐智能櫃(只供住戶使用)', 'H852FE89P', '2', '1'),
(313, '香港新界沙田區馬鞍山保泰街16號We Go Mall G09舖(順豐站)一號順豐智能櫃^', 'H852FE80P', '2', '1'),
(314, '香港新界沙田區馬鞍山保泰街16號We Go Mall G09舖(順豐站)二號順豐智能櫃^', 'H852FE81P', '2', '1'),
(315, '香港新界沙田區馬鞍山翠擁華庭11座地下停車場升降機大堂外順豐智能櫃(只供住戶使用)', 'H852FE12P', '2', '1'),
(316, '香港新界沙田區馬鞍山富安花園商場二號順豐智能櫃(恆生櫃員機旁)', 'H852FE28P', '2', '1'),
(317, '香港新界沙田區馬鞍山錦泰商場1樓順豐智能櫃(幼稚園外)', 'H852FE61P', '2', '1'),
(318, '香港新界沙田區馬鞍山福安花園商場UG側門順豐智能櫃(亮齒牙醫診所旁)', 'H852FE62P', '2', '1'),
(319, '香港新界沙田區馬鞍山富寶花園停車場地下順豐智能櫃(管理處旁)(只供住戶使用)', 'H852FE63P', '2', '1'),
(320, '香港新界沙田區馬鞍山雲海香海臺地下1座側順豐智能櫃 (只供住戶使用)', 'H852FE64P', '2', '1'),
(321, '香港新界沙田區馬鞍山薈朗冷氣機房2對面順豐智能櫃(只供住戶使用)', 'H852FE69P', '2', '1'),
(322, '香港新界沙田區馬鞍山星漣海順豐智能櫃(T3C側)(只供住戶使用)', 'H852FE73P', '2', '1'),
(323, '香港新界沙田區火炭樂景街2-18號銀禧花園1座平台順豐智能櫃(近商場入口)(只供住戶使用)', 'H852F049P', '2', '1'),
(324, '香港新界沙田區火炭駿景園廣場地下順豐智能櫃', 'H852F004P', '2', '1'),
(325, '香港新界沙田區火炭穗禾路13號穗禾苑商場地下11及12號舖側順豐智能櫃', 'H852F011P', '2', '1'),
(326, '香港新界大埔區大埔鄉事會街9號大日子廣場2樓順豐智能櫃', 'H852AA26P', '2', '1'),
(327, '香港新界大埔區大埔鄉事會街9號大日子廣場3樓順豐智能櫃', 'H852AA27P', '2', '1'),
(328, '香港新界大埔區大埔太和邨安和樓地下二號順豐智能櫃 (近商場)', 'H852AA61P', '2', '1'),
(329, '香港新界大埔區大埔太和邨亨和樓地下順豐智能櫃(近法團會議室)+', 'H852AA21P', '2', '1'),
(330, '香港新界大埔區大埔太和邨福和樓地下順豐智能櫃', 'H852AA60P', '2', '1'),
(331, '香港新界大埔區大埔太和路12號太和廣場1樓順豐智能櫃(喜和樓街市門口扶手電梯旁)', 'H852AA04P', '2', '1'),
(332, '香港新界大埔區大埔三門仔路23號比華利山別墅萊茵道停車場順豐智能櫃(只供住戶使用)+', 'H852AA15P', '2', '1'),
(333, '香港新界大埔區大埔安慈路4號昌運中心地下A7號舖(一號櫃)順豐智能櫃^', 'H852AA44P', '2', '1'),
(334, '香港新界大埔區大埔安慈路4號昌運中心地下A7號舖(二號櫃)順豐智能櫃^', 'H852AA53P', '2', '1'),
(335, '香港新界大埔區大埔梅樹坑路8號帝欣苑一期停車場順豐智能櫃(只供住戶使用)', 'H852AA13P', '2', '1'),
(336, '香港新界大埔區大埔梅樹坑路3號帝欣苑二期地下順豐智能櫃(只供住戶使用)+', 'H852AA30P', '2', '1'),
(337, '香港新界大埔區大埔淺月灣一期停車場順豐智能櫃(只供住戶使用)', 'H852AA51P', '2', '1'),
(338, '香港新界大埔區大埔淺月灣二期會所順豐智能櫃(只供住戶使用)', 'H852AA54P', '2', '1'),
(339, '香港新界大埔區大埔圍頭村163號(寵物國度)順豐智能櫃(康樂園對面, 圍頭村牌坊旁)', 'H852AA06P', '2', '1'),
(340, '香港新界大埔區大埔頌雅路6號富亨商場地下一號順豐智能櫃(管理處旁)', 'H852AA55P', '2', '1'),
(341, '香港新界大埔區大埔頌雅路6號富亨邨亨盛樓地下二號順豐智能櫃 (居民大閘旁)', 'H852AA67P', '2', '1'),
(342, '香港新界大埔區大埔富亨邨亨隆樓地下順豐智能櫃', 'H852AA56P', '2', '1'),
(343, '香港新界大埔區大埔富亨邨亨榮樓地下順豐智能櫃', 'H852AA57P', '2', '1'),
(344, '香港新界大埔區大埔頌雅路6號富亨商場地下一號順豐智能櫃(近洗手間位置)', 'H852AA14P', '2', '1'),
(345, '香港新界大埔區大埔富善邨善群樓地下順豐智能櫃(大堂側門旁)+', 'H852AA09P', '2', '1'),
(346, '香港新界大埔區大埔富善商場1樓順豐智能櫃', 'H852AA74P', '2', '1'),
(347, '香港新界大埔區大埔嵐山(往1座及2座路徑)順豐智能櫃 (只供住戶使用)', 'H852AA49P', '2', '1'),
(348, '香港新界大埔區大埔曉運路10號運頭塘商場地下順豐智能櫃(商場落貨區旁)', 'H852AA02P', '2', '1'),
(349, '香港新界大埔區大埔運頭塘商場地下二號順豐智能櫃', 'H852AA50P', '2', '1'),
(350, '香港新界大埔區大埔頌雅苑頌美閣地下順豐智能櫃', 'H852AA52P', '2', '1'),
(351, '香港新界大埔區大埔露輝路33號嘉豐花園地下(村巴站)順豐智能櫃(只供住戶使用)+', 'H852AA24P', '2', '1'),
(352, '香港新界大埔區大埔北盛街19號熙泰樓地下B號舖順豐智能櫃', 'H852AA10P', '2', '1'),
(353, '香港新界大埔區大埔安泰路1號大埔廣場商場1樓順豐智能櫃(行人電梯大堂)+', 'H852AA37P', '2', '1'),
(354, '香港新界大埔區大埔廣福商場2樓LK03順豐智能櫃', 'H852AA63P', '2', '1'),
(355, '香港新界大埔區大埔大元商場地下LK01順豐智能櫃(近商場指示牌)', 'H852AA64P', '2', '1'),
(356, '香港新界大埔區大埔寶雅苑地下停車場順豐智能櫃', 'H852AA47P', '2', '1'),
(357, '香港新界大埔區大埔頌雅路6號富亨商場地下二號順豐智能櫃(麵飽先生旁)', 'H852AA75P', '2', '1'),
(358, '香港新界大埔區大埔太和路15號太和中心地下30號舖(順豐站)一號順豐智能櫃^', 'H852AA83P', '2', '1'),
(359, '香港新界大埔區大埔太和路15號太和中心地下30號舖(順豐站)二號順豐智能櫃^', 'H852AA84P', '2', '1'),
(360, '香港新界大埔區大埔山塘路8號天鑽地下會所閱讀室順豐智能櫃 (只供住戶使用)', 'H852AA89P', '2', '1'),
(361, '香港新界大埔區大埔科學園三期12W座地下順豐智能櫃', 'H852FB01P', '2', '1'),
(362, '香港新界大埔區大埔天賦海灣一期B層停車場順豐智能櫃(只供住戶使用)', 'H852F003P', '2', '1'),
(363, '香港新界大埔區大埔御峰豪園健身室側順豐智能櫃(只供住戶使用)', 'H852AA72P', '2', '1'),
(364, '香港新界大埔區大埔廣福道3號地下C舖 (365 Laundry)順豐智能櫃', 'H852AA82P', '2', '1'),
(365, '香港新界大埔區大埔廣福商場2樓LK05二號順豐智能櫃(祥滿藥房旁)', 'H852AA85P', '2', '1'),
(366, '香港新界大埔區大埔海日灣會所閱讀室內順豐智能櫃(只供住戶使用)', 'H852F005P', '2', '1'),
(367, '香港新界大埔區大埔科進路16號嘉熙2座地下大堂側順豐智能櫃(只供住戶使用)', 'H852F006P', '2', '1'),
(368, '香港新界大埔區大埔科進路12號雲滙停車場10座地庫大堂側順豐智能櫃(只供住戶使用)', 'H852F008P', '2', '1'),
(369, '香港新界大埔區大埔白石角創新路18號海日灣二期會所地庫順豐智能櫃', 'H852F009P', '2', '1'),
(370, '香港新界大埔區大埔科研路7號朗濤地下穿梭巴士大堂順豐智能櫃(只供住戶使用)', 'H852F010P', '2', '1'),
(371, '香港新界大埔區大埔新達廣場平台第三座控制室側順豐智能櫃(只供住戶使用)', 'H852AA91P', '2', '1'),
(372, '香港新界大埔區大埔逸瓏灣8 LG層3C座旁順豐智能櫃(只供住戶使用)', 'H852F012P', '2', '1'),
(373, '香港新界北區粉嶺華明路15號欣盛苑停車場大堂地下順豐智能櫃', 'H852A043P', '2', '1'),
(374, '香港新界北區粉嶺粉嶺中心地下17B號舖順豐智能櫃', 'H852A065P', '2', '1'),
(375, '香港新界北區粉嶺華明邨康明樓地下順豐智能櫃+', 'H852A033P', '2', '1'),
(376, '香港新界北區粉嶺華明邨添明樓地下順豐智能櫃', 'H852A034P', '2', '1'),
(377, '香港新界北區粉嶺華明邨禮明樓地下順豐智能櫃', 'H852A032P', '2', '1'),
(378, '香港新界北區粉嶺馬適路1號逸峯停車場地下順豐智能櫃', 'H852A041P', '2', '1'),
(379, '香港新界北區粉嶺馬適路1號逸峯商場地下G19號舖順豐智能櫃+', 'H852A006P', '2', '1'),
(380, '香港新界北區粉嶺華明路22號雍盛商場1樓順豐智能櫃(停車場升降機大堂)', 'H852A003P', '2', '1'),
(381, '香港新界北區粉嶺百和路嘉盛苑嘉耀閣地下順豐智能櫃', 'H852A042P', '2', '1'),
(382, '香港新界北區粉嶺嘉福商場地下順豐智能櫃(百佳超級市場旁邊通道)+', 'H852A012P', '2', '1'),
(383, '香港新界北區粉嶺碧湖商場AEON高層地下22至29號舖及29A號舖順豐智能櫃(家品區)', 'H852A068P', '2', '1'),
(384, '香港新界北區粉嶺綠悠軒商場2樓17H舖順豐智能櫃', 'H852A069P', '2', '1'),
(385, '香港新界北區粉嶺綠悠軒商場2樓17H舖二號智能櫃順豐智能櫃+', 'H852A070P', '2', '1'),
(386, '香港新界北區粉嶺聯昌街31號地下(365 Laundry)順豐智能櫃', 'H852A066P', '2', '1'),
(387, '香港新界北區粉嶺花都廣場地下順豐智能櫃', 'H852A078P', '2', '1'),
(388, '香港新界北區粉嶺百和路88號花都廣場地下二號順豐智能櫃', 'H852A090P', '2', '1'),
(389, '香港新界北區上水智昌路3號上水中心2樓順豐智能櫃(2028號舖對面)', 'H852A035P', '2', '1'),
(390, '香港新界北區上水天平商場近101號舖地下順豐智能櫃(近百佳超級市場)', 'H852A039P', '2', '1'),
(391, '香港新界北區上水太平邨平治樓2樓順豐智能櫃(近天橋位置)', 'H852A073P', '2', '1'),
(392, '香港新界北區上水御皇庭第1座地下順豐智能櫃(只供住戶使用)', 'H852A058P', '2', '1'),
(393, '香港新界北區上水清曉路8號御景峰1樓大堂順豐智能櫃(只供住戶使用) +', 'H852A048P', '2', '1'),
(394, '香港新界北區上水清河邨清澤樓地下順豐智能櫃', 'H852A016P', '2', '1'),
(395, '香港新界北區上水清河邨清澤樓地下二號順豐智能櫃', 'H852A028P', '2', '1'),
(396, '香港新界北區上水祥龍圍邨呈祥樓地下順豐智能櫃+', 'H852A017P', '2', '1'),
(397, '香港新界北區上水智昌路8號順欣花園停車場入口地下順豐智能櫃', 'H852A022P', '2', '1'),
(398, '香港新界北區上水上水中心地下順豐智能櫃(近中國銀行)', 'H852A062P', '2', '1'),
(399, '香港新界北區上水青山公路古洞段88號高爾夫・御苑9座B1層順豐智能櫃', 'H852A082P', '2', '1'),
(400, '香港新界北區上水彩園路彩園邨彩園廣場3樓順豐智能櫃', 'H852A086P', '2', '1'),
(401, '香港新界北區上水符興街4號地下(順豐站)一號順豐智能櫃^', 'H852A087P', '2', '1'),
(402, '香港新界北區上水符興街4號地下(順豐站)二號順豐智能櫃^', 'H852A088P', '2', '1'),
(403, '香港新界屯門區屯門鄉事會路83號V City商場MTR層順豐智能櫃(豐澤與衛訊中間通道進去)', 'H852U051P', '2', '1'),
(404, '香港新界屯門區屯門鄉事會路2A號安定邨愛定商場地下A135-A138號舖三號順豐智能櫃^', 'H852U120P', '2', '1'),
(405, '香港新界屯門區屯門大興街1號大興商場地下LK02位置順豐智能櫃(中國工商銀行右邊通道)', 'H852U098P', '2', '1'),
(406, '香港新界屯門區屯門山景商場G層一號順豐智能櫃(優品360對面)', 'H852U004P', '2', '1'),
(407, '香港新界屯門區屯門海榮路22號屯門中央廣場商場地下二號順豐智能櫃 (停車場地下升降機大堂旁)', 'H852U054P', '2', '1'),
(408, '香港新界屯門區屯門仁愛堂街32號蘭苑地下14號舖(全日洗洗衣店)順豐智能櫃', 'H852U061P', '2', '1'),
(409, '香港新界屯門區屯門湖山路2-26號兆山苑樺景閣地下順豐智能櫃', 'H852U047P', '2', '1'),
(410, '香港新界屯門區屯門兆康路22號兆康苑(一及二期)兆健閣地下順豐智能櫃', 'H852U080P', '2', '1'),
(411, '香港新界屯門區屯門兆康路22號兆康苑(一及二期)兆榮閣地下順豐智能櫃', 'H852U078P', '2', '1'),
(412, '香港新界屯門區屯門兆康路2號兆康商場1樓順豐智能櫃', 'H852U100P', '2', '1'),
(413, '香港新界屯門區屯門兆興里3號兆麟苑商場地下順豐智能櫃(藥房隔離通道)', 'H852U077P', '2', '1'),
(414, '香港新界屯門區屯門兆麟商場地下12號舖A分號舖(LaundrYup洗衣店)順豐智能櫃', 'H852U091P', '2', '1'),
(415, '香港新界屯門區屯門多寶商場地下15號及28號舖(LaundrYup洗衣店)順豐智能櫃', 'H852U036P', '2', '1'),
(416, '香港新界屯門區屯門安定邨H.A.N.D.S. A區2樓順豐智能櫃(近大家樂)', 'H852U065P', '2', '1'),
(417, '香港新界屯門區屯門青河坊3號利寶商場地下99號舖(全日洗洗衣店)順豐智能櫃', 'H852U005P', '2', '1'),
(418, '香港新界屯門區屯門良景邨良英樓地下順豐智能櫃', 'H852U093P', '2', '1'),
(419, '香港新界屯門區屯門良景邨良智樓地下順豐智能櫃', 'H852U092P', '2', '1'),
(420, '香港新界屯門區屯門良景廣場2樓順豐智能櫃(麥當勞對面)', 'H852U029P', '2', '1'),
(421, '香港新界屯門區屯門景峰徑4-8號怡樂花園第2座2樓停車場大堂順豐智能櫃(只供住戶使用)', 'H852U040P', '2', '1'),
(422, '香港新界屯門區屯門青磚圍路62號順豐智能櫃(皇朝居地下)', 'H852U072P', '2', '1'),
(423, '香港新界屯門區屯門恆富街23號南浪海灣第5座地下順豐智能櫃(只供住戶使用)', 'H852U039P', '2', '1'),
(424, '香港新界屯門區屯門南浪海灣行人天橋入口順豐智能櫃(往來海典軒商場)', 'H852U082P', '2', '1'),
(425, '香港新界屯門區屯門良運街3號建生商場地下順豐智能櫃(街市出口旁)', 'H852U001P', '2', '1'),
(426, '香港新界屯門區屯門掃管笏管翠路1號星堤第7至第8座之間通道順豐智能櫃(只供住戶使用)', 'H852U087P', '2', '1'),
(427, '香港新界屯門區屯門良德街8號珀御地庫升降機大堂順豐智能櫃(只供住戶使用)', 'H852U052P', '2', '1'),
(428, '香港新界屯門區屯門良德街9號盈豐商場1樓B29B舖順豐智能櫃^', 'H852U043P', '2', '1'),
(429, '香港新界屯門區屯門良德街9號盈豐商場1樓B29B舖二號順豐智能櫃^', 'H852U044P', '2', '1'),
(430, '香港新界屯門區屯門良德街9號盈豐商場1樓B29B舖三號順豐智能櫃^', 'H852U046P', '2', '1'),
(431, '香港新界屯門區屯門良德街9號盈豐商場1樓B29B舖四號順豐智能櫃^', 'H852U070P', '2', '1'),
(432, '香港新界屯門區屯門湖翠路2號美樂花園中央商場地下LK01順豐智能櫃(天悅酒家對面)', 'H852U088P', '2', '1'),
(433, '香港新界屯門區屯門美樂花園商場地下65號舖順豐智能櫃(順豐站)^', 'H852U083P', '2', '1'),
(434, '香港新界屯門區屯門湖秀街2號悅湖山莊12座地下順豐智能櫃(大堂入口邊)', 'H852U038P', '2', '1'),
(435, '香港新界屯門區屯門湖秀街2號悅湖山莊3座地下順豐智能櫃', 'H852U095P', '2', '1'),
(436, '香港新界屯門區屯門湖秀街2號悅湖山莊6座地下順豐智能櫃', 'H852U096P', '2', '1'),
(437, '香港新界屯門區屯門湖秀街2號悅湖山莊9座地下順豐智能櫃(大堂入口邊)+', 'H852U037P', '2', '1'),
(438, '香港新界屯門區屯門屯合街2號時代廣場L4層平台順豐智能櫃(商場L3層星巴克對面電梯大堂上去)', 'H852U071P', '2', '1'),
(439, '香港新界屯門區屯門時代廣場南翼3樓G位置順豐智能櫃+', 'H852U031P', '2', '1'),
(440, '香港新界屯門區屯門屯喜路2號屯門栢麗廣場地下順豐智能櫃(智高教育中心旁)', 'H852U013P', '2', '1'),
(441, '香港新界屯門區屯門青榕街1號海景花園8座地下順豐智能櫃(只供住戶使用)+', 'H852U027P', '2', '1'),
(442, '香港新界屯門區屯門湖翠路168-236號海翠花園西大堂升降機側順豐智能櫃(近輕鐵客務中心)', 'H852U050P', '2', '1'),
(443, '香港新界屯門區屯門茵翠豪庭順豐智能櫃(管理處側)(只供住戶使用)', 'H852UB22P', '2', '1'),
(444, '香港新界屯門區屯門啟豐園2座地下順豐智能櫃(只供住戶使用)', 'H852U028P', '2', '1'),
(445, '香港新界屯門區屯門康景花園地下22號舖順豐站旁順豐智能櫃^', 'H852U060P', '2', '1'),
(446, '香港新界屯門區屯門康景花園地下22號舖順豐站旁二號順豐智能櫃^', 'H852U062P', '2', '1'),
(447, '香港新界屯門區屯門富健花園停車場地下順豐智能櫃(停車場落貨區)', 'H852U033P', '2', '1'),
(448, '香港新界屯門區屯門富健花園12座地下順豐智能櫃', 'H852U075P', '2', '1'),
(449, '香港新界屯門區屯門新墟景新徑2號景新臺順豐智能櫃(大閘迴旋處旁)', 'H852U007P', '2', '1'),
(450, '香港新界屯門區屯門鄉事會路122-140號雅都花園商場1樓一號順豐智能櫃(近夢幻樂園)', 'H852U048P', '2', '1'),
(451, '香港新界屯門區屯門鄉事會路122-140號雅都花園商場1樓二號順豐智能櫃(近夢幻樂園)', 'H852U049P', '2', '1'),
(452, '香港新界屯門區屯門屯安里 1號叠茵庭第9座L3升降機大堂順豐智能櫃(只供住戶使用)', 'H852UB11P', '2', '1'),
(453, '香港新界屯門區屯門管青路2號愛琴海岸商場B1升降機大堂順豐智能櫃(只供住戶使用)', 'H852U074P', '2', '1'),
(454, '香港新界屯門區屯門愛琴灣地下大堂後門順豐智能櫃(大堂後門)(只供住戶使用)', 'H852U016P', '2', '1'),
(455, '香港新界屯門區屯門龍門路55-65號新屯門中心(住宅區)電梯大堂出口L4層順豐智能櫃(只供住戶使用)+', 'H852U045P', '2', '1'),
(456, '香港新界屯門區屯門新屯門中心(商場區)L2 33號舖順豐智能櫃(通往輕鐵站天橋旁)', 'H852U030P', '2', '1'),
(457, '香港新界屯門區屯門瑜翠園2座平台順豐智能櫃(只供住戶使用)', 'H852U022P', '2', '1'),
(458, '香港新界屯門區屯門滿名山滿庭地庫會所順豐智能櫃(只供住戶使用)', 'H852U026P', '2', '1'),
(459, '香港新界屯門區屯門澤豐商場1樓29號舖順豐智能櫃', 'H852U084P', '2', '1'),
(460, '香港新界屯門區屯門澤豐商場1樓29號舖二號順豐智能櫃', 'H852U085P', '2', '1'),
(461, '香港新界屯門區屯門澤豐商場1樓29號舖三號順豐智能櫃', 'H852U086P', '2', '1'),
(462, '香港新界屯門區屯門福亨村路8號豫豐花園第13座地下順豐智能櫃(只供住戶使用)', 'H852UB16P', '2', '1'),
(463, '香港新界屯門區屯門龍門居16座地下順豐智能櫃(只供住戶使用)', 'H852U023P', '2', '1'),
(464, '香港新界屯門區屯門龍門路43號龍門居停車場大樓1號升降機地下順豐智能櫃+', 'H852U058P', '2', '1'),
(465, '香港新界屯門區屯門龍門路43號龍門居停車場大樓1樓順豐智能櫃(近U購超級市場)', 'H852U094P', '2', '1'),
(466, '香港新界屯門區屯門藍地大街41號地下(洗衣寶洗衣店)順豐智能櫃+', 'H852U073P', '2', '1'),
(467, '香港新界屯門區屯門鄉事會路83號瓏門3樓1號穿梭升降機大堂順豐智能櫃(只供住戶使用)', 'H852U063P', '2', '1'),
(468, '香港新界屯門區新屯門中心廣場(商場區)L2層32B號舖二號順豐智能櫃', 'H852U067P', '2', '1'),
(469, '香港新界屯門區新屯門中心廣場(商場區)L2層32B號舖三號順豐智能櫃', 'H852U068P', '2', '1'),
(470, '香港新界屯門區屯門欣田邨悅田樓地下通道順豐智能櫃', 'H852UB23P', '2', '1'),
(471, '香港新界屯門區屯門海典軒商場順豐智能櫃(近天橋位置)', 'H852U101P', '2', '1'),
(472, '香港新界屯門區屯門兆山苑樟景閣地下順豐智能櫃', 'H852U102P', '2', '1'),
(473, '香港新界屯門區屯門利發徑6號地下9B舖(365 Laundry)順豐智能櫃', 'H852U105P', '2', '1'),
(474, '香港新界屯門區屯門雅都花園商場1樓三號順豐智能櫃', 'H852U106P', '2', '1'),
(475, '香港新界屯門區屯門豫豐花園1座地下順豐智能櫃(只供住戶使用)', 'H852UB33P', '2', '1'),
(476, '香港新界屯門區屯門菁雋5樓會所順豐智能櫃(只供住戶使用)', 'H852U109P', '2', '1'),
(477, '香港新界屯門區屯門大興花園第二期商場AEON2樓順豐智能櫃', 'H852U055P', '2', '1'),
(478, '香港新界屯門區屯門冠峰園C座平台順豐智能櫃(只供住戶使用)', 'H852U107P', '2', '1'),
(479, '香港新界屯門區屯門Napa 5A座地庫大堂外順豐智能櫃(只供住戶使用)', 'H852U108P', '2', '1'),
(480, '香港新界屯門區屯門蝴蝶廣場2樓LK01順豐智能櫃(近759阿信屋)', 'H852U110P', '2', '1'),
(481, '香港新界屯門區屯門愛定商場地下A135-A138號舖順豐服務中心外一號順豐智能櫃^', 'H852U111P', '2', '1'),
(482, '香港新界屯門區屯門愛定商場地下A135-A138號舖順豐服務中心外二號順豐智能櫃^', 'H852U112P', '2', '1'),
(483, '香港新界屯門區屯門仁愛大廈地下9號舖順豐智能櫃(順豐服務中心外)^', 'H852U113P', '2', '1'),
(484, '香港新界屯門區屯門湖翠路201號兆禧苑商場地下順豐智能櫃', 'H852U115P', '2', '1'),
(485, '香港新界屯門區屯門富泰商場1樓102B舖(順豐站)一號順豐智能櫃^', 'H852UB38P', '2', '1'),
(486, '香港新界屯門區屯門富泰商場1樓102B舖(順豐站)二號順豐智能櫃^', 'H852UB39P', '2', '1'),
(487, '香港新界屯門區屯門山景商場G層二號順豐智能櫃 (慶和堂涼茶側)', 'H852U114P', '2', '1'),
(488, '香港新界屯門區屯門青山灣青霞里9號容龍居L2停車場單車位置旁順豐智能櫃(只供住戶使用)', 'H852U116P', '2', '1'),
(489, '香港新界屯門區屯門屯利街1號華都花園商場地下36號舖(順豐站)一號順豐智能櫃^', 'H852U121P', '2', '1'),
(490, '香港新界屯門區屯門屯利街1號華都花園商場地下36號舖(順豐站)二號順豐智能櫃^', 'H852U122P', '2', '1'),
(491, '香港新界屯門區屯門業旺路101號弦海1樓順豐智能櫃', 'H852U123P', '2', '1'),
(492, '香港新界屯門區屯門青榕街8號青榕臺三座地下順豐智能櫃 (只供住戶使用)', 'H852U124P', '2', '1'),
(493, '香港新界屯門區屯門御海灣一期第二座地庫停車場順豐智能櫃(只供住戶使用)', 'H852U126P', '2', '1'),
(494, '香港新界屯門區屯門景秀里8號御半山一期順豐智能櫃(只供住戶使用)', 'H852U118P', '2', '1'),
(495, '香港新界元朗區天水圍天一商城1078舖順豐智能櫃+^', 'H852UB13P', '2', '1'),
(496, '香港新界元朗區天水圍天瑞路天恩商場1樓順豐智能櫃(121號商舖旁)', 'H852UA12P', '2', '1'),
(497, '香港新界元朗區天水圍天盛苑地下順豐智能櫃(商場屋苑入口旁)', 'H852UB17P', '2', '1'),
(498, '香港新界元朗區天水圍天靖街3號天盛商場地下順豐智能櫃', 'H852UB10P', '2', '1'),
(499, '香港新界元朗區天水圍天秀路15號天富苑元富閣(A座) 地下順豐智能櫃+', 'H852UA54P', '2', '1'),
(500, '香港新界元朗區天水圍天秀路15號天富苑欣富閣地下順豐智能櫃', 'H852UA91P', '2', '1'),
(501, '香港新界元朗區天水圍天秀路15號天富苑雅富閣(Q座) 地下順豐智能櫃+', 'H852UA55P', '2', '1'),
(502, '香港新界元朗區天水圍天秀路15號天富苑聚富閣地下順豐智能櫃', 'H852UA92P', '2', '1'),
(503, '香港新界元朗區天水圍天華路天晴邨晴彩樓地下順豐智能櫃+', 'H852UA36P', '2', '1'),
(504, '香港新界元朗區天水圍天澤商場1樓順豐智能櫃(靠近往返街市電梯)', 'H852UB19P', '2', '1'),
(505, '香港新界元朗區天水圍天澤商場1樓二號順豐智能櫃(靠近往返街市電梯)', 'H852UB20P', '2', '1'),
(506, '香港新界元朗區天水圍天湖路天耀廣場地下順豐智能櫃(鴻福堂對面)', 'H852UA46P', '2', '1'),
(507, '香港新界元朗區元朗天水圍天恩路2號柏慧豪園會所順豐智能櫃(近乒乓球室)(只供住戶使用)', 'H852UA24P', '2', '1'),
(508, '香港新界元朗區天水圍嘉湖山莊新北江商場地下A94號舖順豐智能櫃', 'H852UB04P', '2', '1'),
(509, '香港新界元朗區天水圍嘉湖山莊新北江商場地下A94號舖二號順豐智能櫃', 'H852UB21P', '2', '1'),
(510, '香港新界元朗區天水圍+WOO嘉湖一期地下順豐智能櫃(近中銀)+', 'H852UA82P', '2', '1'),
(511, '香港新界元朗區天水圍+WOO嘉湖一期2樓226號舖二號順豐智能櫃^', 'H852UB18P', '2', '1'),
(512, '香港新界元朗區天水圍天華路30-33號T Town南翼地下LK02順豐智能櫃 (滿記甜品側)', 'H852UA02P', '2', '1'),
(513, '香港新界元朗區天水圍天慈商場地下順豐智能櫃', 'H852UB25P', '2', '1'),
(514, '香港新界元朗區天水圍嘉湖山莊新北江商場地下A94號舖三號順豐智能櫃', 'H852UB27P', '2', '1'),
(515, '香港新界元朗區天水圍嘉湖山莊美湖居順豐智能櫃(近小巴站)(只供住戶使用)', 'H852UB28P', '2', '1'),
(516, '香港新界元朗區天水圍俊宏軒商場1樓順豐智能櫃(104號舖側)', 'H852UB30P', '2', '1'),
(517, '香港新界元朗區天水圍T TOWN北翼2樓順豐智能櫃(近樂康軒旁升降機通道)', 'H852UB32P', '2', '1'),
(518, '香港新界元朗區天水圍天湖路天耀廣場地下二號順豐智能櫃(匯豐理財易中心外)', 'H852UB49P', '2', '1'),
(519, '香港新界元朗區天水圍天瑞路9號天瑞商場地下24-25號舖順豐站一號順豐智能櫃^', 'H852UB42P', '2', '1'),
(520, '香港新界元朗區天水圍天瑞路9號天瑞商場地下24-25號舖順豐站二號順豐智能櫃^', 'H852UB43P', '2', '1'),
(521, '香港新界元朗區天水圍屏欣商場地下12號舖旁順豐智能櫃', 'H852UA66P', '2', '1'),
(522, '香港新界元朗區天水圍+WOO嘉湖一期2樓225號舖一號順豐智能櫃^', 'H852UB15P', '2', '1'),
(523, '香港新界元朗區天水圍天耀廣場地下L058A舖一號順豐智能櫃', 'H852UB46P', '2', '1'),
(524, '香港新界元朗區天水圍天耀廣場地下L058A舖二號順豐智能櫃', 'H852UB47P', '2', '1'),
(525, '香港新界元朗區天水圍+WOO嘉湖一期2樓226號舖三號順豐智能櫃^', 'H852UB45P', '2', '1'),
(526, '香港新界元朗區天水圍濕地公園路9號Wetland Seasons Park會所順豐智能櫃(只供住戶使用)', 'H852UB48P', '2', '1'),
(527, '香港新界元朗區元朗青山公路洪水橋段600號尚城順豐智能櫃(只供住戶使用)', 'H852U011P', '2', '1'),
(528, '香港新界元朗區元朗Grand YOHO 2座5樓平台二號順豐智能櫃(只供住戶使用)+', 'H852UA48P', '2', '1'),
(529, '香港新界元朗區元朗青山公路潭尾段18號PARK YOHO 7座地下順豐智能櫃(只供住戶使用)', 'H852UA19P', '2', '1'),
(530, '香港新界元朗區元朗元龍街9號YOHO Midtown 第3座5樓平台順豐智能櫃(只供住戶使用)+', 'H852UA35P', '2', '1'),
(531, '香港新界元朗區元朗元龍街8號YOHO Town第7座地下順豐智能櫃(只供住戶使用)', 'H852UA86P', '2', '1'),
(532, '香港新界元朗區元朗教育路1號元朗千色匯2樓19號舖一號順豐智能櫃', 'H852UA34P', '2', '1'),
(533, '香港新界元朗區元朗教育路1號元朗千色匯2樓19號舖二號順豐智能櫃', 'H852UA33P', '2', '1'),
(534, '香港新界元朗區元朗尚豪庭第3座2樓平台順豐智能櫃(只供住戶使用)', 'H852UA37P', '2', '1'),
(535, '香港新界元朗區元朗大陂頭徑14-24號福星樓地下2A舖(365Laundry)順豐智能櫃', 'H852UA84P', '2', '1'),
(536, '香港新界元朗區元朗大棠路大旗領747號順豐智能櫃 (名御對面)', 'H852UB12P', '2', '1'),
(537, '香港新界元朗區元朗水蕉新村村公所地下順豐智能櫃', 'H852UB06P', '2', '1'),
(538, '香港新界元朗區元朗水邊圍邨湖水樓地下順豐智能櫃(聖公會聖馬提亞堂幼兒學校對出)', 'H852UA25P', '2', '1'),
(539, '香港新界元朗區元朗加州花園廣場地下順豐智能櫃(近日本城)', 'H852UA76P', '2', '1'),
(540, '香港新界元朗區元朗安寧路20-24號利群樓地下C1號舖(洗衣寶洗衣店)順豐智能櫃', 'H852UA70P', '2', '1'),
(541, '香港新界元朗區元朗安興街59-67號安泰樓地下3號舖(順豐站)順豐智能櫃^', 'H852UA51P', '2', '1'),
(542, '香港新界元朗區元朗尚悅第11座地下順豐智能櫃(往12座通道)(只供住戶使用)', 'H852UA20P', '2', '1'),
(543, '香港新界元朗區元朗朗日路東頭村順豐智能櫃(牌坊前)', 'H852UA75P', '2', '1'),
(544, '香港新界元朗區元朗鳳琴街22號金龍樓商場地下走廊順豐智能櫃+', 'H852UA60P', '2', '1'),
(545, '香港新界元朗區元朗鳳琴街22號金龍樓商場地下二號順豐智能櫃', 'H852UA27P', '2', '1'),
(546, '香港新界元朗區元朗屏山青山公路屏山段131號綠悅第1座地下順豐智能櫃(只供住戶使用)', 'H852UA90P', '2', '1'),
(547, '香港新界元朗區元朗屏會街9號同發大廈地下FG舖順豐站順豐智能櫃^', 'H852UA50P', '2', '1'),
(548, '香港新界元朗區元朗建德街大福大廈地下7號舖順豐智能櫃^', 'H852UA30P', '2', '1'),
(549, '香港新界元朗區元朗德業街11號映御2座地下順豐智能櫃(只供住戶使用)', 'H852UA52P', '2', '1'),
(550, '香港新界元朗區元朗十八鄉路83號原築村巴站順豐智能櫃(只供住戶使用)', 'H852UB14P', '2', '1'),
(551, '香港新界元朗區元朗柏巒會所1樓電梯大堂順豐智能櫃(只供住戶使用)', 'H852UB08P', '2', '1'),
(552, '香港新界元朗區元朗擴業街8號朗屏8號住戶會所地下順豐智能櫃(只供住戶使用)', 'H852UA32P', '2', '1'),
(553, '香港新界元朗區元朗朗屏邨玉屏樓地下順豐智能櫃+', 'H852UA69P', '2', '1'),
(554, '香港新界元朗區元朗朗屏邨石屏樓M樓順豐智能櫃(近廁所位置)+', 'H852UA68P', '2', '1'),
(555, '香港新界元朗區元朗朗屏邨悅屏樓地下順豐智能櫃', 'H852UA38P', '2', '1'),
(556, '香港新界元朗區元朗朗屏邨鏡屏樓M樓順豐智能櫃(匯豐提款機旁)+', 'H852UA67P', '2', '1'),
(557, '香港新界元朗區元朗朗屏路1號朗屏商場2樓順豐智能櫃(朗屏體育館門口旁)', 'H852UA06P', '2', '1'),
(558, '香港新界元朗區元朗青山公路屏山段139朗庭園3座地下順豐智能櫃(只供住戶使用)', 'H852UA16P', '2', '1'),
(559, '香港新界元朗區元朗御景園2座地下順豐智能櫃(只供住戶使用)', 'H852UA49P', '2', '1'),
(560, '香港新界元朗區元朗御豪山莊第6座地下順豐智能櫃(大堂入口)(只供住戶使用)', 'H852UA41P', '2', '1'),
(561, '香港新界元朗區元朗御豪山莊第8座地下順豐智能櫃(大堂入口)(只供住戶使用)+', 'H852UA42P', '2', '1'),
(562, '香港新界元朗區元朗青山公路元朗段123號開心廣場2樓順豐智能櫃', 'H852UA62P', '2', '1'),
(563, '香港新界元朗區元朗溱柏會所接待處順豐智能櫃(只供住戶使用)+', 'H852UB07P', '2', '1'),
(564, '香港新界元朗區元朗錦田錦上路157號四季豪園順豐智能櫃(只供住戶使用)', 'H852UA23P', '2', '1'),
(565, '香港新界元朗區元朗鳳琴街15-21號鴻運中心地下11號舖(LaundrYup洗衣店)順豐智能櫃', 'H852UA26P', '2', '1'),
(566, '香港新界元朗區元朗德業街14號地下(中石化油站)順豐智能櫃', 'H852UA65P', '2', '1'),
(567, '香港新界元朗區元朗錦田高埔村映堤103地下順豐智能櫃( Eye Level 補習社外)', 'H852UA31P', '2', '1'),
(568, '香港新界元朗區元朗錦繡花園市中心廣場D座順豐智能櫃', 'H852UB01P', '2', '1'),
(569, '香港新界元朗區元朗YOHO Midtown 1座後5樓平台順豐智能櫃(只供住戶使用)', 'H852UA45P', '2', '1'),
(570, '香港新界元朗區元朗YOHO Midtown 1座前5樓平台二號順豐智能櫃(只供住戶使用)', 'H852UA47P', '2', '1'),
(571, '香港新界元朗區元朗柏氵喬順豐智能櫃(只供住戶使用)', 'H852UB26P', '2', '1'),
(572, '香港新界元朗區元朗屏山芙蓉園地下順豐智能櫃(健身室對出空地)(只供住戶使用)', 'H852UA59P', '2', '1'),
(573, '香港新界元朗區元朗采葉庭13座地下順豐智能櫃(只供住戶使用)', 'H852UA61P', '2', '1'),
(574, '香港新界元朗區元朗翹翠峰2座地下順豐智能櫃(只供住戶使用)', 'H852UB29P', '2', '1'),
(575, '香港新界元朗區元朗尚悅11座地下二號順豐智能櫃(只供住戶使用)', 'H852UB35P', '2', '1'),
(576, '香港新界元朗區元朗蝶翠峰18座遊樂場順豐智能櫃(只供住戶使用)', 'H852UB36P', '2', '1'),
(577, '香港新界元朗區元朗錦繡花園市中心廣場A座順豐智能櫃(只供住戶使用)', 'H852UB37P', '2', '1'),
(578, '香港新界元朗區元朗鳯攸南街9號好順利大廈地下79號舖順豐站一號順豐智能櫃^', 'H852UA63P', '2', '1'),
(579, '香港新界元朗區元朗鳯攸南街9號好順利大廈地下79號舖順豐站二號順豐智能櫃^', 'H852UA64P', '2', '1'),
(580, '香港新界元朗區元朗錦田波地路101號地下((Laundromat洗衣店)順豐智能櫃', 'H852UB44P', '2', '1'),
(581, '香港新界元朗區元朗青山公路洪水橋段512號蔚林A區會所順豐智能櫃(只供住戶使用)', 'H852U057P', '2', '1'),
(582, '香港新界荃灣區青龍頭海雲軒2座5樓升降機大堂順豐智能櫃(只供住戶使用)', 'H852GC09P', '2', '1'),
(583, '香港新界荃灣區青龍頭豪景花園A停車場順豐智能櫃(只供住戶使用)', 'H852GC10P', '2', '1'),
(584, '香港新界荃灣區馬灣珀麗路8號珀麗灣碼頭順豐智能櫃+', 'H852GC08P', '2', '1'),
(585, '香港新界荃灣區深井浪翠園一期平台順豐智能櫃(近1座停車場出入口) (只供住戶使用)', 'H852GC62P', '2', '1'),
(586, '香港新界荃灣區深井海韻花園地下順豐智能櫃(管理處對面)(只供住戶使用)', 'H852GC56P', '2', '1'),
(587, '香港新界荃灣區深井海韻花園地下二號順豐智能櫃(嘉韻酒樓旁)(只供住戶使用)', 'H852GC91P', '2', '1'),
(588, '香港新界荃灣區深井碧堤半島8座地下順豐智能櫃(只供住戶使用)', 'H852GC97P', '2', '1'),
(589, '香港新界荃灣區深井海韻臺UG層升降機大堂順豐智能櫃(只供住戶使用)', 'H852GC06P', '2', '1'),
(590, '香港新界荃灣區深井碧堤半島6座地下順豐智能櫃(只供住戶使用)', 'H852GC96P', '2', '1'),
(591, '香港新界荃灣區深井浪翠園三期地下正門順豐智能櫃(只供住戶使用)', 'H852GC11P', '2', '1'),
(592, '香港新界荃灣區荃灣海盛路11號OneMidTown地下順豐智能櫃(來往停車場至大堂出入口位置)', 'H852GC40P', '2', '1'),
(593, '香港新界荃灣區荃灣青山公路荃灣段388號八咪半2樓二號順豐智能櫃', 'H852G038P', '2', '1'),
(594, '香港新界荃灣區荃灣全發商業大廈地下大堂順豐智能櫃', 'H852GA58P', '2', '1'),
(595, '香港新界荃灣區荃灣大河道18號登發大廈地皇廣場2樓261號舖內順豐智能櫃', 'H852G019P', '2', '1'),
(596, '香港新界荃灣區荃灣灰窰角街2-6號DAN 6地下停車場順豐智能櫃', 'H852GA72P', '2', '1'),
(597, '香港新界荃灣區荃灣恒麗園A區3樓升降機大堂順豐智能櫃(只供住戶使用)', 'H852GC85P', '2', '1'),
(598, '香港新界荃灣區荃灣海盛路22-30號祈德尊新邨商場1樓順豐智能櫃(中國銀行對面)', 'H852G010P', '2', '1'),
(599, '香港新界荃灣區荃灣荃錦公路108號朗逸峯一期2樓村巴大堂順豐智能櫃(只供住戶使用)+', 'H852G042P', '2', '1'),
(600, '香港新界荃灣區荃灣荃威花園三期J座砲樓6樓順豐智能櫃(升降機大堂)', 'H852G022P', '2', '1'),
(601, '香港新界荃灣區荃灣荃威花園P座地下升降機大堂順豐智能櫃', 'H852G054P', '2', '1'),
(602, '香港新界荃灣區荃灣荃德花園C座地下6A舖(洗衣寶洗衣店)順豐智能櫃', 'H852G075P', '2', '1'),
(603, '香港新界荃灣區荃灣荃灣中心二期小巴總站順豐智能櫃', 'H852G057P', '2', '1'),
(604, '香港新界荃灣區荃灣愉景新城3樓順豐智能櫃(遵理學校左側通道)', 'H852GE90P', '2', '1'),
(605, '香港新界荃灣區荃灣象山邨翠山樓平台順豐智能櫃(近街市門口)', 'H852LA04P', '2', '1'),
(606, '香港新界荃灣區荃灣青山公路荃灣段644-654號翠濤閣第2座地下順豐智能櫃(只供住戶使用)', 'H852GE88P', '2', '1'),
(607, '香港新界荃灣區荃灣楊屋道138號樂悠居商場1樓順豐智能櫃(19A號舖位置)', 'H852GA37P', '2', '1'),
(608, '香港新界荃灣區荃灣爵悅庭西座地下順豐智能櫃(只供住戶使用) +', 'H852GA59P', '2', '1'),
(609, '香港新界荃灣區荃灣永順街48號環宇海灣會所順豐智能櫃(只供住戶使用)', 'H852GA45P', '2', '1'),
(610, '香港新界荃灣區荃灣青山公路623號韻濤居3樓平台1座順豐智能櫃(風櫃房外)(只供住戶使用)', 'H852G066P', '2', '1'),
(611, '香港新界荃灣區荃灣麗順路2號麗城花園一期運動場外地下電梯大堂順豐智能櫃(往三期天橋口，運動場外地下電梯荃灣區)', 'H852G020P', '2', '1'),
(612, '香港新界荃灣青山公路620號麗城花園第二期第6座3樓平台順豐智能櫃(只供住戶使用)+', 'H852G031P', '2', '1'),
(613, '香港新界荃灣區荃灣麗城薈2期地下順豐智能櫃(茶餐廳對面)', 'H852G070P', '2', '1'),
(614, '香港新界荃灣區荃灣大河道灣景廣場購物中心AEON 1樓順豐智能櫃(近旅行用品區)', 'H852G064P', '2', '1'),
(615, '香港新界荃灣區荃灣青山公路620號麗城花園第二期第2座3樓平台順豐智能櫃(只供住戶使用)+', 'H852G030P', '2', '1'),
(616, '香港新界荃灣區荃灣祈德尊新邨商場1樓二號順豐智能櫃(近4號舖)', 'H852G083P', '2', '1'),
(617, '香港新界荃灣區荃灣翠豐臺1座地下順豐智能櫃(只供住戶使用)', 'H852GE92P', '2', '1'),
(618, '香港新界荃灣區荃灣翠豐臺2座地下順豐智能櫃(只供住戶使用)', 'H852GE93P', '2', '1'),
(619, '香港新界荃灣區荃灣海灣花園地下順豐智能櫃(第4座右邊門口)(只供住戶使用)', 'H852GA94P', '2', '1'),
(620, '香港新界荃灣區荃灣麗城花園三期3座平台順豐智能櫃(只供住戶使用)', 'H852G100P', '2', '1'),
(621, '香港新界荃灣區荃灣梨木樹商場地下順豐智能櫃(B出口旁)', 'H852LA35P', '2', '1'),
(622, '香港新界荃灣區荃灣石圍角商場1樓233號舖順豐智能櫃+', 'H852GE01P', '2', '1'),
(623, '香港新界荃灣區荃灣石圍角商場1樓233號舖二號順豐智能櫃+', 'H852GE02P', '2', '1'),
(624, '香港新界荃灣區荃灣石圍角商場1樓233號舖三號順豐智能櫃', 'H852GE03P', '2', '1'),
(625, '香港新界荃灣區荃灣柏傲灣停車場B2順豐智能櫃(只供住戶使用)', 'H852GA04P', '2', '1'),
(626, '香港新界荃灣區荃灣海濱花園9座地下順豐智能櫃', 'H852GA06P', '2', '1'),
(627, '香港新界荃灣區荃灣海之戀停車埸5樓第3中轉大堂順豐智能櫃(只供住戶使用)', 'H852GE06P', '2', '1'),
(628, '香港新界荃灣區荃灣萬景峯住客會所5樓順豐智能櫃(只供住戶使用)', 'H852GA02P', '2', '1'),
(629, '香港新界荃灣區荃灣綠楊坊2樓順豐智能櫃(S35號舖側)', 'H852GE07P', '2', '1'),
(630, '香港新界荃灣區荃灣灣景花園第4座地下順豐智能櫃(只供住戶使用)', 'H852G104P', '2', '1'),
(631, '香港新界荃灣區大窩口荃華街3號悅來坊地下順豐智能櫃+', 'H852GA34P', '2', '1'),
(632, '香港新界荃灣區大窩口大窩口道15號大窩口第二商場地下LK01位置順豐智能櫃(近759阿信屋)+', 'H852G023P', '2', '1'),
(633, '香港新界荃灣區大窩口大廈街43號葵賢苑地下順豐智能櫃(緊急車閘通道入口旁更亭位置)', 'H852G069P', '2', '1'),
(634, '香港新界荃灣區大窩口縉庭山5樓順豐智能櫃(停車場升降機大堂)(只供住戶使用)', 'H852LA32P', '2', '1'),
(635, '香港新界葵青區葵芳芊紅居順豐智能櫃 (只供住戶使用)', 'H852LB31P', '2', '1'),
(636, '香港新界葵青區葵涌祖堯坊A & B座平台103號舖順豐智能櫃+', 'H852D008P', '2', '1'),
(637, '香港新界葵青區葵涌浩景臺停車場1樓順豐智能櫃(升降機大堂)(只供住戶使用)', 'H852D036P', '2', '1'),
(638, '香港新界葵青區葵涌敬祖路6號祖堯邨C座祖堯商場地下順豐智能櫃', 'H852D037P', '2', '1'),
(639, '香港新界葵青區葵涌華景山莊康樂大樓地下順豐智能櫃(只供住戶使用)', 'H852D045P', '2', '1'),
(640, '香港新界葵青區葵涌葵昌路88號地下順豐智能櫃', 'H852L014P', '2', '1'),
(641, '香港新界葵青區葵涌青山公路葵涌段412-416號葵星中心商場地下順豐智能櫃(商場洗手間旁)', 'H852LA01P', '2', '1'),
(642, '香港新界葵青區葵涌油麻磡路63號昇柏山順豐智能櫃(只供住戶使用)', 'H852LA02P', '2', '1'),
(643, '香港新界葵青區葵涌和宜商場地下第3號舖順豐智能櫃 (晚上10時後可於桌球舖旁管理處門口進入)', 'H852LA03P', '2', '1'),
(644, '香港新界葵青區葵涌石蔭商場LG2層順豐智能櫃(近扶手電梯)', 'H852LA05P', '2', '1'),
(645, '香港新界葵青區葵涌石蔭商場LG2層二號順豐智能櫃(近扶手電梯)', 'H852LA39P', '2', '1'),
(646, '香港新界葵青區葵涌和宜合道144號瑞景大廈地下18號舖(全日洗洗衣店)順豐智能櫃', 'H852LA06P', '2', '1'),
(647, '香港新界葵青區葵涌石蔭商場地下順豐智能櫃(近寧峰苑出入口)', 'H852LA07P', '2', '1'),
(648, '香港新界葵青區葵涌安蔭邨安蔭商場1樓順豐智能櫃(扶手梯旁位置)', 'H852LA11P', '2', '1'),
(649, '香港新界葵青區葵涌大隴街110號石籬商場二期3樓客運大堂順豐智能櫃', 'H852LA22P', '2', '1'),
(650, '香港新界葵青區葵涌麗晶中心1樓順豐智能櫃+', 'H852LA37P', '2', '1'),
(651, '香港新界葵青區葵涌和宜合道33號雍雅軒1樓會所順豐智能櫃', 'H852LA38P', '2', '1'),
(652, '香港新界葵青區葵涌葵盛圍63號葵盛東商場1樓順豐智能櫃(126號舖側)', 'H852LB01P', '2', '1'),
(653, '香港新界葵青區葵涌葵聯路80號葵聯邨升降機樓地下順豐智能櫃', 'H852LB13P', '2', '1'),
(654, '香港新界葵青區葵涌光輝圍39A昌偉大廈地下30號舖(LaundrYup洗衣店)順豐智能櫃+', 'H852LB16P', '2', '1'),
(655, '香港新界葵青區葵涌葵盛西邨7座地下順豐智能櫃', 'H852LB17P', '2', '1'),
(656, '香港新界葵青區葵涌興芳路177號葵芳邨葵芳廣場地下LK01位置順豐智能櫃(近趣味批)', 'H852LB18P', '2', '1'),
(657, '香港新界葵青區葵涌興芳路177號葵芳邨葵芳廣場地下LK02位置順豐智能櫃(近扶手電梯口)', 'H852LB19P', '2', '1'),
(658, '香港新界葵青區葵涌葵盛圍63號葵盛東商場1樓二號順豐智能櫃(洗衣舖對面)', 'H852LB20P', '2', '1'),
(659, '香港新界葵青區葵涌葵涌商場2樓207A號舖順豐智能櫃', 'H852LB24P', '2', '1'),
(660, '香港新界葵青區葵涌葵涌商場2樓207A號舖二號順豐智能櫃', 'H852LB25P', '2', '1'),
(661, '香港新界葵青區葵涌葵涌商場2樓207A號舖三號順豐智能櫃', 'H852LB26P', '2', '1'),
(662, '香港新界葵青區葵涌葵涌商場2樓207A號舖四號順豐智能櫃', 'H852LB28P', '2', '1'),
(663, '香港新界葵青區葵涌葵涌商場2樓207A號舖五號順豐智能櫃+', 'H852LB29P', '2', '1'),
(664, '香港新界葵青區葵涌豐寓地下停車場順豐智能櫃(只供住戶使用)', 'H852LB33P', '2', '1'),
(665, '香港新界葵青區葵涌葵翠邨碧翠樓地下順豐智能櫃', 'H852LB34P', '2', '1'),
(666, '香港新界葵青區葵涌葵康苑葵明閣地下順豐智能櫃', 'H852LB36P', '2', '1'),
(667, '香港新界葵青區青衣寮肚路9號長宏商場地下順豐智能櫃(商場詢問處旁)', 'H852GC05P', '2', '1'),
(668, '香港新界葵青區青衣長青邨青槐樓市場入口順豐智能櫃(屋邨辦事處對出)+', 'H852GC21P', '2', '1'),
(669, '香港新界葵青區青衣長康街市康和樓地下M1攤(LaundrYup洗衣店)順豐智能櫃', 'H852GC87P', '2', '1'),
(670, '香港新界葵青區青衣長發廣場3樓順豐智能櫃(八方雲集旁邊通道)+', 'H852GC16P', '2', '1'),
(671, '香港新界葵青區青衣楓樹窩路10號青衣邨青衣商場1樓順豐智能櫃(近惠康,面向停車場)', 'H852GC51P', '2', '1'),
(672, '香港新界葵青區青衣楓樹窩路10號青衣邨青衣商場地下順豐智能櫃+', 'H852GC50P', '2', '1'),
(673, '香港新界葵青區青衣青康路10號青盛苑地下順豐智能櫃', 'H852GC35P', '2', '1'),
(674, '香港新界葵青區青衣細山路2-16號美景花園地下順豐智能櫃(77號舖對出)', 'H852GC48P', '2', '1'),
(675, '香港新界葵青區青衣青敬路77號海悅花園商場地下40號舖(LaundrYup洗衣店)順豐智能櫃', 'H852GC44P', '2', '1'),
(676, '香港新界葵青區青衣偉景花園商場地下順豐智能櫃(保安崗位旁)', 'H852GC15P', '2', '1'),
(677, '香港新界葵青區青衣青衣航運路36號順豐大廈地下順豐智能櫃', 'H852GC02P', '2', '1'),
(678, '香港新界葵青區青衣翠怡花園7座至8座順豐智能櫃(鄰近小巴站)', 'H852GC80P', '2', '1'),
(679, '香港新界葵青區青衣翠怡花園7座至8座二號順豐智能櫃(鄰近小巴站)', 'H852GC81P', '2', '1'),
(680, '香港新界葵青區青衣楓樹窩路1號翠怡商場1樓順豐智能櫃', 'H852GC28P', '2', '1'),
(681, '香港新界葵青區青衣青華苑順豐智能櫃(往停車場樓梯Circle K旁)', 'H852GC95P', '2', '1'),
(682, '香港新界葵青區青衣藍澄灣2座地下順豐智能櫃', 'H852G101P', '2', '1'),
(683, '香港新界葵青區青衣藍澄灣5座地下順豐智能櫃', 'H852G102P', '2', '1'),
(684, '香港新界葵青區青衣長發廣場3樓二號櫃(近遊樂場門口)順豐智能櫃', 'H852GC12P', '2', '1'),
(685, '香港新界葵青區青衣長發廣場3樓三號櫃(近遊樂場門口)順豐智能櫃', 'H852GC17P', '2', '1'),
(686, '香港新界葵青區青衣長發廣場3樓四號櫃(近遊樂場門口)順豐智能櫃', 'H852GC18P', '2', '1'),
(687, '香港新界葵青區青衣長康商場二期(巴士總站旁)順豐智能櫃', 'H852GC19P', '2', '1'),
(688, '香港新界葵青區青衣青衣路39號嘉民領達中心25樓順豐智能櫃(只供順豐供應鏈香港員工使用)', 'H852Q004P', '2', '1'),
(689, '香港新界離島區東涌昇薈UG層順豐智能櫃(穿梭升降機大堂)(只供住戶使用)', 'H852G082P', '2', '1'),
(690, '香港新界離島區東涌慶東街1號東堤灣畔會所地下順豐智能櫃(只供住戶使用)', 'H852G067P', '2', '1'),
(691, '香港新界離島區東涌東環第3座地下順豐智能櫃(只供住戶使用)', 'H852G065P', '2', '1'),
(692, '香港新界離島區東涌健東路1號映灣薈地下順豐智能櫃(近中銀櫃員機)', 'H852G018P', '2', '1'),
(693, '香港新界離島區東涌海濱路8號海堤灣畔會所順豐智能櫃(只供住戶使用)', 'H852G063P', '2', '1'),
(694, '香港新界離島區東涌富東街6號富東廣場3樓順豐智能櫃(聖公會東涌綜合服務旁)+', 'H852G006P', '2', '1'),
(695, '香港新界離島區東涌富東街6號富東廣場3樓二號順豐智能櫃(聖公會東涌綜合服務旁)+', 'H852G073P', '2', '1'),
(696, '香港新界離島區東涌富東街6號富東廣場3樓三號順豐智能櫃(聖公會東涌綜合服務旁)+', 'H852G074P', '2', '1'),
(697, '香港新界離島區東涌逸東街8號逸東商場地下順豐智能櫃(近街市熟食檔)+', 'H852G046P', '2', '1'),
(698, '香港新界離島區東涌逸東街8號逸東邨逸東商場2樓201號舖順豐智能櫃^', 'H852G068P', '2', '1'),
(699, '香港新界離島區東涌迎東邨迎悅樓地下順豐智能櫃', 'H852G099P', '2', '1'),
(700, '香港新界離島區東涌滿東邨滿康樓地下順豐智能櫃', 'H852G098P', '2', '1'),
(701, '香港新界離島區東涌海濱路12號藍天海岸地下住客會所順豐智能櫃 (只供住戶使用)+', 'H852G053P', '2', '1'),
(702, '香港新界離島區大嶼山貝澳嶼南道DD316號(大嶼山國際學校(高小部)對面)順豐智能櫃', 'H852Q002P', '2', '1'),
(703, '香港新界離島區大嶼山愉景灣愉景灣道92 & 96號愉景廣場1樓順豐智能櫃(近美聯物業)', 'H852G011P', '2', '1'),
(704, '香港新界離島區愉景灣海澄湖畔二段逸澄閣地下順豐智能櫃(只供住戶使用)', 'H852G103P', '2', '1'),
(705, '香港新界離島區長洲新興街53號地下(橫店百貨)順豐智能櫃', 'H852M006P', '2', '1'),
(706, '香港新界離島區長洲新興街39號地下(LaundrYup洗衣店)順豐智能櫃', 'H852M034P', '2', '1'),
(707, '香港新界西貢區調景嶺澳景路88號維景灣畔1期LG1樓GH1舖順豐智能櫃+', 'H852CC52P', '2', '1'),
(708, '香港新界西貢區將軍澳PopWalk地下順豐智能櫃', 'H852CC72P', '2', '1'),
(709, '香港新界西貢區將軍澳常寧路2號TKO Gateway地下順豐智能櫃(近德安樓出口)', 'H852CC18P', '2', '1'),
(710, '香港新界西貢區將軍澳TKO Gateway東翼1樓順豐智能櫃', 'H852CE97P', '2', '1'),
(711, '香港新界西貢區將軍澳日出康城領都1號中轉大堂L3順豐智能櫃(近11座)(只供住戶使用)', 'H852CE81P', '2', '1'),
(712, '香港新界西貢區將軍澳日出康城領都3號中轉大堂L5順豐智能櫃(近3座)(只供住戶使用)', 'H852CC61P', '2', '1'),
(713, '香港新界西貢區將軍澳日出康城康城路1號緻藍天2樓住戶會所順豐智能櫃(只供住戶使用)', 'H852CE87P', '2', '1'),
(714, '香港新界西貢區將軍澳康城路1號晉海2A座1樓順豐智能櫃(只供住戶使用)', 'H852CH02P', '2', '1'),
(715, '香港新界西貢區將軍澳石角路8號峻瀅地下順豐智能櫃(只供住戶使用)', 'H852CC13P', '2', '1'),
(716, '香港新界西貢區將軍澳石角路6號峻瀅二期2座地下順豐智能櫃(只供二期住戶使用)', 'H852CC35P', '2', '1'),
(717, '香港新界將軍澳將軍澳中心地庫B1層升降機大堂順豐智能櫃', 'H852CC74P', '2', '1'),
(718, '香港新界西貢區將軍澳寶琳北路1號康盛花園商場1樓111號舖(洗衣寶洗衣店)順豐智能櫃+', 'H852CC39P', '2', '1'),
(719, '香港新界西貢區將軍澳彩明苑彩耀閣側近隧道順豐智能櫃(近通往學校通道)+', 'H852CC25P', '2', '1'),
(720, '香港新界西貢區將軍澳彩明苑地下停車場順豐智能櫃(近乒乓球活動區)', 'H852CC73P', '2', '1'),
(721, '香港新界西貢區將軍澳蓬萊路8號清水灣半島會所1樓順豐智能櫃(只供住戶使用)', 'H852CC40P', '2', '1'),
(722, '香港新界西貢區將軍澳都會駅商場2樓L2-028號舖順豐智能櫃', 'H852CC64P', '2', '1'),
(723, '香港新界西貢區將軍澳都會駅商場2樓L2-028號舖2號順豐智能櫃', 'H852CE82P', '2', '1'),
(724, '香港新界西貢區將軍澳唐明街1號富康花園9座地下順豐智能櫃(只供住戶使用)', 'H852CC44P', '2', '1'),
(725, '香港新界西貢區將軍澳唐明街1號富康花園8座地下順豐智能櫃(只供住戶使用)', 'H852CC43P', '2', '1'),
(726, '香港新界西貢區將軍澳富寧花園1座地下順豐智能櫃 (只供住戶使用)', 'H852CE92P', '2', '1'),
(727, '香港新界西貢區將軍澳富寧花園街市(街市門口旁)順豐智能櫃 (只供住戶使用)', 'H852CE91P', '2', '1'),
(728, '香港新界西貢區將軍澳翠琳路6號景明苑曦景閣地下順豐智能櫃', 'H852CC51P', '2', '1'),
(729, '香港新界西貢區將軍澳運亨路8號叠翠軒2樓住宅平台順豐智能櫃(只供住戶使用)', 'H852CC58P', '2', '1'),
(730, '香港新界西貢區將軍澳銀澳路1號新寶城商場入口地下順豐智能櫃', 'H852CC55P', '2', '1'),
(731, '香港新界西貢區將軍澳至善街9號嘉悅B1層順豐智能櫃(只供住戶使用)', 'H852CC68P', '2', '1'),
(732, '香港新界西貢區將軍澳翠琳路11號翠林新城3樓順豐智能櫃(近停車場出入口)', 'H852CC24P', '2', '1'),
(733, '香港新界西貢區將軍澳翠林新城5樓121號A舖(LaundrYup洗衣店)順豐智能櫃', 'H852CE96P', '2', '1'),
(734, '香港新界西貢區將軍澳廣明苑廣昌閣地下順豐智能櫃(近管理處)+', 'H852CC20P', '2', '1'),
(735, '香港新界西貢區將軍澳廣明苑廣瑞閣地下順豐智能櫃', 'H852CC70P', '2', '1'),
(736, '香港新界西貢區西貢將軍澳毓雅里9號慧安園商場1樓B5號舖順豐智能櫃', 'H852CC03P', '2', '1'),
(737, '香港新界西貢區將軍澳慧安園商場地下A130號舖順豐智能櫃', 'H852CC69P', '2', '1'),
(738, '香港新界西貢區將軍澳寶琳北路18號寶林商場2樓LK01順豐智能櫃(匯豐櫃員機旁)', 'H852CC27P', '2', '1'),
(739, '香港新界西貢區將軍澳唐俊街11號寶盈花園商場1樓順豐智能櫃', 'H852CC37P', '2', '1'),
(740, '香港新界西貢區將軍澳寶康路100號(SHELL油站)順豐智能櫃', 'H852CC15P', '2', '1'),
(741, '香港新界西貢區將軍澳日出康城首都1座地下升降機大堂順豐智能櫃(只供住戶使用)', 'H852CE01P', '2', '1'),
(742, '香港新界西貢區將軍澳彩明商場3樓順豐智能櫃', 'H852CE02P', '2', '1'),
(743, '香港新界西貢區將軍澳海天晉1座地下順豐智能櫃(只供住戶使用)', 'H852CE03P', '2', '1'),
(744, '香港新界西貢區將軍澳Savannah地下8號舖順豐智能櫃(LaundryUp洗衣店)', 'H852TK01P', '2', '1'),
(745, '香港新界西貢區將軍澳尚德商場2樓順豐智能櫃', 'H852TK02P', '2', '1'),
(746, '香港新界西貢區坑口南豐廣場1樓B28-B31舖(順豐站)順豐智能櫃^', 'H852TK03P', '2', '1'),
(747, '香港新界西貢區坑口南豐廣場1樓B28-B31舖(順豐站)二號順豐智能櫃^', 'H852TK04P', '2', '1'),
(748, '香港新界西貢區將軍澳坑口寶順路1號頌明苑嘉明閣地下順豐智能櫃', 'H852CC71P', '2', '1'),
(749, '香港新界西貢區將軍澳天晉IIIA平台近1座順豐智能櫃(只供住戶使用)', 'H852CE04P', '2', '1'),
(750, '香港新界西貢區將軍澳藍塘傲R3升降機B2大堂8座側順豐智能櫃(只供住戶使用)', 'H852TK06P', '2', '1'),
(751, '香港新界西貢區將軍澳魷魚灣村順豐智能櫃(正門旁村公所)', 'H852TK05P', '2', '1'),
(752, '香港新界西貢區將軍澳Monterery Place G18B舖(陽光洗衣便利店)順豐智能櫃', 'H852TK07P', '2', '1'),
(753, '香港新界西貢區將軍澳常寧道10號安寧花園1座地下14號舖(順豐站)順豐智能櫃^', 'H852CH01P', '2', '1'),
(754, '香港新界西貢區將軍澳寶琳北路1號康盛花園三座地下順豐智能櫃', 'H852CH03P', '2', '1'),
(755, '香港新界西貢區將軍澳貿泰路8號茵怡花園第1座地下6號舖(順豐站)一號順豐智能櫃^', 'H852CH04P', '2', '1'),
(756, '香港新界西貢區將軍澳貿泰路8號茵怡花園第1座地下6號舖(順豐站)二號順豐智能櫃^', 'H852CH05P', '2', '1'),
(757, '香港新界西貢區將軍澳至善街19號天晉IIIB地下順豐智能櫃(只供住戶使用)', 'H852CH07P', '2', '1'),
(758, '香港新界西貢區將軍澳康城路1號康城3樓340號舖(順豐站)一號順豐智能櫃^', 'H852CH09P', '2', '1'),
(759, '香港新界西貢區將軍澳康城路1號康城3樓340號舖(順豐站)二號順豐智能櫃^', 'H852CH10P', '2', '1'),
(760, '香港新界西貢區將軍澳康城路1號Malibu地下停車場入口順豐智能櫃(只供住戶使用)', 'H852CH11P', '2', '1'),
(761, '香港新界西貢區西貢香港科技大學LG3順豐智能櫃(只供香港科技大學成員使用)', 'H852CC29P', '2', '1'),
(762, '香港新界西貢區西貢逸瓏海滙會所順豐智能櫃(只供住戶使用)', 'H852CC04P', '2', '1'),
(763, '', '', NULL, '1'),
(764, '', '', NULL, '1'),
(765, '', '', NULL, '1'),
(766, '智能櫃詳細地址', '網點代碼', NULL, '1'),
(767, '香港九龍九龍城區九龍城啟德道83號地下部分B號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852K031P', '1', '1'),
(768, '香港九龍九龍城區九龍城廣場4樓順豐智能櫃(406-410號鋪外電梯旁)', 'H852K036P', '1', '1'),
(769, '香港九龍九龍城區九龍城太子道西414號地下(順豐站)一號順豐智能櫃^', 'H852KA01P', '1', '1'),
(770, '香港九龍九龍城區九龍城太子道西414號地下(順豐站)二號順豐智能櫃^', 'H852KA02P', '1', '1'),
(771, '香港九龍深水埗區石硤尾窩仔街100號石硤尾邨服務設施大樓地下順豐智能櫃', 'H852BA14P', '1', '1'),
(772, '香港九龍深水埗區石硤尾帝景峰會所地下順豐智能櫃(只供住戶使用)', 'H852BD57P', '1', '1'),
(773, '香港九龍九龍城區啟德啟德1號二期第10座地下順豐智能櫃(只供住戶使用)', 'H852H031P', '1', '1'),
(774, '香港九龍九龍城區啟德啟德1號一期低座第3座地下順豐智能櫃(只供住戶使用)', 'H852H033P', '1', '1'),
(775, '香港九龍九龍城區啟德晴朗商場地下A025號鋪(陽光洗衣店)順豐智能櫃', 'H852H002P', '1', '1'),
(776, '香港九龍九龍城區啟德晴朗商場地下A006號鋪順豐智能櫃(面向大門)', 'H852H024P', '1', '1'),
(777, '香港九龍九龍城區啟德晴朗商場地下A006號鋪二號順豐智能櫃(大門側)', 'H852H030P', '1', '1'),
(778, '香港九龍九龍城區啟德煥然壹居H3座地下順豐智能櫃(會議室門外)(只供住戶使用)', 'H852H022P', '1', '1'),
(779, '香港九龍九龍城區啟德嘉匯地庫停車場大堂順豐智能櫃(只供住戶使用)', 'H852H035P', '1', '1'),
(780, '香港九龍九龍城區啟德天寰會所升降機外順豐智能櫃(只供住戶使用)', 'H852H036P', '1', '1'),
(781, '香港九龍九龍城區九龍塘達之路又一居一期8座地下順豐智能櫃 (只供住戶使用)', 'H852BA42P', '1', '1'),
(782, '香港九龍九龍城區九龍塘塘瑰麗路21號又一居二期會所地下順豐智能櫃(只供住戶使用)', 'H852BA28P', '1', '1'),
(783, '香港九龍九龍城區九龍塘達之路又一居三期28座地下順豐智能櫃(近回收箱)(只供住戶使用)', 'H852BA44P', '1', '1'),
(784, '香港九龍九龍城區九龍塘又一城P2層停車場升降機大堂順豐智能櫃', 'H852BA68P', '1', '1'),
(785, '香港九龍九龍城區土瓜灣馬頭角道33號欣榮花園商場地下順豐智能櫃(陳記燒鵝旁)', 'H852K004P', '1', '1'),
(786, '香港九龍九龍城區土瓜灣美光街17號地下A及B鋪順豐智能櫃', 'H852K039P', '1', '1'),
(787, '香港九龍九龍城區土瓜灣美光街17號地下A及B鋪二號順豐智能櫃', 'H852K040P', '1', '1'),
(788, '香港九龍九龍城區土瓜灣美景街31號地下(LaundrYup洗衣店)順豐智能櫃+', 'H852K015P', '1', '1'),
(789, '香港九龍九龍城區土瓜灣祟華閣地下8號(LaundrYup洗衣店)鋪順豐智能櫃', 'H852K047P', '1', '1'),
(790, '香港九龍九龍城區土瓜灣翔龍灣A大堂2樓升降機大堂順豐智能櫃(只供住戶使用)', 'H852K046P', '1', '1'),
(791, '香港九龍九龍城區土瓜灣宋皇台道38號傲雲峰3樓穿梭大堂順豐智能櫃(只供住戶使用)', 'H852K019P', '1', '1'),
(792, '香港九龍九龍城區土瓜灣宋皇台道38號傲雲峰地下停車場順豐智能櫃(近住宅電梯大堂)(只供住戶使用)', 'H852K020P', '1', '1'),
(793, '香港九龍九龍城區土瓜灣落山道96號地下(Sunshine 24)順豐智能櫃', 'H852K028P', '1', '1'),
(794, '香港九龍九龍城區土瓜灣落山道100號 (EC Laundry 智易洗)順豐智能櫃', 'H852K003P', '1', '1'),
(795, '香港九龍九龍城區土瓜灣漆鹹道北489號地下(洗衣寶洗衣店)順豐智能櫃+', 'H852K029P', '1', '1'),
(796, '香港九龍九龍城區土瓜灣下鄉道5-19號益民大廈地下C鋪(Sunshine 24)順豐智能櫃', 'H852K035P', '1', '1'),
(797, '香港九龍九龍城區土瓜灣炮仗街178號興基豪苑地下B鋪（順豐站）順豐智能櫃^', 'H852KA03P', '1', '1'),
(798, '香港九龍九龍城區紅磡黃埔花園12期地庫10號鋪(順豐站)一號順豐智能櫃^', 'H852K063P', '1', '1'),
(799, '香港九龍九龍城區紅磡黃埔花園12期地庫10號鋪(順豐站)二號順豐智能櫃^', 'H852K060P', '1', '1'),
(800, '香港九龍九龍城區紅磡黃埔花園12期地庫10號鋪(順豐站)三號順豐智能櫃^', 'H852K061P', '1', '1'),
(801, '香港九龍九龍城區紅磡老龍坑街17號寶安樓地下(Ewash)順豐智能櫃+', 'H852K021P', '1', '1'),
(802, '香港九龍九龍城區紅磡老龍坑漆鹹道北388號升禦商場1樓順豐智能櫃(國際幼稚園旁)', 'H852K002P', '1', '1'),
(803, '香港九龍九龍城區紅磡佛光街1A-7號家維邨商場地下順豐智能櫃(近家興樓入口)', 'H852K005P', '1', '1'),
(804, '香港九龍九龍城區紅磡都會道6號置富都會8樓順豐智能櫃 (近彩福皇宴旁停車場出入口)', 'H852K007P', '1', '1'),
(805, '香港九龍九龍城區紅磡德民街29號地下C3號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852K048P', '1', '1'),
(806, '香港九龍九龍城區紅磡家維商場LG層順豐智能櫃', 'H852K045P', '1', '1'),
(807, '香港九龍九龍城區紅磡寶其利街28號寶源大廈地下(365 Laundry)順豐智能櫃', 'H852K050P', '1', '1'),
(808, '香港九龍九龍城區紅磡黃埔花園十二期4座1樓公眾電梯大堂順豐智能櫃(只供住戶使用)', 'H852K049P', '1', '1'),
(809, '香港九龍九龍城區紅磡海逸豪園11座地下順豐智能櫃(只供住戶使用)', 'H852K054P', '1', '1'),
(810, '香港九龍九龍城區紅磡海逸豪園19座地下順豐智能櫃(只供住戶使用)', 'H852K055P', '1', '1'),
(811, '香港九龍九龍城區紅磡崇安街23號環海東岸2樓有蓋綠化區順豐智能櫃(只供住戶使用)', 'H852K062P', '1', '1'),
(812, '香港九龍九龍城區何文田梭椏道3號地鋪(陽光洗衣店)順豐智能櫃', 'H852BD08P', '1', '1'),
(813, '香港九龍九龍城區何文田忠孝街60號愛民廣場地下順豐智能櫃', 'H852K014P', '1', '1'),
(814, '香港九龍九龍城區何文田廣場3樓順豐智能櫃', 'H852K053P', '1', '1'),
(815, '香港九龍九龍城區何文田君頤峰地下大堂順豐智能櫃(只供住戶使用)', 'H852K056P', '1', '1'),
(816, '香港九龍油尖旺區太子彌敦道745-747號金都商場地下9號鋪順豐智能櫃', 'H852B010P', '1', '1'),
(817, '香港九龍油尖旺區太子界限街68號曉珀禦停車場2樓順豐智能櫃(只供住戶使用)', 'H852B034P', '1', '1'),
(818, '香港九龍油尖旺區太子荔枝角道178號5號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852BA06P', '1', '1'),
(819, '香港九龍油尖旺區太子大南街26號地下(順豐站)順豐智能櫃^', 'H852BA77P', '1', '1'),
(820, '', '', NULL, '1'),
(821, '香港九龍油尖旺區大角咀中匯街41號中興樓地下12號鋪(順豐站)順豐智能櫃^', 'H852BD85P', '1', '1'),
(822, '香港九龍油尖旺區大角咀利奧坊．曉岸會所戶外位置順豐智能櫃(只供住戶使用)', 'H852BD50P', '1', '1'),
(823, '香港九龍油尖旺區大角咀帝柏海灣及柏景灣穿梭電梯大堂B層順豐智能櫃(只供住戶使用)', 'H852BD62P', '1', '1'),
(824, '香港九龍油尖旺區大角咀洋松街16號地下(Sunshine 24)順豐智能櫃+', 'H852BD19P', '1', '1'),
(825, '香港九龍油尖旺區大角咀海輝道8號浪澄灣商場UG層順豐智能櫃', 'H852BD06P', '1', '1'),
(826, '香港九龍油尖旺區大角咀海帆道11號凱帆軒地下順豐智能櫃(只供住戶使用)', 'H852BD37P', '1', '1'),
(827, '香港九龍油尖旺區大角咀福利街8號港灣豪庭地下停車場大堂順豐智能櫃(只供住戶使用)', 'H852BD36P', '1', '1'),
(828, '香港九龍油尖旺區大角咀通州街28號頌賢花園商場地下6號鋪順豐智能櫃', 'H852BD09P', '1', '1'),
(829, '香港九龍油尖旺區大角咀維港灣地下35及36號升降機大堂順豐智能櫃(只供住戶使用)', 'H852BD63P', '1', '1'),
(830, '香港九龍油尖旺區大角咀海富苑海嵐閣地下順豐智能櫃', 'H852BD65P', '1', '1'),
(831, '香港九龍油尖旺區大角咀帝峯．皇殿2樓L21升降機大堂側順豐智能櫃(只供住戶使用)', 'H852BD74P', '1', '1'),
(832, '香港九龍油尖旺區大角咀海輝道18號一號銀海2M層升降機大堂順豐智能櫃(只供住戶使用)', 'H852BD80P', '1', '1'),
(833, '香港九龍油尖旺區大角咀海輝道10號瓏璽8座B2層升降機大堂順豐智能櫃(只供住戶使用)', 'H852BD82P', '1', '1'),
(834, '香港九龍油尖旺區大角咀鐵樹街24號地下(356 Laundry)順豐智能櫃', 'H852BD84P', '1', '1'),
(835, '香港九龍油尖旺區大角咀浪澄灣會所1樓順豐智能櫃(近升降機位置)(只供住戶使用)', 'H852BD60P', '1', '1'),
(836, '香港九龍油尖旺區旺角水管道3-13號長寧大廈地下C-D Shop 3號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852B025P', '1', '1'),
(837, '香港九龍油尖旺區旺角百匯軒會所順豐智能櫃(只供住戶使用)', 'H852B047P', '1', '1'),
(838, '香港九龍油尖旺區旺角彌敦道750號始創中心2樓順豐智能櫃', 'H852B005P', '1', '1'),
(839, '香港九龍油尖旺區旺角星際城市中僑商業大廈1樓119鋪順豐智能櫃', 'H852BE54P', '1', '1'),
(840, '香港九龍油尖旺區旺角麥花臣匯5樓貨運電梯大堂順豐智能櫃(只供住戶使用)', 'H852BE59P', '1', '1'),
(841, '香港九龍油尖旺區旺角渡船街301號地下A4鋪 (Bluebird Laundry)順豐智能櫃', 'H852BB15P', '1', '1'),
(842, '香港九龍油尖旺區旺角家樂坊16樓1626室順豐站順豐智能櫃^', 'H852BE73P', '1', '1'),
(843, '香港九龍油尖旺區旺角家樂坊16樓1626室順豐站2號順豐智能櫃^', 'H852BE81P', '1', '1'),
(844, '香港九龍油尖旺區油麻地彌敦道562號地下順豐智能櫃(近油尖區康體會)', 'H852BB45P', '1', '1'),
(845, '香港九龍油尖旺區油麻地窩打老道8號5樓商業中心順豐智能櫃(只供住戶使用)', 'H852BB21P', '1', '1'),
(846, '香港九龍油尖旺區油麻地眾坊街3號駿發花園5座地下順豐智能櫃', 'H852BB12P', '1', '1'),
(847, '香港九龍油尖旺區油麻地東安街45號寶亨大廈地下(你的自助洗衣坊)順豐智能櫃', 'H852BB86P', '1', '1'),
(848, '香港九龍油尖旺區油麻地御金．國峰平台順豐智能櫃(只供住戶使用)', 'H852NC01P', '1', '1'),
(849, '香港九龍油尖旺區佐敦文苑街1-23號文英樓地下A鋪 (LaundrYup洗衣店)順豐智能櫃', 'H852EA05P', '1', '1'),
(850, '香港九龍油尖旺區佐敦文英街37號A文景樓地下37A鋪(洗衣皇自助洗衣店)順豐智能櫃', 'H852EA15P', '1', '1'),
(851, '香港九龍油尖旺區佐敦官湧街24-30號喜滿懷大廈地下1C鋪順豐智能櫃', 'H852EA08P', '1', '1'),
(852, '香港九龍油尖旺區佐敦炮臺街41號地下C鋪(365 Laundry)順豐智能櫃', 'H852EA23P', '1', '1'),
(853, '香港九龍油尖旺區佐敦顯發大廈地下1號鋪(Sunshine 24)順豐智能櫃', 'H852EA28P', '1', '1'),
(854, '香港九龍油尖旺區佐敦廟街26號地下(C+ Laundry)順豐智能櫃', 'H852BB83P', '1', '1'),
(855, '香港九龍油尖旺區佐敦文苑街35A號文輝樓地下(你的自助洗衣坊)順豐智能櫃', 'H852EA35P', '1', '1'),
(856, '香港九龍油尖旺區尖沙咀漆咸道南79號中國五礦大廈貨梯大堂入口順豐智能櫃(近保安室)+', 'H852E010P', '1', '1'),
(857, '香港九龍油尖旺區尖沙咀彌敦道132-134T號美麗華商場地庫2樓順豐智能櫃', 'H852E002P', '1', '1'),
(858, '香港九龍油尖旺區尖沙咀天璽1樓穿梭大堂順豐智能櫃(只供住戶使用)', 'H852E027P', '1', '1'),
(859, '香港九龍油尖旺區尖沙咀君臨天下停車場升降機大堂地下順豐智能櫃(只供住戶使用)', 'H852E029P', '1', '1'),
(860, '香港九龍油尖旺區尖沙咀The Austin 一座地下順豐智能櫃(只供住戶使用)', 'H852E031P', '1', '1'),
(861, '香港九龍油尖旺區尖沙咀柯士甸道西1號擎天半島地下停車場順豐智能櫃(只供用戶使用)', 'H852EB33P', '1', '1'),
(862, '香港九龍油尖旺區尖沙咀柯士甸道西1號漾日居三樓平台第一座旁順豐智能櫃 (只供用戶使用)', 'H852EB34P', '1', '1'),
(863, '香港九龍深水埗區深水埗大埔道77E號地下(365 Laundry)順豐智能櫃', 'H852BA31P', '1', '1'),
(864, '香港九龍深水埗區深水埗荔枝角道339號豐匯會所順豐智能櫃(只供住戶使用)', 'H852BA16P', '1', '1'),
(865, '香港九龍深水埗區深水埗北河街138號地鋪(你的自助洗衣坊)順豐智能櫃(近巴域街)', 'H852BA53P', '1', '1'),
(866, '香港九龍深水埗區深水埗石硤尾街12號B號鋪(洗衣點)順豐智能櫃', 'H852BA58P', '1', '1'),
(867, '香港九龍深水埗區深水埗石硤尾街2R號地下A鋪(洗衣寶洗衣店)順豐智能櫃+', 'H852BA18P', '1', '1'),
(868, '香港九龍深水埗區深水埗發祥街10號李鄭屋邨和平樓平台順豐智能櫃', 'H852DA05P', '1', '1'),
(869, '香港九龍深水埗區深水埗發祥街10號李鄭屋邨信義樓地下順豐智能櫃', 'H852DA16P', '1', '1'),
(870, '香港九龍深水埗區深水埗長沙灣道333號怡閣苑怡康閣地下順豐智能櫃', 'H852DA26P', '1', '1'),
(871, '香港九龍深水埗區深水埗海柏匯2樓會所順豐智能櫃(只供住戶使用)', 'H852BA48P', '1', '1'),
(872, '香港九龍深水埗區深水埗欽州街94A號高登電腦中心1樓順豐智能櫃', 'H852BA02P', '1', '1'),
(873, '香港九龍深水埗區深水埗欽州街8號金濤閣1號地鋪(365 Laundry)順豐智能櫃+', 'H852BA17P', '1', '1'),
(874, '香港九龍深水埗區深水埗黃竹街31號地下A鋪(你的自助洗衣坊)順豐智能櫃', 'H852BA32P', '1', '1'),
(875, '香港九龍深水埗區深水埗楓樹街13號A華楓樓地下3號鋪(你的自助洗衣坊)順豐智能櫃', 'H852BA30P', '1', '1'),
(876, '香港九龍深水埗區深水埗福華街35號地下A鋪(全日洗洗衣店)順豐智能櫃', 'H852BA24P', '1', '1'),
(877, '香港九龍深水埗區深水埗福榮街153-159號冠奇大廈地下4A鋪(泡泡24小時洗衣店)順豐智能櫃', 'H852BA27P', '1', '1'),
(878, '香港九龍深水埗區深水埗大埔道188號曉尚會所2樓順豐智能櫃 (只供住戶使用)', 'H852BA43P', '1', '1'),
(879, '香港九龍深水埗區深水埗欽州街8號金濤閣1號(365 Laundry) 二號順豐智能櫃', 'H852BA69P', '1', '1'),
(880, '香港九龍深水埗區深水埗醫局街永明大廈地下212B號舖(你的自助洗衣坊)順豐智能櫃', 'H852BA86P', '1', '1'),
(881, '香港九龍深水埗區長沙灣幸祥街8號幸福商場地下6號鋪順豐智能櫃+', 'H852DA19P', '1', '1'),
(882, '香港九龍深水埗區長沙灣幸祥街8號幸福商場地下6號鋪二號順豐智能櫃', 'H852DA28P', '1', '1'),
(883, '香港九龍深水埗區長沙灣幸祥街8號幸福商場地下6號鋪三號順豐智能櫃', 'H852DA30P', '1', '1'),
(884, '香港九龍深水埗區長沙灣幸祥街8號幸福商場地下6號鋪四號順豐智能櫃', 'H852DA31P', '1', '1'),
(885, '香港九龍深水埗區長沙灣元州街471號昌華閣地下1號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852D017P', '1', '1'),
(886, '香港九龍深水埗區長沙灣通州街500號星匯居6樓順豐智能櫃(只供住戶使用)', 'H852DA15P', '1', '1'),
(887, '香港九龍深水埗區長沙灣海麗商場1樓順豐智能櫃(阿波羅旁)', 'H852DA24P', '1', '1'),
(888, '香港九龍深水埗區長沙灣順寧道25A號薈悅地下2號鋪(水漾衣坊)順豐智能櫃', 'H852DA03P', '1', '1'),
(889, '香港九龍深水埗區長沙灣福華街544號地下B鋪(你的自助洗衣坊)順豐智能櫃', 'H852DA18P', '1', '1'),
(890, '香港九龍深水埗區長沙灣東沙島街171號地下(365 Laundry)順豐智能櫃', 'H852DA39P', '1', '1'),
(891, '香港九龍深水埗區長沙灣蘇屋邨荷花樓地下2號車庫旁順豐智能櫃', 'H852DA44P', '1', '1'),
(892, '香港九龍深水埗區長沙灣海盈邨盈昌樓升降機樓地下順豐智能櫃', 'H852D041P', '1', '1'),
(893, '香港九龍深水埗區荔枝角荔欣苑荔采閣地下順豐智能櫃(只供住戶使用)', 'H852D027P', '1', '1'),
(894, '香港九龍深水埗區荔枝角深盛路8號碧海藍天2樓穿梭升降機大堂順豐智能櫃(只供住戶使用)+', 'H852DA29P', '1', '1'),
(895, '香港九龍深水埗區荔枝角深盛路8號碧海藍天AEON 1樓順豐智能櫃 (升降機大堂)', 'H852DA25P', '1', '1'),
(896, '香港九龍深水埗區荔枝角荔枝角道863號泓景臺地下順豐智能櫃', 'H852DA04P', '1', '1'),
(897, '香港九龍深水埗區荔枝角深盛路9號宇晴軒6樓平臺順豐智能櫃(只供住戶使用)', 'H852DA07P', '1', '1'),
(898, '香港九龍深水埗區美孚景荔徑8號盈暉薈1樓順豐智能櫃(靠近往2樓扶手電梯)+', 'H852D011P', '1', '1'),
(899, '香港九龍深水埗區美孚百老匯街69-119號美孚新邨美孚廣場1樓101號鋪&102號鋪順豐智能櫃', 'H852DB32P', '1', '1'),
(900, '香港九龍深水埗區美孚百老匯街69-119號美孚新邨美孚廣場1樓101號鋪&102號鋪部份二號順豐智能櫃', 'H852DB33P', '1', '1'),
(901, '香港九龍深水埗區美孚百老匯街69-119號美孚新邨美孚廣場1樓101號鋪&102號鋪部份三號順豐智能櫃', 'H852DB34P', '1', '1'),
(902, '香港九龍深水埗區美孚百老匯街69-119號美孚新邨美孚廣場1樓101號鋪&102號鋪部份四號順豐智能櫃', 'H852DB35P', '1', '1'),
(903, '香港九龍深水埗區美孚蘭秀道9號地下N1A號鋪(水漾衣坊)順豐智能櫃', 'H852DB38P', '1', '1'),
(904, '香港九龍深水埗區美孚清麗苑C座地下順豐智能櫃', 'H852D042P', '1', '1'),
(905, '香港九龍深水埗區美孚曼坊1樓順豐智能櫃(759阿信屋旁)+', 'H852D009P', '1', '1'),
(906, '香港九龍深水埗區南昌西村路榮昌邨榮傑樓地下順豐智能櫃', 'H852BD26P', '1', '1'),
(907, '香港九龍深水埗區南昌匯璽5樓平臺順豐智能櫃(T5穿梭大堂外)(只供住戶使用)', 'H852BD66P', '1', '1'),
(908, '香港九龍黃大仙區黃大仙竹園道55號天馬苑商場1樓順豐智能櫃+', 'H852J013P', '1', '1'),
(909, '香港九龍黃大仙區黃大仙彩虹道121號啟德花園商場地下順豐智能櫃(電梯底)', 'H852J004P', '1', '1'),
(910, '香港九龍黃大仙區黃大仙啟德花園購物商場地下二號順豐智能櫃(近停車場收費處)', 'H852J038P', '1', '1'),
(911, '香港九龍黃大仙區黃大仙睦鄰街8號現崇山商場2樓順豐智能櫃(近皇廷匯外面扶手電梯)', 'H852J011P', '1', '1'),
(912, '香港九龍黃大仙區黃大仙翠竹街8號翠竹花園1座地下順豐智能櫃(只供住戶使用)', 'H852J018P', '1', '1'),
(913, '香港九龍黃大仙區黃大仙翠竹街8號翠竹花園停車場入口順豐智能櫃(只供住戶使用)', 'H852J019P', '1', '1'),
(914, '香港九龍黃大仙區黃大仙翠鳳街6號地下(淨大師自助洗衣)順豐智能櫃', 'H852J025P', '1', '1'),
(915, '香港九龍黃大仙區黃大仙銀鳳街10號地下A鋪(2洗自助洗衣店) 順豐智能櫃', 'H852J017P', '1', '1'),
(916, '香港九龍黃大仙區黃大仙竹園廣場1樓順豐智能櫃', 'H852J043P', '1', '1'),
(917, '香港九龍黃大仙區黃大仙竹園廣場2樓順豐智能櫃', 'H852J046P', '1', '1'),
(918, '香港九龍黃大仙區黃大仙東頭邨旺東樓地下7號鋪順豐智能櫃', 'H852J034P', '1', '1'),
(919, '香港九龍黃大仙區黃大仙東頭邨旺東樓地下7號鋪二號順豐智能櫃+', 'H852J035P', '1', '1'),
(920, '香港九龍黃大仙區黃大仙竹園北邨松園樓地下順豐智能櫃', 'H852J039P', '1', '1'),
(921, '香港九龍黃大仙區黃大仙竹園北邨梅園樓地下順豐智能櫃', 'H852J040P', '1', '1'),
(922, '香港九龍黃大仙區黃大仙翠竹花園9座地下順豐智能櫃(只供住戶使用)', 'H852J056P', '1', '1'),
(923, '香港九龍黃大仙區黃大仙環鳯街65號地下(C+ Laundry)順豐智能櫃', 'H852J059P', '1', '1'),
(924, '香港九龍黃大仙區新蒲崗崇齡街33號新蒲崗廣場2樓C23號店順豐智能櫃', 'H852J006P', '1', '1'),
(925, '香港九龍黃大仙區新蒲崗越秀廣場2樓205號鋪順豐智能櫃(入門口右櫃，Mikiki商場旁)', 'H852J044P', '1', '1'),
(926, '香港九龍黃大仙區新蒲崗越秀廣場2樓205號鋪二號順豐智能櫃(入門口左櫃，Mikiki商場旁)', 'H852J045P', '1', '1'),
(927, '香港九龍黃大仙區慈雲山欣華街12號慈安苑安康閣地下順豐智能櫃(往來商場通道)', 'H852J014P', '1', '1'),
(928, '香港九龍黃大仙區慈雲山欣華街12號慈安苑安康閣地下二號順豐智能櫃', 'H852J020P', '1', '1'),
(929, '香港九龍黃大仙區慈雲山蒲崗村道153-155號華麗樓地下2號鋪順豐站一號順豐智能櫃^', 'H852J057P', '1', '1'),
(930, '香港九龍黃大仙區慈雲山蒲崗村道153-155號華麗樓地下2號鋪順豐站二號順豐智能櫃^', 'H852J058P', '1', '1'),
(931, '香港九龍黃大仙區慈雲山慈雲山中心7樓704B舖一號順豐智能櫃', 'H852J062P', '1', '1'),
(932, '香港九龍黃大仙區慈雲山慈雲山中心7樓704B舖二號順豐智能櫃', 'H852J063P', '1', '1'),
(933, '香港九龍黃大仙區慈雲山慈雲山中心7樓704B舖三號順豐智能櫃', 'H852J064P', '1', '1'),
(934, '香港九龍黃大仙區老虎岩聯合道198號樂富廣場1樓順豐智能櫃(往樂富市集通道旁、近跌打鋪)', 'H852J002P', '1', '1'),
(935, '香港九龍黃大仙區老虎岩聯合道198號樂富廣場2樓順豐智能櫃(煤氣公司側)', 'H852J010P', '1', '1'),
(936, '香港九龍黃大仙區樂富匯富坊地下順豐智能櫃(洗手間外)+', 'H852J053P', '1', '1'),
(937, '香港九龍黃大仙區樂富橫頭磡杏林街23號康强苑地下順豐智能櫃', 'H852J061P', '1', '1'),
(938, '香港九龍黃大仙區鑽石山龍蟠苑商埸1樓順豐智能櫃(110鋪外)', 'H852J054P', '1', '1'),
(939, '香港九龍黃大仙區彩虹坪石邨玉石樓平臺順豐智能櫃(電梯大堂外)', 'H852J009P', '1', '1'),
(940, '香港九龍黃大仙區彩虹彩虹邨金碧樓街市地下順豐智能櫃(中央通道報告板旁)', 'H852J008P', '1', '1'),
(941, '香港九龍黃大仙區彩虹清水灣道8號匯八坊B1層104號鋪順豐智能櫃(左邊一組)', 'H852J026P', '1', '1'),
(942, '香港九龍黃大仙區彩虹清水灣道8號匯八坊B1層104號鋪二號順豐智能櫃(右邊一組)', 'H852J028P', '1', '1'),
(943, '香港九龍黃大仙區彩虹曉暉花園3座及5座P2層順豐智能櫃(只供住戶使用)', 'H852J027P', '1', '1'),
(944, '香港九龍黃大仙區牛池灣瓊東街1號瓊軒苑地下順豐智能櫃', 'H852J024P', '1', '1'),
(945, '香港九龍黃大仙區牛池灣豐盛街33號海港花園地下大堂二號順豐智能櫃', 'H852J060P', '1', '1'),
(946, '香港九龍黃大仙區牛池灣彩雲商場2樓B212鋪順豐智能櫃+', 'H852J049P', '1', '1'),
(947, '香港九龍黃大仙區牛池灣彩雲商場2樓B212鋪二號順豐智能櫃+', 'H852J050P', '1', '1'),
(948, '香港九龍黃大仙區牛池灣峻弦地下卸貨區通道順豐智能櫃(只供住戶使用)', 'H852J055P', '1', '1'),
(949, '香港九龍黃大仙區牛池灣豐盛街 32 號瓊山苑 F 座地下順豐智能櫃(往富山邨方向通道)+', 'H852J015P', '1', '1'),
(950, '香港九龍黃大仙區牛池灣嘉峰台商場1樓順豐智能櫃(P17A鋪對面)', 'H852J016P', '1', '1'),
(951, '香港九龍黃大仙區牛池灣海港花園地下大堂順豐智能櫃(只供住戶使用)', 'H852J042P', '1', '1'),
(952, '香港九龍黃大仙區牛池灣瓊麗苑A座地下順豐智能櫃(業主立案法團通訊處對出)(只供住戶使用)', 'H852J047P', '1', '1'),
(953, '香港九龍黃大仙區牛池灣豐盛街32號瓊山苑F座地下二號順豐智能櫃(往富山邨方向通道)', 'H852J041P', '1', '1'),
(954, '香港九龍黃大仙區牛池灣清水灣道45號彩雲商場2樓B212鋪三號順豐智能櫃', 'H852J051P', '1', '1'),
(955, '香港九龍黃大仙區牛池灣清水灣道45號彩雲商場2樓B212鋪四號順豐智能櫃', 'H852J052P', '1', '1'),
(956, '香港九龍觀塘區九龍灣宏照道38號企業廣埸五期Megabox 12樓順豐智能櫃+', 'H852H014P', '1', '1'),
(957, '香港九龍觀塘區九龍灣常悅道3號企業廣場二期1樓升降機大堂順豐智能櫃', 'H852H020P', '1', '1'),
(958, '香港九龍觀塘區九龍灣牛頭角道33號宏光樓地下11B鋪(洗衣360)順豐智能櫃+', 'H852H008P', '1', '1'),
(959, '香港九龍觀塘區九龍灣啟業道28號啟泰苑啟康閣地下順豐智能櫃(只供住戶使用)', 'H852H010P', '1', '1'),
(960, '香港九龍觀塘區九龍灣啟泰苑啟勳閣地下順豐智能櫃(只供住戶使用)', 'H852H027P', '1', '1'),
(961, '香港九龍觀塘區九龍灣牛頭角道3號得寶商場1樓 TA01號鋪順豐智能櫃(順豐站右側)^', 'H852H005P', '1', '1'),
(962, '香港九龍觀塘區九龍灣得寶商場1樓TA02號鋪二號順豐智能櫃(順豐站與飛越教育左側)^', 'H852H029P', '1', '1'),
(963, '香港九龍觀塘區九龍灣牛頭角道77號淘大商場1樓順豐智能櫃(男洗手間旁)', 'H852H001P', '1', '1'),
(964, '香港九龍觀塘區九龍灣牛頭角道77號淘大商場三期2樓順豐智能櫃(近XOXO Cafe Lab)', 'H852H019P', '1', '1'),
(965, '香港九龍觀塘區九龍灣德福廣場二期8樓順豐智能櫃', 'H852H028P', '1', '1'),
(966, '香港九龍觀塘區九龍灣宏光道80號麗晶花園13座地下順豐智能櫃(大堂出口右邊)+', 'H852H006P', '1', '1'),
(967, '香港九龍觀塘區九龍灣宏遠街1號一號九龍1樓扶手電梯旁順豐智能櫃(近101號鋪)', 'H852HB01P', '1', '1'),
(968, '香港九龍觀塘區九龍灣牛頭角下邨貴新樓地下順豐智能櫃(屋邨辦事處右邊通道)+', 'H852H009P', '1', '1'),
(969, '香港九龍觀塘區九龍灣臨興街19號同力工業中心B座地下(順豐營業點)順豐智能櫃^', 'H852H037P', '1', '1'),
(970, '香港九龍觀塘區牛頭角安基商場1樓121號鋪順豐智能櫃', 'H852H023P', '1', '1'),
(971, '香港九龍觀塘區牛頭角牛頭角道55號利基大廈地下順豐智能櫃(英皇教育左邊電梯口)+', 'H852H015P', '1', '1'),
(972, '香港九龍觀塘區牛頭角彩德商場5樓順豐智能櫃(512號鋪對面)', 'H852H004P', '1', '1'),
(973, '香港九龍觀塘區牛頭角彩霞邨彩月樓地下順豐智能櫃(管理處旁)', 'H852H003P', '1', '1'),
(974, '香港九龍觀塘區牛頭角樂華商場3樓順豐智能櫃', 'H852H034P', '1', '1'),
(975, '香港九龍觀塘區牛頭角彩福邨彩喜樓1樓順豐智能櫃', 'H852H017P', '1', '1'),
(976, '香港九龍觀塘區牛頭角裕民中心地下G53(順豐站)順豐智能櫃^', 'H852CB03P', '1', '1'),
(977, '', '', NULL, '1'),
(978, '香港九龍觀塘區觀塘安達商場LG層順豐智能櫃(商場服務台前面)+', 'H852CC28P', '1', '1'),
(979, '香港九龍觀塘區觀塘祥和苑和悅閣地下順豐智能櫃', 'H852CB77P', '1', '1'),
(980, '香港九龍觀塘區觀塘通明街80號地下(水漾衣坊)順豐智能櫃', 'H852CB34P', '1', '1'),
(981, '香港九龍觀觀塘區塘觀塘道418號創紀之城五期APM地庫1樓順豐智能櫃', 'H852CD31P', '1', '1'),
(982, '香港九龍觀塘區觀塘利安道15號順利商場一期3樓順豐智能櫃(利康樓3樓廁所對面)', 'H852C001P', '1', '1'),
(983, '香港九龍觀塘區觀塘牛頭角道300-302號裕民中心裕民薈1樓145號鋪順豐智能櫃', 'H852CB16P', '1', '1'),
(984, '香港九龍觀塘區觀塘嘉樂街22號地下A號鋪(LaundrYup洗衣店)順豐智能櫃(馬會投注站斜對面)', 'H852CB21P', '1', '1'),
(985, '香港九龍觀塘區觀塘嘉樂街8號宏業樓地下6A鋪(洗衣寶洗衣店)順豐智能櫃', 'H852CB60P', '1', '1'),
(986, '香港九龍觀塘區觀塘香港啟迪中心地下郵件房順豐智能櫃+', 'H852C003P', '1', '1'),
(987, '香港九龍觀塘區觀塘曉麗商場2樓215B及216號鋪順豐智能櫃', 'H852C008P', '1', '1'),
(988, '香港九龍觀塘區觀塘曉麗商場2樓215B及216號鋪四號順豐智能櫃', 'H852C012P', '1', '1'),
(989, '香港九龍觀塘區觀塘曉光街21號曉麗商場2樓215B及216號鋪二號順豐智能櫃', 'H852C013P', '1', '1'),
(990, '香港九龍觀塘區觀塘曉光街21號曉麗商場2樓215B及216號鋪三號順豐智能櫃', 'H852C011P', '1', '1'),
(991, '香港九龍觀塘區觀塘月華大廈1座順豐智能櫃(只供住戶使用)', 'H852CB01P', '1', '1'),
(992, '香港九龍觀塘區觀塘順緻苑順輝閣地下順豐智能櫃', 'H852CH06P', '1', '1'),
(993, '香港九龍觀塘區觀塘開源道49號創貿廣場地下停車場順豐智能櫃', 'H852CB04P', '1', '1'),
(994, '香港九龍觀塘區觀塘康利道11號樂意園B2層電梯大堂順豐智能櫃(只供住戶使用)', 'H852CB07P', '1', '1');
INSERT INTO `tp_locations` (`id`, `name`, `code`, `cateId`, `isdel`) VALUES
(995, '香港九龍觀塘區秀茂坪秀明道秀茂坪商場3樓順豐智能櫃(社會福利署對面通道)', 'H852C036P', '1', '1'),
(996, '香港九龍觀塘區秀茂坪秀明道秀茂坪商場3樓二號順豐智能櫃(社會福利署對面通道)', 'H852C088P', '1', '1'),
(997, '香港九龍觀塘區秀茂坪秀明道秀茂坪商場3樓三號順豐智能櫃(社會福利署對面通道)', 'H852C100P', '1', '1'),
(998, '香港九龍觀塘區秀茂坪寶達商場2樓順豐智能櫃', 'H852CC99P', '1', '1'),
(999, '香港九龍觀塘區秀茂坪寶琳路2號寶達商場1樓LK01位置順豐智能櫃', 'H852CC32P', '1', '1'),
(1000, '香港九龍觀塘區藍田連德道2號康華苑A座大堂順豐智能櫃(只供住戶使用)', 'H852CC46P', '1', '1'),
(1001, '香港九龍觀塘區藍田連德道2號康華苑B座大堂順豐智能櫃(只供住戶使用)', 'H852CC47P', '1', '1'),
(1002, '香港九龍觀塘區藍田連德道2號康華苑C座大堂順豐智能櫃(只供住戶使用)', 'H852CC48P', '1', '1'),
(1003, '香港九龍觀塘區藍田匯景道8號匯景廣場5樓順豐智能櫃(4號鋪側)', 'H852CA45P', '1', '1'),
(1004, '香港九龍觀塘區藍田德田邨德瑞樓地下順豐智能櫃', 'H852CC85P', '1', '1'),
(1005, '香港九龍觀塘區藍田慶田街7號藍田邨藍蔚樓地下順豐智能櫃', 'H852CC42P', '1', '1'),
(1006, '香港九龍觀塘區藍田茶果嶺道93號麗港城三期城中薈地下7號鋪順豐智能櫃+', 'H852CA57P', '1', '1'),
(1007, '香港九龍觀塘區藍田茶果嶺道88號麗港城商場1樓CA04位置順豐智能櫃(通往地鐵站行人天橋出口旁)', 'H852CA54P', '1', '1'),
(1008, '香港九龍觀塘區藍田啟田商場地下二號順豐智能櫃(近巴士站樓梯底旁)', 'H852CC05P', '1', '1'),
(1009, '香港九龍觀塘區藍田啟田商場地下三號順豐智能櫃(近巴士站樓梯底旁)+', 'H852CC06P', '1', '1'),
(1010, '香港九龍觀塘區藍田平田商場地下5號鋪順豐智能櫃', 'H852CC89P', '1', '1'),
(1011, '香港九龍觀塘區藍田平田商場地下5號鋪二號順豐智能櫃', 'H852CC90P', '1', '1'),
(1012, '香港九龍觀塘區藍田啟田大廈地下6B鋪(LaundrYup洗衣店)順豐智能櫃+', 'H852CC07P', '1', '1'),
(1013, '香港九龍觀塘區藍田鯉安苑鯉欣閣地下順豐智能櫃(有蓋空地)', 'H852CA02P', '1', '1'),
(1014, '香港九龍觀塘區藍田廣田商場2樓207A鋪(LaundrYup洗衣店)順豐智能櫃', 'H852CF01P', '1', '1'),
(1015, '香港九龍觀塘區油塘鯉魚門道56號油翠苑地下電梯大堂順豐智能櫃(向油塘邨方向)', 'H852CA33P', '1', '1'),
(1016, '香港九龍觀塘區油塘鯉魚門道56號油翠苑沃美閣地下順豐智能櫃(升降機大堂)+', 'H852CA50P', '1', '1'),
(1017, '香港九龍觀塘區油塘油塘道9號油麗邨豐麗樓順豐智能櫃(近三號升降機LG1層)', 'H852CA41P', '1', '1'),
(1018, '香港九龍觀塘區油塘油塘道9號油麗商場2樓順豐智能櫃(往3樓扶手電梯旁)', 'H852CA08P', '1', '1'),
(1019, '香港九龍觀塘區油塘高俊苑順豐智能櫃(下層升降機穿梭大堂)', 'H852CA94P', '1', '1'),
(1020, '香港九龍觀塘區油塘鯉魚門道80號鯉魚門廣場底層1樓順豐智能櫃(渣打銀行櫃員機旁)', 'H852CA07P', '1', '1'),
(1021, '香港九龍觀塘區油塘鯉魚門廣場2樓順豐智能櫃(近酒樓位置)', 'H852CA98P', '1', '1'),
(1022, '', '', NULL, '1'),
(1023, '', '', NULL, '1'),
(1024, '', '', NULL, '1'),
(1025, '', '', NULL, '1'),
(1026, '', '', NULL, '1'),
(1027, '智能櫃詳細地址', '網點代碼', NULL, '1'),
(1028, '香港香港島中西區堅尼地城士美菲路71-77號2A號鋪(LaundryUp洗衣店)順豐智能櫃+', 'H852MA23P', '3', '1'),
(1029, '香港香港島中西區堅尼地城加惠民道29號加惠台5樓停車場順豐智能櫃(只供住戶使用)', 'H852MA27P', '3', '1'),
(1030, '香港香港島中西區堅尼地城浚峰3樓平臺順豐智能櫃(只供住戶使用)', 'H852MA37P', '3', '1'),
(1031, '香港香港島中西區堅尼地城南裏8號25樓會所順豐智能櫃(只供住戶使用)', 'H852MA45P', '3', '1'),
(1032, '香港香港島中西區堅尼地城卑路乍街聯基新樓地下(陽光洗衣店)順豐智能櫃(實惠對面)', 'H852MA13P', '3', '1'),
(1033, '香港香港島中西區西環吉席街74號誠泰大厦地下74A號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852MA05P', '3', '1'),
(1034, '香港香港島中西區西環和合街6-12號國基大厦地下D鋪順豐智能櫃', 'H852MA29P', '3', '1'),
(1035, '香港香港島中西區西環高樂花園1座4樓平臺順豐智能櫃(只供住戶使用)', 'H852MA28P', '3', '1'),
(1036, '香港香港島中西區西營盤德輔道西273號均益大厦三期地下32A鋪(LaundrYup洗衣店)順豐智能櫃+', 'H852MA12P', '3', '1'),
(1037, '香港香港島中西區西營盤維港峰地下3號鋪(Sunshine 24)順豐智能櫃', 'H852MA31P', '3', '1'),
(1038, '香港香港島中西區西營磐石塘咀山道71-77號地下順豐智能櫃(只供住戶使用)', 'H852MA40P', '3', '1'),
(1039, '香港香港島中西區西營盤東邊街11號地下(Sunshine 24)順豐智能櫃+', 'H852MA14P', '3', '1'),
(1040, '香港香港島中西區西營盤第1街8號縉城峰地庫穿梭升降機大堂順豐智能櫃(只供住戶使用)', 'H852M046P', '3', '1'),
(1041, '香港香港島中西區上環文鹹東街50號G18號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852M009P', '3', '1'),
(1042, '香港香港島中西區上環士丹頓街72號尚賢居1樓平臺順豐智能櫃', 'H852M015P', '3', '1'),
(1043, '香港香港島中西區上環東街25號地下(LaundrYup洗衣店)順豐智能櫃', 'H852M020P', '3', '1'),
(1044, '香港香港島中西區上環荷李活道108號聚賢居1座3樓順豐智能櫃(只供住戶使用)', 'H852M016P', '3', '1'),
(1045, '香港香港島中西區中環2號碼頭地下順豐智能櫃', 'H852M038P', '3', '1'),
(1046, '香港香港島中西區半山區巴丙頓山B1層停車場順豐智能櫃(只供住戶使用)', 'H852M035P', '3', '1'),
(1047, '香港香港島中西區半山衛城道活倫大厦地下C號鋪(英發成Laundry & Bakery)順豐智能櫃', 'H852M033P', '3', '1'),
(1048, '香港香港島中西區半山區地利根德閣第3座L1層順豐智能櫃(只供住戶使用)', 'H852M041P', '3', '1'),
(1049, '香港香港島中西區半山區竹林苑84座地下貨運升降機順豐智能櫃(只供住戶使用)', 'H852TD49P', '3', '1'),
(1050, '香港香港島中西區半山區羅便臣道95號殷樺花園一期平臺順豐智能櫃(只供住戶使用)', 'H852M026P', '3', '1'),
(1051, '香港香港島南區薄扶林置富道12號置富南區廣場1樓順豐智能櫃(Fusion超市右邊電梯落)', 'H852TB16P', '3', '1'),
(1052, '香港香港島南區黃竹坑雅濤閣順豐智能櫃(4座入口旁)', 'H852TB50P', '3', '1'),
(1053, '香港香港島南區鴨脷洲鴨脷洲大街63號利是大厦地下A鋪順豐智能櫃(順豐站旁)^', 'H852TB37P', '3', '1'),
(1054, '香港香港島南區鴨脷洲海怡路12A號海怡西商場2樓順豐智能櫃', 'H852TB04P', '3', '1'),
(1055, '香港香港島南區鴨脷洲海怡東商場3樓316號鋪順豐智能櫃', 'H852TB44P', '3', '1'),
(1056, '香港香港島南區鴨脷洲海怡東商場3樓316號鋪二號順豐智能櫃', 'H852TB45P', '3', '1'),
(1057, '香港香港島南區鴨脷洲鴨脷洲村利澤樓地下15A鋪(Sunshine24)順豐智能櫃', 'H852TB51P', '3', '1'),
(1058, '香港香港島灣仔區跑馬地晋寶大厦地下B鋪(LaundryUp洗衣店)順豐智能櫃+', 'H852T048P', '3', '1'),
(1059, '香港香港島灣仔區灣仔軒尼詩道298號298計算機特區2樓351號鋪順豐智能櫃', 'H852TC01P', '3', '1'),
(1060, '香港香港島灣仔區灣仔交加裏7號永成大厦地下7B鋪(自洗王國)順豐智能櫃', 'H852TC17P', '3', '1'),
(1061, '香港香港島灣仔區灣仔灣仔道125號國泰881樓F18鋪順豐智能櫃', 'H852TC02P', '3', '1'),
(1062, '香港香港島灣仔區灣仔謝斐道151號金聲大厦地下(LaundrYup洗衣店)順豐智能櫃', 'H852TC29P', '3', '1'),
(1063, '香港香港島灣仔區灣仔軒尼詩道87號地下B鋪C部份(自洗王國)順豐智能櫃', 'H852TC52P', '3', '1'),
(1064, '香港香港島灣仔區銅鑼灣怡和街68號百利保廣場1樓順豐智能櫃(近天橋出入口)', 'H852TD14P', '3', '1'),
(1065, '香港香港島灣仔區銅鑼灣利舞臺10樓順豐智能櫃', 'H852TD34P', '3', '1'),
(1066, '香港香港島灣仔區銅鑼灣百德新街2-20號恒隆中心地庫順豐智能櫃(停車場出入口)+', 'H852TD12P', '3', '1'),
(1067, '香港香港島灣仔區大坑大坑徑25號龍華花園2座平臺順豐智能櫃(只供住戶使用)', 'H852TD08P', '3', '1'),
(1068, '香港香港島灣仔區大坑勵德村道2-38號勵德村村榮樓停車場順豐智能櫃', 'H852TD13P', '3', '1'),
(1069, '香港香港島灣仔區大坑慧景園1座平臺順豐智能櫃(只供住戶使用)', 'H852TD47P', '3', '1'),
(1070, '香港香港島東區天后木星街1號公安樓地下1A號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852P022P', '3', '1'),
(1071, '香港香港島東區天后興發街62-74號美城花園大厦地下D鋪(禮事豐)順豐智能櫃^', 'H852P085P', '3', '1'),
(1072, '香港香港島東區北角丹拿道18號丹拿花園地下停車場順豐智能櫃', 'H852P037P', '3', '1'),
(1073, '香港香港島東區北角電氣道233號城市花園商場第十座地下順豐智能櫃', 'H852P049P', '3', '1'),
(1074, '香港香港島東區北角電氣街223號城市花園1-3座城市金庫地庫170號鋪順豐智能櫃', 'H852P044P', '3', '1'),
(1075, '香港香港島東區北角健康村二期下層地下順豐智能櫃', 'H852PA05P', '3', '1'),
(1076, '香港香港島東區北角堡壘街21-23號地下F1B號鋪(LaundrYup洗衣店)順豐智能櫃+', 'H852P010P', '3', '1'),
(1077, '香港香港島東區北角富雅花園地下順豐智能櫃(業主立案法團會議室旁)(只供住戶使用)', 'H852P062P', '3', '1'),
(1078, '香港香港島東區北角英皇道416-426號新都城大厦地庫順豐智能櫃', 'H852P021P', '3', '1'),
(1079, '香港香港島東區北角錦屏街29-35號東發大厦A座地下31號鋪(LaundrYup洗衣店)順豐智能櫃+', 'H852P004P', '3', '1'),
(1080, '香港香港島東區北角寶馬山花園侯車室順豐智能櫃(只供住戶使用)', 'H852P059P', '3', '1'),
(1081, '香港香港島東區北角柏蔚山2樓停車場電梯大堂順豐智能櫃(只供住戶使用)', 'H852P063P', '3', '1'),
(1082, '香港香港島東區北角尚譽3樓休憩處順豐智能櫃(只供住戶使用)', 'H852P066P', '3', '1'),
(1083, '香港香港島東區北角城市中心商場1樓順豐智能櫃', 'H852P067P', '3', '1'),
(1084, '香港香港島東區北角豐富商場地下8-9號鋪B鋪順豐站順豐智能櫃^', 'H852P073P', '3', '1'),
(1085, '香港香港島東區北角七姊妹道193號地下B鋪(水漾衣坊)順豐智能櫃', 'H852PA75P', '3', '1'),
(1086, '香港香港島東區北角天后廟道70 號威景台6樓停車場順豐智能櫃(只供住戶使用)', 'H852P083P', '3', '1'),
(1087, '香港香港島東區北角樹仁大學研究院綜合大樓LG1樓梯位置順豐智能櫃(只供職員學生使用)', 'H852P086P', '3', '1'),
(1088, '香港香港島東區北角英皇道255號國都廣場2樓202-203號鋪(順豐站)順豐智能櫃', 'H852P088P', '3', '1'),
(1089, '香港香港島東區鰂魚涌英皇道1065號東達中心停車場地下順豐智能櫃+', 'H852PA40P', '3', '1'),
(1090, '香港香港島東區鰂魚涌英皇道993號得利樓地下23號鋪(LaundrYup洗衣店)順豐智能櫃', 'H852PA30P', '3', '1'),
(1091, '香港香港島東區鰂魚涌康山道1-2號康怡廣場1樓順豐智能櫃', 'H852PA02P', '3', '1'),
(1092, '香港香港島東區鰂魚涌康怡廣場1樓二號順豐智能櫃(Aeon入口旁近升降機)', 'H852PA57P', '3', '1'),
(1093, '香港香港島東區鰂魚涌康柏徑10號康景花園B座地下順豐智能櫃(只供住戶使用)+', 'H852PA20P', '3', '1'),
(1094, '香港香港島東區鰂魚涌惠利大厦地下R1號鋪(洗衣寶)順豐智能櫃', 'H852PA60P', '3', '1'),
(1095, '香港香港島東區鰂魚涌逸樺園2樓順豐智能櫃(只供住戶使用)', 'H852PA48P', '3', '1'),
(1096, '香港香港島東區鰂魚涌益昌大厦地下A13號鋪(洗衣寶)順豐智能櫃', 'H852PA65P', '3', '1'),
(1097, '香港香港島東區鰂魚涌基利坊21號南豐新村第七座平臺順豐智能櫃', 'H852PA87P', '3', '1'),
(1098, '香港香港島東區西灣河太安街25號鯉景灣D段G07鋪(陽光洗衣店)順豐智能櫃', 'H852PA01P', '3', '1'),
(1099, '香港香港島東區西灣河海晏街9-13號華升大厦地下C2鋪(自洗王國)順豐智能櫃+', 'H852PA16P', '3', '1'),
(1100, '香港香港島東區西灣河太康街38號嘉亨灣6樓平臺順豐智能櫃(只供住戶使用)', 'H852PA39P', '3', '1'),
(1101, '香港香港島東區西灣河太康街55號鯉景灣18B鋪順豐智能櫃', 'H852PA12P', '3', '1'),
(1102, '香港香港島東區杏花村杏花新城212號鋪順豐智能櫃+', 'H852PB41P', '3', '1'),
(1103, '香港香港島東區杏花村杏花新城212號鋪二號順豐智能櫃', 'H852PB53P', '3', '1'),
(1104, '香港香港島東區筲箕灣西灣河街23號富欣閣地下3號鋪(LaundrYup洗衣店)順豐智能櫃+', 'H852PA23P', '3', '1'),
(1105, '香港香港島東區筲箕灣愛信道33號東濤苑曉濤閣地下順豐智能櫃+', 'H852PA09P', '3', '1'),
(1106, '香港香港島東區筲箕灣成安街33號柏匯5樓會所順豐智能櫃(只供住戶使用)', 'H852PA25P', '3', '1'),
(1107, '香港香港島東區筲箕灣愛東商場1樓順豐智能櫃(百佳超市正門對面)', 'H852PA52P', '3', '1'),
(1108, '香港香港島東區筲箕灣筲箕灣道261號地下F1B號鋪(洗衣寶)順豐智能櫃+', 'H852PA45P', '3', '1'),
(1109, '香港香港島東區筲箕灣東大街2號麗東海景豪園地下11號鋪(洗衣寶)順豐智能櫃', 'H852PA17P', '3', '1'),
(1110, '香港香港島東區筲箕灣耀興路12號耀東商場2樓順豐智能櫃(近商場電梯口)', 'H852PA24P', '3', '1'),
(1111, '香港香港島東區筲箕灣耀興道12號耀東商場1樓順豐智能櫃(大家樂旁)', 'H852PA68P', '3', '1'),
(1112, '香港香港島東區筲箕灣耀興道12號耀東商場1樓二號順豐智能櫃(大家樂旁)', 'H852PA69P', '3', '1'),
(1113, '香港香港島東區筲箕灣耀興路興東村興東商場2樓順豐智能櫃(近樹人教育,樓梯旁邊)', 'H852PA76P', '3', '1'),
(1114, '香港香港島東區筲箕灣耀興路興東商場2樓二號順豐智能櫃(基督教宣導會愛主堂旁邊)', 'H852PA77P', '3', '1'),
(1115, '香港香港島東區筲箕灣愛東村愛東商場2樓順豐智能櫃', 'H852PA84P', '3', '1'),
(1116, '香港香港島東區柴灣峰華村秀峰樓地下長走廊順豐智能櫃', 'H852PB79P', '3', '1'),
(1117, '香港香港島東區柴灣翠灣村翠福樓地下順豐智能櫃', 'H852PB81P', '3', '1'),
(1118, '香港香港島東區柴灣大潭道200號山翠苑翠瑜閣地下順豐智能櫃(地下有蓋休憩空地)(只供住戶使用)+', 'H852PB43P', '3', '1'),
(1119, '香港香港島東區柴灣柴灣道111號東港城廣場地下81號鋪順豐智能櫃', 'H852PB02P', '3', '1'),
(1120, '香港香港島東區柴灣柴灣道238號青年廣場3樓305號鋪順豐智能櫃', 'H852PB36P', '3', '1'),
(1121, '香港香港島東區柴灣香島會所順豐智能櫃(只供住戶使用)', 'H852PB58P', '3', '1'),
(1122, '香港香港島東區柴灣新翠商場4樓順豐智能櫃', 'H852PB07P', '3', '1'),
(1123, '香港香港島東區柴灣新翠商場L1升降機大堂順豐智能櫃', 'H852PB31P', '3', '1'),
(1124, '香港香港島東區柴灣興華(二)村安興樓平臺順豐智能櫃(719號鋪對出)', 'H852PB27P', '3', '1'),
(1125, '香港香港島東區柴灣環翠道11號興華廣場1樓順豐智能櫃(通往環翠村天橋旁)+', 'H852PB01P', '3', '1'),
(1126, '香港香港島東區柴灣環翠商場2樓順豐智能櫃(往環翠村天橋商場門口)', 'H852PB56P', '3', '1'),
(1127, '香港香港島東區柴灣興華廣場2樓順豐智能櫃', 'H852PB70P', '3', '1'),
(1128, '香港香港島東區柴灣華厦街2號環翠村環翠商場1樓順豐智能櫃', 'H852PB82P', '3', '1'),
(1129, '香港香港島東區小西灣小西灣道38號富怡花園4座地下順豐智能櫃(只供住戶使用)', 'H852PB13P', '3', '1'),
(1130, '香港香港島東區小西灣小西灣道38號富怡花園5座地下順豐智能櫃 (只供住戶使用)', 'H852PB46P', '3', '1'),
(1131, '香港香港島東區小西灣富欣花園商場15號鋪(全日洗洗衣店)順豐智能櫃', 'H852PB54P', '3', '1'),
(1132, '香港香港島東區小西灣富景花園商場地下順豐智能櫃', 'H852PB71P', '3', '1'),
(1133, '香港香港島東區小西灣富景花園9座地下順豐智能櫃(只供住戶使用)', 'H852PB72P', '3', '1'),
(1134, '香港香港島東區小西灣廣場1樓順豐智能櫃', 'H852PB78P', '3', '1'),
(1135, '香港香港島東區小西灣道28號藍灣廣場G01鋪(順豐站)順豐智能櫃', 'H852PB89P', '3', '1'),
(1136, '', '', NULL, '1'),
(1137, '香港香港島南區香港仔中心二期美輝閣地下二號順豐智能櫃(大堂對出行人通道)', 'H852TB38P', '3', '1'),
(1138, '香港香港島南區香港仔中心二期美輝閣地下三號順豐智能櫃(陽光洗衣鋪對出)', 'H852TB39P', '3', '1'),
(1139, '香港香港島南區香港仔石排灣商場LG1樓順豐智能櫃(中銀櫃員機旁)', 'H852TB11P', '3', '1'),
(1140, '香港香港島南區香港仔華貴道3號華貴坊地下順豐智能櫃(近顧客服務台)', 'H852TB21P', '3', '1'),
(1141, '香港香港島南區香港仔舊大街120號兆群大厦UG層24號鋪(自洗王國)順豐智能櫃', 'H852TB25P', '3', '1'),
(1142, '香港香港島南區香港仔田灣街15號田灣商場地下停車場順豐智能櫃(田灣村長者住屋對面)', 'H852TB32P', '3', '1'),
(1143, '香港香港島南區香港仔田灣街15號田灣商場地下停車場二號順豐智能櫃(田灣村長者住屋對面)', 'H852TB33P', '3', '1'),
(1144, '香港香港島南區赤柱白筆山道18號紅山半島第4座平臺順豐智能櫃(只供住戶使用)', 'H852PB33P', '3', '1'),
(1145, '香港香港島南區赤柱馬坑村良馬樓地下順豐智能櫃+', 'H852PB29P', '3', '1');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_msg`
--

CREATE TABLE `tp_msg` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `addDate` datetime DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `isRead` int DEFAULT '0',
  `fromUid` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_msg`
--

INSERT INTO `tp_msg` (`id`, `title`, `content`, `addDate`, `uid`, `isRead`, `fromUid`) VALUES
(1, 'title', '在做百度推廣的朋友可能有人聽過百度推廣優惠券，這是百度促銷返利的壹種方式。在當月消費達標後，百度在下壹個月會返相應檔次的優惠額度，在帳護消費時，按壹定比例抵扣。下面介紹下優惠券怎麼看', '2020-10-14 03:59:25', 1, 0, 1),
(2, 'title', '在做百度推廣的朋友可能有人聽過百度推廣優惠券，這是百度促銷返利的壹種方式。在當月消費達標後，百度在下壹個月會返相應檔次的優惠額度，在帳護消費時，按壹定比例抵扣。下面介紹下優惠券怎麼看', '2020-10-10 08:59:25', 1, 0, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_order`
--

CREATE TABLE `tp_order` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `payStatus` int DEFAULT '0',
  `out_trade_no` varchar(100) DEFAULT '',
  `yhId` int DEFAULT NULL,
  `money` decimal(11,2) DEFAULT NULL COMMENT '实付款',
  `deduMoney` float(11,2) DEFAULT NULL COMMENT '抵扣价',
  `allMoney` float(11,2) DEFAULT NULL COMMENT '总价',
  `payType` varchar(10) DEFAULT '1' COMMENT '1在线付，2门店付款',
  `score` int DEFAULT '0',
  `isdel` int DEFAULT '1',
  `address` varchar(255) DEFAULT '',
  `quantity` int DEFAULT NULL,
  `orderUserData` text,
  `orderServerDay` varchar(30) DEFAULT NULL,
  `orderServerHour` varchar(30) DEFAULT NULL,
  `addDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dName` varchar(255) DEFAULT NULL,
  `dPhone` varchar(255) DEFAULT NULL,
  `paypalLink` varchar(255) DEFAULT NULL,
  `goodsId` varchar(255) DEFAULT NULL,
  `orderStatus` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_order`
--

INSERT INTO `tp_order` (`id`, `uid`, `payStatus`, `out_trade_no`, `yhId`, `money`, `deduMoney`, `allMoney`, `payType`, `score`, `isdel`, `address`, `quantity`, `orderUserData`, `orderServerDay`, `orderServerHour`, `addDate`, `dName`, `dPhone`, `paypalLink`, `goodsId`, `orderStatus`) VALUES
(280, 128, 1, '0YC557109A821874A', 0, '1000.00', 1.00, 999.00, 'paypal', 1000, 0, '', 1, NULL, NULL, NULL, '2022-08-31 10:21:07', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=0YC557109A821874A', '117', 1),
(279, 128, 1, '3JW34147YW245553N', 0, '1000.00', 0.00, 1000.00, 'paypal', 1000, 0, '', 1, NULL, NULL, NULL, '2022-08-31 10:20:39', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=3JW34147YW245553N', '113', 0),
(278, 128, 1, '9NC91881160623044', 0, '1000.00', 0.00, 1000.00, 'paypal', 1000, 0, '', 1, NULL, NULL, NULL, '2022-08-31 10:08:09', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=9NC91881160623044', '114', 2),
(281, 128, 0, '60M4439382913390S', 0, '1000.00', 1.00, 999.00, 'paypal', 1000, 0, '', 1, NULL, NULL, NULL, '2022-09-01 08:24:39', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=60M4439382913390S', NULL, NULL),
(282, 128, 0, '5N638875NR164521Y', 0, '500.00', 0.00, 500.00, 'paypal', 500, 0, '', 1, NULL, NULL, NULL, '2022-09-02 03:40:44', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=5N638875NR164521Y', NULL, NULL),
(283, 128, 1, '2Y9093981W847800D', 0, '16000.00', 0.00, 16000.00, 'paypal', 16000, 0, '', 2, NULL, NULL, NULL, '2022-10-03 10:05:22', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=2Y9093981W847800D', NULL, NULL),
(284, 128, 1, '78Y163207B291882X', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:06:46', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=78Y163207B291882X', NULL, NULL),
(285, 128, 1, '6TN71998N8558411G', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:23:32', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=6TN71998N8558411G', NULL, NULL),
(286, 128, 1, '41K544698B806342P', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:26:57', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=41K544698B806342P', NULL, NULL),
(287, 128, 1, '9AL75500MS584384F', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:28:23', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=9AL75500MS584384F', NULL, NULL),
(288, 128, 1, '9G145655NB475091S', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:30:13', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=9G145655NB475091S', NULL, NULL),
(289, 128, 1, '0R071060YE1207336', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:31:21', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=0R071060YE1207336', NULL, NULL),
(290, 128, 1, '49560252W91398237', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:32:09', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=49560252W91398237', NULL, NULL),
(291, 128, 1, '01T09466EE382331N', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:37:58', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=01T09466EE382331N', NULL, NULL),
(292, 128, 1, '7BA49114GB872561W', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-03 10:39:55', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=7BA49114GB872561W', NULL, NULL),
(293, 128, 1, '23W12720W96049926', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-05 02:37:26', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=23W12720W96049926', NULL, NULL),
(294, 128, 0, '31P22882SB173022M', 0, '8000.00', 1.00, 7999.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-11 08:47:14', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=31P22882SB173022M', NULL, NULL),
(295, 128, 0, '7TA51239M1633342H', 0, '24000.00', 0.00, 24000.00, 'paypal', 24000, 0, '', 3, NULL, NULL, NULL, '2022-10-12 19:25:01', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=7TA51239M1633342H', NULL, NULL),
(296, 128, 0, '0ME68374RV478734U', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-10-26 10:47:55', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=0ME68374RV478734U', NULL, NULL),
(297, 128, 0, '03K12110NR190453B', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-12-07 07:36:11', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=03K12110NR190453B', NULL, NULL),
(298, 128, 1, '7G976581328360050', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2022-12-07 07:42:48', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=7G976581328360050', NULL, NULL),
(299, 128, 0, '4AN66699HR9188305', 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2023-01-12 18:04:14', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=4AN66699HR9188305', NULL, NULL),
(300, 128, 0, NULL, 0, '16000.00', 0.00, 16000.00, 'paypal', 16000, 0, '', 4, NULL, NULL, NULL, '2023-03-02 03:35:59', NULL, NULL, NULL, NULL, NULL),
(301, 128, 0, NULL, 0, '8000.00', 0.00, 8000.00, 'paypal', 8000, 0, '', 1, NULL, NULL, NULL, '2023-03-02 03:38:03', NULL, NULL, NULL, NULL, NULL),
(302, 128, 0, NULL, 0, '16000.00', 0.00, 16000.00, 'paypal', 16000, 0, '', 2, NULL, NULL, NULL, '2023-03-02 03:38:49', NULL, NULL, NULL, NULL, NULL),
(303, 128, 0, '3GN849871A087761K', 0, '1588.00', 0.00, 1588.00, 'paypal', 1588, 0, '', 1, NULL, NULL, NULL, '2023-07-06 05:44:36', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=3GN849871A087761K', NULL, NULL),
(304, 226, 0, '4XE78987JR902314E', 0, '3776.00', 0.00, 3776.00, 'paypal', 3776, 0, '', 2, NULL, NULL, NULL, '2023-09-25 12:06:58', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=4XE78987JR902314E', NULL, NULL),
(305, 227, 0, '8DD774973G0031440', 0, '3776.00', 0.00, 3776.00, 'paypal', 3776, 0, '', 2, NULL, NULL, NULL, '2023-09-25 18:40:06', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=8DD774973G0031440', NULL, NULL),
(306, 228, 0, '6A66066337704205P', 0, '41052.00', 0.00, 41052.00, 'paypal', 41052, 0, '', 4, NULL, NULL, NULL, '2023-09-26 10:17:26', NULL, NULL, 'https://www.sandbox.paypal.com/checkoutnow?token=6A66066337704205P', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_orderitem`
--

CREATE TABLE `tp_orderitem` (
  `id` int NOT NULL,
  `orderId` int DEFAULT NULL,
  `goodsId` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

--
-- 傾印資料表的資料 `tp_orderitem`
--

INSERT INTO `tp_orderitem` (`id`, `orderId`, `goodsId`, `number`, `price`, `uid`, `bookTime`) VALUES
(257, 280, 117, 1, 1000.00, 128, '2022-08-15 09:05:28'),
(258, NULL, 105, 1, 1000.00, 128, '2022-08-30 10:41:41'),
(259, NULL, 105, 2, 1000.00, 128, '2022-08-31 04:55:21'),
(260, NULL, 105, 1, 1000.00, 128, '2022-08-31 10:08:20'),
(261, NULL, 104, 1, 1000.00, 128, '2022-08-31 10:21:16'),
(262, NULL, 105, 1, 1000.00, 128, '2022-08-31 10:21:30'),
(263, NULL, 116, 1, 8000.00, 128, '2022-10-03 10:06:52'),
(264, NULL, 116, 1, 8000.00, 128, '2022-10-03 10:23:52'),
(265, 279, 113, 1, 8000.00, 128, '2022-10-03 10:27:10'),
(266, NULL, 113, 1, 8000.00, 128, '2022-10-03 10:28:32'),
(267, NULL, 113, 1, 8000.00, 128, '2022-10-03 10:30:21'),
(268, NULL, 112, 1, 8000.00, 128, '2022-10-03 10:31:29'),
(269, NULL, 113, 1, 8000.00, 128, '2022-10-03 10:32:17'),
(270, NULL, 116, 1, 8000.00, 128, '2022-10-03 10:38:06'),
(271, NULL, 112, 1, 8000.00, 128, '2022-10-03 10:40:05'),
(272, 278, 114, 1, 8000.00, 128, '2022-10-05 02:37:45'),
(273, NULL, 113, 1, 8000.00, 128, '2022-12-07 07:42:57');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_package_record`
--

CREATE TABLE `tp_package_record` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `userName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uid` int NOT NULL,
  `goodsId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `twName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cnName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `numberOfTime` int DEFAULT NULL,
  `lastUpdatedTime` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 傾印資料表的資料 `tp_package_record`
--

INSERT INTO `tp_package_record` (`id`, `userName`, `userPhone`, `uid`, `goodsId`, `name`, `twName`, `cnName`, `numberOfTime`, `lastUpdatedTime`) VALUES
(00000005, '+111', '12345678', 128, '208', 'HIFU V Shape Treatment', 'HIFU V面療程', 'HIFU V面療程', 4, '2023-07-26 09:57:31.000000'),
(00000006, '+111', '12345678', 128, '209', 'Body Massage Treatment Package', '肩頸經絡放鬆按摩療程', '肩颈经络放松按摩疗程', 6, '2023-07-26 09:57:31.000000');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_pagebanner`
--

CREATE TABLE `tp_pagebanner` (
  `id` int NOT NULL,
  `title` varchar(50) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `isdel` int NOT NULL DEFAULT '1',
  `content` varchar(255) NOT NULL,
  `subtitle` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_pagebanner`
--

INSERT INTO `tp_pagebanner` (`id`, `title`, `image`, `isdel`, `content`, `subtitle`) VALUES
(1, '123', './Public/Uploads/goods/2023-02-14/63eb4c26cda7e.png', 0, '', ''),
(2, 'fff', './Public/Uploads/goods/2023-02-14/63eb4c5c652ba.jpeg', 1, '', 'fff');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_pcset`
--

CREATE TABLE `tp_pcset` (
  `id` int NOT NULL,
  `navTitle` text,
  `rand` varchar(10) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `workTime` varchar(30) DEFAULT NULL,
  `workDate` varchar(30) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(100) NOT NULL,
  `address3` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `companyName1` varchar(100) NOT NULL,
  `companyName2` varchar(100) NOT NULL,
  `companyName3` varchar(100) NOT NULL,
  `aboutHtml` text NOT NULL,
  `facebook` text NOT NULL,
  `instagram` text NOT NULL,
  `googleMapHtml` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_pcset`
--

INSERT INTO `tp_pcset` (`id`, `navTitle`, `rand`, `whatsapp`, `workTime`, `workDate`, `address1`, `address2`, `address3`, `phone`, `companyName1`, `companyName2`, `companyName3`, `aboutHtml`, `facebook`, `instagram`, `googleMapHtml`) VALUES
(1, NULL, '8075', '', '10:00-19-00', '', '馬鞍山新港城中心5期2樓2731號鋪(實惠隔離）', '马鞍山新港城中心5期2楼2731号铺(实惠隔离）', 'Shop No. 2731, 2nd Floor, Phase 5, MOSTown, Ma On Shan ', '34873495', '', 'ES Lightling', 'JG INTERNATIONAL CONSULTING LIMITED', 'PHAgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyO2NvbG9yOiMzOTM5Mzk7Zm9udC1mYW1pbHk6TXVsaSwgc2Fucy1zZXJpZjtmb250LXNpemU6MTRweDsiPg0KCTxpbWcgc3JjPSJodHRwOi8vZXNoa2hrLmNvbS9QdWJsaWMva2luZGVkaXRvci9waHAvLi4vYXR0YWNoZWQvaW1hZ2UvMjAyMjA5MDgvMjAyMjA5MDgxNDM1MDdfNDM0ODIuanBnIiBhbHQ9IiIgLz4gDQo8L3A+DQo8cCBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXI7Y29sb3I6IzM5MzkzOTtmb250LWZhbWlseTpNdWxpLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyI+DQoJPGJyIC8+DQo8L3A+DQo8aDEgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyOyI+DQoJPGJyIC8+DQo8L2gxPg0KPHA+DQoJPGJyIC8+DQo8L3A+DQo8cD4NCgk8YnIgLz4NCjwvcD4NCjxkaXYgc3R5bGU9InRleHQtYWxpZ246anVzdGlmeTsiPg0KPC9kaXY+DQo8ZGl2Pg0KCTxiciAvPg0KPC9kaXY+DQo8ZGl2IHN0eWxlPSJ0ZXh0LWFsaWduOmNlbnRlcjsiPg0KCTxpbWcgc3JjPSJodHRwOi8vZXNoa2hrLmNvbS9QdWJsaWMva2luZGVkaXRvci9waHAvLi4vYXR0YWNoZWQvaW1hZ2UvMjAyMjA5MDgvMjAyMjA5MDgxNDM2MDlfMzgzNjkuanBnIiBhbHQ9IiIgLz4gDQo8L2Rpdj4NCjxwPg0KCTxiciAvPg0KPC9wPg0KPGRpdiBzdHlsZT0idGV4dC1hbGlnbjpjZW50ZXI7Y29sb3I6IzM5MzkzOTtmb250LWZhbWlseTpNdWxpLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyI+DQoJPHNwYW4gc3R5bGU9ImNvbG9yOiNFNTY2MDA7Ij48L3NwYW4+IA0KPC9kaXY+DQo8cCBjbGFzcz0icDEiIHN0eWxlPSJjb2xvcjojMzkzOTM5O2ZvbnQtZmFtaWx5Ok11bGksIHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHg7YmFja2dyb3VuZC1jb2xvcjojRkZGRkZGOyI+DQoJPHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OkFyaWFsOyI+PC9zcGFuPiANCjwvcD4=', '', '', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3688.137611312587!2d114.22894081495681!3d22.42384578525953!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x340400649b8b9645%3A0xcd4989198c7dda75!2z5paw5riv5Z-O5Lit5b-D!5e0!3m2!1szh-TW!2shk!4v167636');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_promote`
--

CREATE TABLE `tp_promote` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_icelandic_ci DEFAULT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_icelandic_ci DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `route_url` text,
  `isdel` int DEFAULT '1',
  `cateId` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `tp_promote`
--

INSERT INTO `tp_promote` (`id`, `title`, `subtitle`, `image`, `route_url`, `isdel`, `cateId`) VALUES
(29, '髮素套裝', '', './Public/Uploads/goods/2022-07-11/62cbd23572651.jpg', '', 0, 58),
(33, 'GOSUN SPORT', '', './Public/Uploads/goods/2022-07-11/62cbd268b32ff.png', '', 0, 46),
(34, '1', '1', './Public/Uploads/goods/2022-08-30/630dd12012f23.png', '', 0, 63),
(35, 'eshkhk', '', './Public/Uploads/goods/2022-09-08/631988a43df1b.jpg', '', 0, 63),
(36, 'HIFU', '測試', './Public/Uploads/goods/2023-08-14/64d9de2133586.jpg', '208', 1, 88),
(37, 'Neck Massage', '', './Public/Uploads/goods/2023-08-22/64e42a4d3c0f4.jpg', '209', 1, 88),
(38, 'deep clean', '', './Public/Uploads/goods/2023-08-22/64e42a584ba3b.jpg', '196', 1, 88);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_schedule`
--

CREATE TABLE `tp_schedule` (
  `id` int NOT NULL,
  `firstName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `booking_time` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isdel` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_schedule`
--

INSERT INTO `tp_schedule` (`id`, `firstName`, `phone`, `email`, `desc`, `booking_time`, `isdel`) VALUES
(3, 'test', '12345677', 'mmigprogrammer@gmail.com', 'testing', '2023-07-22T20:59', 1),
(4, 'ss', 'ss', 'sss.sss.com', '', '2023-07-07T21:00', 1),
(5, 'client', '12345677', 'mmigprogrammer@gmail.com', 'testing', '2023-07-14T15:05', 1),
(6, '技术testing', '1342207849', '746027209@qq.com', 'just for testing', '2023-07-30T11:38', 1),
(7, '技术testing', '1342207849', '746027209@qq.com', 'just for testing', '2023-07-30T11:38', 1),
(2, 'Tom', '12345677', 'mmigprogrammer@gmail.com', '123', '2023-07-20T16:22', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_score`
--

CREATE TABLE `tp_score` (
  `id` int NOT NULL,
  `uid` int DEFAULT NULL,
  `score` int DEFAULT NULL,
  `addDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED;

--
-- 傾印資料表的資料 `tp_score`
--

INSERT INTO `tp_score` (`id`, `uid`, `score`, `addDate`) VALUES
(1, 129, 500, '2021-12-01 00:00:00'),
(2, 99, 1000, '2021-08-11 00:00:00');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_shop`
--

CREATE TABLE `tp_shop` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `desc1` text,
  `desc2` text,
  `phone` varchar(255) DEFAULT '',
  `whatsApp` varchar(50) DEFAULT '',
  `facebook` varchar(50) DEFAULT '',
  `instagram` varchar(50) NOT NULL,
  `pinterest` varchar(50) NOT NULL,
  `wechat` varchar(50) NOT NULL,
  `youtube` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT '',
  `workTime` varchar(50) NOT NULL,
  `addDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `rand` varchar(10) DEFAULT NULL,
  `isdel` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_shop`
--

INSERT INTO `tp_shop` (`id`, `image`, `name`, `desc1`, `desc2`, `phone`, `whatsApp`, `facebook`, `instagram`, `pinterest`, `wechat`, `youtube`, `address`, `workTime`, `addDate`, `rand`, `isdel`) VALUES
(1, 'https://www.artsncraftstudio.com/Public/Uploads/shop/2022-05-23/628b3037e8056.png', 'ARTS & CRAFTS STUDIO', 'QVJUUyAmIENSQUZUUyBTVFVESU8gZmVhdHVyZXMgYXJ0IGFuZCBkZXNpZ24gY3JlYXRpdmUgY29tcGxleCB3aGljaCBwcmVzZW50ZWQgYnkgd3JpdGVycyBhbmQgZGVzaWduZXJzLiBINDAxIGluY2x1ZGVkIGJvdGggc2hvcCBhbmQgZ2FsbGVyeSBzcGFjZS4NCg0KVGhlIG5ldyBjcmVhdGl2ZSBzdG9yZSBzcGVjaWZpY2FsbHkgcHJvbW90ZXMgcHJvZHVjdHMgY3JlYXRlZCBhbmQgZGVzaWduZWQgaW4gSmFwYW4uIFRoZSB3aWRlIHZhcmlldHkgb2YgcHJvZHVjdHMgaW4gc3RvcmVzIGFsc28gaGlnaGxpZ2h0cyB0aGUgZXh0cmFvcmRpbmFyeSBjcmVhdGl2aXR5IG9mIEphcGFuZXNlIGRlc2lnbmVycyBpbiBhcmVhcyByYW5naW5nIGZyb20gbGVhdGhlciBnb29kcywgbWV0YWwgYWNjZXNzb3JpZXMsIGFuZCB3b29kZW4gaG91c2Vob2xkIGRlY29yYXRpb25zIHRvIHByZW1pdW0gZ29vZHMgYW5kIHN0YXRpb25lcnkuIEluIHRoZSBnYWxsZXJ5IHNwYWNlLCB0aGVyZSB3aWxsIGJlIHJlZ3VsYXIgZXhoaWJpdGlvbnMgb24gaGVsZC4NCg0KIA0KDQpTVUtVTU8gTEVBVEhFUiBpcyBvbmUgb2Ygc3BlY2lhbCBwcm9kdWN0cyB0byBpbmZvcm0sIHN1Y2ggYXMgTmF0dXJhbCBJbmRpZ28gYmx1ZSBsZWF0aGVyIGlzIHRoZSBtb3N0IHBvcHVsYXIgaXRlbXMgdG9kYXkncyBmYXNoaW9uIGFuZCBkZXNpZ24gaW5kdXN0cmllcywgdGhlaXIgc2tpbGxmdWwgdW5pcXVlIG1hdGVyaWFsIGlzIHRoZSB3b3JsZCB0b3AgcXVhbGl0eS4NCg0KIA0KDQpUU1VCQU1FU0FOSk8gTWV0YWwgUHJvZHVjdHMgaXMgYSBzdXBlciBicmFuZCBpbiB0aGUgd29ybGQuIFRoZXkgYXJlIGFsc28gdmVyeSBwb3B1bGFyIGFtb25nIEhvbmcgS29uZyBwZW9wbGUsIGFuZCB0aGUgcXVhbGl0eSBvZiB0aGUgY3JhZnRzbWVuJ3Mgd29yayBpcyB3b3JsZC1jbGFzcy4NCg0KIA0KDQpGdWt1aSBQYXJhc29sIGlzIGFuIHVtYnJlbGxhIGJyYW5kIHRoYXQgdGFrZXMgaW50byBhY2NvdW50IHRoZSBlYXN5IG1haW50ZW5hbmNlIGFuZCByb2J1c3RuZXNzIG9mIG1vZGVybiB0ZXh0aWxlcyBhbmQgdGhlIGJlYXV0aWZ1bCwgdWx0cmEtaGlnaCBsZXZlbCBvZiB0cmFkaXRpb25hbCB0ZXh0aWxlcy4NCg0KIA0KDQpXZSBmb2N1cyBvbiByZWNvbW1lbmRpbmcgSmFwYW5lc2UgY3JhZnRzIHRvIGV2ZXJ5b25lLCBhbmQgcmVndWxhcmx5IGludHJvZHVjZSBhbmQgZGlzcGxheSBwcm9kdWN0cyBpbiBTT0dPIEhLIGRlcGFydG1lbnQgc3RvcmVzLg0KDQogDQoNCk91ciBnYWxsZXJ5IHNwYWNlIGFsc28gaW50cm9kdWNlcyBhcnR3b3JrcyBhbmQgaG9sZHMgcmVndWxhciB3b3Jrc2hvcCBleHBlcmllbmNlIGFjdGl2aXRpZXMuDQoNCkphcGFuZXNlIGFydGlzdHMsIGRlc2lnbmVycywgZGFuY2VycyBhbmQgY2FsbGlncmFwaGVycyBhcmUgaW52aXRlZCB0byBob2xkIHJlZ3VsYXIgZXhwZXJpZW5jZSBldmVudHMuDQoNCkxldCBldmVyeW9uZSBoYXZlIGEgY2xlYXIgdW5kZXJzdGFuZGluZyBvZiBKYXBhbmVzZSB0cmFkaXRpb25hbCBjdWx0dXJlLg==', '', '91559374​', '91559374​', 'https://www.facebook.com/Artscrafts401.hk', 'https://www.instagram.com/Artscrafts401.hk', '', '', '', 'H401, Block B, PMQ, 35 Aberdeen Street, Central, Hong Kong', '11:30am - 18:30pm', '2022-05-23 19:00:03', '3881', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_stylist`
--

CREATE TABLE `tp_stylist` (
  `branchId` int NOT NULL,
  `staffId` int NOT NULL,
  `staffCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `staffNameEn` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `staffNameCn` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `staffStatus` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_stylist`
--

INSERT INTO `tp_stylist` (`branchId`, `staffId`, `staffCode`, `staffNameEn`, `staffNameCn`, `image`, `staffStatus`) VALUES
(30, 38, '302', 'Raymond', '劉旻杰', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e430055ff1f.jpg', 1),
(30, 37, '301', 'Daphne ', '陳瑞琪', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48ba959c46.jpg', 1),
(29, 36, '204', 'Vonny', '葉殷霖', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48b9c6a1dc.jpg', 1),
(29, 35, '203', 'Miki', '馮美琪', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e42eef9e79a.jpg', 1),
(29, 34, '202', 'Suvee', '郭嫣珩', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48b8e2bd12.jpg', 1),
(29, 33, '201', 'Becca', '羅家寧', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48b83158a0.jpg', 1),
(28, 32, '104', 'Yoyo', '古珈如', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48b14bd18f.jpg', 1),
(28, 31, '103', 'Zoe', '李泓碧', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48b0ae2fac.jpg', 1),
(28, 30, '102', 'Dora ', 'Dora', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e467e729f33.png', 1),
(28, 29, '101', 'Miko ', 'Miko', 'https://beautyappdemo.com/./Public/Uploads/staff/2023-08-22/64e48af0d1d7c.jpg', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_system`
--

CREATE TABLE `tp_system` (
  `id` int NOT NULL,
  `scoreOneMoney` int DEFAULT '0',
  `getScoreNum` int DEFAULT '0',
  `diviScorePer` varchar(10) DEFAULT '0',
  `rand` varchar(10) DEFAULT NULL,
  `homeBanner` text,
  `aboutImage` varchar(255) DEFAULT NULL,
  `latestoffersPagePictures` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_system`
--

INSERT INTO `tp_system` (`id`, `scoreOneMoney`, `getScoreNum`, `diviScorePer`, `rand`, `homeBanner`, `aboutImage`, `latestoffersPagePictures`) VALUES
(1, 1000, 100, '10', '2528', './Public/Uploads/appBanner/2023-08-16/64dc3d686ae27.jpg', 'http://hkinsmil.a.timhostasia.com/insmile/Public/Uploads/banner/2021-02-04/601b667a5d600.jpg', 'http://springmed.com.hk/insmile/Public/Uploads/banner/2021-02-04/601ac9009ed79.png');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_user`
--

CREATE TABLE `tp_user` (
  `uid` int NOT NULL,
  `memberId` int DEFAULT NULL,
  `branchId` int DEFAULT NULL,
  `lastStaffId` int DEFAULT NULL,
  `lastStaffNameEn` varchar(50) DEFAULT NULL,
  `branchName` varchar(50) DEFAULT NULL,
  `cardNum` varchar(50) DEFAULT NULL,
  `cardOwner` varchar(50) DEFAULT NULL,
  `validUntil` varchar(100) DEFAULT NULL COMMENT 'yyyyMMdd',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) DEFAULT '',
  `name` varchar(50) DEFAULT '' COMMENT '名',
  `tel` text,
  `sex` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `dName` varchar(255) NOT NULL,
  `dPhone` varchar(255) NOT NULL,
  `lang` int DEFAULT '1',
  `headImg` varchar(255) DEFAULT '',
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `date` text NOT NULL,
  `vipLevel` int DEFAULT '0',
  `score` int DEFAULT '0',
  `stripeUid` varchar(100) DEFAULT NULL,
  `platform` varchar(11) DEFAULT NULL,
  `platformLogin` varchar(100) DEFAULT NULL,
  `rand` varchar(20) DEFAULT NULL,
  `udid` varchar(500) DEFAULT '',
  `isLogin` int DEFAULT '0',
  `isdel` int(1) UNSIGNED ZEROFILL DEFAULT '0',
  `isVerified` int NOT NULL DEFAULT '0',
  `shareNum` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_user`
--

INSERT INTO `tp_user` (`uid`, `memberId`, `branchId`, `lastStaffId`, `lastStaffNameEn`, `branchName`, `cardNum`, `cardOwner`, `validUntil`, `email`, `password`, `name`, `tel`, `sex`, `dName`, `dPhone`, `lang`, `headImg`, `regDate`, `date`, `vipLevel`, `score`, `stripeUid`, `platform`, `platformLogin`, `rand`, `udid`, `isLogin`, `isdel`, `isVerified`, `shareNum`) VALUES
(128, NULL, NULL, NULL, NULL, '', '', NULL, NULL, 'test@qq.com', '123456', '+111', '1', '1', '', '12345678', 1, '', '2022-05-25 09:01:52', '1111-11-11', 0, 100074, 'cus_LFmCefG1DGmcsE', NULL, '0', '4671', '', 0, 0, 0, ''),
(193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'avc21@gmail.com', '12345678', '1', '1234567', NULL, '', '', 1, '', '2023-03-30 07:14:08', '', 0, 0, 'cus_NcUfw2jEc0UNE1', NULL, NULL, NULL, '1', 0, 0, 1, ''),
(194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Anhfrwiruh@fhdjfh.com', '123456', '123456', '12345678', NULL, '', '', 1, '', '2023-03-30 07:14:56', '', 0, 0, 'cus_NcUg8cDP4ZBdPZ', NULL, NULL, NULL, '441C35CF-A9ED-4DCA-A2FD-9FB1E78C9744', 0, 0, 1, ''),
(201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456@123.com', 'wqrewer', NULL, '75858555', NULL, '', '', 1, '', '2023-03-30 09:16:53', '', 0, NULL, 'cus_NcWep6EC3qchEu', NULL, NULL, NULL, '441C35CF-A9ED-4DCA-A2FD-9FB1E78C9744', 0, 0, 1, ''),
(202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '57554@hkjhkjh.com', '123456', NULL, '12345676', NULL, '', '', 1, '', '2023-03-30 09:19:04', '', 0, 0, 'cus_NcWgPJC8ZLybg4', NULL, NULL, NULL, '441C35CF-A9ED-4DCA-A2FD-9FB1E78C9744', 0, 0, 1, ''),
(208, 48450, 53, 117, '117', 'Test-Colour Group-Contrast', 'TEST0001', 'TEST-Lam', '20240203', 'Sample@test.com', '123456', 'TEST-Lam', '63361285', '男', '', '', 1, '', '2023-04-03 04:36:23', '', 0, 600, 'cus_Ndx21COpTx8H4f', NULL, NULL, NULL, 'DD102E7A-11CE-4733-8B22-DF500A0BAB82', 0, 0, 1, ''),
(209, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'y4kpwh84r7@privaterelay.appleid.com', '12345678', 'wingtesting', NULL, NULL, '', '', 1, '', '2023-07-05 07:52:13', '', 0, 0, 'cus_OCqBOMpLdg2S83', 'apple', '000866.d23156730f3f48e49b0e4a4a9735dc01.1041', NULL, '65125725-8791-4CF1-819E-7D98F4898048', 0, 0, 1, ''),
(210, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rosanna085@hotmail.com', '110011aA', 'Raymond', NULL, NULL, '', '', 1, '', '2023-07-06 06:17:20', '', 0, 0, 'cus_ODBt7BJoeYSogP', 'apple', '000907.cc7ec86ed906424f9591a739b01266aa.0616', NULL, '972EE518-7E14-46E2-87D3-9220666E63B2', 0, 0, 1, ''),
(211, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'winglui1229@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'wingtest2', '12345678', '2', '', '', 1, '', '2023-07-07 03:13:15', '', 0, 0, 'cus_ODW8fZrMgT8nPT', 'google', '106464621604118346164', '9285', '65125725-8791-4CF1-819E-7D98F4898048', 0, 0, 1, ''),
(212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mmigprogrammer@gmail.com', '25d55ad283aa400af464c76d713c07ad', 'test', '12345678', '1', '', '', 1, '', '2023-07-07 03:22:37', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 0, 0, ''),
(213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'testing@qq.com', '12345678', 'testing', NULL, NULL, '', '', 1, '', '2023-07-07 03:24:55', '', 0, 0, 'cus_ODWKoqHxkl64O8', NULL, NULL, NULL, NULL, 0, 0, 1, ''),
(214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aaron_tsang@outlook.com', '123456', 'Aaron', '52162125', '1', '', '', 1, '', '2023-07-07 03:41:12', '', 0, 0, NULL, NULL, NULL, '6972', '', 0, 0, 0, ''),
(215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Testing@qq1.com', '12345678', 'Testing1', '12345678', '1', '', '', 1, '', '2023-07-07 06:21:44', '', 0, 0, 'cus_ODZBEI2YFkLTNr', NULL, NULL, '9220', 'B5478D8F-C1CB-4F1F-A62A-14ABAC5528B4', 0, 0, 1, ''),
(216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mmigprogrammfdsrfer@gmail.com', 'ewq43141q', 'test', '12345678', '2', '', '', 1, '', '2023-07-07 08:05:52', '', 0, 0, NULL, NULL, NULL, NULL, '', 0, 1, 0, ''),
(217, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12345678@gmail.com', '123456', 'Winny', '1234567', NULL, '', '', 1, '', '2023-07-12 10:55:35', '', 0, 0, 'cus_OFVjPickczfBD7', NULL, NULL, NULL, '7D873774-91BB-4748-9AE6-C93E6BC3CB80', 0, 0, 1, ''),
(218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '746027209@qq.com', '123456789', 'lin', NULL, NULL, '', '', 1, '', '2023-07-18 03:31:56', '', 0, 0, 'cus_OHdvMdISjspoGc', NULL, NULL, NULL, NULL, 0, 0, 1, ''),
(219, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hugoc1119@icloud.com', '11111111', 'Hc', NULL, NULL, '', '', 1, '', '2023-08-07 10:46:46', '', 0, 0, 'cus_OPFSC3nqpv8cPb', 'apple', '001746.bb2c2320b71045e685cdadd4ced62e87.1045', NULL, '2FF41FED-B54A-4FAF-8839-938AEA49A326', 0, 0, 1, ''),
(220, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'nellawong2019@gmail.com', 'wong1314', 'Nella', NULL, NULL, '', '', 1, '', '2023-08-11 15:39:32', '', 0, 0, 'cus_OQp5f7vhL6r5Dd', 'google', '109855638651768038527', NULL, 'EFC0B62A-9621-45E0-8C50-637AEFC843FE', 0, 0, 1, ''),
(221, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kelvin_211@hotmail.com', '12345678', 'Kelvin', NULL, NULL, '', '', 1, '', '2023-08-18 13:38:15', '', 0, 0, 'cus_OTPhqB6lHd3dp5', 'apple', '002038.3606493651214172b502526cc322b387.1337', NULL, '019165D2-7E36-430A-ABF2-FCD65F67FBAF', 0, 0, 1, ''),
(222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wing-18@hotmail.com', '12345678', 'wing', '12345678', NULL, '', '', 1, '', '2023-08-29 07:44:12', '', 0, 0, 'cus_OXRTPiz4okTrZd', NULL, NULL, NULL, '65125725-8791-4CF1-819E-7D98F4898048', 0, 0, 1, ''),
(223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'brunozeahor@gmail.com', '123456', 'bruno', '91525758', NULL, '', '', 1, '', '2023-08-30 02:34:22', '', 0, 0, 'cus_OXji3wLULdCcTi', NULL, NULL, '55c724fd35091919b6d7', 'A899AE52-9026-4133-9846-A6619FFD396D', 0, 0, 1, ''),
(224, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hy4x4scq52@privaterelay.appleid.com', '12345678', 'Myles', NULL, NULL, '', '', 1, '', '2023-09-11 10:58:29', '', 0, 0, 'cus_OcMYUhiIz9fLMO', 'apple', '000570.0c16407df4b94f0cbdb5e07e967cbf3f.1057', NULL, '46B9BBB5-858D-448F-8228-223CCE633889', 0, 0, 1, ''),
(225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Puiyannn0601@gmail.com', 'Iamh311n2', 'Helen', '64919735', NULL, '', '', 1, '', '2023-09-19 03:34:28', '', 0, 0, 'cus_OfFCJksP8jsLPV', NULL, NULL, NULL, 'c815fb1f4218fb02', 0, 0, 1, ''),
(226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dsfds@gmail.com', 'abcd87654321', 'sdfdsf', NULL, NULL, '', '', 1, '', '2023-09-25 12:06:44', '', 0, 0, 'cus_OhcokOUx52TmdC', NULL, NULL, NULL, NULL, 0, 0, 1, ''),
(227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hujikh@gmail.com', 'gtyhioikjmilk', 'yhiu', NULL, NULL, '', '', 1, '', '2023-09-25 18:39:25', '', 0, 0, 'cus_Ohj9Ivlb0P9Ux9', NULL, NULL, NULL, NULL, 0, 0, 1, ''),
(228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'esthrtj@gmail.com', 'Welcome#123', 'rdtjtyj', NULL, NULL, '', '', 1, '', '2023-09-26 10:16:42', '', 0, 0, 'cus_OhyGVU8yJtbnsS', NULL, NULL, NULL, NULL, 0, 0, 1, ''),
(229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bilancianfan@gmail.com', '123456', 'Bilancian Fan', '62372753', NULL, '', '', 1, '', '2023-10-12 06:57:17', '', 0, 0, 'cus_Onue2djlgoGs7Q', NULL, NULL, NULL, '8D17C34F-6C14-43B8-9129-4916586D2469', 0, 0, 1, ''),
(230, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'myles.h.0302@gmail.com', 'yu950302', 'H', NULL, NULL, '', '', 1, '', '2023-10-14 06:44:47', '', 0, 0, 'cus_OoeuGjPfgjevo0', 'google', '100541225185311407722', NULL, '46B9BBB5-858D-448F-8228-223CCE633889', 0, 0, 1, ''),
(231, 48123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5n9rjyqbvd@privaterelay.appleid.com', '611611Cheese', 'MI', NULL, NULL, '', '', 1, '', '2023-12-02 09:07:59', '', 0, 0, 'cus_P73HDwvqpS1ci9', 'apple', '000550.b288049ee2804581bbeb0857f749cdd4.0905', NULL, 'BAF383C0-8CF4-41A2-8311-7183442FFD2C', 0, 0, 1, '');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_user_booking`
--

CREATE TABLE `tp_user_booking` (
  `id` int UNSIGNED NOT NULL,
  `memberId` int NOT NULL,
  `uid` int NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_phone` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `stylist_id` int NOT NULL,
  `stylist_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `branchId` int NOT NULL,
  `branch_phone` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `good_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `appointmentDetail` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `firstName` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `booking_start_time` timestamp NULL DEFAULT NULL,
  `booking_end_time` timestamp NULL DEFAULT NULL,
  `creact_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `havePackage` int NOT NULL DEFAULT '0',
  `desc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` int NOT NULL DEFAULT '0' COMMENT '0:待確認，1:已確認 2:已取消'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- 傾印資料表的資料 `tp_user_booking`
--

INSERT INTO `tp_user_booking` (`id`, `memberId`, `uid`, `user_name`, `user_phone`, `stylist_id`, `stylist_name`, `branchId`, `branch_phone`, `good_id`, `appointmentDetail`, `amount`, `firstName`, `booking_start_time`, `booking_end_time`, `havePackage`, `desc`, `status`) VALUES
(359, 0, 128, '+111', '1', 36, 'Vonny', 29, NULL, '208', 'HIFU V面療程*1', 12888, NULL, '2024-02-24 03:00:00', '2024-02-24 05:00:00', 1, NULL, 0),
(358, 0, 128, '+111', '1', 35, 'Miki', 29, NULL, '', '', 0, NULL, '2023-11-15 11:30:00', '2023-11-15 11:30:00', 0, NULL, 0),
(357, 0, 128, '+111', '1', 34, 'Suvee', 29, NULL, '', '', 0, NULL, '2023-11-26 11:00:00', '2023-11-26 11:00:00', 0, NULL, 0),
(356, 0, 230, 'H', '', 30, 'Dora ', 28, NULL, '196', '10次深層清潔療程*1', 1888, NULL, '2023-10-20 03:30:00', '2023-10-20 03:51:00', 0, NULL, 0),
(354, 0, 128, '+111', '1', 31, 'Zoe', 28, NULL, '', '', 0, NULL, '2023-10-16 06:00:00', '2023-10-16 06:00:00', 0, NULL, 1),
(355, 0, 128, '+111', '1', 34, 'Suvee', 29, NULL, '', '', 0, NULL, '2023-10-21 03:30:00', '2023-10-21 03:30:00', 0, NULL, 0),
(353, 0, 230, 'H', '', 31, 'Zoe', 28, NULL, '196', '10次深層清潔療程*1', 1888, NULL, '2023-10-16 03:30:00', '2023-10-16 03:51:00', 0, NULL, 0),
(352, 0, 229, 'Bilancian Fan', '62372753', 37, 'Daphne ', 30, NULL, '197', '熱石暖宮療程*1', 2388, NULL, '2023-10-18 04:00:00', '2023-10-18 04:21:00', 0, NULL, 0),
(351, 0, 229, 'Bilancian Fan', '62372753', 32, 'Yoyo', 28, NULL, '210', '美甲*2', 700, NULL, '2023-10-20 04:00:00', '2023-10-20 08:00:00', 0, NULL, 2),
(349, 0, 128, '+111', '1', 33, 'Becca', 29, NULL, '', '', 0, NULL, '2023-09-30 05:30:00', '2023-09-30 05:30:00', 0, NULL, 0),
(350, 0, 229, 'Bilancian Fan', '62372753', 31, 'Zoe', 28, NULL, '196', '10次深層清潔療程*1', 1888, NULL, '2023-10-14 03:30:00', '2023-10-14 03:51:00', 0, NULL, 0),
(348, 0, 221, 'Kelvin', '', 33, 'Becca', 29, NULL, '210', '美甲*1', 350, NULL, '2023-09-15 04:00:00', '2023-09-15 06:00:00', 0, NULL, 0),
(347, 0, 128, '+111', '1', 32, 'Yoyo', 28, NULL, '208', 'HIFU V面療程*1', 12888, NULL, '2023-09-14 03:30:00', '2023-09-14 05:30:00', 1, NULL, 0),
(346, 0, 128, '+111', '1', 37, 'Daphne ', 30, NULL, '208', 'HIFU V面療程*2', 25776, NULL, '2023-09-08 05:30:00', '2023-09-08 09:30:00', 1, NULL, 0),
(345, 0, 223, 'bruno', '91525758', 32, 'Yoyo', 28, NULL, '', '', 0, NULL, '2023-09-01 02:30:00', '2023-09-01 02:30:00', 0, NULL, 0),
(344, 0, 128, '+111', '1', 29, 'Miko ', 28, NULL, '196', '10次深層清潔療程*1', 1888, NULL, '2023-08-30 03:30:00', '2023-08-30 03:51:00', 0, NULL, 2),
(343, 0, 128, '+111', '1', 32, 'Yoyo', 28, NULL, '197', '熱石暖宮療程*1', 2388, NULL, '2023-08-28 03:00:00', '2023-08-28 03:21:00', 0, NULL, 2),
(342, 0, 128, '+111', '1', 31, 'Zoe', 28, NULL, '208', 'HIFU V面療程*1', 12888, NULL, '2023-08-27 03:30:00', '2023-08-27 05:30:00', 1, NULL, 0),
(341, 0, 128, '+111', '1', 35, 'Miki', 29, NULL, '210', '美甲*1', 350, NULL, '2023-08-27 09:00:00', '2023-08-27 11:00:00', 0, NULL, 0),
(340, 0, 128, '+111', '1', 35, 'Miki', 29, NULL, '196', '10次深層清潔療程*1', 350, NULL, '2023-08-27 03:00:00', '2023-08-27 03:21:00', 0, NULL, 0),
(339, 0, 128, '+111', '1', 35, 'Miki', 29, NULL, '196', '10次深層清潔療程*1', 1888, NULL, '2023-08-27 03:00:00', '2023-08-27 03:21:00', 0, NULL, 0),
(338, 0, 128, '+111', '1', 37, 'Daphne ', 30, NULL, '196', '10次深層清潔療程*1', 1888, NULL, '2023-08-24 03:30:00', '2023-08-24 03:51:00', 0, NULL, 0),
(337, 0, 128, '+111', '1', 31, 'Zoe', 28, NULL, '209', '肩頸經絡放鬆按摩療程*1', 3400, NULL, '2023-08-23 03:30:00', '2023-08-23 04:30:00', 1, NULL, 2),
(336, 0, 128, '+111', '1', 34, 'Suvee', 29, NULL, '208', 'HIFU V面療程*1', 12888, NULL, '2023-08-23 05:30:00', '2023-08-23 07:30:00', 1, NULL, 3),
(334, 0, 128, '+111', '1', 35, 'Miki', 29, NULL, '196', '10次深層清潔療程*2', 3776, NULL, '2023-08-23 03:30:00', '2023-08-23 04:12:00', 0, NULL, 1),
(335, 0, 128, '+111', '1', 34, 'Suvee', 29, NULL, '208', 'HIFU V面療程*1', 12888, NULL, '2023-08-23 02:30:00', '2023-08-23 04:30:00', 1, NULL, 1),
(332, 0, 128, '+111', '1', 31, 'Zoe', 28, NULL, '210', '美甲*1', 350, NULL, '2023-08-16 04:00:00', '2023-08-16 06:00:00', 0, NULL, 1),
(329, 0, 128, '+111', '1', 30, 'Dora ', 28, NULL, '208', 'HIFU V面療程*1', 12888, NULL, '2023-08-16 04:00:00', '2023-08-16 06:00:00', 1, NULL, 1),
(330, 0, 128, '+111', '1', 37, 'Daphne ', 30, NULL, '197', '熱石暖宮療程*1', 2388, NULL, '2023-08-16 04:00:00', '2023-08-16 04:21:00', 0, NULL, 2);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_wenda`
--

CREATE TABLE `tp_wenda` (
  `id` int NOT NULL,
  `question` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `lang` int NOT NULL,
  `isdel` int NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `tp_wenda`
--

INSERT INTO `tp_wenda` (`id`, `question`, `answer`, `lang`, `isdel`) VALUES
(8, 'QuesC', 'AnsC', 1, 0),
(2, 'InSmile 的美齒功效能維持多久？', '美齒功效能維持的時間，確實因人而異；一些生活習慣例如吸煙、喝咖啡、紅酒等等，很可能縮短美白效果的時間；因此，每次美齒體驗後，InSmile 的美容顧問會因應不同顧客，提出幫助顧客保養更得宜的意見*！', 1, 1),
(3, '敏感牙齒能否進行InSmile的療程？又會否傷害牙齒健康？', 'InSmile 的美齒療程除了採用遵從歐盟 2011/84/EU 指令的美白因子，更是一種溫和安全的配方，溫和地穿透琺瑯質與象牙質的微小管道，與色素份子結合、產生反應，從以達至美白效果，溫和而對牙齒無傷害。因此，敏感牙齒同樣適合進行 InSmile 的療程。', 1, 1),
(4, '除了多種認證，InSmile所採用的美白技術有何特別？', 'InSmile 的療程使用的配方遵從歐盟 2011/84/EU 指令，由意大利生產及以美容產品出口。 歐盟 2011/84/EU 指令規定，以美容產品出口之美齒產品，所含 H2O2 不能超過 0.1%', 1, 1),
(5, 'How long can InSmile\'s esthetic effect last?', 'The maintenance time of esthetic effects varies from person to person; some habits such as smoking, coffee, red wine, etc., may shorten the time for whitening effects; therefore, InSmile’s Consultants will respond to each esthetic experience. Different customers, put forward suggestions to help customers better care*!', 2, 1),
(6, 'Can InSmile be treated with sensitive teeth? Will it hurt dental health?', 'InSmile’s esthetic treatment course uses a whitening factor that complies with the European Union’s 2011/84/EU directive. It is a gentle and safe formula that gently penetrates the tiny channels of enamel and ivory and binds and reacts with pigments, ahieving whitening effect with no harm to the teeth. Therefore, sensitive teeth are also suitable for InSmile treatment.', 2, 1),
(7, 'In addition to multiple certifications, what is special about the whitening technology used by InSmile?', 'InSmile’s treatment uses recipes that comply with the EU Directive 2011/84/EU, produced by Italy and exported as beauty products. EU Directive 2011/84/EU stipulates that H2O2 contained in cosmetic products exported from cosmetic products must not exceed 0.1%', 2, 1),
(9, 'QuesE', 'AnsE', 2, 0),
(10, 'QuesE2', 'AnsE2', 2, 0),
(11, 'QuesE1', 'AnsE1', 2, 0),
(12, 'QuesC2', 'AnsC2', 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_yhcard`
--

CREATE TABLE `tp_yhcard` (
  `id` int NOT NULL,
  `image` varchar(255) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `twName` varchar(255) NOT NULL,
  `cnName` varchar(255) NOT NULL,
  `deduMoney` int DEFAULT '0',
  `begDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `addDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rand` varchar(10) DEFAULT NULL,
  `score` int DEFAULT '0',
  `yhNum` varchar(50) DEFAULT '',
  `status` int DEFAULT '0' COMMENT '1可以0不可以',
  `isdel` int DEFAULT '1',
  `redeemScore` int DEFAULT NULL,
  `couponId` varchar(25) DEFAULT NULL,
  `available` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_yhcard`
--

INSERT INTO `tp_yhcard` (`id`, `image`, `name`, `twName`, `cnName`, `deduMoney`, `begDate`, `endDate`, `addDate`, `rand`, `score`, `yhNum`, `status`, `isdel`, `redeemScore`, `couponId`, `available`) VALUES
(5, './Public/Uploads/yhCard/2023-01-13/63c04b60347a7.jpeg', 'summer sale', '夏日大優惠5', '夏日大优惠', 1, '2022-03-10', '2023-04-22', '2023-03-30 02:48:25', '4184', 1, '25719', 1, 0, 200, 'abcqwer', 0),
(14, './Public/Uploads/yhCard/2023-07-05/64a4e3c42824a.jpg', 'Wedding Makeup Services', '夏日大優惠10', '夏日大優惠10', 200, '2023-04-01', '2023-04-20', '2023-04-04 09:56:51', '948', 100, '73866', 1, 1, 10, NULL, 1),
(15, './Public/Uploads/yhCard/2023-07-05/64a4e3a763624.jpg', 'Wedding Makeup Services', '夏日大優惠10', '夏日大優惠10', 200, '2023-04-01', '2023-07-21', '2023-04-04 09:56:51', '3871', 100, '73866', 1, 1, 12, NULL, 0),
(16, './Public/Uploads/yhCard/2023-04-04/642bf4636ca3c.png', 'Wedding Makeup Services', '夏日大優惠10', '夏日大優惠10', 200, '2023-04-01', '2023-07-21', '2023-04-04 09:56:51', '5708', 100, '73866', 1, 0, NULL, NULL, 0),
(17, './Public/Uploads/yhCard/2023-07-05/64a4e41b2854e.png', 'testing coupon', '測試禮券', '测试礼券', 100, '2023-07-08', '2023-07-29', '2023-07-05 03:31:39', NULL, 0, '17692', 0, 0, 300, NULL, 0),
(18, './Public/Uploads/yhCard/2023-07-07/64a79d20aa887.jpg', 'Tsang', '罪惡感', '戰鬥機', 1000, '2023-07-08', '2023-07-31', '2023-07-07 05:05:36', NULL, 0, '86351', 0, 0, 10, NULL, 0),
(19, './Public/Uploads/yhCard/2023-10-31/6540a31e70c69.jpg', 'demo coupon', '夏季促銷', '夏季促銷', 10, '2023-10-30', '2023-11-30', '2023-10-31 06:47:58', '6852', 0, '30450', 0, 1, 200, NULL, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_yzm`
--

CREATE TABLE `tp_yzm` (
  `id` int NOT NULL,
  `to_user` varchar(40) DEFAULT NULL,
  `send_time` int DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- 傾印資料表的資料 `tp_yzm`
--

INSERT INTO `tp_yzm` (`id`, `to_user`, `send_time`, `code`) VALUES
(16802, '1228042983@qq.com', 1604460139, '2200'),
(16803, '1228042983@qq.com1', 1604394452, '9099'),
(16804, '1228042983@qq.com11', 1604394505, '7864');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `tp_admin`
--
ALTER TABLE `tp_admin`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 資料表索引 `tp_branch`
--
ALTER TABLE `tp_branch`
  ADD PRIMARY KEY (`branchId`) USING BTREE;

--
-- 資料表索引 `tp_cart`
--
ALTER TABLE `tp_cart`
  ADD PRIMARY KEY (`cartId`) USING BTREE;

--
-- 資料表索引 `tp_cartlistpay`
--
ALTER TABLE `tp_cartlistpay`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_cate`
--
ALTER TABLE `tp_cate`
  ADD PRIMARY KEY (`cateId`) USING BTREE;

--
-- 資料表索引 `tp_class`
--
ALTER TABLE `tp_class`
  ADD PRIMARY KEY (`classId`) USING BTREE;

--
-- 資料表索引 `tp_favorite`
--
ALTER TABLE `tp_favorite`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tp_getyhcard`
--
ALTER TABLE `tp_getyhcard`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_goods`
--
ALTER TABLE `tp_goods`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_homebanner`
--
ALTER TABLE `tp_homebanner`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_html`
--
ALTER TABLE `tp_html`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_location`
--
ALTER TABLE `tp_location`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_locations`
--
ALTER TABLE `tp_locations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_msg`
--
ALTER TABLE `tp_msg`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_order`
--
ALTER TABLE `tp_order`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_orderitem`
--
ALTER TABLE `tp_orderitem`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_package_record`
--
ALTER TABLE `tp_package_record`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tp_pagebanner`
--
ALTER TABLE `tp_pagebanner`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tp_pcset`
--
ALTER TABLE `tp_pcset`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_promote`
--
ALTER TABLE `tp_promote`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_schedule`
--
ALTER TABLE `tp_schedule`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_score`
--
ALTER TABLE `tp_score`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_shop`
--
ALTER TABLE `tp_shop`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_stylist`
--
ALTER TABLE `tp_stylist`
  ADD PRIMARY KEY (`staffId`);

--
-- 資料表索引 `tp_system`
--
ALTER TABLE `tp_system`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_user`
--
ALTER TABLE `tp_user`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 資料表索引 `tp_user_booking`
--
ALTER TABLE `tp_user_booking`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tp_wenda`
--
ALTER TABLE `tp_wenda`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `tp_yhcard`
--
ALTER TABLE `tp_yhcard`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_yzm`
--
ALTER TABLE `tp_yzm`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_admin`
--
ALTER TABLE `tp_admin`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_branch`
--
ALTER TABLE `tp_branch`
  MODIFY `branchId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_cart`
--
ALTER TABLE `tp_cart`
  MODIFY `cartId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=745;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_cartlistpay`
--
ALTER TABLE `tp_cartlistpay`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_cate`
--
ALTER TABLE `tp_cate`
  MODIFY `cateId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_class`
--
ALTER TABLE `tp_class`
  MODIFY `classId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_favorite`
--
ALTER TABLE `tp_favorite`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_getyhcard`
--
ALTER TABLE `tp_getyhcard`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1128;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_goods`
--
ALTER TABLE `tp_goods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_homebanner`
--
ALTER TABLE `tp_homebanner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_html`
--
ALTER TABLE `tp_html`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_location`
--
ALTER TABLE `tp_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_locations`
--
ALTER TABLE `tp_locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1146;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_msg`
--
ALTER TABLE `tp_msg`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_order`
--
ALTER TABLE `tp_order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_orderitem`
--
ALTER TABLE `tp_orderitem`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_package_record`
--
ALTER TABLE `tp_package_record`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_pagebanner`
--
ALTER TABLE `tp_pagebanner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_pcset`
--
ALTER TABLE `tp_pcset`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_promote`
--
ALTER TABLE `tp_promote`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_schedule`
--
ALTER TABLE `tp_schedule`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_score`
--
ALTER TABLE `tp_score`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_shop`
--
ALTER TABLE `tp_shop`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_stylist`
--
ALTER TABLE `tp_stylist`
  MODIFY `staffId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_system`
--
ALTER TABLE `tp_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_user`
--
ALTER TABLE `tp_user`
  MODIFY `uid` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_user_booking`
--
ALTER TABLE `tp_user_booking`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=360;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_wenda`
--
ALTER TABLE `tp_wenda`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_yhcard`
--
ALTER TABLE `tp_yhcard`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_yzm`
--
ALTER TABLE `tp_yzm`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16805;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
