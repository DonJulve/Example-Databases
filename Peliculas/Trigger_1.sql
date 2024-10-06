-- no puede haber un capitulo igual temporada y numero
CREATE OR REPLACE TRIGGER TR_ADD_CAP
BEFORE INSERT ON CAPITULO
FOR EACH ROW
DECLARE
    existe NUMBER;
BEGIN
    SELECT COUNT(*) INTO existe FROM CAPITULO WHERE NUMERO = :NEW.NUMERO AND TEMPORADA = :NEW.TEMPORADA AND ID_SERIE = :NEW.ID_SERIE;

    IF existe > 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Ya existe un capitulo con ese numero y temporada en la obra');
    END IF;
END;
/