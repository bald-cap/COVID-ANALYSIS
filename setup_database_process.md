

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

 ### 3. Nettoyage des Données

"Avant d'appliquer les contraintes relationnelles, il était essentiel de standardiser et nettoyer les données pour garantir la cohérence entre les tables :

- *Standardisation des Identifiants de Département* :
  - Les champs DEP_ID des tables TEMPERATURES et HOSPITALISATIONS ont été ajustés pour correspondre au format de PROJET_DEP. Cela impliquait la suppression des zéros non significatifs qui pourraient causer des incohérences lors des jointures de données.
  - *Commandes SQL pour le Nettoyage* :
    ```sql
    UPDATE TEMPERATURES SET DEP_ID = SUBSTRING(DEP_ID, 2) WHERE DEP_ID LIKE '0%';
    UPDATE HOSPITALISATIONS SET DEP_ID = SUBSTRING(DEP_ID, 2) WHERE DEP_ID LIKE '0%';
    ```
### 4. Ajout des Clés Étrangères

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
### 5. Filtrage des Données Inutiles

La dernière étape consistait à supprimer les données qui n'étaient pas nécessaires pour l'analyse :

- *Suppression des Années Spécifiques* :
  - Les données au-delà de 2021 ont été jugées non pertinentes pour l'analyse et ont été supprimées des deux tables.
  - *Commandes SQL pour la Suppression des Données* :
    sql
    DELETE FROM TEMPERATURES WHERE DATE_TEMP LIKE '2022-%' OR DATE_TEMP LIKE '2023-%' OR DATE_TEMP LIKE '2024-%';

    DELETE FROM HOSPITALISATIONS WHERE DATE_HOSP LIKE '2022-%' OR DATE_HOSP LIKE '2023-%';
    

- *Suppression de Catégories de Sexe Spécifiques* :
  - Les entrées pour les sexes masculin et féminin ont été supprimées de la table HOSPITALISATIONS pour se concentrer éventuellement sur d'autres catégories ou pour corriger des erreurs de saisie de données.
  - *Commande SQL* (hypothétique, car des valeurs spécifiques pour SEXE n'ont pas été fournies) :
    ```sql
    
    DELETE FROM HOSPITALISATIONS WHERE SEX = 1 OR SEX = 2;  -- En supposant que '1' et '2' représentent masculin et féminin
    ```

 ### 6. Utilisation de CTE et Logique Conditionnelle dans les Requêtes

Au lieu de créer des tables permanentes avec des variables spécifiques ou des ensembles de données pour notre analyse, nous avons souvent utilisé des Expressions de Table Communes (CTEs) ou une logique conditionnelle dans nos requêtes SQL. Cette approche nous permet de créer des tables temporaires, sur le moment, qui peuvent être adaptées à des analyses spécifiques et produire les résultats attendus. Voici quelques exemples de comment nous avons utilisé des CTE et des instructions conditionnelles :

#### Exemple 1 : Analyse Régionale des Hospitalisations

Cette requête calcule le nombre moyen d'hospitalisations et catégorise les départements par régions :

```sql
SELECT 
    AVG(H.NUM_HOSP) AS AVG_NUM_HOSP,
    CASE 
        WHEN H.DEP_ID IN ('59', '62', '80', '60', '02', '76', '14', '50', '27', '77', '95') THEN 'Nord'
        WHEN H.DEP_ID IN ('13', '83', '84', '06', '31', '33', '66', '34', '11', '30', '24') THEN 'Sud'
        ELSE 'D.O.M'
    END AS 'REGIONS'
FROM HOSPITALISATIONS H
INNER JOIN PROJET_DEP D ON H.DEP_ID = D.codeD
GROUP BY REGIONS
ORDER BY AVG_NUM_HOSP DESC;

#### Exemple 2 : Analyse Saisonnière Pendant et Hors Périodes COVID

Cet ensemble de CTE analyse les taux d'hospitalisation à travers différentes saisons pendant et en dehors des périodes COVID-19 :

```sql
-- SAISONS PENDANT ET HORS PÉRIODES COVID
AVEC PERIODE_COVID AS(
    SELECT
        AVG((NUM_HOSP/ total) * 10000) AS TAU_HOSP_PENDANT_COVID,
        CASE
        WHEN MONTH(DATE_HOSP) IN (12, 1, 2) THEN 'Hiver'
        WHEN MONTH(DATE_HOSP) IN (3, 4, 5) THEN 'Printemps'
        WHEN MONTH(DATE_HOSP) IN (6, 7, 8) THEN 'Été'
        WHEN MONTH(DATE_HOSP) IN (9, 10, 11) THEN 'Automne'
        END AS 'SAISONS'
    FROM HOSPITALISATIONS H
    INNER JOIN PROJET_POPU P
    ON H.DEP_ID = P.codeD
    WHERE DATE_HOSP LIKE '2020-%' OR DATE_HOSP LIKE '2019-%'
    GROUP BY SEASONS
), HORS_COVID AS(
    SELECT
        AVG((NUM_HOSP/ total) * 10000) AS TAU_HOSP_HORS_COVID,
        CASE
        WHEN MONTH(DATE_HOSP) IN (12, 1, 2) THEN 'Hiver'
        WHEN MONTH(DATE_HOSP) IN (3, 4, 5) THEN 'Printemps'
        WHEN MONTH(DATE_HOSP) IN (6, 7, 8) THEN 'Été'
        WHEN MONTH(DATE_HOSP) IN (9, 10, 11) THEN 'Automne'
        END AS 'SAISONS'
    FROM HOSPITALISATIONS H
    INNER JOIN PROJET_POPU P
    ON H.DEP_ID = P.codeD
     WHERE DATE_HOSP LIKE '2018-%' OR DATE_HOSP LIKE '2021-%'
    GROUP BY SEASONS
)
SELECT TAU_HOSP_PENDANT_COVID, TAU_HOSP_HORS_COVID, CP.SEASONS
FROM PERIODE_COVID CP
INNER JOIN HORS_COVID HC
ON CP.SEASONS = HC.SEASONS
ORDER BY TAU_HOSP_PENDANT_COVID DESC, TAU_HOSP_HORS_COVID DESC;
