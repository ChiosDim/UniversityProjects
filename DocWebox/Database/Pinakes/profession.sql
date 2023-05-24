-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: localhost:3306:3306
-- Χρόνος δημιουργίας: 23 Ιαν 2023 στις 21:31:40
-- Έκδοση διακομιστή: 10.4.18-MariaDB
-- Έκδοση PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `docwebox`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `profession`
--

CREATE TABLE `profession` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `profession`
--

INSERT INTO `profession` (`id`, `name`) VALUES
(1, 'Αιματολόγος'),
(2, 'Αλλεργιολόγος'),
(3, 'Αναισθησιολόγος'),
(4, 'Γενικός Ιατρός'),
(5, 'Γαστρεντερολόγος'),
(6, 'Γυναικολόγος'),
(7, 'Δερματολόγος'),
(8, 'Διαιτολόγος'),
(9, 'Καρδιολόγος'),
(10, 'Λογοθεραπευτής'),
(11, 'Μαστολόγος'),
(12, 'Νευρολόγος'),
(13, 'Ογκολόγος'),
(14, 'Οδοντίατρος'),
(15, 'Ορθοπεδικός'),
(16, 'Οφθαλμίατρος'),
(17, 'Παθολόγος'),
(18, 'Παιδίατρος'),
(19, 'Πλαστικός Χειρούργος'),
(20, 'Ρευματολόγος'),
(21, 'Φυσικοθεραπευτής'),
(22, 'Ψυχίατρος'),
(23, 'Ωτορινολαρυγγολόγος');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `profession`
--
ALTER TABLE `profession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
