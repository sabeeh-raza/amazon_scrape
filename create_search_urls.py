f = open('search_urls_processor.txt', 'w+')
url = 'https://www.amazon.com/s?k=processor&rh=n%3A193870011&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,85):
    url = 'https://www.amazon.com/s?k=processor&i=computers&rh=n%3A193870011&page=' + str(i) + '&qid=1630626110&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()