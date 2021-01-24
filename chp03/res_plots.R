library(latex2exp)

poverty = read.table("https://raw.githubusercontent.com/OpenIntroStat/openintro-statistics-slides/master/Chp%208/8-2_least_square_reg/figures/poverty/poverty.txt", h = T, sep = "\t")

## Q-Q plot for residuals
my_model = lm(Poverty ~ Graduates, data=poverty)
re = my_model$residuals

par(mfrow=c(1,2))
qqnorm(re)
qqline(re)
hist(re, xlab='residuals', main='Histogram of residuals', freq=FALSE)
curve(dnorm(x, mean(re), sd(re)), add=TRUE)

## Residuals vs Fit
par(mfrow=c(1,1))
fits = my_model$fitted.values
plot(re ~ fits, main="Residuals vs Fitted values", xlab=TeX("\\hat{y}_i"), ylab=TeX("e_i"))
abline(h=0)

## Residuals time series
plot(re, main="Time Series Plot of the Residuals", xlab=TeX("i"), ylab=TeX("e_i"))
lines(re)
abline(h=0)