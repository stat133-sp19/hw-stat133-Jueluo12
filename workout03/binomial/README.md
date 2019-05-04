# Overview

"binomial" is a R package that provides functions to evaluate binomial function.

1.bin_choose() calculates the number of combinations in which k successes can occur in n trials.
2.bin_probability() calculates the probability of a binomial variable.
3.bin_distribution() calculates the distribution for a binomial variable.
4.bin_cumulative() calculates the cumulative probability of a binomial variable
5.bin_variable() creates an object of class "binvar".
6.Functions of measures contain main functions for each of the summary measures including bin_mean(), bin_variance(),
  bin_mode(), bin_skewness(), bin_kurtosis()



# Motivation

This package is the homework for stat 133

# Installation

Install the development version from GitHub via the package "devtools":

development version from GitHub:
install.packages("devtools") 

install "binomial" (without vignettes)
devtools::install_github("hw-stat133-Jueluo12/workout03/binomial")

install "binomial" (with vignettes)
devtools::install_github("hw-stat133-Jueluo12/workout03/binomial", build_vignettes = TRUE)


# Usage

library(binomial)

bin_mean(10, 0.3)

a <- bin_distribution(10, 0.3)
a

plot(a)

b <- bin_cumulative(10, 0.3)
b

plot(b)

c <- bin_variable(10,0.3)
c

summary(c)
