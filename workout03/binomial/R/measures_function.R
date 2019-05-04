#' @title bin_mean
#' @description calculates the mean
#' @param trials number of trials
#' @param prob probability value
#' @return computed mean
#' @export
#' @examples
#' bin_mean(10, 0.3)

bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}


#' @title bin_variance
#' @description calculates the variance
#' @param trials number of trials
#' @param prob probability value
#' @return computed variance
#' @export
#' @examples
#' bin_variance(10, 0.3)

bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}


#' @title bin_mode
#' @description calculates the mode
#' @param trials number of trials
#' @param prob probability value
#' @return computed mode
#' @export
#' @examples
#' bin_mode(10, 0.3)

bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}


#' @title bin_skewness
#' @description calculates the skewness
#' @param trials number of trials
#' @param prob probability value
#' @return computed skewness
#' @export
#' @examples
#' bin_skewness(10, 0.3)

bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}


#' @title bin_kurtosis
#' @description calculates the kurtosis
#' @param trials number of trials
#' @param prob probability value
#' @return computed kurtosis
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)

bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}
