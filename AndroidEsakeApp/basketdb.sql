-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Εξυπηρετητής: 127.0.0.1:3306
-- Χρόνος δημιουργίας: 13 Ιουν 2022 στις 19:17:42
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
-- Βάση δεδομένων: `basketdb`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `type` varchar(32) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `events`
--

INSERT INTO `events` (`event_id`, `type`) VALUES
(1, 'SHOOT1P'),
(2, 'SHOOT2P'),
(3, 'SHOOT3P'),
(4, 'NOTSHOOT1P'),
(5, 'NOTSHOOT2P'),
(6, 'NOTSHOOT3P'),
(7, 'ASSIST'),
(8, 'REBOUND'),
(9, 'BLOCK'),
(10, 'STEAL'),
(11, 'TURNOVER'),
(12, 'FOUL');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `gameweek`
--

CREATE TABLE `gameweek` (
  `gameweek_id` int(10) NOT NULL,
  `date` varchar(10) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `gameweek`
--

INSERT INTO `gameweek` (`gameweek_id`, `date`) VALUES
(1, '1-5-2022'),
(2, '8-5-2022'),
(3, '15-5-2022');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `livechanges`
--

CREATE TABLE `livechanges` (
  `player_id` int(11) DEFAULT NULL,
  `in_or_out` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `liveupdates`
--

CREATE TABLE `liveupdates` (
  `player_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `minute` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `matches`
--

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL,
  `team1` int(11) DEFAULT NULL,
  `team2` int(11) DEFAULT NULL,
  `time` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `stadium` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gameweek` int(10) DEFAULT NULL,
  `referee` varchar(32) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `matches`
--

INSERT INTO `matches` (`match_id`, `team1`, `team2`, `time`, `stadium`, `gameweek`, `referee`) VALUES
(1, 1, 2, '16:00', 'OAKA', 1, 'Avronnidakis'),
(2, 4, 6, '18:30', 'OAKA', 1, 'Avramidou'),
(3, 5, 3, '21:00', 'PAOK Sports Arena', 1, 'Papadopoulos'),
(4, 2, 6, '16:00', 'Peace and Friendship Stadium', 2, 'Avronnidakis'),
(5, 4, 5, '18:30', 'OAKA', 2, 'Avramidou'),
(6, 3, 1, '21:00', 'Kallithea Palais des Sports', 2, 'Papadopoulos'),
(7, 6, 5, '16:00', 'Nick Galis Hall', 3, 'Avronnidakis'),
(8, 3, 2, '18:30', 'Kallithea Palais des Sports', 3, 'Avramidou'),
(9, 1, 4, '21:00', 'OAKA', 3, 'Papadopoulos');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `matchesstatistics`
--

CREATE TABLE `matchesstatistics` (
  `match_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `shoot1p` int(10) DEFAULT NULL,
  `shoot2p` int(10) DEFAULT NULL,
  `shoot3p` int(10) DEFAULT NULL,
  `not_shoot1` int(10) DEFAULT NULL,
  `not_shoot2` int(10) DEFAULT NULL,
  `not_shoot3` int(10) DEFAULT NULL,
  `assist` int(10) DEFAULT NULL,
  `rebound` int(10) DEFAULT NULL,
  `block` int(10) DEFAULT NULL,
  `steal` int(10) DEFAULT NULL,
  `turnover` int(10) DEFAULT NULL,
  `foul` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `player_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `position` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `image` varchar(1024) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`player_id`, `name`, `number`, `position`, `team_id`, `image`) VALUES
(1, 'Siba Peiton', 3, 'Guard', 1, 'https://en.wikipedia.org/wiki/Peyton_Siva#/media/File:2021-06-01_ALBA_Berlin_gegen_ratiopharm_Ulm_(Play-off-Halbfinale_3,_Basketball-Bundesliga_2020-21)_by_Sandro_Halank%E2%80%93104.jpg'),
(2, 'Papagiannis Georgios', 5, 'Center', 1, 'http://www.esake.gr/dat/resize/esakeplayer/00000451/photo_51E92667.jpg'),
(3, 'Abdalas Neoklis', 21, 'Guard', 1, 'http://www.esake.gr/dat/resize/esakeplayer/F8A288FB/photo_6FC17A42.jpg'),
(4, 'Bochoridis Eleutherios', 7, 'Guard', 1, 'http://www.esake.gr/dat/resize/esakeplayer/0000037E/photo_4DE248A9.jpg'),
(5, 'Kavvadas Vasilis', 5, 'Center', 1, 'http://www.esake.gr/dat/resize/esakeplayer/00000167/photo_4146AF6F.jpg'),
(6, 'Papapetrou Ioannis', 9, 'Forward', 1, 'http://www.esake.gr/dat/resize/esakeplayer/8E3AD877/photo_4E5706CF.jpg'),
(7, 'Jovic Stefan', 14, 'Guard', 1, 'https://www.proballers.com/media/cache/torso_player/ul/player/37273-3-5d97d2a5f2202.jpg '),
(8, 'Kaselakis Leonidas', 12, 'Forward', 1, 'http://www.esake.gr/dat/resize/esakeplayer/000001AD/photo_06F2AD2E.jpg'),
(9, 'Evans Jeremy', 40, 'Forward', 1, 'http://www.esake.gr/dat/resize/esakeplayer/0BBCFBD3/photo_5096D2CC.jpg'),
(10, 'Sant-Ross Howard', 77, 'Forward', 1, 'http://www.esake.gr/dat/resize/esakeplayer/C510FEF8/photo_4BB3A981.jpg'),
(11, 'White Okaro', 3, 'Forward', 2, 'https://cdn.nba.com/headshots/nba/latest/1040x760/1627855.png '),
(12, 'Walkup Thomas', 0, 'Guard', 2, 'http://www.esake.gr/dat/resize/esakeplayer/6C630C6A/photo_257F9D3B.jpg'),
(13, 'Acy Quincy', 1, 'Forward', 2, 'http://www.esake.gr/dat/resize/esakeplayer/FB41797F/photo_5F71A6FA.jpg '),
(14, 'Dorsey Tyler', 2, 'Guard', 2, 'http://www.esake.gr/dat/resize/esakeplayer/12208166/photo_00CF240A.jpg'),
(15, 'Lountzis Michalis', 4, 'Guard', 2, 'http://www.esake.gr/dat/resize/esakeplayer/2BB1AF1F/photo_10D5892E.jpg'),
(16, 'Larentzakis Giannoulis', 5, 'Guard', 2, 'http://www.esake.gr/dat/resize/esakeplayer/00000245/photo_1B482771.jpg'),
(17, 'Fall Moustapha', 10, 'Center', 2, 'http://www.esake.gr/dat/resize/esakeplayer/9484425D/photo_78FB578E.jpg'),
(18, 'Sloukas Kostas', 11, 'Guard', 2, 'http://www.esake.gr/dat/resize/esakeplayer/0000055C/photo_4C0CBE14.jpg'),
(19, 'Martin Hassan', 12, 'Center', 2, 'http://www.esake.gr/dat/resize/esakeplayer/BED303AC/photo_3665B666.jpg'),
(20, 'Printezis Giorgos', 15, 'Forward', 2, 'http://www.esake.gr/dat/resize/esakeplayer/000004C7/photo_54333B61.jpg'),
(21, 'Xanthopoulos Vasilis', 4, 'Guard', 3, 'http://www.esake.gr/dat/resize/esakeplayer/000003F5/photo_17131FF3.jpg'),
(22, 'Prapas Stergios', 6, 'Guard', 3, 'http://www.esake.gr/dat/resize/esakeplayer/ED9C88DB/photo_28DB6218.jpg'),
(23, 'Kampouris Nikos', 7, 'Center', 3, 'http://www.esake.gr/dat/resize/esakeplayer/611CA890/photo_23F14A77.jpg'),
(24, 'Momirof Stephan', 9, 'Guard', 3, 'http://www.esake.gr/dat/resize/esakeplayer/22A70E15/photo_73B7E0FD.jpg'),
(25, 'Williams Kenny', 10, 'Guard', 3, 'http://www.esake.gr/dat/resize/esakeplayer/24D310BE/photo_5EC17C1C.jpg'),
(26, 'Margariths Vaggelis', 11, 'Forward', 3, 'http://www.esake.gr/dat/resize/esakeplayer/000002A8/photo_37433327.jpg'),
(27, 'Billis Sotiris', 12, 'Forward', 3, 'http://www.esake.gr/dat/resize/esakeplayer/ED874474/photo_5E42A3D5.jpg'),
(28, 'Miller Son', 13, 'Forward', 3, 'http://www.esake.gr/dat/resize/esakeplayer/A0A4AC5B/photo_47838D3E.jpg'),
(29, 'Tili Kim', 14, 'Forward', 3, 'http://www.esake.gr/dat/resize/esakeplayer/B8AD6D6F/photo_2FFA32E5.jpg'),
(30, 'Floyd Jordan', 17, 'Guard', 3, 'http://www.esake.gr/dat/resize/esakeplayer/F687D874/photo_6601F303.jpg'),
(31, 'Langford Keith', 0, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/7A6A1B1D/photo_10820C05.jpg'),
(32, 'Colom Kino', 1, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/F00C2D88/photo_654859FA.jpg'),
(33, 'Saxionis Konstantinos', 2, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/58FA73EB/photo_17ED4311.jpg'),
(34, 'Raoutins Andy', 8, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/9CF62E68/photo_FFEA8088.jpg'),
(35, 'Petropoulos Andreas', 9, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/2FDD0350/photo_4CDC47DC.jpg'),
(36, 'Angola Bryan', 11, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/C4797F8E/photo_4E46BEC8.jpg'),
(37, 'Mouzourakis Odysseas', 14, 'Center', 4, 'http://www.esake.gr/dat/resize/esakeplayer/DE940DF1/photo_677ED00D.jpg'),
(38, 'Pappas Nikos', 15, 'Guard', 4, 'http://www.esake.gr/dat/resize/esakeplayer/0000047A/photo_4355C3E2.jpg'),
(39, 'Mavroeidhs Dimitris', 22, 'Center', 4, 'http://www.esake.gr/dat/resize/esakeplayer/000002C6/photo_41C71AD3.jpg'),
(40, 'Hammer Ian', 34, 'Forward', 4, 'http://www.esake.gr/dat/resize/esakeplayer/B4F1B8D7/photo_20846F84.jpg'),
(41, 'Rivers Dimitri', 1, 'Forward', 5, 'http://www.esake.gr/dat/resize/esakeplayer/C5F4C6D7/photo_11A74E7B.jpg'),
(42, 'Lee Anthony', 2, 'Forward', 5, 'http://www.esake.gr/dat/resize/esakeplayer/DAE822EB/photo_1F4ABEFC.jpg'),
(43, 'Green Phill', 4, 'Guard', 5, 'http://www.esake.gr/dat/resize/esakeplayer/5B64A1B6/photo_2D7EE1EB.jpg'),
(44, 'Christodoulou Andreas', 6, 'Guard', 5, 'http://www.esake.gr/dat/resize/esakeplayer/BBF3312A/photo_68D85C73.jpg'),
(45, 'Love Jermaine', 6, 'Guard', 5, 'http://www.esake.gr/dat/resize/esakeplayer/D400B3A0/photo_30778400.jpg'),
(46, 'Kamarianos Nikolaos', 13, 'Forward', 5, 'http://www.esake.gr/dat/resize/esakeplayer/3F8AE0E4/photo_33EA3CE2.jpg'),
(47, 'Di Leo David', 14, 'Forward', 5, 'http://www.esake.gr/dat/resize/esakeplayer/3AEC29CF/photo_70685B5E.jpg'),
(48, 'Konstantinidis Theodoros', 15, 'Guard', 5, 'http://www.esake.gr/dat/resize/esakeplayer/A611774B/photo_398DCA65.jpg\r\n'),
(49, 'Mantzaris Vaggelis', 16, 'Guard', 5, 'http://www.esake.gr/dat/resize/esakeplayer/0000029C/photo_56D8670C.jpg'),
(50, 'Roumoglou Apostolos', 17, 'Guard', 5, 'http://www.esake.gr/dat/resize/esakeplayer/D502EA88/photo_35C46189.jpg'),
(51, 'Shakur Juiston', 0, 'Forward', 6, 'http://www.esake.gr/dat/resize/esakeplayer/B3D545F0/photo_36F9E887.jpg'),
(52, 'Cowan Anthony', 1, 'Guard', 6, 'http://www.esake.gr/dat/resize/esakeplayer/C3F5F3E7/photo_5534690C.jpg'),
(53, 'Kamaras Nikos', 3, 'Forward', 6, 'http://www.esake.gr/dat/resize/esakeplayer/7AE4574C/photo_1269C0DF.jpg'),
(54, 'Chavales Stelios', 9, 'Guard', 6, 'https://i0.wp.com/yellowradio.gr/wp-content/uploads/2021/09/xavales_009.jpg '),
(55, 'Poulianitis Stelios', 11, 'Guard', 6, 'http://www.esake.gr/dat/resize/esakeplayer/F42B3D2C/photo_26D56A62.jpg'),
(56, 'Petanidis Kyriakos', 12, 'Forward', 6, 'http://www.esake.gr/dat/resize/esakeplayer/D953EB46/photo_0BAA4DA0.jpg'),
(57, 'Lockett Erik', 13, 'Forward', 6, 'http://www.esake.gr/dat/resize/esakeplayer/AD2F506D/photo_72FA4AC1.jpg'),
(58, 'Xeyrius Williams', 20, 'Forward', 6, 'http://www.esake.gr/dat/resize/esakeplayer/C3E4FC57/photo_4DED3749.jpg'),
(59, 'Olivier Hanlan', 21, 'Guard', 6, 'http://www.esake.gr/dat/resize/esakeplayer/ED24597B/photo_51D75E18.jpg'),
(60, 'James Kelly', 24, 'Center', 6, 'https://www.proballers.com/media/cache/torso_player/ul/player/64809-3-5e07d050e72f1.jpg ');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `playerssstatistics`
--

CREATE TABLE `playerssstatistics` (
  `player_id` int(11) DEFAULT NULL,
  `shoot1p` int(10) DEFAULT NULL,
  `shoot2p` int(10) DEFAULT NULL,
  `shoot3p` int(10) DEFAULT NULL,
  `not_shoot1` int(10) DEFAULT NULL,
  `not_shoot2` int(10) DEFAULT NULL,
  `not_shoot3` int(10) DEFAULT NULL,
  `assist` int(10) DEFAULT NULL,
  `rebound` int(10) DEFAULT NULL,
  `block` int(10) DEFAULT NULL,
  `steal` int(10) DEFAULT NULL,
  `turnover` int(10) DEFAULT NULL,
  `foul` int(10) DEFAULT NULL,
  `gameweek` int(10) DEFAULT NULL,
  `eval_sys` int(11) GENERATED ALWAYS AS (`shoot1p` * 1 + `shoot2p` * 2 + `shoot3p` * 3 + `rebound` + `assist` + `steal` + `block` - (`not_shoot1` * 1 + `not_shoot2` * 2 + `not_shoot3` * 3 + `turnover` + `foul`)) STORED
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `playerssstatistics`
--

INSERT INTO `playerssstatistics` (`player_id`, `shoot1p`, `shoot2p`, `shoot3p`, `not_shoot1`, `not_shoot2`, `not_shoot3`, `assist`, `rebound`, `block`, `steal`, `turnover`, `foul`, `gameweek`) VALUES
(4, 2, 5, 1, 2, 1, 2, 8, 2, 1, 3, 2, 2, 1),
(2, 3, 2, 2, 1, 5, 1, 7, 1, 0, 2, 2, 2, 2),
(6, 5, 5, 4, 2, 2, 3, 5, 5, 1, 1, 1, 2, 1),
(8, 6, 6, 3, 2, 3, 0, 1, 5, 0, 1, 2, 4, 3),
(10, 3, 7, 0, 1, 2, 2, 3, 0, 3, 0, 2, 2, 1),
(13, 0, 1, 4, 1, 2, 3, 6, 5, 1, 1, 2, 1, 3),
(15, 1, 2, 2, 2, 1, 2, 4, 0, 0, 0, 2, 2, 1),
(17, 4, 3, 1, 0, 2, 0, 2, 5, 0, 0, 2, 2, 2),
(16, 3, 6, 0, 1, 0, 2, 3, 0, 1, 1, 2, 1, 3),
(21, 6, 3, 4, 2, 2, 2, 4, 5, 0, 3, 2, 2, 1),
(25, 4, 1, 4, 4, 0, 2, 4, 5, 4, 2, 2, 5, 2),
(23, 5, 2, 0, 3, 2, 3, 5, 5, 1, 0, 2, 3, 1),
(28, 4, 1, 4, 0, 0, 2, 1, 8, 0, 1, 2, 0, 3),
(29, 2, 3, 2, 2, 2, 0, 2, 5, 1, 3, 2, 1, 1),
(32, 4, 3, 0, 0, 1, 2, 0, 5, 0, 2, 2, 0, 3),
(34, 0, 3, 4, 2, 2, 0, 4, 7, 0, 0, 2, 2, 1),
(27, 1, 3, 2, 5, 1, 2, 0, 5, 2, 1, 2, 0, 2),
(37, 4, 3, 3, 2, 2, 0, 1, 3, 0, 2, 2, 1, 3),
(55, 1, 8, 4, 2, 1, 2, 6, 5, 0, 3, 2, 0, 2),
(44, 4, 3, 0, 2, 2, 0, 0, 5, 2, 1, 2, 2, 1),
(48, 0, 1, 4, 1, 2, 4, 4, 3, 0, 0, 2, 0, 3),
(46, 4, 3, 0, 2, 4, 2, 4, 1, 0, 2, 2, 2, 2),
(58, 0, 0, 2, 4, 3, 1, 0, 5, 0, 0, 2, 0, 3),
(51, 2, 6, 1, 0, 1, 4, 3, 9, 1, 1, 2, 0, 2),
(49, 3, 0, 4, 2, 3, 2, 2, 5, 0, 3, 2, 2, 2),
(3, 5, 4, 4, 2, 1, 2, 1, 7, 5, 1, 6, 5, 1),
(7, 4, 3, 3, 2, 1, 4, 1, 2, 0, 3, 1, 4, 1),
(11, 3, 4, 2, 5, 2, 2, 4, 3, 1, 3, 2, 2, 1),
(14, 2, 1, 4, 2, 0, 1, 3, 1, 0, 3, 2, 3, 1),
(19, 1, 5, 1, 2, 1, 2, 4, 2, 2, 5, 1, 2, 1),
(24, 0, 4, 0, 2, 0, 3, 3, 1, 1, 3, 2, 1, 1),
(22, 0, 2, 0, 2, 1, 2, 4, 6, 1, 3, 0, 2, 2),
(33, 4, 0, 1, 3, 1, 3, 3, 2, 0, 3, 2, 1, 2),
(38, 2, 2, 1, 2, 4, 2, 2, 1, 1, 0, 0, 0, 2),
(39, 1, 1, 1, 2, 1, 1, 1, 2, 1, 3, 2, 2, 2),
(40, 3, 3, 4, 2, 0, 2, 4, 9, 2, 0, 2, 0, 2),
(41, 2, 4, 2, 2, 1, 3, 4, 2, 1, 1, 0, 2, 3),
(50, 0, 0, 1, 2, 1, 3, 2, 2, 1, 3, 0, 0, 2),
(53, 0, 1, 1, 2, 0, 2, 0, 1, 5, 0, 2, 3, 1),
(56, 2, 5, 2, 2, 1, 2, 4, 2, 4, 2, 3, 0, 3),
(57, 1, 0, 0, 2, 2, 0, 5, 6, 1, 1, 0, 2, 3),
(59, 2, 5, 4, 2, 1, 2, 4, 1, 0, 1, 2, 0, 3),
(1, 3, 0, 0, 2, 4, 0, 4, 2, 4, 3, 2, 2, 3),
(12, 4, 5, 1, 2, 5, 0, 5, 0, 4, 0, 2, 3, 3),
(20, 2, 0, 3, 2, 2, 2, 1, 7, 1, 3, 2, 2, 3),
(30, 0, 5, 1, 2, 3, 0, 0, 1, 1, 3, 0, 1, 3),
(60, 2, 1, 0, 2, 1, 1, 0, 2, 1, 3, 3, 0, 3);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `teams`
--

CREATE TABLE `teams` (
  `team_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `logo` varchar(1024) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Άδειασμα δεδομένων του πίνακα `teams`
--

INSERT INTO `teams` (`team_id`, `name`, `city`, `logo`) VALUES
(1, 'Panathinaikos', 'Athens', 'http://www.esake.gr/dat/resize/esaketeam/00000001/photo_4D00F448.png'),
(2, 'Olympiacos', 'Athens', 'http://www.esake.gr/dat/resize/esaketeam/00000002/photo_254396BB.png'),
(3, 'Kolossos', 'Rhodes', 'http://www.esake.gr/dat/resize/esaketeam/0000000A/photo_2564D5B5.png'),
(4, 'Aek', 'Athens', 'http://www.esake.gr/dat/resize/esaketeam/00000010/photo_580A2DCD.png'),
(5, 'Paok', 'Thessaloniki', 'http://www.esake.gr/dat/resize/esaketeam/0000000C/photo_47307C0F.png'),
(6, 'Aris', 'Thessaloniki', 'http://www.esake.gr/dat/resize/esaketeam/00000005/photo_2ABEE218.png');

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`player_id`);

--
-- Ευρετήρια για πίνακα `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`team_id`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `players`
--
ALTER TABLE `players`
  MODIFY `player_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT για πίνακα `teams`
--
ALTER TABLE `teams`
  MODIFY `team_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
