plot1<-function() {
    powerdata<-read.csv("household_power_consumption.txt",header=TRUE,sep=";")
    suppressMessages(library(dplyr))
    selected_dates<-filter(powerdata,Date =="1/2/2007"| Date=="2/2/2007")
    dates<-selected_dates[,"Date"]
    times<-selected_dates[,"Time"]
    dt<-paste(dates,times)
    
    
    ##Date and time format changed #
    
    DateTime<-strptime(dt,"%d/%m/%Y %H:%M:%S",tz="UTC")
    
    DateTime1<-data.frame(DateTime)
    pdata<-select(selected_dates,-(Date:Time))
    
    ##Date and Time replaced with DateTime ##
    
    hpdata<-cbind(DateTime1,pdata)
    
    




png(file="plot1.png")
hist(hpdata$Global_active_power,ylab="Frequency",xlab="global_active_power(kilowatts)",col="red",main="Global Active Power")
dev.off()

}