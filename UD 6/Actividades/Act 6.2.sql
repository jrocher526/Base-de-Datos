-- Actividad 6.2
-- Jhonal Roca
-- Tema 6 - Lenguje SQL - DML

-- UPDATE Actualiza los regristros de la BDD futbol

-- Actualizar el aforo del Santiago Bernabéu a 90,000 espectadores
UPDATE equipos 
SET aforo = 90000 
WHERE id = 1;

--  Cambiar el nombre del estadio del FC Barcelona a "Estadi Olímpic Lluís Companys"
UPDATE equipos 
SET estadio = 'Estadi Olímpic Lluís Companys' 
WHERE id = 2;

--  Ampliar el aforo del Benito Villamarín en 2,000 asientos
UPDATE equipos 
SET aforo = aforo + 2000 
WHERE id = 5;

-- Corregir la fecha de nacimiento de Isco Alarcón
UPDATE jugadores 
SET fecha_nac = '1992-04-21' 
WHERE nombre = 'Isco Alarcón';

-- Actualizar el equipo de Borja Iglesias al Atlético de Madrid
UPDATE jugadores 
SET equipo_id = 3  -- Atlético de Madrid
WHERE nombre = 'Borja Iglesias';

-- Agregar 5 minutos a cada gol de Vinícius Jr.
UPDATE goles 
SET minuto = ADDTIME(minuto, '00:05:00') 
WHERE jugador_id = (SELECT id FROM jugadores WHERE nombre = 'Vinícius Jr.');

-- Anular el gol del Betis en su partido contra el Atlético de Madrid
UPDATE partidos 
SET goles_casa = goles_casa - 1 
WHERE id = 6;  -- Partido entre Betis (id = 5) y Atlético de Madrid (id = 3)

-- Intercambiar jugadores entre el Real Madrid y el Sevilla
UPDATE jugadores 
SET equipo_id = 1  -- Real Madrid
WHERE nombre = 'Isco Alarcón';

UPDATE jugadores 
SET equipo_id = 4  -- Sevilla FC
WHERE nombre = 'Jude Bellingham';

-- Ampliar el estadio en un 10% para todos los equipos fundados antes de 1920
UPDATE equipos 
SET aforo = aforo * 1.10 
WHERE fundacion < 1920;

-- Bonificación de 400,000 € para jugadores nacidos antes de 1990
UPDATE jugadores 
SET salario = salario + 400000  -- Se asume que hay un campo de salario
WHERE fecha_nac < '1990-01-01';

-- Eliminar los goles de Antoine Griezmann (sancionado por dopaje)
UPDATE goles 
SET jugador_id = NULL 
WHERE jugador_id = (SELECT id FROM jugadores WHERE nombre = 'Antoine Griezmann');
