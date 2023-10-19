-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2020 at 08:56 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `odss_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `file_json` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `description`, `file_json`, `user_id`, `date_created`) VALUES
(1, 'Sample documents', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt orci eu erat dignissim, id commodo enim mattis. Cras egestas interdum ipsum. Fusce pretium porttitor tellus quis malesuada. Nullam et ex ullamcorper, accumsan nunc sed, tempor erat. Phasellus non nisi sagittis massa laoreet convallis eu id mauris. Cras malesuada sodales lectus non vehicula. Nulla lacinia fringilla felis convallis tempus. Cras volutpat lorem vitae congue rutrum. Sed scelerisque tempus fermentum.&lt;/span&gt;																						', '[\"1605074220_sample (4).pdf\",\"1605074220_sample (3).pdf\"]', 1, '2020-11-11 13:47:40'),
(2, 'Sample documents', '&lt;h2&gt;&lt;b&gt;Sample Header&amp;nbsp;&lt;/b&gt;&lt;/h2&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt orci eu erat dignissim, id commodo enim mattis. Cras egestas interdum ipsum. Fusce pretium porttitor tellus quis malesuada. Nullam et ex ullamcorper, accumsan nunc sed, tempor erat. Phasellus non nisi sagittis massa laoreet convallis eu id mauris. Cras malesuada sodales lectus non vehicula. Nulla lacinia fringilla felis convallis tempus. Cras volutpat lorem vitae congue rutrum. Sed scelerisque tempus fermentum.&lt;/span&gt;&lt;/p&gt;&lt;ol&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt orci eu erat dignissim, id commodo enim mattis. Cras egestas interdum ipsum. Fusce pretium porttitor tellus quis malesuada. Nullam et ex ullamcorper, accumsan nunc sed, tempor erat. Phasellus non nisi sagittis massa laoreet convallis eu id mauris. Cras malesuada sodales lectus non vehicula. Nulla lacinia fringilla felis convallis tempus. Cras volutpat lorem vitae congue rutrum. Sed scelerisque tempus fermentum.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt orci eu erat dignissim, id commodo enim mattis. Cras egestas interdum ipsum. Fusce pretium porttitor tellus quis malesuada. Nullam et ex ullamcorper, accumsan nunc sed, tempor erat. Phasellus non nisi sagittis massa laoreet convallis eu id mauris. Cras malesuada sodales lectus non vehicula. Nulla lacinia fringilla felis convallis tempus. Cras volutpat lorem vitae congue rutrum. Sed scelerisque tempus fermentum.&lt;/span&gt;&lt;/li&gt;&lt;li&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt orci eu erat dignissim, id commodo enim mattis. Cras egestas interdum ipsum. Fusce pretium porttitor tellus quis malesuada. Nullam et ex ullamcorper, accumsan nunc sed, tempor erat. Phasellus non nisi sagittis massa laoreet convallis eu id mauris. Cras malesuada sodales lectus non vehicula. Nulla lacinia fringilla felis convallis tempus. Cras volutpat lorem vitae congue rutrum. Sed scelerisque tempus fermentum.&lt;/span&gt;&lt;/li&gt;&lt;/ol&gt;															', '[\"1605080340_Sample_Doc.doc\",\"1605080340_sample_pdf_file.pdf\"]', 2, '2020-11-11 15:39:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2= users',
  `avatar` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Admin', 'Admin', '', '+12354654787', 'Sample', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, '', '2020-11-11 15:35:19'),
(2, 'John', 'Smith', 'C', '+14526-5455-44', 'Address', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 2, '1605080820_avatar.jpg', '2020-11-11 09:24:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
