f = open('search_urls_smartphone.txt', 'w+')
url = 'https://www.amazon.com/s?k=smartphones&ref=glow_cls&refresh=7&rh=n%3A7072561011'
f.write(url)
f.write('\n')


for i in range(2,107):
    url = 'https://www.amazon.com/s?k=smartphones&i=mobile&rh=n%3A7072561011&page=' + str(i) + '&qid=1631005149&refresh=7&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()