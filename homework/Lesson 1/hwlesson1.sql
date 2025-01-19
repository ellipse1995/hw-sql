--You will create a database first
--Create 10 tables in it
--Create a user for this database and grant only select and update commands for this user
--for random 5 tables

use master

create database hwlesson1

create table produkti (id int, name varchar(50))
create table sales (id int, produkt_name varchar(50), data date)
create table filiali (id int, adress varchar(50))
create table sotrudniki (id int, FIO varchar(50)) 
create table klienti (id int, FIO varchar(50))
create table otdeli (id int, name varchar (50))
create table prazdniki (id int, prazdnik varchar(50))
create table zvonki (id int, obrashenie varchar(50), tel_nomer int)
create table akcii (id int, nazvanie varchar(50), procent_skidki int)
create table jalobi (id int, jaloba varchar(50))

select * from sys.tables

create login user1 with password = '123';

create user anvar for login user1;

create role prodavets ;

alter role prodavets add member anvar;

grant select, update on sales, akcii, zvonki, prodikti, klienti to prodavets ;

grant select, update on sales to prodavets;
grant select, update on akcii to prodavets;
grant select, update on zvonki to prodavets;
grant select, update on produkti to prodavets;
grant select, update on klienti to prodavets;

select * from sys.database_principals