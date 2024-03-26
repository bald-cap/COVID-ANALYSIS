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

- <strong>CONCLUSION</strong> -> <i>Highest rate of Hospitalisations were recorded in Winter(2.364) and least were recorded in the Summer(0.660) over the 4 years.</i>

- PARIS Had the most HOSPITALISATIONS
- THE NORTH HAD MORE HOSPITALISATIONS THAN THE SOUTH, FOLLOWED BY THE D.O.Ms

4. OUTSIDE THE COVID PERIOD -> MORE CASES WERE RECORDED IN SPRING(2.393) AND THE LEAST IN AUTUMN(0.653)
- DURING THE COVID PERIOD -> MORE CASES WERE RECORDED IN WINTER(2.393) AND THE LEAST IN SUMMER(0.519)

### TEMPERATURE TABLE
1. TABLE IS MISSING D.O.Ms (Departements Outre Mer)

2. DATA REPEATS 96 times PER DAY -> TEMP OF ALL DEPARTMENTS EVERY DAY

3. IN GENERAL THERE WAS A GREAT NEED FOR HEATING THAN THERE WAS FOR COOLING PER THE CDD/HDD INDEXES (CDDs in each year was far greater than their respective HDDs)
- Except in 2021 where they both get closer

## TO-DO
1. TEMP LEVELS IN THE NORTH IN CORRELATION TO THE HOSPITALISATIONS IN THE SOUTH

2. Calculate the linear regression between temperature and hospitalisation.
- Draw your scatter plot with your correlation coefficient and your linear gradient.

3. Calculate the linear regression between intense care and deaths.
- Draw your scatter plot with your correlation coefficient and your linear gradient.

4. P values to know if it happened by coincidence.
- Alpha level
- Critical Value Bar number
- Confidence Interval

### DONE BUT NOT PLOTTED
- Correlation Coefficient between TEMP and HOSP

- CDD/HDD over the 4 years

- Calculate CDD/HDD in the Winter period to support your Correlation Coefficient analysis



## To Ask