CREATE DATABASE  IF NOT EXISTS `tesla` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tesla`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tesla
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumni`
--

DROP TABLE IF EXISTS `alumni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumni` (
  `alumni_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `rollno` varchar(16) NOT NULL,
  PRIMARY KEY (`alumni_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumni`
--

LOCK TABLES `alumni` WRITE;
/*!40000 ALTER TABLE `alumni` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchinfo`
--

DROP TABLE IF EXISTS `batchinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchinfo` (
  `batch_id` int(11) NOT NULL,
  `timetable_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `batchinfo_fk_timetable_file_id_idx` (`timetable_file_id`),
  CONSTRAINT `batchinfo_fk_timetable_file_id` FOREIGN KEY (`timetable_file_id`) REFERENCES `files` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchinfo`
--

LOCK TABLES `batchinfo` WRITE;
/*!40000 ALTER TABLE `batchinfo` DISABLE KEYS */;
INSERT INTO `batchinfo` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL);
/*!40000 ALTER TABLE `batchinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchsub`
--

DROP TABLE IF EXISTS `batchsub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchsub` (
  `batch_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `attendance_file_id` int(11) DEFAULT NULL,
  `result_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`batch_id`,`subject_id`),
  KEY `batchsub_fk_attendance_file_id_idx` (`attendance_file_id`),
  KEY `batchsub_fk_result_file_id_idx` (`result_file_id`),
  KEY `batchsub_fk_teacher_id_idx` (`teacher_id`),
  CONSTRAINT `batchsub_fk_attendance_file_id` FOREIGN KEY (`attendance_file_id`) REFERENCES `files` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `batchsub_fk_result_file_id` FOREIGN KEY (`result_file_id`) REFERENCES `files` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `batchsub_fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchsub`
--

LOCK TABLES `batchsub` WRITE;
/*!40000 ALTER TABLE `batchsub` DISABLE KEYS */;
INSERT INTO `batchsub` VALUES (1,1,NULL,NULL,NULL),(1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `batchsub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_code` varchar(8) NOT NULL,
  `course_name` varchar(128) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `fk_department_id_idx` (`department_id`),
  KEY `course_fk_department_id_idx` (`department_id`),
  CONSTRAINT `course_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'HCS','BSc. Hons. Computer Science',1);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(128) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Computer Science'),(2,'Mathematics'),(3,'Physics'),(4,'Chemistry'),(5,'Commerce'),(6,'English');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(64) NOT NULL,
  `file_path` varchar(256) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (22,'attendance_b1_s1_t3_filename_','root'),(23,'attendance_b1_s2_t3_filename_','root'),(24,'attendance_b1_s1_t3_filename_','root'),(25,'attendance_b1_s1_t3_filename_','root'),(26,'attendance_b1_s2_t3_filename_','root'),(27,'attendance_b1_s1_t3_filename_','root'),(28,'attendance_b1_s1_t3_filename_','root'),(29,'attendance_b1_s1_t3_filename_','root'),(30,'attendance_b1_s2_t3_filename_','root');
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modificationrecord`
--

DROP TABLE IF EXISTS `modificationrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modificationrecord` (
  `table_name` varchar(64) NOT NULL,
  `datemodified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modificationrecord`
--

LOCK TABLES `modificationrecord` WRITE;
/*!40000 ALTER TABLE `modificationrecord` DISABLE KEYS */;
INSERT INTO `modificationrecord` VALUES ('subject1','2016-09-21 16:34:00'),('subject2','2016-09-21 15:45:10');
/*!40000 ALTER TABLE `modificationrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_name` varchar(64) NOT NULL,
  `notice_file_id` int(11) NOT NULL,
  `date_of_upload` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notice_id`),
  KEY `notice_fk_notice_file_id_idx` (`notice_file_id`),
  CONSTRAINT `notice_fk_notice_file_id` FOREIGN KEY (`notice_file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesterinfo`
--

DROP TABLE IF EXISTS `semesterinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semesterinfo` (
  `course_id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `batch_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`semester`),
  UNIQUE KEY `PK` (`course_id`,`semester`),
  CONSTRAINT `semesterinfo_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesterinfo`
--

LOCK TABLES `semesterinfo` WRITE;
/*!40000 ALTER TABLE `semesterinfo` DISABLE KEYS */;
INSERT INTO `semesterinfo` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6);
/*!40000 ALTER TABLE `semesterinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `dob` date NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `doa` date NOT NULL,
  `course_id` int(11) NOT NULL,
  `rollno` varchar(16) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `student_fk_course_id_idx` (`course_id`),
  CONSTRAINT `student_fk_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Jatin Rohilla','1996-10-21','jatinrohilla690@gmail.com','895063665','2014-04-11',1,'14HCS4109',5);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(32) NOT NULL,
  `subject_type` varchar(45) DEFAULT 'Theory',
  `subject_name` varchar(64) NOT NULL,
  `syllabus_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `subject_fk_syllabus_file_id_idx` (`syllabus_file_id`),
  CONSTRAINT `subject_fk_syllabus_file_id` FOREIGN KEY (`syllabus_file_id`) REFERENCES `files` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'CSHT-101','1','Programming Fundamentals',NULL),(2,'CSHT-102','1','Discrete Structures',NULL),(3,'ELHT-301','1','Digital Electronics',NULL),(4,'MAPT-101','1','Calculas and Matricies',NULL),(5,'CSHT-203','1','Data Structures',NULL),(6,'CSHT-204','1','Computer System Architecture',NULL),(7,'ENPT-201','1','Technical Writing & Communication',NULL),(8,'MAPT-202','1','Calculas and Geometry',NULL),(9,'CSHT-305','1','Algorithms',NULL),(10,'CSHT-306','1','System Programming',NULL),(11,'CSHT-307','1','Database Systems',NULL),(12,'STC-301','1','Basic Statistics and Probability',NULL),(13,'CSHT-408','1','Operating Systems',NULL),(14,'CSHT-409','1','Networks',NULL),(15,'CSHT-410','1','Software Engineering',NULL),(16,'MAPT-404','1','Differential Equations',NULL),(17,'CSHT-511','1','Theory of Computations',NULL),(18,'CSHT-512','1','Microprocessors',NULL),(19,'CSHT-513','1','Internet Technologies',NULL),(20,'MAPT-505','1','Operational Research',NULL),(21,'CSHT-614','1','Computer Graphics',NULL),(22,'CSHT-615','1','Information Security',NULL),(23,'STC-402','1','Statistical Methodology',NULL),(24,'CHPT-101','1','Chemistry-I',NULL),(25,'CSPT-101','1','Comp Sc-I',NULL),(26,'ELPT-101','1','Electronics-I',NULL),(27,'PHPT-101','1','Physics-I',NULL),(28,'CSAT-101','1','Computational Skills',NULL),(29,'PHPT-202','1','Physics-II',NULL),(30,'CSPT-202','1','Chemistry-II',NULL),(31,'CSPT-202','1','Comp Sc-II',NULL),(32,'ELPT-202','1','Electronics-II',NULL);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(32) NOT NULL,
  `doj` date NOT NULL,
  `department_id` int(11) NOT NULL,
  `aboutme_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `teacher_fk_department_id_idx` (`department_id`),
  KEY `teacher_fk_file_id_idx` (`aboutme_file_id`),
  CONSTRAINT `teacher_fk_department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON UPDATE CASCADE,
  CONSTRAINT `teacher_fk_file_id` FOREIGN KEY (`aboutme_file_id`) REFERENCES `files` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (3,'Ankit Sharma','jatinrohilla691@gmail.com','8950636066','2014-11-14',1,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(32) NOT NULL,
  `privilege` varchar(32) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jatin','jatinrohilla69@gmail.com','jatin','admin'),(2,'jatin690','jatinrohilla690@gmail.com','jj','student'),(3,'ankit','jatinrohilla691@gmail.com','mm','teacher');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tesla'
--

--
-- Dumping routines for database 'tesla'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-15 19:49:40
