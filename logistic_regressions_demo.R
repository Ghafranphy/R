# Logistic regressions ----
data1 <- read.csv("C:/Users/Ghafran/Downloads/R_Programming/diabetes.csv")

library(caTools)
split <- sample.split(data1,SplitRatio = 0.7)
traing <- subset(data1,split==TRUE)
testing <- subset(data1,split==FALSE)

model <- glm(Outcome~.,data=traing,family = "binomial")

model_predict <- predict(model,traing,type = "response")
#View(data.frame(model_predict))
#View(data.frame(traing))
check <- cbind(trained=traing$Outcome,prediction=data.frame(model_predict))

## creating confusion matrix

table(ActualValue=testing,predictedvalue=model_predict)
#install.packages("caret")
#library(caret)
#conf_matrix <- confusionMatrix(model_predict,testing$Outcome)
res <- predict(model,traing,type = "response")
install.packages("ROCR")
library(ROCR)
ROCRpred <- prediction(res,traing$Outcome)
ROCRPref <- performance(ROCRpred,"tpr","fpr")
## tpr-> true positive rate
## fpr-> False positive rate
plot(ROCRPref,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))
 