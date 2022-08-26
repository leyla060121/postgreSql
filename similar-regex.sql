--SELECT - SIMILAR TO -REGEX (Regular Expressions) --
/*
SIMILAR TO: Daha karmaşık pattern (kalıp) ile sorgulama işlemi için SIMILAR TO kullanılır
Sadece PostgreSQL de kullanılır. Büyük küçük harf önemlidir

REGEX : Herhangi bir kod, metin içerisinde istenen yazı veya kod parçasının aranıp bulunmasını sağlayan
kendine ait bir söz dizimi olan bir yapıdır. MySQL de (REGEXP_LIKE) olarak kullanarak
PostgreSQL'de  "~"  karakteri ile kullanılır.
*/

CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

   INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);
   
   
 select * from kelimeler   
 
 /*
SELECT - LIKE koşulu
LIKE : Sorgulama yaparken belirli (pattern) kalıp ifadeleri kullanabilmemizi sağlar
ILIKE : Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir
LIKE : ~~   büyük küçük harfe DUYARLI olarak işlem yapar
ILIKE : ~~* büyük küçük harfe DUYARSIZ olarak işlem yapar
NOT LIKE : !~~  büyük küçük harfe DUYARLI AMA ŞARTI SAĞLAMAYAN
NOT ILIKE :!~~* büyük küçük harfe DUYARSIZ AMA ŞARTI SAĞLAMAYAN
% --> 0 veya daha fazla karakteri belirtir.
_ --> Tek bir karakteri belirtir
*/
 
 
--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz 
--veya işlemi için | karakteri kullanılır
select * from kelimeler where kelime similar to '%(at|ot|Ot|oT|At|aT|OT)%'
--2.Yol
select * from kelimeler where kelime ILIKE '%at%' or kelime ILIKE '%ot%'
--3.Yol 2.nin aynısı
select*from kelimeler where kelime ~~* '%at%' or kelime ~~* '%ot%'  ---buna bak
--REGEX-sadece ~ şu karakteri bir tane yazıyorum
select * from kelimeler where kelime ~* 'ot' or kelime ~* 'at'


-- 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
			--similar to ile
select *from kelimeler where kelime similar to 'ho%||hi%'
			--LIKE ile 
select * from kelimeler where kelime ~~* 'ho%' or kelime ~~*'hi%'
			--REGEX ile
select * from kelimeler where kelime ~*'h[oi](.*)' --Regex'te ".(nokta) bir karakteri temsil eder
-- başında h olsun ikinci harfi o'da olabilir i'de olabilir
--Regex'de ikinci karakter için köşeli parantez kullanılır. *hepsi anlamında kullanılır
   -- (.*) regex'deki bu işaret, like'deki % işaret ile aynı işlem yapar
   -- [] şu karakter nci, ncu anlama gelir 
   select * from kelimeler where kelime ~*'hi[p](.*)'--burda hi ile başlayan 3.harfi p olanları sırala dedik
   select * from kelimeler where kelime ~*'(.*)[e]m'--sondan 2.harfi e olsun m ile bitsin
   
   
--Sonu 't' veya 'm' ile bitenleri listeleyeniz
select *from kelimeler where kelime similar to '%t|%m'
--regex ile 
select * from kelimeler where kelime ~*'(.*)[tm]$' --$ işareti ile burda bitir diyoruz
--mesela kelime ise bunu da getirir eğer $ işareti koymazsak


-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
		--with SIMILAR TO (SIMILAR TO ile)
select * from kelimeler where kelime similar to 'h[a-z,A-Z,0-9]t';--baş harfi küçük h olduğu için büyük HOT gelmedi
		--with LIKE (LIKE ile)
select * from kelimeler where kelime ~~*'h_t';
		-- with REGEX (REGEX ile)
select * from kelimeler where kelime ~* 'h[a-z,A-Z,0-9]t'

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan
--“kelime" değerlerini çağırın.
--with SIMILAR TO
select * from kelimeler where kelime similar to 'h[a-e]%t';
--with REGEX
SELECT kelime from kelimeler where kelime ~* 'h[a-e](.*)t'
--with LIKE HOMEWORK--
--SELECT kelime from kelimeler where kelime ~~* 'h[a-e]{2}%t'
--select kelime from kelimeler where kelime ~~* 'ha%t'



--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[say](.*)'

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '(.*)[maf]$'

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
--with SIMILAR TO 
select * from kelimeler where kelime similar to 'h[a|i]t'
select * from kelimeler where kelime ~ '^h[a|i]t$'

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
select kelime from kelimeler WHERE kelime ~ '^[b-s].l(.*)'
--regex'de . (nokta), like'deki _(altçizgi) ile eşdeğerdir

--içerisinde en az 2 adet oo barındıran kelimelerin tüm bilgilerini listeleyiniz.
select * from kelimeler where kelime similar to '%[o][o]%'--başınd ve sonunda ne olursa olsun içinde 2 tane o olsun, %[oo]% böyle yaparsam sadece bir o'yu getirecek
select * from kelimeler where kelime similar to '%[o]{2}%' -- 2.YOL Süslü parantez içinde belirttiğimiz rakam bir önceki
														   -- köşeli parantez içinde kaçtane oduğunu belirtir


--içinde en az 4 adet oooo barındıran kelimelerin tüm bilgilerini listeleyiniz
select * from kelimeler where kelime similar to '%[o]{4}%'

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
SELECT kelime FROM kelimeler WHERE kelime ~ '^[a|s|y](.*)[m|f]$';
SELECT kelime FROM kelimeler WHERE kelime ~ '^[asy](.*)[m|f]$'; --bir yukarıkı ile aynı






   
   