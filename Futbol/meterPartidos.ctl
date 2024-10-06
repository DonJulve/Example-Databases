load data
 infile './tabPartidos.csv'
 into table Partidos
 fields terminated by ","
 TRAILING NULLCOLS (
  id_par DECIMAL EXTERNAL(5),
  equ_local,
  equ_visit,
  goles_local DECIMAL EXTERNAL(2),
  goles_visit DECIMAL EXTERNAL(2),
  mi_jor DECIMAL EXTERNAL(4)
  )