<template>
  <body class="color-body">
    <nav
      class="navbar navbar-expand-lg navbar-light navs"
      style="background-color: black"
    >
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
              >Calistenia</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link text-white" :to="{ name: 'Articles' }"
              >Artigos</router-link
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
              <a id="auth-link"> Sair </a>
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

    <div class="container-fluid d-flex justify-content-center mt-3">
      <p class="display-4">Treino de Braços</p>
    </div>

    <div class="container-fluid w-75 articles-block mt-3 d-flex flex-column" id="workout-list">
      <!-- <p>Este é um treino de braços, com foco especificamente no trabalho dos músculos do bíceps e do tríceps</p> -->
      <ul class="list-group mt-3">
        <h4 class="card-title">Tríceps No Banco</h4>
        <li class="list-group-item">Séries: 4</li>
        <li class="list-group-item">Repetições: 12</li>
        <li class="list-group-item">Dificuldade: Intermediário</li>
        <li class="list-group-item">Intervalo entre séries: 60 segundos</li>
        <li class="list-group-item">Como fazer: <a href="https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21">https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21</a></li>
      </ul>
      <ul class="list-group mt-3">
        <h4 class="card-title">Flexão Fechada</h4>
        <li class="list-group-item">Séries: 4</li>
        <li class="list-group-item">Repetições: 12</li>
        <li class="list-group-item">Dificuldade: Intermediário</li>
        <li class="list-group-item">Intervalo entre séries: 60 segundos</li>
        <li class="list-group-item">Como fazer: <a href="https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21">https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21</a></li>
      </ul>
      <ul class="list-group mt-3">
        <h4 class="card-title">Barra Fixa com Pegada Supinada</h4>
        <li class="list-group-item">Séries: 4</li>
        <li class="list-group-item">Repetições: 12</li>
        <li class="list-group-item">Dificuldade: Avançado </li>
        <li class="list-group-item">Intervalo entre séries: 60 segundos</li>
        <li class="list-group-item">Como fazer: <a href="https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21">https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21</a></li>
      </ul>
      <ul class="list-group mt-3" style="text-decotarion: none;">
        <h4 class="card-title">Rosca Direta</h4>
        <li class="list-group-item">Séries: 4</li>
        <li class="list-group-item">Repetições: 12</li>
        <li class="list-group-item">Dificuldade: Intermediário</li>
        <li class="list-group-item">Intervalo entre séries: 60 segundos</li>
        <li class="list-group-item">Como fazer: <a href="https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21">https://www.youtube.com/watch?v=hU-B0R6U-4A&ab_channel=XTREME21</a></li>
      </ul>
    </div>

    <div class="container-fluid mt-5 p-0 bg-dark d-flex justify-content-center">
      <span class="text-white">Copyright © 2021 - JML Musculação</span>
    </div>

  </body>
</template>

<script>
export default {
  data() {
    return {
      user_logged: true,
      pageName: "",
    };
  },
  mounted() {
    this.getPageName();
  },
  methods: {
    getPageName() {
      let pagename = window.location.pathname.split("%20");
      for (let name of pagename) {
        this.pageName += name;
      }
    },
  },
};
</script>

<style></style>
