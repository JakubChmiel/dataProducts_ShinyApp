library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("German credit scoring"),
    sidebarPanel(
      numericInput('amount','Credit amount ', value = 5000) 
      ,selectInput('credit_history','Credit history ',choices = c('no credits taken/ all credits paid back duly','all credits at this bank paid back duly','existing credits paid back duly till now','delay in paying off in the past','critical account/ other credits existing (not at this bank)')) 
      ,selectInput('debtors','Other debtors / guarantors',choices = c('no debtors','co-applicant','guarantor')) 
      ,numericInput('duration','Duration in month ',value = 12, min = 4, max = 72, step = 1) 
      ,numericInput('installment','Installment rate in percentage of disposable income ',value = 1, min = 1, max = 4, step = 1) 
      ,selectInput('other_installment','Other installment plans',choices = c('bank','stores','none')) 
      ,selectInput('personal_status','Personal status and sex',choices = c('male : divorced/separated','female : divorced/separated/married','male : single','male : married/widowed','female : single')) 
      ,selectInput('purpose','Credit purpose',choices = c('car (new)','car (used)','others','furniture/equipment','radio/television','domestic appliances','repairs','education','(vacation - does not exist?)','retraining','business')) 
      ,selectInput('savings','Savings account/bonds',choices = c('... < 100 DM','100 <= ... < 500 DM','500 <= ... < 1000 DM','.. >= 1000 DM','unknown/ no savings account')) 
      ,selectInput('status','Status of existing checking account',choices = c('... < 0 DM','0 <= ... < 200 DM','... >= 200 DM / salary assignments for at least 1 year','no checking account')) 
      ,submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction (score value)'),
      verbatimTextOutput("score"),
      h3('Which resulted in decision: '),
      verbatimTextOutput("decision")
    )
  )
)