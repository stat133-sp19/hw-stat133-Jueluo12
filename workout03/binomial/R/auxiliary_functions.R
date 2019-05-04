#private function to compute the mean
aux_mean <- function(trials, prob) {
  trials * prob
}

#private function to compute the variance
aux_variance <- function(trials, prob) {
  trials * prob * (1 - prob)
}

#private function to compute the mode
aux_mode <- function(trials, prob) {
  mode <- trials * prob + prob
  if (mode %% 1 == 0 && trials %% 2 != 0) {
    c(mode, mode - 1)
  }
  else {
    floor(mode)
  }
}

#private function to compute the skewness
aux_skewness <- function(trials, prob) {
  (1 - 2 * prob) / sqrt(aux_variance(trials, prob))
}

#private function to compute the kurtosis
aux_kurtosis <- function(trials, prob) {
  (1 - 6 * prob * (1 - prob)) / aux_variance(trials, prob)
}
