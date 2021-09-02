f = open('search_urls_headphone.txt', 'w+')
url = 'https://www.amazon.com/s?k=headphones&i=electronics-intl-ship&ref=nb_sb_noss_2'
f.write(url)
f.write('\n')


for i in range(2,110):
    url = 'https://www.amazon.com/s?k=headphones&i=electronics-intl-ship&page=' + str(i) + '&qid=1630619120&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()