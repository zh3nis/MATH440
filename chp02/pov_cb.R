poverty = read.table("https://raw.githubusercontent.com/OpenIntroStat/openintro-statistics-slides/master/Chp%208/8-2_least_square_reg/figures/poverty/poverty.txt", h = T, sep = "\t")

my_model = lm(Poverty ~ Graduates, data=poverty)

CI = predict(my_model, se.fit=TRUE)

W = sqrt(2*qf(0.95, length(my_model$coefficients), my_model$df.residual))
Band = cbind( CI$fit - W * CI$se.fit, CI$fit + W * CI$se.fit )

plot(Poverty ~ Graduates, data=poverty, main="Working-Hotelling 95% confidence band")
abline(my_model)

points(sort(poverty$Graduates), Band[,1][order(poverty$Graduates)], type="l", lty=2)
points(sort(poverty$Graduates), Band[,2][order(poverty$Graduates)], type="l", lty=2)

legend("topright",legend=c("Mean Line", "95% CB"),
       col=c(1,1), lty=c(1,2), bg="gray90")
