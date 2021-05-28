# Module15_MechaCar_Statistical_Analysis
Module 15-README 
Before we begin answering the question at the end of the deliverables, we must introduce applicable statistics and its terms:
Normal Distribution and T Distribution:
Normal Distribution is the classic bell curve, with the median = average.  This is used mostly, because all distributions tend to become normal, if there are large amounts of data. The distribution has mean, mode, standard deviation   and is used extensively in hypothesis testing. 
T Distribution, also called student distribution is used when the data is less, fewer than 30. It is characterized by degrees of freedom on the horizontal axis and with the t values running on the vertical axis. The t-distribution is similar to Normal Distribution and for data more than 30, it becomes Normal Distribution.
Hypothesis Formulation and Testing:
*“In statistics a hypothesis is a claim or statement about a property of a population”.
In order, to determine whether a particular hypothesis is true or false a test is performed, but first we must define the hypothesis statement. There are two statements we can make:
Ho: Null Hypothesis and this statement is true, if the test statistics is less than level of significance ?.
Null Hypothesis can only be expressed with =, ?, ? signs. The null hypothesis has to make a very specific statement.
Ha: The alternative hypothesis would be >, < or ?.
Two tailed test is done, when the null hypothesis has an equal sign in the statement.

One Tailed Test:
Diagram is not being copied




Two Tailed Test
Diagram is not being copies

p-Values:
Traditionally p values are found by calculating the test statistic and then using the table with the degrees of freedom.
If the p-value is less than the level of significance (alpha, the null hypothesis is rejected.
Regression Tests or Regression Equations:

y=mx + b. This is an equation of a straight line with the intercept b on the y-axis.
Simple Linear Regression Model:
Single Regression analysis is the study of how a dependent variable y is related to the independent variable x and the error term.
y=B0+B1x+ E
This is similar to the equation of a straight line shown above. The only difference is “E”, which is the error term.
Multiple Regression Model:
The multiple regression model and its equation describes how its dependent variable y is related to independent variables like x1, x2,,x3,…..xp.
y= B0+B1x+ B2x + ……. Bpxp + E
In multiple regression model there are more than one independent variables
**Coefficient of Correlation (r): ( -1 ?r?1) is a number that indicates both the strength and direction of the linear relationship between the dependent variable (y) and the independent variable (x).
**Coefficient of Determination(r2): It’s numerical value is the proportion of the variation in y that is explained by the regression line, y=bo+b1x.
r squared= explained variation/total variation

Coefficient of Determination can be described in terms of total variation in y versus the unexplained variation in y.
r2= 1- SSE/SST
SSE=error sum of squares
SST=Total sum of squares


With the definitions out of the way, the results are shown below:


> library(dplyr)
> MechaCar_data <- read.csv('MechaCar_mpg.csv',check.names=F)
> MechaCar_lm <- lm(mpg ~ vehicle_length + vehicle_weight
+  + spoiler_angle + ground_clearance + AWD, data=MechaCar_data
+ )
> summary(MechaCar_lm)

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechaCar_data)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

> SuspensionCoil_data <- read.csv('Suspension_Coil.csv',check.names=F)
> total_summary <- SuspensionCoil_data %>%
+   summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))
> View(total_summary)
> lot_summary <- SuspensionCoil_data %>% group_by(Manufacturing_Lot) %>%
+   summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')
> View(lot_summary)
> t.test(SuspensionCoil_data$PSI, mu = 1500)

	One Sample t-test

data:  SuspensionCoil_data$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 

> print("Lot1 t.test")
[1] "Lot1 t.test"
> t.test(subset(SuspensionCoil_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

	One Sample t-test

data:  subset(SuspensionCoil_data, Manufacturing_Lot == "Lot1")$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

> print("Lot2 t.test")
[1] "Lot2 t.test"
> t.test(subset(SuspensionCoil_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

	One Sample t-test

data:  subset(SuspensionCoil_data, Manufacturing_Lot == "Lot2")$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

> print("Lot3 t.test")
[1] "Lot3 t.test"
> t.test(subset(SuspensionCoil_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)

	One Sample t-test

data:  subset(SuspensionCoil_data, Manufacturing_Lot == "Lot3")$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14







Deliverable4:
Study Design: Mechacar vs. Competition
Cars are generally evaluated on cost, mpg, maintainability, safety. 
For performance driven cars like the Mustang or Porsche,Maserati and other race cars the criteria of evaluation would shift to acceleration (0-60mph) in 7seconds etc.
For our purpose, we will be considering only stock cars and base our comparison on MPG, Length, Safety, Weight and Ground Clearance.

The Mecha Car is being compared with Toyota Corolla and Tesla Cyber Truck.  The characteristics of Mechacar are closer to that of truck. It is twice as heavier than Toyota, and an average Mechacar does 47 MPG. This fuel efficiency is not obtainable in the Internal Combustion Engine, but is competitive with future electric vehicles and hybrid vehicles. (Please refer to the Excel Sheet).



No.
Length (feet)
Weight
(lbs)
Spoiler Angle
Ground Clearance in Inches
MPG
Miles/Gallon
Vehicle

1
14.79
6276.47
57.62
13.16
47.41308
Average MechaCar

2
15.16
3106
N/A
5.1
39
Toyota Corolla2021

3
19.3
5400

16
97 eq
Tesla Cyber


The Tesla Cyber has not been released, but the company has stated that it is better than the Ford F-150. It will cost more.
Telsa has also stated that the truck will be bullet proof, so it would be very safe, with an engine lifespan of 300,000 to 500,000 miles. It will come out in 3 variants powered by electric induction motor.
 It may be the beginning of an Electrical Century, moving away from the Hydro- Carbon era.
*TRIOLA, MARIO F. “ ELEMENTARY STATISTICS USING EXCEL”
** WEIERS, RONALD: “INTRODUCTION TO BUSINESS STATISTICS”



