## STATS SHS PROJECT
 Un projet de Statistiqies S4 de MIASHS realisé par:
 
 - Michael Kofi NYANYUIE
 - Divin IZERE
 - Lucky Bernice
 - Medhi
 - Rayane

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
- Draw your .

3. Calculate the linear regression between intense care and deaths.

4. P values to know if it happened by coincidence.

- Critical Value Bar number
- Confidence Interval

#### COVID ANALYSIS 

5. Dominant age groups in the intensive care unit

6. Dominant ages groups that died

7. Are the dominant age groups that are in the intensive care unit those that died?
- Represent it on a histogram where the each year group has a bar for intensive care and another for deaths. 
eg. of conclusion -> you can conclude by saying that even though more younger were hospitalised the number of dates are higher within the aged group

8. Regional Distribution -> Did the coldest areas in France have the highest Hospitalisations ?
- Group Temp by Regions - Heat map
- Group Hosp by Regions - Heat map

And compare the 2 maps and conclude


### DONE BUT NOT PLOTTED
- Correlation Coefficient between TEMP and HOSP

- CDD/HDD over the 4 years

- Calculate CDD/HDD in the Winter period to support your Correlation Coefficient analysis

- Alpha level - INTENSE CARE AND DEATHS

- Scatter plot with your correlation coefficient and your linear gradient

- Scatter plot with your correlation coefficient and your linear gradient

## To Ask