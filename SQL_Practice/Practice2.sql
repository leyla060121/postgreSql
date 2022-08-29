CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);
select * from workers;

--1. Tabloya company_industry isminde sütun ekleyiniz   
alter table workers add company_industry varchar(20);    -- alter table değişiklik yap demek

--2. TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
alter table workers add worker_address varchar(100) default 'Miami, Fl, USA'
select*from workers

-- 3. tablodaki worker_address sütununu siliniz
alter table workers drop column worker_address
 
-- 4. Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
alter table workers rename  company_industry to company_profession -- rename'den sonra column yazılabilinir

-- 5. Tablonun ismini employees olarak değişitiriniz.
alter table workers rename to employees
select * from employees
-- Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees
alter column title type varchar(50)--column olmadan da olur

-- Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees add constraint titlemm unique(title);













