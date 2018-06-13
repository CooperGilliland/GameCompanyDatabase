-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2018 at 06:43 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sp18_c_gilliland`
--

-- --------------------------------------------------------

--
-- Table structure for table `benifits`
--

CREATE TABLE `benifits` (
  `VacDays` int(11) NOT NULL,
  `SickDays` int(11) NOT NULL,
  `UnionStatus` tinyint(1) NOT NULL,
  `Fk_EID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchNum` decimal(2,0) NOT NULL,
  `BranchName` char(50) DEFAULT NULL,
  `BranchLocation` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchNum`, `BranchName`, `BranchLocation`) VALUES
('1', 'Henry Downtown', 'Phoenix, AZ'),
('2', 'Henry on the Hill', '1289 Bedford'),
('3', 'Henry Brentwood', 'Brentwood Mall'),
('4', 'Henry Eastshore', 'Eastshore Mall');

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `Fk_PID` int(11) NOT NULL,
  `BranchNum` decimal(2,0) NOT NULL,
  `CopyNum` decimal(2,0) NOT NULL,
  `Quality` char(20) DEFAULT NULL,
  `Price` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copy`
--

INSERT INTO `copy` (`Fk_PID`, `BranchNum`, `CopyNum`, `Quality`, `Price`) VALUES
(42, '1', '1', 'New', '59.99'),
(42, '1', '2', 'New', '59.99'),
(42, '1', '3', 'New', '59.99'),
(42, '1', '4', 'New', '59.99'),
(42, '1', '5', 'New', '59.99'),
(42, '1', '6', 'New', '59.99'),
(42, '1', '7', 'New', '59.99'),
(42, '1', '8', 'New', '59.99'),
(42, '1', '9', 'New', '59.99'),
(42, '1', '10', 'New', '59.99');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EID` int(11) NOT NULL,
  `EFirstName` text NOT NULL,
  `ELastName` text NOT NULL,
  `Fk_PCID` int(11) NOT NULL,
  `Fk_ETID` int(11) NOT NULL,
  `Fk_PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`EID`, `EFirstName`, `ELastName`, `Fk_PCID`, `Fk_ETID`, `Fk_PID`) VALUES
(1, 'Cooper', 'Gilliland', 121, 6, 42),
(2, 'James', 'Holden', 343, 3, 216),
(3, 'Bizzy', 'Mark', 222, 2, 313),
(4, 'Daneel', 'Olivaw', 121, 1, 66),
(5, 'R.', 'Giskard', 121, 1, 66),
(6, 'Rosamund', 'Bookchild', 222, 5, 712),
(7, 'Ford', 'Prefect', 121, 6, 313),
(8, 'Arthur', 'Dent', 121, 6, 66),
(9, 'Zaphod', 'Beeblebrox', 343, 5, 313),
(10, 'Hazel', 'D\'Ark', 222, 2, 712),
(11, 'Harry', 'Dresden', 343, 5, 42),
(12, 'Ged', 'Sparrowhawk', 121, 3, 66),
(13, 'Tom', 'Bombadil', 121, 6, 216),
(14, 'Bora', 'Gobachul', 222, 5, 42),
(15, 'Zeep', 'Xanflorp', 222, 1, 66),
(16, 'Adam', 'Thallbard', 222, 5, 313),
(17, 'Joseph', 'Ringly', 343, 2, 216),
(18, 'Simon', 'Green', 222, 3, 216),
(19, 'Bazel', 'Narthum', 121, 6, 712),
(20, 'Molly', 'Carpenter', 222, 5, 712),
(21, 'John', 'Zarnifex', 121, 6, 50);

-- --------------------------------------------------------

--
-- Table structure for table `employeetype`
--

CREATE TABLE `employeetype` (
  `ETID` int(11) NOT NULL,
  `ETypeName` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employeetype`
--

INSERT INTO `employeetype` (`ETID`, `ETypeName`, `Description`) VALUES
(1, 'Game Programmer', 'TBA'),
(2, 'Game Artist', 'TBA'),
(3, 'Game Designer', 'TBA'),
(4, 'Producer', 'TBA'),
(5, 'Tester', 'TBA'),
(6, 'Author', 'TBA');

-- --------------------------------------------------------

--
-- Table structure for table `paytype`
--

CREATE TABLE `paytype` (
  `PCID` int(11) NOT NULL,
  `PayDesc` text NOT NULL,
  `PayAmount` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paytype`
--

INSERT INTO `paytype` (`PCID`, `PayDesc`, `PayAmount`) VALUES
(121, 'Salary', '55000'),
(222, 'Hourly', '25'),
(343, 'Contract', '20000');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `PID` int(11) NOT NULL,
  `PName` text NOT NULL,
  `PLaunchDate` date NOT NULL,
  `Fk_SID` int(11) NOT NULL,
  `publisher` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`PID`, `PName`, `PLaunchDate`, `Fk_SID`, `publisher`) VALUES
(42, 'Limivorous', '2022-06-11', 1, 'GBX'),
(50, 'Skin Game', '2025-04-22', 1, 'GBX'),
(66, 'Fate Amenable to Change', '2025-03-07', 1, 'GBX'),
(216, 'Prime Mover', '2019-08-03', 2, 'GBX'),
(313, 'Eschatologist', '2019-01-01', 3, 'GBX'),
(712, 'Gunboat Diplomat', '2018-07-15', 4, 'GBX');

-- --------------------------------------------------------

--
-- Table structure for table `projectbudget`
--

CREATE TABLE `projectbudget` (
  `Fk_PID` int(11) NOT NULL,
  `FundsRemaining` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectbudget`
--

INSERT INTO `projectbudget` (`Fk_PID`, `FundsRemaining`) VALUES
(42, '1000000'),
(50, '5500000'),
(66, '2500000'),
(216, '572000'),
(313, '200000'),
(712, '115000');

-- --------------------------------------------------------

--
-- Table structure for table `projectstate`
--

CREATE TABLE `projectstate` (
  `SID` int(11) NOT NULL,
  `StateDesc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectstate`
--

INSERT INTO `projectstate` (`SID`, `StateDesc`) VALUES
(1, 'Production'),
(2, 'Alpha'),
(3, 'Beta'),
(4, 'Launch');

-- --------------------------------------------------------

--
-- Table structure for table `wrote`
--

CREATE TABLE `wrote` (
  `Fk_PID` int(11) NOT NULL,
  `Fk_EID` int(11) NOT NULL,
  `Sequence` decimal(2,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benifits`
--
ALTER TABLE `benifits`
  ADD UNIQUE KEY `Fk_EID` (`Fk_EID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchNum`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`Fk_PID`,`BranchNum`,`CopyNum`),
  ADD KEY `BranchNum` (`BranchNum`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EID`),
  ADD KEY `Fk_PayCode` (`Fk_PCID`),
  ADD KEY `Fk_ETID` (`Fk_ETID`),
  ADD KEY `Fk_PID` (`Fk_PID`);

--
-- Indexes for table `employeetype`
--
ALTER TABLE `employeetype`
  ADD PRIMARY KEY (`ETID`);

--
-- Indexes for table `paytype`
--
ALTER TABLE `paytype`
  ADD PRIMARY KEY (`PCID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `Fk_SID` (`Fk_SID`),
  ADD KEY `publisher` (`publisher`);

--
-- Indexes for table `projectbudget`
--
ALTER TABLE `projectbudget`
  ADD UNIQUE KEY `PID_2` (`Fk_PID`),
  ADD KEY `PID` (`Fk_PID`);

--
-- Indexes for table `projectstate`
--
ALTER TABLE `projectstate`
  ADD PRIMARY KEY (`SID`),
  ADD KEY `SID` (`SID`);

--
-- Indexes for table `wrote`
--
ALTER TABLE `wrote`
  ADD PRIMARY KEY (`Fk_PID`,`Fk_EID`),
  ADD KEY `Fk_EID` (`Fk_EID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `EID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `benifits`
--
ALTER TABLE `benifits`
  ADD CONSTRAINT `Benifits_ibfk_1` FOREIGN KEY (`Fk_EID`) REFERENCES `employee` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`Fk_PID`) REFERENCES `project` (`PID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`BranchNum`) REFERENCES `branch` (`BranchNum`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`Fk_ETID`) REFERENCES `employeetype` (`ETID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Employee_ibfk_3` FOREIGN KEY (`Fk_PID`) REFERENCES `project` (`PID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `Employee_ibfk_4` FOREIGN KEY (`Fk_PCID`) REFERENCES `paytype` (`PCID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`Fk_SID`) REFERENCES `projectstate` (`SID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `projectbudget`
--
ALTER TABLE `projectbudget`
  ADD CONSTRAINT `ProjectBudget_ibfk_1` FOREIGN KEY (`Fk_PID`) REFERENCES `project` (`PID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wrote`
--
ALTER TABLE `wrote`
  ADD CONSTRAINT `wrote_ibfk_1` FOREIGN KEY (`Fk_PID`) REFERENCES `project` (`PID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `wrote_ibfk_2` FOREIGN KEY (`Fk_EID`) REFERENCES `employee` (`EID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
