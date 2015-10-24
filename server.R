library(shiny)
creditScore <- function(logit) 1 / (1+exp(-logit))
config <- read.csv('config.csv', colClasses = "character")
config$coeff <- as.numeric(config$coeff)

shinyServer(
  function(input, output) {
    output$score <- renderPrint(creditScore(sum(config$coeff[config$varNames=='amount']*input$amount,
                                  config$coeff[config$varNames=='installment']*input$installment,
                                  config$coeff[config$varNames=='duration']*input$duration,
                                  config$coeff[config$factorDescription==input$debtors],
                                  config$coeff[config$factorDescription==input$status],
                                  config$coeff[config$factorDescription==input$other_installment],
                                  config$coeff[config$factorDescription==input$credit_history],
                                  config$coeff[config$factorDescription==input$purpose],
                                  config$coeff[config$factorDescription==input$personal_status],
                                  config$coeff[config$factorDescription==input$savings],
                                  config$coeff[config$varNames=='(Intercept)']))
                                
    )
    output$decision <- renderPrint(ifelse(creditScore(sum(config$coeff[config$varNames=='amount']*input$amount,
                                                config$coeff[config$varNames=='installment']*input$installment,
                                                config$coeff[config$varNames=='duration']*input$duration,
                                                config$coeff[config$factorDescription==input$debtors],
                                                config$coeff[config$factorDescription==input$status],
                                                config$coeff[config$factorDescription==input$other_installment],
                                                config$coeff[config$factorDescription==input$credit_history],
                                                config$coeff[config$factorDescription==input$purpose],
                                                config$coeff[config$factorDescription==input$personal_status],
                                                config$coeff[config$factorDescription==input$savings],
                                                config$coeff[config$varNames=='(Intercept)']))>0.5
                                          ,'Bad','Good')
    )   
  }
)