-- Actividad 7.4
-- Tema 7 - BDD
-- Jhonal Roca

USE geslibros;

-- 1. Incluir una transacción para realizar las siguientes actualizaciones
-- Todos libros de tema "Novela" en oferta y decrementa un 10% el precio
-- Los libros de la editorial "Anaya" incrementa un 6% y el resto se reduce un 4,5%
START TRANSACTION;

-- a) Descuento del 10% a libros de tema 'Novela'
UPDATE libros
SET precio = precio * 0.9
WHERE tema = 'Novela';

-- b) Aumento del 6% para editorial 'Anaya'
UPDATE libros
SET precio = precio * 1.06
WHERE editorial = 'Anaya';

-- c) Reducción del 4.5% para el resto de editoriales
UPDATE libros
SET precio = precio * 0.955
WHERE editorial <> 'Anaya';

-- 2.
-- Deshacer cambios
ROLLBACK;

-- Comprobación (puedes ejecutar una SELECT para comprobar precios)
SELECT * FROM libros;

-- 3. Iniciar transacción con lo siguiente:
-- Añadir dos nuevos libros, una nueva venta y 3 líneas de detalle sobre la venta
START TRANSACTION;

-- a) Insertar dos nuevos libros
INSERT INTO libros (id, titulo, tema, editorial, precio) VALUES (1001, 'Libro A', 'Ensayo', 'Planeta', 20.00);
INSERT INTO libros (id, titulo, tema, editorial, precio) VALUES (1002, 'Libro B', 'Ciencia', 'Anaya', 25.00);

-- b) Insertar venta
INSERT INTO ventas (id, fecha, cliente_id) VALUES (5001, CURRENT_DATE, 1);

-- c) Insertar tres líneas de detalle para esa venta
INSERT INTO detalle_venta (venta_id, libro_id, cantidad, precio_unitario) VALUES (5001, 1001, 2, 20.00);
INSERT INTO detalle_venta (venta_id, libro_id, cantidad, precio_unitario) VALUES (5001, 1002, 1, 25.00);
INSERT INTO detalle_venta (venta_id, libro_id, cantidad, precio_unitario) VALUES (5001, 1001, 1, 20.00);

-- 4.
-- Confirmar cambios
COMMIT;

-- 5. Incluir en una transacción lo siguiente:
-- Insertar dos libros y dos clientes.
-- Crear un SAVEPOINT a
-- Actualizar los precios de todos los libros en 10% incremento
-- Crear SAVEPOINT b
-- Eliminar libros no vendidos y deshacer el SAVEPOINT a y realizar la comprobación
START TRANSACTION;

-- a) Insertar dos libros
INSERT INTO libros (id, titulo, tema, editorial, precio) VALUES (1003, 'Libro C', 'Historia', 'Santillana', 30.00);
INSERT INTO libros (id, titulo, tema, editorial, precio) VALUES (1004, 'Libro D', 'Ficción', 'Anaya', 28.00);

-- b) Insertar dos clientes
INSERT INTO clientes (id, nombre, direccion) VALUES (201, 'Carlos Pérez', 'Calle A');
INSERT INTO clientes (id, nombre, direccion) VALUES (202, 'Laura Gómez', 'Calle B');

-- c) SAVEPOINT a
SAVEPOINT a;

-- d) Aumentar todos los precios un 10%
UPDATE libros
SET precio = precio * 1.10;

-- e) SAVEPOINT b
SAVEPOINT b;

-- f) Eliminar libros no vendidos
DELETE FROM libros
WHERE id NOT IN (SELECT DISTINCT libro_id FROM detalle_venta);

-- g) Deshacer hasta SAVEPOINT a (lo que deshace la subida de precios y borrado)
ROLLBACK TO a;

-- Comprobación (puedes hacer SELECT)
SELECT * FROM libros;
