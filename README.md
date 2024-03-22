## STATS SHS PROJECT
 Un projet de Statistiqies S4 de MIASHS


 ## OBSERVATIONS

 ### HOSPITALISATION TABLE
 --DATE_HOSP DOES NOT REPEEAT -> POSSIBLE PRIMARY KEY/ FOREIGN KEY | FALSE
 
--DATA REPEATS 305 times PER DAY -> THREE TUPLES PER DEPARTMENT EVERYDAY
--SEX(0) -> MEN + WOMEN
--SEX(1) -> MEN
--SEX(2) -> WOMEN


### TEMPERATURE TABLE
--TABLE IS MISSING D.O.Ms (Departements Outre Mer)

--DATA REPEATS 96 times PER DAY -> TEMP OF ALL DEPARTMENTS EVERY DAY


## TO-DO
1. Caculate The Hospitalisation rates per the season
FORMULA : (NUM_HOSP/POPU) * STANDARD POP_SIZE (10,000)
-- Summer (
-- Autumn
-- Winter
-- Spring

2. Monthly AVG_HOSP per Department to find out the Department with the MOST HOSPITALISATIONS

TRUE? ~>
<!-- # SELECT
 
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
  # ORDER BY total DESC, NUM_HOSP DESC LIMIT 1000; -->


3. Calculate find out the Correlation Coefficient between the Hospitalisations and Temperatures (-1 : 1)
COLUMNS : T.DATE_TEMP, AVG(T.MEAN_TEMP) AS AVG_MEAN_TEMP, AVG(H.NUM_HOSP) AS AVG_NUM_HOSP

<!-- TO BE DONE IN R -->
<!-- cor(x,y) -->
-- use cor(AVG_MEAN_TEMP, AVG_NUM_HOSP) 

## To Ask
