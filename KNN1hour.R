################ K Nearest Neighbours 1 Hour ############

library(class)
attach(temp_1hour_cal)
f<- c("BTCVolLag1","BTCVolLag2","BTCVolLag3","BTCRtnLag1","BTCRtnLag2","BTCRtnLag3",
      "BTCRVolLag1","BTCRVolLag2","BTCRVolLag3","BTCAmhLag1","BTCAmhLag2","BTCAmhLag3",
      "EURRtnLag1","EURRtnLag2","EURRtnLag3","SPCRtnLag1","SPCRtnLag2","SPCRtnLag3",
      "NASCRtnLag1","NASCRtnLag2","NASCRtnLag3","SPCVRtnLag1","SPCVRtnLag2","SPCVRtnLag3",
      "NASCVRtnLag1","NASCVRtnLag2","NASCVRtnLag3")

knn_train_1h=as.matrix.data.frame(temp_1hour_cal[1:1100,f])
knn_test_1h=as.matrix.data.frame(temp_1hour_cal[1101:1460,f])
traindir_knn_1h=temp_1hour_cal$BTCDirection[1:1100]

knn.pred1h=knn(knn_train_1h,knn_test_1h,traindir_knn_1h,k=10)

table(temp_1hour_cal$BTCDirection[1101:1460],knn.pred1h)