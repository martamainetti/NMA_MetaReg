# Bayesian Meta Regression: Network Meta-Analysis

library(dplyr)
library(readr)
library(rjags)
library(R2jags)
library(tidyr)

long_df <- read_csv("data.csv")

# Create List with data for the NMA Bayesian regression
metareg_data <- prepare_data(data = long_df)

# NMA - Bayesian Meta-regression with multi-arms studies
MetaRegression_continuous_outcome_multiarms <- "NMA_model.txt"

NMA_meta_regression <- jags.parallel(data = metareg_data,
                                     parameters.to.save = "beta",
                                     model.file = MetaRegression_continuous_outcome_multiarms,
                                     n.chains = 4, n.thin = 2,
                                     n.iter = 1e4, n.burnin = 1e3)











