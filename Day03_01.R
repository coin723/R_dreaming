url_wiki = 'https://en.wikipedia.org/wiki/List_of_South_Korean_regions_by_GDP'
library(rvest)
wiki = html(url_wiki)
html_table(html_node(wiki, 'table'))
library(rvest)
boxoffice = xml('boxoffice0831.xml', encoding = 'UTF-8')
daily = xml_node(boxoffice, 'dailyboxofficelist')
rank = xml_text(xml_nodes(daily, 'rank'))
movieNm = xml_text(xml_nodes(daily, 'movienm'))
audiCnt = xml_text(xml_nodes(daily, 'audicnt'))
daily_boxoffice = data.frame(rank, movieNm, audiCnt)

boxoffice_full = xml('boxoffice0831_full.xml', encoding = 'UTF-8')
daily_full = xml_node(boxoffice_full, 'dailyBoxOffice')
rank_full = xml_text(xml_nodes(boxoffice_full, 'rank'))
movieNm_full = xml_text(xml_nodes(boxoffice_full, 'movienm'))
audiCnt_full = xml_text(xml_nodes(boxoffice_full, 'audicnt'))
audiAcc_full = xml_text(xml_nodes(boxoffice_full, 'audiacc'))
scrnCnt_full = xml_text(xml_nodes(boxoffice_full, 'scrncnt'))
daily_boxoffice_full = data.frame(rank_full, movieNm_full, audiCnt_full, audiAcc_full, 
                                  scrnCnt_full)

url_daum = 'http://score.sports.media.daum.net/record/baseball/kbo/prnk.daum'
daum = html(url_daum)
html_table(html_node(daum, 'table'))
daum_table = html_table(html_node(daum, 'table'))
