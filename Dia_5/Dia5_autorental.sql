-- #####################
-- ### DIA # 5 - SQL 2 ###
-- #####################

-- Comando general para revisión de bases de datos creadas
show databases;

-- Utilizar BBDD dia2
use mysql2_dia4;

create table inserciones_actualizaciones_empleados (
    id int primary key,
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(100),
    ciudad varchar(50),
    celular varchar(15),
    correo varchar(50),
    action varchar(25),
    hora_actualizacion timestamp default current_timestamp
);

delimiter //
create trigger after_empleado_insert
after insert on empleados
for each row
begin
    insert into inserciones_actualizaciones_empleados (id, nombres, apellidos, direccion, ciudad, celular, correo, action)
    values (new.id, new.nombres, new.apellidos, new.direccion, new.ciudad, new.celular, new.correo, 'insert');
end //
delimiter ;

delimiter //
create trigger after_empleado_update
after update on empleados
for each row
begin
    insert into inserciones_actualizaciones_empleados (id, nombres, apellidos, direccion, ciudad, celular, correo, action)
    values (new.id, new.nombres, new.apellidos, new.direccion, new.ciudad, new.celular, new.correo, 'update');
end //
delimiter ;

create table if not exists backup_empleados (
    id int primary key,
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(100),
    ciudad varchar(50),
    celular varchar(15),
    correo varchar(50),
    hora_backup timestamp default current_timestamp
);

delimiter //
create event if not exists daily_employee_backup
on schedule every 1 day
starts current_timestamp
do
begin
    insert into backup_empleados (nombres, apellidos, direccion, ciudad, celular, correo)
    select nombres, apellidos, direccion, ciudad, celular, correo
    from empleados;
end //
delimiter ;