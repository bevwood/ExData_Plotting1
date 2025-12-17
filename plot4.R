#### Getting and Cleaning the Data ####
#First used the Import Dataset...From Text (base) option in R Studio where
#I could identify the first row as header and the missing data as ?

#The code that printed to the Console made perfect sense to use for reproduction:
   household_power_consumption <- read.csv("~/R/household_power_consumption.txt", sep=";", na.strings="?")

#Subset the file for just the two days of interest
   Feb2007 <- subset(household_power_consumption,Date %in% c("1/2/2007", "2/2/2007"))

#Combine Date & Time columns and Convert to POSIXct
   Feb2007$DateTime <- as.POSIXct(paste(Feb2007$Date, Feb2007$Time),format="%d/%m/%Y %H:%M:%S")

#Plot 4
# Open the PNG device
   png("plot4.png", width=480, height=480)

#Create combination of plots
   par(mfcol = c(2,2), mar = c(4,4,2,1))

# Upper left plot
   plot(Feb2007$DateTime, Feb2007$Global_active_power, 
     type = "l",               # "l" tells R to use lines instead of points
     xlab = "",                # Removes the x-axis label 
     ylab = "Global Active Power (kilowatts)",
     xaxt ="n")                # Hides the default axis
   axis.POSIXct(1, at = seq(min(Feb2007$DateTime), max(Feb2007$DateTime) + 60, by="days"), format="%a")

# Lower left plot
   plot(Feb2007$DateTime, Feb2007$Sub_metering_1, 
        type = "l", 
        xlab = "", 
        ylab = "Energy sub metering",
        xaxt = "n")    # Hides the default labels
   axis.POSIXct(1, at = seq(min(Feb2007$DateTime), max(Feb2007$DateTime) + 86400, by="days"), format="%a") # Revised x-axis labels
   lines(Feb2007$DateTime, Feb2007$Sub_metering_2, col = "red") # Add the second sub-metering 
   lines(Feb2007$DateTime, Feb2007$Sub_metering_3, col = "blue") # Add the third sub-metering
   legend("topright", 
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
          col = c("black", "red", "blue"), 
          lty = 1)   # show lines in the legend box
   
#Upper right plot
   plot(Feb2007$DateTime, Feb2007$Voltage, 
        type = "l",               # "l" tells R to use lines instead of points
        xlab = "datetime",                # Removes the x-axis label 
        ylab = "Voltage",
        xaxt ="n")                # Hides the default axis
   axis.POSIXct(1, at = seq(min(Feb2007$DateTime), max(Feb2007$DateTime) + 60, by="days"), format="%a")
   
#Lower right plot
   plot(Feb2007$DateTime, Feb2007$Global_reactive_power, 
        type = "l",               # "l" tells R to use lines instead of points
        xlab = "datetime",                # Removes the x-axis label 
        ylab = "Global_reactive_power",
        xaxt ="n")                # Hides the default axis
   axis.POSIXct(1, at = seq(min(Feb2007$DateTime), max(Feb2007$DateTime) + 60, by="days"), format="%a")
   
# Close the device
   dev.off()
   