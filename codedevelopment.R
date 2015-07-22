#Stat Inf Project part 1
#Title (give an appropriate title) and Author Name

#set working directory
setwd("~/CourseraRClass/StatInf")

#reference necessary libs
library(ggplot2)


#Overview: In a few (2-3) sentences explain what is going to be reported on.
#Simulations: Include English explanations of the simulations you ran, with the accompanying R code. Your explanations should make clear what the R code accomplishes.
set.seed(9867)
lambda <-.2
number_sim <-1000
sample_size <- 40
data<-matrix(rexp(number_sim*sample_size, lambda),number_sim,sample_size)


#Sample Mean versus Theoretical Mean: Include figures with titles. 
#In the figures, highlight the means you are comparing. 
#Include text that explains the figures and what is shown on them, 
#and provides appropriate numbers.
data_means<-apply(data, 1, mean)


sample_mean<-mean(data_means)
sample_mean

theo_mean<-1/lambda 
theo_mean

q<-ggplot() + 
  aes(data_means) + 
  geom_histogram(binwidth=.2, colour="black", fill="white") +
  geom_vline(aes(xintercept=theo_mean),  
             color="red", linetype="solid", size=1) +
  geom_vline(aes(xintercept=sample_mean),   
             color="black", linetype="dashed", size=1)
q


#Sample Variance versus Theoretical Variance: Include figures (output from R) with titles. 
data_var<-var(data_means)
data_var

theo_var<-(1/lambda)^2 / sample_size
theo_var


#Highlight the variances you are comparing. Include text that explains your understanding 
#of the differences of the variances.





#Distribution: Via figures and text, explain how one can tell the distribution 
#is approximately normal. 

p<-ggplot() + 
  aes(data_means) + 
  geom_density() +
  stat_function(geom="line", fun=dnorm, colour = "red", arg=list(mean=theo_mean, sd=sqrt(theo_var)))
p



