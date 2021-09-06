f = open('search_urls_dslr.txt', 'w+')
url = 'https://www.amazon.com/s?k=dslr+camera&i=photo&ref=nb_sb_noss_1'
f.write(url)
f.write('\n')


for i in range(2,110):
    url = 'https://www.amazon.com/s?k=dslr+camera&i=photo&page=' + str(i) + '&qid=1630968126&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()