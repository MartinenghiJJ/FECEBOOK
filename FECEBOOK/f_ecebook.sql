-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 05 mai 2018 à 13:02
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
  `user1` varchar(50) NOT NULL,
  `user2` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ami`
--

INSERT INTO `ami` (`Id`, `user1`, `user2`) VALUES
(1, 'Andronek', 'JJLaBuche'),
(2, 'Andronek', 'Sousou'),
(3, 'JJLaBuche', 'Andronek'),
(4, 'Sousou', 'Andronek'),
(11, 'Chien', 'JJLaBuche'),
(12, 'JJLaBuche', 'Chien'),
(13, 'Chat', 'Andronek'),
(14, 'Andronek', 'Chat'),
(15, 'MarieR', 'Andronek'),
(16, 'Andronek', 'MarieR');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `idPost` int(50) NOT NULL,
  `pPost` varchar(50) NOT NULL,
  `PComment` varchar(50) NOT NULL,
  `Contenu` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`Id`, `idPost`, `pPost`, `PComment`, `Contenu`) VALUES
(1, 5, 'Sousou', 'Andronek', 'AAA'),
(2, 3, 'Andronek', 'Andronek', 'Salut Andrej, comment tu vas ?');

-- --------------------------------------------------------

--
-- Structure de la table `cv`
--

DROP TABLE IF EXISTS `cv`;
CREATE TABLE IF NOT EXISTS `cv` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `pAuteur` varchar(50) NOT NULL,
  `cv` varchar(50) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `demande_ami`
--

DROP TABLE IF EXISTS `demande_ami`;
CREATE TABLE IF NOT EXISTS `demande_ami` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `user_from` varchar(50) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `demande_ami`
--

INSERT INTO `demande_ami` (`id`, `user_from`, `user_to`) VALUES
(5, 'Chat', 'Sousou'),
(10, 'JJLaBuche', 'Chat');

-- --------------------------------------------------------

--
-- Structure de la table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `idAuteur` varchar(50) NOT NULL,
  `contenu` text NOT NULL,
  `date` date NOT NULL,
  `statut` varchar(50) NOT NULL DEFAULT 'pas_ami',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `news`
--

INSERT INTO `news` (`id`, `idAuteur`, `contenu`, `date`, `statut`) VALUES
(1, 'JJLaBuche', 'Salut, c\'est JJ, ceci est mode ami', '2018-05-02', 'ami'),
(2, 'JJLaBuche', 'Salut, c\'est JJ, ceci est en mode public', '2018-05-02', 'pas_ami'),
(3, 'Andronek', 'Salut, c\'est Andrej, ceci est en mode ami', '2018-05-02', 'ami'),
(4, 'Andronek', 'SAlut a tous, ceci est en mode public', '2018-05-02', 'pas_ami'),
(5, 'Sousou', 'Ceci est en mode public, Sousou', '2018-05-02', 'pas_ami'),
(6, 'Sousou', 'Ceci est en mode ami', '2018-05-02', 'ami'),
(13, 'Andronek', 'Andrej', '2018-05-03', 'pas_ami'),
(12, 'Andronek', 'Test', '2018-05-03', 'pas_ami'),
(14, 'MarieR', 'Bonjour, je suis nouvelle Ã  l\\\'ECE\\r\\n', '2018-05-05', 'ami'),
(15, 'Andronek', 'Je suis avec Marie', '2018-05-05', 'pas_ami'),
(16, 'Andronek', 'A', '2018-05-05', 'pas_ami'),
(17, 'MarieR', 'AAAA', '2018-05-05', 'pas_ami'),
(18, 'Andronek', 'Andrej mode privÃ©', '2018-05-05', 'ami');

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `idAuteur` varchar(50) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `statut` varchar(20) NOT NULL DEFAULT 'ami',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `idAuteur`, `photo`, `date`, `statut`) VALUES
(1, 'JJLaBuche', 'image/lunette.jpg', '2018-05-03', 'ami'),
(2, 'JJLaBuche', 'image/plage.jpg', '2018-05-03', 'ami'),
(3, 'JJLaBuche', 'image/montagne.jpg', '2018-05-03', 'ami'),
(4, 'MarieR', 'image/montagne.jpg', '2018-05-05', 'ami');

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
  `profil` varchar(50) NOT NULL DEFAULT 'ece.jpg',
  `couverture` varchar(50) NOT NULL DEFAULT 'ece.jpg',
  `statut` set('Etudiant','Professeur') NOT NULL,
  `trn_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `nom`, `prenom`, `adresse`, `ville`, `profil`, `couverture`, `statut`, `trn_date`) VALUES
(1, 'Andronek', 'andrejsbuffon@gmail.com', '6af7b5dc1e77494c4af0d368cb2e7dbd', 'Andrej', 'Stan', '4 Chemin de Bretagne', 'Issy', 'andrej.jpg', 'Martell.jpg', 'Etudiant', '2018-05-01 20:17:50'),
(2, 'JJLaBuche', 'jean-jacques.martinenghi@edu.ece.fr', '202cb962ac59075b964b07152d234b70', 'Martinenghi', 'Jean-Jacques', '71, rue du Theatre, 75015', 'Paris', 'jj.jpg', 'Tyrion.jpg', 'Etudiant', '2018-05-01 20:21:56'),
(4, 'Sousou', 'soufiane.aksou@edu.ece.fr', '202cb962ac59075b964b07152d234b70', 'Aksou', 'Soufiane', '81, quai coti, 92300', 'St-Cloud', 'soufiane.jpg', 'liverpool.jpg', 'Etudiant', '2018-05-02 13:44:46'),
(6, 'Chat', 'chat@edu.ece.fr', '202cb962ac59075b964b07152d234b70', 'Mr', 'Chat', '71, rue du Theatre', 'paris', 'chat.jpg', 'Tyrion.jpg', 'Etudiant', '2018-05-03 00:15:13'),
(7, 'Chien', 'chien@edu.ece.fr', '202cb962ac59075b964b07152d234b70', 'Mr', 'Chien', '71, bla', 'paris', 'chien.jpg', 'Tyrion.jpg', 'Etudiant', '2018-05-03 04:02:26'),
(8, 'MarieR', 'marie.rouilly@hotmail.fr', '202cb962ac59075b964b07152d234b70', 'Rouilly', 'Marie', '50 boulevard Garibaldi, 75015', 'Paris', 'marie.jpg', 'rail.jpg', 'Etudiant', '2018-05-05 00:38:06');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
