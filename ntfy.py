#https://docs.ntfy.sh/subscribe/api/#subscribe-as-json-stream
import requests

resp = requests.get("https://ntfy.sh/test/json", stream=True)
for line in resp.iter_lines():
  if line:
    print(line)
