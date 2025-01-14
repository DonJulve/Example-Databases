-- TODO: fechas y horas varchar o formato nativo?

CREATE TABLE AEROLINEA (
    CARRIER_CODE VARCHAR(6) PRIMARY KEY,
    NOMBRE VARCHAR(150)
);

CREATE TABLE MODELO (
    NOM_MODELO VARCHAR(50) PRIMARY KEY,
    FABRICANTE VARCHAR(50),
    TIPO_MOTOR VARCHAR(50)
);

CREATE TABLE AVION (
    MATRICULA VARCHAR(10) PRIMARY KEY,
    AEROLINEA VARCHAR(6) REFERENCES AEROLINEA(CARRIER_CODE),
    MODELO VARCHAR(50)  REFERENCES MODELO(NOM_MODELO),
    AGNO_FABRICACION NUMBER(4),

    CONSTRAINT CHK_AGNO_FABRICACION CHECK (AGNO_FABRICACION > 1903)
);

CREATE TABLE AEROPUERTO (
    IATA VARCHAR(3) PRIMARY KEY,
    NOMBRE VARCHAR(50),
    CIUDAD VARCHAR(50),
    ESTADO VARCHAR(50)
);

CREATE TABLE VUELO (
    ID_VUELO VARCHAR(15) PRIMARY KEY,
    NUMERO VARCHAR(10),
    AVION VARCHAR(10) REFERENCES AVION(MATRICULA),
    ORIGEN VARCHAR(3) REFERENCES AEROPUERTO(IATA),
    DESTINO VARCHAR(3) REFERENCES AEROPUERTO(IATA),
    SALIDA DATE,
    LLEGADA DATE,

    CONSTRAINT CHK_FECHA CHECK (SALIDA <= LLEGADA),
    CONSTRAINT CHK_AEROPUERTOS_DISTINTOS CHECK (ORIGEN <> DESTINO)
);
SELECT ID_VUELO, EXTRACT(MINUTE FROM CAST(SALIDA AS TIMESTAMP)) FROM VUELO;

CREATE TABLE INCIDENCIA (
    ID_INCIDENCIA VARCHAR(15) PRIMARY KEY,
    ID_VUELO VARCHAR(15) REFERENCES VUELO(ID_VUELO),
    TIPO VARCHAR(50),
    CAUSA VARCHAR(50),
    TIEMPO_RETRASO NUMBER(6),

    CONSTRAINT CHK_TIEMPO_RETRASO CHECK (TIEMPO_RETRASO > 0)
);

CREATE TABLE DESVIO (
    ID_INCIDENCIA VARCHAR(15) REFERENCES INCIDENCIA(ID_INCIDENCIA),
    IATA VARCHAR(3) REFERENCES AEROPUERTO(IATA),

    CONSTRAINT PK_DESVIO PRIMARY KEY (ID_INCIDENCIA, IATA)
);
