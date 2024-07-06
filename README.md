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
2. Clone the Repository:

Clone this repository to your local machine using the following command:
git clone https://github.com/your_username/MLB_Season_Win_Total_Predictor.git

3. Set Working Directory:

Open RStudio and set your working directory to the cloned repository folder.

4. Load the Data and Model:

Load the baseball.csv data and the random_forest_model.RData in R:

baseball <- read.csv("baseball.csv")
load("random_forest_model.RData")

5. Run the Shiny App:

Open Win Predictor App.r in RStudio and run it.
Alternatively, run the following command in RStudio:

library(shiny)
runApp()

Usage
Enter the team statistics in the input fields.
Click on "Predict Wins" to get the predicted total wins and the range with the margin of error.
Contributing
Feel free to submit issues or pull requests if you have suggestions for improving the app.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
