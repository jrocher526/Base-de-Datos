-- Actividad 6.6
-- Jhonal Roca
-- Tema 6 - Lenguje SQL - DML

-- funciones de Agregado

-- ORDER BY, LIMIT, ALL, DISTINCT

-- Obtener los 3 empleados con mayor salario
SELECT * FROM empleados WHERE salario ORDER BY salario ASC LIMIT 3;

-- Obtener los 5 empleados con menor salario
SELECT * FROM empleados WHERE salario ORDER BY salario DESC LIMIT 5;

-- Obtener los empleados ordenados alfabéticamente
SELECT * FROM empleados ORDER BY nombre;

-- Obtener los 3 primeros departamentos
SELECT * FROM departamentos ORDER BY id ASC LIMIT 3;

-- Obtener los 3 empleados con mayores salarios del departamento 3
SELECT * FROM empleados WHERE salario ORDER BY departamento_id = 3 ASC LIMIT 3;

-- Función COUNT()

-- Obtener el número total de departamentos
SELECT count(*) FROM departamentos;

-- Obtener el número total de beneficiarios de sexo ‘M’ mujer
SELECT count(*) FROM beneficiarios WHERE genero = 'M';

-- Obtener el número total de empleados cuyo salario esté comprendido entre 20000 y 50000.
SELECT count(*) FROM empleados WHERE salario BETWEEN 20000 AND 50000;

-- Obtener el número total de empleados nacidos después del 1970, no inclusive.
SELECT count(*) FROM empleados WHERE year(fecha_nac) > 1970;

-- Obtener el número total de proyectos asignados al departamento 3.
SELECT count(*) FROM proyectos WHERE num_proyecto ORDER BY departamento_id = 3;

-- Obtener le número de departamentos que están realizando un proyecto.


-- Obtener el número de empleados que están trabajando en algún proyecto.
SELECT count(*) FROM empleados_proyectos WHERE empleado_id;

-- Función SUM()







