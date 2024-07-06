library(shiny)
library(randomForest)

# Load the data and model
baseball <- read.csv("C:/Users/Charl/Desktop/Google Project/Baseball/baseball.csv")

# Precompute min and max values for normalization based on the training data
min_vals <- apply(baseball[, -c(1, which(names(baseball) %in% c("year", "wins", "team_name")))], 2, min)
max_vals <- apply(baseball[, -c(1, which(names(baseball) %in% c("year", "wins", "team_name")))], 2, max)

# Load trained Random Forest model
load("random_forest_model.RData")

# Define the normalization function
normalize <- function(x, min_val, max_val) {
  return ((x - min_val) / (max_val - min_val))
}

# Define server logic
shinyServer(function(input, output) {
  
  # Observe the action button click
  observeEvent(input$predict, {
    
    # Create a data frame with the input values
    input_data <- data.frame(
      runs_scored = input$runs_scored,
      doubles = input$doubles,
      triples = input$triples,
      homeruns = input$homeruns,
      walks = input$walks,
      stolen_bases = input$stolen_bases,
      earned_run_average = input$earned_run_average,
      complete_games = input$complete_games,
      shutouts = input$shutouts,
      saves = input$saves,
      hits_allowed = input$hits_allowed,
      homeruns_allowed = input$homeruns_allowed,
      walks_allowed = input$walks_allowed,
      strikeouts_by_pitchers = input$strikeouts_by_pitchers,
      fielding_percentage = input$fielding_percentage,
      batting_average = input$batting_average,
      on_base_percentage = input$on_base_percentage,
      slugging_percentage = input$slugging_percentage,
      singles = input$singles
    )
    
    # Normalize the input data
    input_data_normalized <- input_data # Initialize with same structure
    for (col in names(input_data)) {
      input_data_normalized[[col]] <- normalize(input_data[[col]], min_vals[[col]], max_vals[[col]])
    }
    
    # Ensure the normalized data frame has the correct column names
    colnames(input_data_normalized) <- colnames(input_data)
    
    # Predict the number of wins using the Random Forest model
    predicted_wins <- predict(rf_model, newdata = input_data_normalized)
    
    # Calculate the margin of error (Using MAE as the margin of error)
    margin_of_error <- 3.41  # Use the MAE value calculated earlier
    
    # Calculate the range with the margin of error
    lower_bound <- round(predicted_wins - margin_of_error, 2)
    upper_bound <- round(predicted_wins + margin_of_error, 2)
    
    # Output the prediction and the range
    output$predictedWins <- renderText({
      paste("Predicted Wins: ", round(predicted_wins), "\nRange with Margin of Error: ", lower_bound, " to ", upper_bound)
    })
  })
})
