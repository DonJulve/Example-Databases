-- Compruba que no se repita informacion en la tabla de ACTOR, es decir que no haya 2 tuplas iguales
-- con la misma persona interpretando el mismo papel en la misma obra
CREATE OR REPLACE TRIGGER triggerRepeticionPapel
BEFORE INSERT ON ACTOR
FOR EACH ROW
DECLARE 
    existe NUMBER(1);
BEGIN
    SELECT COUNT(*) INTO existe
    FROM ACTOR
    WHERE ID_PERSONA = :NEW.ID_PERSONA AND ID_OBRA = :NEW.ID_OBRA AND PERSONAJE = :NEW.PERSONAJE;
    IF ( existe > 0) THEN
        RAISE_APPLICATION_ERROR(-20000, 'Este actor ya desempeña este papel en esta obra');
    END IF;
END;

DROP TRIGGER triggerRepeticionPapel;