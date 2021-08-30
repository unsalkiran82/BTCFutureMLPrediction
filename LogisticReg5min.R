#######################Logistic Regression 5 minute###############
attach(temp_5min_cal)
logreg_train_5m=temp_5min_cal[1:13000,a]
logreg_test_5m=temp_5min_cal[13001:17328,a]
testdir_log_5m=logreg_test_5m$BTCDirection

glm.fits5m=glm(BTCDirection~.,data = logreg_train_5m,family = "binomial")
glm.probs5m=predict(glm.fits5m,logreg_test_5m,type = "response")

glm.pred5m=rep("Down",4328)
glm.pred5m[glm.probs5m>0.5]="Up"
table(testdir_log_5m,glm.pred5m)