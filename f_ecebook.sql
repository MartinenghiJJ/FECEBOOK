-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 01 mai 2018 à 20:36
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `f_ecebook`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Mail` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `Password` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ami`
--

DROP TABLE IF EXISTS `ami`;
CREATE TABLE IF NOT EXISTS `ami` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `user1` int(255) NOT NULL,
  `user2` int(255) NOT NULL,
  `state` int(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `IdProf` int(255) NOT NULL,
  `IdComment` int(255) NOT NULL,
  `Contenu` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `image_tb`
--

DROP TABLE IF EXISTS `image_tb`;
CREATE TABLE IF NOT EXISTS `image_tb` (
  `imageid` int(11) NOT NULL AUTO_INCREMENT,
  `img_location` varchar(150) NOT NULL,
  `img_location2` varchar(150) NOT NULL,
  PRIMARY KEY (`imageid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `image_tb`
--

INSERT INTO `image_tb` (`imageid`, `img_location`, `img_location2`) VALUES
(1, 'image/andrej.jpg', 'image/Martell.jpg'),
(2, 'image/andrej.jpg', 'image/Martell.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `publication`
--

DROP TABLE IF EXISTS `publication`;
CREATE TABLE IF NOT EXISTS `publication` (
  `Id` int(255) NOT NULL,
  `Date` date NOT NULL,
  `Type` set('Photo','Event','Video','CV') NOT NULL,
  `Lieu` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `profil` varchar(50) NOT NULL DEFAULT 'image/ece.jpg',
  `couverture` varchar(50) NOT NULL DEFAULT 'image/ece.jpg',
  `statut` set('Etudiant','Prof') NOT NULL,
  `trn_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `nom`, `prenom`, `adresse`, `ville`, `profil`, `couverture`, `statut`, `trn_date`) VALUES
(1, 'Andronek', 'andrejsbuffon@gmail.com', '6af7b5dc1e77494c4af0d368cb2e7dbd', 'Andrej', 'Stan', '4 Chemin de Bretagne', 'Issy', 'andrej.jpg', 'Martell.jpg', 'Etudiant', '2018-05-01 20:17:50'),
(2, 'JJLaBuche', 'jean-jacques.martinenghi@edu.ece.fr', '202cb962ac59075b964b07152d234b70', 'Martinenghi', 'Jean-Jacques', '71, rue du Theatre, 75015', 'Paris', 'jj.jpg', 'Tyrion.jpg', 'Etudiant', '2018-05-01 20:21:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
