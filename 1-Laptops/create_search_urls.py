f = open('search_urls_laptop.txt', 'w+')
url = 'https://www.amazon.com/s?k=laptops&i=computers-intl-ship&ref=nb_sb_noss_1'
f.write(url)
f.write('\n')


for i in range(2,100):
    url = 'https://www.amazon.com/s?k=laptops&i=computers-intl-ship&page=' + str(i) + '&qid=1630527954&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()