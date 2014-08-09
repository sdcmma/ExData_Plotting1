## Exploratory Data Analysis
## Course Project 1
## Plot 1

# First, be sure household_power_consumption.txt file is located in working directory

# Read in data for Feb 1, 2007 and Feb 2, 2007 from the Electric power consumption database
data <- read.table("household_power_consumption.txt",                                         # Specify the source file name
                   sep = ";",                                                                 # Source data semicolon-separated
                   skip = 66637, nrow = 2880,                                                 # Select data range
                   col.names = colnames(read.table("household_power_consumption.txt",         # Add column headers
                                                   sep = ";", 
                                                   nrow = 1, 
                                                   header = TRUE)))                                
                                                                 

# Make a histogram of the Global Active Power data and save to a png file
png(filename = "plot1.png", width = 480, height = 480)                                        # Create the png file

hist(data$Global_active_power,                                                                # Make the histogram
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()                                                                                     # Exit to save file to computer
