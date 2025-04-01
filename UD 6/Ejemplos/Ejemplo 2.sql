-- Ejemplo 2
-- Tema 5: Lenguaje SQL - DDL

-- Crear tabla clientes en base de datos banco

-- 01 Crear base de datos
DROP DATABASE IF EXISTS bancos;
CREATE DATABASE IF NOT EXISTS bancos;

-- Uso la base de datos
USE bancos;

-- Tipo tinyInt 1 byte 
-- Crear la tabla clientes 
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre varchar (20),
    edad TINYINT(2) UNSIGNED ZEROFILL
    ) ;

-- Insetar registros en clientes 
INSERT INTO clientes VALUES
(null, 'Juan', 4),
(null, 'Maria', 21); 