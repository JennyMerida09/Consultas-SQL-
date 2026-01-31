-- ============================
-- Tabla: departamentos
-- ============================
CREATE TABLE departamentos (
    departamento_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- ============================
-- Tabla: puestos
-- ============================
CREATE TABLE puestos (
    puesto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- ============================
-- Tabla: empleados
-- ============================
CREATE TABLE empleados (
    empleado_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    fecha_ingreso DATE,
    departamento_id INTEGER,
    puesto_id INTEGER,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id),
    FOREIGN KEY (puesto_id) REFERENCES puestos(puesto_id)
);

-- ============================
-- Tabla: proyectos
-- ============================
CREATE TABLE proyectos (
    proyecto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- ============================
-- Tabla intermedia: empleado_proyecto
-- (relación muchos a muchos)
-- ============================
CREATE TABLE empleado_proyecto (
    empleado_id INTEGER,
    proyecto_id INTEGER,
    PRIMARY KEY (empleado_id, proyecto_id),
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id),
    FOREIGN KEY (proyecto_id) REFERENCES proyectos(proyecto_id)
);

-- ============================
-- Tabla: salarios
-- ============================
CREATE TABLE salarios (
    salario_id INTEGER PRIMARY KEY AUTOINCREMENT,
    empleado_id INTEGER,
    salario REAL,
    fecha_inicio DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(empleado_id)
);
