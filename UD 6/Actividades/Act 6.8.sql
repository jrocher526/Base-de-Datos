-- Actividad 6.8
-- Tema 6 - DML
-- INNER JOIN - PRODUCTO CARTESIANO

-- Realizar las siguientes consultas a partir de la base de datos futbol.

-- Producto cartesiano entre jugadores y equipos
SELECT * FROM jugadores, equipos;

-- Producto cartesiano entre jugadores y goles
SELECT * FROM jugadores, goles;

-- Producto cartesiano entre jugadores y equipos eliminando registros espurios
SELECT * FROM jugadores, equipos WHERE jugadores.equipo_id = equipos.id;

-- Producto cartesiano entre jugadores y goles eliminando registros espurios
SELECT * FROM jugadores, goles WHERE jugadores.id = goles.jugador_id;

-- INNER JOIN entre jugadores y equipos (todas las columnas)
SELECT * FROM jugadores INNER JOIN equipos ON jugadores.equipo_id = equipos.id;

-- INNER JOIN entre jugadores y equipos (id, nombre, edad, equipo)
SELECT jugadores.id, jugadores.nombre, jugadores.edad, equipos.nombre AS equipo 
FROM jugadores 
INNER JOIN equipos ON jugadores.equipo_id = equipos.id;

-- INNER JOIN entre jugadores y goles
SELECT * FROM jugadores INNER JOIN goles ON jugadores.id = goles.jugador_id;

-- INNER JOIN entre jugadores y goles (id, nombre, minuto, descripción)
SELECT jugadores.id, jugadores.nombre, goles.minuto, goles.descripcion 
FROM jugadores 
INNER JOIN goles ON jugadores.id = goles.jugador_id;

-- INNER JOIN entre jugadores, equipos y goles
SELECT * FROM jugadores 
INNER JOIN equipos ON jugadores.equipo_id = equipos.id 
INNER JOIN goles ON jugadores.id = goles.jugador_id;

-- INNER JOIN entre jugadores y goles (id, nombre, equipo, minuto, descripción)
SELECT jugadores.id, jugadores.nombre, equipos.nombre AS equipo, goles.minuto, goles.descripcion 
FROM jugadores 
INNER JOIN equipos ON jugadores.equipo_id = equipos.id 
INNER JOIN goles ON jugadores.id = goles.jugador_id;

-- INNER JOIN entre jugadores, equipos, goles y partidos (todas las columnas)
SELECT * FROM jugadores 
INNER JOIN equipos ON jugadores.equipo_id = equipos.id 
INNER JOIN goles ON jugadores.id = goles.jugador_id 
INNER JOIN partidos ON goles.partido_id = partidos.id;

-- INNER JOIN entre jugadores y goles (id, nombre, equipo, minuto, descripción, observaciones)
SELECT jugadores.id, jugadores.nombre, equipos.nombre AS equipo, goles.minuto, goles.descripcion, goles.observaciones 
FROM jugadores 
INNER JOIN equipos ON jugadores.equipo_id = equipos.id 
INNER JOIN goles ON jugadores.id = goles.jugador_id;
