# MLB Season Win Total Predictor

This Shiny application predicts the total number of wins for an MLB team based on various team statistics. The prediction model is built using a Random Forest algorithm.

## Files in the Repository

- `ui.R`: The user interface definition for the Shiny app.
- `server.R`: The server logic for the Shiny app.
- `baseball.csv`: The dataset containing historical baseball team statistics.
- `random_forest_model.RData`: The trained Random Forest model.
- `Win Predictor App.r`: Script to set up and run the Shiny app.

## How to Run the App

1. **Prerequisites:**
   - Ensure you have R and RStudio installed on your computer.
   - Install the necessary R packages: `shiny` and `randomForest`.

   ```r
   install.packages("shiny")
   install.packages("randomForest")
