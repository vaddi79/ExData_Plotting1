plot2<-function() {
    
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
    

    png(file="plot2.png")

plot(hpdata$DateTime,hpdata$Global_active_power,xlab="DateTime",ylab="Global_active_power(kilowatt)",pch=".")
    
lines(hpdata$DateTime,y=hpdata$Global_active_power,type="s")



dev.off()

}

