var send = document.getElementById("send");
var inputEmail = document.getElementById("inputEmail");
var inputPassword = document.getElementById("inputPassword");

send.addEventListener('click', function () {

    firebase.auth().signInWithEmailAndPassword(inputEmail.value, inputPassword.value).then( function (result) {
        alert("Usuário logado com sucesso!");

        window.location.replace("index.html");
    }).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
        alert(errorMessage);
      });
})