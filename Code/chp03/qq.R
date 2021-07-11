poverty = read.table("https://raw.githubusercontent.com/OpenIntroStat/openintro-statistics-slides/master/Chp%208/8-2_least_square_reg/figures/poverty/poverty.txt", h = T, sep = "\t")

attach(poverty)

## Q-Q plot
qqnorm(Graduates)
qqline(Graduates)