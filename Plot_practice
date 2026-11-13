############################################################
# R Programming: Data Visualization, Data Manipulation,
# Exploratory Data Analysis, and Machine Learning
#
# Topics Covered:
#
# 1. Data Exploration Using the Iris Dataset
# 2. Basic Data Visualization Using Base R
# 3. Grammar of Graphics Using ggplot2
# 4. Scatter Plots, Histograms, and Box Plots
# 5. Bar Plots and Frequency Polygons
# 6. Data Visualization Using Multiple Datasets
# 7. Plot Customization Using ggplot2
# 8. Faceting, Themes, Labels, and Scales
# 9. Data Manipulation Using dplyr
#    - select()
#    - mutate()
#    - filter()
#    - arrange()
#    - summarise()
#    - %>% (Pipe Operator)
# 10. Exploratory Data Analysis Using hflights
# 11. Data Filtering, Transformation, and Summarization
# 12. Data Splitting: Training and Testing Sets
# 13. Linear Regression Using lm()
# 14. Model Prediction Using predict()
# 15. Model Evaluation and RMSE Calculation
# 16. Regression with Selected Predictors
# 17. Introduction to Classification Problems
#
############################################################
View(iris)
table(iris$Species)
plot(iris$Sepal.Length~iris$Sepal.Width)
plot(iris$Petal.Length~iris$Petal.Width,ylab = "Sepal width",xlab="Sepal length",main="Scatter Plot",col="blue",pch=3,cex=0.9)
hist(iris$Sepal.Width,xlab = "sepal length",main = "Histogram plot",col = "aquamarine3")
boxplot(iris$Sepal.Length~iris$Species)   # continuous variable vs catorigical variable


library(ggplot2)
ggplot(data=iris)
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))
ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length))+geom_point()    # geom_point is scatter plot   

## Three component of grammar of graphics data,asthetic and geometry

ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,colour = Species))+geom_point()
 
#ggplot(data=iris,aes(y=Sepal.Length,x=Petal.Length,shape = Species,colour = Species))+geom_point()

house <- read.csv("C:/Users/Ghafran/Downloads/R_Programming/kc_house_data.csv")
View(house)
library(dplyr)
house%>%select(c(-1))->house     # %>% pipe operator from magrito package
View(house)
ggplot(data=house,aes(sqft_living))+geom_histogram(bins=50)
ggplot(data=house,aes(sqft_living))+geom_histogram(bins = 50,fill="palegreen4")
ggplot(data=house,aes(sqft_living))+geom_histogram(bins = 30,fill="palegreen",col="green")

ggplot(data=house,aes(price,fill = waterfront))+geom_histogram(position = "fill")
## bar plot

ggplot(data=house,aes(waterfront))+geom_bar()
ggplot(data=house,aes(waterfront,fill = yr_renovated))+geom_bar(position = "fill")

##frequencey polygon
ggplot(data=house,aes(price))+geom_freqpoly(bins=50)

ggplot(data=house,aes(price,fill = view))+geom_freqpoly(bins=50)
ggplot(data=house,aes(y=price,x=sqft_living,col=waterfront))+geom_smooth()


dataset<-read.csv("C:/Users/Ghafran/Downloads/R_Programming/Housing_Price_Data.csv")
View(Housing_Price_Data)
library(dplyr)
library(ggplot2)
ggplot(data=dataset,aes(x=price))+geom_histogram(bins=50)       
ggplot(data=dataset,aes(x=price,fill = basement))+geom_histogram(bins=50) 
ggplot(data=dataset,aes(x=price,fill=basement))+geom_histogram(position = "fill")
ggplot(data=dataset,aes(x=basement))+geom_bar()
ggplot(data=dataset,aes(x=basement,fill=airconditioning))+geom_bar()
ggplot(data=dataset,aes(x=price))+geom_freqpoly()
ggplot(data=dataset,aes(x=price))+geom_freqpoly(bins=60)
ggplot(data=dataset,aes(x=price,col=hotwaterheating))+geom_freqpoly(bins=100)
ggplot(data=dataset,aes(x=price,y=area))+geom_boxplot()
ggplot(data=dataset,aes(x=price,y=area))+geom_smooth()
ggplot(data=dataset,aes(x=price,y=area,col=basement))+geom_smooth(se=F)   #  confidence interval (standard error band)  control color
ggplot(data=dataset,aes(x=price,y=area,col=airconditioning))+geom_smooth(se=F)

library(dplyr)
library(ggplot2)
ggplot(data=dataset,aes(y=area,x=price))+geom_point()+geom_smooth(method="Im",se=TRUE)
ggplot(data=dataset,aes(y=area,x=price,color=stories))+geom_point()+geom_smooth(method="Im",se=TRUE)
ggplot(data=dataset,aes(y=price,x=area,col=mainroad))+geom_point()+geom_smooth(method="Im",se=FALSE)+facet_grid(~stories)  # facet layer on the basis of aircondition 
ggplot(data=dataset,aes(x=guestroom,y=price,fill=factor(guestroom)))+geom_boxplot()
ggplot(data=dataset,aes(x=guestroom,y=price,fill=factor(guestroom)))+geom_boxplot()->obj1
obj1+labs(title="Price w.r.t Rooms",x="Rooms",y="Price",Fill="Rooms")
obj1+labs(title="Price w.r.t Rooms",x="Rooms",y="Price",Fill="Rooms")->obj2
obj2+theme(panel.background = element_rect(fill="Palegreen1"))
obj2+theme(panel.background = element_rect(fill="Palegreen1"))->obj3
obj3+theme(plot.title = element_text(hjust=0.5,face = "bold",colour = "cadetblue"))
obj3+theme(plot.title = element_text(hjust=0.5,face="bold",colour = "cadetblue"))->obj4
obj4+scale_y_continuous(labels = scales::dollar)









## View Command

library(dplyr)
library(hflights)
View(hflights)
select(hflights,FlightNum,ArrTime,DepTime)->flight1
View(flight1)
select(hflights,5,6,8)->flight1
View(flight1)
select(hflights,contains("Time"))->flight1
View(flight1)
select(hflights,Year:ArrTime)->flight1
View(flight1)
select(hflights,1:6)->flight1
View(flight1)
select(hflights,starts_with("Day"),ends_with("Time"))->flights1
View(flights1)
##____________________________________________________________________________________

## Mutate
View(flights1)
mutate(hflights,ActualGroundTime=ActualElapsedTime-AirTime)->flights1
View(flights1)
mutate(hflights,Averagespeed=Distance/AirTime * 60)->flights1
View(flights1)
mutate(hflights,Totaltimespent=TaxiIn-TaxiOut)->flights1
View(flights1)
mutate(hflights,totaldelay=ArrDelay-DepDelay)->flights1
View(flights1)
#____________________________________________________________________________________

##Filter

filter(hflights,Distance>3000)->flights1
View(flights1)
range(flights1$Distance)
filter(hflights, UniqueCarrier %in%  c("OO","US","AA"))->flights1
View(flights1)
table(flights1$UniqueCarrier)
filter(hflights,TaxiIn+TaxiOut>AirTime)->flights1
View(flights1)
filter(hflights,DepTime<500|ArrTime>2200)->flights1
View(flights1)
filter(hflights,Dest=="JFK" & Cancelled==1)->flights1
View(flights1)
#______________________________________________________________________________________

##Arrange

arrange(hflights,DepDelay)->flights1
View(flights1)
arrange(hflights,DepDelay+ArrDelay)->flights1
View(flights1)
View(flights1)
#______________________________________________________________________________________

##Summarise

summarise(hflights,min_distance=min(Distance),max_distance=max(Distance))
summarise(hflights,mindelay=min(ArrDelay,na.rm=T),average=mean(ArrDelay,na.rm=T),
          maxdelay=max(ArrDelay,na.rm=T), standerdeviation=sd(ArrDelay,na.rm=T))     ## na.rm remove the NA value  ,sd=standard deviation
#______________________________________________________________________________________

##Pipe

hflights %>% select(contains("Time")) %>% filter(AirTime>60)->flight1
View(flight1)
range(flight1$AirTime)
hflights %>% filter(UniqueCarrier=="WN") %>% summarise(Min_Time=min(AirTime,na.rm = TRUE))
#__________________________________________________________________________________________

##Data Visulization

View(house)
library(ggplot2)
 
ggplot(data = house,aes(x=price))+geom_histogram()
ggplot(data=house,aes(x=price))+geom_histogram(fill="palegreen4",col="green")
#__________________________________________________________________________________________

# bar plot   distribution of catorigical distribution

#ggplot(data=house,aes(x=condition))+geom_bar(fill="orange")
#__________________________________________________________________________________________

##Scatter plot   multivariate analysis
#ggplot(data = house,aes(x=price,y=bedrooms))+geom_point()       
#____________________________________________________________________________________________

#Linear Regressions
View(mtcars)
library(caTools)
sample.split(mtcars$mpg,SplitRatio = 0.65)->mysplit
train<-subset(mtcars,mysplit==TRUE)
test<-subset(mtcars,mysplit==FALSE)
nrow(test)
nrow(train)
lm(mpg~. ,data=train)->mod1
predict(mod1,test)->result
View(result)
#_____________________________________________________________________________________________

View(mtcars)
library(caTools)
## For machine learning algorithm w supposed to split the data into training and test set
sample.split(mtcars$mpg,SplitRatio = 0.65)->mysplit
subset(mtcars,mysplit==TRUE)->train    # subset take out portion from an object   portion of dataset used for testing and training
subset(mtcars,mysplit==FALSE)->test
lm(mpg~.,data=train)->mod1    # mpg is dependent variable and all other or independent variable
predict(mod1,test)->result
View(result)
cbind(actual=test$mpg,predicted=result)->final
View(final)
## Convert matrices into the dataframe
as.data.frame(final)->final
View(final)
cbind(final,error=final$actual-final$predicted)->final
View(final)
cbind(final,rmse=sqrt(mean(final$error)^2))->final
View(final)

lm(mpg~.-gear,-carb,data=train)->mod2    # we exculde the the column of gear and carb
predict(mod2,test)->result
cbind(actual=test$mpg,predicted=result)->final 
as.data.frame(final)->final
View(final)
cbind(final,error=final$actual-final$predicted)->final
sqrt(mean(final$error)^2)->rmse2
##__________________________________________________________________________________________

##Classification problem

View(census_data)
library(tidycensus)
View(data.Census.data)
data(package = "datasets")
