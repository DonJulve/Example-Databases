load data
 infile './Películas.csv'
 into table PELICULA
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_PELICULA
  )