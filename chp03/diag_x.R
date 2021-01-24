poverty = read.table("https://raw.githubusercontent.com/OpenIntroStat/openintro-statistics-slides/master/Chp%208/8-2_least_square_reg/figures/poverty/poverty.txt", h = T, sep = "\t")

attach(poverty)

par(mfrow=c(1,2))

hist(Graduates)
boxplot(Graduates, main='Boxplot of Graduates')

par(mfrow=c(1,1))

plot(Graduates)
lines(Graduates)
