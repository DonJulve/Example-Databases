-- Lista de las tres compañías aéreas menos puntuales (calculado en base al porcentaje de vuelos
-- retrasados

SELECT AEROLINEA, NOMBRE
FROM retrasos_aerolineas r1
    INNER JOIN AEROLINEA ON AEROLINEA.CARRIER_CODE = r1.AEROLINEA
WHERE (
    SELECT COUNT(*)
    FROM retrasos_aerolineas r2
    WHERE r2.PORCENTAJE_RETRASOS > r1.PORCENTAJE_RETRASOS
) < 3;
