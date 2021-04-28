library('data.table')
library('dplyr')

# Read data
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# Filter data by city
Baltimore <- summarise(group_by(filter(NEI,fips == '24510'),year), Emissions = sum(Emissions))
color <- c("red", "green", "blue", "black")

# Plot
png(filename='plot2.png')

barplot(Baltimore$Emissions
        , names = Baltimore$year
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years"
        , col = color)

dev.off()
