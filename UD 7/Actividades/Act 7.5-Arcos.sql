-- Actividad 7.5
-- Tema 7 - BDD
-- Jhonal Roca

USE geslibros;

-- 4. Selecciona todos los clientes de la provincia "Guadalajara"
-- Inserta un cliente y asigna datos.
-- Esta consulta sí debe funcionar
SELECT * FROM clientes WHERE provincia = 'Guadalajara';

-- Este intento fallará por bloqueo
INSERT INTO clientes (id, nombre, direccion, provincia)
VALUES (999, 'Cliente bloqueado', 'Calle bloqueada', 'Toledo'); -- Error esperado

-- 6. Comprueba que ha podido insertar el cliente anterior, bloquea tabla libro para READ

-- Comprobar si el cliente fue insertado correctamente
SELECT * FROM clientes WHERE id = 999;

-- Ahora se bloquea la tabla libros para escritura
LOCK TABLE libros WRITE;

-- Insertar un nuevo libro (esta acción debe permitirse)
INSERT INTO libros (id, titulo, tema, editorial, precio)
VALUES (1100, 'Libro Nuevo', 'Historia', 'Anaya', 22.00);

-- 8. Desbloquea la tabla libros

UNLOCK TABLES;

-- 9. Realiza una transacción con:
-- Un bloqueo compartido de los registros de la tabla editoriales y autores
-- Añadir dos libros
-- Terminar correctamente la transacción
START TRANSACTION;

-- Bloqueo compartido
SELECT * FROM editoriales LOCK IN SHARE MODE;
SELECT * FROM autores LOCK IN SHARE MODE;

-- Insertar dos libros
INSERT INTO libros (id, titulo, tema, editorial, precio)
VALUES (1101, 'Libro Compartido 1', 'Filosofía', 'Planeta', 19.50),
       (1102, 'Libro Compartido 2', 'Arte', 'Anaya', 24.90);

COMMIT;
