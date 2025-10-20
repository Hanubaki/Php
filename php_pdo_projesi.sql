-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Eki 2025, 20:58:45
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `php_pdo_projesi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `id` int(11) NOT NULL,
  `kategoriadi` varchar(128) NOT NULL,
  `aciklama` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`id`, `kategoriadi`, `aciklama`) VALUES
(1, 'Elektronik', 'Bilgisayar, televizyon, cep telefonu'),
(4, 'eğlence', 'ssss');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `id` int(11) NOT NULL,
  `adsoyad` varchar(30) NOT NULL,
  `kadi` varchar(20) NOT NULL,
  `sifre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`id`, `adsoyad`, `kadi`, `sifre`) VALUES
(1, 'Mercin Karakaş', 'mercin', '1234'),
(3, 'berke akdemir', 'Hanubaki', '1234');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `id` int(11) NOT NULL,
  `ad` varchar(100) NOT NULL,
  `soyad` varchar(100) NOT NULL,
  `eposta` varchar(100) NOT NULL,
  `sifre` varchar(255) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `kayit_tarihi` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`id`, `ad`, `soyad`, `eposta`, `sifre`, `telefon`, `adres`, `kayit_tarihi`) VALUES
(1, 'berke', 'akdemir', 'deneme@gmail.com', '$2y$10$3jqSAIjb5EEn/I9DrCz5CeGz1rf3oubirmoSGNhRyESMVz7ZLpG/C', NULL, NULL, '2025-10-19 16:49:52');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `id` int(11) NOT NULL,
  `musteri_id` int(11) NOT NULL,
  `siparis_tarihi` datetime NOT NULL DEFAULT current_timestamp(),
  `toplam_tutar` decimal(10,2) NOT NULL,
  `siparis_durumu` varchar(50) NOT NULL DEFAULT 'Yeni Sipariş',
  `adres` text NOT NULL,
  `telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`id`, `musteri_id`, `siparis_tarihi`, `toplam_tutar`, `siparis_durumu`, `adres`, `telefon`) VALUES
(1, 1, '2025-10-19 17:10:09', 31.00, 'Sipariş Alındı', 'ss', 'ss'),
(2, 1, '2025-10-19 17:11:53', 6.00, 'Sipariş Alındı', 's', 's'),
(3, 1, '2025-10-19 17:15:20', 6.00, 'Sipariş Alındı', 's', 's'),
(4, 1, '2025-10-19 17:15:39', 6.00, 'Sipariş Alındı', 's', 's'),
(5, 1, '2025-10-19 17:16:03', 30.00, 'Sipariş Alındı', 's', 's'),
(6, 1, '2025-10-19 20:10:48', 31.00, 'Sipariş Alındı', 's', 's'),
(7, 1, '2025-10-19 20:12:25', 6.00, 'Sipariş Alındı', 's', 's'),
(8, 1, '2025-10-19 20:13:35', 31.00, 'Sipariş Alındı', 's', 's'),
(9, 1, '2025-10-19 20:55:37', 31.00, 'Sipariş Alındı', 's', 's'),
(10, 1, '2025-10-19 20:57:29', 6.00, 'Sipariş Alındı', 's', 's'),
(11, 1, '2025-10-19 20:58:38', 6.00, 'Sipariş Alındı', 's', 's'),
(12, 1, '2025-10-19 20:59:51', 6.00, 'Sipariş Alındı', 's', 's'),
(13, 1, '2025-10-19 21:02:18', 6.00, 'Sipariş Alındı', 's', 's');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis_detaylari`
--

CREATE TABLE `siparis_detaylari` (
  `id` int(11) NOT NULL,
  `siparis_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `birim_fiyat` decimal(10,2) NOT NULL,
  `ara_toplam` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `siparis_detaylari`
--

INSERT INTO `siparis_detaylari` (`id`, `siparis_id`, `urun_id`, `adet`, `birim_fiyat`, `ara_toplam`) VALUES
(1, 1, 12, 1, 31.00, 31.00),
(2, 2, 4, 1, 6.00, 6.00),
(3, 3, 4, 1, 6.00, 6.00),
(4, 4, 4, 1, 6.00, 6.00),
(5, 5, 13, 1, 30.00, 30.00),
(6, 6, 12, 1, 31.00, 31.00),
(7, 7, 4, 1, 6.00, 6.00),
(8, 8, 12, 1, 31.00, 31.00),
(9, 9, 12, 1, 31.00, 31.00),
(10, 10, 4, 1, 6.00, 6.00),
(11, 11, 4, 1, 6.00, 6.00),
(12, 12, 4, 1, 6.00, 6.00),
(13, 13, 4, 1, 6.00, 6.00);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `id` int(11) NOT NULL,
  `urunadi` varchar(128) NOT NULL,
  `aciklama` text NOT NULL,
  `urundetay` text DEFAULT NULL,
  `fiyat` double NOT NULL,
  `giris_tarihi` datetime NOT NULL,
  `dzltm_tarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `resim` varchar(128) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`id`, `urunadi`, `aciklama`, `urundetay`, `fiyat`, `giris_tarihi`, `dzltm_tarihi`, `resim`, `kategori_id`) VALUES
(1, 'Yuki Suou', '3 kişilikli karı', NULL, 15, '2018-08-02 12:04:03', '2025-10-19 11:58:29', 'Yuki_Suou.jpg', NULL),
(4, 'Mariya Mikhailovna Kujou', 'Rus karı v2', NULL, 6, '2018-08-02 12:15:04', '2025-10-19 12:12:47', 'maria.jpg', 4),
(12, 'Alisa Mikhailovna Kujou (Alya)', '50', NULL, 31, '2025-09-29 22:51:32', '2025-10-19 11:58:53', 'alya.jpg', 4),
(13, 'Nonoa Miyamae', '', NULL, 30, '2025-09-29 22:53:14', '2025-10-19 12:12:34', 'nonoa.jpg', 4);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eposta` (`eposta`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Tablo için indeksler `siparis_detaylari`
--
ALTER TABLE `siparis_detaylari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siparis_id` (`siparis_id`),
  ADD KEY `urun_id` (`urun_id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategori_id` (`kategori_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `siparis_detaylari`
--
ALTER TABLE `siparis_detaylari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `siparis_detaylari`
--
ALTER TABLE `siparis_detaylari`
  ADD CONSTRAINT `siparis_detaylari_ibfk_1` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siparis_detaylari_ibfk_2` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`id`) ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `fk_kategori_id` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
