from backend.core.utils import firebase
import requests


url = firebase.storage.child('images/Capturar.PNG').get_url(None)
request = requests.get(url=url)
print(request.ok)
print(request.status_code)
