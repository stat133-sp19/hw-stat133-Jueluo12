context("Check binomial functions")

test_that("bin_choose with valid input", {

  expect_equal(bin_choose(n = 5, k = 2), 10)
  expect_length(bin_choose(5, 0), 1)
  expect_type(bin_choose(5, 1:3), "double")
})

test_that("bin_choose with invalid input", {

  expect_error(bin_choose(2, 5))
  expect_error(bin_choose(0, 4))
  expect_error(bin_choose(-2, 4))
})

test_that("bin_probability with valid input", {
  expect_equal(bin_probability(success = 0:2, trials = 5, prob = 0.5), c(0.03125, 0.15625, 0.31250))
})

test_that("bin_probability with invalid input", {
  expect_error(bin_probability(-1, 5, 0.5))
  expect_error(bin_probability(2, 2:3, 0.5))
  expect_error(bin_probability(3, 3:10, 0.5))
})

test_that("bin_distribution with valid input", {

  expect_type(bin_distribution(4, 0.4), "list")
  expect_s3_class(bin_distribution(4, 0.4), c("bindis", "data.frame"))
  expect_length(bin_distribution(4, 0.4), 2)
})

test_that("bin_cumulative with valid input", {
  expect_type(bin_cumulative(4, 0.4), "list")
  expect_s3_class(bin_cumulative(4, 0.4), c("bincum", "data.frame"))
  expect_length(bin_cumulative(4, 0.4), 3)
})
