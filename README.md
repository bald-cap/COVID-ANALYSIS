## STATS SHS PROJECT
 Un projet de Statistiqies S4 de MIASHS


 ## OBSERVATIONS

 ### HOSPITALISATION TABLE
 1. DATE_HOSP DOES NOT REPEEAT -> POSSIBLE PRIMARY KEY/ FOREIGN KEY | FALSE
 
2. DATA REPEATS 305 times PER DAY -> THREE TUPLES PER DEPARTMENT EVERYDAY<br>
- SEX(0) -> MEN + WOMEN<br>
- SEX(1) -> MEN<br>
- SEX(2) -> WOMEN<br>

3. HOSPITALISATION RATES | STANDARD POP_SIZE (10,000)<br>
- Summer (June, July, August) - (6, 7, 8)<br>
- Autumn (September, October, November) - (9, 10, 11)<br>
- Winter (December, January, February) - (12, 1, 2)<br>
- Spring (March, April, May) - (3, 4, 5)

<str>CONCLUSION</str> -> <i style= "color :#aca9bb;">Highest rate of Hospitalisations were recorded in Winter and worst were recorded in the Summer.<i><br>

- PARIS Had the most HOSPITALISATIONS<br>
- THE NORTH HAD MORE HOSPITALISATIONS THAN THE SOUTH, FOLLOWED BY THE D.O.Ms

### TEMPERATURE TABLE
1. TABLE IS MISSING D.O.Ms (Departements Outre Mer)

2. DATA REPEATS 96 times PER DAY -> TEMP OF ALL DEPARTMENTS EVERY DAY


## TO-DO
1. Calculate find out the Correlation Coefficient between the Hospitalisations and Temperatures (-1 : 1)<br>
COLUMNS : T.DATE_TEMP, AVG(T.MEAN_TEMP) AS AVG_MEAN_TEMP, AVG(H.NUM_HOSP) AS AVG_NUM_HOSP

<!-- TO BE DONE IN R -->
<!-- cor(x,y) -->
-- use cor(AVG_MEAN_TEMP, AVG_NUM_HOSP)
<p><i> Awaiting conclusion of diagram </i></p>


2. Find the CDD/HDD Index over the 4 years to see if cooling/heating demands rose/fell


## To Ask
1. Best Graph for CDD/HDD Index representation over the 4 years<br>
https://youtu.be/4zV-ZyQHl7s?si=P3MdPMkCBp13KGIS

2. More analysis to do on Hospitalisation itself

