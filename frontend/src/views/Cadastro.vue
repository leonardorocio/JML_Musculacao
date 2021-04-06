<template>
  <body id="fundoCadastro">
    <div
      class="container bg-white d-flex flex-column justify-content-around forms"
    >
      <h1 class="display-4 text-center mb-2">Cadastro</h1>

      <form action="/" method="POST">
        <div class="form-group">
          <label for="userEmail">Email: </label>
          <input
            type="email"
            name="userEmail"
            id="userEmail"
            class="form-control"
            placeholder="Ex: leonardof.rocio@gmail.com"
            aria-describedby="helpId"
          />
        </div>
        <div class="form-group">
          <label for="userPass">Senha: </label>
          <input
            type="password"
            name="userPass"
            id="userPass"
            class="form-control"
            placeholder="*********"
            aria-describedby="helpId"
          />
        </div>
      </form>
      <button
        class="btn btn-primary btn-block rounded-pill"
        type="submit"
        @click="signUp()"
      >
        Cadastrar
      </button>
      <p class="text-center">
        Já possui uma conta? Faça
        <router-link :to="{ name: 'Login' }">Login</router-link>
      </p>
    </div>
  </body>
</template>

<script>
import axios from "axios";
import router from "vue-router";

export default {
  data() {
    return {
      email: "",
      pass: "",
    };
  },
  methods: {
    async signUp() {
      this.email = document.getElementById("userEmail").value;
      this.pass = document.getElementById("userPass").value;
      try {
        let response = await axios({
          method: "POST",
          url: "https://jml-musculacao-admin.herokuapp.com/auths/",
          data: {
            email: this.email,
            password: this.pass,
          },
        });
        swal
          .fire({
            icon: "success",
            title: "Usuário criado com sucesso",
          })
          .then(() => {
            this.$router.push({ name: "Login" });
          });
      } catch (e) {
        swal.fire({
          icon: "error",
          title: `Ocorreu um erro ${errors}`,
        });
      }
    },
  },
};
</script>

<style lang="scss">
@import url("../style.css");
</style>