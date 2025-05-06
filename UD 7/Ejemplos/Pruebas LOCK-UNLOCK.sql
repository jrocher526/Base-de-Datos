-- bloquear la tabla libros para la lectura
LOCK TABLE geslibros.libros READ;
LOCK TABLE geslibros.autores WRITE;
-- Esto no funciona ya que al bloquear la segunda se desbloque la primera

-- MISMO COMANDO
LOCK TABLE geslibros.libros READ, geslibros.autores WRITE;
UNLOCK TABLES;

--
LOCK TABLES geslibros.libros READ;
DELETE FROM libros WHERE id = 1;

UNLOCK TABLES;

GRANT ALL PRIVILEGES ON *.* TO usuario@localhost;

-- Bloquear la tabla de libros
LOCK TABLE geslibros.libros READ;
UNLOCK TABLES;

-- Bloquear la tabla libros write
LOCK TABLE geslibros.libros WRITE;
-- Cuando un usuario bloquea una tabla de manera WRITE el otro usuario tiene que esperar hasta que este desbloqueada para poder trabjar
SELECT * FROM libros; 

-- Bloqueo de tipo excluisvo 
SELECT * FROM libros WHERE autor_id = 2 LOCK IN SHARE MODE;

SELECT * FROM libros; 

-- Bloqueo de tipo excluisvo 
SELECT * FROM libros WHERE autor_id = 2 ;