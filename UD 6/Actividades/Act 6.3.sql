-- Actividad 6.3
-- Jhonal Roca
-- Tema 6 - Lenguje SQL - DML

-- DELETE Para eliminiar registros de una tabla

-- Eliminamos al Sevilla FC de la BDD
DELETE FROM equipos WHERE id = 4 LIMIT 1;

-- Eliminamos al jugador mas veterao de la liga
-- Primero Identificamos al jugador mas veterano
SELECT id FROM jugadores ORDER BY fecha_nac ASC LIMIT 1; 
-- Una vez identificado el jugador procedemos a eliminarlo 
DELETE FROM jugadores WHERE id = 10 LIMIT 1;

-- Eliminar el jugador duplicado llamado "Vinícius Jr." (LIMIT 1 para eliminar solo uno)
DELETE FROM jugadores 
WHERE nombre = 'Vinícius Jr.' 
LIMIT 1;  -- Limitar a un solo registro en caso de duplicados

-- Eliminar los goles de Antoine Griezmann
DELETE FROM goles 
WHERE jugador_id = (SELECT id FROM jugadores WHERE nombre = 'Antoine Griezmann');

-- Eliminar los jugadores del Real Betis Balompié y luego eliminar el equipo
-- Primero eliminar los jugadores del Betis
DELETE FROM jugadores 
WHERE equipo_id = 5;  -- id del Real Betis Balompié

-- Luego eliminar el equipo Real Betis Balompié
DELETE FROM equipos 
WHERE id = 5;

-- Eliminar los partidos jugados antes del 1 de enero de 2024
DELETE FROM partidos 
WHERE fecha < '2024-01-01';

-- Eliminar el equipo Atlético de Madrid y todos los datos relacionados (jugadores, partidos y goles)
-- Primero eliminar los goles del Atlético de Madrid
DELETE FROM goles 
WHERE id_partido IN (SELECT id FROM partidos WHERE id_equipo_casa = 3 OR id_equipo_fuera = 3);

-- Luego eliminar los partidos del Atlético de Madrid
DELETE FROM partidos 
WHERE id_equipo_casa = 3 OR id_equipo_fuera = 3;

-- Luego eliminar los jugadores del Atlético de Madrid
DELETE FROM jugadores 
WHERE equipo_id = 3;  -- id del Atlético de Madrid

-- Finalmente eliminar el equipo Atlético de Madrid
DELETE FROM equipos 
WHERE id = 3;



