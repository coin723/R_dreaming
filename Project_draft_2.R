library(rvest)
getMovieInfo <- function(movieCd, key = '09e141d53580865783ee2261d2958418') {
  restURL <- 
    'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.xml?'
  fetched <- 
    paste0(restURL, 'key=', key, '&movieCd=', movieCd)
  return(URLencode(fetched))
}
temp <- getMovieInfo('20148846')
tempXML <- xml(temp)
TheThrone <- 