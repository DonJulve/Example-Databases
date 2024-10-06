OPTIONS (SKIP=1)
load data
 infile './cancelado_v2.csv'
 into table CANCELADO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_INCIDENCIA,
  ID_VUELO
  )