-- Listar el título de las películas de género familiar que sólo han sido interpretadas por actrices

-- -- from
-- CREATE OR REPLACE VIEW v_n_actores AS
-- SELECT OBRA.TITULO, GENERO.NOMBRE, 
--     -- contamos el número de actores de cada sexo
--     COUNT(CASE WHEN PERSONA.SEXO = 'f' THEN 1 END) AS NUM_ACT_FEM,
--     COUNT(CASE WHEN PERSONA.SEXO = 'm' THEN 1 END) AS NUM_ACT_MASC
-- FROM PELICULA, OBRA, ACTOR, PERSONA, GENERO
-- WHERE
--     PELICULA.ID_PELICULA = OBRA.ID_OBRA AND
--     PELICULA.ID_PELICULA = ACTOR.ID_OBRA AND
--     ACTOR.ID_PERSONA = PERSONA.ID_PERSONA AND
--     OBRA.ID_OBRA = GENERO.ID_OBRA
-- GROUP BY OBRA.TITULO, GENERO.NOMBRE;


-- inner join
CREATE OR REPLACE VIEW v_n_actores AS
SELECT OBRA.TITULO, GENERO.NOMBRE,
    -- contamos el número de actores de cada sexo
    COUNT(CASE WHEN PERSONA.SEXO = 'M' THEN 1 END) AS NUM_ACT_MASC,
FROM PELICULA
    INNER JOIN OBRA ON PELICULA.ID_PELICULA = OBRA.ID_OBRA
    INNER JOIN ACTOR ON PELICULA.ID_PELICULA = ACTOR.ID_OBRA
    INNER JOIN PERSONA ON ACTOR.ID_PERSONA = PERSONA.ID_PERSONA
    INNER JOIN GENERO ON PELICULA.ID_PELICULA = GENERO.ID_OBRA
GROUP BY OBRA.TITULO, GENERO.NOMBRE;

-- query final
SELECT TITULO FROM v_n_actores
WHERE NUM_ACT_MASC = 0 AND NOMBRE = 'family';