SET NAMES UTF8;
DROP DATABASE IF EXISTS yw;
CREATE DATABASE yw CHARSET=UTF8;
USE yw;

CREATE TABLE yw_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),
  upwd  VARCHAR(32)
);
INSERT INTO yw_login VALUES(null,'tom','123');

INSERT INTO yw_login VALUES(null,'jerry','123456');

INSERT INTO yw_login VALUES(null,'Tim','123789');

INSERT INTO yw_login VALUES(null,'Mina','112233');

INSERT INTO yw_login VALUES(null,'kk','778889');

INSERT INTO yw_login VALUES(null,'jj','556644');

CREATE TABLE yw_list(
  id INT PRIMARY KEY AUTO_INCREMENT,
  img_url  VARCHAR(136),
   author  VARCHAR(64),
   title   VARCHAR(255),
   price    DECIMAL(10,2)
);
INSERT INTO yw_list VALUES(null,'20190620172154676e2d474be.jpg','张占占','综合版，天使',4230);
INSERT INTO yw_list VALUES(null,'20160523115131994a41ba826.jpg','潘平观','布面油画，林系列之秋意正浓',20870);
INSERT INTO yw_list VALUES(null,'201906271122162458c24b998.jpg','廖建华','布面丙烯，京LJH1521f',42300);
INSERT INTO yw_list VALUES(null,'20190627114427934e67ab945.jpg','王磊','布面油画，室内风景系列之《蓝色温馨》',15670);
INSERT INTO yw_list VALUES(null,'201607081724059180f144e6a.jpg','徐娜','木口木刻，上善若水之二',10800);
INSERT INTO yw_list VALUES(null,'201906271151550405a930d71.jpg','张琳','布面油画，想象的共同体',25440);
INSERT INTO yw_list VALUES(null,'201907040958492857e02baa3.jpg','单良','纸本水墨，quiet',27440);
INSERT INTO yw_list VALUES(null,'201906271115483638a06a84d.jpg','李小小','哈内姆勒，成长',5270);
INSERT INTO yw_list VALUES(null,'2016042215132587398f37ec5.jpg','顾强','布面油画，爱丽丝的梦',21260);
INSERT INTO yw_list VALUES(null,'20190612140546779bc12bdd9.jpg','李龙飞','玻璃钢烤漆，冷空气',3500);
INSERT INTO yw_list VALUES(null,'201609131820452978749b3ea.jpg','孙一波','布面丙烯，我的画布',8780);
INSERT INTO yw_list VALUES(null,'2019062118024457555de2828.jpg','李化帅','数码版画，猫特洛小姐',3500);
INSERT INTO yw_list VALUES(null,'20160918190254433251e4d2a.jpg','范睿晨','树脂着色，没讲完的故事',23000);
INSERT INTO yw_list VALUES(null,'201907041112194146694c27f.jpg','姚永强','纸本水墨，十里驭风',13720);


CREATE TABLE yw_cart(
	id INT PRIMARY KEY AUTO_INCREMENT,
         author   VARCHAR(32),
        art_title VARCHAR(64),
	ellipsis  VARCHAR(64),
        artSize   VARCHAR(64),
	price    DECIMAL(10,2),
	art_img  VARCHAR(136),
	count    INT,
	uid      INT
);
INSERT INTO yw_cart VALUES(null,'范睿晨','没讲完的故事——霸王龙','树脂着色','35x85x35cm',23000,'201907041112194146694c27f.jpg',1,1);
INSERT INTO yw_cart VALUES(null,'张占占','我的礼物','综合版','50x60cm',4230,'20190620172154676e2d474be.jpg',1,1);
INSERT INTO yw_cart VALUES(null,'潘平观','林系列之 秋意正浓','布面油画','60x60cm',20870,'20160523115131994a41ba826.jpg',1,1);
INSERT INTO yw_cart VALUES(null,'李龙飞','戴珍珠耳环的少女','玻璃钢烤漆','17x25x16cm',2000,'20190612140546779bc12bdd9.jpg',1,1);
INSERT INTO yw_cart VALUES(null,'王磊','室内风景系列之《蓝色温馨》','布面油画','75x55cm',15670,'20190627114427934e67ab945.jpg',1,1);










