################### Linear Discriminant Analysis 1 minute ##########
library(MASS)
attach(temp_1min_cal)
d<- c("BTCVolLag1","BTCVolLag2","BTCVolLag3","BTCRtnLag1","BTCRtnLag2","BTCRtnLag3",
      "SPCRtnLag1","SPCRtnLag2","SPCRtnLag3",
      "NASCRtnLag1","NASCRtnLag2","NASCRtnLag3","SPCVRtnLag1","SPCVRtnLag2","SPCVRtnLag3",
      "NASCVRtnLag1","NASCVRtnLag2","NASCVRtnLag3","BTCDirection")

ldareg_train_1m=temp_1min_cal[1:65000,d]
ldareg_test_1m=temp_1min_cal[65001:86636,d]
testdir_lda_1m=ldareg_test_1m$BTCDirection

lda.fits1m=lda(BTCDirection~.,data = ldareg_train_1m)
lda.pred1m=predict(lda.fits1m,ldareg_test_1m,type = "response")
lda.class1m=lda.pred1m$class


table(testdir_lda_1m,lda.class1m)