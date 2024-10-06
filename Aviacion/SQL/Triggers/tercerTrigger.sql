-- Tercer trigger
-- Comprueba que la fecha de salida de un vuelo es anterior de la fecha de llegada

CREATE OR REPLACE TRIGGER ControlFechas
BEFORE INSERT ON VUELO
FOR EACH ROW
BEGIN

    IF :NEW.SALIDA > :NEW.LLEGADA THEN
         RAISE_APPLICATION_ERROR(-20000, 'La fecha de salida tiene que ser anterior a la de llegada');
    END IF;
END;
/

DROP TRIGGER ControlFechas;