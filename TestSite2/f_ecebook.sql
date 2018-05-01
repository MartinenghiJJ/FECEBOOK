-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 01 Mai 2018 à 15:29
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

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `profil` longblob NOT NULL,
  `couverture` longblob NOT NULL,
  `statut` set('Etudiant','Prof') NOT NULL,
  `trn_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `nom`, `prenom`, `adresse`, `ville`, `profil`, `couverture`, `statut`, `trn_date`) VALUES
(5, 'Andronek', 'andrejsbuffon@gmail.com', '6af7b5dc1e77494c4af0d368cb2e7dbd', 'Andrej', 'Stan', '4 Chemin de Bretagne', 'Issy', 0x31323532353430395f3935353130343837313234353039395f343832303138393633363830383238343538345f6f202832292e6a7067, 0x4d617274656c6c2e6a7067, 'Etudiant', '2018-05-01 12:50:13');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
