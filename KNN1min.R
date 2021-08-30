################ K Nearest Neighbours 1 min ############

library(class)
attach(temp_1min_cal)


knn_train_1m=as.matrix.data.frame(temp_1min_cal[1:65000,f])
knn_test_1m=as.matrix.data.frame(temp_1min_cal[65001:86636,f])
traindir_knn_1m=temp_1min_cal$BTCDirection[1:65000]

knn.pred1m=knn(knn_train_1m,knn_test_1m,traindir_knn_1m,k=10)

table(temp_1min_cal$BTCDirection[65001:86636],knn.pred1m)