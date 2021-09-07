f = open('search_urls_smartphone.txt', 'w+')
url = 'https://www.amazon.com/s?k=smartphone&i=electronics&rh=n%3A172282%2Cp_36%3A10000-&dc&qid=1631025516&rnid=386442011&ref=sr_nr_p_36_3'
f.write(url)
f.write('\n')


for i in range(2,170):
    url = 'https://www.amazon.com/s?k=smartphone&i=electronics&rh=n%3A172282%2Cp_36%3A10000-&dc&page=' + str(i) + '&qid=1631025534&rnid=386442011&ref=sr_pg_' + str(i)
    f.write(url)
    f.write('\n')

f.close()