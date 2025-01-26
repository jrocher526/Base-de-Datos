DROP DATABASE IF EXISTS tipos_datos;

CREATE DATABASE IF NOT EXISTS tipos_datos
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

DROP DATABASE IF EXISTS tipos_datos_num;

CREATE DATABASE IF NOT EXISTS tipos_datos_num;

USE tipos_datos_num;

CREATE TABLE IF NOT EXISTS tipos_datos_num (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_camiseta TINYINT(2) UNSIGNED,
    diferencia_doles TINYINT(2), 
    goles_afavor TINYINT(2),
    foles_encontra TINYINT(2),
    num_habitantes INT,
    humedad FLOAT(5,2) UNSIGNED,
    precipitaciones TINYINT UNSIGNED, 
    temperatura_maxima FLOAT(4,2),
    temperatura_minima FLOAT(4.2), 
    velocidad_viento INT, 
    altura INT UNSIGNED,
    precio FLOAT,
    sueldo INT,
    seno FLOAT,
    coseno FLOAT, 
    tangente FLOAT
	) ;
    
INSERT INTO tipos_datos_num VALUES
(NULL, 25, 2, 4, 1, 152.500, 81.5, 15, 36, 28, 300, 7000, 14.5, 1500, 8.6, 7.3, 4.1),
(NULL, 12, 3, 5, 2, 163.526, 12.52, 5, 84, 12, 280, 7850, 45.5, 1230, 1.6, 6.3, 3.1),
(NULL, 15, 8, 4, 3, 584.266, 5.06, 125, 48, 36, 158, 7120, 23.5, 2330, 5.1, 4.8, 6.7);

