load data
 infile './Staff3.csv'
 into table OTRO_ROL
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_ROL,
  ID_PERSONA,
  ID_OBRA,
  ROL
  )