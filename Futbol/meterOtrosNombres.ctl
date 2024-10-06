load data
 infile './tabOtroNombres.csv'
 into table Otros_nombres
 fields terminated by ","
 TRAILING NULLCOLS(
 nom_corto,
 otro_nombre
 )