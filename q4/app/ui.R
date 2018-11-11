#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
    # Application title
    titlePanel("K-means clustering on the Iris dataset"),
  
    sidebarLayout(
        sidebarPanel(
            helpText("This application allows you to visualise how kmeans clusters observations based on the number of clusters. Use the slider below to visualise how observations are grouped depending on the number of clusters"),
            sliderInput("nclusters",
                        "Number of clusters:",
                        min = 1,
                        max = 10,
                        value = c(2,5)),
            radioButtons("algo", label=h4("Clustering Algorithm"),
                         choices = c("Hartigan-Wong", "Lloyd", "Forgy",
                                     "MacQueen")),
            submitButton(text='Apply')
        ),
        
        mainPanel(
            plotOutput("clusterPlots"),
            plotOutput("tssByNumCluster")
        )
    )
))
