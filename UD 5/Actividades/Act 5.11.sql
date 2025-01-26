-- Actividad 5.10

-- Creamos la base de datos RestriccionesDefault con contejamiento UTF8_GENERAL_CI
DROP DATABASE IF EXISTS Restriccione_check;
CREATE DATABASE IF NOT EXISTS Restricciones_check
CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Activamos la base de datos
USE Restricciones_check;

-- Creamos la tabla comparacion
DROP TABLE IF EXISTS comparacion;
CREATE TABLE IF NOT EXISTS comparacion (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
importe INT UNSIGNED CHECK (importe>400),
saldo INT CHECK (saldo<0),
nombre VARCHAR(25) CHECK (nombre IS NULL),
apellido VARCHAR(30) CHECK (apellido IS NULL),
num_beneficiarios TINYINT UNSIGNED CHECK (num_beneficiarios>=5),
num_asignatura TINYINT CHECK (num_asignatura<=5),
beca VARCHAR(20) CHECK (beca IN ('concedida', 'no concesida')),
importe_beca TINYINT CHECK (importe_beca<2500),
num_goles TINYINT UNSIGNED CHECK (num_goles>20),
anno_nacimiento YEAR CHECK (anno_nacimiento>1970),
fecha_nacimiento DATE CHECK (fecha_nacimiento<2000/02/21),
hora_llegada TIME CHECK (hora_llegada>='12:00')
);

-- Creamos la tabla comparacionBetween
DROP TABLE IF EXISTS comparacionBetween;
CREATE TABLE IF NOT EXISTS comparacionBetween (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
ngoles INT,
sueldo DECIMAL(10, 2),
importe DECIMAL(10, 2),
cantidad INT,
valor DECIMAL(5, 2),
tipodescuento DECIMAL(5, 2),
precio DECIMAL(5, 2),
CONSTRAINT ngoles_valido CHECK (ngoles BETWEEN 20 AND 30),
CONSTRAINT sueldo_valido CHECK (sueldo BETWEEN 2000 AND 3000),
CONSTRAINT importe_valido CHECK (importe BETWEEN 400 AND 600),
CONSTRAINT cantidad_valida CHECK (cantidad BETWEEN 5 AND 20),
CONSTRAINT valor_invalido CHECK (valor NOT BETWEEN 4 AND 7),
CONSTRAINT tipodescuento_valido CHECK (tipodescuento BETWEEN 5.25 AND 20.50),
CONSTRAINT precio_valido CHECK (precio BETWEEN 20 AND 30)
);

CREATE TABLE chekin (
id INT PRIMARY KEY,
provincia VARCHAR(50),
poblacion VARCHAR(50),
cicloEstudio VARCHAR(50),
valores INT,
nacionalidad VARCHAR(50),
codEmpleado VARCHAR(10),
nrp VARCHAR(10),
dni VARCHAR(9),

-- Establecemos condiciones
CONSTRAINT provincia_valida CHECK (provincia IN ('Cádiz', 'Málaga', 'Sevilla')),
CONSTRAINT poblacion_valida CHECK (poblacion IN ('Ubrique', 'Villamartín', 'Prado del Rey', 'Olvera')),
CONSTRAINT cicloEstudio_valido CHECK (cicloEstudio IN ('ESO', 'BACH', 'MEDIO', 'SUPERIOR', 'ADULTOS')),
CONSTRAINT valores_validos CHECK (valores IN (1, 2, 5, 8, 9)),
CONSTRAINT nacionalidad_valida CHECK (nacionalidad IN ('España', 'Brasil', 'Portugal', 'Argentina', 'Italia')),
CONSTRAINT codEmpleado_valido CHECK (codEmpleado LIKE '_AB%'),
CONSTRAINT nrp_valido CHECK (RIGHT(nrp, 1) = 'Z'),
CONSTRAINT dni_valido CHECK (LEFT(dni, 2) = '25')
);

-- Añadimos la nueva tabla operadorlike
DROP TABLE IF EXISTS operadorlike;
CREATE TABLE IF NOT EXISTS operadorlike (
id INT PRIMARY KEY,
descripcion VARCHAR(255) NOT NULL CHECK (LEFT(descripcion, 1) = 'a'),
nombre VARCHAR(255) NOT NULL CHECK (LEFT(nombre, 2) = 'ju'),
email VARCHAR(255) NOT NULL CHECK (email LIKE '%@%'),
password VARCHAR(255) NOT NULL CHECK (CHAR_LENGTH(password) >= 7 AND SUBSTRING(password, 3, 1) = 'M'),
cpostal CHAR(5) NOT NULL CHECK (LEFT(cpostal, 2) = '11' AND CHAR_LENGTH(cpostal) = 5),
codigo CHAR(7) NOT NULL CHECK (LEFT(codigo, 2) = 'ES' AND RIGHT(codigo, 1) = '9')
);



