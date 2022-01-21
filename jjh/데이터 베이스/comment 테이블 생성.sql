DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_bd_num` int NOT NULL,
  `co_me_id` varchar(20) NOT NULL,
  `co_reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `co_del` varchar(2) NOT NULL DEFAULT 'N',
  `co_ori_num` int NOT NULL,
  `co_contents` longtext NOT NULL,
  PRIMARY KEY (`co_num`),
  KEY `co_bd_num_idx` (`co_bd_num`),
  KEY `co_me_id_idx` (`co_me_id`),
  CONSTRAINT `co_bd_num` FOREIGN KEY (`co_bd_num`) REFERENCES `board` (`bd_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `co_me_id` FOREIGN KEY (`co_me_id`) REFERENCES `member` (`me_id`) ON DELETE CASCADE ON UPDATE CASCADE
) 