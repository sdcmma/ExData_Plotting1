## Exploratory Data Analysis
## Course Project 1
## Plot 4

# The household_power_consumption.txt file must be located in the working directory

# Set language to English so automatically generated x-axis tic labels will be in English (Windows only)
Sys.setlocale("LC_TIME", "English")

# Read in data for Feb 1, 2007 and Feb 2, 2007 from the Electric power consumption database
data <- read.table("household_power_consumption.txt",                                         # Specify the source file name
                   sep = ";",                                                                 # Source data semicolon-separated
                   skip = 66637, nrow = 2880,                                                 # Select data range
                   col.names = colnames(read.table("household_power_consumption.txt",         # Add column headers
                                                   sep = ";", 
                                                   nrow = 1, 
                                                   header = TRUE)))

# Format the Date column in data so that it can be interpreted and plotted correctly by R
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Make four line graphs and save to a png file
png(filename = "plot4.png", width = 480, height = 480)                                        # Create the png file

par(mfrow = c(2, 2))                                                                          # Set up 2 by 2 arrangement for plots

plot(data$Date, data$Global_active_power,                                                     # Plot the first plot
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(data$Date, data$Voltage,                                                                 # Plot the second plot
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(data$Date, data$Sub_metering_1,                                                          # Create the third plot
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

lines(data$Date, data$Sub_metering_2,                                                         # Add data to the third plot
      col = "red")

lines(data$Date, data$Sub_metering_3,                                                         # Add more data to the third plot
      col = "blue")

legend("topright",                                                                            # Add legend to the third plot
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), 
       lwd = 1,
       bty = "n",
       cex = 0.95)

plot(data$Date, data$Global_reactive_power,                                                   # Plot the fourth plot 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()                                                                                     # Exit to save file to computer