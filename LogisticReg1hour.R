#######################Logistic Regression 1 Hour###############
attach(temp_1hour_cal)
logreg_train_1h=temp_1hour_cal[1:1100,a]
logreg_test_1h=temp_1hour_cal[1101:1460,a]
testdir_log_1h=logreg_test_1h$BTCDirection

glm.fits1h=glm(BTCDirection~.,data = logreg_train_1h,family = "binomial")
glm.probs1h=predict(glm.fits1h,logreg_test_1h,type = "response")

glm.pred1h=rep("Down",360)
glm.pred1h[glm.probs1h>0.5]="Up"
table(testdir_log_1h,glm.pred1h)