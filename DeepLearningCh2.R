library(keras)
library(tensorflow)
mnist <- dataset_mnist()
train_images <- mnist$train$x
train_labels <- mnist$train$y
test_images <- mnist$test$x
test_labels <- mnist$test$y

np <- reticulate::import("numpy")
np$version$full_version
tensorflow::install_tensorflow()

////////////////////////////////
library(devtools)  
devtools::install_github("rstudio/tensorflow",force = TRUE)
library(tensorflow)
install_tensorflow(envname = "tf")
library(tensorflow)
use_condaenv("tf")
library(keras)
mnist <- dataset_mnist()
///////////////////////////////////////////
library(keras)
mnist <- dataset_mnist()
train_images <- mnist$train$x
train_labels <- mnist$train$y
test_images <- mnist$test$x
test_labels <- mnist$test$y
str(train_images)
str(train_labels)
str(test_images)
str(test_labels)

network <- keras_model_sequential() %>%
layer_dense(units = 512, activation = "relu", input_shape = c(28 * 28)) %>%
layer_dense(units = 10, activation = "softmax")

network %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)


train_images <- array_reshape(train_images, c(60000, 28 * 28))
train_images <- train_images / 255
test_images <- array_reshape(test_images, c(10000, 28 * 28))
test_images <- test_images / 255


train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)


network %>% fit(train_images, train_labels, epochs = 5, batch_size = 128)

metrics <- network %>% evaluate(test_images, test_labels)
metrics
network %>% predict_classes(test_images[1:10,])

x <- c(12, 3, 6, 14, 10)
str(x)
dim(as.array(x))

x <- matrix(rep(0, 3*5), nrow = 3, ncol = 5)
x
dim(x)

x <- array(rep(0, 2*3*2), dim = c(2,3,2))
str(x)
dim(x)

length(dim(train_images))
dim(train_images)
typeof(train_images)
digit <- train_images[5,,]
plot(as.raster(digit, max = 255))

my_slice <- train_images[10:99,,]
dim(my_slice)

my_slice <- train_images[10:99,1:28,1:28]
dim(my_slice)
my_slice <- train_images[, 15:28, 15:28]
batch <- train_images[1:128,,]
batch <- train_images[129:256,,]

layer_dense(units = 512, activation = "relu")
output = relu(dot(W, input) + b)

naive_relu <- function(x) {
  for (i in nrow(x))
    for (j in ncol(x))
      x[i, j] <- max(x[i, j], 0)
    x
}

naive_add <- function(x, y) {
  for (i in nrow(x))
    for (j in ncol(x))
      x[i, j] = x[i, j] + y[i, j]
    x
}

z <- x + y
z <- pmax(z, 0)
sweep(x, 2, y, `+`)

x <- array(round(runif(1000, 0, 9)), dim = c(64, 3, 32, 10))
# y is a tensor of 5s of shape (32, 10)
y <- array(5, dim = c(32, 10))
# The output z has shape (64, 3, 32, 10) like x
z <- sweep(x, c(3, 4), y, pmax)

z <- x %*% y
z = x . y



naive_vector_dot <- function(x, y) {
  z <- 0
  for (i in 1:length(x))
    z <- z + x[[i]] * y[[i]]
  z
}

naive_matrix_vector_dot <- function(x, y) {
  z <- rep(0, nrow(x))
  for (i in 1:nrow(x))
    for (j in 1:ncol(x))
      z[[i]] <- z[[i]] + x[[i, j]] * y[[j]]
    z
}

naive_matrix_vector_dot <- function(x, y) {
  z <- rep(0, nrow(x))
  for (i in 1:nrow(x))
    z[[i]] <- naive_vector_dot(x[i,], y)
  z
}

naive_matrix_dot <- function(x, y) {
  z <- matrix(0, nrow = nrow(x), ncol = ncol(y))
  for (i in 1:nrow(x))
    for (j in 1:ncol(y)) {
      row_x <- x[i,]
      column_y <- y[,j]
      z[i, j] <- naive_vector_dot(row_x, column_y)
    }
  z
}

train_images <- array_reshape(train_images, c(60000, 28 * 28))

x <- matrix(c(0, 1,
              2, 3,
              4, 5),
            nrow = 3, ncol = 2, byrow = TRUE)
x
x <- array_reshape(x, dim = c(6, 1))
x
x <- array_reshape(x, dim = c(2, 3))
x


x <- matrix(0, nrow = 300, ncol = 20)
dim(x)

x <- t(x)
dim(x)

library(keras)


f(x + epsilon_x) = y + epsilon_y
f(x + epsilon_x) = y + a * epsilon_x


y_pred = dot(W, x)
loss_value = loss(y_pred, y)

loss_value = f(W)


past_velocity <- 0
momentum <- 0.1
while (loss > 0.01) {
  params <- get_current_parameters()
  w <- params$w
  loss <- params$loss
  gradient <- params$gradient
  velocity <- past_velocity * momentum + learning_rate * gradient
  w <- w + momentum * velocity - learning_rate * gradient
  past_velocity <- velocity
  update_parameter(w)
}

library(keras)
mnist <- dataset_mnist()
train_images <- mnist$train$x
train_images <- array_reshape(train_images, c(60000, 28 * 28))
train_images <- train_images / 255
test_images <- mnist$test$x
test_images <- array_reshape(test_images, c(10000, 28 * 28))
test_images <- test_images / 255

network <- keras_model_sequential() %>%
  layer_dense(units = 512, activation = "relu", input_shape = c(28*28)) %>%
  layer_dense(units = 10, activation = "softmax")

network %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

network %>% fit(train_images, train_labels, epochs = 5, batch_size = 128)


