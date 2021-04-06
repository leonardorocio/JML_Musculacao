<template>
  <body class="bg-light">
    <div class="container-fluid" id="header">
      <nav class="navbar navbar-expand-lg navbar-light">
        <img
          src="../assets/logo.png"
          alt="Background"
          height="100px"
          width="100px"
          id="imageLogo"
        />

        <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <router-link class="nav-link text-white" :to="{ name: 'Home' }"
                >Início</router-link
              >
            </li>
            <li class="nav-item">
              <router-link class="nav-link text-white" :to="{ name: 'Home' }"
                >Treinos</router-link
              >
            </li>
            <li class="nav-item">
              <router-link class="nav-link text-white" :to="{ name: 'Home' }"
                >Calistenia</router-link
              >
            </li>
            <li class="nav-item">
              <router-link
                class="nav-link text-white"
                :to="{ name: 'Articles' }"
                >Suplementação</router-link
              >
            </li>
            <li class="nav-item">
              <router-link class="nav-link text-white" :to="{ name: 'About' }"
                >Contato</router-link
              >
            </li>
          </ul>
          <ul class="list-inline my-2 my-lg-0" id="auth" v-if="user_logged">
            <li class="list-inline-item">
              <button
                id="botaoInscricao"
                class="btn btn-outline-success my-2 my-sm-0 pl-4 pr-4 pt-3 pb-3 mr-3"
              >
                <router-link :to="{ name: 'Dashboard' }" id="auth-link">
                  Meu Perfil
                </router-link>
              </button>
            </li>
            <li class="list-inline-item">
              <button
                id="botaoInscricao"
                class="btn btn-outline-success my-2 my-sm-0 pl-4 pr-4 pt-3 pb-3 mr-3"
                @click="logout()"
              >
                <a id="auth-link"> 
                  Sair 
                </a>
              </button>
            </li>
          </ul>
          <ul class="list-inline my-2 my-lg-0" id="auth" v-else>
            <li class="list-inline-item">
              <button
                id="botaoInscricao"
                class="btn btn-outline-success my-2 my-sm-0 pl-4 pr-4 pt-3 pb-3 mr-3"
              >
                <router-link :to="{ name: 'Cadastro' }" id="auth-link">
                  Inscrição
                </router-link>
              </button>
            </li>
          </ul>
        </div>
      </nav>
    </div>

    <div class="container-fluid mt-5 p-0 d-inline-flex">
      <img src="../assets/beneficios.jpg" alt="Barra fixa" width="50%" />
      <div class="card w-50">
        <div class="card-body" id="beneficios">
          <p class="text-center font-weight-bold">BENEFÍCIOS DA MUSCULAÇÃO</p>
          <p class="card-text ml-5">
            Sem dúvidas, a musculação é uma das mais benéficas atividades
            físicas para melhorar massa óssea, diminuir percentual de gorduras
            e, principalmente, recuperar a quantidade perdida de músculos, o que
            acontece naturalmente com o avanço da idade. Entre os principais
            benefícios, estão:
          </p>
          <ul class="list-group ml-4" id="lista-beneficios">
            <li class="list-group-item">Ganho de Massa Muscular;</li>
            <li class="list-group-item">Diminui percentual de gordura;</li>
            <li class="list-group-item">Diminui níveis de glicose;</li>
            <li class="list-group-item">Favorece o equilíbrio hormonal;</li>
            <li class="list-group-item">Melhora a qualidade do sono;</li>
            <li class="list-group-item">Eleva a postura;</li>
          </ul>
        </div>
      </div>
    </div>

    <h1 class="display-3 m-4 text-center" id="tituloCarrossel">
      CONFIRA NOSSOS TREINOS!
    </h1>

    <div
      id="carouselExampleIndicators"
      class="carousel slide carousel-fade"
      data-ride="carousel"
      data-interval="5000"
    >
      <ol class="carousel-indicators">
        <li
          data-target="#carouselExampleIndicators"
          data-slide-to="0"
          class="active"
        ></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img
            class="d-block w-100 img-carrossel"
            src="../assets/condicionamento.jpg"
            alt="Primeiro Slide"
          />
        </div>
        <div class="carousel-item">
          <img
            class="d-block w-100 img-carrossel"
            src="../assets/hipertrofia.jpg"
            alt="Segundo Slide"
          />
        </div>
        <div class="carousel-item">
          <img
            class="d-block w-100 img-carrossel"
            src="../assets/musculacao.jpg"
            alt="Terceiro Slide"
          />
        </div>
      </div>
      <a
        class="carousel-control-prev"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Anterior</span>
      </a>
      <a
        class="carousel-control-next"
        href="#carouselExampleIndicators"
        role="button"
        data-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Próximo</span>
      </a>
    </div>

    <div class="container-fluid mt-5 p-0 d-inline-flex" id="dietas">
      <p class="mt-4 font-weight-bold w-100 text-center text-white">
        QUER MELHORAR SUA ALIMENTAÇÃO?
      </p>
      <div class="col-6 m-0 p-0">
        <div class="card-body w-100 alimentacao" id="suplemento">
          <button class="btn btn-lg btn-block w-50 pt-3 pb-3 alimento">
            Suplementação
          </button>
        </div>
      </div>
      <div class="col-6 m-0 p-0">
        <div class="card-body w-100 alimentacao" id="dieta">
          <button class="btn btn-lg btn-block w-50 pt-3 pb-3 alimento">
            Alimentação
          </button>
        </div>
      </div>
    </div>

    <div class="container-fluid mt-5 p-0 bg-dark d-flex justify-content-center">
      <span class="text-white">Copyright © 2021 - JML Musculação</span>
    </div>
  </body>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      user_logged: false,
    };
  },
  mounted() {
    this.checkUserLogged();
  },
  methods: {
    async checkUserLogged() {
      let token = sessionStorage.access;
      try {
        let response = await axios({
          method: 'GET',
          url: "https://jml-musculacao-admin.herokuapp.com/auths/get_user_checked",
          headers: {
            Authorization: `Bearer ${token}`
          }
        })
        this.user_logged = true
      } catch(e) {
        swal
            .fire({
              icon: "warning",
              title: "Usuario não encontrado",
              text: "Deseja criar um usuário?",
              showCancelButton: true,
              cancelButtonText: "Não",
              cancelButtonColor: "#d33",
              confirmButtonText: "Sim",
              confirmButtonColor: "#3085d6",
            })
            .then((result) => {
              if (result.value) {
                this.$router.push({ name: "Cadastro" });
              }
            });
      }
    },
    async logout() {
      try {
        let response = await axios({
          method: 'POST',
          url: 'https:/jml-musculacao-admin.herokuapp.com/auths/logout/',
          data: {
            refresh_token: sessionStorage.refresh,
          }
        })
        sessionStorage.clear();
        swal
          .fire({
            icon: "success",
            title: "Usuário foi desconectado"
          }).then((result) => {
            window.location.reload();
          })
      } catch(e) {
        swal
          .fire({
            icon: 'error',
            title: 'Ocorreu um erro ao desconectar o usuário'
          })
      }
    },
  },
};
</script>

<style>
</style>

<style>
@import url("../assets/style.css");
</style>

