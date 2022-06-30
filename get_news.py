import requests
import json

response = requests.get("https://hacker-news.firebaseio.com/v0/maxitem.json?print=pretty").json()

response2 = requests.get("https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty").json()


data = requests.get("https://hacker-news.firebaseio.com/v0/item/"+str(response)+".json?print=pretty")

res = data.json()

for i in range(len(response2)):
  data3 = requests.get("https://hacker-news.firebaseio.com/v0/item/"+str(response2[i])+".json?print=pretty")
  res3 = data3.json()
  if 'url' in res3.keys() and 'by' in res3.keys() and 'title' in res3.keys():
    print(res3['by'])
    print(res3['title'])
    print(res3['url'])
  print()
print()
print()

print(res)
