library(RMariaDB)

password <- rstudioapi::askForPassword("UT2J Password")
connection <- dbConnect(
  drv = RMariaDB::MariaDB(),
  user = "michael-kofi.nyanyui",
  password = password,
  dbname = "23_2L2_michael_kofi_nyanyuie",
  host = "10.10.190.39",
  port = 3306
)

request <- dbSendQuery(
  connection,
  "SELECT 
    DATE_HOSP AS 'DATES',
    H.DEP_ID, T.DEP_ID,
    T.MEAN_TEMP, 
    NUM_HOSP AS 'NUM OF HOSPITALISATIONS' ,
    total AS 'POPULATION', 
    SEX
  FROM TEMPERATURES T
  RIGHT JOIN HOSPITALISATIONS H
  ON H.DEP_ID = T.DEP_ID AND H.DATE_HOSP = T.DATE_TEMP
  LEFT JOIN PROJET_POPU P
  ON H.DEP_ID = P.codeD
  ORDER BY NUM_HOSP DESC, total DESC, SEX DESC LIMIT 1000;"
)

while (!dbHasCompleted(request)) {
  mini <- dbFetch(request, n = 100)
}

dbClearResult(request)

  # SELECT
  #   DATE_HOSP AS 'DATES',
  #   H.DEP_ID, D.nomD,
  #   NUM_HOSP AS 'NUM OF HOSPITALISATIONS' ,
  #   total AS 'POPULATION',
  #   SEX
  # FROM HOSPITALISATIONS H
  # LEFT JOIN PROJET_POPU P
  #   ON H.DEP_ID = P.codeD
  # LEFT JOIN PROJET_DEP D
  #   ON D.codeD = P.codeD
  # WHERE SEX = 0


# Paris,
# Val-de-Marne,
# Hauts-de-Seine,
# Rhône, Nord,
# Bouches-du-Rhône,
# Seine-Saint-Denis,
# Essonne-> Highest HOSPITALISATIONS
  # ORDER BY NUM_HOSP DESC, total DESC LIMIT 1000;

  
# Nord,
# Paris,
# Bouches-du-Rhône,
# Rhône -> Highest POPULATION
  # ORDER BY total DESC, NUM_HOSP DESC LIMIT 1000;