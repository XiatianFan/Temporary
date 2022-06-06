setwd("C:/Users/xifa0/Desktop/Coursera Learning/PlottingAssignment2")
PM25<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
head(PM25)
str(PM25)
PM25$year<-as.factor(as.character(PM25$year))
Baltimore<-subset(PM25, fips == "24510")
head(Baltimore)
totalEmissionBaltimore<-with(Baltimore, tapply(Emissions, year,sum))
totalEmissionBaltimore<- as.data.frame.table(totalEmissionBaltimore)
names(totalEmissionBaltimore)<-c("years", "total.emission")

plot2<-barplot(height=totalEmissionBaltimore$total.emission/1000, names.arg = totalEmissionBaltimore$years,
               xlab="years", ylab="total PM2.5 emission in kilotons", 
               ylim=c(0,max(totalEmissionBaltimore$total.emission/1000+1.0)),
               main="total PM2.5 emission from all sources in Baltimore",
               col=totalEmissionBaltimore$years)

text(x=plot2, y=round(totalEmissionBaltimore$total.emission/1000,2),
     label=round(totalEmissionBaltimore$total.emission/1000,2),
     pos=3,cex=1,col="black")