OPTIONS (SKIP=1)
load data
 infile './aerolinea.csv'
 into table AEROLINEA
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  CARRIER_CODE,
  NOMBRE
  )