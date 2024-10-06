--Listar estadios en los que el local ha ganado o empatado más del 85% de las veces.

-- Calcula el numero de partido que juega cada equipo local
CREATE VIEW par_jug (nom_eq, num_jug) AS
    SELECT EQU_LOCAL, COUNT(*)
    FROM PARTIDOS
    GROUP BY EQU_LOCAL;

/*
SELECT nom_eq, num_jug FROM par_jug
ORDER BY nom_eq ASC;
*/

-- Calcula el numero de partidos que gana cada equipo local
CREATE VIEW par_gan (nom_eq, num_gan) AS
    SELECT EQU_LOCAL, COUNT(*)
    FROM PARTIDOS
    WHERE GOLES_LOCAL > GOLES_VISIT OR GOLES_LOCAL = GOLES_VISIT
    GROUP BY EQU_LOCAL;

/*
SELECT nom_eq, num_gan FROM par_gan
ORDER BY nom_eq ASC;
*/

-- Calcula que equipos han ganado mas del 85% de los partido y muetra el estadio
SELECT DISTINCT EQU_LOCAL, MI_ESTADIO 
FROM PARTIDOS, EQUIPOS, par_gan, par_jug
WHERE EQU_LOCAL = NOM_CORTO AND num_gan > (0.85 * num_jug) AND par_jug.nom_eq = EQU_LOCAL AND par_gan.nom_eq = EQU_LOCAL 
    AND par_jug.nom_eq = par_gan.nom_eq AND NOM_CORTO = par_jug.nom_eq AND NOM_CORTO = par_gan.nom_eq
ORDER BY EQU_LOCAL ASC;

DROP VIEW par_jug;
DROP VIEW par_gan;
