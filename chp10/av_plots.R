x1 = runif(50)
eps_x = rnorm(50, 0, 0.1)
x2 = 1 - x1 + eps_x
eps_y = rnorm(50, 0, 0.05)
y = x1 + x2 + eps_y

par(mfrow=c(1, 2))
plot(y ~ x1)
plot(y ~ x2)

summary(lm(y ~ x1))
summary(lm(y ~ x2))
summary(lm(y ~ x1 + x2))

m = lm(y ~ x1 + x2)
res = m$residuals
plot(res ~ x1)
plot(res ~ x2)

m1 = lm(y ~ x1)
res1 = m1$residuals
plot(res1 ~ x2, ylab = "e(Y | x1)")

m2 = lm(y ~ x2)
res2 = m2$residuals
plot(res2 ~ x1, ylab = "e(Y | x2)")

library(car)
avPlots(m)
