var send2 = document.getElementById("send2");
var inputEmail2 = document.getElementById("inputEmail2");
var inputPassword2 = document.getElementById("inputPassword2");

send2.addEventListener('click', function () {

    firebase.auth().createUserWithEmailAndPassword(inputEmail2.value, inputPassword2.value).then( function (result) {
        alert("Usuário cadastro com sucesso!");

        window.location.replace("login.html");
    }).catch(function(error) {
        // Handle Errors here.
        var errorCode = error.code;
        var errorMessage = error.message;
        // ...
        alert(errorMessage);
      });
})