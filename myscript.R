### R workshop 23.09.2019 bei der AG CAA Wilhelmshaven
# Author: Flo
# Ziel: Mal sehen

#dark theme
#install.packages("devtools")
devtools::install_github("gadenbuie/rsthemes")
rsthemes::install_rsthemes()
rsthemes::list_rsthemes()
rstudioapi::applyTheme("One Dark {rsthemes}")

5+8

3*(100/8)

x <- 3+1 # variablenzuweisung

x+3

y <- x+3

class(x) # Klasse von Variable

class(y)

z <- c(x,y) #vektor aus zwei skalaren

class(z)

a<-"Hund"
b<-"Katze"

ab<-c(a,b)

df<- data.frame(z,ab)

df

#View(df)

# download package

#install.packages("archdata")

library(archdata) #oder require()
data("BACups")
#View(BACups)

BACups$RD

mean(BACups$RD)
mean_RD<-mean(BACups$RD)

sd(BACups$RD)
var(BACups$RD)
range<-range(BACups$RD)
summary(BACups$RD)

BACups[1,1]
range[1] # beginnt ab 1 nicht ab 0
BACups[,1] # values aus spalte 1
BACups[2,] #values in zeile 2

BACups[2,1] <- 10.0
BACups[2,] #values in zeile 2

BACups_proto<-subset(BACups, BACups$Phase == "Protoapennine")

#View(BACups_proto)

#install.packages("dplyr")
#install.packages("magrittr")

library(dplyr)
library(magrittr)

## Beispiel für eine Pipe

BACups %>%
  filter(Phase == "Protoapennine" ) %>%
  filter(RD>8) %>%
  use_series(RD) %>%
  mean()

## Beispiel einer Funktion

zweiM <- function(x) {
  2*mean(x)
}

zweiM(BACups$RD)

meanPhase <- function(phase) {
  BACups %>%
    filter(Phase == phase ) %>%
    filter(RD>8) %>%
    use_series(RD) %>%
    mean()
}

meanPhase("Protoapennine")

hist(BACups$RD)
plot(BACups$RD, BACups$H)

## Plot mit GGPlOT

#install.packages("ggplot2")
library(ggplot2)

ggplot()+
  geom_bar(data = BACups, aes(x = Phase, fill = Phase))+
  labs(y = "Häufigkeit",
       title = "Vorkommen der zwei Phasen")+
  scale_fill_manual(values=(c("grey","black")))+
  theme_dark()

data("EndScrapers")

ggplot()+
  geom_col(data = EndScrapers, 
           aes(x = Site, fill = Width, y = Freq))

ggplot(data = BACups)+
  geom_point(aes(x=RD,y=ND))

data("Snodgrass")

ggplot()+
  geom_point(data = Snodgrass,
             aes(x=Width,y=Length, color=Inside, shape=Segment))+
  theme_dark()+
  scale_color_discrete(name="Innerhalb?",
                       breaks=c("Inside","Outside"),
                       labels=c("innerhalb","außerhalb"))+
  scale_shape_discrete(name="Areal",
                       breaks=c("1","2","3"),
                       labels=c("Areal 1","Areal 2", "Areal 3"))

ggplot()+
  geom_point(data=Snodgrass, aes(x=Width,y=Length))+
  #facet_wrap(Inside~Effigies)
  facet_grid(Inside~.)

#install.packages("spatstat")
library(spatstat)

data("Arnhofen")

arnwin <- owin(poly = Arnhofen$window[, 1:2])

app <- ppp(Arnhofen$points$x, Arnhofen$points$y, arnwin)

plot(app)
plot(density.ppp(app))
