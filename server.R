library(shiny)
options(gsubfn.engine = "R")
library(sqldf)

mycars <- mtcars
mycars$carname <- rownames(mtcars)

shinyServer(
   function(input, output) {
       
       avg_hp <- sqldf("SELECT AVG(hp) FROM mycars")[1,1]
       avg_mpg <- sqldf("SELECT AVG(mpg) FROM mycars")[1,1]
       
       output$table1 <- renderTable({
           query <- paste("SELECT * FROM mycars WHERE carname LIKE '%", input$text1, "%'", sep="")
           res <- sqldf(query)
           count1 <- nrow(res)
           if (count1 == 1) {
               output$hp1 <- renderText({
                   print(avg_hp)
                   diff <- res$hp - avg_hp
                   if (diff > 0) sign <- '+'
                   else sign <- ''
                   paste("hp compared with average: ", sign, diff)
               })
               output$mpg1 <- renderText({
                   print(avg_mpg)
                   diff <- res$mpg - avg_mpg
                   if (diff > 0) sign <- '+'
                   else sign <- ''
                   paste("mpg compared with average: ", sign, diff)
               })
           }
           else {
               output$hp1 <- renderText({"provided when exactly 1 result is displayed"})
               output$mpg1 <- renderText({})
           }
           if (count1 < 5) 
               res
           else {
               out <- rbind(data.frame(), "please be more specific")
               colnames(out) <- c("Too many results")
               out
           }
       })
       output$table2 <- renderTable({
           query <- paste("SELECT * FROM mycars WHERE carname LIKE '%", input$text2, "%'", sep="")
           res <- sqldf(query)
           count2 <- nrow(res)
           if (count2 == 1) {
               output$hp2 <- renderText({
                   print(avg_hp)
                   diff <- res$hp - avg_hp
                   if (diff > 0) sign <- '+'
                   else sign <- ''
                   paste("hp compared with average: ", sign, diff)
               })
               output$mpg2 <- renderText({
                   print(avg_mpg)
                   diff <- res$mpg - avg_mpg
                   if (diff > 0) sign <- '+'
                   else sign <- ''
                   paste("mpg compared with average: ", sign, diff)
               })
           }
           else {
               output$hp2 <- renderText({"provided when exactly 1 result is displayed"})
               output$mpg2 <- renderText({})
           }
           if (count2 < 5) 
               res
           else {
               out <- rbind(data.frame(), "please be more specific")
               colnames(out) <- c("Too many results")
               out
           }
       })
   }
)
