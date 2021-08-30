################### Logistic Regression #####################
names(temp_1min_cal)
dim(temp_1min_cal)
summary(temp_1min_cal)
cor(temp_1min_cal[,2:60])
which(cor(temp_1min_cal[,2:60]) > 0.9 & cor(temp_1min_cal[,2:60])<1 )

################### LDA #####################################


################## QDA ###################################### 


################## KNN ###################################### 