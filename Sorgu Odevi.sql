CREATE DATABASE db_firma;
USE db_firma;

CREATE TABLE tbl_birim(
birim_id_pk INT PRIMARY KEY IDENTITY,
birim_adi VARCHAR(40)
);

CREATE TABLE tbl_pc(
pc_id_pk INT PRIMARY KEY IDENTITY,
pc_mac_adres VARCHAR(17) UNIQUE,
pc_ekran_karti VARCHAR(30),
pc_islemci VARCHAR(20),
pc_ram_boyutu INT CHECK(pc_ram_boyutu >= 4),
);

CREATE TABLE tbl_calisanlar(
calisan_id_pk INT PRIMARY KEY IDENTITY,
calisan_adi VARCHAR(20) NOT NULL,
calisan_soyadi VARCHAR(20) NOT NULL,
calisan_maasi DECIMAL(7,2) CHECK(calisan_maasi >= 500),
calisan_tel VARCHAR(11),
calisan_pc INT FOREIGN KEY REFERENCES tbl_pc(pc_id_pk),
calisan_birim_fk INT FOREIGN KEY REFERENCES tbl_birim(birim_id_pk)
);

INSERT INTO tbl_birim VALUES ('Software Engineering');
INSERT INTO tbl_birim VALUES ('Cyber Security');
INSERT INTO tbl_birim VALUES ('DataBase Engineering');
INSERT INTO tbl_birim VALUES ('Network Management');
INSERT INTO tbl_birim VALUES ('Frontend Developing');
INSERT INTO tbl_birim VALUES ('Backend Developing');
INSERT INTO tbl_birim VALUES ('Fullstack Developing');
INSERT INTO tbl_birim VALUES ('Game Developing');
INSERT INTO tbl_birim VALUES ('Information Technology');
INSERT INTO tbl_birim VALUES ('Machine Learning');

INSERT INTO tbl_pc VALUES('1b-34-57-2f-5c-09','RTX 3090','Ryzen 1', 4);
INSERT INTO tbl_pc VALUES('2b-44-b7-xf-qc-90','RTX 3080','Ryzen 2', 5);
INSERT INTO tbl_pc VALUES('3f-32-5b-1f-de-12','RTX 3070','Ryzen 3', 6);
INSERT INTO tbl_pc VALUES('9a-04-33-2c-8a-22','RTX 3060','Ryzen 4', 7);
INSERT INTO tbl_pc VALUES('78-h7-90-0a-2c-63','RTX 3060ti','intel i3', 8);
INSERT INTO tbl_pc VALUES('4b-65-j3-a3-2u-31','RTX 2060','intel i5', 9);
INSERT INTO tbl_pc VALUES('6f-17-0a-43-39-f9','RTX 2070','intel i7', 10);
INSERT INTO tbl_pc VALUES('5b-45-12-de-6d-35','RTX 2080ti','intel i9', 11);
INSERT INTO tbl_pc VALUES('f4-3j-h7-20-02-0g','GTX 1080ti','Ryzen Threadripper 1', 12);
INSERT INTO tbl_pc VALUES('5f-3h-11-2f-54-12','GT 1030','Ryzen Threadripper 2', 16);

INSERT INTO tbl_calisanlar VALUES('Abdullah','Almasri',15000.00,'05354217323',1,1);
INSERT INTO tbl_calisanlar VALUES('Arda','Kirpan',9500.50,'05384515383',2,2);
INSERT INTO tbl_calisanlar VALUES('Mesut','Turgut',8530.99,'05579624873',3,3);
INSERT INTO tbl_calisanlar VALUES('Volkan','Candan',12500.2,'05789531489',4,4);
INSERT INTO tbl_calisanlar VALUES('Onur','Yalcinturk',11472.22,'05761603489',5,5);
INSERT INTO tbl_calisanlar VALUES('Fatih','Yusuf',6600.09,'05563698721',6,6);
INSERT INTO tbl_calisanlar VALUES('Samet','Karabulut',14900.88,'05147852369',7,7);
INSERT INTO tbl_calisanlar VALUES('Yusuf','Demir',9999.14,'05987123456',8,8);
INSERT INTO tbl_calisanlar VALUES('Enes','Bozkurt',6599,'05369258147',9,9);
INSERT INTO tbl_calisanlar VALUES('Emre','Bozkurt',14521.04,'05123456789',10,10);

SELECT calisan_adi, calisan_maasi FROM tbl_calisanlar WHERE calisan_maasi >= 7000 ORDER BY calisan_maasi DESC,calisan_adi;
SELECT * FROM tbl_calisanlar WHERE calisan_soyadi = 'Bozkurt';
SELECT calisan_adi AS Ad, calisan_soyadi AS Soyad, calisan_tel AS Iletisim FROM tbl_calisanlar WHERE calisan_adi LIKE 'A%' OR calisan_adi LIKE 'E%'; 
SELECT * FROM tbl_birim WHERE birim_adi LIKE '%Developing%';
SELECT pc_id_pk, pc_islemci FROM tbl_pc Where pc_islemci LIKE '%Ryzen%';

UPDATE tbl_calisanlar SET calisan_maasi = calisan_maasi + (calisan_maasi * 0.05) WHERE calisan_maasi < 10000;
UPDATE tbl_birim SET birim_adi = 'Software Engineering' WHERE birim_adi = 'Software Developing';
UPDATE tbl_pc SET pc_islemci = 'Ryzen Threadripper' WHERE pc_id_pk = 9 OR pc_id_pk = 10;
UPDATE tbl_pc SET pc_ekran_karti = 'RTX 3080ti' WHERE pc_id_pk = 2;
UPDATE tbl_pc SET pc_ekran_karti = 'RTX 2070 super' WHERE pc_id_pk = 7;

SELECT * FROM tbl_calisanlar;
SELECT * FROM tbl_birim;
SELECT * FROM tbl_pc;

DELETE FROM tbl_calisanlar WHERE calisan_id_pk = 1;
DELETE FROM tbl_calisanlar WHERE calisan_maasi >= 10000;
DELETE FROM tbl_birim WHERE birim_adi LIKE 'F%';
DELETE FROM tbl_pc WHERE pc_ram_boyutu <= 8;
DELETE FROM tbl_pc WHERE pc_islemci = 'Ryzen Threadripper';

