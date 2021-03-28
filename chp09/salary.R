salary_data = read.table("https://raw.githubusercontent.com/zh3nis/MATH440/main/chp09/salary.txt", header=FALSE)
colnames(salary_data) = c('salary', 'age', 'educ', 'pol')
head(salary_data)

m1 = lm(salary ~ ., data=salary_data)
summary(m1)

m2 = update(m1, . ~ . - educ)
anova(m1, m2)
summary(m2)

salary_data$age2 = salary_data$age^2
m3 = update(m2, . ~ . + age2 + age*pol)
summary(m3)

anova(m3, m2)

m4 = update(m2, . ~ . + age2)
anova(m4, m2)
summary(m4)
