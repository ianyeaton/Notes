import requests
import json

url =  'http://api.open-notify.org/astros.json'

res = requests.get(url)
data = res.json()

print(res.status_code)

people_dict = data["people"]
# print(data)

try:
  for i in range(5):
    print(people_dict[i]['name'])
except:
  print('Error bro')
