######################SVM 5 min ######################
library(e1071)
attach(temp_5min_cal)

svm.train_5m <-  temp_5min_cal[1:13000,a]
svm.test_5m <- temp_5min_cal[13001:17328,a]
svm.dir5m_train= BTCDirection[1:13000]
svm.dir5m_test= BTCDirection[13001:17328]


svmfit_5min=svm(BTCDirection~.,data=svm.train_5m,kernel = "radial", gamma = 0.5,cost = 0.01)
summary(svmfit_5min)
svm_pred5m=predict(svmfit_5min,newdata = svm.test_5m)

tune.out=tune(svm,BTCDirection~.,data=svm.train_5m,kernel="radial", ranges = list(cost=c(0.01,0.1,0.5,1,10,100,1000), gamma=c(0.5,1,2,3,4)))
summary(tune.out)

svm_pred5m=predict(tune.out$best.model,newdata = svm.test_5m)
table(svm.dir5m_test,svm_pred5m)