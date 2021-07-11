bodyfat_data = read.table("http://users.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%20%207%20Data%20Sets/CH07TA01.txt",
                          header=FALSE)
colnames(bodyfat_data) = c('triceps', 'thigh', 'midarm', 'bodyfat')

x = data.matrix(bodyfat_data[, c('triceps', 'thigh', 'midarm')])
y = data.matrix(bodyfat_data[, c('bodyfat')])

library(glmnet)
ridge_cv = cv.glmnet(x, y, alpha=0, lambda=seq(0, 2, by=0.005), nfolds=5)
plot(ridge_cv)
ridge_cv$lambda.min

ridge = glmnet(x, y, alpha=0, lambda=0.035)
t(coef(ridge))

ols = lm(bodyfat ~ triceps + thigh + midarm, data=bodyfat_data)
coef(ols)

ridge_yhat = predict(ridge, newx=x)

mean(ols$residuals^2)
mean((y-ridge_yhat)^2)
