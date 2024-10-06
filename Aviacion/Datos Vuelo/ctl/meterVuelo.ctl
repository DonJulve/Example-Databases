OPTIONS (SKIP=1)
load data
 infile './vuelo.csv'
 into table VUELO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_VUELO,
  NUMERO,
  SALIDA TIMESTAMP 'DD/MM/YYYY HH24:MI',
  LLEGADA TIMESTAMP 'DD/MM/YYYY HH24:MI',
  ORIGEN,
  DESTINO,
  AVION
  )