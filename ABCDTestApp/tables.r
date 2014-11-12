#R source file for helper functions to create the score table and the inerpretation rules
#dataframe. The functions are called in the server.R at the beginning to create and load them
#for the server to use to compute and interpret ABCD scores

#The rules for constructing the table and the dataframe are from reliable online, medical
#sources, referred to in the links in the Reference section  on the About page

createScoreTable<-function(){
        points<-c("0","1","2")
age<-c("<60 years", ">=60 years", "-")
bloodPressure<-c("normal", "raised (>=140.90 mmHg)", "-")
clinicalFeatures<-c("no speech disturbance and no unilateral weakness", 
                    "speech disturbance yes, unilateral weakness, no",
                    "unilateral weakness yes")
durationTIA<-c("<10 minutes", "10-59 minutes", ">=60 minutes")
diabetes<-c("yes", "no", "-")
score<-c("<3 : Low Risk", "4-5 : Medium Risk", ">5 : High Risk")
scoredf<-data.frame(points, age, bloodPressure, clinicalFeatures,
                    durationTIA, diabetes, score)
return(scoredf)
}

createScoreDF<- function() {
        risk<-data.frame(score=ordered(c(rep(0:7, each=3))), days=rep(c(2,7,90), 8),
                         perc=c(rep(c(1,1.2,3.1), 4), 
                                rep(c(4.2,5.9,9.8), 2), rep(c(8.1,11.7,17.8), 2)),
                         type=rep(c("Low", "Medium", "High"), times=c(12,6,6)))
        return(risk)
}

