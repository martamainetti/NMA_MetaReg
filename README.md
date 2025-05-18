# Meta-Regression in Bayesian Network Meta-Analysis (Continuous Outcome)

This repository contains the code to perform a Bayesian Network Meta-Analysis (NMA) with meta-regression for continuous outcomes, implemented in **R** and **JAGS**.

## 🧠 Description

The model synthesizes evidence from randomized controlled trials (RCTs) comparing multiple treatments, accounting for:

- Multi-arm trials
- Study-level covariates (meta-regression)
- Random effects for between-study heterogeneity

The outcome is assumed to be continuous (e.g., mean change from baseline), and modeled using a normal likelihood with precision derived from reported standard errors.

## 📁 Files

- `NMA_model.txt`: JAGS model code defining the Bayesian NMA with meta-regression.
- `run_NMA.R`: Main R script to prepare data, run the model in JAGS, and post-process results.
- `data.csv`: Example dataset with study-level data.
- `README.md`: This file.

## 📦 Requirements

- **R** (≥ 4.0)
- **JAGS** (≥ 4.3.0)
- R packages:
  - `rjags`
  - `coda`
  - `dplyr`
  - `readr`

Install the packages in R with:

```r
install.packages(c("rjags", "coda", "dplyr", "readr"))
```# NMA_MetaReg
