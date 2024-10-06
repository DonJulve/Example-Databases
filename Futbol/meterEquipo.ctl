load data
 infile './TabEquipo.csv'
 into table Equipos
 fields terminated by ","
 TRAILING NULLCOLS(
 nom_corto,
 nom_oficial,
 ciudad,
 fecha_fund DECIMAL EXTERNAL(4),
 nom_his,
 mi_estadio
 )