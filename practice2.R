library(plyr)
library(lattice)
library(ggplot2)
library(rpart)
library(scatterplot3d)
setwd("~/Documents/R_place/kaggel_titanic")

train<- read.csv("./data/train.csv", header=TRUE, sep=",")

hist(train$Age)

table(train$Survived)
pie(table(train$Survived))

prop.table(table(train$Survived))

prop.table(table(train$Sex, train$Survived),1)
pie(prop.table(table(train$Sex, train$Survived),1))

table(train$Age)
barplot(table(train$Age))

boxplot(Fare~Survived, data=train)
boxplot(Pclass~Survived, data=train)

pairs(train)

fit <- rpart(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked, data=train, method="class")
plot(fit)
text(fit)

install.packages('rattle')
install.packages('rpart.plot')
install.packages('RColorBrewer')
library(rattle)
library(rpart.plot)
library(RColorBrewer)
fancyRpartPlot(fit)

Prediction <- predict(fit, test, type = "class")

scatterplot3d(train$Parch, train$Fare, train$Age)



