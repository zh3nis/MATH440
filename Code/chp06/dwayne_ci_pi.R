dwayne = read.table("http://users.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%20%206%20Data%20Sets/CH06FI05.txt", 
                    header=FALSE)
colnames(dwayne) = c("children", "income", "sales")

m = lm(sales ~ children + income, data=dwayne)

new_x = data.frame(children=65.4, income=17.6)

predict.lm(m, new_x, interval="confidence", level=0.95)

predict.lm(m, new_x, interval="prediction", level=0.95)
