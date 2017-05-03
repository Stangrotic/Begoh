-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 01, 2014 at 10:55 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.6-1ubuntu1.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `begoh`
--

-- --------------------------------------------------------

--
-- Table structure for table `abusive`
--

CREATE TABLE IF NOT EXISTS `abusive` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(11) NOT NULL,
  `users` varchar(50) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `follows`
--

CREATE TABLE IF NOT EXISTS `follows` (
  `email` varchar(40) NOT NULL,
  `followers` text NOT NULL,
  `followed` text NOT NULL,
  `fsCount` int(11) NOT NULL,
  `fdCount` int(11) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `imgName` varchar(100) NOT NULL,
  `data` varchar(255) DEFAULT NULL,
  `dat` date DEFAULT NULL,
  `rcount` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`sno`, `user`, `name`, `imgName`, `data`, `dat`, `rcount`, `views`) VALUES
(7, 'neo', 'Naresh S', 'neo.jpg', 'test', '2014-07-30', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forum_reply`
--

CREATE TABLE IF NOT EXISTS `forum_reply` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `fno` int(11) NOT NULL,
  `reply` text NOT NULL,
  `rdate` date NOT NULL,
  `user` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `imgName` varchar(100) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `imgName` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`fname`, `lname`, `address`, `email`, `password`, `imgName`, `type`) VALUES
('Stephen', 'King', 'New York, USA', 'king@begoh.com', 'king', '', 'none'),
('Naresh', 'Sam', 'pkl', 'neo', 'n', 'neo.jpg', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `pcomments`
--

CREATE TABLE IF NOT EXISTS `pcomments` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `cdate` date NOT NULL,
  `rating` int(11) NOT NULL,
  `flag` varchar(10) NOT NULL,
  `imgName` varchar(200) NOT NULL,
  `rcount` int(11) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `pcomments`
--

INSERT INTO `pcomments` (`sno`, `pid`, `email`, `name`, `comment`, `cdate`, `rating`, `flag`, `imgName`, `rcount`) VALUES
(27, 1, 'kingwfking@gmail.com', 'Stephen K', 'Test', '2014-07-30', 80, 'wait', 'upload/kingwfking@gmail.com.jpg', 1),
(28, 1, 'neo', 'Naresh S', 'test', '2014-07-30', 100, 'wait', 'upload/neo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(60) NOT NULL,
  `receiver` varchar(60) NOT NULL,
  `msg` text NOT NULL,
  `mdate` date NOT NULL,
  `senderImage` varchar(100) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `sender`, `receiver`, `msg`, `mdate`, `senderImage`) VALUES
(45, 'kingwfking@gmail.com', 'kingwfking@gmail.com ', 'Testing Testing Testing', '2014-07-30', 'kingwfking@gmail.com.jpg'),
(46, 'neo', 'kingwfking@gmail.com ', 'test', '2014-07-30', 'neo.jpg'),
(47, 'neo', 'neo ', 'test', '2014-07-30', 'neo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pprofile`
--

CREATE TABLE IF NOT EXISTS `pprofile` (
  `pid` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `street` varchar(500) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `pimage` varchar(100) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`pid`),
  FULLTEXT KEY `pname` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_2` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_3` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_4` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_5` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_6` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_7` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_8` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_9` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_10` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_11` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_12` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_13` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_14` (`pname`,`street`,`city`,`state`,`zip`),
  FULLTEXT KEY `pname_15` (`pname`,`street`,`country`,`city`,`state`,`zip`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pprofile`
--

INSERT INTO `pprofile` (`pid`, `pname`, `street`, `city`, `state`, `country`, `zip`, `pimage`, `owner`, `type`) VALUES
(2, 'Princeton', 'Actress lane', 'Beach', 'NJ', 'USA', '9999', 'upload/10Final-Frontier.jpg', 'neo', '123'),
(1, '219', '219 Nassau Street', 'NJ', 'Princeton', 'USA', '08542', 'upload/imgres.jpg', 'kingwfking@gmail.com', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE IF NOT EXISTS `rating` (
  `pid` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `one` int(11) NOT NULL,
  `two` int(11) NOT NULL,
  `three` int(11) NOT NULL,
  `four` int(11) NOT NULL,
  `five` int(11) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`pid`, `score`, `count`, `one`, `two`, `three`, `four`, `five`) VALUES
(1, 180, 2, 180, 180, 180, 180, 180),
(2, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rebuttal`
--

CREATE TABLE IF NOT EXISTS `rebuttal` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `comment` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `rdate` date NOT NULL,
  `imgName` varchar(100) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `rebuttal`
--

INSERT INTO `rebuttal` (`sno`, `cno`, `pid`, `user`, `comment`, `name`, `rdate`, `imgName`) VALUES
(19, 27, 1, 'kingwfking@gmail.com', 'Awesome Neighborhood! ', 'Stephen K', '2014-07-30', 'kingwfking@gmail.com.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE IF NOT EXISTS `register` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `fastname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `passcode` varchar(100) NOT NULL,
  `loginwith` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE IF NOT EXISTS `signup` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `imgName` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `aboutU` varchar(200) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`fname`, `lname`, `address`, `email`, `password`, `imgName`, `type`, `aboutU`) VALUES
('Stephen', 'King', '219 Nassau Street', 'kingwfking@gmail.com', 'laxbum12', 'kingwfking@gmail.com.jpg', 'null', 'I am the founder of begoh'),
('Naresh', 'Samukham', 'Vizag', 'neo', 'n', 'neo.jpg', 'null', 'Java programmer');

-- --------------------------------------------------------

--
-- Table structure for table `source`
--

CREATE TABLE IF NOT EXISTS `source` (
  `zipcode` int(11) NOT NULL,
  `zipType` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(20) NOT NULL,
  `location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `source`
--

INSERT INTO `source` (`zipcode`, `zipType`, `city`, `state`, `location`) VALUES
(7093, 'STANDARD', 'MONITOR', 'NJ', 'Monitor, NJ'),
(7093, 'STANDARD', 'TAURUS', 'NJ', 'Taurus, NJ'),
(7675, 'STANDARD', 'WESTWOOD', 'NJ', 'Westwood, NJ'),
(7675, 'STANDARD', 'OLD TAPPAN', 'NJ', 'Old Tappan, NJ'),
(7675, 'STANDARD', 'RIVER VALE', 'NJ', 'River Vale, NJ'),
(7675, 'STANDARD', 'RIVERVALE', 'NJ', 'Rivervale, NJ'),
(7677, 'STANDARD', 'WOODCLIFF LAKE', 'NJ', 'Woodcliff Lake, NJ'),
(7677, 'STANDARD', 'WESTWOOD', 'NJ', 'Westwood, NJ'),
(7677, 'STANDARD', 'WOODCLIFF LK', 'NJ', 'Woodcliff Lk, NJ'),
(7885, 'STANDARD', 'WHARTON', 'NJ', 'Wharton, NJ'),
(7981, 'STANDARD', 'WHIPPANY', 'NJ', 'Whippany, NJ'),
(7999, 'STANDARD', 'WHIPPANY', 'NJ', 'Whippany, NJ'),
(8888, 'PO BOX', 'WHITEHOUSE', 'NJ', 'Whitehouse, NJ'),
(8889, 'STANDARD', 'WHITEHOUSE STATION', 'NJ', 'Whitehouse Station, NJ'),
(8889, 'STANDARD', 'WHITE HSE STA', 'NJ', 'White Hse Sta, NJ'),
(6084, 'STANDARD', 'TOLLAND', 'CT', 'Tolland, CT'),
(6790, 'STANDARD', 'TORRINGTON', 'CT', 'Torrington, CT'),
(6791, 'STANDARD', 'HARWINTON', 'CT', 'Harwinton, CT'),
(6791, 'STANDARD', 'TORRINGTON', 'CT', 'Torrington, CT'),
(6792, 'UNIQUE', 'TORRINGTON', 'CT', 'Torrington, CT'),
(6792, 'UNIQUE', 'HARWINTON', 'CT', 'Harwinton, CT'),
(6792, 'UNIQUE', 'M B I INC', 'CT', 'M B I Inc, CT'),
(6382, 'STANDARD', 'UNCASVILLE', 'CT', 'Uncasville, CT'),
(6013, 'STANDARD', 'BURLINGTON', 'CT', 'Burlington, CT'),
(6013, 'STANDARD', 'UNIONVILLE', 'CT', 'Unionville, CT'),
(6085, 'STANDARD', 'UNIONVILLE', 'CT', 'Unionville, CT'),
(6085, 'STANDARD', 'BURLINGTON', 'CT', 'Burlington, CT'),
(6085, 'STANDARD', 'FARMINGTON', 'CT', 'Farmington, CT'),
(6085, 'STANDARD', 'LAKE GARDA', 'CT', 'Lake Garda, CT'),
(6087, 'UNIQUE', 'UNIONVILLE', 'CT', 'Unionville, CT'),
(6087, 'UNIQUE', 'ACCR A DATA', 'CT', 'Accr A Data, CT'),
(6066, 'STANDARD', 'VERNON ROCKVILLE', 'CT', 'Vernon Rockville, CT'),
(6066, 'STANDARD', 'VERNON', 'CT', 'Vernon, CT'),
(6066, 'STANDARD', 'VERNON ROCKVL', 'CT', 'Vernon Rockvl, CT'),
(6066, 'STANDARD', 'ROCKVILLE', 'CT', 'Rockville, CT'),
(6066, 'STANDARD', 'TALCOTTVILLE', 'CT', 'Talcottville, CT'),
(6066, 'STANDARD', 'TURNPIKE', 'CT', 'Turnpike, CT'),
(6066, 'STANDARD', 'VERNON-ROCKVILLE', 'CT', 'Vernon-rockville, CT'),
(6383, 'PO BOX', 'VERSAILLES', 'CT', 'Versailles, CT'),
(6384, 'STANDARD', 'VOLUNTOWN', 'CT', 'Voluntown, CT'),
(6384, 'STANDARD', 'GLASGO', 'CT', 'Glasgo, CT'),
(6492, 'STANDARD', 'WALLINGFORD', 'CT', 'Wallingford, CT'),
(6492, 'STANDARD', 'YALESVILLE', 'CT', 'Yalesville, CT'),
(6493, 'UNIQUE', 'WALLINGFORD', 'CT', 'Wallingford, CT'),
(6493, 'UNIQUE', 'CT GEN MED CLAIMS OFFICE', 'CT', 'Ct Gen Med Claims Office, CT'),
(6493, 'UNIQUE', 'PUBLISHERS CLEARING HOUSE', 'CT', 'Publishers Clearing House, CT'),
(6494, 'UNIQUE', 'WALLINGFORD', 'CT', 'Wallingford, CT'),
(6494, 'UNIQUE', 'FOSDICK CORP', 'CT', 'Fosdick Corp, CT'),
(6495, 'UNIQUE', 'WALLINGFORD', 'CT', 'Wallingford, CT'),
(6495, 'UNIQUE', 'INTERNATIONAL MASTERS PUB', 'CT', 'International Masters Pub, CT'),
(6777, 'STANDARD', 'NEW PRESTON MARBLE DALE', 'CT', 'New Preston Marble Dale, CT'),
(6777, 'STANDARD', 'NEW PRESTON', 'CT', 'New Preston, CT');

-- --------------------------------------------------------

--
-- Table structure for table `upvotes`
--

CREATE TABLE IF NOT EXISTS `upvotes` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `fno` int(11) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
