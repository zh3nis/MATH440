require(foreign)
require(MASS)

cdata <- read.dta("https://stats.idre.ucla.edu/stat/data/crime.dta")

plot(crime ~ poverty, data=cdata)
ols <- lm(crime ~ poverty, data = cdata)
abline(ols)

irls <- rlm(crime ~ poverty, data=cdata)
abline(irls, col='blue')

legend( "topleft", c("OLS", "IRLS"), text.col=c("black", "blue"))