
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
  name = tolower(name)
  unit = tolower(unit)

  food = food[food$Name == name,]

  if(unit == "grams") {
     amount <- amount * 1
       }
  else if(unit == "cups" || unit == "cup"){
        amount <- amount * 128
       }

         else if(unit == "ounces" || unit == "oz" || unit == "ounce"){
             amount <- amount * 23

            }

       else if(unit == "pounds" || unit == "lbs" || unit == "lb" || unit == "pound"){
           amount <- amount * 435
           }
       else {
           print("Invalid")
          }
          fatcal <- (food$Protein*4*amount)
          carbcal <- (food$Carbs*4*amount)
          protcal <-(food$Fats*9*amount)
          result <- paste("Your calorie count: ", fatcal+carbcal+protcal)
          return(result)
         }
