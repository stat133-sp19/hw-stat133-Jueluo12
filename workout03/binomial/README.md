Overview

"binomial" is a R package that provides functions to evaluate binomial function.

coin() creates a coin object (of class "coin")
toss() tosses a coin object, producing a "toss" object.
plot() method for a "toss" object to plot frequencies of heads.
summary() method for a "toss" object.


Motivation

This package is the homework for stat 133

Installation

Install the development version from GitHub via the package "devtools":

# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("hw-stat133-Jueluo12/workout03/binomial")

# install "binomial" (with vignettes)
devtools::install_github("hw-stat133-Jueluo12/workout03/binomial", build_vignettes = TRUE)


Usage

library(binomial)

bin_mean(10, 0.3)

a <- bin_distribution(10, 0.3)
a

plot(a)
