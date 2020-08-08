-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 08. Aug 2020 um 16:07
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `delivery_cornelia_franta`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `branches`
--

CREATE TABLE `branches` (
  `ID` int(11) NOT NULL,
  `manager` int(11) DEFAULT NULL,
  `phoneNum` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `branches`
--

INSERT INTO `branches` (`ID`, `manager`, `phoneNum`, `location`) VALUES
(1, 1, 83648736, 1),
(2, 2, 3423535, 2),
(3, 3, 374827308, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `continents`
--

CREATE TABLE `continents` (
  `ID` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `continents`
--

INSERT INTO `continents` (`ID`, `name`) VALUES
(1, 'Africa'),
(2, 'Asia'),
(3, 'Australia'),
(4, 'Antarctica'),
(5, 'Europe'),
(6, 'North America'),
(7, 'South America');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `countries`
--

CREATE TABLE `countries` (
  `countryCode` varchar(10) NOT NULL,
  `numericCode` int(11) DEFAULT NULL,
  `internationalName` varchar(50) DEFAULT NULL,
  `localName` varchar(50) DEFAULT NULL,
  `continent` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `countries`
--

INSERT INTO `countries` (`countryCode`, `numericCode`, `internationalName`, `localName`, `continent`) VALUES
('AT', 40, 'Austria', 'Österreich', 5),
('CA', 124, 'Canada', 'Canada', 6),
('CN', 156, 'China', 'Zhongguu', 2),
('FR', 250, 'France', 'France', 5),
('GT', 320, 'Guatemala', 'Guatemala', 7),
('ID', 360, 'Indonesia', 'Indonesia', 2),
('JP', 392, 'Japan', 'Nihon', 2),
('NG', 566, 'Nigeria', 'Nigeria', 1),
('NO', 578, 'Norway', 'Norge', 5),
('SE', 752, 'Sweden', 'Sverige', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employees`
--

CREATE TABLE `employees` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `phoneNum` int(11) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employees`
--

INSERT INTO `employees` (`ID`, `name`, `lastName`, `phoneNum`, `branch`) VALUES
(1, 'christoff', 'bauer', 382757141, 1),
(2, 'homas', 'Stark', 87587348, 2),
(3, 'sabine', 'vogler', 2147483647, 3),
(4, 'babara', 'mueller', 2147483647, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `locations`
--

CREATE TABLE `locations` (
  `ID` int(11) NOT NULL,
  `streetName` varchar(60) DEFAULT NULL,
  `streetNumber` int(11) DEFAULT NULL,
  `postalCode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `locations`
--

INSERT INTO `locations` (`ID`, `streetName`, `streetNumber`, `postalCode`) VALUES
(1, 'beispielstraße', 23, 50180),
(2, 'beispielstraße', 345, 2002),
(3, 'beispielstraße', 56, 37022),
(4, 'beispielstraße', 34, 1210),
(5, 'beispielstraße', 89, 2002);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orders`
--

CREATE TABLE `orders` (
  `ID` int(11) NOT NULL,
  `sendDate` date DEFAULT NULL,
  `recivedDate` date DEFAULT NULL,
  `needsPickUp` tinyint(1) DEFAULT NULL,
  `senderId` int(11) DEFAULT NULL,
  `recipientId` int(11) DEFAULT NULL,
  `processedByBranch` int(11) DEFAULT NULL,
  `processedByEmpl` int(11) DEFAULT NULL,
  `thirdPartyLoc` int(11) DEFAULT NULL,
  `tarif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `orders`
--

INSERT INTO `orders` (`ID`, `sendDate`, `recivedDate`, `needsPickUp`, `senderId`, `recipientId`, `processedByBranch`, `processedByEmpl`, `thirdPartyLoc`, `tarif`) VALUES
(1, '2020-08-10', '2020-08-11', 0, 1, 1, 1, 1, NULL, 1),
(2, '2020-06-10', '2020-06-15', 1, 3, 2, 3, 2, 2, 2),
(3, '2020-07-10', '2020-07-11', 0, 1, 1, 1, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pickupstatus`
--

CREATE TABLE `pickupstatus` (
  `orderId` int(11) NOT NULL,
  `pickedUp` tinyint(1) DEFAULT NULL,
  `pickupTime` datetime DEFAULT NULL,
  `pickedUpBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `pickupstatus`
--

INSERT INTO `pickupstatus` (`orderId`, `pickedUp`, `pickupTime`, `pickedUpBy`) VALUES
(1, 0, '2020-08-10 16:02:11', 2),
(2, 1, '2020-07-10 10:02:11', 3),
(3, 1, '2020-06-10 08:03:15', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postalcodes`
--

CREATE TABLE `postalcodes` (
  `ZIP` int(11) NOT NULL,
  `city` varchar(40) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `postalcodes`
--

INSERT INTO `postalcodes` (`ZIP`, `city`, `region`, `country`) VALUES
(466, 'Edmonton', 'Alberta', 'CA'),
(675, 'Red Deer', 'Alberta', 'CA'),
(1030, 'Landstrasse', 'Wien', 'AT'),
(1210, 'Floridsdorf', 'Wien', 'AT'),
(2002, 'Morazan', 'Depto De El Progreso', 'GT'),
(2007, 'Sanarate', 'Depto De El Progreso', 'GT'),
(22810, 'Belle-Isle-En-Terre', 'Bretagne', 'FR'),
(23134, 'Trelleborg', 'Skane', 'SE'),
(37022, 'Karlskrona', 'Blekinge', 'SE'),
(50180, 'Agneaux', 'Normandie', 'FR'),
(80511, 'Gianyar', 'Bali', 'ID'),
(80514, 'Bitra', 'Bali', 'ID'),
(100046, 'Beijing City', 'Baijing', 'CN'),
(350004, 'Fuzhou City', 'Fujian', 'CN'),
(450211, 'Aba North', 'Abia', 'NG'),
(562102, 'Nembe', 'Bayelsa', 'NG'),
(2701166, 'Abiko Shi', 'Chiba Ken', 'JP'),
(5990235, 'Hannan Shi', 'Osaka Fu', 'JP'),
(76337634, 'Frosta', 'Trondelag', 'NO'),
(84658475, 'Bo', 'Nordland', 'NO');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipients`
--

CREATE TABLE `recipients` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `complements` varchar(10) DEFAULT NULL,
  `location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `recipients`
--

INSERT INTO `recipients` (`ID`, `name`, `lastName`, `complements`, `location`) VALUES
(1, 'Amelie', 'Heber', '6', 2),
(2, 'Rene', 'Spiegler', '6/9', 4),
(3, 'Sven', 'de Gosson', '1', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `senders`
--

CREATE TABLE `senders` (
  `ID` int(11) NOT NULL,
  `type` enum('private','company') DEFAULT NULL,
  `complements` varchar(10) DEFAULT NULL,
  `phoneNum` int(11) DEFAULT NULL,
  `location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `senders`
--

INSERT INTO `senders` (`ID`, `type`, `complements`, `phoneNum`, `location`) VALUES
(1, 'private', '2/3/1', 37584279, 3),
(2, 'company', '2/5', 453797454, 2),
(3, 'private', '5/8', 47523874, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shippingoptions`
--

CREATE TABLE `shippingoptions` (
  `ID` int(11) NOT NULL,
  `days` int(11) DEFAULT NULL,
  `originCountry` varchar(10) DEFAULT NULL,
  `destinationCountry` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shippingoptions`
--

INSERT INTO `shippingoptions` (`ID`, `days`, `originCountry`, `destinationCountry`) VALUES
(1, 2, 'AT', 'AT'),
(2, 5, 'CN', 'FR'),
(3, 3, 'SE', 'AT');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tarifs`
--

CREATE TABLE `tarifs` (
  `ID` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `maxWeight` decimal(10,2) DEFAULT NULL,
  `maxSize` varchar(10) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `shippingOption` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tarifs`
--

INSERT INTO `tarifs` (`ID`, `name`, `maxWeight`, `maxSize`, `price`, `shippingOption`) VALUES
(1, 'small letter', '500.00', '20x20', '0.40', 1),
(2, 'big Letter', '1000.00', '60x60', '2.50', 3),
(3, 'small package', '3000.00', '20x20', '5.00', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `thirdpartylocs`
--

CREATE TABLE `thirdpartylocs` (
  `ID` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `officeHours` varchar(50) DEFAULT NULL,
  `officeDays` varchar(50) DEFAULT NULL,
  `location` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `thirdpartylocs`
--

INSERT INTO `thirdpartylocs` (`ID`, `name`, `officeHours`, `officeDays`, `location`) VALUES
(1, 'interspar', '8:00 - 21:00', 'MO - SA', 4),
(2, 'OMV', '8:00-4:00', 'MO-SO', 2),
(3, 'PrintStore', '8:00 - 21:00', 'MO-WE', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trackingnumbers`
--

CREATE TABLE `trackingnumbers` (
  `orderId` int(11) DEFAULT NULL,
  `internationalNum` int(11) DEFAULT NULL,
  `internalNum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `trackingnumbers`
--

INSERT INTO `trackingnumbers` (`orderId`, `internationalNum`, `internalNum`) VALUES
(2, 21374833, 34347834),
(3, 813741744, 312437419),
(1, 328736423, 346736433);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trackingstatus`
--

CREATE TABLE `trackingstatus` (
  `internalNum` int(11) NOT NULL,
  `status` enum('recieved order','gets processsed at origin','on the way to destination','prosessed at desitnation','in delivery car','arrived','complications') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `trackingstatus`
--

INSERT INTO `trackingstatus` (`internalNum`, `status`) VALUES
(34347834, 'recieved order'),
(312437419, 'gets processsed at origin'),
(346736433, 'arrived');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `location` (`location`),
  ADD KEY `manager` (`manager`);

--
-- Indizes für die Tabelle `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryCode`),
  ADD KEY `continent` (`continent`);

--
-- Indizes für die Tabelle `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `branch` (`branch`);

--
-- Indizes für die Tabelle `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `postalCode` (`postalCode`);

--
-- Indizes für die Tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `senderId` (`senderId`),
  ADD KEY `recipientId` (`recipientId`),
  ADD KEY `processedByBranch` (`processedByBranch`),
  ADD KEY `processedByEmpl` (`processedByEmpl`),
  ADD KEY `tarif` (`tarif`),
  ADD KEY `thirdPartyLoc` (`thirdPartyLoc`);

--
-- Indizes für die Tabelle `pickupstatus`
--
ALTER TABLE `pickupstatus`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `pickedUpBy` (`pickedUpBy`);

--
-- Indizes für die Tabelle `postalcodes`
--
ALTER TABLE `postalcodes`
  ADD PRIMARY KEY (`ZIP`),
  ADD KEY `country` (`country`);

--
-- Indizes für die Tabelle `recipients`
--
ALTER TABLE `recipients`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `location` (`location`);

--
-- Indizes für die Tabelle `senders`
--
ALTER TABLE `senders`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `location` (`location`);

--
-- Indizes für die Tabelle `shippingoptions`
--
ALTER TABLE `shippingoptions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `originCountry` (`originCountry`),
  ADD KEY `destinationCountry` (`destinationCountry`);

--
-- Indizes für die Tabelle `tarifs`
--
ALTER TABLE `tarifs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `shippingOption` (`shippingOption`);

--
-- Indizes für die Tabelle `thirdpartylocs`
--
ALTER TABLE `thirdpartylocs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `location` (`location`);

--
-- Indizes für die Tabelle `trackingnumbers`
--
ALTER TABLE `trackingnumbers`
  ADD PRIMARY KEY (`internalNum`),
  ADD KEY `orderId` (`orderId`);

--
-- Indizes für die Tabelle `trackingstatus`
--
ALTER TABLE `trackingstatus`
  ADD PRIMARY KEY (`internalNum`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`ID`),
  ADD CONSTRAINT `branches_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `employees` (`ID`);

--
-- Constraints der Tabelle `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_ibfk_1` FOREIGN KEY (`continent`) REFERENCES `continents` (`ID`);

--
-- Constraints der Tabelle `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`branch`) REFERENCES `branches` (`ID`);

--
-- Constraints der Tabelle `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`postalCode`) REFERENCES `postalcodes` (`ZIP`);

--
-- Constraints der Tabelle `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `senders` (`ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`recipientId`) REFERENCES `recipients` (`ID`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`processedByBranch`) REFERENCES `branches` (`ID`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`processedByEmpl`) REFERENCES `employees` (`ID`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`tarif`) REFERENCES `tarifs` (`ID`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`thirdPartyLoc`) REFERENCES `thirdpartylocs` (`ID`);

--
-- Constraints der Tabelle `pickupstatus`
--
ALTER TABLE `pickupstatus`
  ADD CONSTRAINT `pickupstatus_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`ID`),
  ADD CONSTRAINT `pickupstatus_ibfk_2` FOREIGN KEY (`pickedUpBy`) REFERENCES `employees` (`ID`);

--
-- Constraints der Tabelle `postalcodes`
--
ALTER TABLE `postalcodes`
  ADD CONSTRAINT `postalcodes_ibfk_1` FOREIGN KEY (`country`) REFERENCES `countries` (`countryCode`);

--
-- Constraints der Tabelle `recipients`
--
ALTER TABLE `recipients`
  ADD CONSTRAINT `recipients_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`ID`);

--
-- Constraints der Tabelle `senders`
--
ALTER TABLE `senders`
  ADD CONSTRAINT `senders_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`ID`);

--
-- Constraints der Tabelle `shippingoptions`
--
ALTER TABLE `shippingoptions`
  ADD CONSTRAINT `shippingoptions_ibfk_1` FOREIGN KEY (`originCountry`) REFERENCES `countries` (`countryCode`),
  ADD CONSTRAINT `shippingoptions_ibfk_2` FOREIGN KEY (`destinationCountry`) REFERENCES `countries` (`countryCode`);

--
-- Constraints der Tabelle `tarifs`
--
ALTER TABLE `tarifs`
  ADD CONSTRAINT `tarifs_ibfk_1` FOREIGN KEY (`shippingOption`) REFERENCES `shippingoptions` (`ID`);

--
-- Constraints der Tabelle `thirdpartylocs`
--
ALTER TABLE `thirdpartylocs`
  ADD CONSTRAINT `thirdpartylocs_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`ID`);

--
-- Constraints der Tabelle `trackingnumbers`
--
ALTER TABLE `trackingnumbers`
  ADD CONSTRAINT `trackingnumbers_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`ID`);

--
-- Constraints der Tabelle `trackingstatus`
--
ALTER TABLE `trackingstatus`
  ADD CONSTRAINT `trackingstatus_ibfk_1` FOREIGN KEY (`internalNum`) REFERENCES `trackingnumbers` (`internalNum`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
