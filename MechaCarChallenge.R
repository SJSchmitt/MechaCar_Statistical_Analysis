library(dplyr)
library(tidyverse)

# Deliverable 1
mechacar <- read.csv('MechaCar_mpg.csv') #read MechaCar_mpg.csv and save as Dataframe
mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,mechacar) # create linear model for mpg
summary(mpg_lm)

eds              # Deliverable 2
susp_coil <- read.csv('Suspension_Coil.csv') # read Suspension_Coil.csv and save as Dataframe
total_summary <- susp_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) # get summary stats for all suspension coils
lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI)) # get summary stats for suspension coils by lot

# lot 3 had high variance, create box-and-whisker plot to investigate potential outliers
box_plt <- ggplot(susp_coil, aes(x=Manufacturing_Lot, y=PSI))
box_plt + geom_boxplot()

# Deliverable 3
t_total <- t.test(susp_coil$PSI, mu=1500) # t test for all coils

# using subset argument
lot1_test <- t.test(PSI ~ 1, susp_coil, subset = Manufacturing_Lot == 'Lot1', mu=1500) # t test for Lot1 coils
lot2_test <- t.test(PSI ~ 1, susp_coil, subset = Manufacturing_Lot == 'Lot2', mu=1500) # t test for Lot2 coils
lot3_test <- t.test(PSI ~ 1, susp_coil, subset = Manufacturing_Lot == 'Lot3', mu=1500) # t test for Lot3 coils

# using subset function as an argument
# lot1_test <- t.test(subset(susp_coil, Manufacturing_Lot == 'Lot1')$PSI, mu = 1500) 
# lot2_test <- t.test(subset(susp_coil, Manufacturing_Lot == 'Lot2')$PSI, mu = 1500)
# lot3_test <- t.test(subset(susp_coil, Manufacturing_Lot == 'Lot3')$PSI, mu = 1500)
