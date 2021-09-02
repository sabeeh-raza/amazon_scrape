f = open('search_urls_mouse.txt', 'w')
url = 'https://www.amazon.com/s?k=mouse&i=computers-intl-ship&ref=nb_sb_noss_1'
f.write(url)
f.write('\n')


for i in range(2,120):
    url = 'https://www.amazon.com/s?k=mouse&i=computers-intl-ship&page=' + str(i) + '&qid=1630568775&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()