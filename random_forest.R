install.packages("dplyr")  # run once
library(dplyr)
library(readr)
diabetes <- read_csv("diabetes.csv")
diabetes$Outcome <- as.factor(diabetes$Outcome)
str(diabetes)


set.seed(2)

id <- sample(2,nrow(diabetes),prob = c(0.7,0.3),replace = TRUE) 

diabet_trian <- diabetes[id==1,]  # id==1 select id where value is 1
diabet_test <- diabetes[id==2,]   # id==2 select id where value is 2
 


install.packages("randomForest")
library(randomForest)
diabet_forest <- randomForest(Outcome~.,data=diabet_trian)
diabet_forest

bestmtry <- tuneRF(diabet_trian,diabet_trian$Outcome,stepFactor = 1.2,improve = 0.01,trace = T,plot = T)

importance(diabet_forest)
diates_test_predict <- predict(diabet_forest,data=diabet_test,type = "class")
diates_test_predict

importance(diabet_forest)
varImpPlot(diabet_forest)


library(caret)
confusionMatrix(diates_test_predict,diabet_test$Outcome)

#__________________________________________________________________________________________________


















