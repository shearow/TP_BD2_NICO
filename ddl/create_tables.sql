CREATE DATABASE trabajo_practico;
USE trabajo_practico;

CREATE TABLE cliente(
cliente_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
dni INT NOT NULL,
sexo CHAR(1) NOT NULL,
empresa VARCHAR(255)
);

CREATE TABLE proyecto(
proyecto_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_proyecto VARCHAR(255) NOT NULL,
cliente_id INT NOT NULL, 
FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id)
);

CREATE TABLE legajo(
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
domicilio VARCHAR(255),
dni INT NOT NULL,
sexo CHAR(1) NOT NULL,
proyecto_id INT NOT NULL,
fecha_ingreso DATETIME NOT NULL,
fecha_egreso DATETIME,
puesto_rol VARCHAR(255),
PRIMARY KEY (dni,sexo,proyecto_id),
FOREIGN KEY (proyecto_id) REFERENCES proyecto (proyecto_id)
);

CREATE TABLE modelo(
tipo int NOT NULL PRIMARY KEY
);

CREATE TABLE asignacion_de_hora(
dni INT NOT NULL,
sexo CHAR(1) NOT NULL,
proyecto_id INT NOT NULL,
modelo_carga_horaria INT NOT NULL,
carga_horaria INT NOT NULL,
fecha DATETIME NOT NULL,
FOREIGN KEY (dni,sexo,proyecto_id) REFERENCES legajo (dni,sexo,proyecto_id), 
FOREIGN KEY (modelo_carga_horaria) REFERENCES modelo (tipo)
);

CREATE TABLE auditoria_liquidacion_mensual(
liquidacion_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(255) NOT NULL,
apellido VARCHAR(255) NOT NULL,
dni INT NOT NULL,
sexo CHAR(1) NOT NULL,
proyecto_id INT NOT NULL,
modelo_carga_horaria INT NOT NULL,
horas_mensuales INT,
fecha_liquidacion DATETIME NOT NULL,
descripcion_extra VARCHAR(255),
FOREIGN KEY (modelo_carga_horaria) REFERENCES asignacion_de_hora (modelo_carga_horaria), 
FOREIGN KEY (dni,sexo,proyecto_id) REFERENCES legajo (dni,sexo,proyecto_id)
);