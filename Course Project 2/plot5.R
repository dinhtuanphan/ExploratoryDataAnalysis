library('data.table')
library('dplyr')
library('ggplot2')

# Read data
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# Filter data
Baltimore <- NEI[(NEI$fips =='24510')&(NEI$type =='ON-ROAD'),]

BaltimoreEmiss <- summarise(group_by(Baltimore,year), Emissions = sum(Emissions))

# Plot
png("plot5.png")

ggplot(BaltimoreEmiss,aes(factor(year),Emissions)) +
  geom_bar(stat="identity", width=0.5) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions from motor vehicle sources in Baltimore City"))

dev.off()
