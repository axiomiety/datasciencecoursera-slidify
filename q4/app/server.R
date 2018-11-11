#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(gridExtra)
library(grid)
library(ggplot2)
data(iris)

shinyServer(function(input, output) {
  
  getRange <- reactive({
    cluster_range <- input$nclusters
    seq(cluster_range[1],cluster_range[2])
  })
      
  getKMeans <- reactive({
    lapply(getRange(), function(k) {kmeans(iris[,3:4], k, algorithm = input$algo)})
  })
  
  output$clusterPlots <- renderPlot({
    data <- getKMeans()
    plots <- lapply(getKMeans(), function(km) {
      km$cluster <- as.factor(km$cluster)
      num_clusters <- length(levels(km$cluster))
      ggplot(iris, aes(Petal.Length, Petal.Width, color = km$cluster)) + 
        geom_point() + ggtitle(paste(num_clusters,"cluster(s)", sep=" ")) +
        theme(legend.title=element_blank()) # remove the legend
    })
    grid.arrange(grobs=plots, ncol=2)
  })
  
  output$tssByNumCluster <- renderPlot({
    wss <- lapply(getKMeans(), function(km) {km$tot.withinss})
    df <- data.frame(k=as.numeric(getRange()),wss=as.numeric(wss))
    ggplot(df, aes(x=k, y=wss)) + geom_line() + labs(x="Number of clusters", y="Within sum of squares", title="Sum of Squares within by number of clusters")
  })
})
