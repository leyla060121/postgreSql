--EXISTS --varsa, NOT EXISTS --
--EXISTS condition subquery'ler ile kullanılır. IN ifadesini kullanımına benzer
--EXISTS ve NOT EXISTS ifadeleri de alt sorgulardan getirilen değerlerin içerisinde 
--bir değerin olması veya olamaması durumunda işlem yapılmasını sağlar 
-- EXISTS true, false gibidir(Boolean) 

CREATE TABLE mart
(
	urun_id int,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
CREATE TABLE nisan
(
	urun_id int ,
	musteri_isim varchar(50),
	urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart
select * from nisan

  --MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
  --URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
  --MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız.
select urun_id, musteri_isim from mart --mart tablosunun urun_id, musteri_isim'ni getirecek
where exists(SELECT urun_id from nisan where mart.urun_id=nisan.urun_id) 
--mart.urun_id=nisan.urun_id--->  bu martin urun_id'si ile nisanın urun_id'ni eşitle demektir

-- her iki ayda birden satılan
select urun_isim, musteri_isim from nisan
where exists (SELECT urun_isim from mart where mart.urun_isim=nisan.urun_isim)

 --Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve  bu ürünleri
 --NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim, musteri_isim from nisan
where not exists (Select urun_isim from mart where mart.urun_isim=nisan.urun_isim)









