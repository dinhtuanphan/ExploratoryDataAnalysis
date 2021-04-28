library('data.table')
library('dplyr')
library('ggplot2')

# Read data
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# Select Baltimore data
Baltimore <- NEI[(NEI$fips =='24510')&(NEI$type =='ON-ROAD'),]
BaltimoreEmiss <- summarise(group_by(Baltimore,year), Emissions = sum(Emissions))
BaltimoreEmiss$City <- "Baltimore, MD"

# Select Los Angeles city data
Los <- NEI[(NEI$fips =='06037')&(NEI$type =='ON-ROAD'),]
LosEmiss <- summarise(group_by(Los,year), Emissions = sum(Emissions))
LosEmiss$City <- "Los Angeles, LA"

# Combine data

bothCity <- rbind(BaltimoreEmiss,LosEmiss)

# Plot data

png("plot6.png")

ggplot(bothCity, aes(x=factor(year), y=Emissions, fill=City)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~City) +
  labs(x="year", y=expression("total PM"[2.5]*" emission in tons")) + 
  labs(title=expression("PM"[2.5]*" Motor vehicle emission in Baltimore and Los Angeles in tons"))+
  theme(legend.position = "none")
dev.off()
