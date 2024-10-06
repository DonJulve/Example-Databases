OPTIONS (SKIP=1)
load data
 infile './desvio_v2.csv'
 into table DESVIO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_INCIDENCIA,
  ID_VUELO,
  IATA
  )