salary_data = read.table("https://raw.githubusercontent.com/zh3nis/MATH440/main/chp09/salary.txt", header=FALSE)
colnames(salary_data) = c('salary', 'age', 'educ', 'pol')
head(salary_data)

m = lm(salary ~ ., data=salary_data)
summary(m)

library(car)
avPlots(m)

m1 = lm(salary ~ . + I(age^2), data=salary_data)
summary(m1)
avPlots(m1)

m2 = lm(salary ~ . + I(age^2) + I(educ^2), data=salary_data)
summary(m2)
avPlots(m2)
