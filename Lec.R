# install.packages("wooldridge")
# install.packages("corrplot")
# install.packages("stargazer")
library(wooldridge)
library(corrplot)
library(stargazer)
#"C:/Users/FX505DT/Downloads/grocery_database.xlsx"

data = data("wage1", package = 'wooldridge')

par(mfrow=c(1,1))

hist(wage1$wage)

attach(wage1)

plot(educ, wage)

log_wage = lm(log(wage) ~ educ)    #linear model
summary(log_wage)

plot(educ, log(wage))
abline(log_wage,col="red",lw=1.5)   #regressionLine

log_wage1 = lm(log(wage) ~ educ)    #linear model
log_wage2 = lm(log(wage) ~ educ+ exper)    #linear model
log_wage3 = lm(log(wage) ~ educ+ exper+ tenure)    #linear model

stargazer::stargazer(log_wage1,log_wage2,log_wage3, type="text", title = "regression results", out="table.txt")


