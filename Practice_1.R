############################################################
# R Programming: Fundamentals, Data Structures, Data
# Manipulation, Data Visualization, and Machine Learning
#
# Topics Covered:
# 1. Vectors and Data Types
# 2. Logical Operators and Arithmetic Operations
# 3. Matrices, Arrays, Lists, and Data Frames
# 4. Conditional Statements (if-else and switch)
# 5. Loops (for, while, and repeat)
# 6. String Manipulation and Functions
# 7. Data Visualization Using Base R
# 8. Data Visualization Using ggplot2
# 9. Data Manipulation Using dplyr
# 10. Data Exploration and Analysis
# 11. Train-Test Splitting
# 12. Simple and Multiple Linear Regression
# 13. Model Prediction and Error Evaluation (RMSE)
############################################################
# vector

#logical

vtr=c(TRUE,FALSE)

class(vtr)

vtr2=c(15,25,6,6.8)

class(vtr2)
which(vtr2==15)
which(vtr2>10)
vtr33=c(15L,35L,57L)
class(vtr33)


vtr6=("Hello World")
class(vtr6)


vtr7=c(TRUE,35L,34.66)     ## Converting thing into the decimal point
class(vtr7)


vtr8=c(vtr7,"Hello World")
vtr77=c(FALSE,"Hello",35L)
class(vtr77)
mtr=matrix(c(5:26),2,11)
View(mtr)
vtr55 = matrix(c(1:50),nrow = 10,ncol = 5)
vttadd=rbind(mtr,mtr)
array6=array(c(0:15),dim = c(4,4,2,2))
View(array6)
list(vtr7,vtr8,vtr55,array6)
vtr=(1:5)
vtr2 = c("adam","ghfran","khan","taimore","huzafa")
vtr3 = c(10,15,16,170,250)
data.frame(vtr,vtr2,vtr3)

print(6%%7)
print(6/7)
print(22%/%7)
var=35
var1=65
print(var!=var1)
value34 = c(1,1,0,0)
value35 = c(0,1,0,1)
print(value34&value35)
print(value34|value35)
print(!value34,!value35)

var1=20
var2=30
if ((var1+var2)>100) { 
  print("The answer is then 50")
} else   {print(100)}


switch(4,
       '1'=print("Monday"),
       '2'=print("Tuesday"),
       '3'=print("Wednesday"),
       '4'=print("Thrusday"),
       '5'= print("Friday"),
       '6'=print("Saturday"),
       '7'=print("Sunday"),
       print("invalid staement")
       )
var1=5
repeat {
 
  if (var1>21){
    break
  }
  print(var1)
  var1=var1+2
  
}
var22=1
while (var22<21){
  var22=var22+2
  print(var22)
}
  
for (i in 1:10){

  print(i)  
  
}  
str1 <- "Hello wolrd"
str2<- "Hello wolrd kohat"
list(str1,str2)
paste(str1,str2)
nchar(paste(str1,str2))
str3<-str2
toupper(str3)
str6=substr(str3,5,15)
print(str6)


fib0<- function( a){
  var1=0
  var2=1
  print(var1)
  print(var2)
  for (x in 1:a) {
    var3=var1+var2
    print(var3)
    var1=var2
    var=var3
  }
}

my_function<- function(b){
  paste(b)
}
my_function(10)



View(iris)
table(iris$Species)
plot(iris$Sepal.Length~iris$Sepal.Length,ylab = "Lenth",xlab="Length2",main="sepal length")
plot(iris$Petal.Length~iris$Petal.Length,ylab = "Lenth",xlab="Length2",main="sepal length",col="blue",pch=16)
hist(iris$Petal.Length,ylab = "Lenth",xlab="Length2",main="sepal length",col="blue",pch=16)

boxplot(iris$Sepal.Length~iris$Species,col="blue")
library(ggplot2)   # Grammar graphics
ggplot(data=iris)
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))+geom_point()
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,colour = Species))+geom_point()
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,shape = Species))+geom_point()

ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,shape = Species,colour = Species))+geom_point()

read.csv("C:/Users/Ghafran/Downloads/R_Programming/kc_house_data.csv")->house
View(house)
library(dplyr)
house %>% select(c(-1))->house
View(house)
ggplot(data=house,aes(x=price))+geom_histogram(bins=50,fill="palegreen")
ggplot(data=house,aes(x=price,fill="view"))+geom_histogram(bins=50)
read.csv("C:/Users/Ghafran/Downloads/R_Programming/Housing_Price_Data.csv")->house11
ggplot(house11,aes(x=price,fill=prefarea))+geom_histogram(position = "fill")
ggplot(house11,aes(x=prefarea))+geom_bar()
ggplot(house11,aes(x=prefarea,fill=airconditioning))+geom_bar(position="fill")       


ggplot(house11,aes(x=price))+geom_freqpoly(bins=100)

ggplot(house11,aes(x=price,col=airconditioning))+geom_freqpoly()

ggplot(house11,aes(x=airconditioning))
View(house11)
ggplot(house11,aes(x=factor(area),y=price))+geom_boxplot(fill="blue")

ggplot(house11,aes(x=guestroom,y=price,fill = factor(airconditioning)))+geom_boxplot()
ggplot(house11,aes(y=price,x=area))+geom_smooth()

ggplot(house11,aes(y=price,x=area,col=airconditioning))+geom_smooth(se=F)

ggplot(house11,aes(y=price,x=area,col=furnishingstatus))+geom_smooth(se=F)

ggplot(house11,aes(y=price,x=area))+geom_point()+geom_smooth(method="lm",se=F)


ggplot(house11,aes(y=price,x=area,col=airconditioning ))+geom_point()+geom_smooth(method="lm",se=F)

ggplot(house11,aes(y=price,x=area,col=airconditioning ))+geom_point()+geom_smooth(method="lm",se=F)+facet_grid(~airconditioning)



dataset=library(hflights)
dataset2=hflights
View(dataset2)
flight1=select(dataset2,FlightNum,ArrTime,DepTime)
View(flight1)

flight1=View(select(dataset2,5,6,7))
flight2=View(select(dataset2,5:7))
flight3=View(select(dataset2,1:7))

flight4=View(select(dataset2,starts_with("Day"),ends_with("Times")))

flight5=View(mutate(dataset2,ActualGroundTime=ActualElapsedTime-AirTime))
flight6=View(mutate(dataset2,Average_speed=Distance/AirTime))
flight7=View(filter(dataset2,Distance>3000))
flight8=View(filter(dataset2,UniqueCarrier  %in% c("oo","us","AA")))
flight8=View(filter(dataset2,DepTime<500|ArrTime>2200))



arrange(dataset2,DepDelay)->flight9
flight10=View(arrange(dataset2,DepDelay+ArrDelay))
flight11=summarise(dataset2,min_dist=min(Distance),max_dist=max(Distance))
  

flights12=dataset2 %>% select(contains("Times") %>% filter(ArrTime>60))


## Machine learning


View(mtcars)
library(caTools)

##  specify split
split=sample.split(mtcars$mpg,SplitRatio = 0.65)
# creating training set
train=subset(mtcars,split==TRUE)
# creating testing set
test=subset(mtcars, split==FALSE)

## Training data set contain 80% and testing dataset conatin 20%



mod1=lm (mpg~.,data=train)
## Fit linear model predicting the mpg, Uses all other coloumn as a predictors 
result=predict(mod1,test)

## Uses the fitted model to predict mpg values for the rows in test, Stores those predictions in result
View(result)
final=cbind(actual=test$mpg,predicted=result)
## actual: the true mpg values from test
## predicted: the values predicted by your model
final=as.data.frame(final)

final=cbind(final,error=final$actual-final$predicted)
View(final)

rmse1=sqrt(mean(final1$error)^2)
View(rmse1)


mod2=lm(mpg~.-gear -carb,data=train)
## .= all predictors
## -gear = remove gear
## -crab= remove crab
result2=predict(mod2,test)
final2=cbind(actual=test$mgp, predicted=result2)
final2=as.data.frame(final2)
final3=cbind(final2,error=final$actual-final2$predicted)


#View(final3)

#Machine Learning

View(mtcars)
library(caTools)
mysplit=sample.split(mtcars$mpg,SplitRatio = 0.65)
train=subset(mtcars,mysplit==T)
test=subset(mtcars,mysplit==F)
model1=lm(mpg~., data = train)
result=predict(model1,test)
View(result)
final2=cbind(actual=test$mpg,predicted=result)


final2=as.data.frame(final2)
View(final2)
final2=cbind(final2,error=final2$actual-final2$predicted)
View(final2)
rmse1=sqrt(mean(final2$error)^2)

library(ggplot2)
data <- data.frame(
  YearsExperience = c(1.1, 1.3, 1.5, 10.3, 10.5, 2.0, 2.2, 2.9, 3.0, 3.2, 3.2, 3.7, 
                      3.9, 4.0, 4.0, 4.1, 4.5, 4.9, 5.1, 5.3, 5.9, 6.0, 6.8, 7.1, 
                      7.9, 8.2, 8.7, 9.0, 9.5, 9.6),
  Salary = c(39343.00, 46205.00, 37731.00, 122391.00, 121872.00, 43525.00, 39891.00, 
             56642.00, 60150.00, 54445.00, 64445.00, 57189.00, 63218.00, 55794.00, 
             56957.00, 57081.00, 61111.00, 67938.00, 66029.00, 83088.00, 81363.00, 
             93940.00, 91738.00, 98273.00, 101302.00, 113812.00, 109431.00, 105582.00, 
             116969.00, 112635.00)
)

plot(data)
Salary=data$Salary
split=sample.split(Salary,SplitRatio = 0.80)
Train=subset(data,split==TRUE)
Test=subset(data,split==FALSE)
model_simple=lm(Salary~.,Train)
model.predict=predict(model_simple,Train)
ggplot()+geom_line(aes(x=Train$YearsExperience,y=model.predict))







#library(caTools)
#View(mtcars)
#mpgitem=mtcars$mpg
#View(mpgitem)
#samplesplit=sample.split(mpgitem,SplitRatio=0.7)
#Train=subset(mtcars,samplesplit==T)
#Test=subset(mtcars,samplesplit==F)
#model=lm(mpg~.,data=Train)
#model.predict=predict(model,Train)
#library(ggplot2)
#ggplot()+geom_point(aes(x=Train$mpg,y=model.predict))+geom_line(aes(x=Train$mpg,y=model.predict))


data=read.csv("C:/Users/Ghafran/Downloads/Salary_Data.csv")
ggplot()+geom_line(aes(data$YearsExperience,y=data$Salary))
sample_split=sample.split(data,SplitRatio = 0.8)
Train=subset(data,sample_split==T)
Test=subset(data,sample_split==F)
model=lm(Salary~.,data=Train)
model.predict=predict(model,Test)
ggplot()+geom_point(aes(x=data$YearsExperience,y=data$Salary))+geom_line(aes(x=Train$YearsExperience,
                                                                             y=model.predict))

























