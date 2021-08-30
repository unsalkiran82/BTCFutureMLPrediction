###################Desicision Trees 1 Hour###################
################## Classification Trees #####################

library(tree)
attach(temp_1hour_cal)

tree.train_1h <-  temp_1hour_cal[1:1100,a]
tree.test_1h <- temp_1hour_cal[1101:1460,a]
tree.dir1h_train= BTCDirection[1:1100]
tree.dir1h_test= BTCDirection[1101:1460]


tree.btc_1h=tree(BTCDirection~.,data=tree.train_1h)
summary(tree.btc_1h)

cv.tree1h=cv.tree(tree.btc_1h,FUN=prune.misclass)
tree.pred1h=predict(tree.btc_1h,newdata=tree.test_1h,type="class")
table(tree.dir1h_test,tree.pred1h)


##########################Bagging and Random Forest##################

library(randomForest)

attach(temp_1hour_cal)

bag.train_1h <-  temp_1hour_cal[1:1100,a]
bag.test_1h <- temp_1hour_cal[1101:1460,a]
bag.dir1h_train= BTCDirection[1:1100]
bag.dir1h_test= BTCDirection[1101:1460]

set.seed(1)
bag.btc1h=randomForest(BTCDirection~.,bag.train_1h,mtry=5,ntree=5000)
bag.probs1h=predict(bag.btc1h,newdata = bag.test_1h,type = "class")
table(bag.dir1h_test,bag.probs1h)
importance(bag.btc1h)

#####################Boosting#########################

library(gbm)
attach(temp_1hour_cal)

set.seed(1)


boost.train_1h <-  temp_1hour_cal[1:1100,a]
boost.test_1h <- temp_1hour_cal[1101:1460,a]
boost.dir1h_train= ifelse(BTCDirection[1:1100]=="Down",0,1)
boost.dir1h_test= ifelse(BTCDirection[1101:1460]=="Down",0,1)

boost.btc1h= gbm(boost.dir1h_train~.-BTCDirection,data=boost.train_1h,distribution = "bernoulli",n.trees = 5000,interaction.depth = 6)
summary(boost.btc1h)

boost.prob1h=predict(boost.btc1h,newdata=boost.test_1h,n.trees = 5000,type = "response")

boost.pred1h<-boost.dir1h_test
boost.pred1h[1:360]=0
boost.pred1h[boost.prob1h>0.5]=1
table(boost.dir1h_test,boost.pred1h)

