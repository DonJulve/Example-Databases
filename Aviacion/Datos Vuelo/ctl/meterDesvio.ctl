OPTIONS (SKIP=1)
load data
 infile './desvio.csv'
 into table DESVIO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_INCIDENCIA,
  IATA
  )