######################SVM 1 Hour ######################
library(e1071)
attach(temp_1hour_cal)

svm.train_1h <-  temp_1hour_cal[1:1100,a]
svm.test_1h <- temp_1hour_cal[1101:1460,a]
svm.dir1h_train= BTCDirection[1:1100]
svm.dir1h_test= BTCDirection[1101:1460]


svmfit_1hour=svm(BTCDirection~.,data=svm.train_1h,kernel = "radial", gamma = 1,cost = 1)
summary(svmfit_1hour)
svm_pred1h=predict(svmfit_1hour,newdata = svm.test_1h)

tune.out=tune(svm,BTCDirection~.,data=svm.train_1h,kernel="radial", ranges = list(cost=c(0.01,0.1,0.5,1,10,100,1000), gamma=c(0.5,1,2,3,4)))
summary(tune.out)

svm_pred1h=predict(tune.out$best.model,newdata = svm.test_1h)
table(svm.dir1h_test,svm_pred1h)