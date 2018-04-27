##############################

######      ggplot2      #####

##############################

###########################################################
# working directory
###########################################################
getwd()
#setwd("/home/iss-user/Desktop/workshop")
setwd("/media/sf_iss-vm-vbox-sf/github/S-SB2018/Day1-2/R")
getwd()


library('ggplot2')
help('ggplot2')

ggplot(mpg, aes(displ, hwy, colour = class)) + 
  geom_point()


# Google map example
# install.packages('ggmap')
library('ggmap')

map = get_googlemap('chicago', zoom=14, color='bw')

df = data.frame(lon=rnorm(1000, mean=-87.62, sd=0.015), 
                lat=rnorm(1000, mean=41.88, sd=0.015))


ggmap(map, extent='device') +
  stat_density2d(
    aes(x=lon, y=lat, fill=..level.., alpha =..level..),
    size = 2, bins = 4, 
    data = df,
    geom = "polygon"
  ) +
  scale_fill_gradient(low='green', high='red') +
  scale_alpha(guide=FALSE)


# Warning messages:
# 1: `panel.margin` is deprecated. Please use `panel.spacing` property instead 
# 2: Removed 100 rows containing non-finite values (stat_density2d). 

# This is because some of randomly generated data points are outside of the map log/lat. rnorm()

# https://stackoverflow.com/questions/28303200/stat-density2d-removed-rows-containing-non-finite-values

bb <- attr(map, "bb")

sum(df$lat < bb$ll.lat | 
      df$lat > bb$ur.lat | 
      df$lon < bb$ll.lon | 
      df$lon > bb$ur.lon)

