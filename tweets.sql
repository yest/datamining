-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 20, 2018 at 11:14 PM
-- Server version: 5.7.22-0ubuntu18.04.1
-- PHP Version: 7.2.5-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `python`
--

-- --------------------------------------------------------

--
-- Table structure for table `tweets`
--

CREATE TABLE `tweets` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sentiment` tinyint(1) NOT NULL,
  `parkname` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tweets`
--

INSERT INTO `tweets` (`id`, `text`, `date`, `sentiment`, `parkname`, `location`, `keyword`) VALUES
(1, 'really debating to go on this jog or not ', '2018-06-20 14:39:06', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(2, 'mfolny meetings devyn_sword is reading neveragainbook we are obsessed with it devyn_sword lindypeterc ', '2018-06-20 14:39:14', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(3, 'gop strategist steve schmidt announces he is leaving the republican party ', '2018-06-20 14:39:24', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(4, 'she should be taken to walk through the camps in poland and see for herself that there is no comparison shame th ', '2018-06-20 14:39:29', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(5, ' localhoodgypsy happy reading ', '2018-06-20 14:39:34', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(6, 'bird party metmuseum metmuseum painting the ', '2018-06-20 14:39:39', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(7, 'ran miles with nike run club light ', '2018-06-20 14:39:44', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(8, 'tomorrow is the summer solstice music festival treat yourself to all kinds of live music all the way from th to ', '2018-06-20 06:39:09', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(9, 'happy birthday giannadixe hope you enjoy your special day you deserve the best and many more for the big ', '2018-06-20 06:41:33', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(10, ' timeline to put things into perspective month ago the royal wedding weeks ago us north korea summit ', '2018-06-20 06:41:34', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(11, 'the newburyport area high school sports season is over the girls lacrosse team made an incredible run to the state ', '2018-06-20 06:42:56', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(12, ' chunkymcfat superstarner tonyposnanski clewandowski_ all hang around reading educated grownups use words the ', '2018-06-20 06:43:23', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(13, 'lmao this is like how was halfway across the mall on another floor already when decided to walk all the way bac ', '2018-06-20 06:43:31', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(14, ' clewandowski_ reading comprehension is actually thing you nazi enabler ', '2018-06-20 06:44:51', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(15, ' swampcrone john_ _lee muslimiq lol that is super far to walk', '2018-06-20 06:45:32', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(16, ' baby_groot_ happy birthday ', '2018-06-20 06:46:45', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(17, 'come to believe that better not leave before get my chance to ride when it is killing me what do really need ', '2018-06-20 06:47:44', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(19, ' syn_crowster these international yahoos are disrespecting america fastest growing sport year running but m good good ', '2018-06-20 06:49:37', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(20, ' zappafaye happy birthday ', '2018-06-20 06:49:51', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(21, 'free performances block party yes please ', '2018-06-20 06:51:26', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(22, 'look at him looking like that walking right into my home how dare ', '2018-06-20 06:52:00', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(23, 'front and center nbadraft media availability lonniewalker_ coming up at the kid from reading once again ', '2018-06-20 06:52:01', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(24, 'to the mosquito who bit my ass all night hope you re so full that you exploded and died fuck you and fuck your friends ', '2018-06-20 06:52:23', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(25, ' gop strategist steve schmidt announces he is leaving the republican party ', '2018-06-20 06:54:08', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(26, 'steinway where started my first prayer walk ', '2018-06-20 06:54:28', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(27, ' gop what has happened to you grand old party some dare call it demon has possessed you and made you deny yo ', '2018-06-20 06:55:01', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(28, 'one time for my birthday my friends gave me the cardboard thing from an empty paper towel roll ', '2018-06-20 06:55:22', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(29, ' your party is capable of it too ', '2018-06-20 06:56:05', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(30, ' speedy run by the river and couple of dead rats along the way yes am back in new york ', '2018-06-20 06:57:00', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(31, 'the republican party is the modern day democratic party so it looks like you made mistake from the jump ', '2018-06-20 06:57:42', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(32, ' put it off for while but post album really isn bad some chill vibe joint', '2018-06-20 06:59:02', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(33, 'our coalition is walking up to the un familiesbelongtogether keepfamiliestogether endfamilyseparation ', '2018-06-20 07:00:09', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(34, ' clareoriordan that is lovely way for anyone to spend my birthday ', '2018-06-20 07:00:13', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(35, 'well am not from brooklyn i don ride the wave good riddance thank goodness', '2018-06-20 07:00:17', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(36, ' stonewall speakerryan little scratch that lot late to the party pal ', '2018-06-20 07:00:31', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(37, 'lmao all slow as hell the man is walking ', '2018-06-20 07:03:05', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(38, 'yes you re reading this right with little ', '2018-06-20 07:03:53', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(39, ' reelbigphish thejurisdoctor before we become friends you should ask rick about me am very needy', '2018-06-20 07:04:23', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(40, ' mtfiii condolences to his fam and friends ', '2018-06-20 07:04:39', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(41, ' abvferrara happy birthday abby hope you have great day ', '2018-06-20 07:05:26', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(42, ' want to share all my drinks and food adventures with my friends in nyc ohmyjo_ kikimonstahh sandia ', '2018-06-20 07:06:01', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(43, 'me after few drinks at the house party ', '2018-06-20 07:06:10', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(44, 'this is great and all but you re late to the party sis ', '2018-06-20 07:07:05', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(45, 'these policies are like constantly eating cheeseburgers in the short run they are comforting in the long run they ', '2018-06-20 07:07:09', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(47, ' makigilla realdonaldtrump potus whitehouse bull shit trump is nazi they should have run away from him ', '2018-06-20 07:08:29', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(48, 'you know really like someone when see them every day or frequently my ass be lying saying we ll chill and we never do ', '2018-06-20 07:08:39', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'socializing'),
(49, ' sabiomclaughlin bdjkasasports ccsitv happy birthday boris ', '2018-06-20 07:09:22', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'relaxation'),
(50, ' realdonaldtrump the children you ass you re not gonna run away with this bullshit nam crap ', '2018-06-20 07:10:09', 0, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(51, 'this is the message of the left illegalsfirst yeah that is great message to run on ', '2018-06-20 07:13:16', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout'),
(52, ' can you believe that kid from oakland walking around believing in fairytales erick killmonger legacy ', '2018-06-20 07:13:50', 1, 'Central Park', '[-73.9817503577, 40.7649522867, -73.9496211749, 40.8008585051]', 'workout');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tweets`
--
ALTER TABLE `tweets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `text` (`text`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tweets`
--
ALTER TABLE `tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;