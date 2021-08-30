######################SVM 1 min ######################
library(e1071)
attach(temp_1min_cal)

svm.train_1m <-  temp_1min_cal[1:65000,a]
svm.test_1m <- temp_1min_cal[65001:86636,a]
svm.dir1m_train= BTCDirection[1:65000]
svm.dir1m_test= BTCDirection[65001:86636]


svmfit_1min=svm(BTCDirection~.,data=svm.train_1m,kernel = "radial", gamma = 0.5,cost = 0.01)
summary(svmfit_1min)
svm_pred1m=predict(svmfit_1min,newdata = svm.test_1m)

tune.out=tune(svm,BTCDirection~.,data=svm.train_1m,kernel = "radial", ranges = list(cost=c(0.01,0.1,0.5,1,10,100,1000), gamma=c(0.5,1,2,3,4)))
summary(tune.out)

svm_pred1m=predict(tune.out$best.model,newdata = svm.test_1m)
table(svm.dir1m_test,svm_pred1m)