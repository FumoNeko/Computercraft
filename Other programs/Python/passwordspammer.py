# You can look at chrome's network tab and see form data to see entered variables, request url and redirect
# the form data will likely contain some sort of md5 hash as a sort of variable name

import requests
import os
import random
import string
import json

chars = string.ascii_letters + string.digits + '!@#$%^&*()'
random.seed = (os.urandom(1024))

url = 'ENTER URL HERE'

names = json.loads(open('names.json').read())

for name in names:
    name_extra = ''.join(random.choice(string.digits))

    username = name.lower() + name_extra + '@yahoo.com'
    password = ''.join(random.choice(chars) for i in range(8))

    requests.post(url, allow_redirects=False, data={
        'USERVARIABLEGOESHERE': username,
        'passwordformgoeshere': password
     })

    print "sending username %s and password %s" % (username, password)
