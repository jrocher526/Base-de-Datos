-- Actividad 5.2 
-- Tema 6 - BBDD
-- Jhonal Roca

-- Creamos Base de datos con idioma por defecto.
CREATE DATABASE IF NOT EXISTS ajedrez
CHARACTER SET utf8mb4 
COLLATE utf88mb4_ge;

-- Modificamos la base de datos al idioma ingles inter.
ALTER DATABASE ajedrez
CHARACTER SET utf8mb4
COLLATE utf8_general_ci;

-- Borramos la base de datos.
DROP DATABASE IF EXISTS ajedrez;

-- Creamos una nueva base de datos
CREATE DATABASE IF NOT EXISTS futbol
CHARACTER SET utf16
COLLATE utf16_general_ci;

-- Modificamos la base de datos 
ALTER DATABASE futbol 
CHARACTER SET utf8mb4
COLLATE utf8_general_ci; 

-- Eliminamos definitivamente la base de datos.
DROP DATABASE IF EXISTS futbol;


