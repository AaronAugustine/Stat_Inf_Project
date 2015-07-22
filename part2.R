#Stat Inf Project Part 2
#Title (give an appropriate title) and Author Name

#set working directory
setwd("~/CourseraRClass/StatInf")

#reference necessary libs
library(ggplot2)

data("ToothGrowth")

head(ToothGrowth)
summary(ToothGrowth)
str(ToothGrowth)
with(ToothGrowth,table(supp,dose))

qplot(dose,len,data=ToothGrowth,
      xlab="Dose",
      ylab="Length",
      main="",
      facets=.~supp)

t.test(len~supp,data = ToothGrowth, 
       alternative= c("two.sided"),
       mu=0,
       paired=FALSE,
       var.equal=FALSE, 
       conf.level= .95)

doselist <- unique(ToothGrowth$dose)
for (i in doselist) {
    print(paste("T-Test for Dose Level", i))
    print(t.test(len~supp,data = ToothGrowth, 
         alternative= c("two.sided"),
         mu=0,
         paired=FALSE,
         var.equal=FALSE, 
         conf.level= .95,
         subset=ToothGrowth$dose==i))
  
}


