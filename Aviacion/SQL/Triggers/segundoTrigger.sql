-- Segundo trigger
-- Comprueba que la fecha fecha de fabricación del avión es anterior a la fecha de salida y de llegada de un vuelo

CREATE OR REPLACE TRIGGER controlFabricación
BEFORE INSERT ON VUELO
FOR EACH ROW
DECLARE
    AGNO NUMBER(4);
BEGIN
    SELECT AGNO_FABRICACION INTO AGNO 
    FROM AVION
    WHERE MATRICULA = :NEW.AVION;

    IF (AGNO > EXTRACT(year FROM :NEW.SALIDA) OR AGNO > EXTRACT(year FROM :NEW.LLEGADA)) THEN
        RAISE_APPLICATION_ERROR(-20000, 'El avión no puede volar antes de su fabricación');
    END IF;
END;
/