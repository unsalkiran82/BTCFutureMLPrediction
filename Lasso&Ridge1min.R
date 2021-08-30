####################### Ridge Regression  #####################
library(glmnet)
temp_1m_data<-temp_1min_cal[,a]
attach(temp_1m_data)
##################### all data###################

x=model.matrix(BTCDirection~.,temp_1m_data)[,-1]
y=as.numeric(temp_1min_cal$BTCDirection)


grid=10^seq(10,-2,length=100)
ridge.mod=glmnet(x,y,alpha = 1000,lambda = grid,thresh = 1e-12,family = "binomial")
dim(coef(ridge.mod))
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2))

#######################train and test####################

x_train_1m=model.matrix(BTCDirection~.,temp_1m_data[1:65000,])[,-1]
y_train_1m=as.numeric(temp_1m_data$BTCDirection[1:65000])
x_test_1m=model.matrix(BTCDirection~.,temp_1m_data[65001:86636,])[,-1]
y_test_1m=as.numeric(temp_1m_data$BTCDirection[65001:86636])

grid=10^seq(10,-2,length=100)
ridge.mod1m=glmnet(x_train_1m,y_train_1m,alpha =0,lambda=grid,family = "binomial")

cv.out=cv.glmnet(x_train_1m,y_train_1m,alpha=0,family="binomial")
bestlam1m=cv.out$lambda.min

ridge.pred1m=predict(ridge.mod1m,s=bestlam1m,newx = x_test_1m,type ="response")

glmPred_1m_test<-BTCDirection[65001:86636]
glmPred_1m_test[]<-"Down"
glmPred_1m_test[ridge.pred1m>0.5]="Up"
table(BTCDirection[65001:86636],glmPred_1m_test)


###############################Lasso################################
x_train_1m=model.matrix(BTCDirection~.,temp_1m_data[1:65000,])[,-1]
y_train_1m=as.numeric(temp_1m_data$BTCDirection[1:65000])
x_test_1m=model.matrix(BTCDirection~.,temp_1m_data[65001:86636,])[,-1]
y_test_1m=as.numeric(temp_1m_data$BTCDirection[65001:86636])


grid=10^seq(10,-2,length=100)
lasso.mod1m=glmnet(x_train_1m,y_train_1m,alpha = 1,lambda = grid,family = "binomial")

cv.out=cv.glmnet(x_train_5m,y_train_5m,alpha=1,family="binomial")
bestlam1m=cv.out$lambda.min

lasso.pred1m=predict(lasso.mod1m, s=bestlam1m , newx = x_test_1m,type = "response")

lassoglmPred_1m_test<-BTCDirection[65001:86636]
lassoglmPred_1m_test[]<-"Down"
lassoglmPred_1m_test[lasso.pred1m>0.5]="Up"
table(BTCDirection[65001:86636],lassoglmPred_1m_test)
