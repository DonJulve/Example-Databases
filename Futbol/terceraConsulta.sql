-- Número de goles marcados por el Real Zaragoza en cada temporada de liga en la que haya ganado al
-- menos a 4 equipos en ambos partidos de la temporada (ida y vuelta)

-- Calcula todos los equipos a los que el Zaragoza ha ganado como visitante en cada temporada
CREATE VIEW equ_gan_local (temp, nom_eq) AS
    SELECT MI_TEMP, EQU_LOCAL
    FROM PARTIDOS, JORNADAS
    WHERE MI_JOR = ID_JOR AND EQU_VISIT = 'Zaragoza' AND GOLES_LOCAL < GOLES_VISIT
    ORDER BY MI_TEMP ASC;

SELECT temp, nom_eq FROM equ_gan_local;

-- Calcula todos los equipos a los que el Zaragoza ha ganado como local en cada temporada
CREATE VIEW equ_gan_visit (temp, nom_eq) AS
    SELECT MI_TEMP, EQU_VISIT
    FROM PARTIDOS, JORNADAS
    WHERE MI_JOR = ID_JOR AND EQU_LOCAL = 'Zaragoza' AND GOLES_LOCAL > GOLES_VISIT
    ORDER BY MI_TEMP ASC;

--SELECT temp, nom_eq FROM equ_gan_visit;

-- Calcula todos los equipos a los que el Zaragoza ha ganado en ida y vuelta en cada temporada
CREATE VIEW equ_gan_2_veces (temp, nom_eq) AS
    SELECT L.temp, L.nom_eq
    FROM equ_gan_visit V, equ_gan_local L
    WHERE V.nom_eq = L.nom_eq AND V.temp = L.temp
    ORDER BY temp ASC;a
    
    GROUP BY temp
    ORDER BY temp ASC;

--SELECT temp, num_eq FROM tot_eq_gan;

-- Si ha ganado a 4 o mas equipos en una temporada calcula cuantos goles a metido el Zaragoza como equipo local
CREATE VIEW goles_local(temp, num_goles_local) AS
    SELECT MI_TEMP, SUM(GOLES_LOCAL)
    FROM PARTIDOS, JORNADAS, tot_eq_gan
    WHERE MI_JOR = ID_JOR AND MI_TEMP = temp AND EQU_LOCAL = 'Zaragoza'
        AND num_eq >= 4
    GROUP BY MI_TEMP
    ORDER BY MI_TEMP ASC;


-- Si ha ganado a 4 o mas equipos en una temporada calcula cuantos goles a metido el Zaragoza como equipo visitante
CREATE VIEW goles_visit(temp, num_goles_visit) AS
    SELECT MI_TEMP, SUM(GOLES_VISIT)
    FROM PARTIDOS, JORNADAS, tot_eq_gan
    WHERE MI_JOR = ID_JOR AND MI_TEMP = temp AND EQU_VISIT = 'Zaragoza'
        AND num_eq >= 4
    GROUP BY MI_TEMP
    ORDER BY MI_TEMP ASC;

-- Juntamos ambas tablas de goles
SELECT L.temp, SUM(num_goles_local + num_goles_visit) GOLES_TOTALES
FROM goles_local L, goles_visit V
WHERE L.temp = V.temp
GROUP BY L.temp
ORDER BY temp ASC;

-- Eliminar todas las views creadas
DROP VIEW equ_gan_local;
DROP VIEW equ_gan_visit;
DROP VIEW equ_gan_2_veces;
DROP VIEW tot_eq_gan;
DROP VIEW goles_local;
DROP VIEW goles_visit;


