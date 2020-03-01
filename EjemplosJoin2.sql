create database ejemplosjoin;
create table tabla1(id int, value varchar(10));

insert into tabla1(id, value)
select 1,'First'
union all
select 2, 'Secound'
union all
select 3, 'Third'
union all
select 4, 'Fourth'
union all
select 5, 'Fifth';

create table tabla2( id int, value varchar(10));

insert into tabla2
(id,value)
values
(1,'First'),
(2,'Secound'),
(3,'Third'),
(6,'Sixth'),
(7,'Seventh'),
(8,'Eighth');
#region join 
select * from tabla1, tabla2 where tabla1.id = tabla2.id;

select t1.id, t1.value from tabla1 t1, tabla2 t2 where t1.id = t2.id and t1.value = 'Secound';

select t1.* , t2.* from tabla1 t1 inner join tabla2 t2 on t1.id = t2.id where t1.value = 'Secound';
#end region 

#region Left outer join 
select t1.* , t2.* from tabla1 t1 left join tabla2 t2 on t1.id = t2.id;

select t1.* , t2.* from tabla1 t1 left join tabla2 t2 on t1.id = t2.id where t2.id is null;

#end region 
#region right outer join 
select t1.* , t2.* from tabla1 t1 right join tabla2 t2 on t1.id = t2.id;

select t1.* , t2.* from tabla1 t1 right join tabla2 t2 on t1.id = t2.id where t1.id is null;

#end region 

#region full join
#select t1.*,t2.* from tabla1 t1 full join tabla2 t2 on t1.id = t2.id;

select t1.* , t2.* from tabla1 t1 left join tabla2 t2 on t1.id = t2.id union

select t1.* , t2.* from tabla1 t1 right join tabla2 t2 on t1.id = t2.id;
#end region 

/*cros join */
select t1.*, t2.* from tabla1 t1 cross join tabla2 t2;

#end reegion 

 /*26/02/2020*/

select * from tabla1;
select * from tabla2;

select t1.* , t2.* from tabla1 t1 inner join tabla2 t2 ON t1.id = t2.id;
select t1.* , t2.* from tabla1 t1 inner join tabla2 t2 ON t1.id > t2.id;


create table departamento(iddepa int primary key AUTO_INCREMENT, nombredepa varchar(100));
create table empleado(idempleado int primary key AUTO_INCREMENT, nombreempleado varchar(100), slado double, iddepa int,
foreign key(iddepa) references departamento(iddepa));

insert into departamento values(null,'Contabilidad'),(null,'Compras'),(null,'Ventas');
insert into empleado values(null,'Marisol',400,1),(null,'Sofia',600,1),(null,'Sergio',600,2);

select * from departamento d, empleado e where d.iddepa = e.iddepa;
select * from departamento d, empleado e where d.iddepa = e.iddepa and slado > 500;

select * from departamento d inner join empleado e on d.iddepa = e.iddepa;
select * from departamento d inner join empleado e on d.iddepa = e.iddepa where slado > 500;


select * from departamento natural join empleado; 

create table empleado2(empleadoid int primary key, nombre varchar(50), jefeid int);
insert into empleado2 values(1,'Miguel',3),(2,'David',3),(3,'Rodrigo',null),(4,'Mary',2),(5,'Jose',2);

select * from empleado2;
select e1.nombre as 'Empleado' , e2.nombre as 'Jefe' FROM empleado2 e1 inner join empleado2 e2 on e1.jefeid = e2.empleadoid;
select e1.nombre as 'Empleado' , IFNULL(e2.nombre, 'Jefe General') as 'Jefe' from empleado2 e1 left join empleado2 e2 on e1.jefeid = e2.empleadoid;

select * from empleado inner join departamento on departamento.iddepa = empleado.iddepa; 

select * from empleado inner join departamento using (iddepa);

select * from tabla1 inner join tabla2 using (id,value);
select * from tabla1 inner join tabla2 on tabla1.id = tabla2.id and tabla1.id = tabla2.id;

#end region
