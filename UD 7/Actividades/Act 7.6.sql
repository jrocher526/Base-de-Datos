-- Actividad 7.6
-- Tema 7 - BDD
-- Jhonal Roca

-- 1.
-- Crear la base de datos
CREATE DATABASE fmatematicas;

-- Seleccionar la base de datos
USE fmatematicas;

-- Crear la tabla Angulos
CREATE TABLE Angulos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    grados INT CHECK (grados >= 0 AND grados <= 360),
    radianes DOUBLE(31, 30),
    seno DOUBLE(31, 30),
    coseno DOUBLE(31, 30),
    tangente DOUBLE(31, 30)
);

-- 2. Añadir registros
INSERT INTO Angulos (grados) VALUES (0);
INSERT INTO Angulos (grados) VALUES (45);
INSERT INTO Angulos (grados) VALUES (90);
INSERT INTO Angulos (grados) VALUES (135);
INSERT INTO Angulos (grados) VALUES (180);
INSERT INTO Angulos (grados) VALUES (225);
INSERT INTO Angulos (grados) VALUES (270);
INSERT INTO Angulos (grados) VALUES (315);
INSERT INTO Angulos (grados) VALUES (360);

-- 3. Actualizar radianes.
UPDATE Angulos
SET radianes = grados * (PI() / 180);

-- 4. Actualizar Seno, Coseno y Tangente
UPDATE Angulos
SET 
    seno = SIN(radianes),
    coseno = COS(radianes),
    tangente = TAN(radianes);
