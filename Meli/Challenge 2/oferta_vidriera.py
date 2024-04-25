# -*- coding: utf-8 -*-
"""
Created on Thu Apr 25 18:14:21 2024

@author: erick
"""

import requests
import pandas as pd

search_list = ['Google Home','Apple TV', 'Amazon Fire TV', 'chromecast']

item_list = []
searched_list = []
for search_product in search_list:
    url = f'https://api.mercadolibre.com/sites/MLA/search?q={search_product}&limit=50#json'
    response = requests.get(url)
    data = response.json()
    results = data['results']
    for result in results:
        item_id = result['id']
        item_list.append(item_id)
        searched_list.append(search_product)
    
url_item_base = 'https://api.mercadolibre.com/items/'

product_list = []
for item, searched_item in zip(item_list, searched_list):
    url_item = url_item_base + item
    response_item = requests.get(url_item)
    data_item = response_item.json()
    product_dict = {
        'id': data_item['id'],
        'item_search': searched_item,
        'title': data_item['title'],
        'condition':data_item['condition'],
        'domain': data_item['domain_id'],
        'price': data_item['price'],
        'original_price': data_item['original_price'],
        'date_created': data_item['date_created'],
        'date_updated' : data_item['last_updated'],
        'quantity': data_item['initial_quantity'],
        'link': data_item['permalink'],
        'status': data_item['status']
        }
    product_list.append(product_dict)

df = pd.DataFrame(product_list)
df = df.drop_duplicates(subset='id')
df.to_csv('oferta-vidriera.csv', index=False)
