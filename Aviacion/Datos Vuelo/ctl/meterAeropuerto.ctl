OPTIONS (SKIP=1)
load data
 infile './aeropuerto.csv'
 into table AEROPUERTO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  IATA,
  NOMBRE,
  CIUDAD,
  ESTADO
  )