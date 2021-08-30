################### Linear Discriminant Analysis 1 Hour ##########
library(MASS)
attach(temp_1hour_cal)
b<- c("BTCVolLag1","BTCVolLag2","BTCVolLag3","BTCRtnLag1","BTCRtnLag2","BTCRtnLag3",
      "EURRtnLag1","EURRtnLag2","EURRtnLag3","SPCRtnLag1","SPCRtnLag2","SPCRtnLag3",
      "NASCRtnLag1","NASCRtnLag2","NASCRtnLag3","SPCVRtnLag1","SPCVRtnLag2","SPCVRtnLag3",
      "NASCVRtnLag1","NASCVRtnLag2","NASCVRtnLag3","BTCDirection")

ldareg_train_1h=temp_1hour_cal[1:1100,b]
ldareg_test_1h=temp_1hour_cal[1101:1460,b]
testdir_lda_1h=ldareg_test_1h$BTCDirection

lda.fits1h=lda(BTCDirection~.,data = ldareg_train_1h)
lda.pred1h=predict(lda.fits1h,ldareg_test_1h)
lda.class1h=lda.pred1h$class


table(testdir_lda_1h,lda.class1h)