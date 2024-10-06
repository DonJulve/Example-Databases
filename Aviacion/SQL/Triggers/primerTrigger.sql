--Primer trigger
-- Comprueba si los dos desvios que tiene un avion no son al mismo aeropuerto

CREATE OR REPLACE TRIGGER ControlDesvio
BEFORE INSERT ON DESVIO
FOR EACH ROW
DECLARE
    count_exist NUMBER;
BEGIN
    -- Verificar si ya existe una combinación de ID_VUELO y IATA en la tabla DESVIO
    SELECT COUNT(*) INTO count_exist
    FROM DESVIO
    WHERE ID_VUELO = :NEW.ID_VUELO AND IATA = :NEW.IATA;
    
    -- Si existe, generar un error y cancelar la inserción
    IF count_exist > 0 THEN
        raise_application_error(-20000, 'Ya existe una desviacion para este vuelo y aeropuerto de destino');
    END IF;
END;
/
