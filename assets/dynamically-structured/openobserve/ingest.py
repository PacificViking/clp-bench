import base64
import requests
import sys
import json

#https://openobserve.ai/docs/ingestion/logs/python/#python

user = "root@clpbench.com"
password = "password"
bas64encoded_creds = base64.b64encode(bytes(user + ":" + password, "utf-8")).decode("utf-8")

headers = {"Content-type": "application/json", "Authorization": "Basic " + bas64encoded_creds}
org = "default"
stream = "clpbench1"
openobserve_host = "http://localhost:5080"
openobserve_url = openobserve_host + "/api/" + org + "/" + stream + "/_json"

def ingest_dataset():
    with open(sys.argv[1], 'r') as file:
        data = []
        for line in file:
            data.append(json.loads(line))
            if len(data)>50000:
                res = requests.post(openobserve_url, headers=headers, data=json.dumps(data))
                data = []
        res = requests.post(openobserve_url, headers=headers, data=json.dumps(data))

if __name__ == "__main__":
    try:
        ingest_dataset()
    except Exception as e:
        print(e)
