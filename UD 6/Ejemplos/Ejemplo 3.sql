-- Ejemplos de Restrcciones

-- Crear base de datos
DROP DATABASE IF EXISTS ventas;
CREATE DATABASE IF NOT EXISTS ventas;

-- Activdamos la vase de datos
USE ventas;

-- Creamos la tabla articulos
DROP TABLE IF EXISTS articulos;
CREATE TABLE IF NOT EXISTS articulos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(20) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
imagen VARCHAR(255),
EAN CHAR(13)
);

-- Creamos la tabla articulos
-- Restriccion UNIQUE forma la tabla
DROP TABLE IF EXISTS articulos_2;
CREATE TABLE IF NOT EXISTS articulos_2(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(20) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
imagen VARCHAR(255),
EAN CHAR(13) NOT NULL,
UNIQUE (EAN)
);

-- Creamos la tabla articulos
-- Restriccion UNIQUE forma CONSTRAINT
DROP TABLE IF EXISTS articulos_3;
CREATE TABLE IF NOT EXISTS articulos_3(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(20) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
imagen VARCHAR(255),
EAN CHAR(13) NOT NULL,
CONSTRAINT UN_prodductos_EAN UNIQUE (EAN)
);

-- Creacion tabla clientes
DROP DATABASE IF EXISTS clientes;
CREATE DATABASE IF NOT EXISTS clientes(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
cif CHAR(9) UNIQUE NOT NULL,
poblacion VARCHAR(20)
);

-- Creacion de tabla pedidos
-- definicion foreing key
DROP DATABASE IF EXISTS pedidos;
CREATE DATABASE IF NOT EXISTS pedidos(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255),
cliente_id INT UNSIGNED,
FOREIGN KEY(cliente_id) REFERENCES clientes (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Creacion de tabla pedidos
-- definicion foreign key que voy a usar
DROP DATABASE IF EXISTS pedidos_2;
CREATE DATABASE IF NOT EXISTS pedidos_2(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion VARCHAR(255),
cliente_id INT UNSIGNED,
CONSTRAINT FK_pedidos_cliente_id -- Personaliza el nombre 
FOREIGN KEY(cliente_id) REFERENCES clientes (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Creacion tabla linea_pedidos
DROP DATABASE IF EXISTS linea_pedidos;
CREATE DATABASE IF NOT EXISTS linea_pedidos(
pedido_id INT UNSIGNED,
producto_id INT UNSIGNED
cantidad FLOAT,
precio DECIMAL(10,2),
PRIMARY KEY (pedido_id, producto_id)
-- Restricciones fo	reign key
FOREIGN KEY (pedido_id) REFERENCES pedidos (id)
ON DELETE RESTRICT ON UPDATE CASCADE,
FOREIGN KEY (producto_id) REFERENCES producto (id)
ON DELETE RESTRICT ON UPDATE CASCADE
);
