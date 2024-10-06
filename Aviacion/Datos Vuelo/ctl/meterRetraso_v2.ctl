OPTIONS (SKIP=1)
load data
 infile './retraso_v2.csv'
 into table RETRASO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
    ID_INCIDENCIA,
    ID_VUELO,
    CAUSA,
    TIEMPO_RETRASO
  )