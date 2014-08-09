## Exploratory Data Analysis
## Course Project 1
## Plot 3

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

# Make a line graph of the three sets of submetering data and save to a png file
png(filename = "plot3.png", width = 480, height = 480)                                        # Create the png file

plot(data$Date, data$Sub_metering_1,                                                        # Create the plot with one data set
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")

lines(data$Date, data$Sub_metering_2,                                                       # Add the second data set in red
      col = "red")

lines(data$Date, data$Sub_metering_3,                                                       # Add the third data set in blue
      col = "blue")

legend("topright",                                                                            # Add and format the legend
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"), 
       lwd = 1)

dev.off()                                                                                     # Exit to save file to computer