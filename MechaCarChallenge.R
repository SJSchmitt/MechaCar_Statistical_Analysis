library(dplyr)

mechacar <- read.csv('MechaCar_mpg.csv') #read MechaCar_mpg.csv and save as Dataframe

# Deliverable 1
mpg_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,mechacar)
summary(mpg_lm)
