load data
 infile './Series.csv'
 into table SERIE
 fields terminated by ";"
 TRAILING NULLCOLS
 (
  ID_SERIE,
  AGNO_INICIAL,
  AGNO_FINAL
  )