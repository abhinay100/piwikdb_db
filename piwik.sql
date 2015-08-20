-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 20, 2015 at 05:04 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.27-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `piwik`
--

-- --------------------------------------------------------

--
-- Table structure for table `piwik_access`
--

CREATE TABLE IF NOT EXISTS `piwik_access` (
  `login` varchar(100) NOT NULL,
  `idsite` int(10) unsigned NOT NULL,
  `access` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`login`,`idsite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_archive_numeric_2015_08`
--

CREATE TABLE IF NOT EXISTS `piwik_archive_numeric_2015_08` (
  `idarchive` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `idsite` int(10) unsigned DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `period` tinyint(3) unsigned DEFAULT NULL,
  `ts_archived` datetime DEFAULT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`idarchive`,`name`),
  KEY `index_idsite_dates_period` (`idsite`,`date1`,`date2`,`period`,`ts_archived`),
  KEY `index_period_archived` (`period`,`ts_archived`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwik_archive_numeric_2015_08`
--

INSERT INTO `piwik_archive_numeric_2015_08` (`idarchive`, `name`, `idsite`, `date1`, `date2`, `period`, `ts_archived`, `value`) VALUES
(1, 'done', 1, '2015-08-20', '2015-08-20', 1, '2015-08-20 10:53:43', 3),
(2, 'done', 1, '2015-08-19', '2015-08-19', 1, '2015-08-20 10:53:44', 1),
(3, 'done', 1, '2015-08-20', '2015-08-20', 1, '2015-08-20 11:38:39', 3),
(4, 'done', 1, '2015-08-20', '2015-08-20', 1, '2015-08-20 12:01:30', 3);

-- --------------------------------------------------------

--
-- Table structure for table `piwik_goal`
--

CREATE TABLE IF NOT EXISTS `piwik_goal` (
  `idsite` int(11) NOT NULL,
  `idgoal` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `match_attribute` varchar(20) NOT NULL,
  `pattern` varchar(255) NOT NULL,
  `pattern_type` varchar(10) NOT NULL,
  `case_sensitive` tinyint(4) NOT NULL,
  `allow_multiple` tinyint(4) NOT NULL,
  `revenue` float NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idsite`,`idgoal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_logger_message`
--

CREATE TABLE IF NOT EXISTS `piwik_logger_message` (
  `idlogger_message` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `level` varchar(16) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`idlogger_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_log_action`
--

CREATE TABLE IF NOT EXISTS `piwik_log_action` (
  `idaction` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text,
  `hash` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned DEFAULT NULL,
  `url_prefix` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`idaction`),
  KEY `index_type_hash` (`type`,`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_log_conversion`
--

CREATE TABLE IF NOT EXISTS `piwik_log_conversion` (
  `idvisit` int(10) unsigned NOT NULL,
  `idsite` int(10) unsigned NOT NULL,
  `idvisitor` binary(8) NOT NULL,
  `server_time` datetime NOT NULL,
  `idaction_url` int(11) DEFAULT NULL,
  `idlink_va` int(11) DEFAULT NULL,
  `idgoal` int(10) NOT NULL,
  `buster` int(10) unsigned NOT NULL,
  `idorder` varchar(100) DEFAULT NULL,
  `items` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  `location_longitude` float(10,6) DEFAULT NULL,
  `location_latitude` float(10,6) DEFAULT NULL,
  `location_region` char(2) DEFAULT NULL,
  `location_country` char(3) NOT NULL,
  `location_city` varchar(255) DEFAULT NULL,
  `visitor_returning` tinyint(1) NOT NULL,
  `visitor_days_since_order` smallint(5) unsigned NOT NULL,
  `visitor_count_visits` smallint(5) unsigned NOT NULL,
  `visitor_days_since_first` smallint(5) unsigned NOT NULL,
  `referer_type` tinyint(1) unsigned DEFAULT NULL,
  `referer_name` varchar(70) DEFAULT NULL,
  `referer_keyword` varchar(255) DEFAULT NULL,
  `revenue` float DEFAULT NULL,
  `revenue_discount` float DEFAULT NULL,
  `revenue_shipping` float DEFAULT NULL,
  `revenue_subtotal` float DEFAULT NULL,
  `revenue_tax` float DEFAULT NULL,
  `custom_var_k1` varchar(200) DEFAULT NULL,
  `custom_var_v1` varchar(200) DEFAULT NULL,
  `custom_var_k2` varchar(200) DEFAULT NULL,
  `custom_var_v2` varchar(200) DEFAULT NULL,
  `custom_var_k3` varchar(200) DEFAULT NULL,
  `custom_var_v3` varchar(200) DEFAULT NULL,
  `custom_var_k4` varchar(200) DEFAULT NULL,
  `custom_var_v4` varchar(200) DEFAULT NULL,
  `custom_var_k5` varchar(200) DEFAULT NULL,
  `custom_var_v5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idvisit`,`idgoal`,`buster`),
  UNIQUE KEY `unique_idsite_idorder` (`idsite`,`idorder`),
  KEY `index_idsite_datetime` (`idsite`,`server_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_log_conversion_item`
--

CREATE TABLE IF NOT EXISTS `piwik_log_conversion_item` (
  `idsite` int(10) unsigned NOT NULL,
  `idvisitor` binary(8) NOT NULL,
  `server_time` datetime NOT NULL,
  `idvisit` int(10) unsigned NOT NULL,
  `idorder` varchar(100) NOT NULL,
  `idaction_sku` int(10) unsigned NOT NULL,
  `idaction_name` int(10) unsigned NOT NULL,
  `idaction_category` int(10) unsigned NOT NULL,
  `idaction_category2` int(10) unsigned NOT NULL,
  `idaction_category3` int(10) unsigned NOT NULL,
  `idaction_category4` int(10) unsigned NOT NULL,
  `idaction_category5` int(10) unsigned NOT NULL,
  `price` float NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `deleted` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`idvisit`,`idorder`,`idaction_sku`),
  KEY `index_idsite_servertime` (`idsite`,`server_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_log_link_visit_action`
--

CREATE TABLE IF NOT EXISTS `piwik_log_link_visit_action` (
  `idlink_va` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idsite` int(10) unsigned NOT NULL,
  `idvisitor` binary(8) NOT NULL,
  `idvisit` int(10) unsigned NOT NULL,
  `idaction_url_ref` int(10) unsigned DEFAULT '0',
  `idaction_name_ref` int(10) unsigned NOT NULL,
  `custom_float` float DEFAULT NULL,
  `server_time` datetime NOT NULL,
  `idaction_name` int(10) unsigned DEFAULT NULL,
  `idaction_url` int(10) unsigned DEFAULT NULL,
  `time_spent_ref_action` int(10) unsigned NOT NULL,
  `idaction_event_action` int(10) unsigned DEFAULT NULL,
  `idaction_event_category` int(10) unsigned DEFAULT NULL,
  `idaction_content_interaction` int(10) unsigned DEFAULT NULL,
  `idaction_content_name` int(10) unsigned DEFAULT NULL,
  `idaction_content_piece` int(10) unsigned DEFAULT NULL,
  `idaction_content_target` int(10) unsigned DEFAULT NULL,
  `custom_var_k1` varchar(200) DEFAULT NULL,
  `custom_var_v1` varchar(200) DEFAULT NULL,
  `custom_var_k2` varchar(200) DEFAULT NULL,
  `custom_var_v2` varchar(200) DEFAULT NULL,
  `custom_var_k3` varchar(200) DEFAULT NULL,
  `custom_var_v3` varchar(200) DEFAULT NULL,
  `custom_var_k4` varchar(200) DEFAULT NULL,
  `custom_var_v4` varchar(200) DEFAULT NULL,
  `custom_var_k5` varchar(200) DEFAULT NULL,
  `custom_var_v5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idlink_va`),
  KEY `index_idvisit` (`idvisit`),
  KEY `index_idsite_servertime` (`idsite`,`server_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_log_profiling`
--

CREATE TABLE IF NOT EXISTS `piwik_log_profiling` (
  `query` text NOT NULL,
  `count` int(10) unsigned DEFAULT NULL,
  `sum_time_ms` float DEFAULT NULL,
  UNIQUE KEY `query` (`query`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_log_visit`
--

CREATE TABLE IF NOT EXISTS `piwik_log_visit` (
  `idvisit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idsite` int(10) unsigned NOT NULL,
  `idvisitor` binary(8) NOT NULL,
  `visit_last_action_time` datetime NOT NULL,
  `config_id` binary(8) NOT NULL,
  `location_ip` varbinary(16) NOT NULL,
  `location_longitude` float(10,6) DEFAULT NULL,
  `location_latitude` float(10,6) DEFAULT NULL,
  `location_region` char(2) DEFAULT NULL,
  `visitor_localtime` time NOT NULL,
  `location_country` char(3) NOT NULL,
  `location_city` varchar(255) DEFAULT NULL,
  `config_device_type` tinyint(100) DEFAULT NULL,
  `config_device_model` varchar(100) DEFAULT NULL,
  `config_os` char(3) NOT NULL,
  `config_os_version` varchar(100) DEFAULT NULL,
  `visit_total_events` smallint(5) unsigned NOT NULL,
  `visitor_days_since_last` smallint(5) unsigned NOT NULL,
  `config_quicktime` tinyint(1) NOT NULL,
  `config_pdf` tinyint(1) NOT NULL,
  `config_realplayer` tinyint(1) NOT NULL,
  `config_silverlight` tinyint(1) NOT NULL,
  `config_windowsmedia` tinyint(1) NOT NULL,
  `config_java` tinyint(1) NOT NULL,
  `config_gears` tinyint(1) NOT NULL,
  `config_resolution` varchar(9) NOT NULL,
  `config_cookie` tinyint(1) NOT NULL,
  `config_director` tinyint(1) NOT NULL,
  `config_flash` tinyint(1) NOT NULL,
  `config_device_brand` varchar(100) DEFAULT NULL,
  `config_browser_version` varchar(20) NOT NULL,
  `visitor_returning` tinyint(1) NOT NULL,
  `visitor_days_since_order` smallint(5) unsigned NOT NULL,
  `visitor_count_visits` smallint(5) unsigned NOT NULL,
  `visit_entry_idaction_name` int(11) unsigned NOT NULL,
  `visit_entry_idaction_url` int(11) unsigned NOT NULL,
  `visit_first_action_time` datetime NOT NULL,
  `visitor_days_since_first` smallint(5) unsigned NOT NULL,
  `visit_total_time` smallint(5) unsigned NOT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  `visit_goal_buyer` tinyint(1) NOT NULL,
  `visit_goal_converted` tinyint(1) NOT NULL,
  `visit_exit_idaction_name` int(11) unsigned NOT NULL,
  `visit_exit_idaction_url` int(11) unsigned DEFAULT '0',
  `referer_url` text NOT NULL,
  `location_browser_lang` varchar(20) NOT NULL,
  `config_browser_engine` varchar(10) NOT NULL,
  `config_browser_name` varchar(10) NOT NULL,
  `referer_type` tinyint(1) unsigned DEFAULT NULL,
  `referer_name` varchar(70) DEFAULT NULL,
  `visit_total_actions` smallint(5) unsigned NOT NULL,
  `visit_total_searches` smallint(5) unsigned NOT NULL,
  `referer_keyword` varchar(255) DEFAULT NULL,
  `location_provider` varchar(100) DEFAULT NULL,
  `custom_var_k1` varchar(200) DEFAULT NULL,
  `custom_var_v1` varchar(200) DEFAULT NULL,
  `custom_var_k2` varchar(200) DEFAULT NULL,
  `custom_var_v2` varchar(200) DEFAULT NULL,
  `custom_var_k3` varchar(200) DEFAULT NULL,
  `custom_var_v3` varchar(200) DEFAULT NULL,
  `custom_var_k4` varchar(200) DEFAULT NULL,
  `custom_var_v4` varchar(200) DEFAULT NULL,
  `custom_var_k5` varchar(200) DEFAULT NULL,
  `custom_var_v5` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idvisit`),
  KEY `index_idsite_config_datetime` (`idsite`,`config_id`,`visit_last_action_time`),
  KEY `index_idsite_datetime` (`idsite`,`visit_last_action_time`),
  KEY `index_idsite_idvisitor` (`idsite`,`idvisitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_option`
--

CREATE TABLE IF NOT EXISTS `piwik_option` (
  `option_name` varchar(255) NOT NULL,
  `option_value` longtext NOT NULL,
  `autoload` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwik_option`
--

INSERT INTO `piwik_option` (`option_name`, `option_value`, `autoload`) VALUES
('MobileMessaging_DelegatedManagement', 'false', 0),
('piwikUrl', 'http://localhost/', 1),
('PrivacyManager.doNotTrackEnabled', '1', 0),
('PrivacyManager.ipAnonymizerEnabled', '1', 0),
('SitesManager_DefaultTimezone', 'Asia/Kolkata', 0),
('UpdateCheck_LastTimeChecked', '1440067420', 1),
('UpdateCheck_LatestVersion', '2.14.3', 0),
('UsersManager.lastSeen.admin', '1440072065', 1),
('version_Actions', '2.14.3', 1),
('version_Annotations', '2.14.3', 1),
('version_API', '2.14.3', 1),
('version_BulkTracking', '2.14.3', 1),
('version_Contents', '2.14.3', 1),
('version_core', '2.14.3', 1),
('version_CoreAdminHome', '2.14.3', 1),
('version_CoreConsole', '2.14.3', 1),
('version_CoreHome', '2.14.3', 1),
('version_CorePluginsAdmin', '2.14.3', 1),
('version_CoreUpdater', '2.14.3', 1),
('version_CoreVisualizations', '2.14.3', 1),
('version_CustomVariables', '2.14.3', 1),
('version_Dashboard', '2.14.3', 1),
('version_DevicePlugins', '2.14.3', 1),
('version_DevicesDetection', '2.14.3', 1),
('version_Diagnostics', '2.14.3', 1),
('version_Ecommerce', '2.14.3', 1),
('version_Events', '2.14.3', 1),
('version_ExampleAPI', '1.0', 1),
('version_ExamplePlugin', '0.1.0', 1),
('version_ExampleRssWidget', '1.0', 1),
('version_Feedback', '2.14.3', 1),
('version_Goals', '2.14.3', 1),
('version_ImageGraph', '2.14.3', 1),
('version_Insights', '2.14.3', 1),
('version_Installation', '2.14.3', 1),
('version_Intl', '2.14.3', 1),
('version_LanguagesManager', '2.14.3', 1),
('version_LeftMenu', '2.14.3', 1),
('version_Live', '2.14.3', 1),
('version_Login', '2.14.3', 1),
('version_log_conversion.revenue', 'float default NULL', 1),
('version_log_conversion.revenue_discount', 'float default NULL', 1),
('version_log_conversion.revenue_shipping', 'float default NULL', 1),
('version_log_conversion.revenue_subtotal', 'float default NULL', 1),
('version_log_conversion.revenue_tax', 'float default NULL', 1),
('version_log_link_visit_action.idaction_content_interaction', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.idaction_content_name', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.idaction_content_piece', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.idaction_content_target', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.idaction_event_action', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.idaction_event_category', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.idaction_name', 'INTEGER(10) UNSIGNED', 1),
('version_log_link_visit_action.idaction_url', 'INTEGER(10) UNSIGNED DEFAULT NULL', 1),
('version_log_link_visit_action.server_time', 'DATETIME NOT NULL', 1),
('version_log_link_visit_action.time_spent_ref_action', 'INTEGER(10) UNSIGNED NOT NULL', 1),
('version_log_visit.config_browser_engine', 'VARCHAR(10) NOT NULL', 1),
('version_log_visit.config_browser_name', 'VARCHAR(10) NOT NULL', 1),
('version_log_visit.config_browser_version', 'VARCHAR(20) NOT NULL', 1),
('version_log_visit.config_cookie', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_device_brand', 'VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL', 1),
('version_log_visit.config_device_model', 'VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL', 1),
('version_log_visit.config_device_type', 'TINYINT( 100 ) NULL DEFAULT NULL', 1),
('version_log_visit.config_director', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_flash', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_gears', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_java', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_os', 'CHAR(3) NOT NULL', 1),
('version_log_visit.config_os_version', 'VARCHAR( 100 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL', 1),
('version_log_visit.config_pdf', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_quicktime', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_realplayer', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_resolution', 'VARCHAR(9) NOT NULL', 1),
('version_log_visit.config_silverlight', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.config_windowsmedia', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.location_browser_lang', 'VARCHAR(20) NOT NULL', 1),
('version_log_visit.location_city', 'varchar(255) DEFAULT NULL1', 1),
('version_log_visit.location_country', 'CHAR(3) NOT NULL1', 1),
('version_log_visit.location_latitude', 'float(10, 6) DEFAULT NULL1', 1),
('version_log_visit.location_longitude', 'float(10, 6) DEFAULT NULL1', 1),
('version_log_visit.location_region', 'char(2) DEFAULT NULL1', 1),
('version_log_visit.referer_keyword', 'VARCHAR(255) NULL1', 1),
('version_log_visit.referer_name', 'VARCHAR(70) NULL1', 1),
('version_log_visit.referer_type', 'TINYINT(1) UNSIGNED NULL1', 1),
('version_log_visit.referer_url', 'TEXT NOT NULL', 1),
('version_log_visit.user_id', 'VARCHAR(200) NULL', 1),
('version_log_visit.visitor_count_visits', 'SMALLINT(5) UNSIGNED NOT NULL1', 1),
('version_log_visit.visitor_days_since_first', 'SMALLINT(5) UNSIGNED NOT NULL1', 1),
('version_log_visit.visitor_days_since_last', 'SMALLINT(5) UNSIGNED NOT NULL', 1),
('version_log_visit.visitor_days_since_order', 'SMALLINT(5) UNSIGNED NOT NULL1', 1),
('version_log_visit.visitor_localtime', 'TIME NOT NULL', 1),
('version_log_visit.visitor_returning', 'TINYINT(1) NOT NULL1', 1),
('version_log_visit.visit_entry_idaction_name', 'INTEGER(11) UNSIGNED NOT NULL', 1),
('version_log_visit.visit_entry_idaction_url', 'INTEGER(11) UNSIGNED NOT NULL', 1),
('version_log_visit.visit_exit_idaction_name', 'INTEGER(11) UNSIGNED NOT NULL', 1),
('version_log_visit.visit_exit_idaction_url', 'INTEGER(11) UNSIGNED NULL DEFAULT 0', 1),
('version_log_visit.visit_first_action_time', 'DATETIME NOT NULL', 1),
('version_log_visit.visit_goal_buyer', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.visit_goal_converted', 'TINYINT(1) NOT NULL', 1),
('version_log_visit.visit_total_actions', 'SMALLINT(5) UNSIGNED NOT NULL', 1),
('version_log_visit.visit_total_events', 'SMALLINT(5) UNSIGNED NOT NULL', 1),
('version_log_visit.visit_total_searches', 'SMALLINT(5) UNSIGNED NOT NULL', 1),
('version_log_visit.visit_total_time', 'SMALLINT(5) UNSIGNED NOT NULL', 1),
('version_MobileMessaging', '2.14.3', 1),
('version_Monolog', '2.14.3', 1),
('version_Morpheus', '2.14.3', 1),
('version_MultiSites', '2.14.3', 1),
('version_Overlay', '2.14.3', 1),
('version_PrivacyManager', '2.14.3', 1),
('version_Provider', '2.14.3', 1),
('version_Proxy', '2.14.3', 1),
('version_Referrers', '2.14.3', 1),
('version_Resolution', '2.14.3', 1),
('version_ScheduledReports', '2.14.3', 1),
('version_SegmentEditor', '2.14.3', 1),
('version_SEO', '2.14.3', 1),
('version_SitesManager', '2.14.3', 1),
('version_Transitions', '2.14.3', 1),
('version_UserCountry', '2.14.3', 1),
('version_UserCountryMap', '2.14.3', 1),
('version_UserLanguage', '2.14.3', 1),
('version_UsersManager', '2.14.3', 1),
('version_VisitFrequency', '2.14.3', 1),
('version_VisitorInterest', '2.14.3', 1),
('version_VisitsSummary', '2.14.3', 1),
('version_VisitTime', '2.14.3', 1),
('version_WebsiteMeasurable', '2.14.3', 1),
('version_Widgetize', '2.14.3', 1),
('version_ZenMode', '2.14.3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `piwik_report`
--

CREATE TABLE IF NOT EXISTS `piwik_report` (
  `idreport` int(11) NOT NULL AUTO_INCREMENT,
  `idsite` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `idsegment` int(11) DEFAULT NULL,
  `period` varchar(10) NOT NULL,
  `hour` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `format` varchar(10) NOT NULL,
  `reports` text NOT NULL,
  `parameters` text,
  `ts_created` timestamp NULL DEFAULT NULL,
  `ts_last_sent` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idreport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_segment`
--

CREATE TABLE IF NOT EXISTS `piwik_segment` (
  `idsegment` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `definition` text NOT NULL,
  `login` varchar(100) NOT NULL,
  `enable_all_users` tinyint(4) NOT NULL DEFAULT '0',
  `enable_only_idsite` int(11) DEFAULT NULL,
  `auto_archive` tinyint(4) NOT NULL DEFAULT '0',
  `ts_created` timestamp NULL DEFAULT NULL,
  `ts_last_edit` timestamp NULL DEFAULT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idsegment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_sequence`
--

CREATE TABLE IF NOT EXISTS `piwik_sequence` (
  `name` varchar(120) NOT NULL,
  `value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwik_sequence`
--

INSERT INTO `piwik_sequence` (`name`, `value`) VALUES
('piwik_archive_numeric_2015_08', 4);

-- --------------------------------------------------------

--
-- Table structure for table `piwik_session`
--

CREATE TABLE IF NOT EXISTS `piwik_session` (
  `id` varchar(255) NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `data` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_site`
--

CREATE TABLE IF NOT EXISTS `piwik_site` (
  `idsite` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `main_url` varchar(255) NOT NULL,
  `ts_created` timestamp NULL DEFAULT NULL,
  `ecommerce` tinyint(4) DEFAULT '0',
  `sitesearch` tinyint(4) DEFAULT '1',
  `sitesearch_keyword_parameters` text NOT NULL,
  `sitesearch_category_parameters` text NOT NULL,
  `timezone` varchar(50) NOT NULL,
  `currency` char(3) NOT NULL,
  `excluded_ips` text NOT NULL,
  `excluded_parameters` text NOT NULL,
  `excluded_user_agents` text NOT NULL,
  `group` varchar(250) NOT NULL,
  `type` varchar(255) NOT NULL,
  `keep_url_fragment` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idsite`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `piwik_site`
--

INSERT INTO `piwik_site` (`idsite`, `name`, `main_url`, `ts_created`, `ecommerce`, `sitesearch`, `sitesearch_keyword_parameters`, `sitesearch_category_parameters`, `timezone`, `currency`, `excluded_ips`, `excluded_parameters`, `excluded_user_agents`, `group`, `type`, `keep_url_fragment`) VALUES
(1, 'avni', 'http://avni.io', '2015-08-20 17:47:42', 0, 1, '', '', 'Asia/Kolkata', 'USD', '', '', '', '', 'website', 0),
(2, 'ellipsonic', 'http://ellipsonic.com', '2015-08-20 19:02:23', 0, 1, '', '', 'Asia/Kolkata', 'USD', '', '', '', '', 'website', 0);

-- --------------------------------------------------------

--
-- Table structure for table `piwik_site_setting`
--

CREATE TABLE IF NOT EXISTS `piwik_site_setting` (
  `idsite` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext NOT NULL,
  PRIMARY KEY (`idsite`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_site_url`
--

CREATE TABLE IF NOT EXISTS `piwik_site_url` (
  `idsite` int(10) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`idsite`,`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_user`
--

CREATE TABLE IF NOT EXISTS `piwik_user` (
  `login` varchar(100) NOT NULL,
  `password` char(32) NOT NULL,
  `alias` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `token_auth` char(32) NOT NULL,
  `superuser_access` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `date_registered` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`login`),
  UNIQUE KEY `uniq_keytoken` (`token_auth`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piwik_user`
--

INSERT INTO `piwik_user` (`login`, `password`, `alias`, `email`, `token_auth`, `superuser_access`, `date_registered`) VALUES
('admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'abhinay212@gmail.com', '90871c8584ddf2265f54553a305b6ae1', 1, '2015-08-20 17:44:51'),
('anonymous', '', 'anonymous', 'anonymous@example.org', 'anonymous', 0, '2015-08-20 17:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `piwik_user_dashboard`
--

CREATE TABLE IF NOT EXISTS `piwik_user_dashboard` (
  `login` varchar(100) NOT NULL,
  `iddashboard` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `layout` text NOT NULL,
  PRIMARY KEY (`login`,`iddashboard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `piwik_user_language`
--

CREATE TABLE IF NOT EXISTS `piwik_user_language` (
  `login` varchar(100) NOT NULL,
  `language` varchar(10) NOT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
