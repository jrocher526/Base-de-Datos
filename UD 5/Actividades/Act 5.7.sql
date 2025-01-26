-- Actividad 5.7 
-- Restricciones PRIMARY KEY y NOT NULL

-- Usamos la base de datos testeo 
USE test;

-- Creamos la tabla Pacientes
DROP TABLE IF EXISTS pacientes;
CREATE TABLE IF NOT EXISTS pacientes(
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre  VARCHAR(20) NOT NULL,
apellidos VARCHAR (50) NOT NULL,
nss CHAR(12) UNIQUE NOT NULL,
email VARCHAR(40) UNIQUE,
telefono CHAR(13) UNIQUE,
poblacion VARCHAR(20) NOT NULL,
expediente TEXT NOT NULL,
dni CHAR(9) UNIQUE NOT NULL,
historial_clinico TEXT NOT NULL, 
fecha_nac DATE NOT NULL,
edad TINYINT UNSIGNED NOT NULL 
);