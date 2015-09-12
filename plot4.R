plot4<-function()   {
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
    
    

    png(file="plot4.png")

     par(mfcol=c(2,2), mar=c(4,4,2,1),oma=c(1,1,2,0)  )

     
     with( hpdata, 
        plot(DateTime,Global_active_power,xlab=" ",ylab="Global_active_power(kilowatt)",pch=".", lines(DateTime,y=Global_active_power,type="s") ) 
           
 )  
     (
     
     plot(hpdata$DateTime,hpdata$Sub_metering_3,pch=".",type="n")
     
     
     plot(hpdata$DateTime,hpdata$Sub_metering_2,pch=".",type ="n")
     
     
     plot(hpdata$DateTime,hpdata$Sub_metering_1,pch=".",ylab ="Energy sub metering",xlab=" ",type="n")
     
     lines(hpdata$DateTime,y=hpdata$Sub_metering_3,type="s",col="blue" )
     lines(hpdata$DateTime,y=hpdata$Sub_metering_2,type="s",col="red" )
     
     lines(hpdata$DateTime,y=hpdata$Sub_metering_1,type="s",col="black" )
     
     
     
     legend("topright",pch="__",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     
     )
     
     
     with( hpdata, 
       plot (DateTime,Voltage,pch=".",xlab="DateTime",ylab="Voltage",
          lines(DateTime,y=Voltage,type="s",col="black")) 
       
 )          
     
   
    
     
      
    with( hpdata,   
        plot(DateTime,Global_reactive_power,pch=".",xlab="DateTime",ylab="Global_reactive_power",
            lines(DateTime,y=Global_reactive_power,type="s",col="black")) 
                 

  )
    
     
dev.off()


  }