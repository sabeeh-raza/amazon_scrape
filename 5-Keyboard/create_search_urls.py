f = open('search_urls_keyboard.txt', 'w+')
url = 'https://www.amazon.com/s?k=keyboard&i=computers&ref=nb_sb_noss'
f.write(url)
f.write('\n')


for i in range(2,80):
    url = 'https://www.amazon.com/s?k=keyboard&i=computers&page=' + str(i) + '&qid=1630624500&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()