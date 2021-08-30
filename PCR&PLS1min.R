#############################PCR&PLS Regression##############
library(pls)
temp_1m_data<-temp_1min_cal[,a]
attach(temp_1m_data)
#############################PCR############################
pcr_train_1m<-temp_1m_data[1:65000,]
pcr_test_1m<- temp_1m_data[65001:86636,]
y_test_1m<- as.numeric(temp_1m_data$BTCDirection[65001:86636])
y1min=as.numeric(temp_1m_data$BTCDirection[1:65000])

pcr.fit1min= pcr(y1min~.,data=pcr_train_1m,scale=TRUE, validation="CV")
validationplot(pcr.fit1min,val.type = "MSEP")

pcr.fit1min$scores[,1:14]

pcr.glm1m.fit=glm(BTCDirection~pcr.fit1min$scores[,1]+pcr.fit1min$scores[,2]+pcr.fit1min$scores[,3],data=pcr_train_1m,family = "binomial")
pcr.probs1m=predict(pcr.glm1m.fit,pcr_train_1m,type = "response")

pcr.pred1m=rep("Down",65000)
pcr.pred1m[pcr.probs1m>0.5]="Up"
table(temp_1m_data$BTCDirection[1:65000],pcr.pred1m)