import pyrebase

config = {
  "apiKey": "AIzaSyDLmRU7KMoZsByDYCLmrTqCG3wrePa8TnU",
  "authDomain": "jml-musculacao.firebaseapp.com",
  "databaseURL": "https://jml-musculacao.firebaseio.com",
  "projectId": "jml-musculacao",
  "storageBucket": "jml-musculacao.appspot.com",
  "messagingSenderId": "942758114362",
  "appId": "1:942758114362:web:77638d14e485d678a3b103",
  # "serviceAccount": r"C:\Users\leona\Documents\jml-musculacao-firebase-adminsdk-zdp98-c4bb2d7576.json",
}

firebase = pyrebase.initialize_app(config)
storage = firebase.storage()
