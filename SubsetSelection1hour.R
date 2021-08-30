temp_1hour_cal[,"BTCDirection"]<-"Up"

for(i in 1:1460){
  if(temp_1hour_cal$BTCReturn[i]>=0){
    temp_1hour_cal$BTCDirection[i] <- "Up"
  }else{
    temp_1hour_cal$BTCDirection[i] <- "Down"
  }
  
}

temp_1hour_cal$BTCDirection<- factor(temp_1hour_cal$BTCDirection)
summary(temp_1hour_cal$BTCDirection)
################### Subset Selction Methods #########################

library(leaps)
attach(temp_1h_data)
regfit.full =regsubsets(BTCDirection~.,temp_1h_data)
summary(regfit.full)