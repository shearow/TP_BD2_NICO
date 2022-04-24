USE trabajo_practico;

/** Creación Procedure para insertar las liquidacion **/
delimiter $$
CREATE PROCEDURE insertar_liquidacion(IN p_dni INT,IN p_sexo CHAR(1),IN p_proyecto_id INT)
BEGIN
if(SELECT COUNT(*)
    FROM legajo l
         INNER JOIN asignacion_de_hora ah ON ah.dni=l.dni AND ah.sexo=l.sexo AND ah.proyecto_id=l.proyecto_id
    WHERE l.dni = p_dni AND l.sexo = p_sexo AND l.proyecto_id = p_proyecto_id
  ) > 0 then 
  
  INSERT INTO auditoria_liquidacion_mensual(nombre,apellido,dni,sexo,proyecto_id,modelo_carga_horaria,horas_mensuales,fecha_liquidacion,descripcion_extra)
  SELECT l.nombre, l.apellido, l.dni, l.sexo, l.proyecto_id, ah.modelo_carga_horaria, sum(ah.carga_horaria), NOW(),'Nueva liquidación'
  FROM legajo l
           INNER JOIN asignacion_de_hora ah ON ah.dni=l.dni AND ah.sexo=l.sexo AND ah.proyecto_id=l.proyecto_id
  WHERE l.dni=p_dni AND l.sexo=p_sexo AND l.proyecto_id=p_proyecto_id
  GROUP BY l.nombre, l.apellido, l.dni, l.sexo, l.proyecto_id, ah.modelo_carga_horaria;
             
ELSE 
    SELECT 'ERROR!!! (VALORES INCORRECTOS O INVÁLIDOS AL INSERTAR LA LIQUIDACIÓN).' AS 'ERROR';
END IF;
END
$$