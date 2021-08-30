###################Desicision Trees 1 min###################
################## Classification Trees #####################

library(tree)
attach(temp_1min_cal)

tree.train_1m <-  temp_1min_cal[1:65000,a]
tree.test_1m <- temp_1min_cal[65001:86636,a]
tree.dir1m_train= BTCDirection[1:65000]
tree.dir1m_test= BTCDirection[65001:86636]


tree.btc_1m=tree(BTCDirection~.,data=tree.train_1m)
summary(tree.btc_1m)

cv.tree1m=cv.tree(tree.btc_1m,FUN=prune.misclass)
prune.btc1h=prune.misclass(tree.btc_1h,best = 1)
tree.pred1m=predict(tree.btc_1m,newdata=tree.test_1m,type="class")
table(tree.dir1m_test,tree.pred1m)

##########################Bagging and Random Forest##################
library(randomForest)

attach(temp_1min_cal)

bag.train_1m <-  temp_1min_cal[1:65000,a]
bag.test_1m <- temp_1min_cal[65001:86636,a]
bag.dir1m_train= BTCDirection[1:65000]
bag.dir1m_test= BTCDirection[65001:86636]

set.seed(1)
bag.btc1m=randomForest(BTCDirection~.,bag.train_1m,mtry=5,ntree=1000)
bag.probs1m=predict(bag.btc1m,newdata = bag.test_1m,type = "class")
table(bag.dir1m_test,bag.probs1m)
importance(bag.btc1m)

#####################Boosting#########################

library(gbm)
attach(temp_1min_cal)

set.seed(1)


boost.train_1m <-  temp_1min_cal[1:65000,a]
boost.test_1m <- temp_1min_cal[65001:86636,a]
boost.dir1m_train= ifelse(BTCDirection[1:65000]=="Down",0,1)
boost.dir1m_test= ifelse(BTCDirection[65001:86636]=="Down",0,1)

boost.btc1m= gbm(boost.dir1m_train~.-BTCDirection,data=boost.train_1m,distribution = "bernoulli",n.trees = 5000,interaction.depth = 6)
summary(boost.btc1m)

boost.prob1m=predict(boost.btc1m,newdata=boost.test_1m,n.trees = 5000,type = "response")

boost.pred1m<-boost.dir1m_test
boost.pred1m[1:21636]=0
boost.pred1m[boost.prob1m>0.5]=1
table(boost.dir1m_test,boost.pred1m)

