load data
 infile './tabTemp.csv'
 into table Temporadas
 fields terminated by ","
 TRAILING NULLCOLS(
  fecha_inicio DECIMAL EXTERNAL(4), 
 fecha_fin DECIMAL EXTERNAL(4)
 )
 