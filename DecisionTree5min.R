###################Desicision Trees 5 min###################
################## Classification Trees #####################

library(tree)
attach(temp_5min_cal)

tree.train_5m <-  temp_5min_cal[1:13000,a]
tree.test_5m <- temp_5min_cal[13001:17328,a]
tree.dir5m_train= BTCDirection[1:13000]
tree.dir5m_test= BTCDirection[13001:17328]


tree.btc_5m=tree(BTCDirection~.,data=tree.train_5m)
summary(tree.btc_5m)

cv.tree5m=cv.tree(tree.btc_5m,FUN=prune.misclass)
tree.pred5m=predict(tree.btc_5m,newdata=tree.test_5m,type="class")
table(tree.dir5m_test,tree.pred5m)



##########################Bagging and Random Forest##################

library(randomForest)

attach(temp_5min_cal)

bag.train_5m <-  temp_5min_cal[1:13000,a]
bag.test_5m <- temp_5min_cal[13001:17328,a]
bag.dir5m_train= BTCDirection[1:13000]
bag.dir5m_test= BTCDirection[13001:17328]

set.seed(1)
bag.btc5m=randomForest(BTCDirection~.,bag.train_5m,mtry=5,ntree=5000)
bag.probs5m=predict(bag.btc5m,newdata = bag.test_5m,type = "class")
table(bag.dir5m_test,bag.probs5m)
importance(bag.btc5m)

#####################Boosting#########################

library(gbm)
attach(temp_5min_cal)

set.seed(1)


boost.train_5m <-  temp_5min_cal[1:13000,a]
boost.test_5m <- temp_5min_cal[13001:17328,a]
boost.dir5m_train= ifelse(BTCDirection[1:13000]=="Down",0,1)
boost.dir5m_test= ifelse(BTCDirection[13001:17328]=="Down",0,1)

boost.btc5m= gbm(boost.dir5m_train~.-BTCDirection,data=boost.train_5m,distribution = "bernoulli",n.trees = 5000,interaction.depth = 6)
summary(boost.btc5m)

boost.prob5m=predict(boost.btc5m,newdata=boost.test_5m,n.trees = 5000,type = "response")

boost.pred5m<-boost.dir5m_test
boost.pred5m[1:4328]=0
boost.pred5m[boost.prob5m>0.5]=1
table(boost.dir5m_test,boost.pred5m)

