
cars <- read.csv(file.choose(),header = TRUE,sep = ",")
cars
library(e1071)

x <- c("BMW","crossover","3.00","Diesel","no","2012","Accord",NA)
cars <- rbind(cars,x)

traindata <- cars[1:125,]
testdata <- cars[126,]

m <- naiveBayes(traindata[1:4],traindata[,5])

pred <- predict(m,testdata[,1:4])
print(pred)
