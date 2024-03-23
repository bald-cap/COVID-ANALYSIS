library(RMariaDB)
library(ggplot2) # Ensure ggplot2 is loaded

password <- rstudioapi::askForPassword("UT2J Password")
connection <- dbConnect(
  drv = RMariaDB::MariaDB(),
  user = "michael-kofi.nyanyui",
  password = password,
  dbname = "23_2L2_michael_kofi_nyanyuie",
  host = "10.10.190.39",
  port = 3306
)

# CORRELATION COEFFICIENT BETWEEN  TEMPERATURES AND HOSPITALISATIONS
temps_hosp_data <- dbSendQuery(
  connection,
  "SELECT MEAN_TEMP, NUM_HOSP
  FROM TEMPERATURES T
  RIGHT JOIN HOSPITALISATIONS H
      ON H.DEP_ID = T.DEP_ID AND H.DATE_HOSP = T.DATE_TEMP
  WHERE SEX = 0 AND T.DEP_ID IS NOT NULL AND H.DATE_HOSP IS NOT NULL
  GROUP BY DATE_TEMP
  ORDER BY DATE_TEMP ASC"
)

cor_hosp_temp <- cor(
  temps_hosp_data$MEAN_TEMP,
  temps_hosp_data$NUM_HOSP
)

plot(
  temps_hosp_data$MEAN_TEMP,
  temps_hosp_data$NUM_HOSP,
  main = "SCATTER PLOT OF TEMP VS HOSPITALISATION",
  xlab = "AVERAGE TEMPERAUTRES",
  ylab = "HOSPITALISATIONS",
  pch = 20
)

model <- lm(temps_hosp_data$MEAN_TEMP ~ temps_hosp_data$NUM_HOSP)
ablin(model, col = "#068488")


hosp_data <- dbGetQuery(connection,
  "SELECT
    DATE_HOSP AS 'DATES',
    H.DEP_ID, D.nomD,
    AVG(NUM_HOSP) AS 'AVG_HOSPITALISATIONS',
    total AS 'POPULATION',
    SEX
  FROM HOSPITALISATIONS H
  LEFT JOIN PROJET_POPU P ON H.DEP_ID = P.codeD
  LEFT JOIN PROJET_DEP D ON D.codeD = P.codeD
  WHERE SEX = 0
  GROUP BY H.DEP_ID, DATE_HOSP
  ORDER BY H.DEP_ID, DATE_HOSP;"
)

hosp_data$DATES <- as.Date(
  hosp_data$DATES,
  format = "%Y-%m-%d"
)

hosp_data$month <- format(hosp_data$DATES, "%Y-%m")
monthly_aggregate <- aggregate(
  AVG_HOSPITALISATIONS ~ month,
  data = hosp_data,
  FUN = mean
)

# barplot(
#   height = monthly_aggregate$AVG_HOSPITALISATIONS,
#   names.arg = monthly_aggregate$month,
#   las = 2, # Makes the month labels vertical
#   main = "Average Hospitalisations Per Month",
#   xlab = "Month",
#   ylab = "Average Hospitalisations",
#   col = "blue"
# )