library(tidyverse)
library(rstan)

# Bodged from this example:
# https://biologyforfun.wordpress.com/2016/11/10/hierarchical-models-with-rstan-part-1/

model_data <- read_csv("raw.csv")

N <- nrow(model_data) # Number of obs
K <- 2 # Number of regressors
J <- length(unique(model_data$brand)) # Number of groups
id <- model_data$brand
y <- model_data$sales

X<-model.matrix(~x, data = data.frame(x=model_data$media))

stan_data <- list(N=N, K=K, J=J, id=id, X=X, y=y)

fit <- stan(file = "hierarchical.stan", data = stan_data)

fit
