f = open('search_urls_laptop.txt', 'w+')
url = 'https://www.amazon.com/s?k=laptops&rh=n%3A565108&ref=nb_sb_noss'
f.write(url) 
f.write('\n')


for i in range(2,76):
    url = 'https://www.amazon.com/s?k=laptops&i=computers&rh=n%3A565108&page=' + str(i) + '&qid=1630620657&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()