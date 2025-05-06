-- Mostramos la base de datos con los usuarios que hay
SELECT * FROM mysql.user;

-- Creamos usuario sin permisos ni contraseña
CREATE USER Pepito;

-- Creamos ususario para que muestre que pertenece a un localhost 
CREATE USER  juan@localhost; 

-- Creamos usuario con contraseña
CREATE USER  Carlos@localhost IDENTIFIED BY '123456';

-- Encriptar 
SELECT PASSWORD('1234');

-- Crear usuario con contraseña encriptada 
CREATE USER carlos@localhost IDENTIFIED BY '*A4B6157319038724E3560894F7F932C8886EBFCF';

-- Crear usuario sin encreptar contraseña
-- CREATE USER Pedro@localhost IDENTIFIED BY PASSWORD '4567';

-- Borrar un usuario 
DROP USER juan@localhost; 

-- GRANT 
-- Crear un usuario sin privilegios 

-- Crear usuario jose
CREATE USER pablo@locahots IDENTIFIED BY '1234';

-- Usar GRANT
GRANT USAGE ON *.* TO pablo@localhots IDENTIFIED BY '123456';

-- Asignar a pablo todos los privilegios
GRANT ALL PRIVILEGES ON *.* TO pablo@localhost;

-- Asignar a pedrogarcia todoos los privilegios incluido el grant 
-- Crear un superadministrador de la base de datos
GRANT ALL PRIVILEGES ON *.* TO pedro@localhost IDENTIFIED BY '123456' WITH GRANT OPTION;

-- Asignar a pablo todos los privilegios sobre base de datos geslibro
GRANT ALL PRIVILEGES ON geslibros.* TO pablo@localhost IDENTIFIED BY '123456';



-- Asignar todos los provilegios sobre la base de datos geslibro y maratoon
GRANT ALL PRIVILEGES ON geslibros TO yoel@localhost;
GRANT ALL PRIVILEGES ON maratoon TO yoel@localhost;

-- Asignar privilegios de cosulta sobre la base de datos geslibros 
GRANT SELECT ON geslibros.* TO pablo@localhost IDENTIFIED BY '12345';

SELECT * FROM mysql.user;
SELECT * FROM mysql.db;

-- Asignar privilegios al usuario pablo para que de la tabla libros de la base de datos geslibros
-- Solo pueda consultar las columnas id, isbnm titulo, autor_id, editorial_id, precio_coste, precio_venta
-- Asginar ademas privilegios para que pueda actualizar el precio_coste y el precio_venta de la tabla libro 
GRANT
 SELECT (id, isbn, titulo, autor_id, editorial_id, precio_coste, precio_venta), 
 UPDATE (precio_coste, precio_venta) 
 ON geslibros.libros TO pablo@localhost;

-- Remover los privilegios de select y update de pablo
REVOKE 
SELECT (precio_coste),
UPDATE (precio_coste) ON geslibros.libros
FROM pablo@localhost;

SET PASSWORD FOR pablo@localhost = PASSWORD('1234567');

-- IMPORTANTE
-- Privilegios globales
SELECT *FROM mysql.user;

-- Privilegios a nivel de base de datos
SELECT * FROM mysql.db;

-- Privilegios a nivel de tablas
SELECT * FROM mysql.tables_priv;

