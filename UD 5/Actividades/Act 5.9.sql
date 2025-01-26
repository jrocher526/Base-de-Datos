-- Actividad 5.9

-- Creamos la base de datos RestriccionesDefault con contejamiento UTF8_GENERAL_CI
DROP DATABASE IF EXISTS RestriccioesDefault;
CREATE DATABASE IF NOT EXISTS RestriccioesDefault
CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Activamos la base de datos
USE RestriccioesDefault;

-- Creamos la tabla solicitada 
DROP TABLE IF EXISTS resdefault;
CREATE TABLE IF NOT EXISTS resdefault(
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    poblacion VARCHAR(20) DEFAULT 'Ubrique',
    provincia VARCHAR(20) DEFAULT 'Cadiz',
    nacionalidad VARCHAR(30) DEFAULT 'España',
    precio DECIMAL(10,2) DEFAULT '10.20',
    sueldo DECIMAL(10,2) DEFAULT '1500.00',
    fecha_Hora_Llegada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_Llegada DATE DEFAULT CURRENT_DATE,			
    hora_Llegada TIME,  
    casado BOOLEAN DEFAULT TRUE,
    carnet_conducir BOOLEAN DEFAULT TRUE
);

-- Insertamos valores a la tabla 
INSERT INTO resdefault (poblacion, provincia, nacionalidad, precio, sueldo, fecha_Hora_Llegada, fecha_Llegada, hora_Llegada, casado, carnet_conducir)
VALUES
(
'Ubrique', 
 'Cádiz', 
 'España', 
 10.20, 
 1500.00, 
'2025-01-22 09:00:00',
 '2025-01-21',        
 '08:30:00',              
 TRUE, 
 TRUE),

(
'Ronda', 
 'Málaga', 
 'España', 
 15.50, 
 1800.00, 
 '2025-01-22 09:00:00',  
 '2025-01-22',            
 '09:00:00',          
 TRUE, 
 TRUE),

('Grazalema', 
 'Cádiz', 
 'España', 
 12.30, 
 1600.00, 
 '2025-01-23 10:15:00',  
 '2025-01-23',          
 '10:15:00',              
 TRUE, 
 TRUE);
