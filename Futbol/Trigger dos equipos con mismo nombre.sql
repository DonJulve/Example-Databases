CREATE OR REPLACE TRIGGER Duplicado_nombre
BEFORE INSERT ON Equipos
FOR EACH ROW
DECLARE
filas NUMBER;
BEGIN

SELECT count(*) INTO filas FROM Equipos WHERE nom_oficial=:new.nom_oficial;

if (filas > 0)
then raise_application_error(-20002,
'Dos equipos no pueden tener el mismo nombre oficial');
end if;
END Duplicado_nombre;
/