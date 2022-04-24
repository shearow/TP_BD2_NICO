USE trabajo_practico;

/** Cargando cliente **/
INSERT INTO cliente (nombre,apellido,dni,sexo,empresa) VALUES('Susana','Gimenez',123123,'f',NULL);
INSERT INTO cliente (nombre,apellido,dni,sexo,empresa) VALUES('Luis','Massi',9876,'m','Sofffftwaaaare');

/** Cargando proyecto **/
INSERT INTO proyecto (nombre_proyecto,cliente_id) VALUES ('UCES proyect',1);
INSERT INTO proyecto (nombre_proyecto,cliente_id) VALUES ('Proyecto El Proyecto',1);
INSERT INTO proyecto (nombre_proyecto,cliente_id) VALUES ('Fin del mundo',2);

/** Cargando legajo **/
INSERT INTO legajo (nombre,apellido,domicilio,dni,sexo,proyecto_id,fecha_ingreso,fecha_egreso,puesto_rol) VALUES ('Marcelo','Conocelo','Calle falsa 123',123,'m',1,NOW(),NULL,'Tester');
INSERT INTO legajo (nombre,apellido,domicilio,dni,sexo,proyecto_id,fecha_ingreso,fecha_egreso,puesto_rol) VALUES ('Marcelo','Conocelo','Calle falsa 123',123,'m',2,NOW(),NULL,'Desarrollador');
INSERT INTO legajo (nombre,apellido,domicilio,dni,sexo,proyecto_id,fecha_ingreso,fecha_egreso,puesto_rol) VALUES ('Mario','Bros','Calle test 321',123321,'m',1,NOW(),NULL,'Bot');
INSERT INTO legajo (nombre,apellido,domicilio,dni,sexo,proyecto_id,fecha_ingreso,fecha_egreso,puesto_rol) VALUES ('Paula','Tosa','Calle tano 123',159,'f',2,NOW(),NULL,'Constructora');

/** Cargando modelo **/
INSERT INTO modelo (tipo) VALUES (1),(7),(30);

/** Cargando asignacion_de_hora **/
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (123,'m',1,1,5,'2022-04-05 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (123,'m',1,1,8,'2022-04-06 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horario,carga_horaria,fecha) VALUES (123,'m',1,1,10,'2022-05-06 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horario,carga_horaria,fecha) VALUES (123,'m',1,1,10,'2022-05-10 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horario,carga_horaria,fecha) VALUES (123,'m',1,1,10,'2022-05-31 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (123,'m',2,30,153,'1990-03-01 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (123,'m',2,30,153,'1990-04-01 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (123321,'m',1,7,45,'2022-01-7 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (123321,'m',1,7,30,'2022-01-14 00:00:01');
INSERT INTO asignacion_de_hora(dni,sexo,proyecto_id,modelo_carga_horaria,carga_horaria,fecha) VALUES (159,'f',2,1,6,NOW());

SELECT * FROM cliente;
SELECT * FROM proyecto;
SELECT * FROM legajo;
SELECT * FROM modelo;
SELECT * FROM asignacion_de_hora;