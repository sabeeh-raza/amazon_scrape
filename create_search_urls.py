f = open('search_urls.txt', 'w')
url = 'https://www.amazon.com/s?k=processor&i=computers-intl-ship&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,100):
    url = 'https://www.amazon.com/s?k=processor&i=computers-intl-ship&page=' + str(i) + '&qid=1630524487&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()