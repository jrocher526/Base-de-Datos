-- Actividad 7.7
-- Tema 7 - BDD
-- Jhonal Roca

-- 1. Añadir apellidos a los empleados
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' Pérez') WHERE id = 1;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' Ramírez') WHERE id = 2;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' González') WHERE id = 3;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' López') WHERE id = 4;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' Morales') WHERE id = 5;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' Sánchez') WHERE id = 6;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' Torres') WHERE id = 7;
UPDATE Empleados SET apellidos = CONCAT(apellidos, ' Ortega') WHERE id = 8;

-- 2. Realizar consulta sobre los empleados, mostrando id, nss, nombre
SELECT 
    id,
    nss,
    CONCAT(apellidos, ', ', nombre) AS nombre_completo
FROM Empleados;

-- 3. Consulta que muestre id, nss, nombre, apellido1 y apellido2
SELECT 
    id,
    nss,
    nombre,
    SUBSTRING_INDEX(apellidos, ' ', 1) AS apellido1,
    SUBSTRING_INDEX(apellidos, ' ', -1) AS apellido2
FROM Empleados;

-- 4. Consulta donde la columna direccion de la tabla empleados muestra codigo postal, ciudad, provincia y estado.
SELECT 
    id,
    nombre,
    apellidos,
    nss,
    SUBSTRING_INDEX(direccion, ',', -1) AS estado,
    NULL AS provincia,  -- No existe en tu dato original
    SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ',', 2), ',', -1) AS ciudad,
    SUBSTRING_INDEX(direccion, ',', 1) AS codigo_postal
FROM Empleados;

-- 5. Crear codigo
SELECT 
    id,
    apellidos,
    nombre,
    nss,
    CONCAT(
        RIGHT(nss, 3), '/',
        UPPER(SUBSTRING(nombre, 1, 2)),
        UPPER(SUBSTRING(SUBSTRING_INDEX(apellidos, ' ', 1), 1, 2)),
        UPPER(SUBSTRING(SUBSTRING_INDEX(apellidos, ' ', -1), 1, 2))
    ) AS codigo_generado
FROM Empleados;
