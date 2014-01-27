import requests

res = requests.post("http://localhost:8000/post")
print res.text

res = requests.put("http://localhost:8000/put")
print res.text

res = requests.delete("http://localhost:8000/delete")
print res.text

res = requests.get("http://localhost:8000/")
print res.text

res = requests.get("http://localhost:8000/get")
print res.text