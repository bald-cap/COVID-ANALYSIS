
 ### 1. Création des Tables

Le processus a débuté par la création de deux tables principales conçues pour stocker les données pertinentes :

- **Table TEMPERATURES** : Cette table a été établie pour capturer les données de température quotidiennes par département, comprenant les températures minimales, maximales et moyennes.
  - *Commande SQL* :
    ```sql
    CREATE TABLE TEMPERATURES(
        DATE_TEMP DATE,
        DEP_ID VARCHAR(3),
        DEPARTEMENT VARCHAR(50),
        MIN_TEMP DECIMAL(10, 2),
        MAX_TEMP DECIMAL(10, 2),
        MEAN_TEMP DECIMAL(10, 2),
        PRIMARY KEY (DATE_TEMP, DEP_ID)
    );
    ```

- **Table HOSPITALISATIONS** : Créée pour suivre les données sur les visites hospitalières par département et par date, comprenant le nombre d'hospitalisations et des résultats spécifiques tels que les soins intensifs et les décès.
  - *Commande SQL* :
    ```sql
    CREATE TABLE HOSPITALISATIONS(
        DEP_ID VARCHAR(3),
        SEX INT,
        DATE_HOSP DATE,
        NUM_HOSP INT,
        NUM_INTENSE_CARE INT,
        NUM_CONV_HOSP INT,
        NUM_SSR_USLD INT,
        NUM_OTHERS INT,
        NUM_RETURN_HOME INT,
        NUM_DEATHS INT,
        PRIMARY KEY (DEP_ID, DATE_HOSP, SEX)
    );
    ```

### 2. Importation des Données dans les Tables

Une fois les tables créées, les données ont été importées à partir de fichiers CSV segmentés :

- *Segmentation et Importation* : Le jeu de données original a été divisé en morceaux gérables pour faciliter le traitement efficace. Chaque type de données (TEMPERATURES et HOSPITALISATIONS) a été divisé en au moins cinq fichiers CSV, chacun contenant environ 20 000 enregistrements.
  - *Processus d'Importation* : Les données de ces fichiers ont été importées dans les tables respectives, en veillant à ce que tous les enregistrements soient correctement positionnés pour un traitement et une analyse ultérieurs.
### 3. Ajout des Clés Étrangères

Après avoir rempli les tables avec des données, des contraintes de clé étrangère ont été ajoutées pour assurer l'intégrité des données et la cohérence relationnelle :

- *Contraintes de Clé Étrangère* :
  - *TEMPERATURES* :
    ```sql
    ALTER TABLE TEMPERATURES ADD CONSTRAINT temp_depID_fk FOREIGN KEY (DEP_ID) REFERENCES PROJET_DEP(codeD);
    ```
  
  - *HOSPITALISATIONS* :
    ```sql
    ALTER TABLE HOSPITALISATIONS ADD CONSTRAINT hosp_depID_fk FOREIGN KEY (DEP_ID) REFERENCES PROJET_DEP(codeD);
    ```
