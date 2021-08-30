########################Bitcoin 1 Hour Neural Network###########

##############################Keras load##########
library(devtools)  
devtools::install_github("rstudio/tensorflow",force = TRUE)
library(tensorflow)
install_tensorflow(envname = "tf")
library(tensorflow)
use_condaenv("tf")
library(keras)
library(dummies)

#######################¯Keras RStudio######
install.packages("keras")
library(keras)
keras::install_keras()
install.packages("devtools")
library('devtools')
devtools::install_github("rstudio/keras")
library(keras)
install_keras(tensorflow = "1.5.0")
use_condaenv("r-tensorflow", required = TRUE)
install_tensorflow(gpu=TRUE)
install_tensorflow(method = "conda", conda = "auto",
                   version = "1.5.0", envname = "r-tensorflow")
install.packages("tensorflow")
library(tensorflow)
library(reticulate)
use_condaenv("r-tensorflow", required = TRUE)
py_run_string("import tensorflow as tf")
py_run_string("import keras")




############################ Neural Network########
NNdata_1Hour <- temp_1hour_cal[1:1460,a]

N = nrow(NNdata_1Hour)
p = ncol(NNdata_1Hour)

X = dummy.data.frame(NNdata_1Hour[, -p])
Y = NNdata_1Hour[, p]
data = cbind(X, Y)
set.seed(1690)
Ind = sample(N, 1100, replace = FALSE) 
p = ncol(data)
data[,"Y"]=ifelse(data[,"Y"]=="Down",0,1)
Y_train = data.matrix(data[Ind, p])
X_train  = data.matrix(data[Ind, -p])

Y_test = data.matrix(data[-Ind, p])
X_test  = data.matrix(data[-Ind, -p])


k = ncol(X_train)

model <- keras_model_sequential() %>% 
  layer_dense(units = 60, activation = 'relu', input_shape = k) %>% 
  layer_dense(units = 60, activation = 'relu') %>%
   layer_dense(units = 1, activation = 'sigmoid')


summary(model)

model %>% compile(
  optimizer = optimizer_rmsprop(lr=0.001),
  loss = "binary_crossentropy",
  metrics = c("accuracy")
)

track = model %>% fit(X_train, Y_train, epochs = 20, batch_size = 5)
plot(track)

##prediction 
pred <- model %>% predict(X_test)
Y_pred = round(pred)
# Confusion matrix
CM = table(Y_pred, Y_test)

# evaluate the model
evals <- model %>% evaluate(X_test, Y_test)

accuracy = evals[2][[1]]* 100


