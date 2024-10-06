-- Obtener el número de personajes distintos que han sido interpretados por al menos cuatro actores o actrices
-- distintos y que aparecen en películas de alguna saga (es decir, que son secuelas/precuelas unas de otras).

-- -- from
-- CREATE OR REPLACE VIEW v_personajes AS
-- SELECT ACTOR.PERSONAJE, ACTOR.ID_PERSONA, PELICULA.ID_PELICULA, RELACION.ID_RELACIONADA
-- FROM PELICULA, RELACION, ACTOR
-- WHERE 
--     PELICULA.ID_PELICULA = RELACION.ID_PELICULA AND
--     PELICULA.ID_PELICULA = ACTOR.ID_OBRA AND
--     (RELACION.TIPO = 'follows' OR RELACION.TIPO = 'followed by')
-- GROUP BY ACTOR.PERSONAJE, ACTOR.ID_PERSONA, PELICULA.ID_PELICULA, RELACION.ID_RELACIONADA;

CREATE OR REPLACE VIEW v_personajes AS
SELECT ACTOR.PERSONAJE, ACTOR.ID_PERSONA, PELICULA.ID_PELICULA, RELACION.ID_RELACIONADA
FROM PELICULA
    INNER JOIN RELACION  ON PELICULA.ID_PELICULA = RELACION.ID_PELICULA
    INNER JOIN ACTOR ON PELICULA.ID_PELICULA = ACTOR.ID_OBRA
WHERE (RELACION.TIPO = 'follows' OR RELACION.TIPO = 'followed by')
GROUP BY ACTOR.PERSONAJE, ACTOR.ID_PERSONA, PELICULA.ID_PELICULA, RELACION.ID_RELACIONADA;

-- consulta final
SELECT COUNT(COUNT(1)) AS NUM_ACTORES
FROM v_personajes
WHERE PERSONAJE IS NOT NULL
GROUP BY PERSONAJE
HAVING COUNT(DISTINCT ID_PERSONA) >= 4;