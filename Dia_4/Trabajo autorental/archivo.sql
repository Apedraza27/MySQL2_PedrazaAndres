-- #####################
-- ### DIA # 4 - SQL 2 ###
-- #####################

-- Comando general para revisión de bases de datos creadas
show databases;

-- Crear base de datos
create database mysql2_dia4;

-- Utilizar BBDD dia2
use mysql2_dia4;


-- ### TABLAS ### --

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
	id int primary key,
    tipo varchar(20),
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
    id_vehiculo int,
    foreign key(id_vehiculo) references vehiculos(id),
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





-- ### INSERCIONES ### --

INSERT INTO sucursales VALUES
(1, 'Bogotá', 'Calle 1 #10-20', '5712345611', '3201234561', 'sucursal1@example.com'),
(2, 'Bogotá', 'Calle 2 #10-20', '5712345612', '3201234562', 'sucursal2@example.com'),
(3, 'Bogotá', 'Calle 3 #10-20', '5712345613', '3201234563', 'sucursal3@example.com'),
(4, 'Bogotá', 'Calle 4 #10-20', '5712345614', '3201234564', 'sucursal4@example.com'),
(5, 'Bogotá', 'Calle 5 #10-20', '5712345615', '3201234565', 'sucursal5@example.com'),
(6, 'Medellín', 'Calle 6 #10-20', '5712345616', '3201234566', 'sucursal6@example.com'),
(7, 'Medellín', 'Calle 7 #10-20', '5712345617', '3201234567', 'sucursal7@example.com'),
(8, 'Medellín', 'Calle 8 #10-20', '5712345618', '3201234568', 'sucursal8@example.com'),
(9, 'Medellín', 'Calle 9 #10-20', '5712345619', '3201234569', 'sucursal9@example.com'),
(10, 'Medellín', 'Calle 10 #10-20', '5712345620', '3201234570', 'sucursal10@example.com'),
(11, 'Cali', 'Calle 11 #10-20', '5712345621', '3201234571', 'sucursal11@example.com'),
(12, 'Cali', 'Calle 12 #10-20', '5712345622', '3201234572', 'sucursal12@example.com'),
(13, 'Cali', 'Calle 13 #10-20', '5712345623', '3201234573', 'sucursal13@example.com'),
(14, 'Cali', 'Calle 14 #10-20', '5712345624', '3201234574', 'sucursal14@example.com'),
(15, 'Cali', 'Calle 15 #10-20', '5712345625', '3201234575', 'sucursal15@example.com'),
(16, 'Barranquilla', 'Calle 16 #10-20', '5712345626', '3201234576', 'sucursal16@example.com'),
(17, 'Barranquilla', 'Calle 17 #10-20', '5712345627', '3201234577', 'sucursal17@example.com'),
(18, 'Barranquilla', 'Calle 18 #10-20', '5712345628', '3201234578', 'sucursal18@example.com'),
(19, 'Barranquilla', 'Calle 19 #10-20', '5712345629', '3201234579', 'sucursal19@example.com'),
(20, 'Barranquilla', 'Calle 20 #10-20', '5712345630', '3201234580', 'sucursal20@example.com'),
(21, 'Cartagena', 'Calle 21 #10-20', '5712345631', '3201234581', 'sucursal21@example.com'),
(22, 'Cartagena', 'Calle 22 #10-20', '5712345632', '3201234582', 'sucursal22@example.com'),
(23, 'Cartagena', 'Calle 23 #10-20', '5712345633', '3201234583', 'sucursal23@example.com'),
(24, 'Cartagena', 'Calle 24 #10-20', '5712345634', '3201234584', 'sucursal24@example.com'),
(25, 'Cartagena', 'Calle 25 #10-20', '5712345635', '3201234585', 'sucursal25@example.com'),
(26, 'Bogotá', 'Calle 26 #10-20', '5712345636', '3201234586', 'sucursal26@example.com'),
(27, 'Bogotá', 'Calle 27 #10-20', '5712345637', '3201234587', 'sucursal27@example.com'),
(28, 'Bogotá', 'Calle 28 #10-20', '5712345638', '3201234588', 'sucursal28@example.com'),
(29, 'Bogotá', 'Calle 29 #10-20', '5712345639', '3201234589', 'sucursal29@example.com'),
(30, 'Bogotá', 'Calle 30 #10-20', '5712345640', '3201234590', 'sucursal30@example.com'),
(31, 'Medellín', 'Calle 31 #10-20', '5712345641', '3201234591', 'sucursal31@example.com'),
(32, 'Medellín', 'Calle 32 #10-20', '5712345642', '3201234592', 'sucursal32@example.com'),
(33, 'Medellín', 'Calle 33 #10-20', '5712345643', '3201234593', 'sucursal33@example.com'),
(34, 'Medellín', 'Calle 34 #10-20', '5712345644', '3201234594', 'sucursal34@example.com'),
(35, 'Medellín', 'Calle 35 #10-20', '5712345645', '3201234595', 'sucursal35@example.com'),
(36, 'Cali', 'Calle 36 #10-20', '5712345646', '3201234596', 'sucursal36@example.com'),
(37, 'Cali', 'Calle 37 #10-20', '5712345647', '3201234597', 'sucursal37@example.com'),
(38, 'Cali', 'Calle 38 #10-20', '5712345648', '3201234598', 'sucursal38@example.com'),
(39, 'Cali', 'Calle 39 #10-20', '5712345649', '3201234599', 'sucursal39@example.com'),
(40, 'Cali', 'Calle 40 #10-20', '5712345650', '3201234600', 'sucursal40@example.com'),
(41, 'Barranquilla', 'Calle 41 #10-20', '5712345651', '3201234601', 'sucursal41@example.com'),
(42, 'Barranquilla', 'Calle 42 #10-20', '5712345652', '3201234602', 'sucursal42@example.com'),
(43, 'Barranquilla', 'Calle 43 #10-20', '5712345653', '3201234603', 'sucursal43@example.com'),
(44, 'Barranquilla', 'Calle 44 #10-20', '5712345654', '3201234604', 'sucursal44@example.com'),
(45, 'Barranquilla', 'Calle 45 #10-20', '5712345655', '3201234605', 'sucursal45@example.com'),
(46, 'Cartagena', 'Calle 46 #10-20', '5712345656', '3201234606', 'sucursal46@example.com'),
(47, 'Cartagena', 'Calle 47 #10-20', '5712345657', '3201234607', 'sucursal47@example.com'),
(48, 'Cartagena', 'Calle 48 #10-20', '5712345658', '3201234608', 'sucursal48@example.com'),
(49, 'Cartagena', 'Calle 49 #10-20', '5712345659', '3201234609', 'sucursal49@example.com'),
(50, 'Cartagena', 'Calle 50 #10-20', '5712345660', '3201234610', 'sucursal50@example.com'),
(51, 'Bogotá', 'Calle 51 #10-20', '5712345661', '3201234611', 'sucursal51@example.com'),
(52, 'Bogotá', 'Calle 52 #10-20', '5712345662', '3201234612', 'sucursal52@example.com'),
(53, 'Bogotá', 'Calle 53 #10-20', '5712345663', '3201234613', 'sucursal53@example.com'),
(54, 'Bogotá', 'Calle 54 #10-20', '5712345664', '3201234614', 'sucursal54@example.com'),
(55, 'Bogotá', 'Calle 55 #10-20', '5712345665', '3201234615','sucursal55@example.com'),
(56, 'Medellí­n', 'Calle 56 #10-20', '5712345666', '3201234616', 'sucursal56@example.com'),
(57, 'Medellín', 'Calle 57 #10-20', '5712345667', '3201234617', 'sucursal57@example.com'),
(58, 'Medellín', 'Calle 58 #10-20', '5712345668', '3201234618', 'sucursal58@example.com'),
(59, 'Medellín', 'Calle 59 #10-20', '5712345669', '3201234619', 'sucursal59@example.com'),
(60, 'Medellín', 'Calle 60 #10-20', '5712345670', '3201234620', 'sucursal60@example.com'),
(61, 'Cali', 'Calle 61 #10-20', '5712345671', '3201234621', 'sucursal61@example.com'),
(62, 'Cali', 'Calle 62 #10-20', '5712345672', '3201234622', 'sucursal62@example.com'),
(63, 'Cali', 'Calle 63 #10-20', '5712345673', '3201234623', 'sucursal63@example.com'),
(64, 'Cali', 'Calle 64 #10-20', '5712345674', '3201234624', 'sucursal64@example.com'),
(65, 'Cali', 'Calle 65 #10-20', '5712345675', '3201234625', 'sucursal65@example.com'),
(66, 'Barranquilla', 'Calle 66 #10-20', '5712345676', '3201234626', 'sucursal66@example.com'),
(67, 'Barranquilla', 'Calle 67 #10-20', '5712345677', '3201234627', 'sucursal67@example.com'),
(68, 'Barranquilla', 'Calle 68 #10-20', '5712345678', '3201234628', 'sucursal68@example.com'),
(69, 'Barranquilla', 'Calle 69 #10-20', '5712345679', '3201234629', 'sucursal69@example.com'),
(70, 'Barranquilla', 'Calle 70 #10-20', '5712345680', '3201234630', 'sucursal70@example.com'),
(71, 'Cartagena', 'Calle 71 #10-20', '5712345681', '3201234631', 'sucursal71@example.com'),
(72, 'Cartagena', 'Calle 72 #10-20', '5712345682', '3201234632', 'sucursal72@example.com'),
(73, 'Cartagena', 'Calle 73 #10-20', '5712345683', '3201234633', 'sucursal73@example.com'),
(74, 'Cartagena', 'Calle 74 #10-20', '5712345684', '3201234634', 'sucursal74@example.com'),
(75, 'Cartagena', 'Calle 75 #10-20', '5712345685', '3201234635', 'sucursal75@example.com'),
(76, 'Bogotá', 'Calle 76 #10-20', '5712345686', '3201234636', 'sucursal76@example.com'),
(77, 'Bogotá', 'Calle 77 #10-20', '5712345687', '3201234637', 'sucursal77@example.com'),
(78, 'Bogotá', 'Calle 78 #10-20', '5712345688', '3201234638', 'sucursal78@example.com'),
(79, 'Bogotá', 'Calle 79 #10-20', '5712345689', '3201234639', 'sucursal79@example.com'),
(80, 'Bogotá', 'Calle 80 #10-20', '5712345690', '3201234640', 'sucursal80@example.com'),
(81, 'Medellín', 'Calle 81 #10-20', '5712345691', '3201234641', 'sucursal81@example.com'),
(82, 'Medellín', 'Calle 82 #10-20', '5712345692', '3201234642', 'sucursal82@example.com'),
(83, 'Medellín', 'Calle 83 #10-20', '5712345693', '3201234643', 'sucursal83@example.com'),
(84, 'Medellín', 'Calle 84 #10-20', '5712345694', '3201234644', 'sucursal84@example.com'),
(85, 'Medellín', 'Calle 85 #10-20', '5712345695', '3201234645', 'sucursal85@example.com'),
(86, 'Cali', 'Calle 86 #10-20', '5712345696', '3201234646', 'sucursal86@example.com'),
(87, 'Cali', 'Calle 87 #10-20', '5712345697', '3201234647', 'sucursal87@example.com'),
(88, 'Cali', 'Calle 88 #10-20', '5712345698', '3201234648', 'sucursal88@example.com'),
(89, 'Cali', 'Calle 89 #10-20', '5712345699', '3201234649', 'sucursal89@example.com'),
(90, 'Cali', 'Calle 90 #10-20', '5712345700', '3201234650', 'sucursal90@example.com'),
(91, 'Barranquilla', 'Calle 91 #10-20', '5712345701', '3201234651', 'sucursal91@example.com'),
(92, 'Barranquilla', 'Calle 92 #10-20', '5712345702', '3201234652', 'sucursal92@example.com'),
(93, 'Barranquilla', 'Calle 93 #10-20', '5712345703', '3201234653', 'sucursal93@example.com'),
(94, 'Barranquilla', 'Calle 94 #10-20', '5712345704', '3201234654', 'sucursal94@example.com'),
(95, 'Barranquilla', 'Calle 95 #10-20', '5712345705', '3201234655', 'sucursal95@example.com'),
(96, 'Cartagena', 'Calle 96 #10-20', '5712345706', '3201234656', 'sucursal96@example.com'),
(97, 'Cartagena', 'Calle 97 #10-20', '5712345707', '3201234657', 'sucursal97@example.com'),
(98, 'Cartagena', 'Calle 98 #10-20', '5712345708', '3201234658', 'sucursal98@example.com'),
(99, 'Cartagena', 'Calle 99 #10-20', '5712345709', '3201234659', 'sucursal99@example.com'),
(100, 'Cartagena', 'Calle 100 #10-20', '5712345710', '3201234660', 'sucursal100@example.com');



INSERT INTO empleados VALUES
(1, 1, '1012345671', 'Juan', 'Pérez', 'Calle 1 #10-20', 'Bogotá', '3001234571', 'juan.perez@example.com'),
(2, 2, '1012345672', 'Carlos', 'González', 'Calle 2 #10-20', 'Bogotá', '3001234572', 'carlos.gonzalez@example.com'),
(3, 3, '1012345673', 'Luis', 'Martínez', 'Calle 3 #10-20', 'Bogotá', '3001234573', 'luis.martinez@example.com'),
(4, 4, '1012345674', 'Ana', 'Rodríguez', 'Calle 4 #10-20', 'Bogotá', '3001234574', 'ana.rodriguez@example.com'),
(5, 5, '1012345675', 'María', 'López', 'Calle 5 #10-20', 'Bogotá', '3001234575', 'maria.lopez@example.com'),
(6, 6, '1012345676', 'Pedro', 'Hernández', 'Calle 6 #10-20', 'Medellín', '3001234576', 'pedro.hernandez@example.com'),
(7, 7, '1012345677', 'Jorge', 'García', 'Calle 7 #10-20', 'Medellín', '3001234577', 'jorge.garcia@example.com'),
(8, 8, '1012345678', 'Lucía', 'Gómez', 'Calle 8 #10-20', 'Medellín', '3001234578', 'lucia.gomez@example.com'),
(9, 9, '1012345679', 'Andrés', 'Ruiz', 'Calle 9 #10-20', 'Medellín', '3001234579', 'andres.ruiz@example.com'),
(10, 10, '1012345680', 'Carmen', 'Díaz', 'Calle 10 #10-20', 'Medellín', '3001234580', 'carmen.diaz@example.com'),
(11, 11, '1012345681', 'Sofía', 'Fernández', 'Calle 11 #10-20', 'Cali', '3001234581', 'sofia.fernandez@example.com'),
(12, 12, '1012345682', 'Ricardo', 'Torres', 'Calle 12 #10-20', 'Cali', '3001234582', 'ricardo.torres@example.com'),
(13, 13, '1012345683', 'Raúl', 'Ramos', 'Calle 13 #10-20', 'Cali', '3001234583', 'raul.ramos@example.com'),
(14, 14, '1012345684', 'Beatriz', 'Castillo', 'Calle 14 #10-20', 'Cali', '3001234584', 'beatriz.castillo@example.com'),
(15, 15, '1012345685', 'Elena', 'Morales', 'Calle 15 #10-20', 'Cali', '3001234585', 'elena.morales@example.com'),
(16, 16, '1012345686', 'Alberto', 'Ortiz', 'Calle 16 #10-20', 'Barranquilla', '3001234586', 'alberto.ortiz@example.com'),
(17, 17, '1012345687', 'Gloria', 'Ramírez', 'Calle 17 #10-20', 'Barranquilla', '3001234587', 'gloria.ramirez@example.com'),
(18, 18, '1012345688', 'Sandra', 'Vega', 'Calle 18 #10-20', 'Barranquilla', '3001234588', 'sandra.vega@example.com'),
(19, 19, '1012345689', 'Rafael', 'Medina', 'Calle 19 #10-20', 'Barranquilla', '3001234589', 'rafael.medina@example.com'),
(20, 20, '1012345690', 'Natalia', 'Flores', 'Calle 20 #10-20', 'Barranquilla', '3001234590', 'natalia.flores@example.com'),
(21, 21, '1012345691', 'Esteban', 'Cruz', 'Calle 21 #10-20', 'Cartagena', '3001234591', 'esteban.cruz@example.com'),
(22, 22, '1012345692', 'Lorena', 'Rojas', 'Calle 22 #10-20', 'Cartagena', '3001234592', 'lorena.rojas@example.com'),
(23, 23, '1012345693', 'Javier', 'Álvarez', 'Calle 23 #10-20', 'Cartagena', '3001234593', 'javier.alvarez@example.com'),
(24, 24, '1012345694', 'Patricia', 'Mendoza', 'Calle 24 #10-20', 'Cartagena', '3001234594', 'patricia.mendoza@example.com'),
(25, 25, '1012345695', 'Isabel', 'Castro', 'Calle 25 #10-20', 'Cartagena', '3001234595', 'isabel.castro@example.com'),
(26, 26, '1012345696', 'Gabriel', 'Luna', 'Calle 26 #10-20', 'Bogotá', '3001234596', 'gabriel.luna@example.com'),
(27, 27, '1012345697', 'Mónica', 'Reyes', 'Calle 27 #10-20', 'Bogotá', '3001234597', 'monica.reyes@example.com'),
(28, 28, '1012345698', 'Daniel', 'Campos', 'Calle 28 #10-20', 'Bogotá', '3001234598', 'daniel.campos@example.com'),
(29, 29, '1012345699', 'Angela', 'Guzmán', 'Calle 29 #10-20', 'Bogotá', '3001234599', 'angela.guzman@example.com'),
(30, 30, '1012345700', 'Francisco', 'Peña', 'Calle 30 #10-20', 'Bogotá', '3001234600', 'francisco.pena@example.com'),
(31, 31, '1012345701', 'Teresa', 'Soto', 'Calle 31 #10-20', 'Medellín', '3001234601', 'teresa.soto@example.com'),
(32, 32, '1012345702', 'Diego', 'Mora', 'Calle 32 #10-20', 'Medellín', '3001234602', 'diego.mora@example.com'),
(33, 33, '1012345703', 'Claudia', 'Pineda', 'Calle 33 #10-20', 'Medellín', '3001234603', 'claudia.pineda@example.com'),
(34, 34, '1012345704', 'Mario', 'Chávez', 'Calle 34 #10-20', 'Medellín', '3001234604', 'mario.chavez@example.com'),
(35, 35, '1012345705', 'Verónica', 'Iglesias', 'Calle 35 #10-20', 'Medellín', '3001234605', 'veronica.iglesias@example.com'),
(36, 36, '1012345706', 'Felipe', 'Serrano', 'Calle 36 #10-20', 'Cali', '3001234606', 'felipe.serrano@example.com'),
(37, 37, '1012345707', 'Silvia', 'Rivas', 'Calle 37 #10-20', 'Cali', '3001234607', 'silvia.rivas@example.com'),
(38, 38, '1012345708', 'Emilio', 'Vargas', 'Calle 38 #10-20', 'Cali', '3001234608', 'emilio.vargas@example.com'),
(39, 39, '1012345709', 'Laura', 'Muñoz', 'Calle 39 #10-20', 'Cali', '3001234609', 'laura.munoz@example.com'),
(40, 40, '1012345710', 'Fernando', 'Cortés', 'Calle 40 #10-20', 'Cali', '3001234610', 'fernando.cortes@example.com'),
(41, 41, '1012345711', 'Adriana', 'Santos', 'Calle 41 #10-20', 'Barranquilla', '3001234611', 'adriana.santos@example.com'),
(42, 42, '1012345712', 'Gustavo', 'Navarro', 'Calle 42 #10-20', 'Barranquilla', '3001234612', 'gustavo.navarro@example.com'),
(43, 43, '1012345713', 'Victoria', 'Gil', 'Calle 43 #10-20', 'Barranquilla', '3001234613', 'victoria.gil@example.com'),
(44, 44, '1012345714', 'Héctor', 'Méndez', 'Calle 44 #10-20', 'Barranquilla', '3001234614', 'hector.mendez@example.com'),
(45, 45, '1012345715', 'Paula', 'Ortega', 'Calle 45 #10-20', 'Barranquilla', '3001234615', 'paula.ortega@example.com'),
(46, 46, '1012345716', 'Rodrigo', 'Arias', 'Calle 46 #10-20', 'Cartagena', '3001234616', 'rodrigo.arias@example.com'),
(47, 47, '1012345717', 'Luz', 'Páez', 'Calle 47 #10-20', 'Cartagena', '3001234617', 'luz.paez@example.com'),
(48, 48, '1012345718', 'Enrique', 'Rico', 'Calle 48 #10-20', 'Cartagena', '3001234618', 'enrique.rico@example.com'),
(49, 49, '1012345719', 'Graciela', 'Nieto', 'Calle 49 #10-20', 'Cartagena', '3001234619', 'graciela.nieto@example.com'),
(50, 50, '1012345720', 'Oscar', 'Pinedo', 'Calle 50 #10-20', 'Cartagena', '3001234620', 'oscar.pinedo@example.com'),
(51, 1, '1012345721', 'Valeria', 'Salazar', 'Calle 51 #10-20', 'Bogotá', '3001234621', 'valeria.salazar@example.com'),
(52, 2, '1012345722', 'Roberto', 'Ramírez', 'Calle 52 #10-20', 'Bogotá', '3001234622', 'roberto.ramirez@example.com'),
(53, 3, '1012345723', 'Marta', 'Castaño', 'Calle 53 #10-20', 'Bogotá', '3001234623', 'marta.castano@example.com'),
(54, 4, '1012345724', 'Samuel', 'Valencia', 'Calle 54 #10-20', 'Bogotá', '3001234624', 'samuel.valencia@example.com'),
(55, 5, '1012345725', 'Inés', 'Navarro', 'Calle 55 #10-20', 'Bogotá', '3001234625', 'ines.navarro@example.com'),
(56, 6, '1012345726', 'Santiago', 'Velásquez', 'Calle 56 #10-20', 'Medellín', '3001234626', 'santiago.velasquez@example.com'),
(57, 7, '1012345727', 'Diana', 'Mendoza', 'Calle 57 #10-20', 'Medellín', '3001234627', 'diana.mendoza@example.com'),
(58, 8, '1012345728', 'Germán', 'Santos', 'Calle 58 #10-20', 'Medellín', '3001234628', 'german.santos@example.com'),
(59, 9, '1012345729', 'Paulina', 'Quintero', 'Calle 59 #10-20', 'Medellín', '3001234629', 'paulina.quintero@example.com'),
(60, 10, '1012345730', 'Tomás', 'Pérez', 'Calle 60 #10-20', 'Medellín', '3001234630', 'tomas.perez@example.com'),
(61, 11, '1012345731', 'Catalina', 'Arias', 'Calle 61 #10-20', 'Cali', '3001234631', 'catalina.arias@example.com'),
(62, 12, '1012345732', 'Eduardo', 'Fuentes', 'Calle 62 #10-20', 'Cali', '3001234632', 'eduardo.fuentes@example.com'),
(63, 13, '1012345733', 'Adriana', 'Carrillo', 'Calle 63 #10-20', 'Cali', '3001234633', 'adriana.carrillo@example.com'),
(64, 14, '1012345734', 'Guillermo', 'Rojas', 'Calle 64 #10-20', 'Cali', '3001234634', 'guillermo.rojas@example.com'),
(65, 15, '1012345735', 'Natalia', 'Guzmán', 'Calle 65 #10-20', 'Cali', '3001234635', 'natalia.guzman@example.com'),
(66, 16, '1012345736', 'Luis', 'Zapata', 'Calle 66 #10-20', 'Barranquilla', '3001234636', 'luis.zapata@example.com'),
(67, 17, '1012345737', 'Andrea', 'Ruiz', 'Calle 67 #10-20', 'Barranquilla', '3001234637', 'andrea.ruiz@example.com'),
(68, 18, '1012345738', 'Mario', 'Patiño', 'Calle 68 #10-20', 'Barranquilla', '3001234638', 'mario.patino@example.com'),
(69, 19, '1012345739', 'Elena', 'Martínez', 'Calle 69 #10-20', 'Barranquilla', '3001234639', 'elena.martinez@example.com'),
(70, 20, '1012345740', 'Felipe', 'Castro', 'Calle 70 #10-20', 'Barranquilla', '3001234640', 'felipe.castro@example.com'),
(71, 21, '1012345741', 'Sandra', 'Moreno', 'Calle 71 #10-20', 'Cartagena', '3001234641', 'sandra.moreno@example.com'),
(72, 22, '1012345742', 'Rafael', 'Hernández', 'Calle 72 #10-20', 'Cartagena', '3001234642', 'rafael.hernandez@example.com'),
(73, 23, '1012345743', 'Paula', 'Lara', 'Calle 73 #10-20', 'Cartagena', '3001234643', 'paula.lara@example.com'),
(74, 24, '1012345744', 'Leonardo', 'Campos', 'Calle 74 #10-20', 'Cartagena', '3001234644', 'leonardo.campos@example.com'),
(75, 25, '1012345745', 'Alicia', 'Pineda', 'Calle 75 #10-20', 'Cartagena', '3001234645', 'alicia.pineda@example.com'),
(76, 26, '1012345746', 'Miguel', 'Sarmiento', 'Calle 76 #10-20', 'Bogotá', '3001234646', 'miguel.sarmiento@example.com'),
(77, 27, '1012345747', 'Liliana', 'Palacios', 'Calle 77 #10-20', 'Bogotá', '3001234647', 'liliana.palacios@example.com'),
(78, 28, '1012345748', 'David', 'Torres', 'Calle 78 #10-20', 'Bogotá', '3001234648', 'david.torres@example.com'),
(79, 29, '1012345749', 'Estefanía', 'Ortiz', 'Calle 79 #10-20', 'Bogotá', '3001234649', 'estefania.ortiz@example.com'),
(80, 30, '1012345750', 'Ricardo', 'Gómez', 'Calle 80 #10-20', 'Bogotá', '3001234650', 'ricardo.gomez@example.com'),
(81, 31, '1012345751', 'Lorena', 'Soto', 'Calle 81 #10-20', 'Medellín', '3001234651', 'lorena.soto@example.com'),
(82, 32, '1012345752', 'Héctor', 'Mejía', 'Calle 82 #10-20', 'Medellín', '3001234652', 'hector.mejia@example.com'),
(83, 33, '1012345753', 'Gabriela', 'Acosta', 'Calle 83 #10-20', 'Medellín', '3001234653', 'gabriela.acosta@example.com'),
(84, 34, '1012345754', 'Eduardo', 'Pérez', 'Calle 84 #10-20', 'Medellín', '3001234654', 'eduardo.perez@example.com'),
(85, 35, '1012345755', 'Margarita', 'Herrera', 'Calle 85 #10-20', 'Medellín', '3001234655', 'margarita.herrera@example.com'),
(86, 36, '1012345756', 'Carlos', 'Ortiz', 'Calle 86 #10-20', 'Cali', '3001234656', 'carlos.ortiz@example.com'),
(87, 37, '1012345757', 'Laura', 'Sánchez', 'Calle 87 #10-20', 'Cali', '3001234657', 'laura.sanchez@example.com'),
(88, 38, '1012345758', 'Jorge', 'Navarro', 'Calle 88 #10-20', 'Cali', '3001234658', 'jorge.navarro@example.com'),
(89, 39, '1012345759', 'Patricia', 'Montoya', 'Calle 89 #10-20', 'Cali', '3001234659', 'patricia.montoya@example.com'),
(90, 40, '1012345760', 'Raúl', 'López', 'Calle 90 #10-20', 'Cali', '3001234660', 'raul.lopez@example.com'),
(91, 41, '1012345761', 'Daniela', 'Jiménez', 'Calle 91 #10-20', 'Barranquilla', '3001234661', 'daniela.jimenez@example.com'),
(92, 42, '1012345762', 'Fernando', 'Giraldo', 'Calle 92 #10-20', 'Barranquilla', '3001234662', 'fernando.giraldo@example.com'),
(93, 43, '1012345763', 'Camila', 'Moreno', 'Calle 93 #10-20', 'Barranquilla', '3001234663', 'camila.moreno@example.com'),
(94, 44, '1012345764', 'Sebastián', 'Ramírez', 'Calle 94 #10-20', 'Barranquilla', '3001234664', 'sebastian.ramirez@example.com'),
(95, 45, '1012345765', 'Juliana', 'Muñoz', 'Calle 95 #10-20', 'Barranquilla', '3001234665', 'juliana.munoz@example.com'),
(96, 46, '1012345766', 'Ignacio', 'Ortega', 'Calle 96 #10-20', 'Cartagena', '3001234666', 'ignacio.ortega@example.com'),
(97, 47, '1012345767', 'Rocío', 'Álvarez', 'Calle 97 #10-20', 'Cartagena', '3001234667', 'rocio.alvarez@example.com'),
(98, 48, '1012345768', 'Francisco', 'Ríos', 'Calle 98 #10-20', 'Cartagena', '3001234668', 'francisco.rios@example.com'),
(99, 49, '1012345769', 'María', 'Suárez', 'Calle 99 #10-20', 'Cartagena', '3001234669', 'maria.suarez@example.com'),
(100, 50, '1012345770', 'Alejandro', 'Vargas', 'Calle 100 #10-20', 'Cartagena', '3001234670', 'alejandro.vargas@example.com');



INSERT INTO clientes VALUES
(1, 1234567890, 'Juan Carlos', 'González Pérez', 'Calle 1 #23-45', 'Bogotá', '3001234567', 'juancarlos1@example.com'),
(2, 2345678901, 'María Alejandra', 'López Martínez', 'Carrera 2 #34-56', 'Medellín', '3102345678', 'mariaalejandra2@example.com'),
(3, 3456789012, 'Luis Felipe', 'Ramírez Gómez', 'Avenida 3 #45-67', 'Cali', '3203456789', 'luisfelipe3@example.com'),
(4, 4567890123, 'Ana Isabel', 'Hernández García', 'Calle 4 #56-78', 'Barranquilla', '3304567890', 'anaisabel4@example.com'),
(5, 5678901234, 'Javier Andrés', 'Suárez Pérez', 'Calle 5 #67-89', 'Cartagena', '3405678901', 'javierandres5@example.com'),
(6, 6789012345, 'Camila Fernanda', 'Castro Rodríguez', 'Carrera 6 #78-90', 'Bogotá', '3506789012', 'camilafernanda6@example.com'),
(7, 7890123456, 'Diego Alejandro', 'Vargas López', 'Carrera 7 #89-01', 'Medellín', '3607890123', 'diegoalejandro7@example.com'),
(8, 8901234567, 'Valentina Sofía', 'Moreno Hernández', 'Carrera 8 #90-12', 'Cali', '3708901234', 'valentinap8@example.com'),
(9, 9012345678, 'Mateo Andrés', 'Rojas Gómez', 'Carrera 9 #01-23', 'Barranquilla', '3809012345', 'mateoa9@example.com'),
(10, 1234567890, 'Isabella Valeria', 'Jiménez Ramírez', 'Avenida 10 #12-34', 'Cartagena', '3901234567', 'isabellav10@example.com'),
(11, 2345678901, 'Santiago José', 'Silva Pérez', 'Calle 11 #23-45', 'Bogotá', '4002345678', 'santiagoj11@example.com'),
(12, 3456789012, 'Luciana Gabriela', 'Torres García', 'Carrera 12 #34-56', 'Medellín', '4103456789', 'lucianag12@example.com'),
(13, 4567890123, 'Emilio Andrés', 'Martínez Martínez', 'Avenida 13 #45-67', 'Cali', '4204567890', 'emilioa13@example.com'),
(14, 5678901234, 'Valeria Camila', 'Ortega Gómez', 'Calle 14 #56-78', 'Barranquilla', '4305678901', 'valeriac14@example.com'),
(15, 6789012345, 'Juan Pablo Antonio', 'Herrera Rodríguez', 'Calle 15 #67-89', 'Cartagena', '4406789012', 'juanpabloa15@example.com'),
(16, 7890123456, 'Mariana Isabel', 'Díaz López', 'Carrera 16 #78-90', 'Bogotá', '4507890123', 'marianai16@example.com'),
(17, 8901234567, 'Simón José', 'Gutiérrez Hernández', 'Carrera 17 #89-01', 'Medellín', '4608901234', 'simonj17@example.com'),
(18, 9012345678, 'Carolina Andrea', 'Londoño Gómez', 'Carrera 18 #90-12', 'Cali', '4709012345', 'carolinaa18@example.com'),
(19, 1234567890, 'Daniel Felipe', 'Restrepo Ramírez', 'Avenida 19 #12-34', 'Barranquilla', '4801234567', 'danielf19@example.com'),
(20, 2345678901, 'Valentina Isabella', 'Sánchez Pérez', 'Calle 20 #23-45', 'Cartagena', '4902345678', 'valentinai20@example.com'),
(21, 3456789012, 'Sebastián Alejandro', 'Rojas García', 'Carrera 21 #34-56', 'Bogotá', '5003456789', 'sebastiana21@example.com'),
(22, 3456789012, 'Sebastián Alejandro', 'Rojas García', 'Carrera 21 #34-56', 'Bogotá', '5003456789', 'sebastiana21@example.com'),
(23, 4567890123, 'María José', 'Moreno Martínez', 'Avenida 22 #45-67', 'Medellín', '5104567890', 'mariajose23@example.com'),
(24, 5678901234, 'Andrés Felipe', 'González Gómez', 'Calle 23 #56-78', 'Cali', '5205678901', 'andresf24@example.com'),
(25, 6789012345, 'Valeria Sofia', 'Martínez Rodríguez', 'Carrera 24 #67-89', 'Barranquilla', '5306789012', 'valerias25@example.com'),
(26, 7890123456, 'Juan David', 'Hernández López', 'Carrera 25 #78-90', 'Cartagena', '5407890123', 'juandavid26@example.com'),
(27, 8901234567, 'Camila Alejandra', 'Gómez García', 'Calle 26 #89-01', 'Bogotá', '5508901234', 'camilaa27@example.com'),
(28, 9012345678, 'Santiago Andrés', 'Londoño Hernández', 'Calle 27 #90-12', 'Medellín', '5609012345', 'santiagoa28@example.com'),
(29, 1234567890, 'Daniela María', 'Ramírez Gómez', 'Avenida 29 #12-34', 'Cali', '5701234567', 'danielam29@example.com'),
(30, 2345678901, 'Mateo Alejandro', 'Pérez Martínez', 'Carrera 30 #23-45', 'Barranquilla', '5802345678', 'mateoa30@example.com'),
(31, 3456789012, 'Valentina Sofia', 'Suárez López', 'Calle 31 #34-56', 'Cartagena', '5903456789', 'valentinas31@example.com'),
(32, 4567890123, 'Lucas Alejandro', 'González Gómez', 'Carrera 32 #45-67', 'Bogotá', '6004567890', 'lucasa32@example.com'),
(33, 5678901234, 'Isabella Valeria', 'Hernández Rodríguez', 'Calle 33 #56-78', 'Medellín', '6105678901', 'isabellav33@example.com'),
(34, 6789012345, 'Juan José', 'Martínez Martínez', 'Carrera 34 #67-89', 'Cali', '6206789012', 'juanjose34@example.com'),
(35, 7890123456, 'Mariana Gabriela', 'Gómez Hernández', 'Carrera 35 #78-90', 'Barranquilla', '6307890123', 'marianag35@example.com'),
(36, 8901234567, 'Diego Andrés', 'López López', 'Calle 36 #89-01', 'Cartagena', '6408901234', 'diegoa36@example.com'),
(37, 9012345678, 'Valeria Camila', 'Hernández García', 'Calle 37 #90-12', 'Bogotá', '6509012345', 'valeriac37@example.com'),
(38, 1234567890, 'Sebastián Felipe', 'Gómez Gómez', 'Avenida 38 #12-34', 'Medellín', '6601234567', 'sebastianf38@example.com'),
(39, 2345678901, 'Luciana Sofía', 'Pérez Rodríguez', 'Carrera 39 #23-45', 'Cali', '6702345678', 'lucianas39@example.com'),
(40, 3456789012, 'Andrés Felipe', 'Martínez López', 'Calle 40 #34-56', 'Barranquilla', '6803456789', 'andresf40@example.com'),
(41, 4567890123, 'María José', 'Suárez Gómez', 'Avenida 41 #45-67', 'Cartagena', '6904567890', 'mariajose41@example.com'),
(42, 5678901234, 'Juan Pablo', 'González Martínez', 'Calle 42 #56-78', 'Bogotá', '7005678901', 'juanpablo42@example.com'),
(43, 6789012345, 'Valentina Isabella', 'Hernández López', 'Carrera 43 #67-89', 'Medellín', '7106789012', 'valentinai43@example.com'),
(44, 7890123456, 'Santiago Alejandro', 'Martínez Gómez', 'Carrera 44 #78-90', 'Cali', '7207890123', 'santiagoa44@example.com'),
(45, 8901234567, 'Camila Sofía', 'Gómez Rodríguez', 'Calle 45 #89-01', 'Barranquilla', '7308901234', 'camilas45@example.com'),
(46, 9012345678, 'Mateo Andrés', 'López Hernández', 'Calle 46 #90-12', 'Cartagena', '7409012345', 'mateoa46@example.com'),
(47, 1234567890, 'Isabella Valentina', 'Gómez García', 'Avenida 47 #12-34', 'Bogotá', '7501234567', 'isabellav47@example.com'),
(48, 2345678901, 'Lucas Alejandro', 'Hernández Martínez', 'Carrera 48 #23-45', 'Medellín', '7602345678', 'lucasa48@example.com'),
(49, 3456789012, 'Valeria Sofía', 'Martínez López', 'Calle 49 #34-56', 'Cali', '7703456789', 'valerias49@example.com'),
(50, 4567890123, 'Sebastián Felipe', 'Gómez Gómez', 'Avenida 50 #45-67', 'Barranquilla', '7804567890', 'sebastianf50@example.com'),
(51, 5678901234, 'María Alejandra', 'González Pérez', 'Carrera 51 #56-78', 'Cartagena', '7905678901', 'mariaalejandra51@example.com'),
(52, 6789012345, 'Juan Pablo', 'Martínez Gómez', 'Calle 52 #67-89', 'Bogotá', '8006789012', 'juanpablo52@example.com'),
(53, 7890123456, 'Valentina Sofía', 'López Rodríguez', 'Carrera 53 #78-90', 'Medellín', '8107890123', 'valentinas53@example.com'),
(54, 8901234567, 'Santiago Alejandro', 'Gómez Martínez', 'Calle 54 #89-01', 'Cali', '8208901234', 'santiagoa54@example.com'),
(55, 9012345678, 'Camila Isabella', 'Hernández Gómez', 'Calle 55 #90-12', 'Barranquilla', '8309012345', 'camilai55@example.com'),
(56, 1234567890, 'Mateo Andrés', 'Martínez López', 'Avenida 56 #12-34', 'Cartagena', '8401234567', 'mateoa56@example.com'),
(57, 2345678901, 'Valeria Luciana', 'Gómez Rodríguez', 'Carrera 57 #23-45', 'Bogotá', '8502345678', 'valerial57@example.com'),
(58, 3456789012, 'Sebastián Felipe', 'Hernández Gómez', 'Calle 58 #34-56', 'Medellín', '8603456789', 'sebastianf58@example.com'),
(59, 4567890123, 'Lucas Alejandro', 'Martínez López', 'Carrera 59 #45-67', 'Cali', '8704567890', 'lucasa59@example.com'),
(60, 5678901234, 'Isabella Sofía', 'Gómez Martínez', 'Calle 60 #56-78', 'Barranquilla', '8805678901', 'isabellas60@example.com'),
(61, 6789012345, 'Juan David', 'Hernández Gómez', 'Calle 61 #67-89', 'Cartagena', '8906789012', 'juandavid61@example.com'),
(62, 7890123456, 'Valentina Alejandra', 'Martínez López', 'Carrera 62 #78-90', 'Bogotá', '9007890123', 'valentinaa62@example.com'),
(63, 8901234567, 'Santiago Felipe', 'Gómez Rodríguez', 'Calle 63 #89-01', 'Medellín', '9108901234', 'santiagof63@example.com'),
(64, 9012345678, 'Camila Sofía', 'Hernández Gómez', 'Calle 64 #90-12', 'Cali', '9209012345', 'camilas64@example.com'),
(65, 1234567890, 'Mateo Alejandro', 'Martínez López', 'Avenida 65 #12-34', 'Barranquilla', '9301234567', 'mateoal65@example.com'),
(66, 2345678901, 'Valeria Luciana', 'Gómez Martínez', 'Carrera 66 #23-45', 'Cartagena', '9402345678', 'valerial66@example.com'),
(67, 3456789012, 'Sebastián Andrés', 'Hernández Gómez', 'Calle 67 #34-56', 'Bogotá', '9503456789', 'sebastiana67@example.com'),
(68, 4567890123, 'Lucas Alejandro', 'Martínez López', 'Carrera 68 #45-67', 'Medellín', '9604567890', 'lucasa68@example.com'),
(69, 5678901234, 'Isabella Sofía', 'Gómez Martínez', 'Calle 69 #56-78', 'Cali', '9705678901', 'isabellas69@example.com'),
(70, 6789012345, 'Juan David', 'Hernández Gómez', 'Calle 70 #67-89', 'Barranquilla', '9806789012', 'juandavid70@example.com'),
(71, 7890123456, 'Valentina Alejandra', 'Martínez López', 'Carrera 71 #78-90', 'Cartagena', '9907890123', 'valentinaa71@example.com'),
(72, 8901234567, 'Santiago Felipe', 'Gómez Rodríguez', 'Calle 72 #89-01', 'Bogotá', '10008901234', 'santiagof72@example.com'),
(73, 9012345678, 'Camila Sofía', 'Hernández Gómez', 'Calle 73 #90-12', 'Medellín', '10109012345', 'camilas73@example.com'),
(74, 1234567890, 'Mateo Alejandro', 'Martínez López', 'Avenida 74 #12-34', 'Cali', '10201234567', 'mateoal74@example.com'),
(75, 2345678901, 'Valeria Luciana', 'Gómez Martínez', 'Carrera 75 #23-45', 'Barranquilla', '10302345678', 'valerial75@example.com'),
(76, 3456789012, 'Sebastián Andrés', 'Hernández Gómez', 'Calle 76 #34-56', 'Cartagena', '10403456789', 'sebastiana76@example.com'),
(77, 4567890123, 'Lucas Alejandro', 'Martínez López', 'Carrera 77 #45-67', 'Bogotá', '10504567890', 'lucasa77@example.com'),
(78, 5678901234, 'Isabella Sofía', 'Gómez Martínez', 'Calle 78 #56-78', 'Medellín', '10605678901', 'isabellas78@example.com'),
(79, 6789012345, 'Juan David', 'Hernández Gómez', 'Calle 79 #67-89', 'Cali', '10706789012', 'juandavid79@example.com'),
(80, 7890123456, 'Valentina Alejandra', 'Martínez López', 'Carrera 80 #78-90', 'Barranquilla', '10807890123', 'valentinaa80@example.com'),
(81, 8901234567, 'Santiago Felipe', 'Gómez Rodríguez', 'Calle 81 #89-01', 'Cartagena', '10908901234', 'santiagof81@example.com'),
(82, 9012345678, 'Camila Sofía', 'Hernández Gómez', 'Calle 82 #90-12', 'Bogotá', '11009012345', 'camilas82@example.com'),
(83, 1234567890, 'Mateo Alejandro', 'Martínez López', 'Avenida 83 #12-34', 'Medellín', '11101234567', 'mateoal83@example.com'),
(84, 2345678901, 'Valeria Luciana', 'Gómez Martínez', 'Carrera 84 #23-45', 'Cali', '11202345678', 'valerial84@example.com'),
(85, 3456789012, 'Sebastián Andrés', 'Hernández Gómez', 'Calle 85 #34-56', 'Barranquilla', '11303456789', 'sebastiana85@example.com'),
(86, 4567890123, 'Lucas Alejandro', 'Martínez López', 'Carrera 86 #45-67', 'Cartagena', '11404567890', 'lucasa86@example.com'),
(87, 5678901234, 'Isabella Sofía', 'Gómez Martínez', 'Calle 87 #56-78', 'Bogotá', '11505678901', 'isabellas87@example.com'),
(88, 6789012345, 'Juan David', 'Hernández Gómez', 'Calle 88 #67-89', 'Medellín', '11606789012', 'juandavid88@example.com'),
(89, 7890123456, 'Valentina Alejandra', 'Martínez López', 'Carrera 89 #78-90', 'Cali', '11707890123', 'valentinaa89@example.com'),
(90, 8901234567, 'Santiago Felipe', 'Gómez Perez', 'Carrera 2ae #27b-20', 'Bogotá', '10053311141', 'santiagof23@example.com'),
(91, 9012345678, 'Camila Sofía', 'Hernández Gómez', 'Calle 91 #90-12', 'Barranquilla', '11809012345', 'camilas91@example.com'),
(92, 1234567890, 'Mateo Alejandro', 'Martínez López', 'Avenida 92 #12-34', 'Cartagena', '11901234567', 'mateoal92@example.com'),
(93, 2345678901, 'Valeria Luciana', 'Gómez Martínez', 'Carrera 93 #23-45', 'Bogotá', '12002345678', 'valerial93@example.com'),
(94, 3456789012, 'Sebastián Andrés', 'Hernández Gómez', 'Calle 94 #34-56', 'Medellín', '12103456789', 'sebastiana94@example.com'),
(95, 4567890123, 'Lucas Alejandro', 'Martínez López', 'Carrera 95 #45-67', 'Cali', '12204567890', 'lucasa95@example.com'),
(96, 5678901234, 'Isabella Sofía', 'Gómez Martínez', 'Calle 96 #56-78', 'Barranquilla', '12305678901', 'isabellas96@example.com'),
(97, 6789012345, 'Juan David', 'Hernández Gómez', 'Calle 97 #67-89', 'Cartagena', '12406789012', 'juandavid97@example.com'),
(98, 7890123456, 'Valentina Alejandra', 'Martínez López', 'Carrera 98 #78-90', 'Bogotá', '12507890123', 'valentinaa98@example.com'),
(99, 8901234567, 'Santiago Felipe', 'Gómez Rodríguez', 'Calle 99 #89-01', 'Medellín', '12608901234', 'santiagof99@example.com'),
(100, 9012345678, 'Camila Sofía', 'Hernández Gómez', 'Calle 100 #90-12', 'Cali', '12709012345', 'camilas100@example.com');



INSERT INTO vehiculos VALUES
(1, 'Sedán', 'DEF456', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(2, 'Compacto', 'GHI789','Hatchback' , '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(3, 'Camioneta', 'JKL012', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Negro'),
(4, 'SUV', 'MNO345', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Azul'),
(5, 'Sedán', 'PQR678', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Plata'),
(6, 'Compacto', 'STU901', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(7, 'Camioneta', 'VWX234', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Gris'),
(8, 'SUV', 'YZA567', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(9, 'Sedán', 'BCD890', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(10, 'Compacto', 'EFG123', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(11, 'Camioneta', 'HIJ456', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Azul'),
(12, 'SUV', 'KLM789', 'SUV', '2023', 4, 5, 'no', 'Gasolina', 'Plata'),
(13, 'Sedán', 'NOP012', 'Sedán', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(14, 'Compacto', 'QRS345', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Gris'),
(15, 'Camioneta', 'TUV678', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Blanco'),
(16, 'SUV', 'WXY901', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Rojo'),
(17, 'Sedán', 'ZAB234', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(18, 'Compacto', 'CDE567', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Azul'),
(19, 'Camioneta', 'FGH890', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Plata'),
(20, 'SUV', 'IJK123', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(21, 'Sedán', 'LMN456', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Gris'),
(22, 'Compacto', 'OPQ789', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Blanco'),
(23, 'Camioneta', 'RST012', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Rojo'),
(24, 'SUV', 'UVW345', 'SUV', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(25, 'Sedán', 'XYZ678', 'Sedán', '2023', 4, 5, 'si', 'Gasolina', 'Azul'),
(26, 'Compacto', 'BCD901', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Plata'),
(27, 'Camioneta', 'EFG234', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Verde'),
(28, 'SUV', 'HIJ567', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Gris'),
(29, 'Sedán', 'KLM890', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Blanco'),
(30, 'Compacto', 'NOP123', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(31, 'Camioneta', 'QRS456', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Negro'),
(32, 'SUV', 'TUV789', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Azul'),
(33, 'Sedán', 'WXY012', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Plata'),
(34, 'Compacto', 'ZAB345', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(35, 'Camioneta', 'CDE678', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Gris'),
(36, 'SUV', 'FGH901', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(37, 'Sedán', 'IJK234', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(38, 'Compacto', 'LMN567', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(39, 'Camioneta', 'OPQ890', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Azul'),
(40, 'SUV', 'RST123', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Plata'),
(41, 'Sedán', 'UVW456', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Verde'),
(42, 'Compacto', 'XYZ789', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Gris'),
(43, 'Camioneta', 'BCD012', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Blanco'),
(44, 'SUV', 'EFG345', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Rojo'),
(45, 'Sedán', 'HIJ678', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(46, 'Compacto', 'KLM901', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Azul'),
(47, 'Camioneta', 'NOP234', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Plata'),
(48, 'SUV', 'QRS567', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(49, 'Sedán', 'TUV890', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Gris'),
(50, 'Compacto', 'WXY123', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(51, 'Camioneta', 'ZAB456', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Rojo'),
(52, 'SUV', 'CDE789', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Negro'),
(53, 'Sedán', 'FGH012', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Azul'),
(54, 'Compacto', 'IJK345', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Plata'),
(55, 'Camioneta', 'LMN678', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Verde'),
(56, 'SUV', 'OPQ901', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Gris'),
(57, 'Sedán', 'RST234', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Blanco'),
(58, 'Compacto', 'UVW567', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(59, 'Camioneta', 'XYZ890', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Negro'),
(60, 'SUV', 'BCD123', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Azul'),
(61, 'Sedán', 'EFG456', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Plata'),
(62, 'Compacto', 'HIJ789', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(63, 'Camioneta', 'KLM012', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Gris'),
(64, 'SUV', 'NOP345', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(65, 'Sedán', 'QRS678', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(66, 'Compacto', 'TUV901', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(67, 'Camioneta', 'WXY234', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Azul'),
(68, 'SUV', 'ZAB567', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Plata'),
(69, 'Sedán', 'CDE890', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Verde'),
(70, 'Compacto', 'FGH123', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Gris'),
(71, 'Camioneta', 'IJK456', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Blanco'),
(72, 'SUV', 'LMN789', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Rojo'),
(73, 'Sedán', 'OPQ012', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Negro'),
(74, 'Compacto', 'RST345', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Azul'),
(75, 'Camioneta', 'UVW678', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Plata'),
(76, 'SUV', 'XYZ901', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Verde'),
(77, 'Sedán', 'BCD234', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Gris'),
(78, 'Compacto', 'EFG567', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(79, 'Camioneta', 'HIJ890', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Rojo'),
(80, 'SUV', 'KLM123', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Negro'),
(81, 'Sedán', 'NOP456', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Azul'),
(82, 'Compacto', 'QRS789', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Plata'),
(83, 'Camioneta', 'TUV012', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Verde'),
(84, 'SUV', 'WXY345', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Gris'),
(85, 'Sedán', 'ZAB678', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Blanco'),
(86, 'Compacto', 'CDE901', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Rojo'),
(87, 'Camioneta', 'FGH234', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Negro'),
(88, 'SUV', 'IJK567', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Azul'),
(89, 'Sedán', 'LMN890', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Plata'),
(90, 'Compacto', 'OPQ123', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Verde'),
(91, 'Camioneta', 'RST456', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Gris'),
(92, 'SUV', 'UVW789', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Blanco'),
(93, 'Sedán', 'XYZ012', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Rojo'),
(94, 'Compacto', 'BCD345', 'Hatchback', '2023', 4, 5, 'si', 'Gasolina', 'Negro'),
(95, 'Camioneta', 'EFG678', 'Pickup', '2023', 2, 3, 'no', 'Diésel', 'Azul'),
(96, 'SUV', 'HIJ901', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Plata'),
(97, 'Sedán', 'KLM234', 'Sedán', '2023', 4, 5, 'no', 'Gasolina', 'Verde'),
(98, 'Compacto', 'NOP567', 'Hatchback', '2023', 4, 5, 'no', 'Gasolina', 'Gris'),
(99, 'Camioneta', 'QRS890', 'Pickup', '2023', 2, 3, 'si', 'Diésel', 'Blanco'),
(100, 'SUV', 'TUV123', 'SUV', '2023', 4, 5, 'si', 'Gasolina', 'Rojo');


INSERT INTO alquileres VALUES
(1, 1, 1, 1, 1, '2024-06-01', '2024-06-10', '2024-06-11', 500000, 75000, 0.10, 450000, 450000),
(2, 2, 2, 2, 2, '2024-06-05', '2024-06-15', '2024-06-16', 400000, 60000, 0.05, 380000, 380000),
(3, 3, 3, 3, 3, '2024-06-10', '2024-06-20', '2024-06-21', 300000, 50000, 0.07, 280000, 280000),
(4, 4, 4, 4, 4, '2024-06-15', '2024-06-25', '2024-06-26', 450000, 70000, 0.12, 396000, 396000),
(5, 5, 5, 5, 5, '2024-06-20', '2024-06-30', '2024-07-01', 500000, 75000, 0.15, 425000, 425000),
(6, 6, 6, 6, 6, '2024-06-25', '2024-07-05', '2024-07-06', 400000, 60000, 0.10, 360000, 360000),
(7, 7, 7, 7, 7, '2024-06-30', '2024-07-10', '2024-07-11', 300000, 50000, 0.08, 276000, 276000),
(8, 8, 8, 8, 8, '2024-07-05', '2024-07-15', '2024-07-16', 450000, 70000, 0.06, 423000, 423000),
(9, 9, 9, 9, 9, '2024-07-10', '2024-07-20', '2024-07-21', 500000, 75000, 0.10, 450000, 450000),
(10, 10, 10, 10, 10, '2024-07-15', '2024-07-25', '2024-07-26', 400000, 60000, 0.05, 380000, 380000),
(11, 11, 11, 11, 11, '2024-07-20', '2024-07-30', '2024-07-31', 300000, 50000, 0.12, 264000, 264000),
(12, 12, 12, 12, 12, '2024-07-25', '2024-08-04', '2024-08-05', 450000, 70000, 0.15, 382500, 382500),
(13, 13, 13, 13, 13, '2024-07-30', '2024-08-09', '2024-08-10', 500000, 75000, 0.08, 460000, 460000),
(14, 14, 14, 14, 14, '2024-08-04', '2024-08-14', '2024-08-15', 400000, 60000, 0.10, 360000, 360000),
(15, 15, 15, 15, 15, '2024-08-09', '2024-08-19', '2024-08-20', 300000, 50000, 0.05, 285000, 285000),
(16, 16, 16, 16, 16, '2024-08-14', '2024-08-24', '2024-08-25', 450000, 70000, 0.07, 418500, 418500),
(17, 17, 17, 17, 17, '2024-08-19', '2024-08-29', '2024-08-30', 500000, 75000, 0.10, 450000, 450000),
(18, 18, 18, 18, 18, '2024-08-24', '2024-09-03', '2024-09-04', 400000, 60000, 0.12, 352000, 352000),
(19, 19, 19, 19, 19, '2024-08-29', '2024-09-08', '2024-09-09', 300000, 50000, 0.15, 255000, 255000),
(20, 20, 20, 20, 20, '2024-09-03', '2024-09-13', '2024-09-14', 450000, 70000, 0.08, 414000, 414000),
(21, 21, 21, 21, 21, '2024-09-08', '2024-09-18', '2024-09-19', 500000, 75000, 0.05, 475000, 475000),
(22, 22, 22, 22, 22, '2024-09-13', '2024-09-23', '2024-09-24', 400000, 60000, 0.10, 360000, 360000),
(23, 23, 23, 23, 23, '2024-09-18', '2024-09-28', '2024-09-29', 300000, 50000, 0.07, 279000, 279000),
(24, 24, 24, 24, 24, '2024-09-23', '2024-10-03', '2024-10-04', 450000, 70000, 0.10, 405000, 405000),
(25, 25, 25, 25, 25, '2024-09-28', '2024-10-08', '2024-10-09', 500000, 75000, 0.12, 440000, 440000),
(26, 26, 26, 26, 26, '2024-10-03', '2024-10-13', '2024-10-14', 400000, 60000, 0.08, 368000, 368000),
(27, 27, 27, 27, 27, '2024-10-08', '2024-10-18', '2024-10-19', 300000, 50000, 0.10, 270000, 270000),
(28, 28, 28, 28, 28, '2024-10-13', '2024-10-23', '2024-10-24', 450000, 70000, 0.05, 427500, 427500),
(29, 29, 29, 29, 29, '2024-10-18', '2024-10-28', '2024-10-29', 500000, 75000, 0.15, 425000, 425000),
(30, 30, 30, 30, 30, '2024-10-23', '2024-11-02', '2024-11-03', 400000, 60000, 0.06, 376000, 376000),
(31, 31, 31, 31, 31, '2024-10-28', '2024-11-07', '2024-11-08', 300000, 50000, 0.12, 264000, 264000),
(32, 32, 32, 32, 32, '2024-11-02', '2024-11-12', '2024-11-13', 450000, 70000, 0.08, 414000, 414000),
(33, 33, 33, 33, 33, '2024-11-07', '2024-11-17', '2024-11-18', 500000, 75000, 0.10, 450000, 450000),
(34, 34, 34, 34, 34, '2024-11-12', '2024-11-22', '2024-11-23', 400000, 60000, 0.09, 364000, 364000),
(35, 35, 35, 35, 35, '2024-11-17', '2024-11-27', '2024-11-28', 300000, 50000, 0.07, 279000, 279000),
(36, 36, 36, 36, 36, '2024-11-22', '2024-12-02', '2024-12-03', 450000, 70000, 0.12, 396000, 396000),
(37, 37, 37, 37, 37, '2024-11-27', '2024-12-07', '2024-12-08', 500000, 75000, 0.08, 460000, 460000),
(38, 38, 38, 38, 38, '2024-12-02', '2024-12-12', '2024-12-13', 400000, 60000, 0.10, 360000, 360000),
(39, 39, 39, 39, 39, '2024-12-07', '2024-12-17', '2024-12-18', 300000, 50000, 0.05, 285000, 285000),
(40, 40, 40, 40, 40, '2024-12-12', '2024-12-22', '2024-12-23', 450000, 70000, 0.15, 382500, 382500),
(41, 41, 41, 41, 41, '2024-12-17', '2024-12-27', '2024-12-28', 500000, 75000, 0.06, 470000, 470000),
(42, 42, 42, 42, 42, '2024-12-22', '2025-01-01', '2025-01-02', 400000, 60000, 0.12, 352000, 352000),
(43, 43, 43, 43, 43, '2025-01-06', '2025-01-16', '2025-01-17', 500000, 75000, 0.09, 427500, 427500),
(44, 44, 44, 44, 44, '2025-01-11', '2025-01-21', '2025-01-22', 400000, 60000, 0.08, 304000, 304000),
(45, 45, 45, 45, 45, '2025-01-16', '2025-01-26', '2025-01-27', 300000, 50000, 0.07, 210000, 210000),
(46, 46, 46, 46, 46, '2025-01-21', '2025-01-31', '2025-02-01', 450000, 70000, 0.11, 385000, 385000),
(47, 47, 47, 47, 47, '2025-01-26', '2025-02-05', '2025-02-06', 500000, 75000, 0.10, 425000, 425000),
(48, 48, 48, 48, 48, '2025-01-31', '2025-02-10', '2025-02-11', 400000, 60000, 0.09, 324000, 324000),
(49, 49, 49, 49, 49, '2025-02-05', '2025-02-15', '2025-02-16', 300000, 50000, 0.06, 180000, 180000),
(50, 50, 50, 50, 50, '2025-02-10', '2025-02-20', '2025-02-21', 450000, 70000, 0.13, 409500, 409500),
(51, 51, 51, 51, 51, '2025-02-15', '2025-02-25', '2025-02-26', 500000, 75000, 0.12, 450000, 450000),
(52, 52, 52, 52, 52, '2025-02-20', '2025-03-02', '2025-03-03', 400000, 60000, 0.05, 190000, 190000),
(53, 53, 53, 53, 53, '2025-02-25', '2025-03-07', '2025-03-08', 300000, 50000, 0.08, 216000, 216000),
(54, 54, 54, 54, 54, '2025-03-02', '2025-03-12', '2025-03-13', 450000, 70000, 0.09, 364500, 364500),
(55, 55, 55, 55, 55, '2025-03-07', '2025-03-17', '2025-03-18', 500000, 75000, 0.14, 525000, 525000),
(56, 56, 56, 56, 56, '2025-03-12', '2025-03-22', '2025-03-23', 400000, 60000, 0.15, 360000, 360000),
(57, 57, 57, 57, 57, '2025-03-17', '2025-03-27', '2025-03-28', 300000, 50000, 0.10, 270000, 270000),
(58, 58, 58, 58, 58, '2025-03-22', '2025-04-01', '2025-04-02', 450000, 70000, 0.07, 315000, 315000),
(59, 59, 59, 59, 59, '2025-03-27', '2025-04-06', '2025-04-07', 500000, 75000, 0.06, 285000, 285000),
(60, 60, 60, 60, 60, '2025-04-01', '2025-04-11', '2025-04-12', 400000, 60000, 0.11, 352000, 352000),
(61, 61, 61, 61, 61, '2025-03-12', '2025-03-22', '2025-03-23', 720000, 90000, 0.15, 621000, 621000),
(62, 62, 62, 62, 62, '2025-03-18', '2025-03-28', '2025-03-29', 680000, 95000, 0.12, 566400, 566400),
(63, 63, 63, 63, 63, '2025-03-22', '2025-04-01', '2025-04-02', 750000, 100000, 0.12, 630000, 630000),
(64, 64, 64, 64, 64, '2025-04-02', '2025-04-12', '2025-04-13', 820000, 105000, 0.10, 714000, 714000),
(65, 65, 65, 65, 65, '2025-04-09', '2025-04-19', '2025-04-20', 680000, 90000, 0.10, 590000, 590000),
(66, 66, 66, 66, 66, '2025-04-15', '2025-04-25', '2025-04-26', 690000, 92000, 0.12, 580800, 580800),
(67, 67, 67, 67, 67, '2025-04-20', '2025-04-30', '2025-05-01', 710000, 94000, 0.10, 616000, 616000),
(68, 68, 68, 68, 68, '2025-04-25', '2025-05-05', '2025-05-06', 780000, 100000, 0.15, 663000, 663000),
(69, 69, 69, 69, 69, '2025-05-01', '2025-05-11', '2025-05-12', 690000, 95000, 0.10, 594000, 594000),
(70, 70, 70, 70, 70, '2025-05-06', '2025-05-16', '2025-05-17', 720000, 98000, 0.12, 614400, 614400),
(71, 71, 71, 71, 71, '2025-05-11', '2025-05-21', '2025-05-22', 770000, 105000, 0.12, 646800, 646800),
(72, 72, 72, 72, 72, '2025-05-16', '2025-05-26', '2025-05-27', 830000, 110000, 0.10, 719000, 719000),
(73, 73, 73, 73, 73, '2025-05-22', '2025-06-01', '2025-06-02', 790000, 100000, 0.12, 658800, 658800),
(74, 74, 74, 74, 74, '2025-05-27', '2025-06-06', '2025-06-07', 720000, 95000, 0.10, 621000, 621000),
(75, 75, 75, 75, 75, '2025-06-01', '2025-06-11', '2025-06-12', 750000, 98000, 0.15, 640500, 640500),
(76, 76, 76, 76, 76, '2025-06-06', '2025-06-16', '2025-06-17', 700000, 92000, 0.10, 606000, 606000),
(77, 77, 77, 77, 77, '2025-06-11', '2025-06-21', '2025-06-22', 780000, 105000, 0.12, 655200, 655200),
(78, 78, 78, 78, 78, '2025-06-16', '2025-06-26', '2025-06-27', 840000, 110000, 0.10, 726000, 726000),
(79, 79, 79, 79, 79, '2025-06-22', '2025-07-02', '2025-07-03', 800000, 105000, 0.12, 672000, 672000),
(80, 80, 80, 80, 80, '2025-06-27', '2025-07-07', '2025-07-08', 730000, 97000, 0.10, 630000, 630000),
(81, 81, 81, 81, 81, '2025-07-02', '2025-07-12', '2025-07-13', 760000, 100000, 0.15, 646000, 646000),
(82, 82, 82, 82, 82, '2025-07-07', '2025-07-17', '2025-07-18', 710000, 94000, 0.12, 593200, 593200),
(83, 83, 83, 83, 83, '2025-07-12', '2025-07-22', '2025-07-23', 790000, 105000, 0.12, 661200, 661200),
(84, 84, 84, 84, 84, '2025-07-17', '2025-07-27', '2025-07-28', 850000, 110000, 0.10, 737000, 737000),
(85, 85, 85, 85, 85, '2025-07-23', '2025-08-02', '2025-08-03', 810000, 100000, 0.12, 679200, 679200),
(86, 86, 86, 86, 86, '2025-07-28', '2025-08-07', '2025-08-08', 740000, 96000, 0.10, 636000, 636000),
(87, 87, 87, 87, 87, '2025-08-02', '2025-08-12', '2025-08-13', 770000, 98000, 0.15, 655500, 655500),
(88, 88, 88, 88, 88, '2025-08-07', '2025-08-17', '2025-08-18', 720000, 94000, 0.12, 602400, 602400),
(89, 89, 89, 89, 89, '2025-08-12', '2025-08-22', '2025-08-23', 800000, 106000, 0.12, 672000, 672000),
(90, 90, 90, 90, 90, '2025-08-18', '2025-08-28', '2025-08-29', 860000, 112000, 0.10, 744000, 744000),
(91, 91, 91, 91, 91, '2025-08-23', '2025-09-02', '2025-09-03', 820000, 104000, 0.12, 686400, 686400),
(92, 92, 92, 92, 92, '2025-08-28', '2025-09-07', '2025-09-08', 750000, 96000, 0.10, 645000, 645000),
(93, 93, 93, 93, 93, '2025-09-02', '2025-09-12', '2025-09-13', 780000, 98000, 0.15, 663000, 663000),
(94, 94, 94, 94, 94, '2025-09-07', '2025-09-17', '2025-09-18', 730000, 96000, 0.12, 613600, 613600),
(95, 95, 95, 95, 95, '2025-09-12', '2025-09-22', '2025-09-23', 800000, 105000, 0.12, 672000, 672000),
(96, 96, 96, 96, 96, '2025-09-17', '2025-09-27', '2025-09-28', 860000, 110000, 0.10, 744000, 744000),
(97, 97, 97, 97, 97, '2025-09-22', '2025-10-02', '2025-10-03', 820000, 105000, 0.12, 686400, 686400),
(98, 98, 98, 98, 98, '2025-09-27', '2025-10-07', '2025-10-08', 750000, 97000, 0.10, 645000, 645000),
(99, 99, 99, 99, 99, '2025-10-02', '2025-10-12', '2025-10-13', 780000, 99000, 0.15, 663000, 663000),
(100, 100, 100, 100, 100, '2025-10-08', '2025-10-18', '2025-10-19', 710000, 94000, 0.12, 593200, 593200);





-- ### FUNCIONES ### --

## registrar un cliente
delimiter //
create procedure registrar_cliente(cliente_id int, cliente_nombre1 varchar(25), cliente_nombre2 varchar(25), cliente_apellido1 varchar(25), cliente_apellido2 varchar(25), cliente_email varchar(50), cliente_cedula varchar(25), cliente_celular varchar(25), cliente_ciudad_residencia varchar(25), cliente_direccion varchar(25))
begin
	insert into cliente(id, nombre1, nombre2, apellido1, apellido2, email, cedula, celular, ciudad_residencia, direccion)
    values (cliente_id, cliente_nombre1, cliente_nombre2, cliente_apellido1, cliente_apellido2, cliente_email, cliente_cedula, cliente_celular, cliente_ciudad_residencia, cliente_direccion);
end//

delimiter ;
CALL registrar_cliente('101', 'Alberto', 'Nicol', 'instantaneo', 'Apesta', 'AlbertEinstein@gmail.com', '1234567890', '123-123-123', 'Bucaramanga', 'Rincon de Giron 100#123-123');

## actualizar un cliente dado su id
delimiter //
create procedure actualizar_cliente(id_cliente int, n_id_cliente int, n_cliente_nombre1 varchar(25), n_cliente_nombre2 varchar(25), n_cliente_apellido1 varchar(25), n_cliente_apellido2 varchar(25), n_cliente_email varchar(50), n_cliente_cedula varchar(25), n_cliente_celular varchar(25), n_cliente_ciudad_residencia varchar(25), n_cliente_direccion varchar(25))
begin
	update cliente set id = n_id_cliente, nombre1 = n_cliente_nombre1, nombre2 = n_cliente_nombre2, apellido1 = n_cliente_apellido1, apellido2 = n_cliente_apellido2, email = n_cliente_email, cedula = n_cliente_cedula, celular = n_cliente_celular, ciudad_residencia = n_cliente_ciudad_residencia, direccion = n_cliente_direccion
    where id = id_cliente;
end//
delimiter ;
call actualizar_cliente(12345, 102, 'Juancho','Felipe','Casillas','Vida','JuanchoVida@gmail.com','6333333-3', '633-33-33', 'Piedecuesta', 'barrio 232#232-232');

## registrar empleados
delimiter //
create procedure registrar_empleado(empleado_id int, empleado_nombre1 varchar(25), empleado_nombre2 varchar(25), empleado_apellido1 varchar(25), empleado_apellido2 varchar(25), empleado_email varchar(25), empleado_cedula varchar(25), empleado_celular varchar(25), empleado_ciudad_residencia varchar(25), empleado_direccion varchar(25), empleado_sucursal int)
begin
	declare n_sucursales int;
    select count(*) into n_sucursales from sucursales where sucursales.id = empleado_sucursal;
    if n_sucursales > 0 then
		insert into empleado(id, nombre1, nombre2, apellido1, apellido2, email, cedula, celular, ciudad_residencia, direccion, id_sucursal) values(empleado_id, empleado_nombre1, empleado_nombre2, empleado_apellido1, empleado_apellido2, empleado_email, empleado_cedula, empleado_celular, empleado_ciudad_residencia, empleado_direccion, empleado_sucursal);
	else
		select 'error: la sucursal no existe bro...' as mensaje;
	end if;
end//
delimiter ;
call registrar_empleado(102, 'Cristiano', 'nose', 'Ronaldo', 'nose', 'elBichoSiuu@gmail.com', '7777777777', '123432177', 'niidea', 'sisas', 100);

## Actualizar empleados ya existentes
delimiter //
create procedure actualizar_empleado(empleado_id int, n_empleado_id int, empleado_nombre1 varchar(25), empleado_nombre2 varchar(25), empleado_apellido1 varchar(25), empleado_apellido2 varchar(25), empleado_email varchar(25), empleado_cedula varchar(25), empleado_celular varchar(25), empleado_ciudad_residencia varchar(25), empleado_direccion varchar(25), empleado_sucursal int)
begin
	update empleado set id = n_empleado_id, nombre1 = empleado_nombre1, nombre2 = empleado_nombre2, apellido1 = empleado_apellido1, apellido2 = empleado_apellido2, email = empleado_email, cedula = empleado_cedula, celular = empleado_celular, ciudad_residencia = empleado_ciudad_residencia, direccion = empleado_direccion, id_sucursal = empleado_sucursal
    where id = empleado_id;
end//
delimiter ;
call actualizar_empleado(103, 102, 'Cristiano', null,'Ronaldo', 'siuu', 'elBichoSiuu@gmail.com', '7777777777', '123432177', 'niidea', 'sisas', 99);

## registrar vehiculos
delimiter //
create procedure registrar_vehiculo(vehiculo_id int, vehiculo_color varchar(25), vehiculo_motor varchar(25), vehiculo_sunroof varchar(25), vehiculo_capacidad varchar(25), vehiculo_puertas int, vehiculo_modelo varchar(25), vehiculo_referencia varchar(25), vehiculo_placa varchar(25), vehiculo_tipo_vehiculo varchar(25))
begin
    declare tipo_vehiculo_e int;
    select count(*) into tipo_vehiculo_e from vehiculo where tipo_vehiculo = vehiculo_tipo_vehiculo;
    if tipo_vehiculo_e > 0 then
        insert into vehiculo(id, color, motor, sunroof, capacidad, puertas, modelo, referencia, placa, tipo_vehiculo)
        values(vehiculo_id, vehiculo_color, vehiculo_motor, vehiculo_sunroof, vehiculo_capacidad, vehiculo_puertas, vehiculo_modelo, vehiculo_referencia, vehiculo_placa, vehiculo_tipo_vehiculo);
        select 'Vehículo registrado exitosamente.' as mensaje;
    else
        select 'Error: El tipo de vehículo especificado no es válido.' as mensaje;
    end if;
end//
delimiter ;
call registrar_vehiculo(101, 'Rojo', 'Gasolina', 'No', '5 personas', 4, 'Sedán', '2023', 'ABC123', 'Automóvil');

## Actualizar vehiculos
delimiter //
create procedure actualizar_vehiculo( vehiculo_id int, nuevo_vehiculo_id int, vehiculo_color varchar(25), vehiculo_motor varchar(25), vehiculo_sunroof varchar(25), vehiculo_capacidad varchar(25), vehiculo_puertas int, vehiculo_modelo varchar(25), vehiculo_referencia varchar(25), vehiculo_placa varchar(25), vehiculo_tipo_vehiculo varchar(25))
begin
    update vehiculo set id = nuevo_vehiculo_id, color = vehiculo_color, motor = vehiculo_motor, sunroof = vehiculo_sunroof, capacidad = vehiculo_capacidad, puertas = vehiculo_puertas, modelo = vehiculo_modelo, referencia = vehiculo_referencia, placa = vehiculo_placa, tipo_vehiculo = vehiculo_tipo_vehiculo
    where id = vehiculo_id;
    select 'Vehículo actualizado correctamente.' as mensaje;
end//
delimiter ;
call actualizar_vehiculo(101, 102, 'Rojo', 'Gasolina', 'No', '5 personas', 4, 'Sedán', '2023', 'ABC123', 'Automóvil');

## insertar sucursales
delimiter //
create procedure insertar_sucursal(sucursal_id int, sucursal_email varchar(25), sucursal_celular varchar(25), sucursal_telefono varchar(25), sucursal_ciudad varchar(25), sucursal_direccion varchar(25))
begin
    insert into sucursales(id, email, celular, telefono, ciudad, direccion) values(sucursal_id, sucursal_email, sucursal_celular, sucursal_telefono, sucursal_ciudad, sucursal_direccion);
end//
delimiter ;

## actualizar sucursales
delimiter //
create procedure actualizar_sucursal( sucursal_id int, n_sucursal_id int, sucursal_email varchar(25), sucursal_celular varchar(25), sucursal_telefono varchar(25), sucursal_ciudad varchar(25), sucursal_direccion varchar(25))
begin
    update sucursales set id = n_sucursal_id, email = sucursal_email, celular = sucursal_celular, telefono = sucursal_telefono, ciudad = sucursal_ciudad, direccion = sucursal_direccion
    where id = sucursal_id;
end//
delimiter ;

## 	Procedimiento para consultar disponibilidad de vehículos para alquiler por tipo de vehiculo, rango de precios y fechas de disponibilidad
delimiter //
create procedure consultar_vehiculos(con_tipo_vehiculo varchar(25), con_fecha_inicio date, con_fecha_fin date, con_precio_min_dia int, con_precio_max_dia int, con_precio_min_semana int, con_precio_max_semana int)
begin
	select vehiculo.id as VehiculoID, vehiculo.color, vehiculo.motor, vehiculo.sunroof, vehiculo.capacidad, vehiculo.puertas, vehiculo.modelo, vehiculo.referencia, vehiculo.placa, vehiculo.tipo_vehiculo, alquileres.valor_alquiler_semana, alquileres.valor_alquiler_dia
    from vehiculo
    left join alquileres on vehiculo.id = alquileres.id_vehiculo
    where vehiculo.tipo_vehiculo = con_tipo_vehiculo and (alquileres.id is null or (alquileres.fecha_salida > con_fecha_fin or alquileres.fecha_llegada < con_fecha_inicio)) and ((ifnull(alquileres.valor_alquiler_dia, 0) between con_precio_min_dia and con_precio_max_dia) or (ifnull(alquileres.valor_alquiler_semana, 0) between con_precio_min_semana and con_precio_max_semana))
    order by vehiculo.id;
end//
delimiter ;
call consultar_vehiculos('Automóvil', '2024-10-01', '2024-10-10', 0, 0, 500000, 550000);

## Hacer alquiler de vehiculos
delimiter //
create procedure registrar_alquiler(alquiler_id int, fecha_salida date, fecha_llegada date, fecha_esperada_llegada date, valor_alquiler_semana int, valor_alquiler_dia int, porcentaje_descuento decimal(5,2), valor_cotizado int, valor_pagado int, vehiculo_id int, empleado_id int, cliente_id int, sucursal_salida_id int, sucursal_llegada_id int)
begin
    declare existencia_vehiculo int;
    declare existencia_empleado int;
    declare existencia_cliente int;
    declare existencia_sucursal_salida int;
    declare existencia_sucursal_llegada int;
	select count(*) into existencia_vehiculo from vehiculo where id = vehiculo_id;
    select count(*) into existencia_empleado from empleado where id = empleado_id;
    select count(*) into existencia_cliente from cliente where id = cliente_id;
    select count(*) into existencia_sucursal_salida from sucursales where id = sucursal_salida_id;
    select count(*) into existencia_sucursal_llegada from sucursales where id = sucursal_llegada_id;
    if existencia_vehiculo > 0 and existencia_empleado > 0 and existencia_cliente > 0 and existencia_sucursal_salida > 0 and existencia_sucursal_llegada > 0 then
        insert into alquileres(id, fecha_salida, fecha_llegada, fecha_esperada_llegada, valor_alquiler_semana, valor_alquiler_dia, porcentaje_descuento, valor_cotizado, valor_pagado, id_vehiculo, id_empleado, id_cliente, id_sucursal_salida, id_sucursal_llegada)
        values(alquiler_id, fecha_salida, fecha_llegada, fecha_esperada_llegada, valor_alquiler_semana, valor_alquiler_dia, porcentaje_descuento, valor_cotizado, valor_pagado, vehiculo_id, empleado_id, cliente_id, sucursal_salida_id, sucursal_llegada_id);
    else
        select 'Error: Verifique la existencia de los elementos requeridos (vehículo, empleado, cliente, sucursal de salida y llegada).' as mensaje;
    end if;
end//
delimiter ;

## Historial de alquileres por cliente
delimiter //
create function historial_alquileres(cliente_id INT) 
returns text deterministic
begin
    declare resultado TEXT;
	select
        group_concat(
            concat('alquiler id: ', alq.id,
                   ', fecha salida: ', alq.fecha_salida,
                   ', fecha llegada: ', alq.fecha_llegada,
                   ', vehículo: ', veh.placa,
                   ', empleado: ', emp.nombre1,
                   ', valor cotizado: ', alq.valor_cotizado
            ) separator '\n') into resultado
    from alquileres alq
    join vehiculo veh on alq.id_vehiculo = veh.id
    join empleado emp on alq.id_empleado = emp.id
    where alq.id_cliente = cliente_id;
    if resultado is null then
        set resultado = 'no se encontraron alquileres para este cliente.';
    end if;
    return resultado;
end //
delimiter ;

select historial_alquileres(1) as Historial;





-- ### PERMISOS ### --

-- Creación de usuario empleado 
create user 'empleado'@'%' identified by 'empleado_publico';
create user 'cliente'@'%' identified by 'cliente_publico';

-- Asignar permisos a empleados para que accedan a la tabla sucursales, vehiculos, empleados y base de datos
grant select on mysql2_dia4.sucursales to 'empleado'@'%';
grant select on mysql2_dia4.vehiculos to 'empleado'@'%';
grant select on mysql2_dia4.empleados to 'empleado'@'%';

-- Añadir permisos para hacer CRUD
grant update, insert, delete on mysql2_dia4.sucursales to 'empleado'@'%';
grant update, insert, delete on mysql2_dia4.vehiculos to 'empleado'@'%';
grant update, insert, delete on mysql2_dia4.empleados to 'empleado'@'%';

-- Revisar permisos de x usuario
show grants for 'empleado'@'%';
show grants for 'cliente'@'%';