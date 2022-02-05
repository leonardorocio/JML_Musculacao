import {initializeApp, } from 'firebase/app';
import {ref, } from 'firebase/storage';

var firebaseConfig = {
  apiKey: "AIzaSyDLmRU7KMoZsByDYCLmrTqCG3wrePa8TnU",
  authDomain: "jml-musculacao.firebaseapp.com",
  databaseURL: "https://jml-musculacao.firebaseio.com",
  projectId: "jml-musculacao",
  storageBucket: "gs://jml-musculacao.appspot.com",
  messagingSenderId: "942758114362",
  appId: "1:942758114362:web:77638d14e485d678a3b103"
};
// Initialize Firebase
const app = initializeApp(firebaseConfig);
const storRef = ref();

export {
  storRef
}



