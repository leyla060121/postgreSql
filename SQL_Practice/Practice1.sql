-- sql_practise 1                                                                             
create table personel                                                                         
(                                                                                             
id serial primary key  ,     --serial id'yi auto increment gib otomatik arttırıyor                                                                 
isim varchar(20),                                                                             
yas int,                                                                                      
maas int,                                                                                    
email varchar(30)                                                                             
);                                                                                            																							  
-- auto_increment kullandığımızda otomatik olarak id ler 1 den başlayacaktır.                 
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');--buraya id girmemize gerek kalmadı
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);

-- 1) Tablo bilgilerini listeleyiniz.
select * from personel;

-- 2) isim, yaş ve maaş bilgilerini listeleyiniz
select isim, yas, maas from personel

-- 3) id'si 8 olan personel bilgilerini listeleyiniz
select * from personel where id=8;

-- 4) id'si 5 olan personelin isim, yaş ve email bilgilerini listeleyiniz
select isim, id, yas, email from personel    --burda id 2. sirada yazdik, oyuzden id 2.sutunda duruyor
where id=5;

-- 5) 30 yaşından büyük personel bilgilerini listeleyiniz.
select * from personel where yas>30

--6) maası 21000 olmayan personel bilgilerini listeleyiniz.
select*from personel where maas<> 21000;  ---is not olabilir

-- 7) ismi a harfi ile başlayan personel bilgilerini listeleyiniz.
select * from personel where isim ilike 'A%'     --büyük a küçük A'yi kaldırmak için -->ilike diyorum

--8)ismi n harfi ile biten personel bilgilerini listeleyiniz.
select*from personel
where isim ilike '%n' select*from personel where isim ~*'(.*)n$'--2.yol

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz.
select * from personelwhere email like '%@gmail.com'

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz.
select * from personel
where email not like '%@gmail.com'  --nul olanı neden getirmedi? 
									-- % de ile arattığımız için null vermedi
									--
-- 11) id'si 3,5,7 ve 9 olan personel bilgilerini listeleyiniz.
select * from personel where id in(3,5,7,9) --in kullanımı(parantezin içine aynı değerlere ait değerleri  gir)

-- 12) yaşı 39,48 ve 54 olmayan personel bilgilerini listeleyiniz.
select * from personel where yas not in (39,48,54);

-- 13) yaşı 30 ve 40 arasında olan personel bilgilerini listeleyiniz.
select * from personel where yas between 30 and 40;

-- 14) yaşı 30 ve 40 arasında olmyan personel bilgilerini listeleyiniz.
select * from personel where yas not between 30 and 40;

-- 15) emaili null olan personel bilgilerini listeleyiniz.
select * from personel where email is null;

-- 16) personel bilgilerini yaşa göre sıralayınız.      --sıralama olunca ORDER BY
select * from personel order by yas;  --doğal sırlaması küçükten büyüğe select * from personel order by yas asc;

-- 17) personel bilgilerini maaşa göre sıralayınız.
select * from personel order by maas;

-- 18) personelin yaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by yas desc;			--tersten sıralama desc

-- 19) personelin maaşlarını büyükten küçüğe doğru sıralayınız.
select * from personel order by maas desc;

-- 20) En yüksek maaş olan ilk 3 personel bilgilerini sıralayınız
select * from personel order by maas desc limit(3);
























