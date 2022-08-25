--Personel isminde bir tablo oluşturalım
create table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
--Varolan personel tablosundan pers_id,sehir,adres fieldlarına sahip personel_adres adında yeni tablo olusturalım
create table personel_adres
as
select pers_id, sehir, adres from personel;
select * from personel
-- DML --> Data Manupulation Lang.
-- INSERT - UPDATE - DELETE
--Tabloya veri ekleme, tablodan veri güncelleme ve silme işlemlerinde kullanılan komutlar
--INSERT
create table student
(
id varchar(4),
st_name varchar(30),
age int
);
INSERT into student VALUES ('1001','Ali Can',25);
INSERT into student VALUES ('1002','Veli Can',35);
INSERT into student VALUES ('1003','Ayse Can',45);
INSERT into student VALUES ('1004','Derya Can',55);
--Tabloya parçalı veri ekleme
insert into student(st_name,age) values ('Murat Can',65);
--DQL --> Data Query Lang.
--SELECT
select * from student;
SELECT st_name from student;
--SELECT KOMUTU WHERE KOŞULU
SELECT*from student WHERE age>35;

--TCL -Transaction Control Lang.
-- Savepoin

create TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
	veli_ismi VARCHAR(50),
	yazili_notu real
);
Begin;
insert into ogrenciler2 VALUES (default, 'Ali Can','Hasan Can',75.5);
insert into ogrenciler2 VALUES (default, 'Canan Gul','Ayşe Sen',90.5);
savepoint x;
insert into ogrenciler2 VALUES (default, 'Kemal Can','Ahmet Can',75.5);
insert into ogrenciler2 VALUES (default, 'Ahmet Şen','Ayşe Can',65.5);

ROLLBACK TO x;

select*from ogrenciler2;
commit;
--Transaction kullanımında SERIAL data türü kullanımı tavsiye edilmez.
--savepointten sonra eklediğimiz veride sayaç mantığı ile çalıştığı için
--sayacta en son hangi sayıda kaldıysa ordan devam eder
-- NOT : PostgreSQL de transaction kullanımı için 'Begin' komutuyla başlarız sonrasında tekrar yanlış bir veriyi
-- düzeltmek veya bizim için önemli olan verilerden sonra ekleme yapabilmek için 'SAVEPOINT savepointadi'
-- kullanırız ve bu savepointe dönebilmek için 'ROLLBACK TO savepointismi'
-- komutunu kullanırız ve rollback çalıştırıldığında savepoint yazdığımız satırın üstündeki verileri tabloda bize
-- verir ve son olarak Transaction'ı sonlandırmak için mutlaka 'COMMIT' komutu kullanırız. MySQL de
-- transaction olmadanda kullanılır

--DML -DELETE-
--DELETE FROM tablo_adi-->Tablo'nun tüm içeriğini siler
--Verii seçerek silmek için WHERE koşulu kullanılır
--DELETE FROM tablo_adi WHERE sutun_adi = veri -->tablodaki istediğimi veriyi siler

CREATE TABLE ogrenciler
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler;
--soru: Id'si 124 olan ogrenciyi siliniz
DELETE FROM ogrenciler WHERE id=124;

--Soru : ismi Kemal Yasa olan satiri siliniz 
DELETE FROM ogrenciler WHERE isim='Kemal Yasa';


--Soru: ismi Nesibe ilmaz veya Mustafa bAK olan kayıtları silelim
DELETE FROM ogrenciler WHERE isim='Nesibe Yilmaz' or isim='Mustafa Bak';

--Soru : ismi Ali Can ve id'si 123 olan kaydı siliniz
delete from ogrenciler WHERE isim='Ali Can' or id=123;

--Tablodaki tüm verileri silelim
Delete from ogrenciler 

--DELETE -TRUNCATE  --
select*from ogrenciler;
TRUNCATE TABLE ogrenciler

--DDL -Data Definition Lang
--CREATE   -ALTER -DROP
--ALTER TABLE --
--ALTER TABLE tabloda ADD , TYPE, SET, RENAME veya DROP COLUMS işlemleri için kullanılır

select *from isciler;
--Personel tablosuna cinsiyet Varchar (20) ve yas int şeklinde yeni sutunlar ekleyin
alter table personel add cinsiyet varchar(20),add yas int;

--Personel tablosundan sirket field'ini siliniz
alter table personel drop COLUMN sirket;

--Personel tablosundaki sehir sutununun adini ulke olarak değiştirelim 
alter table personel rename column sehir to ulke ;

--personel tablosunun adını isciler olarak değiştiriniz 
alter table personel rename to isciler; 

--DDL  - DROP komutu --> isciler tablosunu siler
DROP table isciler;

--CONSTRANINT -- >KISITLAMALAR --
--PRIMERY KEY --> bir sutunun null içermemesini ve sutundaki verilerin benzersiz olmasını sağlar(NOT NULL-UNIQUE)
--FOREIGN KEY--> Başka bir tablodaki Primar key'i referans göstermek için kullanılır. 
   --böylelikle tablolar arasında ilişki kurmuş oluruz. 
--UNIQUE --> Bir sutundaki tüm değerlerin benzersiz yani tek olmasını sağlar 
--NOT NULL--> Bir sutunun NULL içermemesini yani boş olmamasını sağlar. 
   --not null kısıtlaması için CONSTRAINT ismi tanımlanmaz. Bu ksıtlama veri türünden hemen sonra yerleştirilir
--CHECK --> Bir sutuna yerleştirilebilecek değer aralığını sınırlamak için kullanılır 

CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, --UNIQUE --> Bir sutundaki tüm değerlerin benzersiz yani tek olmasını sağlar 
maas int NOT NULL, --NOT NULL--> Bir sutunun NULL içermemesini yani boş olmamasını sağlar. 
ise_baslama DATE
);

create table calisanlar2 (
id char (5),
	isim varchar(50),
	maas int NOT NULL,
	ise_baslama DATE,
	CONSTRAINT pk_id PRIMARY KEY(id),
	Constraint ism_unq UNIQUE (isim)
);


CREATE TABLE calisanlar
(
id CHAR(5) PRIMARY KEY, -- not null + unique
isim VARCHAR(50) UNIQUE, --UNIQUE --> Bir sutundaki tüm değerlerin benzersiz yani tek olmasını sağlar 
maas int NOT NULL, --NOT NULL--> Bir sutunun NULL içermemesini yani boş olmamasını sağlar. 
ise_baslama DATE
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14');--UNIQUE
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');--NOT NULL 
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14');--
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');







