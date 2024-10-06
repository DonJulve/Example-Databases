-- Equipo que más ligas de primera división ha ganado

-- Calcula los puntos de cada uno de los equipos por temporada
CREATE VIEW Clasificacion (temp, nom_eq, puntos) AS
SELECT  MI_TEMP, NOM_CORTO,
   SUM(CASE WHEN (GOLES_LOCAL > GOLES_VISIT AND EQU_LOCAL = NOM_CORTO) THEN 3
             WHEN (GOLES_LOCAL < GOLES_VISIT AND EQU_VISIT = NOM_CORTO) THEN 3
             WHEN (GOLES_LOCAL = GOLES_VISIT AND 
                  (EQU_LOCAL = NOM_CORTO OR EQU_VISIT = NOM_CORTO)) THEN 1
             ELSE 0 END) AS puntos
FROM Partidos, Jornadas, Equipos, Temporadas
WHERE MI_JOR = ID_JOR AND 
      MI_TEMP = FECHA_INICIO AND 
      MI_DIV = '1'
GROUP BY NOM_CORTO, MI_TEMP

HAVING SUM(CASE WHEN (GOLES_LOCAL > GOLES_VISIT AND EQU_LOCAL = NOM_CORTO) THEN 3
                WHEN (GOLES_LOCAL < GOLES_VISIT AND EQU_VISIT = NOM_CORTO) THEN 3
                WHEN (GOLES_LOCAL = GOLES_VISIT AND 
                     (EQU_LOCAL = NOM_CORTO OR EQU_VISIT = NOM_CORTO)) THEN 1
                ELSE 0 END) > 0
ORDER BY MI_TEMP, puntos DESC;

-- Calcula el equipo que mas ligas ha ganado basandose el la VIEW anterior
SELECT C1.nom_eq AS Equipo, COUNT(*) AS LIGAS_GANADAS
FROM Clasificacion C1, (
    SELECT C2.temp, MAX(C2.puntos) AS puntos_primero
    FROM Clasificacion C2
    GROUP BY C2.temp) C3
WHERE C1.temp = C3.temp AND
      C1.puntos = C3.puntos_primero
GROUP BY C1.nom_eq
ORDER BY COUNT(*) DESC
FETCH FIRST 1 ROWS ONLY;

DROP VIEW Clasificacion;
