CREATE TABLE TEMPERATURES(
    DATE_TEMP DATE,
    DEP_ID VARCHAR(3) NOT NULL,
    DEPARTMENT VARCHAR(50) NOT NULL,
    MIN_TEMP DECIMAL,
    MAX_TEMP DECIMAL,
    MEAN_TEMP DECIMAL,

    PRIMARY KEY (DEP_ID, DEPARTMENT),
    FOREIGN KEY (DEP_ID) REFERENCES PROJET_DEP(codeD)
);


SELECT *
FROM TEMPERATURES T
LEFT JOIN PROJET_DEP D
ON T.DEP_ID = D.codeD

CREATE VIEW TEMP_DEP_VIEW AS
SELECT DEP_ID, DEPARTMENT, MIN_TEMP, MAX_TEMP, MEAN_TEMP, codeR, DATE_TEMP 
FROM TEMPERATURES T
LEFT JOIN PROJET_DEP D
ON T.DEP_ID = D.codeD
WHERE nomD IS NOT NULL

CREATE TABLE FISCAL_REVENU(
    CODE
);