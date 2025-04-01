-- Actividad 6.1
-- Jhonal Roca
-- Tema 6 - Lenguje SQL - DML

-- Añadir 2 regristros validos en cada tabla de la base de datos futbol 

-- Equipos
INSERT INTO equipos VALUES 
(5, 'Real Betis', 'Benito Villamartin', '70000', '1910', 'Sevilla'),
(6, 'Sevilla FC', 'Sanchez Pizjuan', '75000', '1910', 'Sevilla');

-- jugadores 
INSERT INTO jugadores SET 
    id = null,
    nombre = 'Carlos Gómez', 
    fecha_nac = '1995/11/22', 
    equipo_id = 2;

-- partidos 
INSERT INTO partidos VALUES
(null, 4, 2, '2024/02/13 21:00:00', 0, 1,  '2 Jugadores lesionado por parte del equipo visitante'),
(null, 2, 1, '2025/01/28 18:00:00', 3, 0, '3 goles del delantero Carlos Gomez');

-- goles
INSERT INTO goles VALUES
(null, 7, '00:23:10', 'Gol de tiro libre', 46),
(null, 8, '00:15:00', 'Gol de corner', 47),
(null, 8, '00:30:15', 'Gol de penal', 47),
(null, 8, '00:75:42', 'Gol de cabeza', 47);