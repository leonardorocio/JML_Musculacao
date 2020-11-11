function login() {
  if (firebase.auth().currentUser) {
    firebase.auth().signOut()
  }
  const email = document.getElementById("userEmail").value
  const password = document.getElementById("userPass").value
  firebase
    .auth()
    .signInWithEmailAndPassword(email, password)
    .then(() => {
      swal.fire({
        icon: "success",
        title: "Login realizado com sucesso"
      }).then(() => {
        setTimeout(() => {
          window.location.replace("../index.html")
        }, 1000)
      })
    })
    .catch(error => {
      const errorCode = error.code
      switch (errorCode) {
        case "auth/wrong-password":
          swal.fire({
            icon: "error",
            title: "Senha inválida",
          })
          break
        case "auth/invalid-email":
          swal.fire({
            icon: "error",
            title: "Email invalido",
          })
          break
        case "auth/user-not-found":
          swal.fire({
            icon: "warning",
            title: "Usuario não encontrado",
            text: "Deseja criar um usuário?",
            showCancelButton: true,
            cancelButtonText: "Não",
            cancelButtonColor: "#d33",
            confirmButtonText: "Sim",
            confirmButtonColor: "#3085d6",
          }).then((result) => {
            if (result.value) {
              window.location.replace('../html/cadastro.html')
            }
          })
          break
        default:
          swal.fire({
            icon: "error",
            title: error.message,
          })
      }
    })
}

function signUp() {
  const senha = document.getElementById('userPass')
  const email = document.getElementById('userEmail')
  firebase
    .auth()
    .createUserWithEmailAndPassword(email.value, senha.value)
    .then(() => {
      swal.fire({
        icon: "success",
        title: "Usuário criado com sucesso"
      }).then(() => {
        setTimeout(() => {
          window.location.replace("./index.html")
        }, 1000)
      })
    })
    .catch((error) => {
      const errorCode = error.code
      switch (errorCode) {
        case "auth/weak-password":
          swal.fire({
            icon: "error",
            title: "Senha muito fraca",
          })
          break
        default:
          swal.fire({
            icon: "error",
            title: error.message,
          })
      }
    })
}

function logout() {
  firebase.auth().signOut()
}