CREATE OR REPLACE TRIGGER Duplicado_partido
BEFORE INSERT ON Partidos
FOR EACH ROW
DECLARE
filas NUMBER;
BEGIN

SELECT count(*) INTO filas FROM Partidos WHERE mi_jor=:new.mi_jor
AND (equ_local = :new.equ_local OR equ_visit = :new.equ_visit OR 
     equ_local = :new.equ_visit OR equ_visit = :new.equ_local);

if (filas > 0)
then raise_application_error(-20002,
'No puedes jugar dos veces una misma jornada');
end if;
END Duplicado_partido;
/
