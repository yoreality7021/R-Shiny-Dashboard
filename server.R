library(shiny)
library(dplyr)
library(lubridate)
library(ggplot2)
#server-----
server = function(input, output) {
 
    g = function(t,s,tsr){
    {
      {

        {

          {
            t=as.numeric(t)
            s=as.numeric(s)
            tsr=as.numeric(tsr)
            test=as.data.frame(cbind(t,s,tsr))
            names(test)=c("MLPAP_TJC.0757A.PV","sum0619","timeserver")
          }

          pred2=as.data.frame(predict(model1, interval = "prediction", test))
          pred2=as.data.frame(pred2[,1])
          names(pred2)[1]="fit"

          pred2.1=as.data.frame(pred2[,1]-min(pred1))
          names(pred2.1)="new"
          pred2.2=pred2.1/df
        }
        {
          i=1
          a1=data.frame(NA,NA,NA)
          names(a1)=c("X","each","sumeach")
          a=filter(df1, each>as.numeric((pred2.2-5e-10))&
                     each<as.numeric((pred2.2+5e-10)))
          repeat{
            if(i<=nrow(a)){
              a1[i,1] = a[i,1]
              a1[i,2] = a[i,2]-pred2.2
              a1[i,3] = a[i,3]
            }
            i=i+1
            if(i>nrow(a)) break
          }
          pred2.3=filter(a1, each==min(a1[,2]))
          
          if((1-pred2.3[,3])<0.01){
              LF=0
          }else{
              LF=1-pred2.3[,3]
          }
          cat("CAT Life Left =",round(LF*100,2), "%")
          
        }
      }
    }
      # save(pred2.1, file = "D:/AI-work/R-shiny/catlife/pred2.1.Rdata")
      # save(pred2.3, file = "D:/AI-work/R-shiny/catlife/pred2.3.Rdata")
}
    
    
sliderValues = reactive({
  
    data.frame(
      Name =  as.character( c("Temp","Feed","Time") ), 
      
      Value = as.character( c(input$temp, input$feed, input$tsr ) ), 
      
      stringsAsFactors=FALSE)
    
  })
   
   output$value3 = renderTable({ sliderValues() }) 
   output$LF = renderPrint({ g(input$temp, input$feed, input$tsr) })
   
}

