-- Act 6.13
-- Jhonal Roca 
-- BDD Tema 6 - DML

-- 1. Script - clientes
SELECT 
    id, nombre, direccion, nif, telefono, email
FROM
    clientes
WHERE
    poblacion = 'Ubrique'
        AND email LIKE '%ieslosremedios.org%'
ORDER BY nombre;

-- 2. Script - ventas
SELECT 
    v.id,
    c.nombre,
    v.fecha,
    v.importe_bruto,
    v.importe_iva,
    v.importe_total
FROM
    ventas v
        INNER JOIN
    clientes c ON c.id = v.cliente_id
WHERE
    YEAR(fecha) = 2014
ORDER BY importe_total DESC;

-- 3. Script - libros
SELECT 
    l.id,
    l.titulo,
    a.nombre AS autor,
    e.nombre AS Editorial,
    l.stock,
    l.precio_coste,
    l.precio_venta
FROM
    libros l
        INNER JOIN
    autores a ON l.autor_id = a.id
        INNER JOIN
    editoriales e ON l.editorial_id = e.id
WHERE
    YEAR(l.fecha_edicion) = 2011
        AND l.stock BETWEEN 10 AND 20
ORDER BY l.id;
