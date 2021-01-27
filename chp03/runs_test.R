library(lawstat)

poverty = read.table("https://raw.githubusercontent.com/OpenIntroStat/openintro-statistics-slides/master/Chp%208/8-2_least_square_reg/figures/poverty/poverty.txt", h = T, sep = "\t")

my_model = lm(Poverty ~ Graduates, data=poverty)
re = my_model$residuals

runs.test(re, plot.it=TRUE)
