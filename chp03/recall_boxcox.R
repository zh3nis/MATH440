library(car)

recall = read.table("https://online.stat.psu.edu/stat462/sites/onlinecourses.science.psu.edu.stat462/files/data/wordrecall/index.txt", h = T, sep = "\t")

bc = powerTransform(recall$time)
summary(bc)

plot(prop ~ log(time), data=recall)

mod = lm(prop ~ log(time), data=recall)
abline(mod)

re=mod$residuals

par(mfrow=c(2,2))

# Homogeneity of variance
plot(re~fitted.values(mod),xlab=expression(hat(y)),ylab="residuals",main="Homogeneity of var.")
abline(h=0)

# Independence
plot(re,type="o",pch=22,xlab="Order",ylab="residuals",main="Independence")
abline(h=0)

# Normality
hist(re,main="Residuals Histogram",xlab="residuals")
qqnorm(re,datax=TRUE)
qqline(re,datax=TRUE)
