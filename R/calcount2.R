
# CREATE PACKAGE FUNCTIONS --------------------------------------------------------------------------------------------

#recipes and sample data, package should install

# 1. Create a calcount.R script in the R/ folder with the following contents.
# 2. Copy the script below.

#' Calculate the number of calories of a food item based on protein, carb, and fat data
#'
#' @param name Name of the food item
#' @param amount Number of servings
#' @param unit Unit of measure
#' @return The number of calories consumed given the food type as well as protein, carb, and fat information


calcount2 <- function(name, amount, unit,file="R Package Data - Food1.csv") {
  food <- read_csv(file)
  food$Name <-  tolower(food$Name)
  unit = tolower(unit)

  food = food[food$Name == name,]

  check <- food$Name == name
  if (!any(check)) stop("Unfortunately, your food item isn't in our database :(", call. = FALSE)
  #print(any(check))

  if(unit == "grams") {
     amount <- amount * 1
     helper_func(food,amount)
       }
  else if(unit == "cups" || unit == "cup"){
        amount <- amount * 128
        helper_func(food,amount)
       }

         else if(unit == "ounces" || unit == "oz" || unit == "ounce"){
             amount <- amount * 23
             helper_func(food,amount)

            }

       else if(unit == "pounds" || unit == "lbs" || unit == "lb" || unit == "pound"){
           amount <- amount * 435
           helper_func(food,amount)
           }
       else {
           return("Invalid")
          }
}

helper_func <- function(food, amount){
  fatcal <- (food$Protein*4*amount)
  carbcal <- (food$Carbs*4*amount)
  protcal <-(food$Fats*9*amount)
  result <- paste("Your calorie count:", fatcal+carbcal+protcal)
  return(result)
}

devtools::document()
