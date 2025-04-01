-- Actividad 6.7
-- Jhonal Roca
-- Tema 6 - Lenguje SQL - DML

-- SUBCONSULTAS

-- 1. Obtener los proyectos que tengan la misma localización que el proyecto "Carretera Madrid Toledo".
-- Subconsulta
SELECT localizacion FROM Proyectos WHERE descripcion = 'Carretera Madrid Toledo';

-- Consulta principal
SELECT 
    *
FROM
    Proyectos
WHERE
    localizacion = (SELECT 
            localizacion
        FROM
            Proyectos
        WHERE
            descripcion = 'Carretera Madrid Toledo');
            
-- 2. Obtener todos los empleados que estén en el mismo departamento que "Jennifer Wallace"
-- Subconsulta
SELECT departamento_id FROM Empleados WHERE nombre = 'Jennifer' AND apellidos = 'Wallace';

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    departamento_id = (SELECT 
            departamento_id
        FROM
            Empleados
        WHERE
            nombre = 'Jennifer'
                AND apellidos = 'Wallace');

-- 3. Obtener los empleados que tengan menor salario que "Alicia Zelaya"
-- Subconsulta
SELECT salario FROM Empleados WHERE nombre = 'Alicia' AND apellidos = 'Zelaya';

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario < (SELECT 
            salario
        FROM
            Empleados
        WHERE
            nombre = 'Alicia'
                AND apellidos = 'Zelaya');

-- 4. Obtener todos los Beneficiarios que hayan nacido en el mismo año que "Alice"
-- Subconsulta
SELECT YEAR(fecha_nac) FROM Beneficiarios WHERE nombre = 'Alice' LIMIT 1;

-- Consulta principal
SELECT 
    *
FROM
    Beneficiarios
WHERE
    YEAR(fecha_nac) = (SELECT 
            YEAR(fecha_nac)
        FROM
            Beneficiarios
        WHERE
            nombre = 'Alice'
        LIMIT 1);

-- 5. Obtener los empleados más jóvenes que "James Bord".
-- Subconsulta
SELECT fecha_nac FROM Empleados WHERE nombre = 'James' AND apellidos = 'Borg';

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    fecha_nac > (SELECT 
            fecha_nac
        FROM
            Empleados
        WHERE
            nombre = 'James' AND apellidos = 'Borg');

-- 6. Obtener aquellos empleados cuyo supervisor coincida con alguno de los supervisores de los empleados del departamento 3.
-- Subconsulta
SELECT supervisor_id FROM Empleados WHERE departamento_id = 3;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    supervisor_id IN (SELECT 
            supervisor_id
        FROM
            Empleados
        WHERE
            departamento_id = 3);

-- 7. Obtener aquellos empleados cuyo año de nacimiento coincida con alguno de los años de nacimiento de los empleados del departamento 3.
-- Subconsulta
SELECT YEAR(fecha_nac) FROM Empleados WHERE departamento_id = 3;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    YEAR(fecha_nac) IN (SELECT 
            YEAR(fecha_nac)
        FROM
            Empleados
        WHERE
            departamento_id = 3);

-- 8. Obtener aquellos empleados cuyo salario coincida con el salario de alguno de los empleados del departamento 2.
-- Subconsulta
SELECT salario FROM Empleados WHERE departamento_id = 2;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario IN (SELECT 
            salario
        FROM
            Empleados
        WHERE
            departamento_id = 2);

-- 9. Añadir un departamento nuevo en la base de datos.
INSERT INTO Departamentos (nombre, jefe_departamento_id, componentes, localizacion) VALUES ('Marketing', NULL, 10, 'New York');

-- 10. Obtener los departamentos que no tengan empleados.
-- Subconsulta
SELECT DISTINCT departamento_id FROM Empleados;

-- Consulta principal
SELECT 
    *
FROM
    Departamentos
WHERE
    id NOT IN (SELECT DISTINCT
            departamento_id
        FROM
            Empleados);

-- 11. Obtener los departamentos que tengan empleados.
-- Subconsulta
SELECT DISTINCT departamento_id FROM Empleados;

-- Consulta principal
SELECT 
    *
FROM
    Departamentos
WHERE
    id IN (SELECT DISTINCT
            departamento_id
        FROM
            Empleados);

-- 12. Obtener los departamentos que no tengan asignado proyectos.
-- Subconsulta
SELECT DISTINCT departamento_id FROM Proyectos;

-- Consulta principal
SELECT 
    *
FROM
    Departamentos
WHERE
    id NOT IN (SELECT DISTINCT
            departamento_id
        FROM
            Proyectos);

-- 13. Obtener los departamentos que tengan asignado algún proyecto.
-- Subconsulta
SELECT DISTINCT departamento_id FROM Proyectos;

-- Consulta principal
SELECT 
    *
FROM
    Departamentos
WHERE
    id IN (SELECT DISTINCT
            departamento_id
        FROM
            Proyectos);

-- 14. Obtener los datos de los empleados cuyo salario sea igual a algún salario de los empleados del departamento 1. (ANY)
-- Subconsulta
SELECT salario FROM Empleados WHERE departamento_id = 1;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario = ANY (SELECT 
            salario
        FROM
            Empleados
        WHERE
            departamento_id = 1);

-- 15. Obtener los datos de los empleados cuyo salario sea igual a algún salario de los empleados del departamento 1. (IN)
-- Subconsulta
SELECT salario FROM Empleados WHERE departamento_id = 1;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario IN (SELECT 
            salario
        FROM
            Empleados
        WHERE
            departamento_id = 1);

-- 16. Obtener los datos de los empleados cuyo salario sea inferior a alguno de los salarios de los empleados del departamento 2.
-- Subconsulta
SELECT salario FROM Empleados WHERE departamento_id = 2;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario < ANY (SELECT 
            salario
        FROM
            Empleados
        WHERE
            departamento_id = 2);

-- 17. Obtener los datos de los empleados cuyo salario sea superior a alguno de los salarios de los empleados cuyo supervisor_id es 1.
-- Subconsulta
SELECT salario FROM Empleados WHERE supervisor_id = 1;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario > ANY (SELECT 
            salario
        FROM
            Empleados
        WHERE
            supervisor_id = 1);

-- 18. Obtener los datos de los empleados cuyo salario sea MENOR a todos los salarios correspondientes a los empleados del departamento 1.
-- Subconsulta
SELECT salario FROM Empleados WHERE departamento_id = 1;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario < ALL (SELECT 
            salario
        FROM
            Empleados
        WHERE
            departamento_id = 1);

-- 19. Obtener los datos de los empleados cuyo salario sea superior al salario de todos los empleados del departamento 2.
-- Subconsulta
SELECT salario FROM Empleados WHERE departamento_id = 2;

-- Consulta principal
SELECT 
    *
FROM
    Empleados
WHERE
    salario > ALL (SELECT 
            salario
        FROM
            Empleados
        WHERE
            departamento_id = 2);