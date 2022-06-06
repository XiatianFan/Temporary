library(ggplot2)
library(dplyr)
setwd("C:/Users/xifa0/Desktop/Coursera Learning/PlottingAssignment2")
PM25<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
head(PM25)
str(PM25)
PM25$year<-as.factor(as.character(PM25$year))
Baltimore<-subset(PM25, fips == "24510")
head(Baltimore)
EmissionBaltimoreByType<-group_by(Baltimore, year, type)
head(EmissionBaltimoreByType)

TotalEmissionBaltimoreByType<-summarise(EmissionBaltimoreByType, Emissions=sum(Emissions))
ggplot(TotalEmissionBaltimoreByType, aes(x=as.factor(year), y=Emissions,
                                         fill=type, label=round(Emissions,2)))+
  geom_bar(stat="identity")+
  facet_grid(.~type)+
  xlab("year")+
  ylab("total PM2.5 emission in tons")+
  ggtitle("PM2.5 emission in Baltimore city by source types")+
  geom_label(aes(fill=type), colour="white", fontface="bold")
