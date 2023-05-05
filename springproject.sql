-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 05 mai 2023 à 13:21
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `springproject`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`categoryid`, `name`) VALUES
(13, 'Philippines'),
(14, 'Argentine'),
(15, 'Morocco'),
(16, 'Korea');

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `password` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id`, `password`, `username`) VALUES
(1, '123', '1');

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `card_number` varchar(16) NOT NULL,
  `expiry_date` date NOT NULL,
  `cvc` varchar(3) NOT NULL,
  `street_address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `first_name`, `last_name`, `card_number`, `expiry_date`, `cvc`, `street_address`, `city`, `zip_code`, `email`, `created_at`) VALUES
(1, 'youssef', 'sadiqy', '321681', '2023-12-01', '123', 'dazedazd', 'casa', '22646', 'test@gmail.com', '2023-04-29 17:48:41'),
(2, 'youssef', 'sadiqy', '321681', '2023-12-01', '123', 'dazedazd', 'casa', '22646', 'test@gmail.com', '2023-04-29 17:52:51'),
(3, 'youssef', 'sadiqy', '6541864', '2023-12-01', '123', 'dazd', 'test', '22646', 'tattoostore@falltrack.net', '2023-04-29 18:07:02'),
(4, 'aaa', 'aaa', '6548/465', '2023-12-01', '841', '133dzad81z', 'test', '13254', 'test@gmail.com', '2023-05-04 10:35:45'),
(5, 'baaaa', 'sadiqy', '4451561', '2012-12-01', '213', 'dzadzafdzf', 'fze', '22646', 'kousouf@protonmail.com', '2023-05-04 10:40:01');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `categoryid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `categoryid`, `quantity`, `price`, `weight`, `description`) VALUES
(19, 'Cebu', 'https://image.arrivalguides.com/500x500/12/8e3e48b38f7623859baac43cbd54ece7.jpg', 13, 230, 13545, 1, 'Cebu vol'),
(20, 'Clack', 'https://www.ghi888.com/wp-content/uploads/2020/01/5-Hitting-the-Heights-DHeights-Resort-Casino-is-leading-the-new-wave-of-casino-and-tourism-developments-in-the-Clark-Freeport-Zone-500x500.jpg', 13, 250, 1235, 1, 'Clack vol'),
(21, 'Manille', 'https://www.philippines-roads.fr/wp-content/uploads/2016/09/circuit-nord-luzon-balneaire-1.jpg', 13, 521, 12576, 1, 'Manille vol'),
(23, 'Buenos Aires', 'https://www.holidaysplease.co.uk/assets/images/18-137-buenos%20aires.jpg-BasicCrop-size-500x500.jpg', 14, 412, 2512, 1, ''),
(24, 'Mendoza', 'https://rest.techbehemoths.com/storage/images/countries/argentina/mendoza/603f7ff2b660d.jpg', 14, 523, 1452, 1, 'Mendoza vol'),
(25, 'Oujda', 'https://www.traditours.com/cache/jour5-447-400.jpg', 15, 185, 1452, 1, 'Oujda vol'),
(26, 'Agadir', 'https://assets.airtrfx.com/media-em/ey/cities/Agadir.jpg?width=500&quality=80&fit=crop&format=auto&opt=true', 15, 254, 1452, 1, 'Agadir vol'),
(27, 'Seoul', 'https://www.atheneum.ai/wp-content/uploads/2019/04/seoul.jpg', 16, 145, 1452, 1, 'Seoul vol');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(64) NOT NULL,
  `role` varchar(250) NOT NULL DEFAULT 'ROLE_USERS',
  `enabled` tinyint(4) DEFAULT NULL,
  `email` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `role`, `enabled`, `email`) VALUES
(1, 'jay', '123', 'ROLE_USER', 1, 'gajerajay9@gmail.com'),
(2, 'admin', '123', 'ROLE_ADMIN', 1, '20ceuos042@ddu.ac.in'),
(3, 'test', 'Test@123', 'ROLE_USERS', NULL, 'tes@gmail.com'),
(4, 'test', 'Test@123', 'ROLE_USERS', NULL, 'tests@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryid`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_ibfk_1` (`categoryid`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`categoryid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
