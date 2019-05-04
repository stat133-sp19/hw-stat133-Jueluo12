context("Check summary measures")

test_that("aux_mean with valid input", {

  expect_equal(aux_mean(10, 0.2), 2)
  expect_length(aux_mean(10, 0.2), 1)
  expect_type(aux_mean(10, 0.2), "double")
})

test_that("aux_variance with valid input", {

  expect_length(aux_variance(10, 0.2), 1)
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_type(aux_variance(10, 0.2), "double")
})

test_that("aux_mode with valid input", {

  expect_length(aux_mode(10, 0.2), 1)
  expect_equal(aux_mode(10, 0.2), 2)
  expect_type(aux_mode(10, 0.2), "double")
})

test_that("aux_skewness with valid input", {

  expect_length(aux_skewness(10, 0.2), 1)
  expect_gte(aux_skewness(10, 0.2), 0)
  expect_type(aux_skewness(10, 0.2), "double")
})

test_that("aux_kurtosis with valid input", {

  expect_length(aux_kurtosis(10, 0.3), 1)
  expect_lte(aux_kurtosis(10, 0.3), 0)
  expect_type(aux_kurtosis(10, 0.3), "double")
})
