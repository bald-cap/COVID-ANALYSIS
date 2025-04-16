# COVID-19 Hospitalisation and Temperature Analysis

## Project Overview

This project investigates the relationships between hospitalisation rates, temperature variations, and demographic factors during the COVID-19 pandemic, covering 2019 to 2021. By integrating public health, demographic, and meteorological data, the analysis aims to uncover how environmental and demographic variables influence hospitalisation trends. The findings are documented in a comprehensive HTML report [Analysis Report](./analyses_covid_temp_hosp.html), which can be easily viewed in a web browser, and the data organization is detailed in the [Approche SQL](./Approche%20SQL.docx) file.

## Objectives

- Identify trends and seasonal patterns in COVID-19 hospitalisation rates.
- Assess the impact of temperature variations on hospitalisation rates.
- Examine correlations between intensive care admissions, mortality rates, and age demographics.
- Apply statistical techniques and visualizations to analyze and communicate insights effectively.

## Data Sources

The analysis leverages three primary datasets from verified French government sources:

1. **Hospitalisations**: Records of COVID-19 hospitalisations, intensive care admissions, and mortality rates by department.
2. **Population Demographics**: Age group distributions across departments and regions.
3. **Temperature Records**: Daily average, minimum, and maximum temperatures by department.

These datasets were sourced from French government repositories, ensuring reliability but posing challenges due to their complexity and volume.

## Methodology

### Data Organization
As detailed in [Approche SQL](./Approche%20SQL.docx), the data was organized in a relational database to facilitate efficient querying and integration. Key steps included:

- **Database Schema Design**: Structured tables for hospitalisations, demographics, and temperature data, with appropriate keys (e.g., department codes, dates) to enable joins.
- **Data Type Handling**: Converted department codes to VARCHAR to accommodate non-numeric codes like “2A” (Corsica), which cannot be stored as integers.
- **SQL Queries**: Used SQL to merge datasets, filter relevant records, and compute derived metrics like hospitalisation rates per 10,000 inhabitants.

### Data Cleaning and Standardization
To ensure data quality and comparability, the following cleaning and standardization steps were performed:

- **Handling Department Codes**: Converted department codes to VARCHAR to correctly represent codes like “2A” and “2B”, preventing errors from integer-based assumptions.
- **Standardizing Hospitalisation Rates**: Computed hospitalisation rates per 10,000 inhabitants by multiplying raw hospitalisation counts and intensive care admissions by 10,000 and dividing by population size. This standardized columns such as:
  - `HOSP_RATE_10K`: Hospitalisation rate per 10,000 inhabitants.
  - `ICU_RATE_10K` (implied): Intensive care admission rate per 10,000 inhabitants.
- **Temperature Standardization**: Aggregated daily temperature data to compute mean temperatures (`MEAN_TEMP`) per department, addressing missing values through interpolation or averaging adjacent days.
- **Handling Missing Data**: Identified and imputed missing values in hospitalisation and temperature records using mean substitution or time-based interpolation.
- **Tools Used**: R for data cleaning (e.g., `dplyr`, `tidyr`), SQL for database operations, and Python (potentially) for additional preprocessing.

### Statistical Analysis
The analysis employed several statistical methods to explore relationships:

- **Correlation Analysis**: Calculated Pearson correlation coefficients, revealing a weak negative correlation (-0.21) between mean temperature (`MEAN_TEMP`) and hospitalisation rates (`HOSP_RATE_10K`).
- **Linear Regression**: Built a model (`lm(HOSP_RATE_10K ~ MEAN_TEMP)`) to predict hospitalisation rates based on temperature, with results:
  - Coefficient: -0.1076 (hospitalisations decrease by 0.1076 units per degree increase).
  - P-value: < 2e-16, indicating statistical significance.
  - R-squared: 0.2515, explaining ~25% of variance in hospitalisation rates.
- **Time Series Analysis**: Identified seasonal patterns in hospitalisation rates, with peaks in colder months.

### Visualization
Generated visualizations to communicate findings:
- Scatter plots and heatmaps to illustrate temperature-hospitalisation relationships.
- Time series plots to highlight seasonal trends.
- Tools: R libraries like `ggplot2` for plotting, integrated into the HTML report.

### Report Generation
The final analysis is presented in [Analysis Report](./analyses_covid_temp_hosp.html), a browser-friendly report generated using R Markdown and Pandoc. It includes:
- Narrative explanations of objectives, methodology, and findings.
- Embedded R code and outputs (e.g., regression summaries).
- Visualizations and statistical results for accessibility.

## Technologies Used

The project integrated multiple technologies, showcasing a robust technical skill set:
- **R**: Core tool for statistical analysis (`lm`, `cor`), data cleaning (`dplyr`, `tidyr`), and visualization (`ggplot2`).
- **SQL**: Managed database connections, queries, and data integration, as outlined in “Approche SQL.docx”.
- **R Markdown/Pandoc**: Generated the HTML report for clear, reproducible documentation.
- **Database Systems**: Likely used MariaDB or similar for storing and querying datasets.
- **Python (Potential)**: Possibly used for additional data processing (e.g., pandas, numpy) or natural language processing tasks, given your CV expertise in SpaCy and Stanza.
- **Git**: Version control for collaborative code management, as implied by your GitHub usage.

These technologies were combined seamlessly:
- SQL organized raw data into a queryable structure.
- R processed and analyzed the data, producing statistical models and visualizations.
- R Markdown compiled the analysis into a polished HTML report, ensuring accessibility.

## Challenges Faced

The project encountered several challenges, which were addressed through technical and analytical solutions:

1. **Data Complexity from French Government Sources**:
   - **Challenge**: Sourcing and combining data from verified French government repositories (e.g., Santé Publique France, Météo-France) was complex due to differing formats and granularity.
   - **Solution**: Designed a robust SQL schema (detailed in “Approche SQL.docx”) to standardize and merge datasets, using VARCHAR for department codes and computed metrics like `HOSP_RATE_10K`.

2. **Standardizing Hospitalisation Rates**:
   - **Challenge**: Raw hospitalisation and ICU admission counts varied by population size, requiring standardization to per 10,000 inhabitants.
   - **Solution**: Multiplied hospitalisation and ICU counts by 10,000 and divided by population, creating consistent columns (`HOSP_RATE_10K`, `ICU_RATE_10K`).

3. **Handling Non-Numeric Department Codes**:
   - **Challenge**: Department codes like “2A” caused errors when treated as integers.
   - **Solution**: Converted codes to VARCHAR in the database, ensuring accurate joins and queries.

4. **Missing Data and Interpolation**:
   - **Challenge**: Temperature and hospitalisation records had missing values, risking biased analysis.
   - **Solution**: Used mean substitution or time-based interpolation to impute missing data, validated by cross-checking with adjacent records.

5. **Team Collaboration**:
   - **Challenge**: Coordinating tasks among five contributors required clear communication and version control.
   - **Solution**: Used Git for code sharing and assigned specific roles (e.g., Michael handled regression analysis and data cleaning).

## Findings

The analysis yielded significant insights:
- **Seasonal Patterns**: Hospitalisation rates peaked in colder months, suggesting seasonal influences.
- **Temperature Correlation**: A weak negative correlation (-0.21) between temperature and hospitalisation rates, with regression confirming a modest effect (coefficient: -0.1076, p < 2e-16).
- **Demographic Impact**: Older age groups showed higher hospitalisation and mortality rates, emphasizing demographic factors over environmental ones.
- **Statistical Significance**: The regression model’s low p-value (< 2e-16) confirmed temperature’s statistically significant, though limited, influence.

## Contributors

- Michael NYANYUIE
- Divine IZERE
- Lucky Bernice IKAZE
- Medhi HIMMICHE
- Rayane BENCHOKROUN
