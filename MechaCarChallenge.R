library(dplyr)

# Deliverable 1
mechacar <- read.csv('MechaCar_mpg.csv') #read MechaCar_mpg.csv and save as Dataframe
mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,mechacar)
summary(mpg_lm)

# Deliverable 2
susp_coil <- read.csv('Suspension_Coil.csv') # read Suspension_Coil.csv and save as Dataframe
total_summary <- susp_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) # get summary stats for all suspension coils
lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) # get summary stats for suspension coils by lot

# Deliverable 3
t_total <- t.test(susp_coil$PSI, mu=1500) # t test for all coils
t.test(PSI ~ 1, susp_coil, subset = Manufacturing_Lot == 'Lot3')
