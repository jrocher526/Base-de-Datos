-- Act 7.2
-- Tema 7 - DCL
-- Jhonal Roca
-- BDD 24/25

-- 1. Asignar al usuario juan todos los privilegios a nivel global
GRANT ALL PRIVILEGES ON *.* TO 'juan'@'localhost' IDENTIFIED BY 'juan';

-- 2. Asignar al usuario pedro privilegio SELECT a nivel global
GRANT SELECT ON *.* TO 'pedro'@'localhost' IDENTIFIED BY 'pedro';

-- 3. Asignar a maria privilegios ALTER, CREATE, UPDATE y SELECT sobre gestlibros y maratoon
GRANT ALTER, CREATE, UPDATE, SELECT ON gestlibros.* TO 'maria'@'localhost' IDENTIFIED BY 'maria';
GRANT ALTER, CREATE, UPDATE, SELECT ON maratoon.* TO 'maria'@'localhost';

-- 4. Asignar a roberto/roberto_67 privilegios de superadministrador
GRANT ALL PRIVILEGES ON *.* TO 'roberto'@'localhost' IDENTIFIED BY 'roberto_67' WITH GRANT OPTION;

-- 5. Asignar a rocio/rocio_69 todos los privilegios sobre la base de datos geslibros
GRANT ALL PRIVILEGES ON geslibros.* TO 'rocio'@'localhost' IDENTIFIED BY 'rocio_69';

-- 6. Asignar a carlos/carlos_90 privilegios SELECT y UPDATE sobre tablas específicas de geslibros
GRANT SELECT, UPDATE ON geslibros.libros TO 'carlos'@'localhost' IDENTIFIED BY 'carlos_90';
GRANT SELECT, UPDATE ON geslibros.editoriales TO 'carlos'@'localhost';
GRANT SELECT, UPDATE ON geslibros.clientes TO 'carlos'@'localhost';

-- 7. Asignar a anamari/anamari_2000 privilegios SELECT sobre columnas específicas de libros
GRANT SELECT (titulo, ean, isbn, precio_venta) ON geslibros.libros TO 'anamari'@'localhost' IDENTIFIED BY 'anamari_2000';

-- 8. Asignar a anamari privilegios SELECT y UPDATE sobre columnas específicas de clientes
GRANT SELECT (nombre, telefono, email), UPDATE (nombre, telefono, email) ON geslibros.clientes TO 'anamari'@'localhost';
