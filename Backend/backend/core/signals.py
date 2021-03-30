from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from backend.core.models import Article
import pyrebase

config = {
  "apiKey": "AIzaSyDLmRU7KMoZsByDYCLmrTqCG3wrePa8TnU",
  "authDomain": "jml-musculacao.firebaseapp.com",
  "databaseURL": "https://jml-musculacao.firebaseio.com",
  "projectId": "jml-musculacao",
  "storageBucket": "jml-musculacao.appspot.com",
  "messagingSenderId": "942758114362",
  "appId": "1:942758114362:web:77638d14e485d678a3b103"
}

# Caminho vai ser /media/django-summernote/2021-03-29/resto

firebase = pyrebase.initialize_app(config)
storage = firebase.storage()

@receiver(pre_save, sender=Article)
def double_quote_replace(sender, instance, **kwargs):
    instance.text = instance.text.replace("\"", "\'")
    teste = instance.text.split("img ")
    new_test = teste[1].split(' ')
    source = new_test[0][4:]
    storage.child(f'media/{instance.title}').put(fr'{source[2:-1]}')
    firebase_url = storage.child(f'media/{instance.title}').get_url(None)
    instance.text = instance.text.replace(source, f"'{firebase_url}'")
