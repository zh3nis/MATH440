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

#library(MASS)
#fit1 <- lm(crew ~ age + tonnage + passengers + length + cabins + passdens, data=cruise)
#fit2 <- lm(crew ~ 1, data=cruise)
#stepAIC(fit1, direction="backward")

install.packages("olsrr")
library(olsrr)
ols_step_backward_p(fit0)
ols_step_forward_p(fit0)
ols_step_both_p(fit0)

fit1 = lm(crew ~ age + tonnage + passengers + length + cabins + passdens + 
          I(age^2) + I(tonnage^2) + I(passengers^2) + I(length^2) + I(cabins^2) + I(passdens^2) + 
          age*tonnage + age*passengers + age*length + age*cabins + age*passdens + 
          tonnage*passengers + tonnage*length + tonnage*cabins + tonnage*passdens + 
          passengers*length + passengers*cabins + passengers*passdens + 
          length*cabins + length*passdens + 
          cabins*passdens, data=cruise)
ols_step_forward_p(fit1)
