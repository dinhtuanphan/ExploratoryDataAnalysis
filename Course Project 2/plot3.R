library('data.table')
library('dplyr')
library('ggplot2')

# Read data
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

# Filter data by city
Baltimore <- summarise(group_by(filter(NEI,fips == '24510'),year,type), Emissions = sum(Emissions))

# Plot
png(filename='plot3.png')

ggplot(Baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
