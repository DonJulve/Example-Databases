load data
 infile './tabJornada.csv'
 into table Jornadas
 fields terminated by ","
 TRAILING NULLCOLS
 (id_jor DECIMAL EXTERNAL(4),
  num_jor DECIMAL EXTERNAL(2),
  mi_temp DECIMAL EXTERNAL(4),
  mi_div CHAR(7)
  )