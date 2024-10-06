OPTIONS (SKIP=1)
load data
 infile './avion.csv'
 into table AVION
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  MATRICULA,
  AEROLINEA,
  AGNO_FABRICACION,
  MODELO
  )