import requests
import time

for i in range(1, 69):
    r = requests.get('https://mlb21.theshow.com/apis/listings.json?page=' + str(i))
    f = open("C:/Users/John/github/Computercraft Programs/Other programs/Python/mlb21theshow/alllistings.txt", "a")
    f.write(r.text)
    f.close()
    time.sleep(1)
