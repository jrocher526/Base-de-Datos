-- Tema 5 - Lenguaje SQL :DDL
-- Ejemplos

-- Ejemplo 1
CREATE DATABASE IF NOT EXISTS ejemplo;

-- ejemplo 2 
CREATE DATABASE IF NOT EXISTS ges_alumnos;

-- Juego de caracteres 
SHOW CHARACTER SET;
  
-- Juego de colecciones o cotejamientos mysql
SHOW COLLATION;

-- Crear la base de datos banco multilingue con UTF8
CREATE DATABASE IF NOT EXISTS Banco
CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Crear base de datos ges_libros, multilingue CON UTF 8MB4
CREATE DATABASE IF NOT EXISTS ges_libros
CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Crear base de datos maraton juego de caracteres por defecto
CREATE DATABASE IF NOT EXISTS maraton;

-- Modifica la base de datos ges_lbros a multilingue con LATIN1
ALTER DATABASE ges_libros
CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Eliminar base de datos ges_libros
DROP DATABASE ges_libros;

-- Crear base de datos geslibros
DROP DATABASE IF EXISTs geslibros;
CREATE DATABASE IF NOT EXISTS geslibros;



  