
-- Exo 1 Etape 1
-- Created and Imported the Table of DEPARTMENTS into my DB
CREATE TABLE DEPARTMENTS(
  ID VARCHAR(5) NOT NULL,
  NOM_DEP VARCHAR(50) NOT NULL,
  NUM_ARRONDISSEMENTS INT,
  NUM_CANTONS INT,
  NUM_COMMUNES INT,
  POPULATION INT,
  PRIMARY KEY (ID, NOM_DEP)
);

-- Exo 2 Etape 1
-- Creation de la Table UNIVERSITIES
CREATE TABLE UNIVERSITIES(
    SIRET BIGINT NOT NULL PRIMARY KEY, -- INT type is not big enough for the SIRET No.
    NOM VARCHAR(200),
    ID_DEPARTMENT VARCHAR(5) NOT NULL,
    FOREIGN KEY (ID_DEPARTMENT) REFERENCES DEPARTMENTS(ID)
);