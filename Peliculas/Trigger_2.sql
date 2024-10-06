-- borra persona si no esta en actor, director, otro rol
CREATE OR REPLACE TRIGGER TR_ACTOR_DEL_PERSONA
AFTER DELETE ON ACTOR
FOR EACH ROW
DECLARE
  actor_count NUMBER;
  director_count NUMBER;
  otro_rol_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO actor_count FROM ACTOR WHERE ID_PERSONA = :OLD.ID_PERSONA;
    SELECT COUNT(*) INTO director_count FROM DIRECTOR WHERE ID_PERSONA = :OLD.ID_PERSONA;
    SELECT COUNT(*) INTO otro_rol_count FROM OTRO_ROL WHERE ID_PERSONA = :OLD.ID_PERSONA;
    
    IF actor_count = 0 AND director_count = 0 AND otro_rol_count = 0 THEN
        DELETE FROM PERSONA WHERE ID_PERSONA = :OLD.ID_PERSONA;
    END IF;
END;
/

