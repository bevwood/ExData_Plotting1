#### Getting and Cleaning the Data ####
#First used the Import Dataset...From Text (base) option in R Studio where
#I could identify the first row as header and the missing data as ?
#The code that printed to the Console made perfect sense to use for reproduction:
   household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")

#Subset the file for just the two days of interest
   Feb2007 <- subset(household_power_consumption,Date %in% c("1/2/2007", "2/2/2007"))

#Combine Date & Time columns and Convert to POSIXct
   Feb2007$DateTime <- as.POSIXct(paste(Feb2007$Date, Feb2007$Time),format="%d/%m/%Y %H:%M:%S")

#Plot2 
   png("plot2.png", width=480, height=480) # Open the file device
   plot(Feb2007$DateTime, Feb2007$Global_active_power, 
        type = "l",               # "l" tells R to use lines instead of points
        xlab = "",                # Removes the x-axis label 
        ylab = "Global Active Power (kilowatts)",
        xaxt ="n")                # Hides the default axis
   axis.POSIXct(1, at = seq(min(Feb2007$DateTime), max(Feb2007$DateTime) + 60, by="days"), format="%a")
   dev.off()  #Close the file device

   