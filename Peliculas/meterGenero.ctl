load data
 infile './genero2.csv'
 into table GENERO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_OBRA,
  NOMBRE
  )