f = open('search_urls_DSLR.txt', 'w+')
url = 'https://www.amazon.com/s?k=dslr+cameras&rh=n%3A281052&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,102):
    url = 'https://www.amazon.com/s?k=dslr+cameras&i=photo&rh=n%3A281052&page=' + str(i) + '&qid=1630610066&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()