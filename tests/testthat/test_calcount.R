#TESTS ---------------

library(NutritionR)
context("calcount")

test_that("food", {
  expect_named(name,c(food$name),ignore.order=TRUE)
})

# test_that("amount", {
#   expr_is_a('numeric')
# })
#
# # test_that("number of calories", {
# #   expect_equal(calcount("chicken",1,"grams"),1.032)
# # })

