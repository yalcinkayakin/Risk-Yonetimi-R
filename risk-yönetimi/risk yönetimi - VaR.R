
c <- read.csv(file.choose(),header =TRUE ,sep = ";")

attach(c)

Open
n <-length(Open)
i = 1
rend <- c(0)

while (i<n)
{
  r <- log(Open[i]/Open[i+1],exp(1))
  rend[i] <- r
  i=i+1
}
summary(rend*100)
View(rend)

data <- c(length(Open),mean(Open),mean(rend),sd(rend),255*mean(rend))
names(data) <- c("Total days","Average price","Daily change","Daily volatility","Annualized rr 255gg")
data

vol <- data[4]

rendd <- data[3]

az <- 1000 
value1 <- Open[1]
valuep <- value1*az
hp <- 1
a <- .95

parvar <- abs(valuep* qnorm(1-a ,0,1)*vol*sqrt(hp))
hvar <- abs(quantile(rend,1-a)*valuep)

varv <- c(parvar,hvar)
names(varv) <-c("parametric var" , "historical var" )
print(varv)

detach(c)
  
  

  








