<template>
    <body>
        <nav
      class="navbar navbar-expand-lg navbar-light"
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
    </body>
</template>

<script>
export default {
    data() {
        return {
            user_logged: true
        }
    }
}
</script>

<style>
@import url('../style.css');
</style>