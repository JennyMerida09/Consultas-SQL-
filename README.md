# Consultas SQL – Modelado de Base de Datos

Este proyecto tiene como objetivo practicar **modelado de bases de datos relacionales** y **consultas SQL en SQLite**, aplicando conceptos de **Entidad–Relación**, **claves primarias y foráneas**, y distintos tipos de **relaciones (1 a N y N a M)**.
Se diseñó una base de datos de empleados desde cero, definiendo correctamente las tablas, sus relaciones y restricciones, para luego utilizarla como base de práctica para consultas con `JOIN`, agregaciones y análisis de datos.
El proyecto simula un entorno real de empresa, incluyendo empleados, departamentos, puestos, proyectos y un historial de salarios.

### Conceptos trabajados
- Modelado Entidad–Relación
- Relaciones 1 a N y N a M
- Claves primarias y foráneas
- Tablas intermedias
- Consultas con JOIN
- Agregaciones (COUNT, SUM, AVG)

## Creación de tablas Entidad/Relación
Creamos las tablas `departamentos`, `puestos`, `empleados`, `salarios`, `proyectos` y `empleado_proyecto`. Luego realizamos las relaciones que tienen las tablas entre ellas a través de las Foreign Keys.

## Tabla departamentos
![Imagen](imagen/departamento.png)

## Tabla puestos
![Imagen](imagen/puestos.png)

## Tabla empleados
En esta tabla se aplica la relación de uno a muchos (1 a N), ya que un `departamento` puede tener muchos empleados y un `puesto` lo pueden tener distintos empleados.

![Imagen](imagen/empleados.png)

## Tabla proyectos
![Imagen](imagen/proyectos.png)

## Tabla empleado y proyectos
Aqui ocurre algo similar pero diferente. Esta tabla aplica la relación de muchos a muchos (N a M), esto ocurre porque un `empleado` puede trabajar en varios proyectos y un `proyecto` puede tener varios empleados trabajando en el. 

![Imagen](imagen/empleado_proyecto.png)

## Tabla salarios
La tabla salarios tambien tiene una relación de 1 a N, debido a que un `empleado` puede tener dintintos `salarios` a lo largo del tiempo en la empresa.

![Imagen](imagen/salarios.png)
