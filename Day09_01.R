#install.packages('maps')
library(maps)
library(ggplot2)

asia = map_data('world', region = c('Japan', 'China', 'North Korea', 'South Korea'))
ggplot(asia, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = 'white', colour = 'black')
install.packages('mapproj')
library(mapproj)
ggplot(asia, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = 'white', colour = 'black') + 
  coord_map()
ggplot(asia, aes(x = long, y = lat, group = group)) + 
  geom_polygon(fill = 'white', colour = 'black') + 
  coord_map("polyconic")

#install.packages('ggmap')
#install.packages('sp')
#install.packages('/private/var/folders/r8/3sydlygj32s3qvqplmg5kzt00000gn/T/Rtmp7x2HQC/downloaded_packages/ggmap_2.5.2.tgz', repos = NULL, type = "source")
#install.packages('/private/var/folders/r8/3sydlygj32s3qvqplmg5kzt00000gn/T/Rtmp7x2HQC/downloaded_packages/sp_1.2-0.tar.gz', repos = NULL, type = "source")
library(ggmap)

geocode('Seoul', source = 'google')
geocode('Seoul', source = 'google', output = 'latlona')
geocode(enc2utf8('서울'), source = 'google')
geocode(enc2utf8('서울'), source = 'google', output = 'latlona')
geocode(enc2utf8('서울&language=ko'), source = 'google', output = 'latlona')

#mutate_geocode(data.frame, address_column_name, source = 'google')
station_list = c('시청역', '을지로입구역', '을지로3가역', '을지로4가역', 
                 '동대문역사문화공원역', '신당역', '상왕십리역', '왕십리역', '한양대역', 
                 '뚝섬역', '성수역', '건대입구역', '구의역', '강변역', '잠실나루역', 
                 '잠실역', '신천역', '종합운동장역', '삼성역', '선릉역', '역삼역', 
                 '강남역', '2호선 교대역', '서초역', '방배역', '사당역', '낙성대역', 
                 '서울대입구역', '봉천역', '신림역', '신대방역', '구로디지털단지역', 
                 '대림역', '신도림역', '문래역', '영등포구청역', '당산역', '합정역', 
                 '홍대입구역', '신촌역', '이대역', '아현역', '충정로역')
station_df = data.frame(station_list, stringsAsFactors = FALSE)
station_df$station_list = enc2utf8(station_df$station_list)
station_lonlat = mutate_geocode(station_df, station_list, source = 'google')
station_lonlat

qmap('seoul', zoom = 11)
qmap('seoul', zoom = 11, color = 'bw')
qmap('seoul', zoom = 11, maptype = 'roadmap')
qmap('seoul', zoom = 11, maptype = 'satellite')
qmap('seoul', zoom = 11, maptype = 'hybrid')

qmap('seoul', zoom = 11, source = 'stamen', maptype = 'watercolor')
qmap('seoul', zoom = 11, source = 'stamen', maptype = 'toner')

seoul_lonlat = unlist(geocode('seoul', source = 'google'))
qmap(seoul_lonlat, zoom = 11, source = 'stamen', maptype = 'toner')

seoul_map <- qmap('Seoul', zoom = 11, source = 'stamen', maptype = 'toner')
seoul_map + geom_point(data = station_lonlat, aes(x = lon, y = lat), colour = 'green',
                       size = 4)

wifi_data = read.csv('wifi_data.csv', encoding = 'utf-8', stringsAsFactors = FALSE)
seoul_map + geom_point(data = wifi_data, aes(x = lon, y = lat)) + facet_wrap(~div)
seoul_map + 
  geom_polygon(data = wifi_data, aes(x = lon, y = lat, fill = ..level..), 
               stat = 'density2d', alpha = 0.3) + 
  scale_fill_gradient(low = '#C6DBEF', high = '#08306B') + 
  facet_wrap(~div)

#install.packages('leaflet')
library(leaflet)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], 
          lat = seoul_lonlat[2], 
          zoom = 11) %>% 
  addTiles() %>% 
  addCircles(lng = ~lon, lat = ~lat)
leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat = ~lat)
leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('CartoDB.Positron') %>% 
  addCircles(lng = ~lon, lat = ~lat)

leaflet(wifi_data) %>% 
  setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
  addProviderTiles('Stamen.Toner') %>% 
  addCircles(lng = ~lon, lat = ~lat, popup = ~div)

#install.packages('networkD3')
library(networkD3)
data(MisLinks, MisNodes)
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = 'source', Target = 'target', 
             Value = 'value', NodeID = 'name', Group = 'group', opacity = 0.6)

#install.packages('d3heatmap')
library(d3heatmap)
d3heatmap(mtcars, scale = "column", colors = "Blues")

#install.packages('DT')
library(DT)
datatable(iris)
