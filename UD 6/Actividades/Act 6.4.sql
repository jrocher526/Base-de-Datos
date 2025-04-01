-- Actividad 6.4
-- Jhonal Roca
-- Tema 6 - Lenguje SQL - DML

-- GesLibros Insertar, actualiza y eliminar valores

	-- INSERT (Insertar registros)

-- Insertar un registro en la tabla "ventas"
INSERT INTO ventas (id, cliente_id, fecha, importe_bruto, importe_iva, importe_total)
VALUES (null, 6, CURRENT_DATE, 289.50, 60.80, 350.30);

-- Insertar registros en la tabla "lineasventas"
INSERT INTO lineasventas (id, venta_id, numero_linea, libro_id, iva, cantidad, precio, importe) VALUES
(null, 22, 8, 0.21, 3, 22.00, 66.00),
(null, 23, 9, 0.21, 2, 17.20, 34.40),
(null, 24, 10, 0.21, 5, 25.00, 125.00);



-- UPDATE (Actualizar registros)

-- Actualizar la direccion del cliente cuyo NIF es 23124234G
UPDATE clientes
SET direccion = 'Pollígono Ansu Fati, Calle Messi, Nave 20'
WHERE nif = '23124234G';

-- Añadir el premio Planeta al escritor Osaar Wilde
UPDATE autores
SET premios = CONCAT(premios, ', Premio Planeta')
WHERE nombre = 'Osaar Wilde';

-- Decrementar el precio de venta de todos los libros en un 10%
UPDATE libros
SET precio_venta = precio_venta * 1.10;

-- Incrementar el precio de costo de todos los libros de las editoriales Alfaguara y Anaya en un 10%
UPDATE libros
SET precio_costo = precio_costo * 1.10
WHERE editorial IN ('Alfaguara', 'Anaya');

-- Descontar 2 € del precio de venta de todos los libros editados antes del año 2000
UPDATE libros
SET precio_venta = precio_venta - 2
WHERE año_publicacion < 2000;


-- DELETE (Eliminar registros)

-- Eliminar los libros de la editorial Alfaguara
DELETE FROM libros
WHERE editorial = 'Alfaguara';

-- Eliminar la editorial Alfaguara
DELETE FROM editoriales
WHERE nombre = 'Alfaguara';



