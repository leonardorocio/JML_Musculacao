let currentUser = {}

function getUser() {
  firebase.auth().onAuthStateChanged((user) => {
    if (user) {
      currentUser.uid = user.uid
      let userLabel = document.getElementById('botaoInscricao')
      userLabel.innerHTML = user.email
      createNewNavButton()
      let logOutButton = document.getElementById('logOutBtn')
      logOutButton.appendChild(createLogOutButton())
    } else {
      swal.fire({
        icon: "warning",
        title: "Usuario não está logado",
        text: "Deseja logar em um usuário?",
        showCancelButton: true,
        cancelButtonText: "Não",
        cancelButtonColor: "#d33",
        confirmButtonText: "Sim",
        confirmButtonColor: "#3085d6",
      }).then((result) => {
        if (result.value) {
          setTimeout(() => {
            window.location.replace('./html/login.html')
          })
        }
      })
    }
  })
}

function createLogOutButton() {
  const newButton = document.createElement("button")
  newButton.setAttribute('class', 'btn btn-outline-success my-2 my-sm-0 pl-4 pr-4 pt-3 pb-3')
  newButton.setAttribute('id', 'botaoInscricao')
  newButton.appendChild(document.createTextNode("Sair"))
  newButton.setAttribute("onclick", "logout()")
  return newButton
}

function createNewNavButton() {
  const itemList = document.getElementById('auth')
  const newItem = document.createElement("li")
  newItem.setAttribute('class', "list-inline-item")
  newItem.setAttribute('id', 'logOutBtn')
  itemList.appendChild(newItem)
}

function logout() {
  swal.fire({
    icon: 'success',
    title: 'Usuário foi desconectado'
  }).then((result) => {
    if (result.value) {
      firebase.auth().signOut()
      window.location.reload("index.html")
    }
  })
}

window.onload = function () {
  getUser()
}