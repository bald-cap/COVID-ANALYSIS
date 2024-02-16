library(RMariaDB)
#install.packages("rstudioapi") -> TO BE INSTALLED

password <- rstudioapi::askForPassword("UT2J Password")
connection <- dbConnect(
  drv = RMariaDB::MariaDB(),
  user = "michael-kofi.nyanyui",
  password = password,
  dbname = "23_2L2_michael_kofi_nyanyuie",
  host = "10.10.190.39",
  port = 3306
)

#Exo 1 Etape 2
#Recupere les noms de tous les tables dans ma DB
table_list <- dbListTables(connection)
print(table_list) #DEPARTMENTS, UNIVERSITIES

#Recupere les noms des columns
department_columns <- dbListFields(connection, "DEPARTMENTS")
print(department_columns)

#Recupere les tuples da la table DEPARTMENTS
department_data <- dbReadTable(connection, "DEPARTMENTS")
print(department_data)

#Recupere les données de villes ayant plus de 300 000 habitants
data_snippet <- dbGetQuery(
  connection,
  "SELECT * 
  FROM DEPARTMENTS 
  WHERE Population > 300000"
)
print(data_snippet)

#Exo 2 Etape 2
#Recupere le nombre de UNIVERSITY par DEPARTEMENT
num_uni_department <- dbGetQuery(
  connection,
  "SELECT COUNT(U.SIRET) AS \"NO_UNI_PAR_DEPARTMENT\", D.NOM_DEP, D.POPULATION
  FROM DEPARTMENTS D
  INNER JOIN UNIVERSITIES U
  ON U.ID_DEPARTMENT = D.ID
  GROUP BY D.ID, D.NOM_DEP"
)
print(num_uni_department)

num_uni_department_peuple <- dbGetQuery(
  connection,
  "SELECT COUNT(U.SIRET) AS \"NO_UNI_PAR_DEPARTMENT\" , D.NOM_DEP, D.POPULATION
  FROM DEPARTMENTS D
  INNER JOIN UNIVERSITIES U
  ON U.ID_DEPARTMENT = D.ID
  WHERE D.POPULATION > 300000
  GROUP BY D.ID"
)
print(num_uni_department_peuple)

#Exo 3
#Genere une boxplot
population <- dbGetQuery(
  connection,
  "SELECT D.NOM_DEP, D.POPULATION
  FROM DEPARTMENTS D
  INNER JOIN UNIVERSITIES U
  ON U.ID_DEPARTMENT = D.ID
  GROUP BY D.ID"
)

new_boxplot <- boxplot(
  POPULATION ~ NOM_DEP, # y-axis ~ x-axis
  data = population,
  ylab = "POPULATION",
  xlab = "DEPARTMENTS",
  main = "BOXPLOT DES POPULATIONS DES DEPARTMENTS"
)

#Analyse les données des deux tables
data_analysis <- by(
  INDICES = num_uni_department$NO_UNI_PAR_DEPARTMENT,
  data = num_uni_department$POPULATION,
  FUN = mean
)
print(data_analysis)

dbDisconnect(connection)