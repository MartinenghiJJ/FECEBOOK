-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 30 Avril 2018 à 19:37
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `f'ecebook`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Mail` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `ami`
--

CREATE TABLE IF NOT EXISTS `ami` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `user1` int(255) NOT NULL,
  `user2` int(255) NOT NULL,
  `state` int(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `ID` int(255) NOT NULL AUTO_INCREMENT,
  `Mail` varchar(255) NOT NULL,
  `Pseudo` varchar(255) NOT NULL,
  `Nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Prenom` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Profil` blob NOT NULL,
  `Pref` blob NOT NULL,
  `DateNaiss` date NOT NULL,
  `Ville` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Statut` set('Etudiant','Professeur','Employe') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Promo` varchar(4) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Mail` (`Mail`,`Pseudo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

CREATE TABLE IF NOT EXISTS `publication` (
  `Id` int(255) NOT NULL,
  `Date` date NOT NULL,
  `Type` set('Photo','Event','Video','CV') NOT NULL,
  `Lieu` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
