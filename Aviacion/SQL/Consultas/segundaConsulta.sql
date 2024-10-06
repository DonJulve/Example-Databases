-- Lista los fabricantes, modelos y motores en los que el número de vuelos retrasados por motivos de
-- seguridad sea mayor del 1 por ciento de su total de retrasos.


--INDICES
-- CREATE INDEX idx_retraso_causa ON RETRASO (CAUSA);
-- CREATE INDEX idx_vuelo_id_vuelo ON VUELO (ID_VUELO);
-- CREATE INDEX idx_avion_matricula ON AVION (MATRICULA);



--MATERIALIZED VIEW
-- CREATE MATERIALIZED VIEW ret_seguridad_mv AS
-- SELECT 
--     AVION.MODELO, 
--     SUM(CASE WHEN RETRASO.CAUSA = 'Security' THEN 1 ELSE 0 END) / COUNT (*) AS POR_SEG
-- FROM RETRASO
--     INNER JOIN VUELO ON RETRASO.ID_VUELO = VUELO.ID_VUELO
--     INNER JOIN AVION ON AVION.MATRICULA = VUELO.AVION
-- WHERE AVION.MODELO <> 'no model'
-- GROUP BY AVION.MODELO;

-- SELECT 
--     ROUND(POR_SEG * 100, 2) AS "%",
--     MODELO.NOM_MODELO,
--     MODELO.FABRICANTE,
--     MODELO.TIPO_MOTOR
-- FROM ret_seguridad_mv
--     INNER JOIN MODELO ON MODELO.NOM_MODELO = ret_seguridad_mv.MODELO
-- WHERE POR_SEG > 0.01
-- ORDER BY "%" DESC;


--Sin optimizar
WITH RET_SEGURIDAD AS (
    SELECT 
        AVION.MODELO, 
        SUM(CASE WHEN RETRASO.CAUSA = 'Security' THEN 1 ELSE 0 END) / COUNT(*) AS POR_SEG
    FROM RETRASO
        INNER JOIN VUELO ON RETRASO.ID_VUELO = VUELO.ID_VUELO
        INNER JOIN AVION ON AVION.MATRICULA = VUELO.AVION
    WHERE AVION.MODELO <> 'no model'
    GROUP BY AVION.MODELO
)
SELECT 
    ROUND(RET_SEGURIDAD.POR_SEG * 100, 2) AS "%",
    MODELO.NOM_MODELO,
    MODELO.FABRICANTE,
    MODELO.TIPO_MOTOR
FROM RET_SEGURIDAD
    INNER JOIN MODELO ON MODELO.NOM_MODELO = RET_SEGURIDAD.MODELO
WHERE POR_SEG > 0.01
ORDER BY "%" DESC;




