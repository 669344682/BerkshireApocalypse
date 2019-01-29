-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 06. Sep 2018 um 16:36
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
  `username` int(11) NOT NULL,
  `ZombieKills10000` int(11) NOT NULL DEFAULT '0',
  `ZombieKills50000` int(11) NOT NULL DEFAULT '0',
  `ZombieKills125000` int(11) NOT NULL DEFAULT '0',
  `ZombieKills250000` int(11) NOT NULL DEFAULT '0',
  `ZombieKills500000` int(11) NOT NULL DEFAULT '0',
  `ZombieKills1000000` int(11) NOT NULL DEFAULT '0',
  `ErsterLevelUp` int(11) NOT NULL DEFAULT '0',
  `LevelErreicht10` int(11) NOT NULL DEFAULT '0',
  `LevelErreicht25` int(11) NOT NULL DEFAULT '0',
  `LevelErreicht50` int(11) NOT NULL DEFAULT '0',
  `LevelErreicht100` int(11) NOT NULL DEFAULT '0',
  `LevelErreicht250` int(11) NOT NULL DEFAULT '0',
  `ErsteWaffeGekauft` int(11) NOT NULL DEFAULT '0',
  `ErsterPayday` int(11) NOT NULL DEFAULT '0',
  `ErstesMalGestorben` int(11) NOT NULL DEFAULT '0',
  `Gestorben10Mal` int(11) NOT NULL DEFAULT '0',
  `Gestorben25Mal` int(11) NOT NULL DEFAULT '0',
  `Gestorben50Mal` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bans`
--

CREATE TABLE `bans` (
  `username` text NOT NULL,
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `grund` int(11) NOT NULL,
  `stime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logout`
--

CREATE TABLE `logout` (
  `username` text NOT NULL,
  `waffen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `offlinemessages`
--

CREATE TABLE `offlinemessages` (
  `username` text NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `premium`
--

CREATE TABLE `premium` (
  `username` text NOT NULL,
  `code1` varchar(50) NOT NULL,
  `code2` varchar(50) NOT NULL,
  `code3` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teams`
--

CREATE TABLE `teams` (
  `name` text NOT NULL,
  `besitzer` text NOT NULL,
  `kasse` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userdata`
--

CREATE TABLE `userdata` (
  `username` text NOT NULL,
  `passwort` text NOT NULL,
  `serial` varchar(50) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `erfahrungspunkte` int(11) NOT NULL DEFAULT '0',
  `zombiekills` int(11) NOT NULL DEFAULT '0',
  `team` int(11) NOT NULL DEFAULT '0',
  `teamrang` int(11) NOT NULL DEFAULT '0',
  `startweapon` int(11) NOT NULL DEFAULT '0',
  `deaths` int(11) NOT NULL DEFAULT '0',
  `playingtime` int(11) NOT NULL DEFAULT '0',
  `bonuspoints` int(11) NOT NULL DEFAULT '0',
  `adminlevel` int(11) NOT NULL DEFAULT '0',
  `chest` int(11) NOT NULL DEFAULT '0',
  `heart` int(11) NOT NULL DEFAULT '0',
  `weeklychest` int(11) NOT NULL DEFAULT '0',
  `waffenlager` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `ostereier` int(11) NOT NULL DEFAULT '0',
  `pokale` int(11) NOT NULL DEFAULT '0',
  `lifetimevip` int(11) NOT NULL DEFAULT '0',
  `zombieskin` int(11) NOT NULL DEFAULT '0',
  `skinid` int(11) NOT NULL DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `posx` varchar(50) NOT NULL DEFAULT '-1963.5256347656',
  `posy` varchar(50) NOT NULL DEFAULT '127.15285491943',
  `posz` varchar(50) NOT NULL DEFAULT '27.6875'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vip`
--

CREATE TABLE `vip` (
  `username` text NOT NULL,
  `datum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `waffenskills`
--

CREATE TABLE `waffenskills` (
  `username` text NOT NULL,
  `pistol` int(11) NOT NULL DEFAULT '0',
  `silenced` int(11) NOT NULL DEFAULT '0',
  `deagle` int(11) NOT NULL DEFAULT '0',
  `shotgun` int(11) NOT NULL DEFAULT '0',
  `sawnoff` int(11) NOT NULL DEFAULT '0',
  `spas12` int(11) NOT NULL DEFAULT '0',
  `uzi` int(11) NOT NULL DEFAULT '0',
  `mp5` int(11) NOT NULL DEFAULT '0',
  `ak47` int(11) NOT NULL DEFAULT '0',
  `m4` int(11) NOT NULL DEFAULT '0',
  `rifle` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
