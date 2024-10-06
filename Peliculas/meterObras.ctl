load data
 infile './Obras.csv'
 into table OBRA
 fields terminated by ";"
 TRAILING NULLCOLS
 (ID_OBRA,
  TITULO,
  AGNO
  )