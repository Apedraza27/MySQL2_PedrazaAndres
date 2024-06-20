-- Inserciones de médicos
INSERT INTO medicos (nombre, direccion, telefono, poblacion, provincia, codigo_postal, nif, numero_seguridad_social, numero_colegiado, tipo_medico)
VALUES 
('Juan Pérez', 'Calle Falsa 123', '555-1234', 'Ciudad', 'Provincia', '12345', '12345678A', 'SS123456', 'MC123', 'Titular'),
('Ana García', 'Avenida Siempreviva 742', '555-5678', 'Ciudad', 'Provincia', '12345', '87654321B', 'SS876543', 'MC876', 'Interino');

-- Inserciones de horarios
INSERT INTO horarios (dia_semana, hora_inicio, hora_fin, id_medico)
VALUES 
('Lunes', '08:00', '14:00', 1),
('Martes', '08:00', '14:00', 1),
('Miércoles', '08:00', '14:00', 1);

-- Inserciones de sustituciones
INSERT INTO sustituciones (fecha_alta, fecha_baja, id_medico)
VALUES 
('2023-01-01', '2023-03-01', 2),
('2023-06-01', '2023-09-01', 2);

-- Inserciones de empleados
INSERT INTO empleados (nombre, direccion, telefono, poblacion, provincia, codigo_postal, nif, numero_seguridad_social, tipo_empleado)
VALUES 
('Luis Martinez', 'Calle Real 456', '555-8765', 'Ciudad', 'Provincia', '12345', '45678912C', 'SS456789', 'ATS'),
('Marta López', 'Calle Mayor 789', '555-2345', 'Ciudad', 'Provincia', '12345', '98765432D', 'SS987654', 'Administrativo');

-- Inserciones de vacaciones
INSERT INTO vacaciones (fecha_inicio, fecha_fin, tipo, id_empleado)
VALUES 
('2023-07-01', '2023-07-15', 'Planificadas', 1),
('2023-08-01', '2023-08-15', 'Disfrutadas', 2);

-- Inserciones de pacientes
INSERT INTO pacientes (nombre, direccion, telefono, codigo_postal, nif, numero_seguridad_social, id_medico)
VALUES 
('Pedro Jimenez', 'Calle Nueva 123', '555-3456', '12345', '56789012E', 'SS567890', 1),
('Laura Ruiz', 'Avenida Central 456', '555-4567', '12345', '67890123F', 'SS678901', 1);



# Consultas

### 1. Número de pacientes atendidos por cada médico
SELECT m.nombre, COUNT(p.id) AS numero_pacientes
FROM medicos m
LEFT JOIN pacientes p ON m.id = p.id_medico
GROUP BY m.nombre;

### 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado
SELECT e.nombre, 
       SUM(CASE WHEN v.tipo = 'Planificadas' THEN v.fecha_fin - v.fecha_inicio ELSE 0 END) AS dias_planificadas,
       SUM(CASE WHEN v.tipo = 'Disfrutadas' THEN v.fecha_fin - v.fecha_inicio ELSE 0 END) AS dias_disfrutadas
FROM empleados e
LEFT JOIN vacaciones v ON e.id = v.id_empleado
GROUP BY e.nombre;

### 3. Médicos con mayor cantidad de horas de consulta en la semana
SELECT m.nombre, SUM(EXTRACT(EPOCH FROM (h.hora_fin - h.hora_inicio))/3600) AS horas_semana
FROM medicos m
LEFT JOIN horarios h ON m.id = h.id_medico
GROUP BY m.nombre
ORDER BY horas_semana DESC;

### 4. Número de sustituciones realizadas por cada médico sustituto
SELECT m.nombre, COUNT(s.id) AS numero_sustituciones
FROM medicos m
LEFT JOIN sustituciones s ON m.id = s.id_medico
WHERE m.tipo_medico = 'Sustituto'
GROUP BY m.nombre;


### 5. Número de médicos que están actualmente en sustitución
SELECT COUNT(DISTINCT s.id_medico) AS numero_medicos_en_sustitucion
FROM sustituciones s
JOIN medicos m ON s.id_medico = m.id
WHERE m.tipo_medico = 'Sustituto' AND s.fecha_alta > s.fecha_baja;


### 6. Horas totales de consulta por médico por día de la semana
SELECT m.nombre, h.dia_semana, SUM(EXTRACT(EPOCH FROM (h.hora_fin - h.hora_inicio))/3600) AS horas_consulta
FROM medicos m
LEFT JOIN horarios h ON m.id = h.id_medico
GROUP BY m.nombre, h.dia_semana;


### 7. Médico con mayor cantidad de pacientes asignados
SELECT m.nombre, COUNT(p.id) AS numero_pacientes
FROM medicos m
LEFT JOIN pacientes p ON m.id = p.id_medico
GROUP BY m.nombre
ORDER BY numero_pacientes DESC
LIMIT 1;


### 8. Empleados con más de 10 días de vacaciones disfrutadas
SELECT e.nombre, SUM(v.fecha_fin - v.fecha_inicio) AS dias_disfrutadas
FROM empleados e
LEFT JOIN vacaciones v ON e.id = v.id_empleado
WHERE v.tipo = 'Disfrutadas'
GROUP BY e.nombre
HAVING SUM(v.fecha_fin - v.fecha_inicio) > 10;


### 9. Médicos que actualmente están realizando una sustitución
SELECT DISTINCT m.nombre
FROM medicos m
JOIN sustituciones s ON m.id = s.id_medico
WHERE m.tipo_medico = 'Sustituto' AND s.fecha_alta > s.fecha_baja;


### 10. Promedio de horas de consulta por médico por día de la semana
SELECT m.nombre, h.dia_semana, AVG(EXTRACT(EPOCH FROM (h.hora_fin - h.hora_inicio))/3600) AS promedio_horas
FROM medicos m
LEFT JOIN horarios h ON m.id = h.id_medico
GROUP BY m.nombre, h.dia_semana;

