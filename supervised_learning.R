install.packages("dplyr")  # run once
library(dplyr)
library(caTools)
library(rpart)
# linear Regresions

View(mtcars)

# we trying to predict the mpg 
splitratio<- sample.split(mtcars$mpg,SplitRatio = 0.65) 
train <- subset(mtcars,splitratio==T)
test <- subset(mtcars,splitratio==F)
model <- lm(mpg~.,data=train)
# . dot represent the all data again all the data set 
model.predict <- predict(model,test)

check <- cbind(actual=test$mpg,predicted=model.predict)
check2<- View(data.frame(check))
model.predict <- predict(model,data.frame(cyl=8,disp=350.0,hp=245,drat=3.73,wt=3.840,qsec=15.41,vs=0,am=0,gear=3,carb=4))
View(model.predict)


#_______________________________________________________________________________________________________________________________

# linear egressions (used just two column disp+hp)
library(caTools)
splitratio <- sample.split(mtcars$mpg,SplitRatio = 0.6)
test <- subset(mtcars,splitratio==TRUE)
train <- subset(mtcars,splitratio==FALSE)
model <- lm(mpg~disp+hp,train)
#  model <- lm(mpg~.-gear,-carb,train)  #  all column except gear and carb
model.predict <- predict(model,data.frame(disp=160.0,hp=110))
model.predict
summary(model)


#___________________________________________________________________________________________________________________________________

# clssification regression

dataset <- read.csv("Housing_Price_Data.csv")
View(dataset)

dataset2 <- dataset %>% select(price,area,bedrooms,stories,mainroad,guestroom,basement,hotwaterheating,airconditioning)
splitratio2 <- sample.split(dataset2$guestroom,SplitRatio = 0.8)
train2 <- subset(dataset2,splitratio2==TRUE)
test2 <- subset(dataset2,splitratio2==FALSE)
modeclassification <- rpart(guestroom~area,data = train2,method = "class")
model.preidct2 <- predict(modeclassification,train2,type = "class")
print(as.character(model.preidct2))
library(caret)
library(e1071)
confusionMatrix(as.factor(train2$guestroom),as.factor(model.preidct2))
# Confusion matrix also work for both train and test dataset
#___________________________________________________________________________________________________________________________________________

# clustring
View(iris)
dataset <- iris %>% select(-5)
k1 <- kmeans(dataset,3)
k2 <- cbind(iris,k1$cluster)
k3 <- cbind(k2,iris$Species)
View(k3)
#____________________________________________________________________________________________________________________________

# logistic regressions
library(caTools)
data(mtcars)
View(mtcars)
spliting <- sample.split(mtcars$vs,SplitRatio=0.7)
training <- subset(mtcars,spliting==T)

model <- glm(vs~wt+disp,training,family="binomial")
model.predict <- predict(model,data.frame(wt=2.620,disp=160),type="response")

model.predict
model
#________________________________________________________________________________________________________________________________________
# logistic regressions (0 ,1)


diabetes <- read_csv("diabetes.csv")
data1<- diabetes
split <- sample.split(data1$Outcome,SplitRatio = 0.8)
split
training2 <- subset(data1,split=="TRUE")
testing <- subset(data1,split=="FALSE")

model <- glm(Outcome~.,training2,family="binomial")

result <- predict(model,training2,type="response")
result

(table(actual_value=testing$Outcome,predicted_value=result>0.3))


library(ROCR)
ROCRpred <- prediction(result,training2$Outcome)
ROCRref <- performance(ROCRpred,"tpr","fpr")
plot(ROCRref,print.cutoffs.at=seq(0.1,by=0.1))
#______________________________________________________________________________________________________
#load data into R
library(dplyr)
income <- read_csv("C:/Users/Ghafran/Downloads/R_Programming/income.csv")
View(income)
plot(income$Age,income$`Income($)`)
income12 <- income %>% select(Age,`Income($)`)
set.seed(123)
kmeans_result <- kmeans(income12,centers =3,nstart = 25)
kmeans_result
final3 <- cbind(income,cluster=kmeans_result$cluster)
cluster_1 <-  final3 %>% filter(cluster==1)
cluster_2 <-  final3 %>% filter(cluster==2)
cluster_3 <-  final3 %>% filter(cluster==3)
final4<- data.frame(center=kmeans_result$centers)

plot(final3$Age,final3$`Income($)`,col=final3$cluster,pch=15,xlab = "Age",ylab = "Income")

points(final4$center.Age,final4$center.Income,pch=8,cex=2,col="orange")


#________________________________________________________________________________________________


# Prepare data
income_data <- income %>% select(Age, `Income($)`)

# Compute total within-cluster sum of squares for k = 1 to 10
wcss <- numeric(10)

for (i in 1:10) {
  set.seed(123)
  km <- kmeans(income_data,centers = i,nstart = 25)
  wcss[i] <- km$tot.withinss
}
plot( wcss, type = "b",        # type 'b' = points + lines
     pch = 19, col = "blue")

wss2 <- numeric(10)

wss2 <- lapply(1:10, function(i){
  i}
  )

print(wcss)
#________________________________________________________________________________________________
dataset <- mtcars
ggplot(final3,aes(x=Age,y=`Income($)`,color=`Income($)`))+geom_point()

