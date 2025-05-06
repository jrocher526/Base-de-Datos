
-- Iniciar transaccion 
START TRANSACTION

-- Eliminar los libros no vendidos 
DELETE FROM libros WHERE id NOT IN (SELECT DISTINCT libro_id 

-- Eliminar los autores que no hayan vendido ningun libro 
DELETE FROM autores 
WHERE
    autores.id NOT IN (SELECT DISTINCT
        l.autor_id
    FROM
        libros l
            INNER JOIN
        lineasventas lv ON lv.libro_id = id);