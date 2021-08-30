####################### Ridge Regression  #####################
library(glmnet)
a<- c("BTCVolLag1","BTCVolLag2","BTCVolLag3","BTCRtnLag1","BTCRtnLag2","BTCRtnLag3",
"BTCRVolLag1","BTCRVolLag2","BTCRVolLag3","BTCAmhLag1","BTCAmhLag2","BTCAmhLag3",
"EURRtnLag1","EURRtnLag2","EURRtnLag3","SPCRtnLag1","SPCRtnLag2","SPCRtnLag3",
"NASCRtnLag1","NASCRtnLag2","NASCRtnLag3","SPCVRtnLag1","SPCVRtnLag2","SPCVRtnLag3",
"NASCVRtnLag1","NASCVRtnLag2","NASCVRtnLag3","BTCDirection")
temp_1h_data<-temp_1hour_cal[,a]
attach(temp_1h_data)
##################### all data###################

x=model.matrix(BTCDirection~.,temp_1h_data)[,-1]
y=as.numeric(temp_1hour_cal$BTCDirection)


grid=10^seq(10,-2,length=100)
ridge.mod=glmnet(x,y,alpha = 1000,lambda = grid,thresh = 1e-12,family = "binomial")
dim(coef(ridge.mod))
ridge.mod$lambda[60]
coef(ridge.mod)[,60]
sqrt(sum(coef(ridge.mod)[-1,60]^2))

#######################train and test####################

x_train_1hour=model.matrix(BTCDirection~.,temp_1h_data[1:1100,])[,-1]
y_train_1hour=as.numeric(temp_1h_data$BTCDirection[1:1100])
x_test_1hour=model.matrix(BTCDirection~.,temp_1h_data[1101:1460,])[,-1]
y_test_1hour=as.numeric(temp_1h_data$BTCDirection[1101:1460])

grid=10^seq(10,-2,length=100)
ridge.mod=glmnet(x_train_1hour,y_train_1hour,alpha=0,lambda=grid,thresh = 1e-12,family = "binomial")

cv.out=cv.glmnet(x_train_1hour,y_train_1hour,alpha=0,family="binomial")
bestlam=cv.out$lambda.min

ridge.pred=predict(ridge.mod,s=bestlam,newx = x_test_1hour,type ="response")



glmPred_test<-BTCDirection[1101:1460]
glmPred_test[]<-"Down"
glmPred_test[ridge.pred>0.5]="Up"
table(BTCDirection[1101:1460],glmPred_test)


###############################Lasso################################
x_train_1hour=model.matrix(BTCDirection~.,temp_1h_data[1:1100,])[,-1]
y_train_1hour=as.numeric(temp_1h_data$BTCDirection[1:1100])
x_test_1hour=model.matrix(BTCDirection~.,temp_1h_data[1101:1460,])[,-1]
y_test_1hour=as.numeric(temp_1h_data$BTCDirection[1101:1460])


grid=10^seq(10,-2,length=100)
lasso.mod=glmnet(x_train_1hour,y_train_1hour,alpha = 1,lambda = grid,family = "binomial")


cv.out=cv.glmnet(x_train_1hour,y_train_1hour,alpha=1,family="binomial")
bestlam=cv.out$lambda.min

lasso.pred=predict(lasso.mod,s=bestlam,newx = x_test_1hour,type = "response")

lassoglmPred_test<-BTCDirection[1101:1460]
lassoglmPred_test[]<-"Down"
lassoglmPred_test[lasso.pred>0.5]="Up"
table(BTCDirection[1101:1460],lassoglmPred_test)
