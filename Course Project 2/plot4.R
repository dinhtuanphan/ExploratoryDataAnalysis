library('data.table')
library('dplyr')
library('ggplot2')


SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# Find coal combustion
coalCombustion <- grepl('Fuel Comb.*Coal', SCC$EI.Sector)

# Filter coal combustion data
coalCombustionData <- SCC[coalCombustion,]

# Find Emissions of coal combustion
coalCombustionEmiss <- NEI[(NEI$SCC %in% coalCombustionData$SCC),]

# Group Emissions by year
coalCombustionByYear <- summarise(group_by(coalCombustionEmiss,year), Emissions = sum(Emissions))

# Plot

png("plot4.png")

ggplot(coalCombustionByYear,aes(x = factor(year),y = Emissions/10^5)) +
  geom_bar(stat="identity", width=0.5) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
dev.off()
