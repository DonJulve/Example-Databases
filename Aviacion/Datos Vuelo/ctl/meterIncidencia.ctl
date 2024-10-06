OPTIONS (SKIP=1)
load data
 infile './incidencia.csv'
 into table INCIDENCIA
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_INCIDENCIA,
  ID_VUELO,
  TIPO,
  CAUSA,
  TIEMPO_RETRASO
  )