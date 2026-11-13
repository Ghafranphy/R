data1 <- read.csv("C:/Users/Ghafran/Downloads/R_Programming/diabetes.csv")

library(caTools)
split <- sample.split(data1,SplitRatio = 0.8)
trainset <- subset(data1,split=="TRUE")
testset <- subset(data1,split=="FALSE")
model <- glm(Outcome~.,data=trainset,family="binomial")
model_predict <- predict(model,trainset,type="response")
check_result <- cbind(actual_value=trainset$Outcome,predicted_value=data.frame(model_predict))
res <- predict(model,testset,type = "response")

table(ActualValue=testset$Outcome,predictivevalue=res>0.5)

## table function count the outcome of actual value and predict value
(92+38)/(92+12+29+38)
View(cbind(ActualValue=testset$Outcome,predicted_value=data.frame(res)))


library(ROCR)
ROCRpred <- prediction(model_predict,trainset$Outcome)
ROCRPref <- performance(ROCRpred,"tpr","fpr") 
plot(ROCRPref,print.cutoffs.at=seq(0.1,by=0.1))
##   o.1,by=0.1 mean it by 0.1 with gap of 0.1,0.2,0.3 and so on
