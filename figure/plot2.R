## Exploratory Data Analysis
## Course Project 1
## Plot 2

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

# Make a line graph showing Global Active Power vs. day of the week and save to png file
png(filename = "plot2.png", width = 480, height = 480)                                        # Create the png file

plot(data$Date, data$Global_active_power,                                                     # Make the line graph
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()                                                                                     # Exit to save file to computer
