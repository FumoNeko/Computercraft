# dependencies
# pip install requests

# INPUT
# get either gui or console input of the variables we need
# the search criteria must be the desired conditions
# Get card name, get Rarity. Combo box. They find the right card, the program indexes the table and spits out the correct UUID.
# We use the UUID to make the correct HTTP GET request, and this sets us up for the main program loop:

# PROCESS
# Sniper
# Make a GET request every 30 seconds until the program is stopped.
# We want to parse the json data and turn it into a table we can read
# Get the best buy value and sell values.
# Possibly make a graph to show market trends (possibly too complex, will look into this.)
# Notify the user with notifications or email when sweet spot prices are reached (this means we need input for sweet spot prices and logic for this)

# Watcher
# Same as sniper, but instead of watching the market and it's change, the user inputs a bought price
# The sell prices are analyzed, and percentages are shown for growth/loss on investment


# OUTPUT
# output the card, buy, sell values etc.
# make an automated email account with api key, send to 16193219350@tmomail.net

# other functions planned
# optional function to continuously print results with timestamps i.e. 32 up, 72 down results.

# variables
# Type classname "link-dropdown-toggle" args(MLB Card, Stadium, Equipment, Sponsorship, Unlockable, Perks)
# Name classname "input#name"
# Rarity classname "select#rarity_id" args(Diamond, Gold, Silver, Bronze, Common)
# BuyNowPrice
# SellNowPrice
# Overall
# Position
# Team
# Set
# Series

# gui code

# start of code
import time
import json
import requests


# json example code
def jsonlistings():
  # example JSON
  x = '{ "name":"John", "age":30, "city":"New York"}'
  # parse x:
  y = json.loads(x)
  # the result is a Python dictionary:
  print(y["age"])
# request example code
  def request():
    uuid = "bb00d1c8cf377a49b8e5bac839ced4e9"
    r = requests.get('https://mlb21.theshow.com/apis/listing.json?uuid=' + uuid)
    r.status_code
    r.headers['content-type']
    r.encoding
    r.text
    r.json()

#file json load example code
f = open("alllistings.json",)
data = json.load(f)
for i in data["listings"]:
  print(i)
f.close()

# timer example code
starttime = time.time()
while True:
    print "tick"
    time.sleep(60.0 - ((time.time() - starttime) % 60.0))
