-- #####################
-- ### DIA # 4 - SQL 2 ###
-- #####################

-- Comando general para revisión de bases de datos creadas
show databases;

-- Crear base de datos
create database dia4_1sql2;

-- Utilizar BBDD dia2
use dia4_1sql2;

-- Crear tabla sucursales
create table sucursales(
    id int primary key,
    ciudad varchar(50),
    direccion varchar(100),
    telefono_fijo varchar(15),
    celular varchar(15),
    correo varchar(50)
);

-- Crear tabla empleados
create table empleados(
    id int primary key,
    id_sucursal int,
    foreign key(id_sucursal) references sucursales(id),
    cedula varchar(20),
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(100),
    ciudad varchar(50),
    celular varchar(15), 
    correo varchar(50)
);

-- Crear tabla clientes
create table clientes(
    id int primary key,
    cedula varchar(20),
    nombres varchar(50),
    apellidos varchar(50),
    direccion varchar(100),
    ciudad varchar(50),
    celular varchar(15),
    correo varchar(50)
);

-- Crear tabla vehiculos
create table vehiculos(
    tipo varchar(20) primary key,
    placa varchar(10),
    referencia varchar(50),
    modelo int,
    puertas int,
    capacidad int,
    sunroof varchar(5),
    motor varchar(20),
    color varchar(20)
);

-- Crear tabla alquileres
create table alquileres(
    id int primary key,
    tipo_vehiculo varchar(20),
    foreign key(tipo_vehiculo) references vehiculos(tipo),
    id_cliente int,
    foreign key(id_cliente) references clientes(id),
    id_empleado int,
    foreign key(id_empleado) references empleados(id),
    id_sucursal int,
    foreign key(id_sucursal) references sucursales(id),
    fecha_salida date,
    fecha_llegada date,
    fecha_esperada date,
    valor_alquiler_semana decimal(10, 2),
    valor_alquiler_dia decimal(10, 2),
    porcentaje_descuento decimal(5, 2),
    valor_cotizado decimal(10, 2),
    valor_pagado decimal(10, 2)
);