-- Actividad 5.7

-- Creamos la base de datos Horarios
DROP DATABASE IF EXISTS horarios;
CREATE DATABASE IF NOT EXISTS horarios;

-- Activamos la Base de datos
USE horarios;

-- Creamos la tabla departamentos
DROP TABLE IF EXISTS departamentos;
CREATE TABLE IF NOT EXISTS departamentos (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,                    
    codigo_dept CHAR(3) NOT NULL,
    -- Establcecemos restricciones segun el criterio
    PRIMARY KEY (id),
    CONSTRAINT uq_cod_departamento UNIQUE (codigo_dept) -- Clave secundaria
);

-- Creamos la tabla profesor
DROP TABLE IF EXISTS profesor;
CREATE TABLE IF NOT EXISTS profesor (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,                      
    apellidos VARCHAR(30) NOT NULL,                 
    email VARCHAR(30),                              
    fecha_ingreso DATE NOT NULL,
    especialidad VARCHAR(100) NOT NULL,               
    nrp CHAR(8) NOT NULL,
    departamento_id INT UNSIGNED,
    -- Establcecemos restricciones segun el criterio
    PRIMARY KEY (id),
    CONSTRAINT uq_email UNIQUE (email),
    CONSTRAINT uq_nrp UNIQUE (nrp),
    CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Creamos la tabla asignatura
DROP TABLE IF EXISTS asignatura;
CREATE TABLE IF NOT EXISTS asignatura (
    id INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(20),                          
    nivel CHAR(4),                                
    codigo_asig CHAR(7) NOT NULL,                   
    horas TINYINT NOT NULL,                           
    departamento_id INT UNSIGNED,
	-- Establcecemos restricciones segun el criterio
    PRIMARY KEY (id),
    CONSTRAINT uq_cod_asignatura UNIQUE (codigo_asig), -- Clave secundaria
    CONSTRAINT fk_asignatura_departamento FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Creamos la tabla horario
DROP TABLE IF EXISTS horario;
CREATE TABLE IF NOT EXISTS horario (
    id INT UNSIGNED AUTO_INCREMENT,
    profesor_id INT UNSIGNED NOT NULL,
    dia TINYINT CHECK (dia BETWEEN 1 AND 5),          
    tramo TINYINT CHECK (tramo BETWEEN 1 AND 6),     
    turno ENUM('mañana', 'tarde'),                     
    asignatura_id INT UNSIGNED NOT NULL,
    horas TINYINT NOT NULL,                           
   -- Establcecemos restricciones segun el criterio
   PRIMARY KEY (id),
    CONSTRAINT fk_profesor FOREIGN KEY (profesor_id) REFERENCES profesor(id),
    CONSTRAINT fk_asignatura FOREIGN KEY (asignatura_id) REFERENCES asignatura(id)
);
