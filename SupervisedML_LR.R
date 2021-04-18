
#prediction of student's score using supervised machine learning

install.packages("dplyr")
library(dplyr) #for data manipulation
install.packages("caTools")
library(caTools) #for spliting our data into test and training sets

#import the data set
x<-read.csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")
View(x)

#split the data into test and training sets

split<-sample.split(x$Hours,SplitRatio = .90)
train<-subset(x,split==T)
test<-subset(x,split==F)
train
test

#Build a Linear Regression Model using the train set

model<-lm(Scores~Hours,data=train)
model
summary(model)

#predict
predictresults<-predict(model,test)
predictresults

#bind the actual values with the predicted values

y<-cbind(Actual=test,Predict=predictresults)
y<-as.data.frame(y)
y

#Finding error
error<-(y$Actual.Scores-y$Predict)
error

yfinal<-cbind(y,error)
yfinal

#predict the score if student studies for 9.25 hrs per day
a<-data.frame(Hours=9.25)
predictscore<-predict(lm(Scores~Hours,data=test),newdata =a )
predictscore

#everytime we split the data into new train and test data sets we get a new prediction for 9.25 hours
#The prediction values range from scores 89 to 99

95.7712, 89.60571,98.76517, 96.08308 , 94.11418, 89.28155

mean(95.7712, 89.60571,98.76517, 96.08308 , 94.11418, 89.28155)
