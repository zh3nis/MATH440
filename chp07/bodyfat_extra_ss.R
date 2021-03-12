bodyfat_data = read.table("http://users.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%20%207%20Data%20Sets/CH07TA01.txt",
                          header=FALSE)
colnames(bodyfat_data) = c('triceps', 'thigh', 'midarm', 'bodyfat')
m_full = lm(bodyfat ~ triceps + thigh + midarm, data=bodyfat_data)
m_reduced = update(m_full, . ~ . - thigh)

anova(m_full, m_reduced)
