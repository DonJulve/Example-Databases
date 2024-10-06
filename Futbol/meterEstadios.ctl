load data
 infile './tabEstadios.csv'
 into table Estadios
 fields terminated by ","
 TRAILING NULLCOLS (
 nom_est,
 fecha_inag DECIMAL EXTERNAL(4),
 capacidad DECIMAL EXTERNAL(6)
 )