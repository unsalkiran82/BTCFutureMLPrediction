#######################Logistic Regression 1 minute###############
attach(temp_1min_cal)
logreg_train_1m=temp_1min_cal[1:65000,a]
logreg_test_1m=temp_1min_cal[65001:86636,a]
testdir_log_1m=logreg_test_1m$BTCDirection

glm.fits1m=glm(BTCDirection~.,data = logreg_train_1m,family = "binomial")
glm.probs1m=predict(glm.fits1m,logreg_test_1m,type = "response")

glm.pred1m=rep("Down",21636)
glm.pred1m[glm.probs1m>0.5]="Up"
table(testdir_log_1m,glm.pred1m)