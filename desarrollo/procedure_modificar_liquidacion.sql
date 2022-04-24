USE trabajo_practico;

/** Creación Procedure para modificar las liquidaciones **/
delimiter $$
CREATE PROCEDURE modificar_liquidacion(IN p_dni INT,IN p_sexo CHAR(1),IN p_proyecto_id INT,IN p_anio INT,IN p_mes INT,IN p_horas_mensuales INT)
BEGIN
if (SELECT COUNT(*)
   FROM auditoria_liquidacion_mensual au
   WHERE au.dni=p_dni AND au.sexo=p_sexo AND au.proyecto_id=p_proyecto_id 
	AND YEAR(au.fecha_liquidacion) = p_anio AND MONTH(au.fecha_liquidacion) = p_mes) > 0 then
   
   INSERT INTO auditoria_liquidacion_mensual(nombre,apellido,dni,sexo,proyecto_id,modelo_carga_horaria,horas_mensuales,fecha_liquidacion,descripcion_extra)
   SELECT au.nombre, au.apellido, au.dni, au.sexo, au.proyecto_id, au.modelo_carga_horaria, p_horas_mensuales - sum(au.horas_mensuales),max(au.fecha_liquidacion),CONCAT('MODIFICADO ',CAST(NOW() AS CHAR))
   FROM auditoria_liquidacion_mensual au
	WHERE au.dni=p_dni AND au.sexo=p_sexo AND au.proyecto_id=p_proyecto_id  
   GROUP BY au.nombre,au.apellido,au.dni,au.sexo,au.proyecto_id,au.modelo_carga_horaria;  
ELSE
   SELECT 'ERROR!!! (VALORES INCORRECTOS O INVÁLIDOS AL MODIFICAR LA LIQUIDACIÓN).' AS 'ERROR';
END IF;
END
$$