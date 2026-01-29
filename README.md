# Income & Spending Analysis in R

This repository presents a comprehensive statistical analysis project conducted using **R and RStudio**, focusing on the relationship between individuals’ income levels, spending behavior, and demographic characteristics.

The project was developed within the scope of **IST 347 – Statistical Analysis Applications** and demonstrates the practical use of descriptive statistics, hypothesis testing, regression models, and data visualization techniques in R.

---

## 📌 Project Objectives

The main objectives of this study are:

- To analyze the relationship between **income and expenditure patterns**
- To understand **financial behavior** across different demographic groups
- To apply **inferential statistical methods** to real-world data
- To present results using **reproducible analysis workflows** in R

The analysis is based on **exploratory data analysis, hypothesis testing, and regression modeling**.

---

## 📂 Dataset Information

The dataset consists of **2000 randomly sampled observations**, representing individuals’ financial and demographic profiles.

### Variables

- **Income**: Annual income  
- **Age**: Age of the individual  
- **Dependents**: Number of dependents  
- **Occupation**: Employment status (e.g., student, retired)  
- **City Tier**: Development level of the city (1, 2, or 3)  
- **Rent**: Monthly rent expenditure  
- **Loan Repayment**: Monthly loan payment  
- **Groceries**: Monthly grocery expenses  
- **Transport**: Transportation costs  
- **Eating Out**: Dining-out expenses  
- **Entertainment**: Entertainment spending  
- **Utilities**: Electricity, water, and other utilities  
- **Healthcare**: Healthcare expenses  
- **Education**: Education-related costs  
- **Miscellaneous**: Other additional expenses  

---

## 🔍 Analysis Overview

The following statistical techniques and R functions were applied throughout the analysis:

### Descriptive & Inferential Statistics
- Relative frequency and summary statistics (`mean()`, `summary()`)
- Confidence interval estimation for the median (`wilcox.test()`)
- Proportion tests and confidence intervals (`prop.test()`)

### Correlation & Regression Analysis
- Correlation significance testing (`cor.test()`)
- Simple linear regression (`lm()`)
- Multiple linear regression models
- Log-transformed regression analysis (`log()`)
- Residual diagnostics and model evaluation (`augment()`)
- Detection of influential observations (`influence.measures()`)

### Hypothesis Testing
- One-way ANOVA (`oneway.test()`)

---

## 📊 Data Visualization

All visualizations were created using **ggplot2** and customized to enhance interpretability.  
The repository includes:

- Bar charts with custom color mappings  
- Boxplots across factor levels  
- Histograms with density estimation  
- Scatter plots and relationship visuals  
- Regression plots  
- Normal Q–Q plots  
- Reference lines using `geom_hline()` and `geom_vline()`

All figures are stored in the **`Grafikler/`** directory.

---

## 🧾 R Markdown Component

An R Markdown document was prepared to demonstrate:

- Text formatting and narrative reporting  
- Display of R code and outputs  
- Table creation  
- Figure embedding  
- Mathematical equation rendering  

The compiled HTML output is included for easy viewing.

---

## 📁 Repository Structure


---

## 🛠 Tools & Technologies

- **R**
- **RStudio**
- **ggplot2**
- **dplyr**
- **tidyr**
- **broom**

---

## 📚 References

- Chang, W. *R Cookbook*  
- R Documentation  
- ggplot2 Documentation  

---

This project demonstrates a complete **statistical analysis workflow in R**, from data preparation to modeling and visualization, using reproducible and well-documented methods.
