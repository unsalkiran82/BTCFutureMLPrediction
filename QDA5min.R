################### Quadratic Discriminant Analysis 5 minute ##########
library(MASS)
attach(temp_5min_cal)

qdareg_train_5m=temp_5min_cal[1:13000,a]
qdareg_test_5m=temp_5min_cal[13001:17328,a]
testdir_qda_5m=qdareg_test_5m$BTCDirection

qda.fits5m=qda(BTCDirection~.,data = qdareg_train_5m)
qda.pred5m=predict(qda.fits5m,qdareg_test_5m)
qda.class5m=qda.pred5m$class


table(testdir_qda_5m,qda.class5m)