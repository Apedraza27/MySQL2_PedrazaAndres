-- ##############################
-- ###### DIA 7 - MySQL 2  ######
-- ##############################

-- Crear base de datos
create database `mysql2_dia7`;

-- Utilizar BBDD dia2
use `mysql2_dia7`;


-- ### SISTEMAS GESTORES DE BASE DE DATOS II – INDICES EN MYSQL ### --

-- Comprensión de los índices
CREATE TABLE `customer` (
`id` int DEFAULT NULL,
`first_name` varchar (30) DEFAULT NULL,
`surname` varchar (40) DEFAULT NULL
);
INSERT INTO `customer`
VALUES (1, 'Yvonne', 'Clegg'),
(2, 'Johnny', 'Chaka-Chaka'),
(3, 'Winston', 'Powers'),
(4, 'Patricia', 'Mankuku'),
(5, 'Francois', 'Papo'),
(6, 'Winnie', 'Dlamini'),
(7, 'Neil', 'Beneke');

select * from customer order by surname;

-- Creación de una clave primaria para la tabla customer
ALTER TABLE customer ADD PRIMARY KEY(id);
DESCRIBE customer;



-- Creación de un índice primario
CREATE TABLE usuario (id INT NOT NULL,
apellidos CHAR(30) NOT NULL,
nombre CHAR(30) NOT NULL,
PRIMARY KEY (id),
INDEX indice01 (apellidos, nombre));

DESCRIBE usuario;
SHOW KEYS FROM usuario;


-- Creación de un índice de texto completo
CREATE TABLE articles (
id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
title VARCHAR(200),
body TEXT,
FULLTEXT (title, body)
);

DESCRIBE articles;
SHOW INDEX FROM articles;



-- Creación de un índice único
CREATE TABLE ui_test(f1 INT, f2 INT, UNIQUE(f1));

INSERT INTO ui_test VALUES(1,2);



-- Creación de índices sobre una parte de un campo
ALTER TABLE customer ADD INDEX (surname(10));





-- ### Ejercicios Resueltos ### --
-- 1- En este ejercicio se debe crear un índice para los campos nombre y apellido1 de
-- la base de datos jardinería. Se requiere escribir una consulta que permita
-- obtener toda la información de los empleados cuyo nombre inicie con la letra L
-- y cuyo apellido sea Paxton. Se sabe que en la tabla no se han creado índices por
-- lo que se requiere crearlos:

CREATE INDEX nombre_apellido ON empleado (nombre, apellido1);
SELECT * FROM empleado WHERE apellido1 = 'Paxton' AND nombre LIKE 'L%';



-- 2- Se pide crear una consulta que muestre el código del empleado, nombre, primer
-- apellido, email y puesto de todos los empleados cuyo nombre inicie con la letra
-- M o que tengan cargo de Director de oficina. Se debe usar índices de tipo Fulltext.

CREATE FULLTEXT INDEX index_nombre_puesto ON empleado (nombre, puesto);
SELECT codigo_empleado, nombre, apellido1, email, puesto FROM empleado WHERE (nombre like 'M%' OR puesto='Director de oficina');


-- 3- Cree los índices necesarios en la tabla producto de la base de datos jardinería,
-- y escriba una consulta que permita obtener el código, nombre y proveedor y la
-- descripción de los productos cuya descripción inicie con la palabra
-- <Limpitatubos=, para ello se requiere que primero se creen los índices necesarios
-- para la tabla producto.

CREATE INDEX descripcion_producto ON producto (descripcion(11));
SELECT codigo_producto, nombre, proveedor, descripción FROM producto WHERE descripción LIKE 'Limpitatubos%';
SELECT codigo_producto, nombre, proveedor, descripcion FROM producto WHERE descripcion LIKE 'Limpitatubos%';





-- ### Ejercicios Propuestos ### --
/* Se utilizará la base de datos jardinería que se proporciona con la guía para los
siguientes ejercicios, y se debe utilizar índices para los mismos: */ 

use dia3;

-- 1- Escribe una consulta que permita agrupar los clientes de todos los empleados
-- cuyo puesto sea responsable de ventas. Se requiere que la consulta muestre:
-- Nombre del cliente, teléfono, la ciudad, nombre y primer apellido del responsable de ventas y su email.

SELECT 
    cliente.nombre,
    cliente.telefono,
    cliente.ciudad,
    empleado.nombre,
    empleado.apellido1,
    empleado.email
FROM 
    cliente
JOIN 
    empleado ON cliente.id_empleado = empleado.id_empleado
WHERE 
    empleado.puesto = 'Representante Ventas';

-- 2- Se necesita obtener los registros de los pedidos entre el 15 de marzo del 2009 y
-- el 15 de julio del 2009, para todos los clientes que sean de la ciudad de
-- Sotogrande. Se requiere mostrar el código del pedido, la fecha del pedido, fecha
-- de entrega, estado, los comentarios y el código del cliente que realizo dicho pedido.

SELECT 
    pedido.codigo_pedido,
    pedido.fecha_pedido,
    pedido.fecha_entrega,
    pedido.estado,
    pedido.comentarios,
    pedido.codigo_cliente 
FROM 
    pedido
JOIN 
    cliente ON pedido.codigo_cliente = cliente.codigo_cliente
WHERE 
    cliente.ciudad = 'Sotogrande' 
    AND pedido.fecha_pedido BETWEEN '2009-03-15' AND '2009-07-15';

-- 3- Se desea obtener los productos cuya gama pertenezca a las frutas y que el
-- proveedor sea Frutas Talaveras S.A, se desea mostrar el código, nombre,
-- descripción, cantidad en stock, y su precio con 10% de descuento, de igual forma
-- se pide la cantidad en los distintos pedidos que se han hecho.

SELECT 
    producto.codigo_producto,
    producto.nombre,
    producto.descripcion,
    producto.cantidad_en_stock,
    producto.precio_venta * 0.10,
    SUM(detalle_pedido.cantidad)
FROM 
    producto
JOIN 
    proveedor ON producto.proveedor = proveedor
JOIN 
    detalle_pedido ON producto.codigo_producto = detalle_pedido.codigo_producto
WHERE 
    producto.gama = 'Frutales' 
    AND proveedor.nombre = 'Frutales Talavera S.A'
GROUP BY 
    producto.codigo_producto, 
    producto.nombre, 
    producto.descripcion, 
    producto.cantidad_en_stock, 
    producto.precio_venta;
