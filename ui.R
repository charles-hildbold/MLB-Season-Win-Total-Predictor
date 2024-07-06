library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MLB Team Wins Prediction"),
  
  # Sidebar with a form for user input
  sidebarLayout(
    sidebarPanel(
      numericInput("runs_scored", "Runs Scored:", value = 700),
      numericInput("doubles", "Doubles:", value = 300),
      numericInput("triples", "Triples:", value = 30),
      numericInput("homeruns", "Home Runs:", value = 200),
      numericInput("walks", "Walks:", value = 500),
      numericInput("stolen_bases", "Stolen Bases:", value = 100),
      numericInput("earned_run_average", "Earned Run Average:", value = 4.01),
      numericInput("complete_games", "Complete Games:", value = 10),
      numericInput("shutouts", "Shutouts:", value = 5),
      numericInput("saves", "Saves:", value = 30),
      numericInput("hits_allowed", "Hits Allowed:", value = 1400),
      numericInput("homeruns_allowed", "Home Runs Allowed:", value = 150),
      numericInput("walks_allowed", "Walks Allowed:", value = 500),
      numericInput("strikeouts_by_pitchers", "Strikeouts by Pitchers:", value = 1300),
      numericInput("fielding_percentage", "Fielding Percentage:", value = 0.981),
      numericInput("batting_average", "Batting Average:", value = 0.261),
      numericInput("on_base_percentage", "On Base Percentage:", value = 0.331),
      numericInput("slugging_percentage", "Slugging Percentage:", value = 0.421),
      numericInput("singles", "Singles:", value = 900), # Added singles
      actionButton("predict", "Predict Wins")
    ),
    
    # Show the prediction
    mainPanel(
      h3("Predicted Wins:"),
      textOutput("predictedWins")
    )
  )
))
