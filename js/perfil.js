const storRef = firebase.storage().ref()
const db = firebase.firestore()
let currentUser = {}
let profile = false
let urlImg = ''

function getUser() {
  firebase.auth().onAuthStateChanged((user) => {
    if (user) {
      currentUser.uid = user.uid
      getUserInfo(user.uid)
      let myProfile = document.getElementById('meuPerfil')
      myProfile.innerHTML += " - " + user.email
    } else {
      swal.fire({
        icon: "success",
        title: "Redirecionando para tela de autenticação",
      }).then(() => {
        setTimeout(() => {
          window.location.replace("../html/login.html")
        }, 1000)
      })
    }
  })
}

function uploadProfileImage() {
  const facePath = document.getElementById('faceInput').files[0]
  if (facePath != undefined) {
    const imagesRef = storRef.child('images/' + facePath.name)

    let file = facePath
    imagesRef.put(file).then(function (snapshot) {
      console.log('Imagem uploadado com sucesso')
    }).then(function (result) {
      getDownloadLink()
    }).then(function (value) {
      setTimeout(() => {
        saveProfile()
      }, 500)
    }).catch(function () {
      console.log('Estamos atualizando coisas fora a foto')
    })
    console.log(imagesRef.fullPath)
  } else if (document.getElementById('faceIcon').src != '../images/icone_rosto.png') {
    saveProfile()
  } else {
    return null
  }

}

function downloadTest() {
  const facePath = document.getElementById('faceInput').files[0]
  if (facePath != undefined) {
    const imagesRef = storRef.child('images/' + facePath.name)
    return imagesRef.fullPath
  } else {
    return null
  }
}

function getDownloadLink() {
  storRef.child(downloadTest()).getDownloadURL().then(function (url) {
    img = document.getElementById('faceIcon')
    img.src = url
  }).catch(function (error) {
    console.log(error)
  })
}

async function getUserInfo(uid) {
  const logUsers = await db.collection("profile").where("uid", "==", uid).get()
  let userInfo = document.getElementById("userInfo")
  if (logUsers.docs.length == 0) {
    userInfo.innerHTML = 'Perfil não registrado'
  } else {
    userInfo.innerHTML = 'Perfil registrado'
    profile = true
    const userData = logUsers.docs[0]

    currentUser.id = userData.id
    currentUser.firstName = userData.data().firstName
    currentUser.lastName = userData.data().lastName
    currentUser.age = userData.data().age
    currentUser.altura = userData.data().altura
    currentUser.weight = userData.data().weight
    currentUser.imgPath = userData.data().imgPath
    currentUser.sex = userData.data().sex

    document.getElementById("firstName").value = currentUser.firstName
    document.getElementById("lastName").value = currentUser.lastName
    document.getElementById("age").value = currentUser.age
    document.getElementById("altura").value = currentUser.altura
    document.getElementById("peso").value = currentUser.weight
    if (currentUser.sex == 'man') {
      document.getElementById('sexMasculino').checked = 'checked'
    } else {
      document.getElementById('sexFeminino').checked = 'checked'
    }
    document.getElementById("faceIcon").src = currentUser.imgPath
    document.getElementById("faceIcon").class = 'rounded'

  }
}

function getSexFromInput() {
  const radios = document.getElementsByName('sexRadio')
  for (radio of radios) {
    if (radio.checked) {
      return radio.value
    }
  }
}

async function saveProfile() {

  const firstName = document.getElementById('firstName').value
  const lastName = document.getElementById('lastName').value
  const age = document.getElementById('age').value
  const altura = document.getElementById('altura').value
  const weight = document.getElementById('peso').value
  const sex = getSexFromInput()
  let imgPath = document.getElementById('faceIcon').src

  if (!profile) {
    await db.collection("profile").add({
      uid: currentUser.uid,
      firstName: firstName,
      lastName: lastName,
      age: age,
      altura: altura,
      weight: weight,
      sex: sex,
      imgPath: imgPath,
    })
    getUserInfo(currentUser.uid)
  } else {
    await db.collection("profile").doc(currentUser.id).update({
      firstName: firstName,
      lastName: lastName,
      age: age,
      altura: altura,
      weight: weight,
      sex: sex,
      imgPath: imgPath,
    })
    console.log('Perfil salvo com sucesso')
  }
  window.location.reload()
}


window.onload = function () {
  getUser()
}

