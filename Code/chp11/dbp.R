bp_data <- read.table("http://users.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%2011%20Data%20Sets/CH11TA01.txt",
                      header=FALSE)
colnames(bp_data) <- c('age', 'dbp')

ols <- lm(dbp ~ age, data=bp_data)
res <- ols$residuals

plot(res ~ age, data=bp_data, ylab='residuals')
plot(abs(res) ~ age, data=bp_data, ylab='|residuals|')

ols_res <- lm(abs(res) ~ age, data=bp_data)
omega <- 1/(ols_res$fitted.values)^2

wls <- lm(dbp ~ age, data=bp_data, weights=omega)

summary(ols)
summary(wls)