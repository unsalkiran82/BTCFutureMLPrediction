################### Quadratic Discriminant Analysis 1 minute ##########
library(MASS)
attach(temp_1min_cal)

qdareg_train_1m=temp_1min_cal[1:65000,a]
qdareg_test_1m=temp_1min_cal[65001:86636,a]
testdir_qda_1m=qdareg_test_1m$BTCDirection

qda.fits1m=qda(BTCDirection~.,data = qdareg_train_1m)
qda.pred1m=predict(qda.fits1m,qdareg_test_1m)
qda.class1m=qda.pred1m$class


table(testdir_qda_1m,qda.class1m)