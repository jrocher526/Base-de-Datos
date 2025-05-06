-- Actividad 7.8
-- Jhonal Roca
-- 1º DAW - BDD

-- Añadir corredores
INSERT INTO corredores VALUES
(NULL, 'Juan', 'Hernandez Mendez', 'Sevilla', '2000/04/08', 'H', NULL, NULL, 5),
(NULL, 'Maria', 'Salvadora Esepranza', 'Madrid', '2004/04/12', 'M', NULL, NULL, 5),
(NULL, 'Jose', 'Chacon Roca', 'Ubrique', '2014/12/06', 'H', NULL, NULL, 5),
(NULL, 'Ana', 'Martínez López', 'Sevilla', '2016/07/22', 'M', NULL, NULL, 5),
(NULL, 'Luis', 'García Pérez', 'Cádiz', '2018/03/15', 'H', NULL, NULL, 5),
(NULL, 'Carmen', 'Ruiz Gómez', 'Jerez', '2015/11/30', 'M', NULL, NULL, 5);

-- Actualizar 
UPDATE corredores SET edad = TIMESTAMPDIFF(year, fechanacimiento, now());


-- Actualizar categoria
UPDATE corredores SET categoria_id = CASE 
	WHEN edad<12 THEN 1
	WHEN edad<15 THEN 2
	WHEN edad<18 THEN 3
	WHEN edad<30 THEN 4
	WHEN edad<40 THEN 5
	WHEN edad<50 THEN 6
	WHEN edad<60 THEN 7
	ELSE 8
END;

-- Mostrar a los corredores
-- 1. Realiza una consulta que muestre id, nombre, apellidos, fechaNacimiento, Edad, Categoria (nombre corto) y Club (nombre corto) de todos los corredores.
SELECT 
    c.id AS Id_Corredor,
    c.nombre AS Nombre,
    c.apellidos AS Apellidos,
    c.fechanacimiento AS FechaNacimiento,
    c.edad AS Edad,
    ca.nombrecorto AS Categoria,
    cl.nombrecorto AS Club
FROM
    corredores c
        INNER JOIN
    categorias ca ON c.Categoria_id = ca.id
        INNER JOIN
    clubs cl ON c.Club_id = cl.id
    ORDER BY c.Edad ASC;
    
-- 2. Realiza una consulta que muestre los corredores que cumplen año el mes que viene, teniendo en cuenta la fecha y hora actual. Mostrar las mismas columnas que en el apartado anterior.
SELECT 
    c.id AS Id_Corredor,
    c.nombre AS Nombre,
    c.apellidos AS Apellidos,
    c.fechanacimiento AS FechaNacimiento,
    c.edad AS Edad,
    ca.nombrecorto AS Categoria,
    cl.nombrecorto AS Club
FROM
    corredores c
        INNER JOIN
    categorias ca ON c.Categoria_id = ca.id
        INNER JOIN
    clubs cl ON c.Club_id = cl.id
WHERE MONTH(c.fechanacimiento) = MONTH(CURDATE() + INTERVAL 1 MONTH)    
ORDER BY c.Edad ASC;

-- 3. Realiza una consulta que muestre los corredores que cumplen año la semana que viene, teniendo en cuenta también la fecha y hora actual.


-- maratoon de Sevilla
-- Actualizar tiempo de llegada
-- Mostrar calificacion
