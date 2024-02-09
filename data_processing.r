library(RMariaDB)
#install.packages("rstudioapi") -> TO BE INSTALLED

password <- rstudioapi::askForPassword("knuMANJwJYSM2Nd1")
connection <- dbConnect(
  drv = RMariaDB::MariaDB(),
  user = "michael-kofi.nyanyui",
  password = password,
  dbname = "23_2L2_michael_kofi_nyanyuie",
  host = "10.10.190.39",
  port = 3306
)


#Exo 4.2
#Recupere les noms de tous les tables dans ma DB
table_list <- dbListTables(connection)

#Recupere les noms des columns
department_columns <- dbListFields(connection, "DEPARTMENTS")

#Recupere les tuples da la table DEPARTMENTS
department_data <- dbReadTable(connection, "DEPARTMENTS")

#Recupere les données de villes ayant plus de 300 000 habitants
data_snippet <- dbGetQuery(connection, "SELECT * 
  FROM DEPARTMENTS 
  WHERE Population > 300000"
)

dbClearResult(data_snippet)
