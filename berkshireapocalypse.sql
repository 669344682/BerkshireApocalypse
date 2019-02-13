-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Feb 2019 um 09:05
-- Server-Version: 10.1.32-MariaDB
-- PHP-Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `berkshireapocalypse`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `achievements`
--

CREATE TABLE `achievements` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Achievement1` int(11) NOT NULL,
  `Achievement2` int(11) NOT NULL DEFAULT '0',
  `Achievement3` int(11) NOT NULL DEFAULT '0',
  `Achievement4` int(11) NOT NULL DEFAULT '0',
  `Achievement5` int(11) NOT NULL DEFAULT '0',
  `Achievement6` int(11) NOT NULL DEFAULT '0',
  `Achievement7` int(11) NOT NULL DEFAULT '0',
  `Achievement8` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bans`
--

CREATE TABLE `bans` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Reason` int(11) NOT NULL,
  `STime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logout`
--

CREATE TABLE `logout` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Weapons` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `offlinemessages`
--

CREATE TABLE `offlinemessages` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `premium`
--

CREATE TABLE `premium` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teams`
--

CREATE TABLE `teams` (
  `ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Owner` text NOT NULL,
  `Cash` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userdata`
--

CREATE TABLE `userdata` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Password` text NOT NULL,
  `Serial` varchar(50) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT '0',
  `ExperiencePoints` int(11) NOT NULL DEFAULT '0',
  `Zombiekills` int(11) NOT NULL DEFAULT '0',
  `Team` int(11) NOT NULL DEFAULT '0',
  `Teamrang` int(11) NOT NULL DEFAULT '0',
  `Deaths` int(11) NOT NULL DEFAULT '0',
  `Playingtime` int(11) NOT NULL DEFAULT '0',
  `Bonuspoints` int(11) NOT NULL DEFAULT '0',
  `Adminlevel` int(11) NOT NULL DEFAULT '0',
  `Chests` int(11) NOT NULL DEFAULT '0',
  `Hearts` int(11) NOT NULL DEFAULT '0',
  `Weeklychest` int(11) NOT NULL DEFAULT '0',
  `Weapondepot` int(11) NOT NULL DEFAULT '0',
  `BerkshireCoins` int(11) NOT NULL DEFAULT '0',
  `EasterEggs` int(11) NOT NULL DEFAULT '0',
  `Trophys` int(11) NOT NULL DEFAULT '0',
  `LifetimePremium` int(11) NOT NULL DEFAULT '0',
  `Zombieskin` int(11) NOT NULL DEFAULT '0',
  `Skin` int(11) NOT NULL DEFAULT '0',
  `Money` int(11) NOT NULL DEFAULT '0',
  `Posx` varchar(50) NOT NULL DEFAULT '-1963.5256347656',
  `Posy` varchar(50) NOT NULL DEFAULT '127.15285491943',
  `Posz` varchar(50) NOT NULL DEFAULT '27.6875',
  `Presents` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weapondepot`
--

CREATE TABLE `weapondepot` (
  `ID` int(11) NOT NULL,
  `Username` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `WeaponAmmo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weaponskills`
--

CREATE TABLE `weaponskills` (
  `ID` int(11) NOT NULL,
  `Username` text NOT NULL,
  `Pistol` int(11) NOT NULL DEFAULT '0',
  `Silenced` int(11) NOT NULL DEFAULT '0',
  `Deagle` int(11) NOT NULL DEFAULT '0',
  `Shotgun` int(11) NOT NULL DEFAULT '0',
  `Sawnoff` int(11) NOT NULL DEFAULT '0',
  `Spas12` int(11) NOT NULL DEFAULT '0',
  `Uzi` int(11) NOT NULL DEFAULT '0',
  `Mp5` int(11) NOT NULL DEFAULT '0',
  `AK-47` int(11) NOT NULL DEFAULT '0',
  `M4` int(11) NOT NULL DEFAULT '0',
  `Rifle` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `logout`
--
ALTER TABLE `logout`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `offlinemessages`
--
ALTER TABLE `offlinemessages`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `weapondepot`
--
ALTER TABLE `weapondepot`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `weaponskills`
--
ALTER TABLE `weaponskills`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `achievements`
--
ALTER TABLE `achievements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bans`
--
ALTER TABLE `bans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `logout`
--
ALTER TABLE `logout`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `offlinemessages`
--
ALTER TABLE `offlinemessages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `premium`
--
ALTER TABLE `premium`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `teams`
--
ALTER TABLE `teams`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `userdata`
--
ALTER TABLE `userdata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `weapondepot`
--
ALTER TABLE `weapondepot`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `weaponskills`
--
ALTER TABLE `weaponskills`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
