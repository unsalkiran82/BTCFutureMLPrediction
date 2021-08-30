################ K Nearest Neighbours 5 min ############

library(class)
attach(temp_5min_cal)


knn_train_5m=as.matrix.data.frame(temp_5min_cal[1:13000,f])
knn_test_5m=as.matrix.data.frame(temp_5min_cal[13001:17328,f])
traindir_knn_5m=temp_5min_cal$BTCDirection[1:13000]

knn.pred5m=knn(knn_train_5m,knn_test_5m,traindir_knn_5m,k=10)

table(temp_5min_cal$BTCDirection[13001:17328],knn.pred5m)