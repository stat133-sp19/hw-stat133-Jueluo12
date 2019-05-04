#' @title bin_probability
#' @description calculates the probability of a binomial variable
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability of the binomial variable
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_choose(trials, success) * prob^success * (1 - prob)^(trials - success)
}
