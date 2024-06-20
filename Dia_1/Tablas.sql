CREATE TABLE medicos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    poblacion VARCHAR(100),
    provincia VARCHAR(100),
    codigo_postal VARCHAR(10),
    nif VARCHAR(15) UNIQUE,
    numero_seguridad_social VARCHAR(20),
    numero_colegiado VARCHAR(20),
    tipo_medico VARCHAR(20)
);

CREATE TABLE horarios (
    id SERIAL PRIMARY KEY,
    dia_semana VARCHAR(10),
    hora_inicio TIME,
    hora_fin TIME,
    id_medico INTEGER,
    FOREIGN KEY (id_medico) REFERENCES medicos(id)
);

CREATE TABLE sustituciones (
    id SERIAL PRIMARY KEY,
    fecha_alta DATE,
    fecha_baja DATE,
    id_medico INTEGER,
    FOREIGN KEY (id_medico) REFERENCES medicos(id)
);

CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    poblacion VARCHAR(100),
    provincia VARCHAR(100),
    codigo_postal VARCHAR(10),
    nif VARCHAR(15) UNIQUE,
    numero_seguridad_social VARCHAR(20),
    tipo_empleado VARCHAR(20)
);

CREATE TABLE vacaciones (
    id SERIAL PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo VARCHAR(20),
    id_empleado INTEGER,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

CREATE TABLE pacientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    codigo_postal VARCHAR(10),
    nif VARCHAR(15) UNIQUE,
    numero_seguridad_social VARCHAR(20),
    id_medico INTEGER,
    FOREIGN KEY (id_medico) REFERENCES medicos(id)
);
