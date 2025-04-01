-- Ejemplos de clase 

-- Delete 

# Eliminar los jugadores del real madrid
DELETE FROM jugadores WHERE equip_id = 1;

# Eliminar los jugadores nacidos en 2001
DELETE FROM jugadores WHERE year(fecha_nac) = 2001;

# Eliminar los jugadores nacidos en 2001 que pertenezcan al real madrid 
DELETE FROM jugadores WHERE year(fecha_nac) =2001 AND equipo_id = 1;