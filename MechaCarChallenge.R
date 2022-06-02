# DELIVERABLE 1

# import libraries
library(tidyverse)
library(dplyr)

# import data from CSV file
MechaCar_mpg <- read.csv(file='data/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
Suspension_Coil <- read.csv(file='data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg)
# determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg))

# ----------------------------------------------------------------------------------------------------------------------------------


# DELIVERABLE 2

# import data from CSV file
Suspension_Coil <- read.csv(file='data/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# get the mean, median, variance, and standard deviation of the suspension coil’s PSI column using summarize() function
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) 

# using the group_by() and the summarize() functions to group each Manufacturing_Lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep') 

# ----------------------------------------------------------------------------------------------------------------------------------


# DELIVERABLE 3

# using the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(Suspension_Coil$PSI,mu=1500)

# using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch
subset_lot1 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot1")
t.test(subset_lot1$PSI,mu=1500)
subset_lot2 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot2")
t.test(subset_lot2$PSI,mu=1500)
subset_lot3 <- subset(Suspension_Coil, Manufacturing_Lot=="Lot3")
t.test(subset_lot3$PSI,mu=1500)

# ----------------------------------------------------------------------------------------------------------------------------------