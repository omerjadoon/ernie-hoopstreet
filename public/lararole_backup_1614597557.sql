

CREATE TABLE `abilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT 0,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_scope_index` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO abilities VALUES("1","users_manage","Users manage","","","0","","","2021-02-04 09:48:19","2021-02-04 09:48:19");
INSERT INTO abilities VALUES("2","create_investment","Create investment","","","0","","","2021-02-07 23:20:22","2021-02-07 23:20:22");
INSERT INTO abilities VALUES("3","view_customer_investment","View customer investment","","","0","","","2021-02-08 08:12:23","2021-02-08 08:12:23");
INSERT INTO abilities VALUES("4","is_customer","Is customer","","","0","","","2021-02-08 09:49:58","2021-02-08 09:49:58");
INSERT INTO abilities VALUES("5","is_admin","Is admin","","","0","","","2021-02-08 09:50:58","2021-02-08 09:50:58");



CREATE TABLE `assigned_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restricted_to_id` int(10) unsigned DEFAULT NULL,
  `restricted_to_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `assigned_roles_role_id_index` (`role_id`),
  KEY `assigned_roles_scope_index` (`scope`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO assigned_roles VALUES("2","2","2","App\User","","","");
INSERT INTO assigned_roles VALUES("3","1","1","App\User","","","");
INSERT INTO assigned_roles VALUES("8","2","10","App\User","","","");
INSERT INTO assigned_roles VALUES("9","2","11","App\User","","","");
INSERT INTO assigned_roles VALUES("10","2","12","App\User","","","");
INSERT INTO assigned_roles VALUES("11","2","13","App\User","","","");
INSERT INTO assigned_roles VALUES("12","2","14","App\User","","","");
INSERT INTO assigned_roles VALUES("13","2","15","App\User","","","");
INSERT INTO assigned_roles VALUES("14","2","16","App\User","","","");
INSERT INTO assigned_roles VALUES("15","2","17","App\User","","","");
INSERT INTO assigned_roles VALUES("16","2","18","App\User","","","");
INSERT INTO assigned_roles VALUES("17","2","19","App\User","","","");
INSERT INTO assigned_roles VALUES("18","2","20","App\User","","","");
INSERT INTO assigned_roles VALUES("19","2","21","App\User","","","");
INSERT INTO assigned_roles VALUES("20","2","22","App\User","","","");
INSERT INTO assigned_roles VALUES("21","2","23","App\User","","","");
INSERT INTO assigned_roles VALUES("22","2","24","App\User","","","");
INSERT INTO assigned_roles VALUES("23","2","25","App\User","","","");
INSERT INTO assigned_roles VALUES("24","2","26","App\User","","","");
INSERT INTO assigned_roles VALUES("25","2","27","App\User","","","");
INSERT INTO assigned_roles VALUES("26","2","28","App\User","","","");
INSERT INTO assigned_roles VALUES("27","2","29","App\User","","","");
INSERT INTO assigned_roles VALUES("28","2","30","App\User","","","");
INSERT INTO assigned_roles VALUES("29","2","31","App\User","","","");
INSERT INTO assigned_roles VALUES("30","2","32","App\User","","","");
INSERT INTO assigned_roles VALUES("31","2","33","App\User","","","");
INSERT INTO assigned_roles VALUES("32","2","34","App\User","","","");
INSERT INTO assigned_roles VALUES("33","2","35","App\User","","","");
INSERT INTO assigned_roles VALUES("34","2","36","App\User","","","");
INSERT INTO assigned_roles VALUES("35","2","37","App\User","","","");
INSERT INTO assigned_roles VALUES("36","2","38","App\User","","","");
INSERT INTO assigned_roles VALUES("37","2","39","App\User","","","");
INSERT INTO assigned_roles VALUES("38","2","40","App\User","","","");
INSERT INTO assigned_roles VALUES("39","2","41","App\User","","","");
INSERT INTO assigned_roles VALUES("40","2","42","App\User","","","");
INSERT INTO assigned_roles VALUES("41","2","43","App\User","","","");
INSERT INTO assigned_roles VALUES("42","2","44","App\User","","","");
INSERT INTO assigned_roles VALUES("43","2","45","App\User","","","");
INSERT INTO assigned_roles VALUES("44","2","46","App\User","","","");
INSERT INTO assigned_roles VALUES("45","2","47","App\User","","","");
INSERT INTO assigned_roles VALUES("46","2","48","App\User","","","");
INSERT INTO assigned_roles VALUES("47","2","49","App\User","","","");
INSERT INTO assigned_roles VALUES("48","2","50","App\User","","","");
INSERT INTO assigned_roles VALUES("49","2","51","App\User","","","");
INSERT INTO assigned_roles VALUES("50","2","52","App\User","","","");
INSERT INTO assigned_roles VALUES("51","2","53","App\User","","","");
INSERT INTO assigned_roles VALUES("52","2","54","App\User","","","");
INSERT INTO assigned_roles VALUES("53","2","55","App\User","","","");
INSERT INTO assigned_roles VALUES("54","2","56","App\User","","","");
INSERT INTO assigned_roles VALUES("55","2","57","App\User","","","");
INSERT INTO assigned_roles VALUES("56","2","58","App\User","","","");
INSERT INTO assigned_roles VALUES("57","2","59","App\User","","","");
INSERT INTO assigned_roles VALUES("58","2","60","App\User","","","");
INSERT INTO assigned_roles VALUES("59","2","61","App\User","","","");
INSERT INTO assigned_roles VALUES("60","2","62","App\User","","","");
INSERT INTO assigned_roles VALUES("61","2","63","App\User","","","");
INSERT INTO assigned_roles VALUES("62","2","64","App\User","","","");
INSERT INTO assigned_roles VALUES("63","2","65","App\User","","","");
INSERT INTO assigned_roles VALUES("64","2","66","App\User","","","");
INSERT INTO assigned_roles VALUES("65","2","67","App\User","","","");
INSERT INTO assigned_roles VALUES("66","2","68","App\User","","","");
INSERT INTO assigned_roles VALUES("67","2","69","App\User","","","");
INSERT INTO assigned_roles VALUES("68","2","70","App\User","","","");
INSERT INTO assigned_roles VALUES("69","2","71","App\User","","","");
INSERT INTO assigned_roles VALUES("70","2","72","App\User","","","");
INSERT INTO assigned_roles VALUES("71","2","73","App\User","","","");
INSERT INTO assigned_roles VALUES("72","2","74","App\User","","","");
INSERT INTO assigned_roles VALUES("73","2","75","App\User","","","");
INSERT INTO assigned_roles VALUES("74","2","76","App\User","","","");
INSERT INTO assigned_roles VALUES("75","2","77","App\User","","","");
INSERT INTO assigned_roles VALUES("76","2","78","App\User","","","");
INSERT INTO assigned_roles VALUES("77","2","79","App\User","","","");
INSERT INTO assigned_roles VALUES("78","2","80","App\User","","","");
INSERT INTO assigned_roles VALUES("79","2","81","App\User","","","");
INSERT INTO assigned_roles VALUES("80","2","82","App\User","","","");
INSERT INTO assigned_roles VALUES("81","2","83","App\User","","","");
INSERT INTO assigned_roles VALUES("82","2","84","App\User","","","");
INSERT INTO assigned_roles VALUES("83","2","85","App\User","","","");
INSERT INTO assigned_roles VALUES("84","2","86","App\User","","","");
INSERT INTO assigned_roles VALUES("85","2","87","App\User","","","");
INSERT INTO assigned_roles VALUES("86","2","88","App\User","","","");
INSERT INTO assigned_roles VALUES("87","2","89","App\User","","","");
INSERT INTO assigned_roles VALUES("88","2","90","App\User","","","");
INSERT INTO assigned_roles VALUES("89","2","91","App\User","","","");
INSERT INTO assigned_roles VALUES("90","2","92","App\User","","","");
INSERT INTO assigned_roles VALUES("91","2","93","App\User","","","");
INSERT INTO assigned_roles VALUES("92","2","94","App\User","","","");
INSERT INTO assigned_roles VALUES("93","2","95","App\User","","","");
INSERT INTO assigned_roles VALUES("94","2","96","App\User","","","");
INSERT INTO assigned_roles VALUES("95","2","97","App\User","","","");
INSERT INTO assigned_roles VALUES("96","2","98","App\User","","","");
INSERT INTO assigned_roles VALUES("97","2","99","App\User","","","");
INSERT INTO assigned_roles VALUES("98","2","100","App\User","","","");
INSERT INTO assigned_roles VALUES("99","2","101","App\User","","","");
INSERT INTO assigned_roles VALUES("100","2","102","App\User","","","");
INSERT INTO assigned_roles VALUES("101","2","103","App\User","","","");
INSERT INTO assigned_roles VALUES("102","2","104","App\User","","","");
INSERT INTO assigned_roles VALUES("103","2","105","App\User","","","");
INSERT INTO assigned_roles VALUES("104","2","106","App\User","","","");
INSERT INTO assigned_roles VALUES("105","2","107","App\User","","","");
INSERT INTO assigned_roles VALUES("106","2","108","App\User","","","");
INSERT INTO assigned_roles VALUES("107","2","109","App\User","","","");
INSERT INTO assigned_roles VALUES("108","2","110","App\User","","","");
INSERT INTO assigned_roles VALUES("109","2","111","App\User","","","");
INSERT INTO assigned_roles VALUES("110","2","112","App\User","","","");
INSERT INTO assigned_roles VALUES("111","2","113","App\User","","","");
INSERT INTO assigned_roles VALUES("112","2","114","App\User","","","");
INSERT INTO assigned_roles VALUES("113","2","115","App\User","","","");
INSERT INTO assigned_roles VALUES("114","2","116","App\User","","","");
INSERT INTO assigned_roles VALUES("115","2","117","App\User","","","");
INSERT INTO assigned_roles VALUES("116","2","118","App\User","","","");
INSERT INTO assigned_roles VALUES("117","2","119","App\User","","","");



CREATE TABLE `dividents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `divident_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO dividents VALUES("5","10000","1","2021-02-23 17:39:13","2021-02-23 17:39:13");



CREATE TABLE `investments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `investment_amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `investment_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO investments VALUES("35","50000","","0","0","card","2","2021-02-23 17:37:47","2021-02-23 17:37:47");
INSERT INTO investments VALUES("36","1000","","0","0","card","10","2021-02-23 17:38:25","2021-02-23 17:38:25");
INSERT INTO investments VALUES("37","3196350","","0","0","","48","2021-02-26 23:02:09","2021-02-26 23:02:09");
INSERT INTO investments VALUES("38","15238600","","0","0","","49","2021-02-26 23:04:28","2021-02-26 23:04:28");
INSERT INTO investments VALUES("39","7840300","","0","0","","50","2021-02-26 23:05:40","2021-02-26 23:05:40");
INSERT INTO investments VALUES("40","4038400","","0","0","","51","2021-02-26 23:08:41","2021-02-26 23:08:41");
INSERT INTO investments VALUES("41","7532050","","0","0","","52","2021-02-26 23:10:59","2021-02-26 23:10:59");
INSERT INTO investments VALUES("42","2188850","","0","0","","53","2021-02-26 23:59:58","2021-02-26 23:59:58");
INSERT INTO investments VALUES("43","3627400","","0","0","","54","2021-02-27 00:03:09","2021-02-27 00:03:09");
INSERT INTO investments VALUES("44","1058550","","0","0","","55","2021-02-27 00:06:29","2021-02-27 00:06:29");
INSERT INTO investments VALUES("45","765650","","0","0","","56","2021-02-27 00:15:40","2021-02-27 00:15:40");
INSERT INTO investments VALUES("46","20170800","","0","0","","57","2021-02-27 00:23:09","2021-02-27 00:23:09");
INSERT INTO investments VALUES("47","7121050","","0","0","","58","2021-02-27 00:26:51","2021-02-27 00:26:51");
INSERT INTO investments VALUES("48","7121050","","0","0","","58","2021-02-27 00:28:32","2021-02-27 00:28:32");
INSERT INTO investments VALUES("49","15135850","","0","0","","59","2021-02-27 00:29:45","2021-02-27 00:29:45");
INSERT INTO investments VALUES("50","10409150","","0","0","","60","2021-02-27 00:30:55","2021-02-27 00:30:55");
INSERT INTO investments VALUES("51","14724850","","0","0","","61","2021-02-27 00:31:47","2021-02-27 00:31:47");
INSERT INTO investments VALUES("52","11642200","","0","0","","62","2021-02-27 00:34:35","2021-02-27 00:34:35");
INSERT INTO investments VALUES("53","10820200","","0","0","","63","2021-02-27 00:44:28","2021-02-27 00:44:28");
INSERT INTO investments VALUES("54","700","","0","0","","64","2021-02-27 00:47:47","2021-02-27 00:47:47");
INSERT INTO investments VALUES("55","500","","0","0","","65","2021-02-27 00:48:14","2021-02-27 00:48:14");
INSERT INTO investments VALUES("56","1675050","","0","0","","66","2021-02-27 00:52:40","2021-02-27 00:52:40");
INSERT INTO investments VALUES("57","3421900","","0","0","","66","2021-02-27 00:56:44","2021-02-27 00:56:44");
INSERT INTO investments VALUES("58","650","","0","0","","67","2021-02-27 00:59:33","2021-02-27 00:59:33");
INSERT INTO investments VALUES("59","500","","0","0","","68","2021-02-27 01:18:23","2021-02-27 01:18:23");
INSERT INTO investments VALUES("60","133750","","0","0","","69","2021-02-27 01:18:55","2021-02-27 01:18:55");
INSERT INTO investments VALUES("61","500","","0","0","","70","2021-02-27 01:20:03","2021-02-27 01:20:03");
INSERT INTO investments VALUES("62","500","","0","0","","71","2021-02-27 01:22:46","2021-02-27 01:22:46");
INSERT INTO investments VALUES("63","500","","0","0","","72","2021-02-27 01:24:28","2021-02-27 01:24:28");
INSERT INTO investments VALUES("64","500","","0","0","","73","2021-02-27 01:26:06","2021-02-27 01:26:06");
INSERT INTO investments VALUES("65","500","","0","0","","74","2021-02-27 01:27:25","2021-02-27 01:27:25");
INSERT INTO investments VALUES("66","10849200","","0","0","","75","2021-02-27 01:29:03","2021-02-27 01:29:03");
INSERT INTO investments VALUES("67","14348550","","0","0","","76","2021-02-27 01:31:19","2021-02-27 01:31:19");
INSERT INTO investments VALUES("68","762750","","0","0","","78","2021-02-27 02:12:26","2021-02-27 02:12:26");
INSERT INTO investments VALUES("69","865700","","0","0","","79","2021-02-27 02:16:06","2021-02-27 02:16:06");
INSERT INTO investments VALUES("70","865700","","0","0","","80","2021-02-27 02:17:31","2021-02-27 02:17:31");
INSERT INTO investments VALUES("71","659850","","0","0","","81","2021-02-27 02:18:46","2021-02-27 02:18:46");
INSERT INTO investments VALUES("72","442000","","0","0","","82","2021-02-27 02:21:25","2021-02-27 02:21:25");
INSERT INTO investments VALUES("73","500","","0","0","","83","2021-02-27 02:40:52","2021-02-27 02:40:52");
INSERT INTO investments VALUES("74","500","","0","0","","84","2021-02-27 02:43:49","2021-02-27 02:43:49");
INSERT INTO investments VALUES("75","500","","0","0","","85","2021-02-27 02:45:02","2021-02-27 02:45:02");
INSERT INTO investments VALUES("76","500","","0","0","","86","2021-02-27 02:48:15","2021-02-27 02:48:15");
INSERT INTO investments VALUES("77","500","","0","0","","87","2021-02-27 03:06:07","2021-02-27 03:06:07");
INSERT INTO investments VALUES("78","500","","0","0","","88","2021-02-27 03:11:01","2021-02-27 03:11:01");
INSERT INTO investments VALUES("79","500","","0","0","","89","2021-02-27 03:15:04","2021-02-27 03:15:04");
INSERT INTO investments VALUES("80","500","","0","0","","90","2021-02-27 03:16:15","2021-02-27 03:16:15");
INSERT INTO investments VALUES("81","500","","0","0","","91","2021-02-27 03:18:23","2021-02-27 03:18:23");
INSERT INTO investments VALUES("82","500","","0","0","","92","2021-02-27 03:22:42","2021-02-27 03:22:42");
INSERT INTO investments VALUES("83","500","","0","0","","93","2021-02-27 03:24:13","2021-02-27 03:24:13");
INSERT INTO investments VALUES("84","500","","0","0","","94","2021-02-27 03:26:53","2021-02-27 03:26:53");
INSERT INTO investments VALUES("85","500","","0","0","","95","2021-02-27 03:35:40","2021-02-27 03:35:40");
INSERT INTO investments VALUES("86","500","","0","0","","96","2021-02-27 03:37:30","2021-02-27 03:37:30");
INSERT INTO investments VALUES("87","3850450","","0","0","","97","2021-02-27 03:39:47","2021-02-27 03:39:47");
INSERT INTO investments VALUES("88","500","","0","0","","98","2021-02-27 03:53:26","2021-02-27 03:53:26");
INSERT INTO investments VALUES("89","500","","0","0","","99","2021-02-27 03:55:28","2021-02-27 03:55:28");
INSERT INTO investments VALUES("90","500","","0","0","","100","2021-02-27 03:56:24","2021-02-27 03:56:24");
INSERT INTO investments VALUES("91","500","","0","0","","101","2021-02-27 03:57:10","2021-02-27 03:57:10");
INSERT INTO investments VALUES("92","500","","0","0","","102","2021-02-27 04:00:03","2021-02-27 04:00:03");
INSERT INTO investments VALUES("93","500","","0","0","","103","2021-02-27 04:03:19","2021-02-27 04:03:19");
INSERT INTO investments VALUES("94","500","","0","0","","104","2021-02-27 09:26:58","2021-02-27 09:26:58");
INSERT INTO investments VALUES("95","1380300","","1","1","bank","105","2021-02-27 09:30:39","2021-02-28 22:02:08");
INSERT INTO investments VALUES("96","6835200","","0","0","","106","2021-02-27 09:34:50","2021-02-27 09:34:50");
INSERT INTO investments VALUES("97","8070300","","0","0","","107","2021-02-27 09:36:16","2021-02-27 09:36:16");
INSERT INTO investments VALUES("98","500","","0","0","","108","2021-02-27 09:41:07","2021-02-27 09:41:07");
INSERT INTO investments VALUES("99","4411650","","0","0","","109","2021-02-27 09:47:29","2021-02-27 09:47:29");
INSERT INTO investments VALUES("100","500","","0","0","","110","2021-02-27 09:48:15","2021-02-27 09:48:15");
INSERT INTO investments VALUES("101","530750","","0","0","","111","2021-02-28 21:08:21","2021-02-28 21:08:21");
INSERT INTO investments VALUES("102","164850","","1","1","card","112","2021-02-28 21:11:54","2021-02-28 16:12:50");
INSERT INTO investments VALUES("103","622250","ch_1IPrubJB2dYXcosDcbKYeJfu","1","1","card","113","2021-02-28 21:14:55","2021-02-28 16:15:04");
INSERT INTO investments VALUES("104","500","ch_1IPs1LJB2dYXcosDFa2eMtgk","1","1","card","114","2021-02-28 21:21:53","2021-02-28 16:22:02");
INSERT INTO investments VALUES("105","500","ch_1IPs7mJB2dYXcosDHPxeaYmV","1","1","card","115","2021-02-28 21:28:33","2021-02-28 16:28:42");
INSERT INTO investments VALUES("106","500","ch_1IPsExJB2dYXcosDSQhURved","1","1","card","116","2021-02-28 21:35:47","2021-02-28 16:36:07");
INSERT INTO investments VALUES("107","500","ch_1IPsR9JB2dYXcosDN8vvLeQf","1","1","card","117","2021-02-28 21:48:33","2021-02-28 16:48:44");
INSERT INTO investments VALUES("108","500","ch_1IPvzqJB2dYXcosD1g0iiPe6","1","1","card","118","2021-03-01 01:36:38","2021-02-28 20:36:45");
INSERT INTO investments VALUES("109","500","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-03-01 01:42:35","2021-02-28 21:09:10");
INSERT INTO investments VALUES("110","550","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-02-28 20:59:39","2021-02-28 21:09:10");
INSERT INTO investments VALUES("111","500","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-02-28 21:01:01","2021-02-28 21:09:10");
INSERT INTO investments VALUES("112","500","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-02-28 21:04:13","2021-02-28 21:09:10");
INSERT INTO investments VALUES("113","1000","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-02-28 21:05:46","2021-02-28 21:09:10");
INSERT INTO investments VALUES("114","1000","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-02-28 21:06:35","2021-02-28 21:09:10");
INSERT INTO investments VALUES("115","1000","ch_1IPwVDJB2dYXcosD3fiZPSxs","1","1","card","119","2021-02-28 21:08:43","2021-02-28 21:09:10");



CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES("1","2014_10_12_000000_create_users_table","1");
INSERT INTO migrations VALUES("2","2014_10_12_100000_create_password_resets_table","1");
INSERT INTO migrations VALUES("3","2017_07_13_082418_create_bouncer_tables","1");
INSERT INTO migrations VALUES("4","2021_02_08_085307_create_investment_table","2");
INSERT INTO migrations VALUES("5","2021_02_08_093219_change_investment_name_to_investments_table","3");
INSERT INTO migrations VALUES("6","2021_02_08_114352_add_address_country_to_users_table","4");
INSERT INTO migrations VALUES("7","2021_02_23_153425_create_divident_table","5");
INSERT INTO migrations VALUES("8","2021_02_23_154150_create_user_divident_table","5");
INSERT INTO migrations VALUES("9","2021_02_23_155833_change_divident_name_to_dividents","6");
INSERT INTO migrations VALUES("10","2021_02_23_155932_change_user_divident_name_to_user_dividents","6");
INSERT INTO migrations VALUES("11","2021_02_23_163736_add_total_investment_to_investments_table","7");



CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ability_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `entity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `permissions_ability_id_index` (`ability_id`),
  KEY `permissions_scope_index` (`scope`),
  CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permissions VALUES("7","2","2","roles","0","");
INSERT INTO permissions VALUES("8","3","2","roles","0","");
INSERT INTO permissions VALUES("9","4","2","roles","0","");
INSERT INTO permissions VALUES("10","1","1","roles","0","");
INSERT INTO permissions VALUES("11","2","1","roles","0","");
INSERT INTO permissions VALUES("12","5","1","roles","0","");



CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`,`scope`),
  KEY `roles_scope_index` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","administrator","Administrator","","","2021-02-04 09:48:19","2021-02-04 09:48:19");
INSERT INTO roles VALUES("2","Customer","Customer","","","2021-02-07 23:20:57","2021-02-07 23:20:57");



CREATE TABLE `user_dividents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `divident_recieved` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO user_dividents VALUES("79","0","1","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("80","0.00001021","2","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("81","0.0000012","10","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("82","0","11","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("83","0","12","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("84","0","13","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("85","0","14","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("86","0","15","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("87","0","16","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("88","0","17","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("89","0","18","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("90","0","19","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("91","0","20","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("92","0","21","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("93","0","22","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("94","0","23","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("95","0","24","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("96","0","25","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("97","0","26","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("98","0","27","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("99","0","28","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("100","0","29","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("101","0","30","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("102","0","31","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("103","0","32","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("104","0","33","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("105","0","34","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("106","0","35","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("107","0","36","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("108","0","37","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("109","0","38","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("110","0","39","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("111","0","40","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("112","0","41","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("113","0","42","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("114","0","43","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("115","0","44","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("116","0","45","2021-02-23 22:39:13","2021-02-23 22:39:13");
INSERT INTO user_dividents VALUES("117","0","46","2021-02-23 22:39:13","2021-02-23 22:39:13");



CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Name',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_investment` int(11) NOT NULL DEFAULT 0,
  `accredited` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `income` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `net_worth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agreement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `remember_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES("1","Admin","admin@hoopstret.com","$2y$10$LvV/uJQq0FpbDyccyWd1we4281XubQTZQ1T5X7HTcoyWUZaKytKom","","","","","0","0","","","0","","2021-02-04 09:48:19","2021-02-07 23:22:17");
INSERT INTO users VALUES("2","Omer Khan","customer@hoopstreet.com","$2y$10$SjzWZNHB7.KbDFnZxyJI1eQJDzwi/SaO.pEyOgp3HMstjcakK1wEi","Haripur,Pakistan","California","Pakistan","0312353534545","51050","1","www.google.com","www.google.com","1","","2021-02-07 23:21:50","2021-02-23 17:37:47");
INSERT INTO users VALUES("10","Test User","test@gmail.com","$2y$10$DZjO1Ect5DuSTF7BAFVBme4AtkTDhSF/pfSKsZGyly0v4jFjb1mBS","","Texas","","","6000","0","","","0","","2021-02-16 15:41:41","2021-02-23 17:38:25");
INSERT INTO users VALUES("11","Robin","robin@hoopstret.com","$2y$10$E1D2lLaY0Bh4phIfJA05mu6/fLJtMK/TVAZtQhp4dDhj9EqWMxAwm","","Alaska","","","0","0","","","0","","2021-02-16 15:59:16","2021-02-16 15:59:16");
INSERT INTO users VALUES("12","Edward","edward@hoopstret.com","$2y$10$XXk6SlKF349kyirhKZRRReN/BRYaBcU2qVhCBZGEJdjkuQjGCsGNW","","Alaska","","","0","1","","","0","","2021-02-16 16:16:03","2021-02-16 16:16:03");
INSERT INTO users VALUES("13","John","john@hoopstret.com","$2y$10$fanYCGFL5UaDyJU8QIShxey3dbJ95RqlVqFFzYtYrCcK/Rl5IshxG","","","","","0","0","","","0","","2021-02-16 16:37:06","2021-02-16 16:37:06");
INSERT INTO users VALUES("14","Name","omertest@gmail.com","$2y$10$5cABrzDAz.KcWLmhksoV3uiYuO3zn4sYN2iYTHX2vDJ8YT3Wo1CBy","","","","","0","0","","","0","","2021-02-22 03:56:07","2021-02-22 03:56:07");
INSERT INTO users VALUES("15","Name","test1122@gmail.com","$2y$10$rgB8d5OKvfddGnAxe0Tcv.0czJZAj2NdImZDj9NDOxaIn1W/kHqgS","","","","","0","0","","","0","","2021-02-22 04:18:12","2021-02-22 04:18:12");
INSERT INTO users VALUES("16","Name","ome5656r@gmail.com","$2y$10$MV.cfbO3EkQu9mGxBncI7.xiaBwLj.KDzRAUhmC6AgqQFX.p0aIOe","","","","","0","0","","","0","","2021-02-22 04:20:46","2021-02-22 04:20:46");
INSERT INTO users VALUES("17","Name","gtht@gmail.com","$2y$10$utUL0yhOA3oNYP/46YvOr.YIn5vbiTQkSCcM36CDbUgJSpykiEr6G","","","","","0","0","","","0","","2021-02-22 04:28:49","2021-02-22 04:28:49");
INSERT INTO users VALUES("18","Name","jhjdfh@gmail.com","$2y$10$GJLkWmwlWF.opSUISoiMF.RoBHc3f8cBojMfP0BoJU/GTWKUSunyq","","","","","0","0","","","0","","2021-02-22 04:29:41","2021-02-22 04:29:41");
INSERT INTO users VALUES("19","Name","ommm@gmail.com","$2y$10$ssvBRRT8kgBmOuisGVS4OuvruNcUseq4ULLyI21ibTTcBfvxX/RZ2","","","","","0","0","","","0","","2021-02-22 04:52:15","2021-02-22 04:52:15");
INSERT INTO users VALUES("20","Name","ometytr@gmail.com","$2y$10$AiI9Dh.gmKnecbjNBQQBeegxru4xkyIOjhJIfY5m7Ftc2qJTqQdZG","","","","","0","0","","","0","","2021-02-22 04:53:25","2021-02-22 04:53:25");
INSERT INTO users VALUES("21","Name","omeruyu@gmail.com","$2y$10$29FSe46CPArWNht8g0MR4uG8cVupQ25dJWHMnCOAr2qhRuAj3UDJG","","","","","0","0","","","0","","2021-02-22 04:54:39","2021-02-22 04:54:39");
INSERT INTO users VALUES("22","Name","omerfgfgfg@gmail.com","$2y$10$JjIIcnei1u9Mff4BurZ6t.oiTrqXazlrNXmpwlulsbebC4qi8x5k2","","","","","0","0","","","0","","2021-02-22 04:56:18","2021-02-22 04:56:18");
INSERT INTO users VALUES("23","Name","omer555@gmail.com","$2y$10$K/ibUE5cNH1/e8ZL7jket.EQ4DLc3X8J18vuruOMND7EU/4AFqD52","","","","","0","0","","","0","","2021-02-22 04:57:40","2021-02-22 04:57:40");
INSERT INTO users VALUES("24","Name","omerftfgfg@gmail.com","$2y$10$NsWu7H5I6ERzmaObbW63S.EDLo1JLvpkXTzNKvg4cQ8CFgCq/s5wK","","","","","0","0","","","0","","2021-02-22 04:58:36","2021-02-22 04:58:36");
INSERT INTO users VALUES("25","Name","omerfdgfdfg@gmail.com","$2y$10$6/FwHtTz0RSEVs5NDlRm/.T/uiRONuSJB2JNaqVp9DBUl72RJr7A.","","","","","0","0","","","0","","2021-02-22 05:00:03","2021-02-22 05:00:03");
INSERT INTO users VALUES("26","Name","omerhgfghfdd@gmail.com","$2y$10$5VutcwuHRcI2m.fko5SWnOc1q9xAVdAqBKAz.naxXO3udK6iFGclm","","","","","0","0","","","0","","2021-02-22 05:01:51","2021-02-22 05:01:51");
INSERT INTO users VALUES("27","Name","omhghgher@gmail.com","$2y$10$4Nse9wqzZ61Q3EEKROg28.sgHpkEZUVfTVqF6llpKFrBts7NprT7G","","","","","0","0","","","0","","2021-02-22 05:03:23","2021-02-22 05:03:23");
INSERT INTO users VALUES("28","Name","omer@gmail.com","$2y$10$rezmusYlh2/gUbRYuxD0XeQPoYUqT1fWpVlnefnoERulKIw5IAn62","","","","","0","0","","","0","","2021-02-22 05:09:37","2021-02-22 05:09:37");
INSERT INTO users VALUES("29","Name","omerghtry656@gmail.com","$2y$10$cUcJT7ODLGAa/84OhWZi7eUm4F0f.MWCj9zb1RRkQz9SiWiESg9VG","","","","","0","0","","","0","","2021-02-22 05:13:41","2021-02-22 05:13:41");
INSERT INTO users VALUES("30","Name","omerhfhg@gmail.com","$2y$10$EncmASIqyIGo6OO9E90FEedRlA3kKdm2/eRJEG0zTkqKLb/CvtcUy","","","","","0","0","","","0","","2021-02-22 05:16:57","2021-02-22 05:16:57");
INSERT INTO users VALUES("31","Name","omertyyt@gmail.com","$2y$10$.fdXTQK2xMnox3upakcX0ug3ruRAl0SIGerDYJjKbBQPERGmm4Au2","","","","","0","0","","","0","","2021-02-22 05:25:38","2021-02-22 05:25:38");
INSERT INTO users VALUES("32","Name","ometeer@gmail.com","$2y$10$eCrrs9a83Ioy3uVqgcKo1eodlLZS3h.2qsSOF46aTGJxUSDSdpOhy","","","","","0","0","","","0","","2021-02-22 05:27:00","2021-02-22 05:27:00");
INSERT INTO users VALUES("33","Name","omeghghyyr@gmail.com","$2y$10$u.UvLnEVM..nIHqbVKvCDOoQFLK1Lv9BrSDVdDW0fnGyDjF1icRMa","","","","","0","0","","","0","","2021-02-22 05:29:59","2021-02-22 05:29:59");
INSERT INTO users VALUES("34","Name","omfgfer@gmail.com","$2y$10$gpuXLQlVmBOxB5PgGYEFJepPa4cwyO4HURLFhzbfgnmrZLJn5C5xq","","","","","0","0","","","0","","2021-02-22 05:31:55","2021-02-22 05:31:55");
INSERT INTO users VALUES("35","Name","omerkkk@gmail.com","$2y$10$M/hItpjsBbOF/U7.uPlXDOb1fDh5EnPZvb2s0lhbnGt5JB0lWBzC6","","","","","0","0","","","0","","2021-02-22 05:52:02","2021-02-22 05:52:02");
INSERT INTO users VALUES("36","Name","omerkhann@gmail.com","$2y$10$boW0wwi9froTMXMEkPkm5e8gVit0tZRH1P2FfwiL.m6IiM04q5dM2","","","","","0","0","","","0","","2021-02-22 05:59:04","2021-02-22 05:59:04");
INSERT INTO users VALUES("37","Name","omerkkj@gmail.com","$2y$10$XgwvQeVotGZvv5qrhzXB1exYtkpg0/Q1wbCmogyLf0WTMZx5qu3qe","","","","","0","0","","","0","","2021-02-22 06:02:55","2021-02-22 06:02:55");
INSERT INTO users VALUES("38","Omer kh","omer5555@gmail.com","$2y$10$bihG0SrKL92n9CrBjtgpIuuV6RHH5MA1tKeop.pPaj34Wf475qmCq","hhh","AL","","0342342424","0","0","","","0","","2021-02-22 06:10:50","2021-02-22 06:10:59");
INSERT INTO users VALUES("39","Omer","omer112121@gmail.com","$2y$10$8ww3g5WAHCzKzpqO1E7WQ.b5CdGFgfEhprn5pvJjBexBvjLGm/IOK","hhh","KS","","0342342424","0","0","","","0","","2021-02-22 06:34:56","2021-02-22 06:35:24");
INSERT INTO users VALUES("40","Omer","omehnjhr@gmail.com","$2y$10$XQbt7qAirOujmnb7M.E51.f2AEfpmxQ.F6NFbmu2KkvGEm2/j.DuO","hhh","AL","","0342342424","0","0","","","0","","2021-02-22 06:38:01","2021-02-22 06:38:56");
INSERT INTO users VALUES("41","Name","omergthgh@gmail.com","$2y$10$cwRMMAj.5I/LMAyGnbBmnOy..QnkVFMEp7gkJ0PSND7ChDj8IMoxu","","","","","0","0","","","0","","2021-02-22 07:02:55","2021-02-22 07:02:55");
INSERT INTO users VALUES("42","Name","omeffghfr@gmail.com","$2y$10$mdpNs9qMdcelLVSMhBHYHuKVpZgLHLXlHfWzDj/xwP7YWciwkUBc6","","","","","0","0","","","0","","2021-02-22 07:05:28","2021-02-22 07:05:28");
INSERT INTO users VALUES("43","Omer fgjh","ofghygfhgmer@gmail.com","$2y$10$29Q5OqE7UDEJXsr3trrMy.3rHRxLa8sdyJJRwySqIvvHC9OCFZuI.","hhh","AL","","0342342424","0","0","","","0","","2021-02-22 07:09:55","2021-02-22 07:10:04");
INSERT INTO users VALUES("44","Omer khan","omehbhkjr@gmail.com","$2y$10$9q7SfU7d/MmWQR0dWn1pZ.9NlmHJTSuiA3Q1TKum9ZeNgOCHoM7gW","hhh","AL","","0342342424","0","0","","","0","","2021-02-22 07:12:33","2021-02-22 07:12:46");
INSERT INTO users VALUES("45","Omer","ome8oi987or@gmail.com","$2y$10$FU7H55GwdtFPcyk5R1gDUOm9X5vUaRGoXeWZgzk.tSzPwo377aISC","hhh gtgrvtr","LA","","0342342424","0","1","","","0","","2021-02-22 07:15:24","2021-02-22 11:14:56");
INSERT INTO users VALUES("46","Omer khan","omefgsdfr@gmail.com","$2y$10$mgfezu1tLYXk6TcLZ0AK1eDCAX3xT.s6jFAjEaqx3yI01gSia/ukO","hhh","LA","","0342342424565","0","1","","","0","","2021-02-22 11:20:08","2021-02-22 11:20:41");
INSERT INTO users VALUES("47","Name","ome5465565r@gmail.com","$2y$10$7sV11sW9y9iahjxbQjLSFufmWrt69jzaoFBoN/S/8KHK2ps95yPM2","","","","","0","0","","","0","","2021-02-25 10:50:24","2021-02-25 10:50:24");
INSERT INTO users VALUES("48","Omer","omerrrrrrrrrrrr@gmail.com","$2y$10$TKq.gmDDwPDtODcuMcie5OGqG0NeX2HNie2ojA7ic5g.dAWVwknL2","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 18:02:01","2021-02-26 18:02:28");
INSERT INTO users VALUES("49","Omer","omerioujhg@gmail.com","$2y$10$XCqAFPLF35l9KzCUbnsjd.xnWX4VGUOvc5iCv0LbQHkqjk/2DEmve","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 18:04:22","2021-02-26 18:04:33");
INSERT INTO users VALUES("50","Omer","omertrtrr@gmail.com","$2y$10$Rbh0fr/Q8mOrRrEzQ/FU.O5o1uMPqUxfxEQQTMawgr2yv.KP5k62y","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 18:05:37","2021-02-26 18:06:55");
INSERT INTO users VALUES("51","Omer","ojyujhgmer@gmail.com","$2y$10$KwiD7Egt5YzLeIARPVJJ7upelAW5bZa6xwh/aGranTdVfkcqY5PY.","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 18:08:38","2021-02-26 18:08:46");
INSERT INTO users VALUES("52","Omer","ometyhtghr@gmail.com","$2y$10$v6leiEh0hO0YjlvWiTNP4uXKkMTPFxflb53Fi0RuNx43W3YPhghEa","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 18:10:56","2021-02-26 18:11:02");
INSERT INTO users VALUES("53","Omer","omerrtr@gmail.com","$2y$10$IxH7OTj5Za2rXQ95un5IQuwMDDosF.VlsyBKQvH9pT.X5qvUX3qde","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 18:59:54","2021-02-26 19:00:03");
INSERT INTO users VALUES("54","Omer","om454er@gmail.com","$2y$10$RJa205sRBnllvH3IeVKYvuJrJLzRL7p/USqEf0qgGiLRwdX24Ftwi","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:03:04","2021-02-26 19:03:13");
INSERT INTO users VALUES("55","Omer","omer5656@gmail.com","$2y$10$qQd9GudYG11RmgXUcUi34.EQ05mgus5PKQi52Qf8jfMD0keCa9Ene","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:06:25","2021-02-26 19:06:33");
INSERT INTO users VALUES("56","Omer","omer5rty5tyttht@gmail.com","$2y$10$jZlbMyyJEEp41dfIppetguBJHOMYDud10te.7d6jrgQH6NRHIUIRa","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:15:32","2021-02-26 19:15:43");
INSERT INTO users VALUES("57","Omer","omer7777@gmail.com","$2y$10$3adoE1JYb.u4OVYQqoI3meHifzIjPUU7ssOM.njRS5lhOJgmLDkT.","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:23:03","2021-02-26 19:23:12");
INSERT INTO users VALUES("58","Omer","omer787676@gmail.com","$2y$10$I8516R1upe1JIAYZUJnlv.YcJflnrnrX3MXpQyib7v4od.JAFwSCC","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:26:44","2021-02-26 19:26:53");
INSERT INTO users VALUES("59","Omer","omuuer@gmail.com","$2y$10$TsWz4y9bcUxK3dntQQ2O3OaoHgh7vst.dLfYddAK.DJTiL94GhFAG","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:29:41","2021-02-26 19:29:48");
INSERT INTO users VALUES("60","Omer","omer45@gmail.com","$2y$10$95hS8Ygw7QceS3oAVQAObeUCQL05CNIVCcPQip6W.Lv1JoXvheywS","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:30:52","2021-02-26 19:30:58");
INSERT INTO users VALUES("61","Omer","o455mer@gmail.com","$2y$10$.7keAoE26Kxcv90pxYCXvOHdgaKMVCGjnHJHRYHnpwgbSgoRl8T1a","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:31:44","2021-02-26 19:31:49");
INSERT INTO users VALUES("62","Omer","omeujfyhgfr@gmail.com","$2y$10$Pz9Q1xkXVS0kF1HWaYVcteT1SDsZQdogHsypRO6C4bqDUy1Kf6lw2","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:34:31","2021-02-26 19:34:38");
INSERT INTO users VALUES("63","Omer","ome45464r@gmail.com","$2y$10$5kF3TncDbIUkY6I9meHAU.PTIX.Wl6hrHtBctM0YjNuJLh/UZY83e","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:44:25","2021-02-26 19:44:31");
INSERT INTO users VALUES("64","Omer","omer454@gmail.com","$2y$10$zUX0DUEMsgKEZc.GeiBUJ.jiFPVxlIwyatUBNrYs5J7llnSxl62Zm","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:47:33","2021-02-26 19:47:51");
INSERT INTO users VALUES("65","Omer","o67676mer@gmail.com","$2y$10$DcEweS8UWgT2Ytkq366Kleel6A7R6psl/s0AmlPWWgZ.6qPiC5eo.","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:48:10","2021-02-26 19:48:14");
INSERT INTO users VALUES("66","Omer","om445er@gmail.com","$2y$10$bXCYzsz370jbykMxJRGP2.OwQMMgT7bf7Edojp7DD47xH7oRV8o5i","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:52:35","2021-02-26 19:56:47");
INSERT INTO users VALUES("67","Omer","ojhkgjmer@gmail.com","$2y$10$DgVREDqujAPMqNDcI.wQwe4ofODagHA1/29W.36liWGaVLikOTnEi","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 19:59:23","2021-02-26 19:59:36");
INSERT INTO users VALUES("68","Omer","omer56@gmail.com","$2y$10$8u521SvqlSZqhWySSbDdP.dGXyT7t9j0ZVOBgE5Q6/BC/Dr0DWEp6","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:18:20","2021-02-26 20:18:23");
INSERT INTO users VALUES("69","Omer","ome56576r@gmail.com","$2y$10$RFo69emFuniMZlT28c64TewAHeSeExTk0Oef770S3Cj2pTW8x3WSC","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:18:46","2021-02-26 20:18:58");
INSERT INTO users VALUES("70","Omer ghh","ome56676576r@gmail.com","$2y$10$8kp94X4JpzZA9S2Zam5RoeWi0BYFsraRQdgVXfXnb4n2SoF7IOZVS","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:20:00","2021-02-26 20:20:08");
INSERT INTO users VALUES("71","Omer","omergggggg@gmail.com","$2y$10$tFpyYID.CHjJVOrf2RPoZeW/OgX4mg9.s.fQN5Y/5G9DGBUd8/7gi","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:22:42","2021-02-26 20:22:51");
INSERT INTO users VALUES("72","Omer","om6766er@gmail.com","$2y$10$9VxNcrUjCQtzQlBSWxJmdusiMRYTtrsVYda9FkhmwGZ3G2330ruwi","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:24:24","2021-02-26 20:24:30");
INSERT INTO users VALUES("73","Omer","omuuiityer@gmail.com","$2y$10$C2JJ2j2vEWS/kztyW4K4s.J5SLQL1ctmu1oaxcJEvrEsUSkxFqxI6","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:26:03","2021-02-26 20:26:08");
INSERT INTO users VALUES("74","Omer","omytghjghjer@gmail.com","$2y$10$2aj.bPRJrFBE.0JjGQ2hp.ac7kthUSbYzvuPpafilWbeL9m5OudoS","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:27:23","2021-02-26 20:27:28");
INSERT INTO users VALUES("75","Omer","ome676hyhjr@gmail.com","$2y$10$Wt.AYc17LfUEVGd11VW0r.B.InfZ5wQXsAC2lgz42.8rUEOafeB5m","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:28:58","2021-02-26 20:29:11");
INSERT INTO users VALUES("76","Omer","omfghfhger@gmail.com","$2y$10$vzjrVWE0UeiGohWROwLF9.TkzH93oHyc6WygW..M750agSxpiuzRq","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 20:31:15","2021-02-26 20:31:21");
INSERT INTO users VALUES("77","Name","oyugfmer@gmail.com","$2y$10$yrCxytqlaYzuiF2fgeRNSula7yuacWfCJpZnlFUWGaogXVwISYFQ.","","","","","0","0","","","0","","2021-02-26 21:10:40","2021-02-26 21:10:40");
INSERT INTO users VALUES("78","Omer","om76u7tyer@gmail.com","$2y$10$TOVj4Sp7Qu1/wAtJq2gklu3z6ho1ooFT7JKa/VXip/wRrQyfRbuve","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 21:12:16","2021-02-26 21:12:29");
INSERT INTO users VALUES("79","Omer","om8787er@gmail.com","$2y$10$VX26CQ1/mIfHIKcGOiokBORlL8WnpJoY1USwxqRjkvyYnvVHMO5Ai","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 21:15:59","2021-02-26 21:16:09");
INSERT INTO users VALUES("80","Omer","omhjjer@gmail.com","$2y$10$myr2je3H2V8BA9Y7BmB41Oqg7D9uqhs2wxeL1YR25JpCuGIwA8tbi","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 21:17:25","2021-02-26 21:17:33");
INSERT INTO users VALUES("81","Omer","omuuuuer@gmail.com","$2y$10$6EzL4zrj8o.4YITCwukgx.2nJ3kcMc8ChTRyuza8vsTGl9VJHsNu6","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 21:18:41","2021-02-26 21:18:48");
INSERT INTO users VALUES("82","Omer","om56565er@gmail.com","$2y$10$b2XOxlUx28sGQee22K3we.eKiy46UQdg8Qv82urd.d3OJDicWbPY2","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 21:21:19","2021-02-26 21:21:27");
INSERT INTO users VALUES("83","Name","omegtttttr@gmail.com","$2y$10$VmZA2I15XEf1E0gY7fv0Q.wflvXUup0K/NuiK4OW7zVgZbdC/L6XS","","","","","0","0","","","0","","2021-02-26 21:40:47","2021-02-26 21:40:47");
INSERT INTO users VALUES("84","Name","ome55466r@gmail.com","$2y$10$2hhWXvuRKC3x8VpuTe8wKO89QrrotnHn077rF6tY186A2s4DCOzfm","","","","","0","0","","","0","","2021-02-26 21:43:46","2021-02-26 21:43:46");
INSERT INTO users VALUES("85","Name","om456tgvfr@gmail.com","$2y$10$kgdwcLT0Z9ZF.B5j82zsaeA22ZKQ36ayMZgxqo8qHLaqqdXnmo0qm","","","","","0","0","","","0","","2021-02-26 21:45:00","2021-02-26 21:45:00");
INSERT INTO users VALUES("86","Omer","omuuuuuuer@gmail.com","$2y$10$mGcnbJfRf0..Uot/CrPyieaVoOHgDCD62jkbAEHCqqpR6X0P8JQV.","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 21:48:13","2021-02-26 21:48:30");
INSERT INTO users VALUES("87","Omer","omytyrthder@gmail.com","$2y$10$bjXc75J6wVzdl7hlV2bM2eus1OxBZbsSYAtFYt6RFyz2UipCWkpW.","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:06:04","2021-02-26 22:06:21");
INSERT INTO users VALUES("88","Omer","o87678tgvj@gmail.com","$2y$10$gVzk0/vjLRr5m6BCAqtnJ.G85dDvNQOJ5zoXrCP8VNWqlaUVtJhNO","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:10:59","2021-02-26 22:11:12");
INSERT INTO users VALUES("89","Omer","ombnbnbner@gmail.com","$2y$10$RqxHEKxCPqFdZJI7RGSxbeNIxB3qso6xcaUGt58xOLf2Uk.Yh.4KC","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:15:02","2021-02-26 22:15:17");
INSERT INTO users VALUES("90","Omer","omgggggggggger@gmail.com","$2y$10$EE.0O3ePXRZCLssZK59FJObt3RjSHQsGcg4nyoTRdQXhLO834r33S","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:16:12","2021-02-26 22:16:26");
INSERT INTO users VALUES("91","Omer","omyhfger@gmail.com","$2y$10$EoumkkhRwuoP07Ic1ZHf6.dfrrWCHkl4TV7k9MkCv92L9iwFXXEHq","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:18:21","2021-02-26 22:18:34");
INSERT INTO users VALUES("92","Omer","otgggfhfgmer@gmail.com","$2y$10$/LoSjiwvJFqC0/OHq2tmK.qxAHhCWdXfFaY7oN36XbdWVx4LWs/rK","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:22:39","2021-02-26 22:22:54");
INSERT INTO users VALUES("93","Omer","oghbghgfmer@gmail.com","$2y$10$wIT0Rkc5Io3KJpivd7UNGevDrktbRg./GkwoAbSNbTRHKQQtEbW/S","hhh","AL","","0342342424","0","1","","","0","","2021-02-26 22:24:10","2021-02-26 22:24:23");
INSERT INTO users VALUES("94","Omer","omghghder@gmail.com","$2y$10$t2tN5s8ZIwfxHauddyBJOOftoOhl8F2/jnYqJuAlY4I3dVJoZjRX2","hhh","AL","","0342342424","0","1","E:\xampp\htdocs\hoop\public/uploads/a.html.html","","0","","2021-02-26 22:26:50","2021-02-26 22:27:03");
INSERT INTO users VALUES("95","Name","omegfhfghccr@gmail.com","$2y$10$0XXzCpnsK73LY7K7lEBxru5pr2JhqqSMZ9kK8YAgYqw5tT7TvGeQu","","","","","0","0","","","0","","2021-02-26 22:35:35","2021-02-26 22:35:35");
INSERT INTO users VALUES("96","Omer","omreytertfder@gmail.com","$2y$10$n0Wr03XK4ocNkIugIAYoh.NqxxISCrDmxiifwzqUsT7ilRtIrZPta","hhh","AL","","0342342424","0","1","E:\xampp\htdocs\hoop\public/uploads/agreement nn.pdf.pdf","E:\xampp\htdocs\hoop\public/uploads/___National Testing Service___SST IT.pdf.pdf","0","","2021-02-26 22:37:28","2021-02-26 22:37:51");
INSERT INTO users VALUES("97","Omer","om76uiuer@gmail.com","$2y$10$U28Fb5bAbds58m9UmkclFOXsdDaQhaGae4CFO7xXD14AfdOuf8KRi","hhh","AL","","0342342424","0","1","E:\xampp\htdocs\hoop\public/uploads/agreement nn.pdf.pdf","E:\xampp\htdocs\hoop\public/uploads/a.html.html","0","","2021-02-26 22:39:44","2021-02-26 22:40:10");
INSERT INTO users VALUES("98","Omer","ombnbbnver@gmail.com","$2y$10$rId2qz6gTCpGFHnl5rUBk.G4cT2ikTmlkLDo1.CSJdIYxfSiwQEJe","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 22:53:20","2021-02-26 22:53:30");
INSERT INTO users VALUES("99","Omer","ombnbbnvber@gmail.com","$2y$10$LV3uSZdEMTK77Ohyf0bf6uM47E43YWzl0MkOa5lfguZIlic44JEOu","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 22:55:25","2021-02-26 22:55:31");
INSERT INTO users VALUES("100","Omer","obgfghgmer@gmail.com","$2y$10$LiU.U1umMP1kHNwJeUeYI.XMgXybOn5jGuFK3wIGJnS65ihaqqGF.","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 22:56:22","2021-02-26 22:56:27");
INSERT INTO users VALUES("101","Omer","omngmhgjjjer@gmail.com","$2y$10$67qqIm6sTntz2cjXRnHVfuyXH/AoQM8GbaeHVLbsxBH6iQ3ZTMnWS","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 22:57:08","2021-02-26 22:57:13");
INSERT INTO users VALUES("102","Omer","omghggfer@gmail.com","$2y$10$.3p40AYdt7Omy/Sk.WMA3eQqIDNbBn.bEz8P5/X9iwu2jt7BmBYg.","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 23:00:01","2021-02-26 23:00:06");
INSERT INTO users VALUES("103","Omer","omeryuyghgg@gmail.com","$2y$10$4oPba6gXHrxPV.EWDLMNxucgucry28BNYLOK8R4caWOyTqp9mrVLu","hhh","AL","","0342342424","0","0","","","0","","2021-02-26 23:03:17","2021-02-26 23:03:22");
INSERT INTO users VALUES("104","Omer","omecccr@gmail.com","$2y$10$txdoLcdYRBDtIWNVTD4EHe5EI7puG2rc/Qa0F9jfScFWYCqAC.wcq","hhh","AL","","0342342424","0","0","","","0","","2021-02-27 04:26:55","2021-02-27 04:27:01");
INSERT INTO users VALUES("105","Omer","omttttttttttr@gmail.com","$2y$10$xvEj4b9dl48Ihw5A5nCNJ.EOD.GccCclZg6rhJaWbRebj3c/UNBQa","hhh","AL","","0342342424","1380300","0","","","0","","2021-02-27 04:30:33","2021-02-28 22:02:08");
INSERT INTO users VALUES("106","Omer","omehhhhhhhr@gmail.com","$2y$10$Zx5RPR.Ng30ivXcpx/9H3Ousk0qSRfzovRO8yDgRCNajRIUFZ7wp2","hhh","AL","","0342342424","0","0","","","0","","2021-02-27 04:34:47","2021-02-27 04:34:53");
INSERT INTO users VALUES("107","Omer","omer@gddmail.com","$2y$10$fjvP/3N4nyPtI4S/OmUJx.LBXzYLJER.rlyEzxjW41C3qI/mA/CdW","hhh","AL","","0342342424","0","0","","","0","","2021-02-27 04:36:12","2021-02-27 04:36:18");
INSERT INTO users VALUES("108","Omer","omerrr@gmail.com","$2y$10$8ApltXhoqIpAWI50me.XKuK1MeF6amMV4FMhplKIrgjjSv7ssGmta","hhh","AL","","0342342424","0","0","","","0","","2021-02-27 04:41:05","2021-02-27 04:41:18");
INSERT INTO users VALUES("109","Omer","vcomer@gmail.com","$2y$10$MTG.yCpGRT47qOTRDr8JM.oN/M6Ze9pz4dDe.BcX/nNNyGJp8.Bhm","hhh","AL","","0342342424","0","0","","","0","","2021-02-27 04:47:26","2021-02-27 04:47:32");
INSERT INTO users VALUES("110","Omer","omhgggfer@gmail.com","$2y$10$.Jti5TGaeby3yKJ6lHiULOqJkYGXE5Mi/Q2ccRkZKW1Xi9KQvmFzm","hhh","AL","","0342342424","0","0","","","0","","2021-02-27 04:48:13","2021-02-27 04:48:17");
INSERT INTO users VALUES("111","Omer","omerkjkjhkjh@gmail.com","$2y$10$JD0DzGlb43PQ8EK8jrHtmuq5S16aJEMuw./j1LbTWhGBhRlqFlmCS","hhh","FL","","0342342424","0","0","","","0","","2021-02-28 16:07:30","2021-02-28 16:08:34");
INSERT INTO users VALUES("112","Omer khan","omhhhhher@gmail.com","$2y$10$ic7R7j34B7MtuENdg4ENuukebj7votDtOUoPwxwyJvL3.W1TIZCO.","kjdhfkhd hhh","GA","","034234242777","0","1","E:\xampp\htdocs\hoop\public/uploads/___National Testing Service___.pdf.pdf","E:\xampp\htdocs\hoop\public/uploads/discrete probability dstribution.pdf.pdf","0","","2021-02-28 16:11:49","2021-02-28 16:12:41");
INSERT INTO users VALUES("113","Omer","om5555ttt@gmail.com","$2y$10$uEOtdTnAPDcgGhISzKsv6u.aQ4hTLf4mkr4gc2zUlIqX9maSiZl8e","hhh","AL","","0342342424","0","0","","","0","","2021-02-28 16:14:50","2021-02-28 16:14:58");
INSERT INTO users VALUES("114","Omer","omrgfer@gmail.com","$2y$10$WtDAMmjxr8jTSxC6zF/ZquE1By3cH8KA4gJProV3Phz3AYFWUBzAS","hhh","AL","","0342342424","0","0","","","0","","2021-02-28 16:21:51","2021-02-28 16:21:56");
INSERT INTO users VALUES("115","Omer","ome5tgrgegr@gmail.com","$2y$10$wR5HGUUT1xpxg2m9r67uOuL14Cd.TWWY9xy9m3gRImxpyzEAQlq5y","hhh","AL","","0342342424","0","0","","","0","","2021-02-28 16:28:31","2021-02-28 16:28:36");
INSERT INTO users VALUES("116","Omer","omgjgjger@gmail.com","$2y$10$LPUIh8K8wsTTxvzqVXFymubX2VuwC1mTpYqGrLzWnsx47pNDCRxfO","hhh","AL","","0342342424","0","0","","","0","","2021-02-28 16:35:45","2021-02-28 16:35:49");
INSERT INTO users VALUES("117","Omer","omrfgfvdscer@gmail.com","$2y$10$DLntyrFvJkCG6ea0PGVjp.AlcCNoncWFaQPorkC43nlMLDv.8Hioi","hhh","AL","","0342342424","0","0","","","0","","2021-02-28 16:48:31","2021-02-28 16:48:35");
INSERT INTO users VALUES("118","Omer","om7uiuer@gmail.com","$2y$10$LW8yvPvYWXqxKuUhw/FBjeUZVuGv1p82YxZHQ0CXydSYDQREgJHAq","hhh","AL","","0342342424","50000","0","","","0","","2021-02-28 20:36:34","2021-02-28 20:36:45");
INSERT INTO users VALUES("119","Omer","omffffer@gmail.com","$2y$10$wxNaKBvYdMStvhS/Mlj5JeukSdnThT4Jyjh3SEXpTFfjXdsI3ZR82","hhh","AL","","0342342424","1500","0","","","0","","2021-02-28 20:42:25","2021-02-28 21:09:10");

