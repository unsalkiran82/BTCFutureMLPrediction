temp_1min_cal[,"BTCDirection"]<-"Up"

for(i in 1:86636){
  if(temp_1min_cal$BTCReturn[i]>=0){
    temp_1min_cal$BTCDirection[i] <- "Up"
  }else{
    temp_1min_cal$BTCDirection[i] <- "Down"
  }
  
}

temp_1min_cal$BTCDirection<- factor(temp_1min_cal$BTCDirection)
summary(temp_1min_cal$BTCDirection)
################### Subset Selction Methods #########################

library(leaps)
attach(temp_1min_cal)
regfit.full =regsubsets(train_data$BTCDirection~.,train_data)
summary(regfit.full)