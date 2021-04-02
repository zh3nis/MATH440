cruise <- read.fwf("http://www.stat.ufl.edu/~winner/data/cruise_ship.dat", 
                   width=c(20,20,rep(8,7)), 
                   col.names=c("ship", "cline", "age", "tonnage", "passengers", "length", "cabins", "passdens", "crew"))
head(cruise)

fit0 = lm(crew ~ age + tonnage + passengers + length + cabins + passdens, data=cruise)
summary(fit0)

install.packages("leaps")
library(leaps)
allcruise <- regsubsets(crew ~ age + tonnage + passengers + length + cabins + passdens, 
                        nbest=4, data=cruise)
all_output <- summary(allcruise)
with(all_output, round(cbind(which, rsq, adjr2, cp, bic), 3))


fit3 <- update(fit0, . ~ . - age - passdens)
AIC(fit3)
AIC(fit0)

library(MASS)
fit1 <- lm(crew ~ age + tonnage + passengers + length + cabins + passdens, data=cruise)
fit2 <- lm(crew ~ 1, data=cruise)
stepAIC(fit1, direction="backward")
