CREATE TABLE `todo` (
  `no` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `status` int DEFAULT '0',
  `reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `upd_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`no`)
) COMMENT='할일';

INSERT INTO todo ( name)
values
("세수"),
("양치"),
("샤워"),
("머리감기"),
("옷갈아입기"),
("학원가기"),
("복습하기"),
("자기"),
("코골기"),
("꿈꾸기")

SELECT * FROM todo;