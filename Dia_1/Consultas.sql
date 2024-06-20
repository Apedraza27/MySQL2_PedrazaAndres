use dia1sql2;

-- Inserciones de médicos
INSERT INTO medicos VALUES ('1', 'Juan Pérez', 'Calle Falsa 123', '555-1234', 'Ciudad', 'Provincia', '12345', '12345678A', 'SS123456', 'MC123', 'Titular');
INSERT INTO medicos VALUES ('2', 'Ana García', 'Avenida Siempreviva 742', '555-5678', 'Ciudad', 'Provincia', '12345', '87654321B', 'SS876543', 'MC876', 'Interino');

-- Inserciones de horario consulta
INSERT INTO horario_consulta VALUES ('1', 'Lunes', '08:00', '14:00', 1);
INSERT INTO horario_consulta VALUES ('2','Martes', '08:00', '14:00', 1);
INSERT INTO horario_consulta VALUES ('3','Miércoles', '08:00', '14:00', 1);

-- Inserciones de sustituciones
INSERT INTO sustituto VALUES ('1','2023-01-01', '2023-03-01', 2);
INSERT INTO sustituto VALUES ('2','2023-06-01', '2023-09-01', 2);

-- Inserciones de empleados
INSERT INTO empleados VALUES ('1','Luis Martinez', 'Calle Real 456', '555-8765', 'Ciudad', 'Provincia', '12345', '45678912C', 'SS456789', 'ATS');
INSERT INTO empleados VALUES ('2','Marta López', 'Calle Mayor 789', '555-2345', 'Ciudad', 'Provincia', '12345', '98765432D', 'SS987654', 'Administrativo');

-- Inserciones de vacaciones
INSERT INTO vacaciones VALUES ('1','2023-07-01', '2023-07-15', 'Planificadas', 1);
INSERT INTO vacaciones VALUES ('2','2023-08-01', '2023-08-15', 'Disfrutadas', 2);

-- Inserciones de pacientes
INSERT INTO pacientes VALUES ('1','Pedro Jimenez', 'Calle Nueva 123', '555-3456', '12345', '56789012E', 'SS567890', 1);
INSERT INTO pacientes VALUES ('2','Laura Ruiz', 'Avenida Central 456', '555-4567', '12345', '67890123F', 'SS678901', 1);



-- ##### CONSULTAS ##### -- 

-- ## 1 ## -- 
-- Número de pacientes atendidos por cada médico
select m.nombre, COUNT(p.id) as numero_pacientes
from medicos m
left join pacientes p on m.id = p.id_medico
group by m.nombre;

-- ## 2 ## -- 
-- Total de días de vacaciones planificadas y disfrutadas por cada empleado
select e.nombre, 
       SUM(case when v.tipo = 'Planificadas' then v.fecha_fin - v.fecha_inicio else 0 end) as dias_planificadas,
       SUM(case when v.tipo = 'Disfrutadas' then v.fecha_fin - v.fecha_inicio else 0 end) as dias_disfrutadas
from empleados e
left join vacaciones v on e.id = v.id_empleado
group by e.nombre;

-- ## 3 ## -- 
-- Médicos con mayor cantidad de horas de consulta en la semana
select m.nombre, SUM(timestampdiff(second (h.hora_fin - h.hora_inicio))/3600) as horas_semana
from medicos m
left join horario_consulta h on m.id = h.id_medico
group by m.nombre
order by horas_semana desc;

-- ## 4 ## --  
-- Número de sustituciones realizadas por cada médico sustituto
select m.nombre, COUNT(s.id) as numero_sustituciones
from medicos m
left join sustituto s on m.id = s.id_medico
where m.tipo_medico = 'Sustituto'
group by m.nombre;


-- ## 5 ## --  
-- Número de médicos que están actualmente en sustitución
select COUNT(distinct s.id_medico) as numero_medicos_en_sustitucion
from sustituto s
join medicos m on s.id_medico = m.id
where m.tipo_medico = 'Sustituto' and s.fecha_alta > s.fecha_baja;


-- ## 6 ## --  
-- Horas totales de consulta por médico por día de la semana
select m.nombre, h.dia_semana, SUM(timestampdiff(second (h.hora_fin - h.hora_inicio))/3600) as horas_consulta
from medicos m
left join horario_consulta h on m.id = h.id_medico
group by m.nombre, h.dia_semana;


-- ## 7 ## --   
-- Médico con mayor cantidad de pacientes asignados
select m.nombre, COUNT(p.id) as numero_pacientes
from medicos m
left join pacientes p on m.id = p.id_medico
group by m.nombre
order by numero_pacientes desc
limit 1;


-- ## 8 ## --    
-- Empleados con más de 10 días de vacaciones disfrutadas
select e.nombre, SUM(v.fecha_fin - v.fecha_inicio) as dias_disfrutadas
from empleados e
left join vacaciones v on e.id = v.id_empleado
where v.tipo = 'Disfrutadas'
group by e.nombre
having SUM(v.fecha_fin - v.fecha_inicio) > 10;


-- ## 9 ## --    
-- Médicos que actualmente están realizando una sustitución
select distinct m.nombre
from medicos m
join sustituciones s on m.id = s.id_medico
where m.tipo_medico = 'Sustituto' and s.fecha_alta > s.fecha_baja;


-- ## 10 ## --    
-- Promedio de horas de consulta por médico por día de la semana
select m.nombre, h.dia_semana, avg(timestampdiff(second (h.hora_fin - h.hora_inicio))/3600) as promedio_horas
from medicos m
left join horario_consulta h on m.id = h.id_medico
group by m.nombre, h.dia_semana;

