# support vector machine
library(readr)
heart <- read_csv("heart.csv")
View(heart)
str(heart)

heart$HeartDisease=as.factor(heart$HeartDisease)
View(heart)


set.seed(3033)

id <- sample(2,nrow(heart),prob = c(0.7,0.3),replace = T)
hearttrain <- heart[id==1,]

hearttest <- heart[id==2,]

trctrl <- trainControl(method = "repeatedcv",number = 10,repeats = 3)
svm_linear <- train(HeartDisease~.,data = hearttrain,method="svmLinear",trControl=trctrl,preProcess=c("center","scale"),
                    tunelength=10)

svm_train <- predict(svm_linear,hearttest)
svm_train


grid <- expand.grid(C=c(0,0.01,0.05,0.1,0.25,0.5,0.75,1,1.25,1.5,1.75,2,5))



svm_linear_Grid <- train(HeartDisease~.,data = hearttrain,method="svmLinear",trControl=trctrl,preProcess=c("center","scale"),

                          tuneGrid=grid,tunelength=10)
plot(svm_linear_Grid)



