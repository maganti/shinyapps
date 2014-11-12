
# This is the user-interface definition for the ABCD² Risk Score Shiny web application.
#
#

library(shiny)

shinyUI(
        navbarPage(h3("ABCD² Stroke Risk Score"),inverse=TRUE,
                   tabPanel(h5("ABCD² Calculator"),
                            sidebarPanel(style = "color:darkblue; font-family: 'arial'; font-si14pt",
                                    radioButtons("age", label = strong("Age >= 60?"),
                                                 choices = list("Yes" = 1, "No" =0 ),selected = 1),
                                    radioButtons("BP", label = strong("BP >= 140/90 mm Hg at initial evaluation?"),
                                                 choices = list("Yes" = 1, "No" = 0),selected = 1),
                                    radioButtons("clinical", label = strong("Clinical Features"),
                                                 choices = list("Unilateral Weakness" = 2, "Isolated Speech Disturbances" = 1,
                                                "Other" = 0),selected = 1),
                                    radioButtons("duration", label = strong("Duration of Symptoms"),
                                                 choices = list("< 10 minutes" = 0, "10 - 59 minutes" = 1,
                                                ">= 60 minutes" = 2),selected = 1),
                                    radioButtons("diabetes", label = strong("Diabetes?"),
                                                 choices = list("Yes" = 1, "No" = 0 ),selected = 1),
                                    
                                    submitButton("Submit")      
                            ),
                            mainPanel(
                                  helpText("Click on the", strong("About tab"), "above to know more about the ABCD² calculator"),
                                    plotOutput("riskplot"),br(),
                                    helpText("Scores less than 3 are interpreted as low risk, between 4-5 as medium risk and greater than 5 as high risk. 
                                             For each risk level, the corresponding risk percentage for a 2 day, 7 day and 90 day period, after TIA, is computed and plotted.")
                                     )),
                   tabPanel(h5("About"),
                                    helpText("The ABCD² score is a useful clinical prediction rule to determine the risk for stroke in the days following a 
                                        transient ischemic attack (TIA, is a condition in which temporary brain dysfunction results from oxygen shortage in the brain).",br(),
                                    "The ABCD² score is based on five parameters (age, blood pressure, clinical features, duration of TIA, 
                                        and presence of diabetes). The scores for each item are added together to produce an overall result ranging 
                                        between zero and seven. The ABCD² score's role as a clinical prediction rule is not intended to substitute 
                                        clinical decision making in individual patients",br(),br(),
                                      "This tool, developed as a Shiny App, is an adaptation of information, including scores, risk levels and associated percentage values, gathered from reliable, online resources,
                                        mentioned below in the references section. This tool is not meant for commercial or medical use
                                        and is only built for the purpose of the project work related to the Coursera Data Products course"),
                                    h4("Scoring System and Interpretation"),
                                    tableOutput('scoreTable'),
                                    helpText("For example, a person aged 60 (1 point) with normal blood pressure (0 point) and without 
                                             diabetes (0 point) who experienced a TIA lasting 10 minutes (1 point) with a speech disturbance 
                                             but no weakness on one side of the body (1 point) would score a total of 3 points.",br(), br(),
                                        "Click on the", strong("ABCD2 Calculator tab"), "above to use the calculator to compute scores"),
                                h4("References"),
                                    helpText(a("ABCD² Score for Transient Ischemic Attack (TIA) - MedicalCRITERIA.com", href="http://www.medicalcriteria.com/criteria/neuro_abcd.htm"),
                                             style = "font-family: 'times'; font-si10pt"),
                                    helpText(a("ABCD² score From Wikipedia", href="http://en.wikipedia.org/wiki/ABCD%C2%B2_score"),
                                             style = "font-family: 'times'; font-si10pt"),
                                    helpText(a("Validation and refinement of scores to predict very early stroke risk after transient ischaemic attack", 
                                        href="http://emjournalclub.com/uploads/ABCD2_Lancet.pdf"),style = "font-family: 'times'; font-si10pt")
              
)
                   
                )
        )
