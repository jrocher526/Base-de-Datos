-- Act 7.1
-- Tema 7 - DCL
-- Jhonal Roca
-- BDD 24/25

-- 1. Crear usuarios 
CREATE USER juan@localhost IDENTIFIED BY 'juan_01';
CREATE USER pedro@localhost IDENTIFIED BY 'pedro_01';
CREATE USER maria@localhost IDENTIFIED BY 'maria_03';
CREATE USER miguel@localhost IDENTIFIED BY 'miguel_04';
CREATE USER rocio@localhost IDENTIFIED BY 'rocio_05';

-- 2. Crear conexion 
GRANT ALL PRIVILEGES ON test TO juan@localhost;
GRANT ALL PRIVILEGES ON test TO pedro@localhost;
GRANT ALL PRIVILEGES ON test TO maria@localhost;
GRANT ALL PRIVILEGES ON test TO miguel@localhost;
GRANT ALL PRIVILEGES ON test TO rocio@localhost;

-- 3. Crear usuario tabla mysql.user
SELECT * FROM mysql.db;
-- Creamos usuario en mysql.user de la manera antigua
INSERT INTO mysql.user VALUES 
('localhost', 'roberto', 'robero_79');

-- 4. Eliminar usuario 
DROP USER miguel@localhost;
DROP USER rocio@localhost;



