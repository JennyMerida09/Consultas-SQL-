--===============================
--Proyecto: Consultas SQL 
--Base de Datos: SQLite
--Autora: Jennifer Merida
--===============================


--1. Empleados con su departamento
SELECT e.nombre AS empleado, d.nombre AS departamento
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id
	
-- -------------------------------------------------------------

--2. Empleados con su puesto
SELECT e.nombre AS empleado, p.nombre AS puesto
FROM empleados e
JOIN puestos p ON e.puesto_id = p.puesto_id

-- -------------------------------------------------------------

--3. Empleados que trabajan en el área de Tecnología
SELECT e.nombre AS nombre, d.nombre AS area
FROM empleados e 
JOIN departamentos d ON e.departamento_id = d.departamento_id
WHERE d.nombre = 'Tecnología'

-- -------------------------------------------------------------

--4. Cantidad de empleados por departamento
SELECT d.nombre AS departamento, COUNT(e.empleado_id) AS cantidad_empleados
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id
GROUP BY d.nombre
	
-- ------------------------------------------------------------
	
--5. Salario promedio por departamento
SELECT d.nombre AS departamento, AVG(s.salario) AS salario_promedio
FROM empleados e 
JOIN departamentos d ON e.departamento_id = d.departamento_id
JOIN salarios s ON e.empleado_id = s.empleado_id
GROUP BY d.nombre

-- -------------------------------------------------------------

--6. Salario actual de cada empleado
SELECT e.nombre AS empleado, MAX(s.salario) AS salario_actual
FROM empleados e
JOIN salarios s ON e.empleado_id = s.empleado_id
GROUP BY e.nombre

-- -------------------------------------------------------------
	
--7. Empleados sin proyectos asignados
SELECT e.nombre AS empleado
FROM empleados e 
LEFT JOIN empleado_proyecto ep ON e.empleado_id = ep.empleado_id
WHERE ep.proyecto_id IS NULL

-- -------------------------------------------------------------
	
--8. Cantidad de proyectos por empleados
SELECT e.nombre AS empleado, COUNT(p.nombre) AS cantidad_proyectos
FROM empleados e 
JOIN empleado_proyecto ep ON e.empleado_id = ep.empleado_id
JOIN proyectos p ON ep.proyecto_id = p.proyecto_id
GROUP BY e.nombre 

-- -------------------------------------------------------------
	
--9. Empleado con el salario más alto
SELECT e.nombre AS empleado, s.salario AS salario
FROM empleados e
JOIN salarios s ON e.empleado_id = s.empleado_id
WHERE s.salario = (SELECT MAX(salario)
                   FROM salarios
				   )
	
-- -------------------------------------------------------------
	
--10. Empleados que ganan más que el salario promedio
SELECT e.nombre AS empleado, MAX(s.salario) AS salario
FROM empleados e
JOIN salarios s ON e.empleado_id = s.empleado_id
GROUP BY e.nombre
HAVING MAX(s.salario) > (SELECT AVG(salario) 
                         FROM salarios)

-- -------------------------------------------------------------
	
--11. Departamento con mayor costo salarial
SELECT d.nombre AS departamento, SUM(s.salario) AS costo_salarial
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id
JOIN salarios s ON e.empleado_id = s.empleado_id
GROUP BY d.nombre
ORDER BY costo_salarial DESC
LIMIT 1

-- -------------------------------------------------------------
	
--12. Proyectos con más de un empleado asignado
SELECT p.nombre AS proyecto, COUNT(ep.empleado_id) AS cantidad_empleados
FROM empleado_proyecto ep
JOIN proyectos p ON ep.proyecto_id = p.proyecto_id
GROUP BY p.nombre
HAVING COUNT(ep.empleado_id) > 1

-- -------------------------------------------------------------
	
--13. Clasificar salarios
SELECT e.nombre AS empleado, s.salario AS salario,
CASE 
    WHEN s.salario >= 120000 THEN 'Alto'
    WHEN s.salario >= 90000 THEN 'Medio'
    ELSE 'Bajo'
END AS clasificacion
FROM empleados e
JOIN salarios s ON e.empleado_id = s.empleado_id

-- -------------------------------------------------------------
	
--14. Clasificar empleados segun cantidad de proyectos
SELECT e.nombre AS empleado, COUNT(ep.proyecto_id) AS cantidad_proyectos,
CASE 
    WHEN COUNT(ep.proyecto_id) = 1 THEN 'Un proyecto'
	WHEN COUNT(ep.proyecto_id) > 1 THEN 'Múltiples proyectos'
	ELSE 'Sin proyectos'
END AS clasificacion
FROM empleados e
LEFT JOIN empleado_proyecto ep ON e.empleado_id = ep.empleado_id
LEFT JOIN proyectos p ON ep.proyecto_id = p.proyecto_id
GROUP BY e.nombre 

-- -------------------------------------------------------------
	
--15. Clasisificar departamentos según costo salarial
SELECT d.nombre AS departamento, SUM(s.salario) AS costo_salarial,
CASE
    WHEN SUM(s.salario) > 200000 THEN 'Alto costo'
	ELSE 'Costo moderado'
END AS clasificacion
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.departamento_id
JOIN salarios s ON e.empleado_id = s.empleado_id
GROUP BY d.nombre

