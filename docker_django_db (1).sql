-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 172.25.0.3
-- Generation Time: May 26, 2019 at 04:01 AM
-- Server version: 5.6.43
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docker_django_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessrecords`
--

CREATE TABLE `accessrecords` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `webpage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'Librarians'),
(1, 'Library Members');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add question', 7, 'add_question'),
(26, 'Can change question', 7, 'change_question'),
(27, 'Can delete question', 7, 'delete_question'),
(28, 'Can view question', 7, 'view_question'),
(29, 'Can add choice', 8, 'add_choice'),
(30, 'Can change choice', 8, 'change_choice'),
(31, 'Can delete choice', 8, 'delete_choice'),
(32, 'Can view choice', 8, 'view_choice'),
(33, 'Can add topic', 9, 'add_topic'),
(34, 'Can change topic', 9, 'change_topic'),
(35, 'Can delete topic', 9, 'delete_topic'),
(36, 'Can view topic', 9, 'view_topic'),
(37, 'Can add web page', 10, 'add_webpage'),
(38, 'Can change web page', 10, 'change_webpage'),
(39, 'Can delete web page', 10, 'delete_webpage'),
(40, 'Can view web page', 10, 'view_webpage'),
(41, 'Can add access records', 11, 'add_accessrecords'),
(42, 'Can change access records', 11, 'change_accessrecords'),
(43, 'Can delete access records', 11, 'delete_accessrecords'),
(44, 'Can view access records', 11, 'view_accessrecords'),
(45, 'Can add users', 12, 'add_users'),
(46, 'Can change users', 12, 'change_users'),
(47, 'Can delete users', 12, 'delete_users'),
(48, 'Can view users', 12, 'view_users'),
(49, 'Can add post', 13, 'add_post'),
(50, 'Can change post', 13, 'change_post'),
(51, 'Can delete post', 13, 'delete_post'),
(52, 'Can view post', 13, 'view_post'),
(53, 'Can add comment', 14, 'add_comment'),
(54, 'Can change comment', 14, 'change_comment'),
(55, 'Can delete comment', 14, 'delete_comment'),
(56, 'Can view comment', 14, 'view_comment'),
(57, 'Can add genre', 15, 'add_genre'),
(58, 'Can change genre', 15, 'change_genre'),
(59, 'Can delete genre', 15, 'delete_genre'),
(60, 'Can view genre', 15, 'view_genre'),
(61, 'Can add book', 16, 'add_book'),
(62, 'Can change book', 16, 'change_book'),
(63, 'Can delete book', 16, 'delete_book'),
(64, 'Can view book', 16, 'view_book'),
(65, 'Can add language', 17, 'add_language'),
(66, 'Can change language', 17, 'change_language'),
(67, 'Can delete language', 17, 'delete_language'),
(68, 'Can view language', 17, 'view_language'),
(69, 'Can add book instance', 18, 'add_bookinstance'),
(70, 'Can change book instance', 18, 'change_bookinstance'),
(71, 'Can delete book instance', 18, 'delete_bookinstance'),
(72, 'Can view book instance', 18, 'view_bookinstance'),
(73, 'Can add author', 19, 'add_author'),
(74, 'Can change author', 19, 'change_author'),
(75, 'Can delete author', 19, 'delete_author'),
(76, 'Can view author', 19, 'view_author');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$kc0u7zuBRqIr$ByPFH12tKJOQkmZqxC1QJIs/Aue8YYTiBfJa8RzWA6g=', '2019-05-25 01:40:04.839554', 1, 'admin', '', '', '', 1, 1, '2019-05-16 02:56:07.857190'),
(2, 'pbkdf2_sha256$120000$pSvyG4DFXzON$uUgw8UkjYXl93fW0O7WCzab/qcNicihtc5v89zLM0OU=', '2019-05-25 04:23:36.653338', 0, 'mikegreat', '', '', '', 0, 1, '2019-05-16 06:26:13.000000'),
(3, 'pbkdf2_sha256$120000$3LOXmfoc8TFP$r+T49eTPrmexYH5Vc2TuUKj4giPaqex8QWJ7uxnO2bo=', NULL, 0, 'Seun', '', '', '', 0, 1, '2019-05-16 06:29:19.000000'),
(4, 'pbkdf2_sha256$120000$YnvUpxZNMP51$5q+AGNe10ZvFIoS5tpdFufqP+tsBBbrnxVOlcckhBmc=', '2019-05-19 14:41:48.139594', 0, 'mike', '', '', '', 0, 1, '2019-05-19 14:41:47.423378');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `post_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `publish_date` datetime(6) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_author`
--

CREATE TABLE `catalog_author` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `date_of_death` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_author`
--

INSERT INTO `catalog_author` (`id`, `first_name`, `last_name`, `date_of_birth`, `date_of_death`) VALUES
(1, 'Micheal', 'Ojemoron', '2019-05-16', '2019-05-16'),
(2, 'Tayo', 'Ojo', '2019-05-16', '2019-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_book`
--

CREATE TABLE `catalog_book` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `summary` longtext NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_book`
--

INSERT INTO `catalog_book` (`id`, `title`, `isbn`, `summary`, `author_id`, `language_id`) VALUES
(1, '(Django) How to run test suite in Travis CI', '1111111111111', 'This s the summary', 2, 2),
(2, 'The Tale between two cities', '3333333333333', 'hghoijpokpl\';.\'; ; lm,k,[kpkibygreaweafv', 1, 1),
(3, 'Bookie', '555555555555', 'this a boy', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_bookinstance`
--

CREATE TABLE `catalog_bookinstance` (
  `id` char(32) NOT NULL,
  `imprint` varchar(200) NOT NULL,
  `due_back` date DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrower_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_bookinstance`
--

INSERT INTO `catalog_bookinstance` (`id`, `imprint`, `due_back`, `status`, `book_id`, `borrower_id`) VALUES
('274523b04ee446b78c187d1a9636f3c7', 'ssztvhbkj', '2019-05-31', 'o', 2, 2),
('3124367fa30748a09c81b8c5693618b4', 'uuuh[[[', '2019-05-16', 'a', 2, NULL),
('8009bb652d4a4d6ea04ba3408318907f', 'm,n klnlkm;l', NULL, 'r', 2, 1),
('8f761d61528349e0b6c444620f8dffda', 'Beautifull', NULL, 'm', 1, NULL),
('c1540524233f44ed931358bad5c3b64e', 'kmopkpl[];];\']\'', '2019-05-16', 'r', 1, NULL),
('dbbb515daf47448095a3e15492822ba9', 'ttyhbjokl', '2019-05-16', 'o', 1, NULL),
('e5dae96d7bb1420b8f3933f3b1e08314', 'yeeeeeeeeee', '2019-03-08', 'o', 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_book_genre`
--

CREATE TABLE `catalog_book_genre` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_book_genre`
--

INSERT INTO `catalog_book_genre` (`id`, `book_id`, `genre_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(4, 2, 1),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_genre`
--

CREATE TABLE `catalog_genre` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_genre`
--

INSERT INTO `catalog_genre` (`id`, `name`) VALUES
(1, 'Science Fiction'),
(2, 'Mystery');

-- --------------------------------------------------------

--
-- Table structure for table `catalog_language`
--

CREATE TABLE `catalog_language` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalog_language`
--

INSERT INTO `catalog_language` (`id`, `name`) VALUES
(1, 'English'),
(2, 'French');

-- --------------------------------------------------------

--
-- Table structure for table `choice`
--

CREATE TABLE `choice` (
  `id` int(11) NOT NULL,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-05-16 02:56:35.558191', '1', 'Ojemoron, Micheal', 1, '[{\"added\": {}}]', 19, 1),
(2, '2019-05-16 02:56:45.714043', '2', 'Ojo, Tayo', 1, '[{\"added\": {}}]', 19, 1),
(3, '2019-05-16 02:56:56.265057', '1', 'Science Fiction', 1, '[{\"added\": {}}]', 15, 1),
(4, '2019-05-16 02:57:06.204610', '2', 'Mystery', 1, '[{\"added\": {}}]', 15, 1),
(5, '2019-05-16 02:57:30.909237', '1', 'English', 1, '[{\"added\": {}}]', 17, 1),
(6, '2019-05-16 02:57:42.676036', '2', 'French', 1, '[{\"added\": {}}]', 17, 1),
(7, '2019-05-16 02:58:11.476600', '1', '(Django) How to run test suite in Travis CI', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"book instance\", \"object\": \"8f761d61-5283-49e0-b6c4-44620f8dffda ((Django) How to run test suite in Travis CI)\"}}, {\"added\": {\"name\": \"book instance\", \"object\": \"dbbb515d-af47-4480-95a3-e15492822ba9 ((Django) How to run test suite in Travis CI)\"}}, {\"added\": {\"name\": \"book instance\", \"object\": \"c1540524-233f-44ed-9313-58bad5c3b64e ((Django) How to run test suite in Travis CI)\"}}]', 16, 1),
(8, '2019-05-16 02:59:11.922898', '2', 'The Tale between two cities', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"book instance\", \"object\": \"8009bb65-2d4a-4d6e-a04b-a3408318907f (The Tale between two cities)\"}}, {\"added\": {\"name\": \"book instance\", \"object\": \"3124367f-a307-48a0-9c81-b8c5693618b4 (The Tale between two cities)\"}}, {\"added\": {\"name\": \"book instance\", \"object\": \"274523b0-4ee4-46b7-8c18-7d1a9636f3c7 (The Tale between two cities)\"}}]', 16, 1),
(9, '2019-05-16 06:21:25.886912', '1', 'Library Members', 1, '[{\"added\": {}}]', 3, 1),
(10, '2019-05-16 06:26:13.918940', '2', 'mikegreat', 1, '[{\"added\": {}}]', 4, 1),
(11, '2019-05-16 06:28:44.249059', '2', 'mikegreat', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 4, 1),
(12, '2019-05-16 06:29:20.041586', '3', 'Seun', 1, '[{\"added\": {}}]', 4, 1),
(13, '2019-05-16 06:29:52.357676', '2', 'Librarians', 1, '[{\"added\": {}}]', 3, 1),
(14, '2019-05-16 06:30:13.872968', '3', 'Seun', 2, '[{\"changed\": {\"fields\": [\"groups\"]}}]', 4, 1),
(15, '2019-05-18 03:54:27.761700', '1', 'Ojemoron, Micheal', 2, '[{\"added\": {\"name\": \"book\", \"object\": \"Bookie\"}}, {\"changed\": {\"name\": \"book\", \"object\": \"The Tale between two cities\", \"fields\": [\"genre\"]}}]', 19, 1),
(16, '2019-05-25 01:42:32.272651', '274523b0-4ee4-46b7-8c18-7d1a9636f3c7', '274523b0-4ee4-46b7-8c18-7d1a9636f3c7 (The Tale between two cities)', 2, '[{\"changed\": {\"fields\": [\"due_back\", \"borrower\"]}}]', 18, 1),
(17, '2019-05-25 02:07:21.407857', 'e5dae96d-7bb1-420b-8f39-33f3b1e08314', 'e5dae96d-7bb1-420b-8f39-33f3b1e08314 (Bookie)', 1, '[{\"added\": {}}]', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(14, 'blog', 'comment'),
(13, 'blog', 'post'),
(19, 'catalog', 'author'),
(16, 'catalog', 'book'),
(18, 'catalog', 'bookinstance'),
(15, 'catalog', 'genre'),
(17, 'catalog', 'language'),
(5, 'contenttypes', 'contenttype'),
(11, 'polls', 'accessrecords'),
(8, 'polls', 'choice'),
(7, 'polls', 'question'),
(9, 'polls', 'topic'),
(12, 'polls', 'users'),
(10, 'polls', 'webpage'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-05-15 05:47:22.666624'),
(2, 'auth', '0001_initial', '2019-05-15 05:47:51.546254'),
(3, 'admin', '0001_initial', '2019-05-15 05:47:57.086726'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-05-15 05:47:57.184801'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-05-15 05:47:57.289453'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-05-15 05:48:00.016557'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-05-15 05:48:01.830839'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-05-15 05:48:03.735318'),
(9, 'auth', '0004_alter_user_username_opts', '2019-05-15 05:48:03.822348'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-05-15 05:48:05.459772'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-05-15 05:48:05.550718'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-05-15 05:48:05.790425'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-05-15 05:48:08.020357'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-05-15 05:48:10.169940'),
(15, 'blog', '0001_initial', '2019-05-15 05:48:18.121952'),
(16, 'blog', '0002_auto_20190509_2232', '2019-05-15 05:48:18.335943'),
(17, 'blog', '0003_auto_20190509_2326', '2019-05-15 05:48:18.447484'),
(18, 'blog', '0004_auto_20190509_2354', '2019-05-15 05:48:18.559680'),
(19, 'blog', '0005_auto_20190511_1849', '2019-05-15 05:48:18.683596'),
(20, 'blog', '0006_auto_20190511_1853', '2019-05-15 05:48:18.805995'),
(21, 'blog', '0007_auto_20190511_1857', '2019-05-15 05:48:18.957428'),
(22, 'blog', '0008_auto_20190511_2117', '2019-05-15 05:48:19.095941'),
(23, 'blog', '0009_auto_20190511_2356', '2019-05-15 05:48:19.216025'),
(24, 'blog', '0010_auto_20190512_0002', '2019-05-15 05:48:19.348897'),
(25, 'blog', '0011_auto_20190512_0340', '2019-05-15 05:48:19.447334'),
(26, 'blog', '0012_auto_20190512_0345', '2019-05-15 05:48:19.548209'),
(27, 'blog', '0013_auto_20190512_0350', '2019-05-15 05:48:19.649885'),
(28, 'blog', '0014_auto_20190512_0404', '2019-05-15 05:48:19.770686'),
(29, 'blog', '0015_auto_20190512_0420', '2019-05-15 05:48:19.900458'),
(30, 'blog', '0016_auto_20190512_0459', '2019-05-15 05:48:20.014533'),
(31, 'blog', '0017_auto_20190512_0505', '2019-05-15 05:48:20.125690'),
(32, 'blog', '0018_auto_20190512_0512', '2019-05-15 05:48:20.249883'),
(33, 'blog', '0019_auto_20190512_0516', '2019-05-15 05:48:20.381521'),
(34, 'blog', '0020_auto_20190512_0723', '2019-05-15 05:48:20.489829'),
(35, 'blog', '0021_auto_20190512_0737', '2019-05-15 05:48:20.589854'),
(36, 'blog', '0022_auto_20190512_0740', '2019-05-15 05:48:20.698770'),
(37, 'blog', '0023_auto_20190512_0744', '2019-05-15 05:48:20.841419'),
(38, 'blog', '0024_auto_20190512_0747', '2019-05-15 05:48:20.981602'),
(39, 'blog', '0025_auto_20190515_0647', '2019-05-15 05:48:21.095490'),
(40, 'catalog', '0001_initial', '2019-05-15 05:48:41.714435'),
(41, 'polls', '0001_initial', '2019-05-15 05:48:47.228430'),
(42, 'polls', '0002_auto_20190201_2301', '2019-05-15 05:48:56.410588'),
(43, 'polls', '0003_auto_20190202_1316', '2019-05-15 05:48:57.109824'),
(44, 'polls', '0004_auto_20190211_0753', '2019-05-15 05:49:01.002723'),
(45, 'polls', '0005_auto_20190211_0757', '2019-05-15 05:49:03.408553'),
(46, 'polls', '0006_users', '2019-05-15 05:49:05.054935'),
(47, 'sessions', '0001_initial', '2019-05-15 05:49:07.043340'),
(48, 'blog', '0026_auto_20190516_0351', '2019-05-16 02:51:13.448998');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('i865bsaoxxtn2g9cpmitnh6bko4uk8fe', 'OTdiODBhZjIxODg1ZTBmNDNjMGRjYjU4ZjExOGM1MjYzOWE1YWI0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMmZiMTkyZmY5ZGEzZDMyNTI2ZjAyY2FiMzBlMGY1M2QzMjg5MmFjIn0=', '2019-06-02 14:43:37.608518');

-- --------------------------------------------------------

--
-- Table structure for table `new_users`
--

CREATE TABLE `new_users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `email_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `polls_question`
--

CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` int(11) NOT NULL,
  `top_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `webpage`
--

CREATE TABLE `webpage` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(200) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessrecords`
--
ALTER TABLE `accessrecords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accessrecords_webpage_id_cb9d204f_fk_webpage_id` (`webpage_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comment_post_id_580e96ef_fk_blog_post_id` (`post_id`);

--
-- Indexes for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `catalog_author`
--
ALTER TABLE `catalog_author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_book`
--
ALTER TABLE `catalog_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_book_author_id_b0849980_fk_catalog_author_id` (`author_id`),
  ADD KEY `catalog_book_language_id_447f859e_fk_catalog_language_id` (`language_id`);

--
-- Indexes for table `catalog_bookinstance`
--
ALTER TABLE `catalog_bookinstance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` (`book_id`),
  ADD KEY `catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id` (`borrower_id`);

--
-- Indexes for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `catalog_book_genre_book_id_genre_id_d15f6922_uniq` (`book_id`,`genre_id`),
  ADD KEY `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` (`genre_id`);

--
-- Indexes for table `catalog_genre`
--
ALTER TABLE `catalog_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_language`
--
ALTER TABLE `catalog_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `choice`
--
ALTER TABLE `choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `new_users`
--
ALTER TABLE `new_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_address` (`email_address`);

--
-- Indexes for table `polls_question`
--
ALTER TABLE `polls_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `top_name` (`top_name`);

--
-- Indexes for table `webpage`
--
ALTER TABLE `webpage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `polls_webpage_topic_id_94a8a70e_fk_polls_topic_id` (`topic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessrecords`
--
ALTER TABLE `accessrecords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comment`
--
ALTER TABLE `blog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post`
--
ALTER TABLE `blog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_author`
--
ALTER TABLE `catalog_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalog_book`
--
ALTER TABLE `catalog_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `catalog_genre`
--
ALTER TABLE `catalog_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `catalog_language`
--
ALTER TABLE `catalog_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `choice`
--
ALTER TABLE `choice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `new_users`
--
ALTER TABLE `new_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `polls_question`
--
ALTER TABLE `polls_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webpage`
--
ALTER TABLE `webpage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accessrecords`
--
ALTER TABLE `accessrecords`
  ADD CONSTRAINT `accessrecords_webpage_id_cb9d204f_fk_webpage_id` FOREIGN KEY (`webpage_id`) REFERENCES `webpage` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `blog_comment`
--
ALTER TABLE `blog_comment`
  ADD CONSTRAINT `blog_comment_post_id_580e96ef_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`);

--
-- Constraints for table `blog_post`
--
ALTER TABLE `blog_post`
  ADD CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `catalog_book`
--
ALTER TABLE `catalog_book`
  ADD CONSTRAINT `catalog_book_author_id_b0849980_fk_catalog_author_id` FOREIGN KEY (`author_id`) REFERENCES `catalog_author` (`id`),
  ADD CONSTRAINT `catalog_book_language_id_447f859e_fk_catalog_language_id` FOREIGN KEY (`language_id`) REFERENCES `catalog_language` (`id`);

--
-- Constraints for table `catalog_bookinstance`
--
ALTER TABLE `catalog_bookinstance`
  ADD CONSTRAINT `catalog_bookinstance_book_id_69f93415_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  ADD CONSTRAINT `catalog_bookinstance_borrower_id_0d71c37c_fk_auth_user_id` FOREIGN KEY (`borrower_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `catalog_book_genre`
--
ALTER TABLE `catalog_book_genre`
  ADD CONSTRAINT `catalog_book_genre_book_id_e5a77c43_fk_catalog_book_id` FOREIGN KEY (`book_id`) REFERENCES `catalog_book` (`id`),
  ADD CONSTRAINT `catalog_book_genre_genre_id_77d7ffde_fk_catalog_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `catalog_genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
