create database Asror_data
use Asror_data

create table klienti (id int, FIO varchar (50))
exec sp_help 

select * from sys.tables

select * from INFORMATION_SCHEMA.TABLES

select * from sys.tables

select * from klienti
drop
SELECT schema_name(t.schema_id) AS schema_name, t.name AS table_name
FROM sys.tables t;

SELECT * 
FROM sys.objects;

select * from sys.database_principals

create login a_agzamov with password = '123'

create user asror for login a_agzamov

create role ofitsiant 

alter role ofitsiant add member asror

