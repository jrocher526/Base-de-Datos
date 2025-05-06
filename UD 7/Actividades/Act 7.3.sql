-- Act 7.3
-- Tema 7 - DCL
-- Jhonal Roca
-- BDD 24/25

-- 1. Revocar a Juan todos los privilegios a nivel global
REVOKE ALL PRIVILEGES ON *.* FROM 'juan'@'localhost';

-- 2. Revocar a pedro el privilegio SELECT sobre la base de datos geslibros
REVOKE SELECT ON geslibros.* FROM 'pedro'@'localhost';

-- 3. Revocar a maria privilegios ALTER, CREATE, UPDATE sobre gestlibros y maratoon
REVOKE ALTER, CREATE, UPDATE ON gestlibros.* FROM 'maria'@'localhost';
REVOKE ALTER, CREATE, UPDATE ON maratoon.* FROM 'maria'@'localhost';

-- 4. Revocar a roberto el privilegio GRANT OPTION
REVOKE GRANT OPTION ON *.* FROM 'roberto'@'localhost';

-- 5. Revocar a rocio el privilegio INSERT sobre geslibros
REVOKE INSERT ON geslibros.* FROM 'rocio'@'localhost';

-- 6. Revocar a carlos privilegios sobre las tablas editoriales y clientes, y el privilegio UPDATE
REVOKE ALL PRIVILEGES ON geslibros.editoriales FROM 'carlos'@'localhost';
REVOKE ALL PRIVILEGES ON geslibros.clientes FROM 'carlos'@'localhost';
REVOKE UPDATE ON geslibros.libros FROM 'carlos'@'localhost';

-- 7. Revocar a anamari privilegios SELECT sobre columnas especificadas de libros
REVOKE SELECT (titulo, ean, isbn, precio_venta) ON geslibros.libros FROM 'anamari'@'localhost';

-- 8. Revocar a anamari privilegios SELECT sobre columnas nombre, telefono, email de clientes
REVOKE SELECT (nombre, telefono, email) ON geslibros.clientes FROM 'anamari'@'localhost';
