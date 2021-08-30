################### Linear Discriminant Analysis 5 minute ##########
library(MASS)
attach(temp_5min_cal)
d<- c("BTCVolLag1","BTCVolLag2","BTCVolLag3","BTCRtnLag1","BTCRtnLag2","BTCRtnLag3",
      "SPCRtnLag1","SPCRtnLag2","SPCRtnLag3",
      "NASCRtnLag1","NASCRtnLag2","NASCRtnLag3","SPCVRtnLag1","SPCVRtnLag2","SPCVRtnLag3",
      "NASCVRtnLag1","NASCVRtnLag2","NASCVRtnLag3","BTCDirection")

ldareg_train_5m=temp_5min_cal[1:13000,d]
ldareg_test_5m=temp_5min_cal[13001:17328,d]
testdir_lda_5m=ldareg_test_5m$BTCDirection

lda.fits5m=lda(BTCDirection~.,data = ldareg_train_5m)
lda.pred5m=predict(lda.fits5m,ldareg_test_5m,type = "response")
lda.class5m=lda.pred5m$class


table(testdir_lda_5m,lda.class5m)