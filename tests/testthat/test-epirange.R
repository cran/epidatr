test_that("epirange", {
  expect_no_error(epirange(as.Date("2020-01-01"), as.Date("2020-01-02")))
  expect_no_error(epirange("2020-01-01", "2020-01-02"))
  expect_no_error(epirange("20200101", "20200102"))
  expect_no_error(epirange(20200101, 20200102))
  expect_identical(epirange(20200101, 20150101), epirange(20150101, 20200101))
  expect_error(epirange(1, 2, 3), "unused argument")
  expect_error(epirange(1, 2))
  expect_error(epirange("1", "2"))
  expect_error(epirange(201501, 20160101))
  expect_error(epirange(epirange(201501, 201502), epirange(201601, 201602)))
})
