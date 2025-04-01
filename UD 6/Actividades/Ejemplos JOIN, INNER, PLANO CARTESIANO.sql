-- Consultas multitablas 
-- Producto cartesiano corredores, blibs
SELECT * FROM corredores, clubs;

-- registros validos asocia cada corredor con su club
SELECT * FROM coreedores, clubs WHERE corredores.club_id = clubs.id;

-- mostrar corredor, ciudad, nombre del club
SELECT 
    CONCAT_WS(',',
            corredores.apellidos,
            corredores.nombre) AS Corredor,
    corredores.ciudad,
    clubs.Nombre
FROM
    corredores,
    clubs
WHERE
    corredores.Club_id = clubs_id;

-- uso de inner join
SELECT 
    *
FROM
    corredores
        INNER JOIN
    clubs ON corredores.club_id = clubs_id;
    
-- Una veez unidas la tblas puedo seleccionar columnas de ambas tablas
-- especificando como prefijo el nombre de la tabla
SELECT 
    *
FROM
    corredores.id,
    corredores.apellido,
    corredores.nombre,
    corredores.club_id,
    clubs.nombre club
        INNER JOIN
    clubs ON corredores.club_id = clubs_id;
    
    
    
    
    
    
