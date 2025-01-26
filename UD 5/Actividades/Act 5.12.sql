-- Actividad 5.12
-- Tema 5 Lenguaje SQL - DDL
-- Curso 24/25
-- Alumno Jhonal Roca

-- Creamos la base de datos taller
DROP DATABASE IF EXISTS taller;
CREATE DATABASE IF NOT EXISTS taller;

-- Activamos la base de datos
USE taller;

-- Creamos la tabla maquinas
DROP TABLE IF EXISTS maquinas;
CREATE TABLE IF NOT EXISTS maquinas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    fecha_compra DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Creamos la tabla partes_produccion
DROP TABLE IF EXISTS partes_produccion;
CREATE TABLE IF NOT EXISTS partes_produccion (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_parte INT UNSIGNED UNIQUE NOT NULL,
    fecha_emision DATE NOT NULL, 
    fecha_final DATE NOT NULL,
    coste_total DECIMAL(10,2)
);

-- Creamos la tabla articulos
DROP TABLE IF EXISTS articulos;
CREATE TABLE IF NOT EXISTS articulos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10,2),
    modelo VARCHAR(20),
    coste DECIMAL(10,2)
);

-- Creamos la tabla jefes
DROP TABLE IF EXISTS jefes;
CREATE TABLE IF NOT EXISTS jefes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL, 
    taller_id INT UNSIGNED
    -- Dejo establecer la restricción FOREIGN KEY
    -- Se hará una vez definida la tabla talleres
);

-- Creamos la tabla talleres
DROP TABLE IF EXISTS talleres;
CREATE TABLE IF NOT EXISTS talleres (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    funcion VARCHAR(30) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    jefe_id INT UNSIGNED,
    FOREIGN KEY (jefe_id) REFERENCES jefes (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- Modificamos la tabla jefes para poder asignar la restricción pendiente
ALTER TABLE jefes 
ADD CONSTRAINT fk_jefes_taller_id
FOREIGN KEY (taller_id) REFERENCES talleres (id)
ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Creamos la tabla utiliza_taller
DROP TABLE IF EXISTS utiliza_taller;
CREATE TABLE IF NOT EXISTS utiliza_taller (
    taller_id INT UNSIGNED NOT NULL,
    maquina_id INT UNSIGNED NOT NULL,
    inicio DATETIME NOT NULL,
    fin DATETIME,
    tiempo DECIMAL(10,2),
    -- Restricciones
    PRIMARY KEY (taller_id, maquina_id),
    FOREIGN KEY (taller_id) REFERENCES talleres (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (maquina_id) REFERENCES maquinas (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- Creamos la tabla partes_produccion_talleres
DROP TABLE IF EXISTS partes_produccion_talleres;
CREATE TABLE IF NOT EXISTS partes_produccion_talleres (
    taller_id INT UNSIGNED NOT NULL,
    parte_produccion_id INT UNSIGNED NOT NULL,
    -- Restricciones
    PRIMARY KEY (taller_id, parte_produccion_id),
    FOREIGN KEY (taller_id) REFERENCES talleres (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (parte_produccion_id) REFERENCES partes_produccion (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- Creamos la tabla fabrica
DROP TABLE IF EXISTS fabrica;
CREATE TABLE IF NOT EXISTS fabrica (
    parte_produccion_id INT UNSIGNED NOT NULL,
    articulo_id INT UNSIGNED NOT NULL,
    tiempo DECIMAL(10,2) NOT NULL,
    cantidad INT UNSIGNED NOT NULL,
    -- Restricciones
    PRIMARY KEY (parte_produccion_id, articulo_id),
    FOREIGN KEY (parte_produccion_id) REFERENCES partes_produccion (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT,
    FOREIGN KEY (articulo_id) REFERENCES articulos (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- Creamos la tabla empleados
DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    dni CHAR(9) UNIQUE NOT NULL,
    taller_id INT UNSIGNED NOT NULL,
    -- Restricciones
    FOREIGN KEY (taller_id) REFERENCES talleres (id)
    ON DELETE RESTRICT ON UPDATE RESTRICT
);
