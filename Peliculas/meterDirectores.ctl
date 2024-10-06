load data
 infile './Directores3.csv'
 into table DIRECTOR
 fields terminated by ";"
 TRAILING NULLCOLS
 (ID_DIRECTOR,
  ID_PERSONA,
  ID_OBRA
  )