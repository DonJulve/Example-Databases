load data
 infile './tabDiv.csv'
 into table Divisiones
 TRAILING NULLCOLS(
 den_oficial CHAR(7)
 )