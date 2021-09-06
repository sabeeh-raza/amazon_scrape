f = open('search_urls_monitor.txt', 'w+')
url = 'https://www.amazon.com/s?k=monitor&i=computers&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,140):
    url = 'https://www.amazon.com/s?k=monitor&i=computers&page=' + str(i) + '&qid=1630963398&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()