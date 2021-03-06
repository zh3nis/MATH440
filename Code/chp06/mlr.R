dwayne = read.table("http://users.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%20%206%20Data%20Sets/CH06FI05.txt", 
                    header=FALSE)
colnames(dwayne) = c("children", "income", "sales")

m = lm(sales ~ children + income, data=dwayne)

summary(m)

anova(m)