#############################PCR&PLS Regression##############
library(pls)
temp_5m_data<-temp_5min_cal[,a]
attach(temp_5m_data)
#############################PCR############################
pcr_train_5m<-temp_5m_data[1:13000,]
pcr_test_5m<- temp_5m_data[13001:17328,]
y_test_1m<- as.numeric(temp_5m_data$BTCDirection[13001:17328])
y5min=as.numeric(temp_5m_data$BTCDirection[1:13000])

pcr.fit5min= pcr(y5min~.,data=pcr_train_5m,scale=TRUE, validation="CV")
validationplot(pcr.fit5min,val.type = "MSEP")

pcr.fit5min$scores[,1:14]

pcr.glm5m.fit=glm(BTCDirection~pcr.fit5min$scores[,1]+pcr.fit5min$scores[,2]+pcr.fit5min$scores[,3],data=pcr_train_5m,family = "binomial")
pcr.probs5m=predict(pcr.glm5m.fit,pcr_train_5m,type = "response")

pcr.pred5m=rep("Down",13000)
pcr.pred5m[pcr.probs5m>0.5]="Up"
table(temp_5m_data$BTCDirection[1:13000],pcr.pred5m)