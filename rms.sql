-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 05, 2015 at 12:16 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rms`
--
CREATE DATABASE IF NOT EXISTS `rms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rms`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `client_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `added_by` int(10) unsigned zerofill DEFAULT NULL,
  `added_date` date DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `name`, `added_by`, `added_date`) VALUES
(0000000004, 'Client B', 0000000001, '2015-02-18'),
(0000000005, 'Client C', 0000000001, '2015-02-18'),
(0000000006, 'Client A', 0000000001, '2015-02-18');

-- --------------------------------------------------------

--
-- Table structure for table `effort`
--

CREATE TABLE IF NOT EXISTS `effort` (
  `effort_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned zerofill NOT NULL,
  `project_id` int(10) unsigned zerofill NOT NULL,
  `resource_id` int(10) unsigned zerofill NOT NULL,
  `year` int(5) NOT NULL,
  `performance` int(2) DEFAULT NULL,
  `jan` float DEFAULT NULL,
  `feb` float DEFAULT NULL,
  `mar` float DEFAULT NULL,
  `apr` float DEFAULT NULL,
  `may` float DEFAULT NULL,
  `jun` float DEFAULT NULL,
  `jul` float DEFAULT NULL,
  `aug` float DEFAULT NULL,
  `sep` float DEFAULT NULL,
  `oct` float DEFAULT NULL,
  `nov` float DEFAULT NULL,
  `dece` float DEFAULT NULL,
  PRIMARY KEY (`effort_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `effort`
--

INSERT INTO `effort` (`effort_id`, `task_id`, `project_id`, `resource_id`, `year`, `performance`, `jan`, `feb`, `mar`, `apr`, `may`, `jun`, `jul`, `aug`, `sep`, `oct`, `nov`, `dece`) VALUES
(0000000006, 0000000007, 0000000005, 0000000001, 2015, 1, 0, 0.4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0000000007, 0000000008, 0000000009, 0000000005, 2015, 2, 0, 0, 0, 0.4, 0.6, 0, 0, 0, 0, 0, 0, 0),
(0000000008, 0000000009, 0000000008, 0000000003, 2015, 1, 0, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0000000009, 0000000010, 0000000010, 0000000002, 2015, 1, 0.5, 0.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(0000000010, 0000000011, 0000000005, 0000000003, 2015, NULL, 0, 0.3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE IF NOT EXISTS `feedback` (
  `feedback_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned zerofill NOT NULL,
  `subject` varchar(30) NOT NULL,
  `content` varchar(500) DEFAULT 'No feedbacks added',
  `flag` enum('0','1') DEFAULT '1',
  `added_by` int(10) unsigned zerofill NOT NULL,
  `added_date` date NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `task_id`, `subject`, `content`, `flag`, `added_by`, `added_date`) VALUES
(0000000015, 0000000007, 'qweqwe', 'qweqweqwe', '1', 0000000001, '2015-03-01'),
(0000000016, 0000000007, 'asdasd', 'asdasd', '1', 0000000001, '2015-03-01'),
(0000000017, 0000000011, 'zxczxczx', 'czxczxczxc', '1', 0000000003, '2015-03-04'),
(0000000018, 0000000007, 'qweqwe', 'qweqwe', '1', 0000000001, '2015-03-04');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `project_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `name` varchar(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `type` enum('Project-Based','Time and Material','','') NOT NULL,
  `status` enum('No movement','Proposal','Official go','Verbal go','For estimation','Ongoing estimation','Dropped','Ongoing','Closed') NOT NULL,
  `business_unit` enum('Philippines','Japan','Rest of the World','Alliance') NOT NULL,
  `milestone` varchar(256) DEFAULT 'No milestone added',
  `resources_needed` int(6) DEFAULT NULL,
  `reference` enum('Outlook','Summary') NOT NULL,
  `added_by` int(10) unsigned zerofill NOT NULL,
  `added_date` date NOT NULL,
  `updated_by` int(10) unsigned zerofill DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_id`, `client_id`, `name`, `start_date`, `end_date`, `type`, `status`, `business_unit`, `milestone`, `resources_needed`, `reference`, `added_by`, `added_date`, `updated_by`, `updated_date`) VALUES
(0000000002, 0000000000, 'Outlook A', '2015-02-03', '2015-06-11', 'Project-Based', 'Proposal', 'Philippines', 'No milestone yet', 6, 'Outlook', 0000000001, '2015-02-18', 0000000001, '2015-02-18'),
(0000000005, 0000000004, 'Project B', '2015-02-01', '2015-02-06', 'Time and Material', 'Ongoing', 'Alliance', 'No milestone yet', NULL, 'Summary', 0000000001, '2015-02-18', 0000000001, '2015-03-02'),
(0000000008, 0000000005, 'Project C', '2015-02-01', '2015-07-02', 'Time and Material', 'Ongoing', 'Alliance', 'No milestone yet', NULL, 'Summary', 0000000001, '2015-02-18', 0000000001, '2015-02-19'),
(0000000009, 0000000006, 'Project A', '2015-03-02', '2015-06-05', 'Project-Based', 'Ongoing', 'Alliance', 'No milestone yet', NULL, 'Summary', 0000000001, '2015-02-18', NULL, NULL),
(0000000010, 0000000005, 'My project', '2015-01-03', '2015-02-01', 'Time and Material', 'Ongoing', 'Philippines', 'No milestone yet', NULL, 'Summary', 0000000001, '2015-02-20', NULL, NULL),
(0000000011, 0000000006, 'Project D', '2015-01-01', '2015-02-25', 'Project-Based', 'Ongoing', 'Alliance', 'No milestone yet', NULL, 'Summary', 0000000001, '2015-02-24', NULL, NULL),
(0000000012, 0000000004, 'Project E', '2015-01-01', '2015-01-02', 'Project-Based', 'Ongoing', 'Philippines', 'No milestone yet', NULL, 'Summary', 0000000001, '2015-02-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `remarks`
--

CREATE TABLE IF NOT EXISTS `remarks` (
  `remarks_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `project_id` int(10) unsigned zerofill NOT NULL,
  `subject` varchar(30) NOT NULL,
  `content` varchar(500) NOT NULL,
  `flag` enum('0','1') DEFAULT '1',
  `added_by` int(10) unsigned zerofill NOT NULL,
  `added_date` date NOT NULL,
  PRIMARY KEY (`remarks_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `remarks`
--

INSERT INTO `remarks` (`remarks_id`, `project_id`, `subject`, `content`, `flag`, `added_by`, `added_date`) VALUES
(0000000010, 0000000012, 'asdasd', 'asdasd', '0', 0000000004, '2015-03-01'),
(0000000011, 0000000012, 'qweqwe', 'qweqe', '0', 0000000004, '2015-03-01'),
(0000000012, 0000000005, 'ertert', 'ertert', '0', 0000000004, '2015-03-01'),
(0000000013, 0000000005, 'fsdfsdf', 'sdfsdf', '0', 0000000004, '2015-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE IF NOT EXISTS `resource` (
  `resource_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `business_unit` enum('Local','JP Independent','ROW','Alliance') NOT NULL,
  `date_hired` date NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`resource_id`, `first_name`, `middle_name`, `last_name`, `business_unit`, `date_hired`) VALUES
(0000000001, 'Mario', 'Hotsummers', 'Newinters', 'Alliance', '2013-06-16'),
(0000000002, 'Barry', 'Watkins', 'Mcbride', 'Local', '2013-03-20'),
(0000000003, 'Marcia', 'Snyder', 'Mckenzie', 'Alliance', '2012-08-08'),
(0000000004, 'Emma', 'Brewer', 'Osborne', 'Alliance', '2011-07-07'),
(0000000005, 'Maria', 'Jones', 'Johnson', 'Local', '2010-03-04'),
(0000000006, 'Christopher', 'Hodge', 'Acosta', 'Alliance', '2009-01-09'),
(0000000007, 'Amy', 'Lanz', 'Turcotte', 'Alliance', '2010-03-11');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `status` enum('Assigned','Done','Tested','Accepted') NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `project_id`, `name`, `status`, `start_date`, `end_date`) VALUES
(7, 5, 'Task tb', 'Tested', '2015-02-01', '2015-02-06'),
(8, 9, 'Task A', 'Assigned', '2015-04-01', '2015-05-01'),
(9, 8, 'Task C', 'Done', '2015-02-01', '2015-04-30'),
(10, 10, 'My task', 'Done', '2015-01-07', '2015-02-01'),
(11, 5, 'QWER', 'Done', '2015-02-04', '2015-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000',
  `username` varchar(30) NOT NULL,
  `password` varchar(256) NOT NULL,
  `type` enum('Manager','Employee','Client') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `type_id`, `username`, `password`, `type`, `email`) VALUES
(0000000001, 0000000000, 'Admin', '21232f297a57a5a743894a0e4a801fc3', 'Manager', 'xanpatan@gmail.com'),
(0000000002, 0000000001, 'Mario', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000003, 0000000002, 'Barry', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000004, 0000000003, 'Marcia', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000005, 0000000004, 'Emma', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000006, 0000000005, 'Maria', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000007, 0000000006, 'Christopher', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000008, 0000000007, 'Amy', 'ee11cbb19052e40b07aac0ca060c23ee', 'Employee', NULL),
(0000000015, 0000000001, 'Client A', 'ee11cbb19052e40b07aac0ca060c23ee', 'Client', NULL),
(0000000016, 0000000002, 'Client A', 'ee11cbb19052e40b07aac0ca060c23ee', 'Client', NULL),
(0000000017, 0000000003, 'Client A', 'ee11cbb19052e40b07aac0ca060c23ee', 'Client', NULL),
(0000000018, 0000000004, 'Client B', 'ee11cbb19052e40b07aac0ca060c23ee', 'Client', NULL),
(0000000019, 0000000005, 'Client C', 'ee11cbb19052e40b07aac0ca060c23ee', 'Client', NULL),
(0000000020, 0000000006, 'Client A', 'ee11cbb19052e40b07aac0ca060c23ee', 'Client', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
