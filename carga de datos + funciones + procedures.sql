
-- Creación de la base de datos "mixdulce" si no existe
CREATE DATABASE IF NOT EXISTS mix_dulce;
-- Utilización de la base de datos "mixdulce" 
USE mix_dulce;

-- Creación de la tabla "producto" para almacenar información sobre los productos
CREATE TABLE IF NOT EXISTS producto (
    id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(30) NOT NULL,
    descripcion VARCHAR(50),
    precio FLOAT NOT NULL
);

-- Creación de la tabla "cliente" para almacenar información sobre los clientes
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_cliente VARCHAR(20) NOT NULL
);
    
-- Creación de la tabla "pedido" para almacenar información sobre los pedidos
CREATE TABLE IF NOT EXISTS pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    precio FLOAT NOT NULL
);
    
-- Creación de la tabla "proveedor" para almacenar información sobre los proveedores
CREATE TABLE IF NOT EXISTS proveedor (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_proveedor VARCHAR(20) NOT NULL
);
    
-- Creación de la tabla "ingrediente" para almacenar información sobre los ingredientes
CREATE TABLE IF NOT EXISTS ingrediente (
    id_ingrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre_ingrediente VARCHAR(20) NOT NULL,
    stock INT NOT NULL
);

-- Creación de la tabla "provee" para establecer la relación entre proveedores e ingredientes
CREATE TABLE IF NOT EXISTS provee (
    id_proveedor INT NOT NULL,
    id_ingrediente INT NOT NULL,
    CONSTRAINT FK_PROVEE_PROVEEDOR FOREIGN KEY (id_proveedor)
        REFERENCES proveedor (id_proveedor),
    CONSTRAINT FK_PROVEE_INGREDIENTE FOREIGN KEY (id_ingrediente)
        REFERENCES ingrediente (id_ingrediente)
);

-- Creación de la tabla "tiene" para establecer la relación entre productos e ingredientes
CREATE TABLE IF NOT EXISTS tiene (
    id_producto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    cantidad INT NOT NULL,
    CONSTRAINT FK_TIENE_PRODUCTO FOREIGN KEY (id_producto)
        REFERENCES producto (id_producto),
    CONSTRAINT FK_TIENE_INGREDIENTE FOREIGN KEY (id_ingrediente)
        REFERENCES ingrediente (id_ingrediente)
);
    
-- Creación de la tabla "de" para establecer la relación entre productos y pedidos
CREATE TABLE IF NOT EXISTS de (
    id_producto INT NOT NULL,
    id_pedido INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1, 
    CONSTRAINT FK_DE_PRODUCTO FOREIGN KEY (id_producto)
        REFERENCES producto (id_producto),
    CONSTRAINT FK_DE_PEDIDO FOREIGN KEY (id_pedido)
        REFERENCES pedido (id_pedido)
);

-- Creación de la tabla "compra" para establecer la relación entre clientes y pedidos
CREATE TABLE IF NOT EXISTS compra (
    id_cliente INT NOT NULL,
    id_pedido INT NOT NULL,
    CONSTRAINT FK_COMPRA_CLIENTE FOREIGN KEY (id_cliente)
        REFERENCES cliente (id_cliente),
    CONSTRAINT FK_COMPRA_PEDIDO FOREIGN KEY (id_pedido)
        REFERENCES pedido (id_pedido)
);


-- Carga de datos en tablas

-- Carga de clientes
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Juan Martinez");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Laura Martinez");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Alfonsina Meyer");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Juan Ignacio Rey");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Nicolas Castiglioni");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Lucia Gonzalez");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Santiago Dossena");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Leonardo Meyer");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Jorge Alfonso");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Mathias Kaiser");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Guillermo Meyer");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Carol Arguimbao");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Agustin Benitez");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Agustin Insua");
INSERT INTO CLIENTES(nombre_cliente) VALUES ("Martin Gutierrez");

-- Carga de pedidos
INSERT INTO PEDIDO(precio) VALUES (170);
INSERT INTO PEDIDO(precio) VALUES (200);
INSERT INTO PEDIDO(precio) VALUES (120);
INSERT INTO PEDIDO(precio) VALUES (220);
INSERT INTO PEDIDO(precio) VALUES (350);
INSERT INTO PEDIDO(precio) VALUES (340);
INSERT INTO PEDIDO(precio) VALUES (400);
INSERT INTO PEDIDO(precio) VALUES (240);
INSERT INTO PEDIDO(precio) VALUES (500);
INSERT INTO PEDIDO(precio) VALUES (380);
INSERT INTO PEDIDO(precio) VALUES (330);
INSERT INTO PEDIDO(precio) VALUES (360);
INSERT INTO PEDIDO(precio) VALUES (130);
INSERT INTO PEDIDO(precio) VALUES (200);
INSERT INTO PEDIDO(precio) VALUES (100);

-- Carga de productos
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Barra de chocolate", "", 170);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Cheesecake", "Porcion de cheesecake", 200);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Pan de campo", "", 120);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Carrot cake", "Porcion de carrot cake", 220);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Huevo de chocolate", "", 350);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Budin de banana", "Porcion de budin de banana", 120);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Roll de canela", "", 130);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Brownie", "", 125);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Red Velvet", "Porcion de Red Velvet", 250);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Streusel de chocolate", "Porcion de Streusel de chocolate", 190);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Streusel de manzana", "Porcion de Streusel de manazana", 190);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Strudel de manzana", "", 330);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Alfajor de maicena", "", 100);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Alfajor", "", 90);
INSERT INTO PRODUCTO(nombre_producto, descripcion, precio) VALUES ("Scon de queso", "", 65);

-- Carga de ingredientes
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Harina", 10000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Cacao", 10000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Chocolate", 5000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Huevo", 24);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Manteca", 400);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Aceite", 2000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Queso crema", 1000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Zanahoria", 700);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Azucar", 2000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Polvo de hornear", 200);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Banana", 5);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Oreo", 180);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Frutilla", 1000);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Manzana", 2);
INSERT INTO INGREDIENTE(nombre_ingrediente, stock) VALUES ("Crema de leche", 1000);

-- Carga de proveedores
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Conaprole");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Azucarlito");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Granja Sol");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Kinko");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Farming");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Ecuador");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Nestle");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Las Acacias");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Granja Luna");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Fruteria");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Ta-Ta");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Disco");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Devoto");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Carrefour");
INSERT INTO PROVEEDOR(nombre_proveedor) VALUES ("Uruguay");

-- Carga de provee
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (1, 15);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (1, 5);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (5, 7);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (5, 15);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (3, 14);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (6, 11);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (15, 6);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (14, 12);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (13, 12);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (12, 12);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (11, 12);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (14, 1);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (9, 14);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (15, 6);
INSERT INTO PROVEE(id_proveedor, id_ingrediente) VALUES (8, 1);

-- Carga tiene
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (1, 2, 100);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (2, 4, 1);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (2, 7, 300);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (2, 9, 170);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (2, 12, 110);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (4, 4, 4);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (4, 9, 200);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (4, 6, 190);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (4, 8, 140);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (4, 1, 240);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (6, 11, 1);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (12, 1, 375);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (12, 4, 1);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (12, 5, 175);
INSERT INTO TIENE(id_producto, id_ingrediente, cantidad) VALUES (12, 14, 2);

-- Carga de
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (1,1,1);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (2,2,1);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (3,3,1);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (4,4,1);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (5,5,1);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (1,6,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (2,7,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (3,8,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (9,9,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (10,10,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (12,11,1);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (14,12,4);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (15,13,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (13,14,2);
INSERT INTO DE(id_producto, id_pedido, cantidad) VALUES (13,15,1);

-- Carga compra
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (1,1);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (1,2);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (2,3);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (7,4);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (8,5);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (9,6);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (3,7);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (8,8);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (15,9);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (7,10);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (11,11);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (1,12);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (4,13);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (5,14);
INSERT INTO COMPRA(id_cliente, id_pedido) VALUES (15,15);


-- Creacion de vistas

-- Vista que contiene pares de proveedores y los ingredientes que proveen (Compuesta de las tablas proveedor, provee e ingrediente)
CREATE OR REPLACE VIEW PROVEEDORES_INGREDIENTES(nombre_proveedor, nombre_ingrediente) AS
	(SELECT nombre_proveedor, nombre_ingrediente
    FROM PROVEEDOR p JOIN PROVEE pi 
    ON p.id_proveedor = pi.id_proveedor JOIN INGREDIENTE i 
	ON i.id_ingrediente = i.id_ingrediente
    ORDER BY nombre_proveedor);
    
-- Vista que contiene la cantidad de productos diferentes que compra una persona (Compuesta de las tablas persona, pedido, compra y de)
CREATE OR REPLACE VIEW PRODUCTOS_DIFERENTES(nombre_persona, cantidad) AS
	(select nombre_persona, COUNT(DISTINCT(id_producto))
    from persona p JOIN compra c
    ON (p.id_persona = c.id_persona) JOIN pedido pe
    ON (pe.id_pedido = c.id_pedido) JOIN de d 
    ON (d.id_pedido = pe.id_pedido)
    ORDER BY nombre_persona);
    
-- Vista que contiene la cantidad necesaria de ingredientes para un producto (Compuesta de las tablas producto, tiene e ingrediente)
CREATE OR REPLACE VIEW CANT_INGREDIENTES(nombre_producto, nombre_ingrediente, cantidad) AS
	(SELECT nombre_producto, nombre_ingrediente, cantidad
    FROM producto p JOIN tiene t 
    ON (t.id_producto = p.id_producto) JOIN ingrediente i 
    ON (i.id_ingrediente = t.id_ingrediente)
    GROUP BY nombre_producto);


-- Vista que tiene los productos que no usan harina (Compuesta de las tablas producto, tiene e ingrediente)
CREATE OR REPLACE VIEW SIN_HARINA(nombre_producto, nombre_ingrediente, cantidad) AS
	(SELECT nombre_producto, nombre_ingrediente, cantidad
    FROM producto p JOIN tiene t 
    ON (t.id_producto = p.id_producto) JOIN ingrediente i 
    ON (i.id_ingrediente = t.id_ingrediente)
    WHERE p.id_producto NOT IN (SELECT *
								FROM tiene t2
								where t2.id_ingrediente = 1)
    GROUP BY nombre_producto);

-- Vista que tiene los productos ordenados por mayor cantidad de ventas (Compuesta de las tablas producto y de)
CREATE OR REPLACE VIEW CANTIDAD_VENTAS(nombre_producto, cantidad) AS
	(select nombre_producto, count(id_pedido) AS cant
    from PRODUCTO p JOIN de d 
    ON (d.id_producto = p.id_producto)
    ORDER BY cant);

-- Creacion de funciones


-- Concatena nombre y apellido
DELIMITER //
CREATE FUNCTION ConcatenarNombre(nombre VARCHAR(30), apellido VARCHAR(30)) RETURNS VARCHAR(30)
NO SQL
BEGIN
    DECLARE res VARCHAR(30);
    SET res = concat(nombre, ' ', apellido);
    return res;
END //


-- Suma de los precios de todos los productos que integran un pedido
DELIMITER //
CREATE FUNCTION SumaPrecio( id INT) RETURNS FLOAT
READS SQL DATA
BEGIN
	DECLARE res FLOAT;
    SELECT sum(p.precio * d.cantidad) INTO res
    FROM de d JOIN producto p ON (d.id_producto = p.id_producto)
    WHERE id_pedido = id;
    RETURN res;
END //

-- Creacion de procedimentos

-- Ordena productos segun un campo
DELIMITER //
CREATE PROCEDURE ProductosOrdenados(IN campo CHAR(25))
BEGIN 
	if campo <> '' THEN
		SET @orden = concat('ORDER BY ', campo);
	ELSE
		SET @orden = '';
    END IF;
    SET @clausula = concat('SELECT nombre_producto, precio
							FROM producto ', @orden);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END //


-- Inserta un producto a la tabla
DELIMITER //
CREATE PROCEDURE InsertarProducto(IN nombre VARCHAR(30), IN descripcion VARCHAR(50), IN precio FLOAT)
BEGIN 
	SET @nombre = nombre;
    SET @descripcion = descripcion;
    SET @precio = precio;
    SET @clausula = concat('INSERT INTO PRODUCTO(nombre, descripcion, precio) VALUES(', @nombre , ',' , @descripcion, ',', precio , ')');
    
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END //
