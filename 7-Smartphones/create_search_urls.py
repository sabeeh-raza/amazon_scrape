f = open('search_urls_smartphone.txt', 'w+')
url = 'https://www.amazon.com/s?k=smartphones&rh=n%3A7072561011&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,71):
    url = 'https://www.amazon.com/s?k=smartphones&i=mobile&rh=n%3A7072561011&page=' + str(i) + '&qid=1630611405&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()