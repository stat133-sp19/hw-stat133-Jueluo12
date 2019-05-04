#' @title bin_cumulative
#' @description calculates the cumulative probability of a binomial variable
#' @param trials number of trials
#' @param prob probability for the binomial variable
#' @return a dataframe with both the probability distribution and the cumulative probabilities: successes in the first column, probability in the second column, and cumulative in the third column
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative <- function(trials, prob) {
  bin_cum <- bin_distribution(trials, prob)
  cum_prob <- rep(0, trials + 1)
  for (i in 1:length(cum_prob)) {
    cum_prob[i] <- sum(bin_probability(0:(i - 1), trials, prob))
  }
  bin_cum$cumulative <- cum_prob
  class(bin_cum) <- c("bincum", "data.frame")
  bin_cum
}


#' @export
#' @examples
#' dis2 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis2)
plot.bincum <- function(x) {
  library(ggplot2)
  ggplot(x, aes(x = success, y = cumulative)) +
    geom_point(size = 2) +
    geom_line()
}
