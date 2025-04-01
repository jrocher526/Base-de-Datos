-- Ejemplo 63
-- Mostrar junto con los datos de los corredores los datos del club
-- alquepertenece
SELECT
 *
FROM
 Corredores Co
 INNER JOIN
 clubs cl ON Co.club_id = Cl.id;
-- Ejemplo 64
-- Mismo ejemplo anterior sin la cláusula INNER
SELECT
 *
FROM
Corredor Co
 JOIN
club cl ON Co.club_id = Cl.id;
-- Ejemplo 66
-- Mostrar IdCorredor, Apellidos, Nombre, Edad, Nombre del Club y Nombre
-- de la categoría a la que pertenece cada corredor.
SELECT
co.id,
co.Apellidos,
co.Nombre,
co.Edad,
co.categoria_id,
cl.nombre AS Club,
ca.nombre AS Categoría
FROM
Corredores co
 INNER JOIN
 Clubs cl ON Co.club_id = Cl.id
INNER JOIN
 Categorias ca ON co.categoria_id = ca.id
ORDER BY co.apellidos ,co.nombre;
-- Como vemos se trata de un DOBLE JOIN donde primero conecto Corredor con
-- Club y a su vez el resultado lo conecto con Categoría. Como condición de los
-- JOINS uso las correspondientes claves ajenas.

-- mismos datos pero con el nombre de la categoria
SELECT
co.id,
co.Apellidos,
co.Nombre,
co.Edad,
co.categoria_id,
cl.nombre AS Club,
ca.nombre AS Categoría
FROM
Corredores co
 INNER JOIN
 Clubs cl ON Co.club_id = Cl.id
INNER JOIN
 Categorias ca ON co.categoria_id = ca.id
ORDER BY co.apellidos ,co.nombre;