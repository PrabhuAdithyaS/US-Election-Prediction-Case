#setting the working directory
getwd()
setwd("D:/Class Documents/Semester 4/PAM/Dataset")
#***************************************************************************************#

#reading the data
mydata=read.csv("BlueOrRed.csv", header = TRUE,na.strings = c(""," ","NA"))
attach(mydata)
str(mydata)
set.seed(32423)
library(caret)

intrain = createDataPartition(mydata$Undecided,p=0.7,list = FALSE)
mytrain=mydata[intrain,]
mytest=mydata[-intrain,]

Y=factor(as.vector(mytrain[,1])) #It is done in order to convert it to factors otherwise it will consider it as regression
X=as.matrix(mytrain[,2:9])

library(e1071)

SVMModel=svm(X,Y,data=mytrain,kernel="radial",cost=1,scale=TRUE)
summary(SVMModel)

prediction=predict(SVMModel)j
table(Actual=mytrain$Undecided,Predicted= prediction)

Testperformance=predict(SVMModel, newdata = mytest[,2:9])
table(Actual=mytest$Undecided, Predicted=Testperformance)

#we can use a new scale to incresase the accuracy to improve the model
#x-min(x)/range(x)
#to reduce the scale to 0 to 1 (for all the continuous variables)
#it will reduce the problem of convergence 
#This will give you a really close value without overfitting
#In artificial intelligence generally support vector and neural nets are used rather than LDA 


a=(1745+1144)/3000
a
