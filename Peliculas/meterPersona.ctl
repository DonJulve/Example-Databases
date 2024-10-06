load data
 infile './Personas.csv'
 into table PERSONA
 fields terminated by ";"
 TRAILING NULLCOLS
 (ID_PERSONA,
  NOMBRE,
  SEXO
  )