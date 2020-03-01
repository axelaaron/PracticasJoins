create database Popquiz;
use popquiz;
create table estudiantes(id int , nombre varchar(30));
create table clases(id int, materia varchar (100));

insert into estudiantes (id, nombre) values 
(1,'Axel'), (2,'Juan'), (3,'Jesus');
select * FROM estudiantes;
insert into clases(id, materia) values 
(1,'Matematicas'), (2,'Historia'), (3,'Ciencias');
select * FROM clases;

select t1.* , t2.* from estudiantes t1 
inner join clases t2 on t1.id = t2.id;