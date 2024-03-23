## STATS SHS PROJECT
 Un projet de Statistiqies S4 de MIASHS


 ## OBSERVATIONS

 ### HOSPITALISATION TABLE
 1. DATE_HOSP DOES NOT REPEEAT -> POSSIBLE PRIMARY KEY/ FOREIGN KEY | FALSE
 
2. DATA REPEATS 305 times PER DAY -> THREE TUPLES PER DEPARTMENT EVERYDAY
- SEX(0) -> MEN + WOMEN
- SEX(1) -> MEN
- SEX(2) -> WOMEN

3. HOSPITALISATION RATES | STANDARD POP_SIZE (10,000)
- Summer (June, July, August) - (6, 7, 8)
- Autumn (September, October, November) - (9, 10, 11)
- Winter (December, January, February) - (12, 1, 2)
- Spring (March, April, May) - (3, 4, 5)

- <strong>CONCLUSION</strong> -> <i >Highest rate of Hospitalisations were recorded in Winter and worst were recorded in the Summer.</i>

- PARIS Had the most HOSPITALISATIONS
- THE NORTH HAD MORE HOSPITALISATIONS THAN THE SOUTH, FOLLOWED BY THE D.O.Ms

### TEMPERATURE TABLE
1. TABLE IS MISSING D.O.Ms (Departements Outre Mer)

2. DATA REPEATS 96 times PER DAY -> TEMP OF ALL DEPARTMENTS EVERY DAY

3. IN GENERAL THERE WAS A GREAT NEED FOR HEATING THAN THERE WAS FOR COOLING PER THE CDD/HDD INDEXES (CDDs in each year was far greater than their respective HDDs)
- Except in 2021 where they both get closer


## TO-DO
1. TEMP LEVELS IN THE NORTH IN CORRELATION TO THE HOSPITALISATIONS IN THE SOUTH

### DONE BUT NOT PLOTTED
- Correlation Coefficient between TEMP and HOSP

- CDD/HDD over the 4 years

## To Ask
1. More analysis to do on Hospitalisation itself
