f = open('search_urls_monitor.txt', 'w+')
url = 'https://www.amazon.com/s?k=monitor&rh=n%3A1292115011&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,80):
    url = 'https://www.amazon.com/s?k=monitor&i=computers&rh=n%3A1292115011&page=' + str(i) + '&qid=1630621898&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()