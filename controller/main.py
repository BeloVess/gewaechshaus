import configparser
import requests
import time
import json
from random import randrange
from datetime import datetime

config = configparser.ConfigParser()
config.read('config.ini')
host = config['DEFAULT']['host']
  
# api-endpoint 
URL = "http://" + host + ":8080/api/records"

data = {
  "measured_at": int(time.mktime(datetime.now().timetuple())),
  "sensor_id": 1,
  "isActive": 1,
  "value": randrange(10)
}

r = requests.post(url = URL, data = data) 
  
# extracting response text  
print(r.text)