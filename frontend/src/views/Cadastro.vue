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
            v-model="email"
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
            v-model="pass"
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

const errorLog = require("../components/backend_errors.js");

export default {
  data() {
    return {
      email: "",
      pass: "",
    };
  },
  methods: {
    async signUp() {
      try {
        let response = await axios({
          method: "POST",
          url: "http://localhost:8000/auths/",
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
        errorLog.errorHandle(e);
        this.email = '';
        this.pass = '';
      }
    },
  },
};
</script>

<style>
@import url("../style.css");
</style>
