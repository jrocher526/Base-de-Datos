-- Actividad 7.5
-- Tema 7 - BDD
-- Jhonal Roca
USE geslibros;

-- 1. Crear usuarios (ubrique01/ubrique01 y arcos01/arcos01)
-- Crear usuarios
GRANT ALL PRIVILEGES ON geslibros.* TO ubrique01@localhost IDENTIFIED BY 'ubrique01';
GRANT ALL PRIVILEGES ON geslibros.* TO arcos01@localhost IDENTIFIED BY 'arcos01';

