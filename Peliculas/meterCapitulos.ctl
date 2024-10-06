load data
 infile './Capitulos.csv'
 into table CAPITULO
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_CAPITULO,
  TEMPORADA,
  NUMERO,
  NOMBRE,
  ID_SERIE
  )