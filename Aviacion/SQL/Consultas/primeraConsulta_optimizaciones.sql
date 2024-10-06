DBCC DROPCLEANBUFFERS

CREATE INDEX idx_vuelo_avion ON VUELO (AVION);
CREATE INDEX idx_retraso_id_vuelo ON RETRASO (ID_VUELO);

CREATE MATERIALIZED VIEW retrasos_aerolineas
REFRESH COMPLETE
AS
SELECT 
    AVION.AEROLINEA,
    COUNT(DISTINCT VUELO.ID_VUELO) AS NUM_VUELOS,
    COUNT(RETRASO.ID_INCIDENCIA) AS NUM_RETRASOS,
    COUNT(RETRASO.ID_INCIDENCIA) / COUNT(DISTINCT VUELO.ID_VUELO) * 100 AS PORCENTAJE_RETRASOS
FROM VUELO
    INNER JOIN AVION ON AVION.MATRICULA = VUELO.AVION
    LEFT JOIN RETRASO ON RETRASO.ID_VUELO = VUELO.ID_VUELO
GROUP BY AVION.AEROLINEA;

CREATE INDEX idx_retrasos_aerolineas_aerolinea ON retrasos_aerolineas(AEROLINEA);
