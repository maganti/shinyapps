
# This is the server logic for the ABCD² Risk Score Shiny web application.
# The score table and the interpretation rules data frame are created using functions
#from the tables.R file. 
#

library(shiny)
library(ggplot2)
source("tables.r")
riskdata<-createScoreDF()
scoreTable<-createScoreTable()
shinyServer(function(input, output) {     
        val<-reactive({
                val<-as.numeric(input$age)+as.numeric(input$diabetes) + as.numeric(input$BP)+ as.numeric(input$clinical)+ as.numeric(input$duration)    
         })
        testsc<-reactive({
                testsc<-riskdata[riskdata$score==val(),]
                
        })
        output$riskplot <- renderPlot({
                testsc<-testsc()
                colr<-switch(as.character(testsc$type[1]), "Low"="tan","Medium"="orange","High"="red")
                
                theme_set(theme_bw(base_size = 16))
                ggplot(data=testsc, aes(x=factor(days), y=perc, fill=type))+
                        labs(title=paste0("ABCD² | Risk of Stroke After TIA\nScore = ",val()),y="Risk Percentage", x="Days After Stroke")+
                        geom_bar(stat="identity")+
                        geom_text(aes(y=perc,label=paste0(perc,"%"), vjust=-0.5),size = 5) +
                        scale_y_continuous(limits=c(0,25), labels=c("0%","5%","10%","15%","20%","25%"))+
                        scale_fill_manual(name="Stroke Risk\nCategory:", values=colr)+
                        theme(legend.title = element_text(colour="chocolate", size=12, face="bold"))
                        
        })
        output$scoreTable<-renderTable({
                scoreTable        
        })
})

