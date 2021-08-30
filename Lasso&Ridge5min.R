####################### Ridge Regression  #####################
library(glmnet)
temp_5m_data<-temp_5min_cal[,a]
attach(temp_5m_data)
##################### all data###################

x=model.matrix(BTCDirection~.,temp_5m_data)[,-1]
y=as.numeric(temp_5min_cal$BTCDirection)


grid=10^seq(10,-2,length=100)
ridge.mod=glmnet(x,y,alpha = 1000,lambda = grid,thresh = 1e-12,family = "binomial")
dim(coef(ridge.mod))
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2))

#######################train and test####################

x_train_5m=model.matrix(BTCDirection~.,temp_5m_data[1:13000,])[,-1]
y_train_5m=as.numeric(temp_5m_data$BTCDirection[1:13000])
x_test_5m=model.matrix(BTCDirection~.,temp_5m_data[13001:17328,])[,-1]
y_test_5m=as.numeric(temp_5m_data$BTCDirection[13001:17328])

grid=10^seq(10,-2,length=100)
ridge.mod5m=glmnet(x_train_5m,y_train_5m,alpha =0,lambda=grid,family = "binomial")

cv.out=cv.glmnet(x_train_5m,y_train_5m,alpha=0,family="binomial")
bestlam5m=cv.out$lambda.min

ridge.pred5m=predict(ridge.mod5m,s=bestlam5m,newx = x_test_5m,type ="response")


glmPred_5m_test<-BTCDirection[13001:17328]
glmPred_5m_test[]<-"Down"
glmPred_5m_test[ridge.pred5m>0.5]="Up"
table(BTCDirection[13001:17328],glmPred_5m_test)


###############################Lasso################################
x_train_5m=model.matrix(BTCDirection~.,temp_5m_data[1:13000,])[,-1]
y_train_5m=as.numeric(temp_5m_data$BTCDirection[1:13000])
x_test_5m=model.matrix(BTCDirection~.,temp_5m_data[13001:17328,])[,-1]
y_test_5m=as.numeric(temp_5m_data$BTCDirection[13001:17328])


grid=10^seq(10,-2,length=100)
lasso.mod5m=glmnet(x_train_5m,y_train_5m,alpha = 1,lambda = grid,family = "binomial")

cv.out=cv.glmnet(x_train_5m,y_train_5m,alpha=1,family="binomial")
bestlam5m=cv.out$lambda.min

lasso.pred5m=predict(lasso.mod5m, s=bestlam5m , newx = x_test_5m,type = "response")

lassoglmPred_5m_test<-BTCDirection[13001:17328]
lassoglmPred_5m_test[]<-"Down"
lassoglmPred_5m_test[lasso.pred5m>0.5]="Up"
table(BTCDirection[13001:17328],lassoglmPred_5m_test)
