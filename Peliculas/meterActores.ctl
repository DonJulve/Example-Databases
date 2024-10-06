load data
 infile './Actores3.csv'
 into table ACTOR
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_ACTOR,
  ID_PERSONA,
  ID_OBRA,
  PERSONAJE
  )