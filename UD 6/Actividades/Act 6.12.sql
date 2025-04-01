-- Actividad 6.12 
-- Jhonal Roca
-- BDD Tema 6 - DML

-- CREATE VIEW

-- 1. Consulta multitabla
CREATE VIEW movimientos AS
    SELECT 
        m.id,
        m.id_cuenta,
        c.num_cuenta,
        CONCAT(cl.apellidos, ' ', cl.nombre) AS cliente,
        DATE(m.fecha_hora) AS fecha,
        m.concepto,
        m.tipo,
        m.cantidad,
        m.saldo
    FROM
        movimientos m
            JOIN
        cuentas c ON m.id_cuenta = c.id
            JOIN
        clientes cl ON c.id_cliente = cl.id
    ORDER BY m.id;

-- 2. Consultas a partir de la vista movimientos

-- a) Movimientos del año 2021
CREATE VIEW mov_2021 AS
    SELECT 
        *
    FROM
        movimientos
    WHERE
        YEAR(fecha) = 2021;

-- b) Movimientos de tipo Ingreso
CREATE VIEW mov_ingresos AS
    SELECT 
        *
    FROM
        movimientos
    WHERE
        tipo = 'I';

-- c) Movimientos de tipo Reintegro inferiores a 10 €
CREATE VIEW mov_reintegros_menor_10 AS
    SELECT 
        *
    FROM
        moviminetos
    WHERE
        tipo = 'R' AND cantidad < 10;

-- d) Obtener el saldo de cada cuenta agrupado
CREATE VIEW saldo_cuentas AS
    SELECT 
        num_cuenta, 
        SUM(saldo) AS saldo_total
    FROM
        movimientos
    GROUP BY num_cuenta;
