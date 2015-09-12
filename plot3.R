plot3<-function(){
   
     
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
    
    
    
    
    
png(file="plot3.png")
plot(hpdata$DateTime,hpdata$Sub_metering_3,pch=".",type="n",fin=25:8)

plot(hpdata$DateTime,hpdata$Sub_metering_2,pch=".",type ="n",fin=25:8 )

plot(hpdata$DateTime,hpdata$Sub_metering_1,pch=".",ylab="Energy sub metering",xlab="DateTime",type="n",fin=25:8)
lines(hpdata$DateTime,y=hpdata$Sub_metering_3,type="s",col="black")
lines(hpdata$DateTime,y=hpdata$Sub_metering_2,type="s",col="red")
lines(hpdata$DateTime,y=hpdata$Sub_metering_1,type="s",col="blue")

legend("topright",pch="__",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
}