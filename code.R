q2=read.csv("C:\\Users\\Desktop\\q2.csv")
head(q2)
  Gender Age  Hours    mph finish_all
1      F  32 2.7625 9.4910          8
2      F  27 2.8619 9.1612         15
3      F  30 2.9031 9.0314         19
4      F  32 2.9264 8.9594         26
5      F  28 3.0181 8.6873         45
6      F  44 3.0289 8.6562         46

attach(q2)
length(which(Age>50))
[1] 383

boxplot(Age~Gender,main="age distributions of the runner by gender",col=c(1,2),col.main=3,col.lab=4)


# Are men older than women?
# let h0=male=female and ha=male>female
female=subset(q2,Gender=="F")
male=subset(q2,Gender=="M")
t.test(male$Age,alt="greater",female$Age)

      Welch Two Sample t-test
    
data:  male$Age and female$Age
t = 9.0319, df = 1878.1, p-value < 2.2e-16
alternative hypothesis: true difference in means is greater than 0
95 percent confidence interval:
  3.598041      Inf
sample estimates:
mean of x mean of y 
  43.44831  39.04862 

## since p<0.05 we reject h0 that was age of men= age of women that means age of men is not equal to age of women
  
  
  
  
# The average completion time for all runners is 4.361 hours. Test whether the completion time for men is lower than 4.361 hours.
# let h0=mu=4.361 & ha=men<4.361 hours

male=subset(q2,Gender=="M")
t.test(male$Hours,alt="less",mu=4.361)
  One Sample t-test
  data: male$Hours
  t = -6.548, df = 976, p-value = 4.707e-11
  alternative hypothesis: true mean is less than 4.361
  95 percent confidence interval:
    -Inf 4.239651
  sample estimates:
    mean of x
  4.19889
#Since p<0.05 we reject h0 that means the completion time for men is lower than 4.361 hours.
# The average age for all runners is 41.33 years. Test whether women are younger than 41.33 years.
#let h0=female$age=41.33 and ha=female$age<41.33
female=subset(q2,Gender=="F")
t.test(female$Age,alt="less",mu=41.33)
  One Sample t-test
  data: female$Age
  t = -6.645, df = 904, p-value = 2.617e-11
  alternative hypothesis: true mean is less than 41.33
  95 percent confidence interval:
    -Inf 39.61391
  sample estimates:
    mean of x
  39.04862
# Since the p<0.05 we reject our h0 that means women are younger than 41.33
  


