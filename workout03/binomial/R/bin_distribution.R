#' @title bin_distribution
#' @description calculates the distribution for a binomial variable
#' @param trials number of trials
#' @param prob the probability of the binomial variable
#' @return a dataframe with probability distribution: success in first column, probability in the second column
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob) {
  df <- data.frame(success = 0:trials, probability = bin_probability(0:trials, trials, prob))
  class(df) <- c("bindis", "data.frame")
  df
}

#' @export
#' @examples 
#' dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis1)
plot.bindis <- function(x, ...) {
  library(ggplot2)
  ggplot(x, aes(x = success, y = probability)) +
    geom_histogram(stat = "identity")
}
