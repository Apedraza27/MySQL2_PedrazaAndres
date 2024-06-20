-- #####################
-- ### DIA # 1 - SQL 2 ###
-- #####################

-- Comando general para revisión de bases de datos creadas
show databases;

-- Crear base de datos
create database dia1sql2;

-- Utilizar BBDD dia1
use dia1sql2;

-- Crear tabla médicos
create table medicos (
    id int primary key,
    nombre varchar(100),
    direccion varchar(255),
    telefono varchar(15),
    poblacion varchar(100),
    provincia varchar(100),
    codigo_postal varchar(10),
    nif varchar(15),
    num_seguridad_social varchar(20),
    num_colegiado varchar(20),
    tipo_medico varchar(20)
);

-- Crear tabla horario consulta
create table horario_consulta (
    id int primary key,
    dia_semana varchar(10),
    hora_inicio time,
    hora_fin time,
    id_medico int,
    foreign key(id_medico) references medicos(id)
);

-- Crear tabla sustituto
create table sustituto (
    id int primary key,
    fecha_alta date,
    fecha_baja date,
    id_medico int,
    foreign key(id_medico) references medicos(id)
);

-- Crear tabla empleados
create table empleados (
    id int primary key,
    nombre varchar(100),
    direccion varchar(255),
    telefono varchar(15),
    poblacion varchar(100),
    provincia varchar(100),
    codigo_postal varchar(10),
    nif varchar(15),
    numero_seguridad_social varchar(20),
    tipo_empleado varchar(20)
);

-- Crear tabla vacaciones
create table vacaciones (
    id int primary key,
    fecha_inicio date,
    fecha_fin date,
    tipo varchar(20),
    id_empleado int,
    foreign key(id_empleado) references empleados(id)
);

-- Crear tabla pacientes
create table pacientes (
    id int primary key,
    nombre varchar(100),
    direccion varchar(255),
    telefono varchar(15),
    codigo_postal varchar(10),
    nif varchar(15),
    numero_seguridad_social varchar(20),
    id_medico int,
    foreign key(id_medico) references medicos(id)
);

show tables;