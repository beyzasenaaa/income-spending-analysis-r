📊 Income & Spending Analysis with R

IST 347 – Statistical Analysis Applications

This repository contains a comprehensive statistical analysis project conducted using R and RStudio.
The study examines the relationship between income, spending habits, and demographic factors through exploratory data analysis, hypothesis testing, and regression models.

📌 Project Overview

Course: IST 347 – Statistical Analysis Applications

Term: 2024–2025 Fall

Analysis Tool: R / RStudio

Observations: 2000 (randomly sampled)

Focus: Income–expenditure relationships and financial behavior analysis

The project was prepared as a midterm assignment and includes code, dataset, visualizations, and a detailed analytical report.

📂 Dataset Description

The dataset consists of 2000 observations representing individuals’ income levels, expenditures, and demographic characteristics.

Variables

Income: Annual income

Age: Age of the individual

Dependents: Number of dependents

Occupation: Employment status (e.g., student, retired)

City Tier: City development level (1, 2, or 3)

Rent: Monthly rent expense

Loan Repayment: Monthly loan payment

Groceries: Monthly grocery spending

Transport: Transportation expenses

Eating Out: Dining-out expenses

Entertainment: Entertainment expenses

Utilities: Electricity, water, etc.

Healthcare: Healthcare expenses

Education: Education-related expenses

Miscellaneous: Other additional expenses

🔍 Analysis Scope

The following statistical methods and analyses were applied:

Descriptive & Inferential Statistics

Relative frequency calculation (mean())

Confidence interval for median (wilcox.test())

Proportion tests (prop.test())

Confidence intervals for proportions

Correlation & Regression

Correlation significance testing (cor.test())

Simple linear regression (lm())

Multiple linear regression

Log-transformed regression models

Residual diagnostics (augment())

Influential observation detection (influence.measures())

Hypothesis Testing

One-way ANOVA (oneway.test())

📈 Data Visualization

All visualizations were created using ggplot2 and exported as .png files:

Bar charts (custom coloring)

Boxplots by factor levels

Histograms with density estimation

Scatter plots and relationship visuals

Regression line plots

Normal Q–Q plots

Horizontal and vertical reference lines

📁 All figures are available in the /Grafikler directory.

🧾 R Markdown Report

An R Markdown document was prepared to demonstrate:

Text formatting

Displaying R code and outputs

Table creation

Plot embedding

Mathematical equation rendering

The rendered HTML output is included in the repository.

📁 Repository Structure
├── ist_347.R
├── fonksiyonlar.R
├── ist_347_RMarkdown.html
├── veri.txt
├── IST_347_Ara_Sınav_Ödevi.pdf
├── Grafikler/
│   ├── Bar Grafiği 1.png
│   ├── Bar Grafiği 2.png
│   ├── Boxplot.png
│   ├── Histogram Grafiği.png
│   ├── Doğrusal Regresyon.png
│   └── ...


🎯 Objective

The main objective of this project is to:

Analyze the relationship between income and spending behavior

Understand financial patterns of individuals

Examine the impact of demographic factors on expenditures

This is achieved through exploratory data analysis, hypothesis testing, and regression modeling.

📚 References

R Cookbook (Winston Chang)

Official R documentation

ggplot2 documentation

✨ If you’re viewing this project from LinkedIn or elsewhere, feel free to explore the code, visuals, and report for a complete statistical analysis workflow in R.
