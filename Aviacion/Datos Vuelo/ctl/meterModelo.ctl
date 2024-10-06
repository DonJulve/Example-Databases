OPTIONS (SKIP=1)
load data
 infile './modelo.csv'
 into table MODELO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  NOM_MODELO,
  FABRICANTE,
  TIPO_MOTOR
  )