-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2022-03-07 03:31:52
-- 伺服器版本： 10.4.22-MariaDB
-- PHP 版本： 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫: `east`
--

-- --------------------------------------------------------

--
-- 資料表結構 `tp_admin`
--

CREATE TABLE `tp_admin` (
  `uid` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT '',
  `addDate` datetime DEFAULT NULL,
  `rand` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_admin`
--

INSERT INTO `tp_admin` (`uid`, `userName`, `password`, `name`, `addDate`, `rand`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '2020-10-01 19:28:06', '1977');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_cart`
--

CREATE TABLE `tp_cart` (
  `cartId` int(11) NOT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT 1,
  `uid` int(11) DEFAULT NULL,
  `bookTime` timestamp NULL DEFAULT current_timestamp(),
  `goodsType` int(2) DEFAULT NULL,
  `status` int(255) DEFAULT NULL,
  `out_trade_no` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `tp_cart`
--

INSERT INTO `tp_cart` (`cartId`, `goodsId`, `quantity`, `uid`, `bookTime`, `goodsType`, `status`, `out_trade_no`) VALUES
(258, 3, 3, 7, '2022-03-04 09:58:32', 1, 1, '4H589922U2127102K'),
(260, 5, 2, 7, '2022-03-04 10:04:47', 1, 2, NULL),
(263, 4, 1, 8, '2022-03-04 10:10:30', 1, 2, '93449238A2603254F'),
(264, 4, 8, 7, '2022-03-04 10:27:59', 0, 0, NULL),
(265, 4, 1, 1, '2022-03-04 14:39:45', 0, 2, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_cate`
--

CREATE TABLE `tp_cate` (
  `cateId` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pid` int(11) DEFAULT 0,
  `level` int(11) DEFAULT NULL,
  `rand` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `cateDesc` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cateImage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isdel` int(2) DEFAULT 1,
  `goodsType` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 傾印資料表的資料 `tp_cate`
--

INSERT INTO `tp_cate` (`cateId`, `name`, `pid`, `level`, `rand`, `sort`, `cateDesc`, `cateImage`, `isdel`, `goodsType`) VALUES
(15, '村屋建築', 0, NULL, NULL, NULL, NULL, NULL, 1, 6),
(13, '花園建設', 0, NULL, '3016', NULL, NULL, NULL, 1, 4),
(14, '室內室外維修', 0, NULL, NULL, NULL, NULL, NULL, 1, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_customer`
--

CREATE TABLE `tp_customer` (
  `id` int(11) NOT NULL,
  `installDate` date DEFAULT NULL,
  `name` varchar(40) DEFAULT '',
  `phone` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `goodsName` varchar(255) DEFAULT '',
  `gdkhhm` varchar(255) DEFAULT NULL,
  `masterPhone` varchar(255) DEFAULT NULL,
  `isEndReceive` int(2) DEFAULT 0,
  `yinNum` varchar(255) DEFAULT NULL,
  `orderCount` varchar(255) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `isdel` int(2) DEFAULT 1,
  `rand` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_customer`
--

INSERT INTO `tp_customer` (`id`, `installDate`, `name`, `phone`, `address`, `goodsName`, `gdkhhm`, `masterPhone`, `isEndReceive`, `yinNum`, `orderCount`, `score`, `isdel`, `rand`) VALUES
(1, '2020-11-01', 'boabo', '1848218277', 'HKHKHKHKHK', '笔记本笔记本笔记本', '111111', '12345678', 1, '1000', '122', 122, 0, '5107');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_getyhcard`
--

CREATE TABLE `tp_getyhcard` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `yhId` int(11) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `status` int(2) DEFAULT 0 COMMENT '0未抵扣，1抵扣了',
  `orderId` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `isdel` int(2) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 傾印資料表的資料 `tp_getyhcard`
--

INSERT INTO `tp_getyhcard` (`id`, `uid`, `yhId`, `addDate`, `status`, `orderId`, `score`, `isdel`) VALUES
(4, 1, 2, '2020-10-16 20:31:34', 0, NULL, 20, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_goods`
--

CREATE TABLE `tp_goods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT '',
  `name_en` text NOT NULL,
  `desc` text DEFAULT NULL,
  `desc_en` text NOT NULL,
  `coverImg` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `weight` varchar(10) NOT NULL,
  `cateId` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `isShow` int(2) DEFAULT 1,
  `addDate` datetime DEFAULT NULL,
  `rand` varchar(10) DEFAULT NULL,
  `type` int(2) DEFAULT 1 COMMENT '1商品，2优惠服务，3预约服务',
  `endDate` date DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `isdel` int(2) DEFAULT 1,
  `richengId` int(11) DEFAULT 0,
  `hour` varchar(11) DEFAULT '0',
  `oneHourStock` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_goods`
--

INSERT INTO `tp_goods` (`id`, `name`, `name_en`, `desc`, `desc_en`, `coverImg`, `price`, `weight`, `cateId`, `stock`, `isShow`, `addDate`, `rand`, `type`, `endDate`, `score`, `isdel`, `richengId`, `hour`, `oneHourStock`) VALUES
(4, '花園建設', 'garden construction', '6Iqx5ZyS5bu66Kit', 'Z2FyZGVuIGNvbnN0cnVjdGlvbg==', 'https://localhost/eastford/backend/Public/Uploads/goods/2022-03-04/6221c0396df85.jpg', '650.00', '111', 13, 10000, 1, '2021-02-26 15:52:00', '7413', 1, NULL, 0, 1, 9, '0.5', 5),
(5, '室內室外維修', 'Indoor and outdoor maintenance', '5a6k5YWn5a6k5aSW57at5L+u', 'SW5kb29yIGFuZCBvdXRkb29yIG1haW50ZW5hbmNl', 'https://localhost/eastford/backend/Public/Uploads/goods/2022-03-04/6221c03020048.jpg', '860.00', '111', 14, 10000, 1, '2021-02-26 15:52:00', '386', 1, NULL, 0, 1, 9, '0.5', 5),
(6, '村屋建築', 'house building', '5p2R5bGL5bu656+J', 'aG91c2UgYnVpbGRpbmc=', 'https://localhost/eastford/backend/Public/Uploads/goods/2022-03-04/6221c01f40717.jpg', '500.00', '99', 15, 1000, 1, '2021-02-26 15:53:13', '4303', 1, NULL, 0, 1, 0, '0', 5);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_homebanner`
--

CREATE TABLE `tp_homebanner` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_icelandic_ci DEFAULT NULL,
  `bannerImage` varchar(100) DEFAULT NULL,
  `isdel` int(2) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `tp_homebanner`
--

INSERT INTO `tp_homebanner` (`id`, `name`, `bannerImage`, `isdel`) VALUES
(11, '元朗 新生村', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/622055cacf9ff.jpg', 1),
(12, '大埔 洞梓村', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/62205bfc0955c.jpg', 1),
(13, '沙田 黃泥頭村', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/62205c3b09316.png', 1),
(14, '沙田 烏溪沙村', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/62205c73c5a2a.jpg', 1),
(15, '大埔 社山村', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/62205c8e4d9fc.jpg', 1),
(16, '大埔 大美督', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/62205ca3794b7.jpg', 1),
(17, '大埔 汀角村', 'https://localhost/wingon-e/backend/Public/Uploads/goods/2022-03-03/62205ccb0219c.png', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_html`
--

CREATE TABLE `tp_html` (
  `id` int(11) NOT NULL,
  `navTitle` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_html`
--

INSERT INTO `tp_html` (`id`, `navTitle`, `content`) VALUES
(3, 'services', 'T24gQXByaWwgMTEsIEhhaW5hbiBzdG9tYXRvbG9naWNhbCBob3NwaXRhbCBhbmQgRnVkZSBsaWZlIGNhcnJpZWQgb3V0IG9ubGluZSBvcmFsIGhlYWx0aCBzY2llbmNlIGxpdmUgYnJvYWRjYXN0LiBNb3JlIHRoYW4gMjAwIHBlb3BsZSBsZWFybmVkIG9yYWwgaGVhbHRoIGtub3dsZWRnZSB0aHJvdWdoIHRoZSBsaXZlIGJyb2FkY2FzdCBwbGF0Zm9ybSB0aGF0IG5pZ2h0LiBaaGFuZyBTaHVhbmcsIHRoZSBvcnRob2RvbnRpc3Qgb2YgSGFpbmFuIHN0b21hdG9sb2dpY2FsIGhvc3BpdGFsLCBhcyB0aGUgZ3Vlc3Qgc3BlYWtlciwgZ2F2ZSBhbiBvbmxpbmUgbGVjdHVyZSBvbiBjaGlsZHJlbidzIG9yYWwgaGVhbHRoIGtub3dsZWRnZSwgaW5jbHVkaW5nIHRoZSBoYXphcmRzIG9mIGRlbnRhbCBjYXJpZXMgdG8gY2hpbGRyZW4ncyBoZWFsdGgsIGNoaWxkcmVuJ3Mgb3JhbCBoYWJpdHMsIGFuZCB0aGUgaGF6YXJkcyBvZiB1bmV2ZW4gdGVldGguIE1hbnkgcGFyZW50cyBhbmQgZnJpZW5kcyBjb21tZW50IGFuZCBpbnRlcmFjdCB3aXRoIERyLiBaaGFuZyBTaHVhbmcgdGhyb3VnaCB0aGUgb25saW5lIHBsYXRmb3JtLCBwdXR0aW5nIGZvcndhcmQgc29tZSBvcmFsIHByb2JsZW1zIHRoYXQgY2hpbGRyZW4gZW5jb3VudGVyIGluIGRhaWx5IGxpZmUsIGFuZCBEci4gWmhhbmcgU2h1YW5nIGFuc3dlcnMgdGhlbSBvbmUgYnkgb25lLjxiciAvPg0KPGJyIC8+DQo8YnIgLz4NClRvb3RoIGRlZm9ybWl0eSBub3Qgb25seSBhZmZlY3RzIGZhY2UsIGJ1dCBhbHNvIGRpcmVjdGx5IGFmZmVjdHMgY2hpbGRyZW4ncyBwc3ljaG9sb2dpY2FsIGFuZCBwaHlzaW9sb2dpY2FsIGdyb3d0aC4gRmlyc3Qgb2YgYWxsLCBwYXJlbnRzIHNob3VsZCBsZXQgdGhlaXIgY2hpbGRyZW4gZGV2ZWxvcCBnb29kIG9yYWwgaGFiaXRzIGFuZCBnZXQgcmlkIG9mIGJhZCBoYWJpdHMgc3VjaCBhcyBlYXRpbmcgZmluZ2Vycywgc3RpY2tpbmcgb3V0IHRvbmd1ZSwgYml0aW5nIHBlbiwgYml0aW5nIGxvd2VyIGxpcCBhbmQgbW91dGggYnJlYXRoaW5nLiBEb24ndCBtaXNzIHRoZSBiZXN0IHRpbWUgZm9yIGNoaWxkcmVuJ3MgdHJlYXRtZW50IGJlY2F1c2Ugb2YgbmVnbGlnZW5jZSwgZWFybHkgZGV0ZWN0aW9uIGFuZCBlYXJseSB0cmVhdG1lbnQsIGxldCBjaGlsZHJlbiBncm93IHVwIGhlYWx0aHkgYW5kIGhhcHB5LjxiciAvPg0KPHNwYW4+PHNwYW4+PC9zcGFuPjwvc3Bhbj4='),
(6, 'expert', 'PGRpdiBjbGFzcz0idHJhbnMtbGVmdCI+DQoJPGRpdiBjbGFzcz0idHJhbnMtaW5wdXQtd3JhcCI+DQoJCTxkaXYgY2xhc3M9ImlucHV0LXdyYXAiPg0KCQkJPGRpdiBjbGFzcz0idGV4dGFyZWEtd3JhcCB3aXRob3V0LXRleHRhcmVhLWJnIj4NCgkJCQk8ZGl2IGNsYXNzPSJ0ZXh0YXJlYS1iZy10ZXh0IHNtYWxsLWZvbnQiIGlkPSJ0ZXh0YXJlYS1iZy10ZXh0Ij4NCgkJCQk8L2Rpdj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0iaW5wdXQtb3BlcmF0ZSI+DQoJCQkJPGEgaHJlZj0iaHR0cHM6Ly9mYW55aS5iYWlkdS5jb20vdHJhbnNsYXRlIyMjIiBjbGFzcz0ib3BlcmF0ZS1idG4gb3Atc291bmQgZGF0YS1ob3Zlci10aXAiPjxzcGFuIGNsYXNzPSJpY29uLXNvdW5kIj48L3NwYW4+PC9hPiANCgkJCQk8ZGl2IGNsYXNzPSJvcC1mYXZvci1jb250YWluZXIiPg0KCQkJCQk8YSBjbGFzcz0ib3BlcmF0ZS1idG4gb3AtZmF2byBkYXRhLWhvdmVyLXRpcCI+PHNwYW4gY2xhc3M9Imljb24tZmF2byI+PC9zcGFuPjwvYT4gDQoJCQkJPC9kaXY+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+DQoJPC9kaXY+DQo8L2Rpdj4NCjxkaXYgY2xhc3M9InRyYW5zLXJpZ2h0Ij4NCgk8ZGl2IGNsYXNzPSJvdXRwdXQtd3JhcCBzbWFsbC1mb250Ij4NCgkJPGRpdiBjbGFzcz0ib3V0cHV0LW1vZCBvcmRpbmFyeS13cmFwIj4NCgkJCTxkaXYgY2xhc3M9Im91dHB1dC1iZCI+DQoJCQkJPHAgY2xhc3M9Im9yZGluYXJ5LW91dHB1dCB0YXJnZXQtb3V0cHV0IGNsZWFyZml4Ij4NCgkJCQkJPHNwYW4gY2xhc3M9IiI+UmVseWluZw0KIG9uIHRoZSBzdHJvbmcgc3RyZW5ndGggb2YgdGhlIGdyb3VwLCBpbnNtaWxlIGhhcyBpbnRyb2R1Y2VkIGEgbGFyZ2UgDQpudW1iZXIgb2Ygd2VsbC1rbm93biBzdG9tYXRvbG9naXN0cyB0byBmb3JtIGEgbWFzdGVyJ3MgYW5kIGRvY3RvcmFsIA0KZXhwZXJ0IGdyb3VwIHdpdGggcHJvZmVzc29ycyBhbmQgZG9jdG9ycyBhcyB0aGUgY29yZS4gSXQgaGFzIGdhdGhlcmVkIA0Kd2VsbC1rbm93biBleHBlcnRzIGF0IGhvbWUgYW5kIGFicm9hZCBpbiB0aGUgZmllbGRzIG9mIGRlbnRhbCBpbXBsYW50LCANCm9ydGhvZG9udGljcywgcHJvc3Rob2RvbnRpY3MsIFBlcmlvZG9udG9sb2d5IGFuZCBjaGlsZHJlbidzIHRlZXRoLiBBbW9uZw0KIHRoZW0sIHRoZXJlIGFyZSBwcm92aW5jaWFsIGFuZCBtdW5pY2lwYWwgbGVhZGVycyBpbiBrZXkgc2NpZW5jZSBhbmQgDQp0ZWNobm9sb2d5LCBhcyB3ZWxsIGFzIGV4Y2VsbGVudCB0aGVvcmV0aWNhbCBhbmQgcHJhY3RpY2FsIG9yYWwgaW1wbGFudCwNCiBvcnRob2RvbnRpY3MsIHByb3N0aG9kb250aWNzLCBQZXJpb2RvbnRvbG9neSBhbmQgbWF0ZXJpYWxzPC9zcGFuPjxzcGFuIGNsYXNzPSIiPiBIZSBpcyBhbHNvIGEgc2VuaW9yIGV4cGVydCBvZiB0aGUgaW50ZXJuYXRpb25hbCBzb2NpZXR5IG9mIGRlbnRhbCANCmltcGxhbnQgc3VyZ2VvbnMsIHdobyByZXByZXNlbnRzIHRoZSBoaWdoZXN0IGxldmVsIG9mIGRlbnRhbCBpbXBsYW50cywgDQphbmQgYSAiY3JhZnRzbWFuIiB3aG8gaGFzIHN0dWRpZWQgYWVzdGhldGljIHJlc3RvcmF0aW9uIHRlY2hub2xvZ3kgZm9yIA0KZGVjYWRlcy48L3NwYW4+IA0KCQkJCTwvcD4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4NCgk8L2Rpdj4NCjwvZGl2Pg0KPHNwYW4+PC9zcGFuPg=='),
(5, '專家團隊', 'PHNwYW4+aW5zbWlsZeS+neaJmOmbhuWcmOeahOmbhOWOmuWvpuWKm++8jOW8lemAsuWkp+aJueefpeWQjeWPo+iFlOWQjeWutu+8jOW9ouaIkOS7peaVmeaOiOOAgeWNmuWjq+eCuuaguOW/g+eahOeiqeWNmuWwiOWutuWcmO+8jOWMr+mbhuS6huWPo+iFlOeoruakjeOAgeato+eVuOOAgeS/ruW+qeOAgeeJmeWRqOOAgeWFkueJmeetiee0sOWIhumgmOWfn+S6q+itveWci+WFp+WklueahOWQjeWutu+8jOWFtuS4reacieecgeW4guWFqee0mumHjem7nuWtuOenkeWtuOihk+W4tumgreS6uu+8jOacieeQhuirluWvpuaTjeS/seS9s+eahOWPo+iFlOeoruakjeOAgeato+eVuOOAgeS/ruW+qeOAgeeJmeWRqOWSjOadkOaWmeWtuOWNmuWjq++8jOWPiOacieS7o+ihqOeoruakjeeJmeiHs+mrmOawtOW5s+eahOWci+mam+WPo+iFlOeoruakjemGq+W4q+WtuOacg+izh+a3seWwiOWutuOAgeabtOacieaVuOWNgeW5tOmJhueglOe+juWtuOS/ruW+qeW3peiXneeahOKAnOWMoOS6uuKAneOAgiZuYnNwOzwvc3Bhbj48c3Bhbj48L3NwYW4+'),
(4, '患者服務', 'NOaciDEx5pel77yM5rW35Y2X5Y+j6IWU6Yar6Zmi6IGv5ZCI5a+M5b6355Sf5ZG96ZaL5bGV57ea5LiK5Y+j6IWU5YGl5bq356eR5pmu55u05pKt77yM55W25pma5YWxMjAw5L2Z5Lq66YCa6YGO55u05pKt5bmz6Ie65a2457+S5Y+j6IWU5YGl5bq355+l6K2Y44CC5rW35Y2X5Y+j6IWU6Yar6Zmi5q2j55W456eR6Yar55Sf5by16ZuZ5L2c54K65Li76Kyb5ZiJ6LOT77yM54K65aSn5a6257ea5LiK56eR5pmu5a6j6Kyb5YWS56ul5Y+j6IWU5YGl5bq355+l6K2Y77yM5YiG5Yil5bCx6b2y6b2S5bCN5a2p5a2Q5YGl5bq355qE5Y2x5a6z44CB5YWS56ul5Y+j6IWU57+S5oWj44CB54mZ6b2S5LiN6b2K55qE5Y2x5a6z562J5YWS56ul5Y+j6IWU55u46Zec55qE55+l6K2Y6YCy6KGM5LqG5Li76KaB6Kyb6Kej44CC5b6I5aSa5a626ZW35pyL5Y+L6YCa6YGO57ea5LiK5bmz6Ie66Lef5by16ZuZ6Yar55Sf6YCy6KGM6KmV6KuW5LqS5YuV77yM5o+Q5Ye65pel5bi45Lit5a2p5a2Q6YGH5Yiw55qE5aO55Lqb5Y+j6IWU5ZWP6aGM77yM5by16ZuZ6Yar55Sf5aO55aO55L2c5Ye66Kej562U44CCPGJyIC8+DQo8YnIgLz4NCiZuYnNwOyAmbmJzcDvniZnpvZLnlbjlvaLkuI3lg4XlvbHpn7/pnaLlrrnvvIzogIzkuJTpgoTnm7TmjqXlvbHpn7/lranlrZDlv4PnkIbmiJDplbflkoznlJ/nkIbmiJDplbfjgILpppblhYjlrrbplbfopoHorpPlranlrZDppIrmiJDoia/lpb3nmoTlj6PohZTnv5LmhaPvvIzmlLnmjonlkIPmiYvmjIfjgIHlkJDoiIzpoK3jgIHlkqznrYbjgIHlkqzkuIvllIfjgIHlj6PlkbzlkLjnrYnkuI3oia/nv5LmhaPjgILkuI3opoHlm6Dngrrnlo/lv73ogIzpjK/pgY7lranlrZDnmoTmnIDkvbPmsrvnmYLmmYLmqZ/vvIzml6nnmbznj77ml6nmsrvnmYLvvIzorpPlranlrZDlgaXlurflv6vmqILnmoTmiJDplbfjgII8YnIgLz4NCjxzcGFuPjwvc3Bhbj4='),
(7, '億輝(中國)發展有限公司', 'PHAgY2xhc3M9Ik1zb05vcm1hbCI+DQoJ5YSE6Lyd5pOB5pyJ5aSa5bm05om/6L6m5p2R5bGL5bu656+J5Y+K57at5L+u5pyN5YuZ55qE57aT6amXPHNwYW4+LCA8L3NwYW4+5pyN5YuZ56+E5ZyN5YyF5ous5p2R5bGL5bu656+J44CB5a6k5YWn5a6k5aSW57at5L+u44CB6Iqx5ZyS5bu66Kit5Y+K5YW25LuW5ZCE6aGe55u46Zec5bel56iL562J44CC5bCI5qWt5ZyY6ZqK5Lqm5pyD5o+Q5L6b5pyA5ZCI6YGp55qE5bu66K2w5LqI5a6i5oi2PHNwYW4+LCA8L3NwYW4+5Y2U5Yqp5a6i5oi25bu66Kit5pyA55CG5oOz55qE5a625bGF44CCPHNwYW4+PC9zcGFuPg0KPC9wPg==');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_msg`
--

CREATE TABLE `tp_msg` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT '',
  `content` varchar(255) DEFAULT '',
  `addDate` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `isRead` int(11) DEFAULT 0,
  `fromUid` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
  `id` int(11) NOT NULL,
  `cateId` int(255) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `payStatus` int(2) DEFAULT 0,
  `out_trade_no` varchar(100) DEFAULT '',
  `yhId` int(11) DEFAULT NULL,
  `money` decimal(11,2) DEFAULT NULL COMMENT '实付款',
  `deduMoney` float(11,2) DEFAULT NULL COMMENT '抵扣价',
  `allMoney` float(11,2) DEFAULT NULL COMMENT '总价',
  `payType` int(2) DEFAULT 1 COMMENT '1在线付，2门店付款',
  `score` int(11) DEFAULT 0,
  `isdel` int(2) DEFAULT 1,
  `address` varchar(255) DEFAULT '',
  `goodsType` int(2) DEFAULT NULL,
  `orderUserData` text DEFAULT NULL,
  `orderServerDay` varchar(30) DEFAULT NULL,
  `orderServerHour` varchar(30) DEFAULT NULL,
  `goodsId` int(11) DEFAULT 0,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_order`
--

INSERT INTO `tp_order` (`id`, `cateId`, `uid`, `addDate`, `payStatus`, `out_trade_no`, `yhId`, `money`, `deduMoney`, `allMoney`, `payType`, `score`, `isdel`, `address`, `goodsType`, `orderUserData`, `orderServerDay`, `orderServerHour`, `goodsId`, `content`) VALUES
(157, 13, 7, '2021-09-09 15:12:20', 0, '2021090903122012416', NULL, '25992.00', NULL, 25992.00, 1, 0, 1, '', NULL, NULL, NULL, NULL, 0, ''),
(158, 13, NULL, '2021-09-17 15:15:50', 0, '2021091703155023851', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"8\",\"date\":\"2021-09-17\",\"time\":\"15:15\",\"firstName\":\"123\",\"phone\":\"333\",\"email\":\"333\",\"goodsType\":\"4\"}', '2021-09-17', '15:15', 8, ''),
(156, 14, NULL, '2021-09-08 15:49:26', 0, '2021090803492689054', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"21\",\"date\":\"2021-09-08\",\"time\":\"15:55\",\"firstName\":\"123\",\"phone\":\"123123\",\"email\":\"123\",\"goodsType\":\"4\"}', '2021-09-08', '15:55', 21, ''),
(154, 15, NULL, '2021-09-08 15:40:57', 0, '2021090803405772168', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"18\",\"date\":\"2021-10-30\",\"time\":\"15:30\",\"firstName\":\"777\",\"phone\":\"7777\",\"email\":\"777\",\"goodsType\":\"4\"}', '2021-10-30', '15:30', 18, ''),
(155, 13, NULL, '2021-09-08 15:48:54', 0, '2021090803485410477', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"21\",\"date\":\"2021-10-01\",\"time\":\"15:53\",\"firstName\":\"1231\",\"phone\":\"132\",\"email\":\"123\",\"goodsType\":\"4\"}', '2021-10-01', '15:53', 21, ''),
(153, 13, NULL, '2021-09-08 15:37:19', 0, '2021090803371919025', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"21\",\"date\":\"2021-09-23\",\"time\":\"15:43\",\"firstName\":\"213\",\"phone\":\"123123\",\"email\":\"123\",\"goodsType\":\"4\"}', '2021-09-23', '15:43', 21, ''),
(152, 13, NULL, '2021-09-08 15:36:23', 0, '2021090803362381976', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"australia\",\"date\":\"2021-10-08\",\"time\":\"15:40\",\"firstName\":\"213\",\"phone\":\"123\",\"email\":\"123\",\"goodsType\":\"4\"}', '2021-10-08', '15:40', 0, ''),
(151, 13, NULL, '2021-09-08 15:31:22', 0, '2021090803312219632', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2021-09-30\",\"time\":\"15:36\",\"firstName\":\"213\",\"phone\":\"213\",\"email\":\"213\",\"goodsType\":\"4\"}', '2021-09-30', '15:36', 0, ''),
(150, 13, NULL, '2021-09-08 15:24:31', 0, '2021090803243126399', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2021-09-29\",\"time\":\"17:26\",\"firstName\":\"123\",\"phone\":\"123\",\"email\":\"1278415284@qq.com\",\"goodsType\":\"4\"}', '2021-09-29', '17:26', 0, ''),
(181, 0, NULL, '2022-03-05 01:22:34', 0, '2022030501223428530', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(180, 0, NULL, '2022-03-05 01:22:34', 0, '2022030501223459776', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(179, 0, NULL, '2022-03-05 01:22:34', 0, '2022030501223457418', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(178, 0, NULL, '2022-03-05 01:22:33', 0, '2022030501223365545', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(177, 0, NULL, '2022-03-05 01:22:25', 0, '2022030501222578296', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"fannyloveseggs@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(176, 0, NULL, '2022-03-05 01:22:25', 0, '2022030501222533640', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"fannyloveseggs@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(175, 0, NULL, '2022-03-05 01:22:25', 0, '2022030501222543244', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"fannyloveseggs@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(174, 0, NULL, '2022-03-05 01:22:24', 0, '2022030501222457415', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"fannyloveseggs@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(173, 0, NULL, '2022-03-05 01:22:20', 0, '2022030501222038331', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"fannyloveseggs@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(172, 0, NULL, '2022-03-05 01:18:16', 0, '2022030501181631613', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:18\",\"firstName\":\"cd\",\"phone\":\"1111111111\",\"email\":\"1112\",\"goodsType\":\"4\"}', '2022-03-05', '01:18', 0, ''),
(167, 14, NULL, '2022-03-05 00:15:06', 0, '2022030512150647665', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"121212\",\"date\":\"2022-03-01\",\"time\":\"00:15\",\"firstName\":\"1212\",\"phone\":\"121212\",\"email\":\"12121\",\"goodsType\":\"4\"}', '2022-03-01', '00:15', 121212, ''),
(168, 13, NULL, '2022-03-05 00:18:04', 0, '2022030512180415113', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"maaa\",\"date\":\"2022-03-05\",\"time\":\"00:17\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '00:17', 0, ''),
(169, 15, NULL, '2022-03-05 00:44:09', 0, '2022030512440998563', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"00:43\",\"firstName\":\"123mmm\",\"phone\":\"1111111111\",\"email\":\"1@com\",\"goodsType\":\"4\"}', '2022-03-05', '00:43', 0, ''),
(170, 15, NULL, '2022-03-05 00:53:41', 0, '2022030512534195406', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-01\",\"time\":\"00:53\",\"firstName\":\"11111111111\",\"phone\":\"1111111111\",\"email\":\"1@com\",\"goodsType\":\"4\"}', '2022-03-01', '00:53', 0, ''),
(171, 15, NULL, '2022-03-05 01:06:18', 0, '2022030501061881209', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-02\",\"time\":\"01:06\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@com\",\"goodsType\":\"4\"}', '2022-03-02', '01:06', 0, ''),
(182, 0, NULL, '2022-03-05 01:22:34', 0, '2022030501223453137', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(183, 0, NULL, '2022-03-05 01:22:35', 0, '2022030501223563122', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(184, 0, NULL, '2022-03-05 01:22:35', 0, '2022030501223542032', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"goodsId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:22\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:22', 0, ''),
(185, 0, NULL, '2022-03-05 01:23:15', 0, '2022030501231545460', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(186, 0, NULL, '2022-03-05 01:23:16', 0, '2022030501231699051', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(187, 0, NULL, '2022-03-05 01:23:17', 0, '2022030501231739135', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(188, 0, NULL, '2022-03-05 01:23:17', 0, '2022030501231714002', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(189, 0, NULL, '2022-03-05 01:23:17', 0, '2022030501231760573', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(190, 0, NULL, '2022-03-05 01:23:18', 0, '2022030501231817543', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(191, 0, NULL, '2022-03-05 01:23:18', 0, '2022030501231848459', NULL, NULL, NULL, NULL, 1, 0, 1, '', 4, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"02:23\",\"firstName\":\"123\",\"phone\":\"1111111111\",\"email\":\"1@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '02:23', 0, ''),
(192, 0, NULL, '2022-03-05 01:25:46', 0, '2022030501254638208', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:25\",\"firstName\":\"dsd\",\"phone\":\"1111111111\",\"email\":\"1s@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:25', 0, ''),
(193, 0, NULL, '2022-03-05 01:25:47', 0, '2022030501254747759', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:25\",\"firstName\":\"dsd\",\"phone\":\"1111111111\",\"email\":\"1s@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:25', 0, ''),
(194, 0, NULL, '2022-03-05 01:25:47', 0, '2022030501254787173', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:25\",\"firstName\":\"dsd\",\"phone\":\"1111111111\",\"email\":\"1s@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:25', 0, ''),
(195, 0, NULL, '2022-03-05 01:25:47', 0, '2022030501254773194', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:25\",\"firstName\":\"dsd\",\"phone\":\"1111111111\",\"email\":\"1s@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:25', 0, ''),
(196, 0, NULL, '2022-03-05 01:25:48', 0, '2022030501254857500', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:25\",\"firstName\":\"dsd\",\"phone\":\"1111111111\",\"email\":\"1s@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:25', 0, ''),
(197, 0, NULL, '2022-03-05 01:25:48', 0, '2022030501254821500', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"cateId\":\"\",\"date\":\"2022-03-05\",\"time\":\"01:25\",\"firstName\":\"dsd\",\"phone\":\"1111111111\",\"email\":\"1s@gmail.com\",\"goodsType\":\"4\"}', '2022-03-05', '01:25', 0, ''),
(198, 0, NULL, '2022-03-07 10:18:11', 0, '2022030710181183967', NULL, NULL, NULL, NULL, 1, 0, 1, '', NULL, '{\"goodsId\":\"\",\"date\":\"2022-03-07\",\"time\":\"10:18\",\"firstName\":\"123\",\"phone\":\"2111\",\"email\":\"1@com\",\"goodsType\":\"4\"}', '2022-03-07', '10:18', 0, '');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_orderitem`
--

CREATE TABLE `tp_orderitem` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `price` float(11,2) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `bookTime` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- 傾印資料表的資料 `tp_orderitem`
--

INSERT INTO `tp_orderitem` (`id`, `orderId`, `goodsId`, `number`, `price`, `uid`, `bookTime`) VALUES
(62, 63, 9, 1, 50.00, 1, ''),
(63, 64, 9, 1, 50.00, 1, ''),
(64, 65, 9, 1, 50.00, 1, ''),
(65, 66, 9, 1, 50.00, 1, ''),
(66, 67, 9, 1, 50.00, 1, ''),
(67, 68, 10, 29, 0.10, 1, ''),
(68, 69, 9, 1, 50.00, 1, ''),
(69, 70, 10, 1, 0.10, 1, ''),
(70, 71, 12, 1, 3199.00, 22, ''),
(71, 72, 12, 1, 3199.00, 22, ''),
(72, 73, 12, 1, 3199.00, 22, ''),
(73, 75, 12, 1, 3199.00, NULL, ''),
(74, 76, 12, 1, 3199.00, NULL, ''),
(75, 77, 12, 1, 3199.00, NULL, ''),
(76, 78, 15, 3, 300.00, 1, ''),
(77, 79, 15, 3, 300.00, 22, ''),
(78, 80, 15, 1, 300.00, NULL, ''),
(79, 81, 14, 1, 200.00, 23, ''),
(80, 82, 12, 1, 1588.00, 23, ''),
(81, 83, 12, 1, 1588.00, 23, ''),
(82, 84, 15, 4, 148.00, 22, ''),
(83, 85, 15, 1, 148.00, NULL, ''),
(84, 86, 15, 3, 148.00, 1, ''),
(85, 86, 17, 1, 108.00, 1, ''),
(86, 86, 14, 1, 188.00, 1, ''),
(87, 87, 19, 1, 0.10, 1, ''),
(88, 88, 19, 1, 0.10, 1, ''),
(89, 89, 15, 6, 148.00, 22, ''),
(90, 90, 19, 2, 0.10, 1, ''),
(91, 91, 19, 2, 0.10, 1, ''),
(92, 92, 15, 7, 148.00, 22, ''),
(93, 93, 15, 1, 148.00, NULL, ''),
(94, 94, 15, 1, 148.00, NULL, ''),
(95, 95, NULL, 1, NULL, NULL, ''),
(96, 96, NULL, 1, NULL, NULL, ''),
(97, 97, NULL, 1, NULL, NULL, ''),
(98, 98, NULL, 1, NULL, NULL, ''),
(99, 99, NULL, 1, NULL, NULL, ''),
(100, 100, NULL, 1, NULL, NULL, ''),
(101, 101, NULL, 1, NULL, NULL, ''),
(102, 102, NULL, 1, NULL, NULL, ''),
(103, 103, NULL, 1, NULL, NULL, ''),
(104, 104, NULL, 1, NULL, NULL, ''),
(105, 105, NULL, 1, NULL, NULL, ''),
(106, 106, NULL, 1, NULL, NULL, ''),
(107, 107, NULL, 1, NULL, NULL, ''),
(108, 108, NULL, 1, NULL, NULL, ''),
(109, 109, NULL, 1, NULL, NULL, ''),
(110, 110, NULL, 1, NULL, NULL, ''),
(111, 111, NULL, 1, NULL, NULL, ''),
(112, 112, NULL, 1, NULL, NULL, ''),
(113, 113, NULL, 1, NULL, NULL, ''),
(114, 114, NULL, 1, NULL, NULL, ''),
(115, 115, NULL, 1, NULL, NULL, ''),
(116, 116, NULL, 1, NULL, NULL, ''),
(117, 117, NULL, 1, NULL, NULL, ''),
(118, 118, NULL, 1, NULL, NULL, ''),
(119, 119, NULL, 1, NULL, NULL, ''),
(120, 120, NULL, 1, NULL, NULL, ''),
(121, 121, NULL, 1, NULL, NULL, ''),
(122, 122, NULL, 1, NULL, NULL, ''),
(123, 123, NULL, 1, NULL, NULL, ''),
(124, 124, NULL, 1, NULL, NULL, ''),
(125, 125, NULL, 1, NULL, NULL, ''),
(126, 126, NULL, 1, NULL, NULL, ''),
(127, 127, NULL, 1, NULL, NULL, ''),
(128, 128, NULL, 1, NULL, NULL, ''),
(129, 129, NULL, 1, NULL, NULL, ''),
(130, 130, NULL, 1, NULL, NULL, ''),
(131, 131, NULL, 1, NULL, NULL, ''),
(132, 132, NULL, 1, NULL, NULL, ''),
(133, 133, NULL, 1, NULL, NULL, ''),
(134, 134, NULL, 1, NULL, NULL, ''),
(135, 135, NULL, 1, NULL, NULL, ''),
(136, 136, NULL, 1, NULL, NULL, ''),
(137, 137, 18, 1, 9999.00, 7, ''),
(138, 138, 18, 1, 9999.00, 7, ''),
(139, 150, 0, NULL, NULL, NULL, ''),
(140, 151, 0, NULL, NULL, NULL, ''),
(141, 152, 0, NULL, NULL, NULL, ''),
(142, 153, 21, NULL, NULL, NULL, ''),
(143, 154, 18, NULL, NULL, NULL, ''),
(144, 155, 21, NULL, NULL, NULL, '2021-10-0115:53'),
(145, 156, 21, NULL, NULL, NULL, '2021-09-08 15:55'),
(146, 157, 22, 6, 999.00, 7, ''),
(147, 157, 18, 1, 9999.00, 7, ''),
(148, 157, 21, 1, 9999.00, 7, ''),
(149, 158, 8, NULL, NULL, NULL, '2021-09-17 15:15'),
(150, 159, 0, NULL, NULL, NULL, '2022-02-16 12:53'),
(151, 160, 3, 2, 498.00, 0, ''),
(152, 160, 4, 1, 650.00, 0, ''),
(153, 160, 5, 1056, 860.00, 0, ''),
(154, 160, 6, 1, 500.00, 0, ''),
(155, 161, 0, NULL, NULL, NULL, '2022-03-04 13:07'),
(156, 162, 3, 1, 498.00, 0, ''),
(157, 162, 4, 2, 650.00, 0, ''),
(158, 162, 5, 1056, 860.00, 0, ''),
(159, 162, 6, 1, 500.00, 0, ''),
(160, 163, 0, NULL, NULL, NULL, '2022-03-04 23:03'),
(161, 164, 0, NULL, NULL, NULL, '2022-03-04 23:08'),
(162, 165, 0, NULL, NULL, NULL, '2022-03-04 03:23'),
(163, 166, 0, NULL, NULL, NULL, '2022-03-24 23:57'),
(164, 167, 121212, NULL, NULL, NULL, '2022-03-01 00:15'),
(165, 168, 0, NULL, NULL, NULL, '2022-03-05 00:17'),
(166, 169, 0, NULL, NULL, NULL, '2022-03-05 00:43'),
(167, 170, 0, NULL, NULL, NULL, '2022-03-01 00:53'),
(168, 171, 0, NULL, NULL, NULL, '2022-03-02 01:06'),
(169, 172, 0, NULL, NULL, NULL, '2022-03-05 01:18'),
(170, 198, 0, NULL, NULL, NULL, '2022-03-07 10:18');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_pcset`
--

CREATE TABLE `tp_pcset` (
  `id` int(11) NOT NULL,
  `navTitle` text DEFAULT NULL,
  `rand` varchar(10) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `workTime` varchar(30) DEFAULT NULL,
  `workDate` varchar(30) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `companyName1` varchar(100) NOT NULL,
  `companyName2` varchar(100) NOT NULL,
  `aboutHtml` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_pcset`
--

INSERT INTO `tp_pcset` (`id`, `navTitle`, `rand`, `whatsapp`, `workTime`, `workDate`, `address1`, `address2`, `phone`, `companyName1`, `companyName2`, `aboutHtml`) VALUES
(1, '億輝(中國)發展有限公司', '7824', '', '10:00 – 18:00', '星期一至五 (星期六日及公眾假期休息)', '元朗馬田村201A地下', '', '(852)2443 9186', '億輝(中國)發展有限公司', 'Eastford (China) Development Limited', 'PCEtLSBzdGFydCBvZiBlYXN0Zm9yZCAtLT48IS0tIGVuZCBvZiBlYXN0Zm9yZCAtLT4NCjxkaXYgY2xhc3M9ImJuci1jb250ZW50Ij4NCgk8ZGl2IGlkPSJibnItdGl0bGUiIGNsYXNzPSJmYWRlX2luX3VwIGRhcmstZ3JheSB4bC10ZXh0IHNwcmVhZC10ZXh0Ij4NCgkJPGRpdiBjbGFzcz0id29yZCI+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJCTxwIGNsYXNzPSJNc29Ob3JtYWwiPg0KCQkJCQnlhITovJ3mk4HmnInlpJrlubTmib/ovqbmnZHlsYvlu7rnr4nlj4rntq3kv67mnI3li5nnmoTntpPpqZc8c3Bhbj4sIDwvc3Bhbj7mnI3li5nnr4TlnI3ljIXmi6zmnZHlsYvlu7rnr4njgIHlrqTlhaflrqTlpJbntq3kv67jgIHoirHlnJLlu7roqK3lj4rlhbbku5blkITpoZ7nm7jpl5zlt6XnqIvnrYnjgILlsIjmpa3lnJjpmorkuqbmnIPmj5DkvpvmnIDlkIjpgannmoTlu7rorbDkuojlrqLmiLY8c3Bhbj4sIDwvc3Bhbj7ljZTliqnlrqLmiLblu7roqK3mnIDnkIbmg7PnmoTlrrblsYXjgII8c3Bhbj48L3NwYW4+DQoJCQkJPC9wPg0KCQkJPC9kaXY+DQoJCTwvZGl2Pg0KCTwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJ2aDYwIj4NCgk8ZGl2IGlkPSJmb290ZXItdGl0bGUiIGNsYXNzPSJsZy10ZXh0IGRhcmstZ3JheSBhbGlnbmNlbnRlciBzcHJlYWQtdGV4dCI+DQoJCTxkaXYgY2xhc3M9IndvcmQiPg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4NCgkJPGRpdiBjbGFzcz0id29yZCI+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCTwvZGl2Pg0KCQk8ZGl2IGNsYXNzPSJ3b3JkIj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+DQoJCTxkaXYgY2xhc3M9IndvcmQiPg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4NCgkJPGRpdiBjbGFzcz0id29yZCI+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCTwvZGl2Pg0KCQk8ZGl2IGNsYXNzPSJ3b3JkIj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+DQoJCTxkaXYgY2xhc3M9IndvcmQiPg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4NCgkJPGRpdiBjbGFzcz0id29yZCI+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCQk8ZGl2IGNsYXNzPSJsZXR0ZXIiPg0KCQkJPC9kaXY+DQoJCTwvZGl2Pg0KCQk8ZGl2IGNsYXNzPSJ3b3JkIj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJCTxkaXYgY2xhc3M9ImxldHRlciI+DQoJCQk8L2Rpdj4NCgkJPC9kaXY+DQoJCTxkaXYgY2xhc3M9IndvcmQiPg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQkJPGRpdiBjbGFzcz0ibGV0dGVyIj4NCgkJCTwvZGl2Pg0KCQk8L2Rpdj4NCgk8L2Rpdj4NCjxiciAvPg0KPC9kaXY+'),
(2, '', '5200', '', '10:00 – 18:00', 'Mon – Fri ', '元朗馬田村201A地下', ' G/F, 201A, Ma Tin Estate, Yuen Long', '2443 9186', '億輝(中國)發展有限公司', 'Eastford (China) Development Limited', 'PHAgc3R5bGU9InRleHQtYWxpZ246Y2VudGVyOyI+DQoJPHAgY2xhc3M9Ik1zb05vcm1hbCI+DQoJCTxzcGFuPkVhc3Rmb3JkIChDaGluYSkgRGV2ZWxvcG1lbnQgTGltaXRlZCZuYnNwOzwvc3Bhbj5oYXMgbWFueSB5ZWFycyBvZiBleHBlcmllbmNlIGluIHVuZGVydGFraW5nIHZpbGxhZ2UgaG91c2UgY29uc3RydWN0aW9uIGFuZCBtYWludGVuYW5jZSBzZXJ2aWNlcywgaW5jbHVkaW5nIHZpbGxhZ2UgaG91c2UgY29uc3RydWN0aW9uLCBpbmRvb3IgYW5kIG91dGRvb3IgbWFpbnRlbmFuY2UsIGdhcmRlbiBjb25zdHJ1Y3Rpb24gYW5kIG90aGVyIHJlbGF0ZWQgcHJvamVjdHMuIFRoZSBwcm9mZXNzaW9uYWwgdGVhbSB3aWxsIGFsc28gcHJvdmlkZSB0aGUgbW9zdCBzdWl0YWJsZSBhZHZpY2UgdG8gY3VzdG9tZXJzIHRvIGhlbHAgY3VzdG9tZXJzIGJ1aWxkIHRoZSBtb3N0IGlkZWFsIGhvbWUuDQoJPC9wPg0KPC9wPg==');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_schedule`
--

CREATE TABLE `tp_schedule` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `allData` text DEFAULT NULL,
  `rand` varchar(20) DEFAULT NULL,
  `isdel` int(2) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_schedule`
--

INSERT INTO `tp_schedule` (`id`, `name`, `allData`, `rand`, `isdel`) VALUES
(9, '青尼', '[{\"amBegHour\":\"8\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"18\",\"isOpen\":\"1\"},{\"amBegHour\":\"09\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"17\",\"isOpen\":\"1\"},{\"amBegHour\":\"09\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"17\",\"isOpen\":\"1\"},{\"amBegHour\":\"09\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"17\",\"isOpen\":\"1\"},{\"amBegHour\":\"8\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"14\",\"isOpen\":\"1\"},{\"amBegHour\":\"8\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"18\",\"isOpen\":\"1\"},{\"amBegHour\":\"8\",\"amEndHour\":\"11\",\"pmBegHour\":\"14\",\"pmEndHour\":\"18\",\"isOpen\":\"1\"}]', '5653', 1),
(10, '111', '[{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"}]', NULL, 1),
(23, '1212', '[{\"amBegHour\":\"12\",\"amEndHour\":\"12\",\"pmBegHour\":\"12\",\"pmEndHour\":\"12\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"},{\"amBegHour\":\"\",\"amEndHour\":\"\",\"pmBegHour\":\"\",\"pmEndHour\":\"\",\"isOpen\":\"0\"}]', NULL, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_score`
--

CREATE TABLE `tp_score` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- 資料表結構 `tp_shop`
--

CREATE TABLE `tp_shop` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT '',
  `name` varchar(255) DEFAULT '',
  `desc1` varchar(255) DEFAULT '',
  `desc2` varchar(255) DEFAULT '',
  `phone` varchar(255) DEFAULT '',
  `whatsApp` varchar(50) DEFAULT '',
  `facebook` varchar(50) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `addDate` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `rand` varchar(10) DEFAULT NULL,
  `isdel` int(2) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_shop`
--

INSERT INTO `tp_shop` (`id`, `image`, `name`, `desc1`, `desc2`, `phone`, `whatsApp`, `facebook`, `address`, `addDate`, `rand`, `isdel`) VALUES
(32, 'https://localhost/wingon-e/backend/Public/Uploads/shop/2022-03-02/621f6dbf0d5fc.png', '億輝(中國)發展有限公司', '5YSE6Lyd5pOB5pyJ5aSa5bm05om/6L6m5p2R5bGL5bu656+J5Y+K57at5L+u5pyN5YuZ55qE57aT6amXLCDmnI3li5nnr4TlnI3ljIXmi6zmnZHlsYvlu7rnr4njgIHlrqTlhaflrqTlpJbntq3kv67jgIHoirHlnJLlu7roqK3lj4rlhbbku5blkITpoZ7nm7jpl5zlt6XnqIvnrYnjgILlsIjmpa3lnJjpmorkuqbmnIPmj5DkvpvmnIDlkIg', '5YSE6Lyd5pOB5pyJ5aSa5bm05om/6L6m5p2R5bGL5bu656+J5Y+K57at5L+u5pyN5YuZ55qE57aT6amXLCDmnI3li5nnr4TlnI3ljIXmi6zmnZHlsYvlu7rnr4njgIHlrqTlhaflrqTlpJbntq3kv67jgIHoirHlnJLlu7roqK3lj4rlhbbku5blkITpoZ7nm7jpl5zlt6XnqIvnrYnjgILlsIjmpa3lnJjpmorkuqbmnIPmj5DkvpvmnIDlkIg', '2443 9186', '', '', '元朗馬田村201A地下', '2022-03-02 21:14:39', '7325', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_signlist`
--

CREATE TABLE `tp_signlist` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `isdel` int(2) DEFAULT 1,
  `limitTimeYhCourse` varchar(255) DEFAULT NULL,
  `payType` text DEFAULT NULL,
  `limitTimeFreeLearnCourse` varchar(255) DEFAULT NULL,
  `huangpaiTreatment` varchar(255) DEFAULT NULL,
  `medicalTreatmentCourse` varchar(255) DEFAULT NULL,
  `medicalBeautyCourse` varchar(255) DEFAULT NULL,
  `otherQuestion` varchar(100) DEFAULT NULL,
  `payStatus` int(2) DEFAULT 0,
  `out_trade_no` varchar(100) DEFAULT '',
  `price` decimal(10,2) DEFAULT 0.00,
  `gxlc` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_signlist`
--

INSERT INTO `tp_signlist` (`id`, `uid`, `addDate`, `isdel`, `limitTimeYhCourse`, `payType`, `limitTimeFreeLearnCourse`, `huangpaiTreatment`, `medicalTreatmentCourse`, `medicalBeautyCourse`, `otherQuestion`, `payStatus`, `out_trade_no`, `price`, `gxlc`) VALUES
(15, 1, '2020-11-03 10:03:00', 0, '幸福椅20分鐘', '在線支付', '幸福椅10分鐘', 'BLE幸福椅', '輪廓提升', '緊致肌膚', '11', 0, '', '0.00', NULL),
(16, 1, '2020-11-03 10:10:09', 0, '', '', '幸福椅10分鐘', 'BLE幸福椅', '改善面型', '永久脫毛', '111', 0, '', '0.00', NULL),
(17, 1, '2020-11-04 10:33:36', 1, '幸福椅30分鐘', '到店支付', '醫學孕睫療程', '醫學孕睫療程', '提升蘋果肌', '去除眼袋', '111', 0, '2020110410333642500', '100.00', NULL),
(18, 1, '2020-11-04 10:34:24', 1, '幸福椅30分鐘', '在線支付', '醫學孕睫療程', '醫學孕睫療程', '提升蘋果肌', '膠原自生', '111', 0, '2020110410342498796', '100.00', NULL),
(19, 1, '2020-11-04 10:35:34', 1, '幸福椅20分鐘', '在線支付', '幸福椅10分鐘', 'BLE幸福椅', '輪廓提升', '緊致肌膚', '1111', 0, '2020110410353499500', '100.00', NULL),
(20, 1, '2020-11-04 10:43:47', 1, '幸福椅20分鐘', '在線支付', '幸福椅10分鐘', 'BLE幸福椅', '輪廓提升', '緊致肌膚', '111', 0, '2020110410434721491', '0.02', NULL),
(21, 1, '2020-11-04 11:28:41', 1, '幸福椅20分鐘', '在線支付', '幸福椅10分鐘', 'BLE幸福椅', '輪廓提升', '緊致肌膚', '', 1, '2020110411284156316', '0.02', NULL),
(22, 7, '2020-11-09 20:06:27', 1, '幸福椅20分鐘', '在線支付', '幸福椅10分鐘', 'BLE幸福椅', '提升蘋果肌', '永久脫毛', '', 0, '2020110908062737600', '0.02', NULL),
(23, 1, '2020-11-16 17:29:01', 1, NULL, NULL, NULL, 'BLE幸福椅', '輪廓提升', '去除眼袋', '11', 0, '2020111605290136143', '0.02', NULL),
(24, 1, '2020-11-16 17:29:16', 1, NULL, NULL, NULL, 'BLE幸福椅', '輪廓提升', '去除眼袋', '11', 0, '2020111605291695935', '0.02', NULL),
(25, 1, '2020-11-16 17:31:01', 1, NULL, NULL, NULL, 'BLE幸福椅', '改善面型', '緊致肌膚', '11', 0, '2020111605310193646', '0.02', NULL),
(26, 1, '2020-11-16 17:31:28', 1, NULL, NULL, NULL, 'BLE幸福椅', '改善面型', '緊致肌膚', '11', 0, '2020111605312845808', '0.02', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_signset`
--

CREATE TABLE `tp_signset` (
  `id` int(11) NOT NULL,
  `limitTimeYhCourse` text DEFAULT NULL,
  `limitTimeFreeLearnCourse` text DEFAULT NULL,
  `huangpaiTreatment` text DEFAULT NULL,
  `medicalTreatmentCourse` text DEFAULT NULL,
  `medicalBeautyCourse` text DEFAULT NULL,
  `rand` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `gxlc` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_signset`
--

INSERT INTO `tp_signset` (`id`, `limitTimeYhCourse`, `limitTimeFreeLearnCourse`, `huangpaiTreatment`, `medicalTreatmentCourse`, `medicalBeautyCourse`, `rand`, `price`, `gxlc`) VALUES
(1, '幸福椅20分鐘，幸福椅30分鐘', '幸福椅10分鐘，醫學孕睫療程', 'BLE幸福椅，醫學孕睫療程', '輪廓提升，提升蘋果肌，改善面型，去除眼袋', '緊致肌膚，膠原自生，永久脫毛，美白嫩膚，去除眼袋', '9744', '0.02', '');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_system`
--

CREATE TABLE `tp_system` (
  `id` int(11) NOT NULL,
  `scoreOneMoney` int(11) DEFAULT 0,
  `getScoreNum` int(11) DEFAULT 0,
  `diviScorePer` varchar(10) DEFAULT '0',
  `rand` varchar(10) DEFAULT NULL,
  `homeBanner` text DEFAULT NULL,
  `homebannerlist` text DEFAULT NULL,
  `aboutImage` varchar(255) DEFAULT NULL,
  `latestoffersPagePictures` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_system`
--

INSERT INTO `tp_system` (`id`, `scoreOneMoney`, `getScoreNum`, `diviScorePer`, `rand`, `homeBanner`, `homebannerlist`, `aboutImage`, `latestoffersPagePictures`) VALUES
(1, 10, 10, '10', '5826', 'https://localhost/wingon-e/backend/Public/Uploads/banner/2022-03-02/621f7d1b772ff.png;https://localhost/wingon-e/backend/Public/Uploads/banner/2022-03-02/621f7d210a5c8.png;https://localhost/wingon-e/backend/Public/Uploads/banner/2022-03-02/621f7d25a6105.jpg', '各類村屋建築;花園建設;室內維修;室外維修', 'http://hkinsmil.a.timhostasia.com/insmile/Public/Uploads/banner/2021-02-04/601b667a5d600.jpg', 'http://springmed.com.hk/insmile/Public/Uploads/banner/2021-02-04/601ac9009ed79.png');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_user`
--

CREATE TABLE `tp_user` (
  `uid` int(11) NOT NULL,
  `userName` varchar(100) DEFAULT '',
  `password` varchar(100) DEFAULT '',
  `firstName` varchar(50) DEFAULT '' COMMENT '名',
  `lastName` varchar(50) DEFAULT NULL COMMENT '姓',
  `sex` int(2) DEFAULT 1,
  `area` varchar(50) DEFAULT '',
  `lang` int(2) DEFAULT 1,
  `headImg` varchar(255) DEFAULT '',
  `regDate` datetime DEFAULT NULL,
  `vipLevel` int(2) DEFAULT 0,
  `score` int(11) DEFAULT 0,
  `openId` varchar(100) DEFAULT NULL,
  `fromType` int(2) DEFAULT 0,
  `rand` varchar(20) DEFAULT NULL,
  `udid` varchar(100) DEFAULT '',
  `isLogin` int(2) DEFAULT 0,
  `isdel` int(2) DEFAULT 1,
  `pid` int(11) DEFAULT 0,
  `shareNum` varchar(50) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_user`
--

INSERT INTO `tp_user` (`uid`, `userName`, `password`, `firstName`, `lastName`, `sex`, `area`, `lang`, `headImg`, `regDate`, `vipLevel`, `score`, `openId`, `fromType`, `rand`, `udid`, `isLogin`, `isdel`, `pid`, `shareNum`) VALUES
(1, '1228042983@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 'fisrt', '2', 2, 'HK', 1, 'http://localhost/beauty/Public/Uploads//2020-10-14/5f86dea328fc2.png', '2016-02-15 21:28:00', 0, 128, '123', 1, '9778', '132216271', 1, 0, 0, 'AB11'),
(7, 'test@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '1', '2', 2, 'HK', 1, 'http://localhost/beauty/Public/Uploads//2020-10-14/5f86deac00f8f.jpg', '2016-02-15 22:34:00', 0, 0, '1234', 1, '4180', '', 0, 0, 0, 'AB13'),
(8, '13338042983@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '33', '33', 1, 'HK', 1, 'http://localhost/beauty/Public/Uploads//2020-10-14/5f86df103a8b3.png', '2020-10-14 19:20:48', 0, 0, NULL, 0, '4205', '', 0, 0, 0, 'AB16'),
(12, '2', '', '1111', '1', 1, 'HK', 1, 'http://localhost/beauty/Public/Uploads//2020-11-01/5f9e56a5477e7.png', '2020-10-28 14:48:41', 0, 0, '2', 2, '3481', '1', 0, 0, 0, 'AB117'),
(18, '22', 'b6d767d2f8ed5d21a44b0e5886680cb9', '22', '22', 2, '11', 1, 'http://81.71.141.153/beauty/Public/Uploads//2020-11-01/5f9e9b282032e.jpg', '2020-11-01 19:25:28', 0, 0, NULL, 0, NULL, '', 0, 0, 0, 'AB118'),
(19, 'waterclub2004@yahoo.com.hk', '', 'Leung Kwok Fu', 'Fu', 1, '', 1, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10157386572615938&height=200&width=200&ext=1618982784&hash=AeTV-VWEQIWY8Fu0umo', '2020-11-04 16:25:51', 0, 50, NULL, 2, NULL, '3786232100', 1, 1, 0, 'AB19'),
(20, 'kelvin_211@hotmail.com', '', 'Kelvin Chu', 'Chu', 1, '', 1, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10158198217233727&height=200&width=200&ext=1617782480&hash=AeT1YRN_w7R3OyZsCxM', '2020-11-11 18:41:01', 0, 0, NULL, 2, NULL, '1447628421', 1, 1, 0, 'AB12'),
(21, 'springmedical2018@gmail.com', '', 'Chan Pui Yu', 'Pui Yu', 1, 'HK', 1, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=672525303701780&height=200&width=200&ext=1608110596&hash=AeQg_IjAuIVpAGKEFlM', '2020-11-13 17:32:15', 0, 0, NULL, 2, '7265', '7334813300', 1, 0, 0, 'AB116'),
(22, 'test@hotmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Water', 'Leung', 1, 'HK', 1, '', '2021-02-01 18:17:01', 0, 0, NULL, 0, '1648', '3783047280', 1, 1, 0, '6TIG30'),
(23, 'banalam911221@gmail.com', '', 'Lam WaiHo', 'Lam', 1, '', 1, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=881791659263133&height=200&width=200&ext=1616919365&hash=AeR22W79YIivIblI6wg', '2021-02-23 15:17:19', 0, 0, NULL, 2, NULL, '6877586106', 1, 1, 0, '6ZI5OX'),
(24, 'mysmile_ling@hotmail.com', '', 'Amb Lam', 'Lam', 1, '', 1, 'https://hkinsmile.com/insmile/Public/Uploads/user/2021-03-14/604dc5d47887e.png', '2021-02-24 17:40:40', 0, 0, NULL, 2, '3670', '7318255507', 1, 1, 0, 'B5ZYOW'),
(444, '', '', '', NULL, 1, '', 1, '', NULL, 0, 0, NULL, 0, NULL, '', 0, 1, 0, ''),
(445, '123456@123456', '4297f44b13955235245b2497399d7a93', '123', '213', 1, '123', 1, '', '2021-09-02 16:00:06', 0, 0, NULL, 0, NULL, '', 0, 1, 0, ''),
(446, '121212@qq.com', '8ce87b8ec346ff4c80635f667d1592ae', '2323', '12121', 1, '12', 1, '', '2022-03-01 13:01:18', 0, 0, NULL, 0, NULL, '', 0, 1, 0, 'TXCMJW'),
(447, '000000000000000@qq.com', '4c93008615c2d041e33ebac605d14b5b', '0000000001', '0000000001', 1, '000000000', 1, '', '2022-03-01 16:49:22', 0, 0, NULL, 0, NULL, '', 0, 1, 0, 'EQEOQJ');

-- --------------------------------------------------------

--
-- 資料表結構 `tp_wenda`
--

CREATE TABLE `tp_wenda` (
  `id` int(11) NOT NULL,
  `question` text CHARACTER SET utf8 NOT NULL,
  `answer` text CHARACTER SET utf8 NOT NULL,
  `lang` int(2) NOT NULL,
  `isdel` int(2) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 傾印資料表的資料 `tp_wenda`
--

INSERT INTO `tp_wenda` (`id`, `question`, `answer`, `lang`, `isdel`) VALUES
(8, 'QuesC', 'AnsC', 1, 0),
(2, '億輝(中國)發展有限公司', '億輝擁有多年承辦村屋建築及維修服務的經驗, 服務範圍包括村屋建築、室內室外維修、花園建設及其他各類相關工程等。專業團隊亦會提供最合適的建議予客戶, 協助客戶建設最理想的家居。', 1, 1),
(3, '億輝', '億輝擁有多年承辦村屋建築及維修服務的經驗, 服務範圍包括村屋建築、室內室外維修、花園建設及其他各類相關工程等。專業團隊亦會提供最合適的建議予客戶, 協助客戶建設最理想的家居。', 1, 1),
(4, '億輝(中國)發展有限公司', '億輝擁有多年承辦村屋建築及維修服務的經驗, 服務範圍包括村屋建築、室內室外維修、花園建設及其他各類相關工程等。專業團隊亦會提供最合適的建議予客戶, 協助客戶建設最理想的家居。', 1, 1),
(5, 'Eastford (China) Development Limited ', 'Eastford (China) Development Limited has many years of experience in undertaking village house construction and maintenance services, including village house construction, indoor and outdoor maintenance, garden construction and other related projects. The professional team will also provide the most suitable advice to customers to help customers build the most ideal home.', 2, 1),
(6, 'Eastford (China) Development Limited ', 'Eastford (China) Development Limited has many years of experience in undertaking village house construction and maintenance services, including village house construction, indoor and outdoor maintenance, garden construction and other related projects. The professional team will also provide the most suitable advice to customers to help customers build the most ideal home.', 2, 1),
(7, 'Eastford (China) Development Limited date of establishment', 'Eastford (China) Development Limited has many years of experience in undertaking village house construction and maintenance services, including village house construction, indoor and outdoor maintenance, garden construction and other related projects. The professional team will also provide the most suitable advice to customers to help customers build the most ideal home.', 2, 1),
(9, 'QuesE', 'AnsE', 2, 0),
(10, 'QuesE2', 'AnsE2', 2, 0),
(11, 'QuesE1', 'AnsE1', 2, 0),
(12, 'QuesC2', 'AnsC2', 1, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `tp_yhcard`
--

CREATE TABLE `tp_yhcard` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT '',
  `name` varchar(50) DEFAULT '',
  `deduMoney` int(11) DEFAULT 0,
  `begDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `addDate` datetime DEFAULT NULL,
  `rand` varchar(10) DEFAULT NULL,
  `score` int(11) DEFAULT 0,
  `yhNum` varchar(50) DEFAULT '',
  `status` int(2) DEFAULT 1 COMMENT '1可以0不可以',
  `isdel` int(2) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 傾印資料表的資料 `tp_yhcard`
--

INSERT INTO `tp_yhcard` (`id`, `image`, `name`, `deduMoney`, `begDate`, `endDate`, `addDate`, `rand`, `score`, `yhNum`, `status`, `isdel`) VALUES
(1, 'http://81.71.141.153/beauty/Public/Uploads/2020-09-27/5f6f784a21a7b.png', '111', 10, '2020-10-22', '2020-10-01', '2020-10-01 01:53:07', NULL, 12, '1', 1, 0),
(2, 'http://81.71.141.153/beauty/Public/Uploads//2020-10-15/5f873c6237115.png', '2222', 20, '2020-10-01', '2020-10-31', '2020-10-15 01:58:58', '6742', 20, '2', 1, 0),
(3, 'http://81.71.141.153/beauty/Public/Uploads//2020-11-01/5f9e9cd1ab845.jpg', '11', 11, '2020-11-06', '2020-11-05', '2020-11-01 19:32:33', NULL, 11, 'JXOPPU', 1, 0);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `tp_admin`
--
ALTER TABLE `tp_admin`
  ADD PRIMARY KEY (`uid`) USING BTREE;

--
-- 資料表索引 `tp_cart`
--
ALTER TABLE `tp_cart`
  ADD PRIMARY KEY (`cartId`) USING BTREE;

--
-- 資料表索引 `tp_cate`
--
ALTER TABLE `tp_cate`
  ADD PRIMARY KEY (`cateId`) USING BTREE;

--
-- 資料表索引 `tp_customer`
--
ALTER TABLE `tp_customer`
  ADD PRIMARY KEY (`id`) USING BTREE;

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
-- 資料表索引 `tp_pcset`
--
ALTER TABLE `tp_pcset`
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
-- 資料表索引 `tp_signlist`
--
ALTER TABLE `tp_signlist`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 資料表索引 `tp_signset`
--
ALTER TABLE `tp_signset`
  ADD PRIMARY KEY (`id`) USING BTREE;

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
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_admin`
--
ALTER TABLE `tp_admin`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_cart`
--
ALTER TABLE `tp_cart`
  MODIFY `cartId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_cate`
--
ALTER TABLE `tp_cate`
  MODIFY `cateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_customer`
--
ALTER TABLE `tp_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_getyhcard`
--
ALTER TABLE `tp_getyhcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_goods`
--
ALTER TABLE `tp_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_homebanner`
--
ALTER TABLE `tp_homebanner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_html`
--
ALTER TABLE `tp_html`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_msg`
--
ALTER TABLE `tp_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_order`
--
ALTER TABLE `tp_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_orderitem`
--
ALTER TABLE `tp_orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_pcset`
--
ALTER TABLE `tp_pcset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_schedule`
--
ALTER TABLE `tp_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_score`
--
ALTER TABLE `tp_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_shop`
--
ALTER TABLE `tp_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_signlist`
--
ALTER TABLE `tp_signlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_signset`
--
ALTER TABLE `tp_signset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_system`
--
ALTER TABLE `tp_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_user`
--
ALTER TABLE `tp_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=448;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_wenda`
--
ALTER TABLE `tp_wenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `tp_yhcard`
--
ALTER TABLE `tp_yhcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
