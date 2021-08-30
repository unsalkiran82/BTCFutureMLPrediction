################### Quadratic Discriminant Analysis 1 Hour ##########
library(MASS)
attach(temp_1hour_cal)

qdareg_train_1h=temp_1hour_cal[1:1100,a]
qdareg_test_1h=temp_1hour_cal[1101:1460,a]
testdir_qda_1h=qdareg_test_1h$BTCDirection

qda.fits1h=qda(BTCDirection~.,data = qdareg_train_1h)
qda.pred1h=predict(qda.fits1h,qdareg_test_1h)
qda.class1h=qda.pred1h$class


table(testdir_qda_1h,qda.class1h)
