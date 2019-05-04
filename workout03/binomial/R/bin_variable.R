#' @title bin_variable
#' @description creates an object of class "binvar"
#' @param trials number of trials
#' @param prob probability of a binomial variable
#' @return an object of class "binvar", which is a list with named elements: trials, prob
#' @export
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' bin1

bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  res <- list(trials = trials, probability = prob)
  class(res) <- "binvar"
  res
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable"\n\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials: %s\n', x$trials))
  cat(sprintf('- prob of success : %s', x$probability))
  invisible(x)
}

#' @export
summary.binvar <- function(x, ...) {
  summary <- list(trials = x$trials, probability = x$probability, mean = aux_mean(x$trials, x$probability),
                  variance = aux_variance(x$trials, x$probability), mode = aux_mode(x$trials, x$probability),
                  skewness = aux_skewness(x$trials, x$probability), kurtosis = aux_kurtosis(x$trials, x$probability))
  class(summary) <- "summary.binvar"
  summary
}

#' @export
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' binsum1 <- summary(bin1)
#' binsum1
print.summary.binvar <- function(x, ...) {
  cat('"Summary Binomial"\n\n')
  cat('Parameters\n')
  cat(sprintf('- number of trials: %s\n', x$trials))
  cat(sprintf('- prob of success : %s\n\n', x$probability))
  cat('Measures\n')
  cat(sprintf('- mean    : %s\n', x$mean))
  cat(sprintf('- variance: %s\n', x$variance))
  cat(sprintf('- mode    : %s\n', x$mode))
  cat(sprintf('- skewness: %s\n', x$skewness))
  cat(sprintf('- kurtosis: %s', x$kurtosis))
  invisible(x)
}
