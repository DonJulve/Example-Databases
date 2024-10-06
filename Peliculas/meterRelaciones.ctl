load data
 infile './Relacion.csv'
 into table RELACION
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_PELICULA,
  ID_RELACIONADA,
  TIPO
  )