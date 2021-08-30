#############################PCR&PLS Regression##############
library(pls)
temp_1h_data<-temp_1hour_cal[,a]
attach(temp_1h_data)
#############################PCR############################
pcr_train_1h<-temp_1h_data[1:1100,]
pcr_test_1h<- temp_1h_data[1101:1460,]
y_test_1h<- as.numeric(temp_1h_data$BTCDirection[1101:1460])
y1hour=as.numeric(temp_1h_data$BTCDirection[1:1100])

pcr.fit1hour= pcr(y1hour~.,data=pcr_train_1h,scale=TRUE, validation="CV")
validationplot(pcr.fit1hour,val.type = "MSEP")

pcr.fit1hour$scores[,1:14]

pcr.glm1h.fit=glm(BTCDirection~pcr.fit1hour$scores[,1]+pcr.fit1hour$scores[,2]+pcr.fit1hour$scores[,3],data=pcr_train_1h,family = "binomial")
pcr.probs1h=predict(pcr.glm1h.fit,pcr_train_1h,type = "response")

pcr.pred1h=rep("Down",1100)
pcr.pred1h[pcr.probs1h>0.5]="Up"
table(temp_1h_data$BTCDirection[1:1100],pcr.pred1h)