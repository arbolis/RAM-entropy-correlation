library(ggplot2)
library(reshape2)

x1 <- read.table("/home/isaac/Documents/RAM-monitor/formatted1-for-R.txt",sep="", header=FALSE)
x2 <- read.table("/home/isaac/Documents/RAM-monitor/formatted2-for-R.txt",sep="", header=FALSE)
cor(x1$V1 , x2$V1)
plot(x1)
plot(x2)
hist(x1$V1)
hist(x2$V1)

x1$V0 <- (1:4245)*5
#x2$V0 <- (1:4245)*5
x1$V0 <- (1:4245)*5
colnames(x1)[1] <- "Used RAM [Mb]"
colnames(x2)[1] <- "Entropy [bit]"
df <- data.frame(x1, x2)
df2 <- melt(data = df, id.vars = "V0")
ggplot(data = df2, aes(x = V0, y = value, colour = variable)) + geom_line()+
  theme(legend.position="left")+
  coord_cartesian(xlim = c(0, 5000))+
#  coord_cartesian(ylim = c(0, 20000))+
  xlab("Time [s]")+ 
  scale_fill_discrete(name="Variables",
                                        breaks=c("V1", "V1.1"),
                                        labels=c("Used RAM [Mb]", "Entropy [bit]"))+
# scale_colour_brewer(name = "Variables")
  theme(axis.text.x= element_text(size=23),axis.title=element_text(size=30,face="bold"))+
  theme(axis.text.y= element_text(size=23),axis.title=element_text(size=30,face="bold"))+
  theme(legend.title = element_text(size=40))+
  theme(legend.text = element_text(size = 14))

### Ugly way:
df <- data.frame(x1, x2)

ggplot(df, aes(x=V0)) +                    # basic graphical object
  geom_line(aes(y=x1$V1), colour="red") +  # first layer
  geom_line(aes(y=x2$V1), colour="blue")+  # second layer
  ylim()


# Otro intento:

ggplot(data = df2, aes(x = V0, y = value,group = variable, colour=variable)) + geom_line()+
 scale_colour_discrete(labels=c("used RAM [Mb]","Entropy \n in /dev/random [bit]"))+
  coord_cartesian(xlim = c(0, 5000))+
  #  coord_cartesian(ylim = c(0, 20000))+
  xlab("Time [s]") 