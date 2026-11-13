?Boston
library(MASS)
View(Boston)
data <- Boston
library(caTools)
split <- sample.split(data,SplitRatio = 0.7)
training <- subset(data,split=="TRUE")
testingset <- subset(data,,split=="False")
plot(data$crim,data$medv)
cr <- cor(data)
  plot(data$rm,data$medv)
  abline(lm(data$medv~data$rm),col="red")   ## used for linera regressions lines
install.packages("corrplot")
  library(corrplot)
corrplot(cr,type = "lower")  
corrplot(cr,method = "number")  
 

model=lm(medv~.,training)
summary(model)
plot(testingset$medv)
summary(testingset)

