CREATE OR REPLACE TRIGGER Mismos_equipos
BEFORE INSERT ON Partidos
FOR EACH ROW
DECLARE
filas NUMBER;
BEGIN

SELECT count(*) INTO filas FROM Partidos WHERE :new.equ_local = :new.equ_visit;

if (filas > 0)
then raise_application_error(-20002,
'El equipo visitante y local no pueden ser el mismo');
end if;
END Mismos_equipos;
/