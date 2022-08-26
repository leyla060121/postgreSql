--AGGREGATE METHOD Kullanımı--
/*
-Aggregate Method'ları (SUM, COUNT, MIN,    MAX,   AVG)
                   --  topl, say, enkucuk,enbuyuk, ort 
-SUBquery içinde de kullanılır
-Ancak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum  () arasında boşluk olmamalı!
*/

select*from calisanlar2
--calisanlar2 tablosundaki en yüksek maas değerini listeleyiniz
select max(maas) from calisanlar2

--calisanlar2 tablosundaki maaslarin topl
select sum(maas) from calisanlar2 

--calsianlar2 tablosundaki maas ortalamalarını listeleyiniz
select avg(maas) from calisanlar2 
select round (avg(maas)) from calisanlar2 --ortalamada virgulli sayının noktadan sonrasini yok eder
select round (avg(maas),2) from calisanlar2 --ortalamada virgulli sayının noktadan sonrasindaki 2 sayiyi alir

--calisanlar2 tablosundaki en dusuk maasi listeleyiniz
select min(maas) from calisanlar2 

--calisanlar2 tablosundaki kaç kişinin maaş aldığını listeleyin
select count(maas) from calisanlar2 

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim, calisan_sayisi, (select sum(maas)from calisanlar2 where marka_isim=isyeri) as toplam_maas from markalar


-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini 
--listeleyen bir Sorgu yaziniz.
select * from markalar
select marka_isim, calisan_sayisi, (select (max(maas), min(maas)) from calisanlar2) from markalar
--2.yol hoca yapti:
SELECT marka_isim,calisan_sayisi,(SELECT max(maas) from calisanlar2 where marka_isim=isyeri) AS max_maas,
                                 (SELECT min(maas) from calisanlar2 where marka_isim=isyeri) AS min_maas
from markalar;

--Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id, marka_isim, (select count(sehir) from calisanlar2 where marka_isim=isyeri) as sehir_sayisi from markalar;
--                                                                                             yeni sutun adi

--Interview Question: En yüksek ikinci maas değerini çağırın.
select max(maas) as enYuksekIkınciMaas from calisanlar2
where maas<(select max(maas)from calisanlar2)
select*from calisanlar2

----Interview Question: En düşük ikinci maas değerini çağırın.
select min(maas) as enDusukIkınciMaas from calisanlar2
where maas>(select min(maas)from calisanlar2)--min maşdan bir buyuğu en düşük ikinci maaş olur

---en yüksek 3. maaş değerini bulunuz
select max(maas) as enYuksekUcuncuMaas from calisanlar2
where maas<(select max(maas)from calisanlar2 where maas<(select max (maas) from calisanlar2))

--en dusuk 3.maas değerini bulunuz HOMEWORK













