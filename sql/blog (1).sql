-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:8889
-- Üretim Zamanı: 22 Kas 2022, 19:38:54
-- Sunucu sürümü: 5.7.34
-- PHP Sürümü: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` longtext,
  `slug` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `slug`) VALUES
(1, '2022-11-11 14:26:57.070', '2022-11-11 14:26:57.070', '2022-11-13 19:03:14.792', 'makine', 'makine'),
(2, '2022-11-11 14:26:58.571', '2022-11-11 14:26:58.571', '2022-11-11 14:27:01.074', '', ''),
(3, '2022-11-11 14:27:07.310', '2022-11-11 14:27:07.310', '2022-11-13 19:05:03.592', 'sanayi', 'sanayi'),
(4, '2022-11-11 14:27:17.672', '2022-11-11 14:27:17.672', NULL, 'sağlam iş', 'saglam-is'),
(5, '2022-11-11 22:08:12.906', '2022-11-11 22:08:12.906', NULL, 'bjkvkv', 'bjkvkv');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ilans`
--

CREATE TABLE `ilans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` longtext,
  `slug` longtext,
  `description` longtext,
  `content` longtext,
  `picture_url` longtext,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ilans`
--

INSERT INTO `ilans` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `slug`, `description`, `content`, `picture_url`, `category_id`) VALUES
(1, '2022-11-18 13:01:59.499', '2022-11-21 17:26:19.863', NULL, 'Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz. Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.', 'turizm-sektorunde-faaliyet-gosteren-oteller-zincirimizin-istanbul-xyz-otelinde-gorevlendirilmek-uzere-asagidaki-sureclerde-destek-olacak-takim-arkadasi-ariyoruz-on-buro-departmanina-bagli-olarak-calisacak-misafirlerimizin-otele-giris-ve-cikis-islemlerini-gerceklestirmek-konuklarin-otele-varisindan-itibaren-otelden-ugurlanmasina-kadar-gecen-surecte-misafir-memnuniyetini-on-planda-tutarak-ihtiyaclarini-hizli-ve-dogru-sekilde-karsilamak-gerekli-yonlendirmeleri-yapmak-rezervasyonlar-icin-yer-ve-uygunluk-verilerinin-guncel-tutmak', 'sadas', '<p>dadada</p>', NULL, NULL),
(2, '2022-11-19 14:09:34.125', '2022-11-21 17:26:27.998', NULL, 'Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz. Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.', 'turizm-sektorunde-faaliyet-gosteren-oteller-zincirimizin-istanbul-xyz-otelinde-gorevlendirilmek-uzere-asagidaki-sureclerde-destek-olacak-takim-arkadasi-ariyoruz-on-buro-departmanina-bagli-olarak-calisacak-misafirlerimizin-otele-giris-ve-cikis-islemlerini-gerceklestirmek-konuklarin-otele-varisindan-itibaren-otelden-ugurlanmasina-kadar-gecen-surecte-misafir-memnuniyetini-on-planda-tutarak-ihtiyaclarini-hizli-ve-dogru-sekilde-karsilamak-gerekli-yonlendirmeleri-yapmak-rezervasyonlar-icin-yer-ve-uygunluk-verilerinin-guncel-tutmak', 'dwadw', '<p>dwadwadadw</p>', NULL, NULL),
(3, '2022-11-20 18:28:46.606', '2022-11-20 19:13:10.138', NULL, 'Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz.  Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.', 'turizm-sektorunde-faaliyet-gosteren-oteller-zincirimizin-istanbul-xyz-otelinde-gorevlendirilmek-uzere-asagidaki-sureclerde-destek-olacak-takim-arkadasi-ariyoruz-on-buro-departmanina-bagli-olarak-calisacak-misafirlerimizin-otele-giris-ve-cikis-islemlerini-gerceklestirmek-konuklarin-otele-varisindan-itibaren-otelden-ugurlanmasina-kadar-gecen-surecte-misafir-memnuniyetini-on-planda-tutarak-ihtiyaclarini-hizli-ve-dogru-sekilde-karsilamak-gerekli-yonlendirmeleri-yapmak-rezervasyonlar-icin-yer-ve-uygunluk-verilerinin-guncel-tutmak', 'Ticket\r\nÖzel Sağlık Sigortası\r\nPerformansa bağlı prim', '<h1 style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><strong style=\"font-weight: bold;\"><span style=\"font-family: Impact;\">Aranan Nitelikler</span></strong></h1><h1><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">En az lise mezunu,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">Tele-Satış alanında Çağrı Merkezi sektöründe en az 1 yıl deneyim sahibi,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">Satış yapmayı seven,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">Doğru bilgi aktarımı ve kaliteli hizmetle müşteri memnuniyeti sağlayabilen,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">Analitik düşünebilen,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">Diksiyonu düzgün ve sözlü iletişim yeteneği güçlü, ikna kabiliyeti yüksek,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">Öğrenmeye ve kendisini geliştirmeye açık,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">İnsan ilişkilerinde başarılı, takım çalışmasına yatkın,</span></li></ul><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\"><span style=\"font-family: Impact;\">İş takibi yüksek ve hedef odaklı çalışabilecek.</span></li></ul></h1>', NULL, NULL),
(4, '2022-11-20 18:54:27.936', '2022-11-21 17:26:35.533', NULL, 'Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz. Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.', 'turizm-sektorunde-faaliyet-gosteren-oteller-zincirimizin-istanbul-xyz-otelinde-gorevlendirilmek-uzere-asagidaki-sureclerde-destek-olacak-takim-arkadasi-ariyoruz-on-buro-departmanina-bagli-olarak-calisacak-misafirlerimizin-otele-giris-ve-cikis-islemlerini-gerceklestirmek-konuklarin-otele-varisindan-itibaren-otelden-ugurlanmasina-kadar-gecen-surecte-misafir-memnuniyetini-on-planda-tutarak-ihtiyaclarini-hizli-ve-dogru-sekilde-karsilamak-gerekli-yonlendirmeleri-yapmak-rezervasyonlar-icin-yer-ve-uygunluk-verilerinin-guncel-tutmak', 'dsıjaodjas\r\ndsabuıdhnıusan\r\nndhsıjanıdunsd', '<p style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><strong style=\"font-weight: bold;\">Aranan Nitelikler</strong></p><ul style=\"margin-bottom: 20px; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin-bottom: 2px;\">En az lise mezunu,</li><li style=\"margin-bottom: 2px;\">Tele-Satış alanında Çağrı Merkezi sektöründe en az 1 yıl deneyim sahibi,</li><li style=\"margin-bottom: 2px;\">Satış yapmayı seven,</li><li style=\"margin-bottom: 2px;\">Doğru bilgi aktarımı ve kaliteli hizmetle müşteri memnuniyeti sağlayabilen,</li><li style=\"margin-bottom: 2px;\">Analitik düşünebilen,</li><li style=\"margin-bottom: 2px;\">Diksiyonu düzgün ve sözlü iletişim yeteneği güçlü, ikna kabiliyeti yüksek,</li><li style=\"margin-bottom: 2px;\">Öğrenmeye ve kendisini geliştirmeye açık,</li><li style=\"margin-bottom: 2px;\">İnsan ilişkilerinde başarılı, takım çalışmasına yatkın,</li><li style=\"margin-bottom: 2px;\">İş takibi yüksek ve hedef odaklı çalışabilecek.</li></ul>', NULL, NULL),
(5, '2022-11-21 17:26:54.428', '2022-11-21 17:26:54.428', NULL, 'Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz. Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.', 'turizm-sektorunde-faaliyet-gosteren-oteller-zincirimizin-istanbul-xyz-otelinde-gorevlendirilmek-uzere-asagidaki-sureclerde-destek-olacak-takim-arkadasi-ariyoruz-on-buro-departmanina-bagli-olarak-calisacak-misafirlerimizin-otele-giris-ve-cikis-islemlerini-gerceklestirmek-konuklarin-otele-varisindan-itibaren-otelden-ugurlanmasina-kadar-gecen-surecte-misafir-memnuniyetini-on-planda-tutarak-ihtiyaclarini-hizli-ve-dogru-sekilde-karsilamak-gerekli-yonlendirmeleri-yapmak-rezervasyonlar-icin-yer-ve-uygunluk-verilerinin-guncel-tutmak', '', '', NULL, NULL),
(6, '2022-11-21 17:26:59.712', '2022-11-21 17:26:59.712', NULL, 'Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz. Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.', 'turizm-sektorunde-faaliyet-gosteren-oteller-zincirimizin-istanbul-xyz-otelinde-gorevlendirilmek-uzere-asagidaki-sureclerde-destek-olacak-takim-arkadasi-ariyoruz-on-buro-departmanina-bagli-olarak-calisacak-misafirlerimizin-otele-giris-ve-cikis-islemlerini-gerceklestirmek-konuklarin-otele-varisindan-itibaren-otelden-ugurlanmasina-kadar-gecen-surecte-misafir-memnuniyetini-on-planda-tutarak-ihtiyaclarini-hizli-ve-dogru-sekilde-karsilamak-gerekli-yonlendirmeleri-yapmak-rezervasyonlar-icin-yer-ve-uygunluk-verilerinin-guncel-tutmak', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kurums`
--

CREATE TABLE `kurums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` longtext,
  `description` longtext,
  `picture_url` longtext,
  `slug` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `kurums`
--

INSERT INTO `kurums` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `description`, `picture_url`, `slug`) VALUES
(1, '2022-11-21 14:57:14.222', '2022-11-21 17:23:03.229', NULL, 'Bir fikir, yıldız gibi parıldayınca zihnimizde ekibimizle bir araya geliyoruz. Tasarım odaklı düşünme yöntemiyle bu fikrin bir ihtiyacı karşıladığına ve katma değerinin yüksek olduğuna inandığımız an, ürünü geliştirmeye başlıyoruz. İşte girişimlerimiz böyle doğuyor, böyle fark yaratıyor.', 'Job description\r\nWe are looking for a People & Culture Lead who is able to work in Istanbul. We build high quality, good looking, high performance, cross platform web and mobile applications.\r\n\r\nYou will be tasked with delivering a workplace that is true to our culture and values, attracts and retains talent, and where our people are motivated and empowered to work at their full potential.\r\n\r\nJob requirements\r\nWhat you will be doing,\r\n\r\n- Managing the strategy, research, design and execution of compensation and benefits programs, including health, wellness, and ancillary benefits to help us attract and retain the best talent,\r\n\r\n- Driving proactive sourcing plans to attract external talent using multiple sources, network, Linkedin and other recruitment tools to evaluate and hire top tier talent,', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 'bir-fikir-yildiz-gibi-parildayinca-zihnimizde-ekibimizle-bir-araya-geliyoruz-tasarim-odakli-dusunme-yontemiyle-bu-fikrin-bir-ihtiyaci-karsiladigina-ve-katma-degerinin-yuksek-olduguna-inandigimiz-an-urunu-gelistirmeye-basliyoruz-iste-girisimlerimiz-boyle-doguyor-boyle-fark-yaratiyor'),
(2, '2022-11-21 14:58:02.159', '2022-11-21 14:58:02.159', '2022-11-21 15:02:24.242', 'dasdsd', 'sadas', 'uploads/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 'dasdsd');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` longtext,
  `slug` longtext,
  `description` longtext,
  `content` longtext,
  `picture_url` longtext,
  `category_id` bigint(20) DEFAULT NULL,
  `picture_url1` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `slug`, `description`, `content`, `picture_url`, `category_id`, `picture_url1`) VALUES
(1, '2022-11-11 14:27:41.870', '2022-11-11 14:27:41.870', '2022-11-12 16:03:38.577', 'sanayi', 'sanayi', 'sadnklnsadsadknsalkd', '<p>asjdbsajbdllkasbldas</p>', 'uploads/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 3, NULL),
(2, '2022-11-11 14:28:36.508', '2022-11-11 14:28:36.508', '2022-11-12 16:03:40.326', 'sadasd', 'sadasd', 'dsand ankd', '<p>nskajdnklsand</p>', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 1, NULL),
(3, '2022-11-12 17:44:03.714', '2022-11-12 17:44:03.714', '2022-11-12 17:48:56.553', 'daasd', 'daasd', 'sadsad', '<p>sadsad</p>', 'uploads/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 1, NULL),
(4, '2022-11-12 17:49:08.246', '2022-11-12 17:49:08.246', '2022-11-12 17:49:57.777', 'jwdankas', 'jwdankas', 'sdadsa', '<p>asddwada</p>', 'uploads/IMG_0770.PNG', 1, NULL),
(5, '2022-11-12 17:50:11.863', '2022-11-12 17:50:11.863', '2022-11-12 17:50:29.194', 'fsafdc', 'fsafdc', 'adasfd', '<p>feafcasa</p>', 'uploads/IMG_0770.PNG', 5, NULL),
(6, '2022-11-12 18:04:40.431', '2022-11-12 18:10:26.510', '2022-11-12 18:19:27.136', 'sadjbksa', 'sadjbksa', 'sadas', '<p>sadsdsad</p><p><br></p>', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 5, NULL),
(7, '2022-11-12 18:09:58.293', '2022-11-12 18:09:58.293', '2022-11-12 18:19:27.688', 'dasd', 'dasd', 'saddsa', '<p>sdadsa</p>', 'uplo/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 1, NULL),
(8, '2022-11-12 18:10:46.443', '2022-11-12 18:10:46.443', '2022-11-12 18:19:28.326', 'sda', 'sda', 'sdasa', '<p>addas</p>', 'uploads/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 1, NULL),
(11, '2022-11-12 18:30:40.766', '2022-11-12 18:30:56.049', '2022-11-12 18:30:59.634', 'asdsa', 'asdsa', 'dsadas', '<p>sdaddsa</p>', 'uplo/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 1, NULL),
(12, '2022-11-12 18:31:12.586', '2022-11-12 18:31:12.586', '2022-11-13 14:41:48.957', 'dsad', 'dsad', 'sdadas', '<p>sdsads</p>', 'uplo/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 3, NULL),
(13, '2022-11-12 18:41:26.552', '2022-11-12 18:41:26.552', '2022-11-13 14:41:47.469', 'jndaskn', 'jndaskn', 'dasdas', '<p>sadasdas</p>', 'uplo/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 1, NULL),
(14, '2022-11-13 13:03:28.213', '2022-11-13 13:03:28.213', '2022-11-13 14:41:45.939', 'wqdwqd', 'wqdwqd', 'wdwqadwa', '<p>wdadwsdaws</p>', 'uplo/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 1, NULL),
(15, '2022-11-13 14:41:39.491', '2022-11-13 14:41:39.491', '2022-11-13 14:41:45.220', 'dhnwandw', 'dhnwandw', 'wdadw', '<p>dwadwa</p>', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 1, NULL),
(16, '2022-11-13 14:51:51.654', '2022-11-17 18:09:52.552', NULL, 'wdsa', 'wdsa', 'dsada', '<ul><li style=\"padding: 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; -webkit-font-smoothing: antialiased; font-family: Fedra, sans-serif; color: rgb(255, 255, 255); font-variant-ligatures: none; letter-spacing: -0.032px; background-color: rgb(0, 0, 51); appearance: none !important; line-height: inherit !important;\">Türkiye’ye ait küresel ölçekte rekabet edecek bir teknoloji markası yaratma hedefiyle 25 Haziran 2018\'de yola çıktık.</li></ul><p style=\"padding: 0px; margin: 2em 0px 0px; -webkit-font-smoothing: antialiased; font-family: Fedra, sans-serif; color: rgb(255, 255, 255); font-variant-ligatures: none; letter-spacing: -0.032px; background-color: rgb(0, 0, 51); appearance: none !important; line-height: inherit !important;\">Dünyayı ileriye taşıyacak hareket teknolojilerimizle yeni nesil akıllı cihazlar tasarlıyoruz. Bu cihazların etrafında ise “Use Case Mobility” kavramına uygun, hayatın her alanının birbiriyle bağlantıda olduğu mobilite ekosistemi geliştiriyoruz.</p><h1 style=\"padding: 0px; margin: 2em 0px 0px; -webkit-font-smoothing: antialiased; font-family: Fedra, sans-serif; color: rgb(255, 255, 255); font-variant-ligatures: none; letter-spacing: -0.032px; background-color: rgb(0, 0, 51); appearance: none !important; line-height: inherit !important;\">Böylece insan odaklı, hayatı kolaylaştıran yepyeni bir yaşam alanı tasarlayarak geleceğimizi değiştirmeyi hedefliyoruz.<img src=\"data:image/webp;base64,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\" style=\"width: 700px;\" data-filename=\"blog23.webp\"></h1>', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 4, NULL),
(17, '2022-11-14 13:39:21.013', '2022-11-17 13:24:47.066', NULL, 'sadds', 'sadds', 'sadas', '<p>sdadasaa</p>', 'uploads/progress_image_100_85615744-974f-4f65-b6fe-536de6b29370.webp', 4, NULL),
(18, '2022-11-14 16:45:54.269', '2022-11-14 16:45:54.269', NULL, 'sads', 'sads', 'dsadsa', '<p>sadsa</p>', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 5, NULL),
(19, '2022-11-20 18:39:23.628', '2022-11-20 18:39:23.628', '2022-11-21 17:25:39.002', 'sadsada', 'sadsada', 'dsadsd', '<p><span style=\"font-weight: bolder; color: rgb(142, 142, 142); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Turizm sektöründe faaliyet gösteren oteller zincirimizin İstanbul XYZ Oteli’nde görevlendirilmek üzere aşağıdaki süreçlerde destek olacak takım arkadaşı arıyoruz.&nbsp; Ön Büro Departmanı’na bağlı olarak çalışacak, Misafirlerimizin otele giriş ve çıkış işlemlerini gerçekleştirmek, Konukların otele varışından itibaren otelden uğurlanmasına kadar geçen süreçte misafir memnuniyetini ön planda tutarak ihtiyaçlarını hızlı ve doğru şekilde karşılamak, gerekli yönlendirmeleri yapmak, Rezervasyonlar için yer ve uygunluk verilerinin güncel tutmak.</span><br></p>', 'uploads/blog23.webp', 4, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uruns`
--

CREATE TABLE `uruns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title1` longtext,
  `slug1` longtext,
  `description1` longtext,
  `content1` longtext,
  `picture_url1` longtext,
  `category_id1` bigint(20) DEFAULT NULL,
  `picture_url` longtext,
  `title` longtext,
  `slug` longtext,
  `description` longtext,
  `content` longtext,
  `category_id` bigint(20) DEFAULT NULL,
  `fiyat` longtext,
  `picture_url2` longtext,
  `picture_url3` longtext,
  `picture_url4` longtext,
  `picture_url5` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `uruns`
--

INSERT INTO `uruns` (`id`, `created_at`, `updated_at`, `deleted_at`, `title1`, `slug1`, `description1`, `content1`, `picture_url1`, `category_id1`, `picture_url`, `title`, `slug`, `description`, `content`, `category_id`, `fiyat`, `picture_url2`, `picture_url3`, `picture_url4`, `picture_url5`) VALUES
(28, '2022-11-16 19:05:15.814', '2022-11-22 22:16:02.342', '2022-11-22 22:17:41.236', NULL, NULL, NULL, NULL, 'uploads/deniyotuz.png', NULL, 'uploads/IMG_0770.PNG', 'dasd', 'dasd', 'açıklama nerde', '<p>açıklama nerde</p>', 1, '250.000', 'uploads/deniyotuz.png', 'uploads/deniyotuz.png', 'uploads/deniyotuz.png', 'uploads/deniyotuz.png'),
(29, '2022-11-17 12:03:04.121', '2022-11-17 13:22:29.620', '2022-11-22 22:17:41.784', NULL, NULL, NULL, NULL, 'uploads/product-big-4.png', NULL, 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 'bogazlı', 'bogazli', 'https://www.youtube.com/watch?v=WJL2qW6_weQ', '<p><iframe frameborder=\"0\" src=\"//www.youtube.com/embed/WJL2qW6_weQ\" width=\"640\" height=\"360\" class=\"note-video-clip\"></iframe><br></p>', 1, '400', 'uploads/progress_image_100_85615744-974f-4f65-b6fe-536de6b29370.webp', 'uploads/progress_image_100_85615744-974f-4f65-b6fe-536de6b29370.webp', 'uploads/Ekran Resmi 2022-10-08 ÖS 4.30.53.png', 'uploads/1080P_8000K_408566531.mp4'),
(30, '2022-11-17 13:04:21.924', '2022-11-17 22:01:45.810', '2022-11-22 22:17:42.302', NULL, NULL, NULL, NULL, 'uploads/IMG_0770.PNG', NULL, 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 'sdad', 'sdad', 'dsadsa', '<p>dsadsadas</p>', 1, 'dsad', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png', 'uploads/blog23.webp', 'uploads/product-big.png', 'uploads/product-big-4.png'),
(31, '2022-11-22 22:20:13.512', '2022-11-22 22:33:10.314', NULL, NULL, NULL, NULL, NULL, 'uploads/makine-mühendisi-hangi-programları-bilmelidir.jpeg', NULL, 'uploads/evrimagaci.org_public_content_media_d9e3cab3abba30245ec697091026006b.jpg', 'sanayi makinesi', 'sanayi-makinesi', 'https://www.youtube.com/watch?v=P4Zi_own3W4', '<p>bu ürün çok fetocu&nbsp;<span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu</span><br></p>', 1, '250.000', 'uploads/shutterstock_785685547_16_9_1562741430.jpeg', 'uploads/jmsme-700x370-1.jpeg', 'uploads/blog23.webp', 'uploads/bedirhan857_time_success_god_well_done_old_man_tired_surreal_bo_6684c562-205d-45dd-844a-3a931a8d45e1.png'),
(32, '2022-11-22 22:26:00.138', '2022-11-22 22:38:27.160', NULL, NULL, NULL, NULL, NULL, 'uploads/jmsme-700x370-1.jpeg', NULL, 'uploads/shutterstock_785685547_16_9_1562741430.jpeg', 'oldu mu', 'oldu-mu', 'https://www.youtube.com/watch?v=P4Zi_own3W4', '<p>bu ürün çok fetocu&nbsp;<span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu&nbsp;</span><span style=\"font-family: Nunito, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 1rem;\">bu ürün çok fetocu</span><br></p>', 1, '250', 'uploads/evrimagaci.org_public_content_media_d9e3cab3abba30245ec697091026006b.jpg', 'uploads/makine-mühendisi-hangi-programları-bilmelidir.jpeg', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_categories`
--

CREATE TABLE `urun_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `title` longtext,
  `slug` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urun_categories`
--

INSERT INTO `urun_categories` (`id`, `created_at`, `updated_at`, `deleted_at`, `title`, `slug`) VALUES
(1, '2022-11-13 19:38:34.445', '2022-11-13 19:38:34.445', NULL, 'ağıriş', 'agiris'),
(2, '2022-11-13 19:38:39.414', '2022-11-13 19:38:39.414', NULL, 'hafifiş', 'hafifis');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `deleted_at` datetime(3) DEFAULT NULL,
  `username` longtext,
  `password` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `deleted_at`, `username`, `password`) VALUES
(1, NULL, NULL, NULL, 'admin', '96cae35ce8a9b0244178bf28e4966c2ce1b8385723a96a6b838858cdd6ca0a1e');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_categories_deleted_at` (`deleted_at`);

--
-- Tablo için indeksler `ilans`
--
ALTER TABLE `ilans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ilans_deleted_at` (`deleted_at`);

--
-- Tablo için indeksler `kurums`
--
ALTER TABLE `kurums`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_kurums_deleted_at` (`deleted_at`);

--
-- Tablo için indeksler `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_posts_deleted_at` (`deleted_at`);

--
-- Tablo için indeksler `uruns`
--
ALTER TABLE `uruns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uruns_deleted_at` (`deleted_at`);

--
-- Tablo için indeksler `urun_categories`
--
ALTER TABLE `urun_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_urun_categories_deleted_at` (`deleted_at`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_users_deleted_at` (`deleted_at`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `ilans`
--
ALTER TABLE `ilans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `kurums`
--
ALTER TABLE `kurums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Tablo için AUTO_INCREMENT değeri `uruns`
--
ALTER TABLE `uruns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Tablo için AUTO_INCREMENT değeri `urun_categories`
--
ALTER TABLE `urun_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
