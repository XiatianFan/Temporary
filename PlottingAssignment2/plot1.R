setwd("C:/Users/xifa0/Desktop/Coursera Learning/PlottingAssignment2")
PM25<-readRDS("summarySCC_PM25.rds")
SCC<-readRDS("Source_Classification_Code.rds")
head(PM25)
str(PM25)
PM25$year<-as.factor(as.character(PM25$year))
totalEmission<-with(PM25, tapply(Emissions, year,sum))
totalEmission<- as.data.frame.table(totalEmission)
names(totalEmission)<-c("years", "total.emission")

plot1<-barplot(height=totalEmission$total.emission/1000, names.arg = totalEmission$years,
               xlab="years", ylab="total PM2.5 emission in kilotons", 
               ylim=c(0,max(totalEmission$total.emission/1000+1000)),
               main="total PM2.5 emission from all sources in USA",
               col=totalEmission$years)

text(x=plot1, y=round(totalEmission$total.emission/1000,2),
     label=round(totalEmission$total.emission/1000,2),
     pos=3,cex=1,col="black")