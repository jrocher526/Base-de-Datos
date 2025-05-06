-- Actividad 7.5
-- Tema 7 - BDD
-- Jhonal Roca

USE geslibros;

-- 3. Bloquea la tabla clientes para READ, muestra todos los registros
-- Bloqueo de la tabla clientes para lectura
LOCK TABLE clientes READ;

-- Intentar mostrar libros (no se permite cuando hay bloqueo activo en otras tablas)
SELECT * FROM libros; -- Esta acción generará error de bloqueo

-- 5. Desbloquea tabla clientes.
UNLOCK TABLES;

-- 7. Muestra los registros de la tabla libros
-- Intenta bloquear la tabla para READ
-- Intentar ver libros (fallará)
SELECT * FROM libros; -- Error esperado: tabla bloqueada para escritura por otro usuario

-- Intentar bloquear para lectura (fallará también)
LOCK TABLE libros READ; -- Error esperado

-- 9. Debe realizar una transacción con:
-- Bloqueo exclusivo del campo precio_venta de la tabla libros
-- Decremento del precio de los libros en un 30% 
-- Confirmar transacción
START TRANSACTION;

-- Bloqueo exclusivo del campo precio_venta
SELECT * FROM libros FOR UPDATE;

-- Disminuir precios por crisis sanitaria
UPDATE libros SET precio = precio * 0.70;

COMMIT;
