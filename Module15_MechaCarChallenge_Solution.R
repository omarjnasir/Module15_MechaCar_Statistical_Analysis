library(dplyr)

MechaCar_data <- read.csv('MechaCar_mpg.csv',check.names=F)

MechaCar_lm <- lm(mpg ~ vehicle_length + vehicle_weight
 + spoiler_angle + ground_clearance + AWD, data=MechaCar_data
)

summary(MechaCar_lm)

SuspensionCoil_data <- read.csv('Suspension_Coil.csv',check.names=F)

total_summary <- SuspensionCoil_data %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))

lot_summary <- SuspensionCoil_data %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups='keep')

t.test(SuspensionCoil_data$PSI, mu = 1500)

print("Lot1 t.test")
t.test(subset(SuspensionCoil_data,Manufacturing_Lot=="Lot1")$PSI,mu = 1500)

print("Lot2 t.test")
t.test(subset(SuspensionCoil_data,Manufacturing_Lot=="Lot2")$PSI,mu = 1500)

print("Lot3 t.test")
t.test(subset(SuspensionCoil_data,Manufacturing_Lot=="Lot3")$PSI,mu = 1500)

