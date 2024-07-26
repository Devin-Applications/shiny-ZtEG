library(shiny)
library(bslib)

# Dummy data for top companies in different industries
top_companies <- data.frame(
  Industry = c("Technology", "Finance", "Healthcare", "Retail", "Energy"),
  Company = c("TechCorp", "FinBank", "HealthPlus", "RetailMart", "EnergyCo"),
  Rank = c(1, 2, 3, 4, 5)
)

# Define UI for application
ui <- page_sidebar(
  title = "Top Companies by Industry",
  sidebar = sidebar(
    selectInput("industry", "Select Industry:", choices = unique(top_companies$Industry))
  ),
  mainPanel(
    tableOutput("companyTable")
  )
)

# Define server logic
server <- function(input, output) {
  output$companyTable <- renderTable({
    subset(top_companies, Industry == input$industry)
  })
}

# Run the application
shinyApp(ui = ui, server = server)
