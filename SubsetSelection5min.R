temp_5min_cal[,"BTCDirection"]<-"Up"

for(i in 1:17328){
  if(temp_5min_cal$BTCReturn[i]>=0){
    temp_5min_cal$BTCDirection[i] <- "Up"
  }else{
    temp_5min_cal$BTCDirection[i] <- "Down"
  }
  
}

temp_5min_cal$BTCDirection<- factor(temp_5min_cal$BTCDirection)
summary(temp_5min_cal$BTCDirection)
################### Subset Selction Methods #########################

library(leaps)
attach(temp_5min_cal)
regfit.full =regsubsets(BTCDirection~.,temp_5min_cal)
summary(regfit.full)