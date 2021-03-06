#���ʉ��K�T�@�ۑ�@�؍X�Êό��}�b�v
#
### Author Hiroki Hayshi 2021/12/14
#

#----Install library--------------------------------------#

library(dplyr)
library(DT)
library(leaflet)
library(knitr)
library(imager)
library(htmlwidgets)
library(devtools)
library(mapview)

#-----make data frame lng,lat and pop----------------------# 
setwd("C:/Work")

d <- read.table("Tanuki.txt",fill=TRUE,header = TRUE,sep = "\t",quote="")
lng <- d$lng
lat <- d$lat
pop <- d$pop

df <- data.frame(lng = lng, lat = lat, pop = pop)
knitr::kable(df)


#-----make Map--------------------------------------#
m <- leaflet(df) %>% addTiles() #make NULL Map
m

#add map
map <- leaflet(df)  %>%�@
	addTiles() %>%
	addMarkers(lng=~lng,lat=~lat,popup=~pop,
			label=paste(lng,lat,sep=",")) %>%
	addMiniMap(position = "bottomright") %>%
	addScaleBar(position = "bottomleft") %>%
	addMeasure(position = "topright", 
			primaryLengthUnit = "meters", 
			primaryAreaUnit = "sqmeters", 
			activeColor = "#3D535D",
			completedColor = "#7D4479")	

mapshot(map,file = "Rplot.png")


#plot list
DT::datatable(dplyr::select(df,name=pop),
				option = list(searchHighlight = TRUE),
				filter = "top")




#�ʐ^���悹��----�ۗ�
file <- load.image("Geisya.png")
addMarkers(lng=~lng,lat=~lat,popup=~paste0("<img src = ",file,">"))
			label=paste(lng,lat,sep=",")) %>%
