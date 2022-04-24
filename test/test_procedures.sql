USE trabajo_practico;

/** Procedure insertar liquidacion **/
CALL insertar_liquidacion(123,'m',1);

/** Procedure modificar liquidacion **/
CALL modificar_liquidacion(123,'m',1,2022,4,200);

SELECT * FROM auditoria_liquidacion_mensual;