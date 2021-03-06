  #created by Owen Yeh, 04302017
  #rm(list = ls(all=TRUE))
  setwd("C:/Users/acer/NTU_freshman_Introduction_to_Computer_and_Programming_Geography_department/week10/BACHW05")
  Seydlitz<- read.table("cwb_466920_2006.csv",header = TRUE, sep = ",")
  #question 1
  #(1)
  timeD<-c(1:31)
  month1<-0
  month7<-31+28+31+30+31+30
  F283mmx2<-NULL
  F150mmx1<-NULL
  F88mmx1<-NULL
  T500mmx4<-NULL
  #計算1月的內容物
  for(ip in c(1:31)){
    avgdata<-seq((ip-1+month1-1)*24+1, (ip-1+month1-1)*24+24)
    ip.Ta<-Seydlitz$T.air[avgdata]
    F283mmx2[ip]<-mean(ip.Ta)
    
    avgdata<-seq((ip-1+month1-1)*24+1, (ip-1+month1-1)*24+24)
    ip.Dw<-Seydlitz$Dew.point[avgdata]
    F150mmx1[ip]<-mean(ip.Dw)
  }
  #計算7月的內容物
  for(ip2 in c(1:31)){
    avgdata<-seq((ip2-1+month7-1)*24+1, (ip2-1+month7-1)*24+24)
    ip2.Ta<-Seydlitz$T.air[avgdata]
    F88mmx1[ip2]<-mean(ip2.Ta)
    
    avgdata<-seq((ip2-1+month7-1)*24+1, (ip2-1+month7-1)*24+24)
    ip2.Dw<-Seydlitz$Dew.point[avgdata]
    T500mmx4[ip2]<-mean(ip2.Dw)
  }
  #繪畫
  layout(matrix(1,1))
  aliveResult<-cbind(F283mmx2,F150mmx1,F88mmx1,T500mmx4)
  matplot(timeD,aliveResult,
       type = "b",
       main = "January and July's day avg tem and dew tem",
       xlab = "day",
       ylab = "mean temperature(du C)", 
       xlim =c(0,24),
       cex = 1.5 , 
       pch = c(15,16,17,18),
       col = c(5,6,7,8))
  legend(0,31,
         c("January avg temperature","January avg dew point","July avg temperature","July avg dew point"),
         pch = c(15,16,17,18),
         col = c(5,6,7,8),
         cex = 0.6,
         bty = "n")
  
  #(2)
  layout(matrix(c(1,1,2,2),2,2))
  Jan<-cbind(F283mmx2,F150mmx1)
  Jul<-cbind(F88mmx1, T500mmx4)
  montha<-c(1:31)
  matplot(montha,Jan,
       type = "o",
       xlab = "date",
       ylab = "Temperature", 
       main = "January avg tempertature & Dew point",
       xlim =c(0,31),
       pch = c(15,16),
       cex = 1.5 , 
       col = c(3,4))
  legend("topleft",
         c("January avg temperature","January avg dew point"),
         pch = c(15,16),
         col = c(3,4),
         cex = 0.8,
         bty = "n")
  
  matplot(montha,Jul,
       type = "o",
       xlab = "date",
       ylab = "Temperature", 
       main = "July avg tempertature & Dew point",
       xlim =c(0,31),
       pch = c(15,16),
       cex = 1.5 , 
       col = c(1,2))
  legend("left",
         c("July avg temperature","July avg dew point"),
         pch = c(15,16),
         col = c(1,2),
         cex = 0.8,
         bty = "n")
  
  dev.copy(jpeg," figure02.jpg")
  dev.off()
  #(4)(X)
  mday <- c(31,28,31,30,31,30,31,31,30,31,30,31) 
  
  monthlyyear<-NULL
  avgdata<-NULL
  for(ip3 in c(1:12)){
    avgdata<-seq(((cumsum(mday)[ip3]-mday[ip3])-1+1)*24+1,((cumsum(mday)[ip3])-1)*24+24)
    ip3.Ta<-Seydlitz$T.air[avgdata]
    monthlyyear[ip3]<-mean(ip3.Ta)
  }
  
  #---------------------------------------
  #question 2
  Lutzow<-read.table("Yushan20150210.csv",header = TRUE, sep = ",")
  Archer<-Lutzow[2]*3600/1000
  WCI1<-13.12+0.6215*(Lutzow[3])-11.37*(Archer)^0.16+0.3965*(Lutzow[3])*(Archer)^0.16
  PS<-Lutzow[2]/exp(-3844/8200)
  layout(matrix(c(1,3,2,4),2,2))
  matplot(Lutzow[1],Lutzow[3],
          type = "o",
          xlab = "Time",
          ylab = "Temperature", 
          main = "Yushan avg tempertature",
          pch = c(16),
          cex = 1.5 , 
          col = c(4))
  
  matplot(Lutzow[1],WCI,
          type = "o",
          xlab = "Time",
          ylab = "exponent", 
          main = "Yushan avg WCI",
          pch = c(15),
          cex = 1.5 , 
          col = c(3))
  
  matplot(Lutzow[1],Lutzow[2],
          type = "o",
          xlab = "Time",
          ylab = "hPa", 
          main = "Yushan avg pressure",
          pch = c(14),
          cex = 1.5 , 
          col = c(2))
  dev.copy(jpeg," figure003.jpg")
  dev.off()