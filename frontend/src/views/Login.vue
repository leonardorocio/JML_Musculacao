<template>
  <body id="fundoCadastro">
    <div
      class="container bg-white forms d-flex flex-column justify-content-around"
    >
      <h1 class="display-4 text-center">Login</h1>

      <form method="POST">
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
        type="button"
        @click="login()"
      >
        Login
      </button>
      <p class="text-center">
        Não possui uma conta? Faça
        <router-link :to="{ name: 'Cadastro' }">Cadastro</router-link>
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
    async login() {
      this.email = document.getElementById("userEmail").value;
      this.pass = document.getElementById("userPass").value;
      try {
        let response = await axios({
          method: "POST",
          url: "http://localhost:8000/auths/login/",
          data: {
            email: this.email,
            password: this.pass,
          },
        });
        const data = response.data;
        let arr = [];
        for (let dt in data) {
          if (dt === 'workout') {
            const workout = data[dt]
            for (let item in workout) {
              arr.push(workout[item])
            }
            sessionStorage.setItem(dt, arr)
          } else {
            sessionStorage.setItem(dt, data[dt]);
          }
        }
        swal
          .fire({
            icon: "success",
            title: "Login realizado com sucesso",
          })
          .then(() => {
            this.$router.push({ name: "Home" });
          });
      } catch (e) {
        swal.fire({
          icon: "error",
          title: `Ocorreu um erro ${e}`,
        });
      }
    },
  },
};
</script>

<style>
</style>