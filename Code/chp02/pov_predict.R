poverty = read.table("https://raw.githubusercontent.com/OpenIntroStat/openintro-statistics-slides/master/Chp%208/8-2_least_square_reg/figures/poverty/poverty.txt", h = T, sep = "\t")

my_model = lm(Poverty ~ Graduates, data=poverty)

new_x = data.frame(Graduates=80)

predict.lm(my_model, new_x, interval="confidence", level=0.95)

predict.lm(my_model, new_x, interval="prediction", level=0.95)
