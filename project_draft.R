library(rvest);
exRates = read.csv('exRates.csv', encoding = 'UTF-8');
exRates = exRates[1:5,];
exRates = exRates[,1:2]
exRates$rate = gsub(",","", exRates$rate) %>% as.numeric()
mw_ncu = read.csv('mw_ncu.csv', encoding = 'UTF-8')
mw_kor_hr = filter(mw_ncu, Country == 'Korea', Pay.period == 'Hourly')
mw_kor_hr = select(mw_kor_hr, Time, Value)
exRates$rate = as.numeric(as.character(exRates$rate))
mw_kor_hr$Value = mw_kor_hr$Value / exRates$rate
mw_kor_hr

library(foreign)
wage_occ = read.dta('OWWupdate1983_2008.dta')
wage_occ
names(wage_occ)

rmw = read.csv('rmw.csv', encoding = 'UTF-8')
mw_ncu = read.csv('mw_ncu.csv', encoding = 'UTF-8')
names(rmw)
rmw$COUNTRY
rmw$Country
group_by(rmw, COUNTRY) %>% filter(Pay.period == 'Hourly') %>% summarise(mean(Value))
group_by(mw_ncu, COUNTRY)
