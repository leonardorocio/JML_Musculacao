<template>
  <body style="background-color: black">
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
              class="
                btn btn-outline-success
                my-2 my-sm-0
                pl-4
                pr-4
                pt-3
                pb-3
                mr-3
              "
            >
              <router-link :to="{ name: 'Dashboard' }" id="auth-link">
                Meu Perfil
              </router-link>
            </button>
          </li>
          <li class="list-inline-item">
            <button
              id="botaoInscricao"
              class="
                btn btn-outline-success
                my-2 my-sm-0
                pl-4
                pr-4
                pt-3
                pb-3
                mr-3
              "
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
              class="
                btn btn-outline-success
                my-2 my-sm-0
                pl-4
                pr-4
                pt-3
                pb-3
                mr-3
              "
            >
              <router-link :to="{ name: 'Cadastro' }" id="auth-link">
                Inscrição
              </router-link>
            </button>
          </li>
        </ul>
      </div>
    </nav>

    <div
      class="
        container-fluid
        w-100
        d-flex
        align-items-center
        justify-content-center
      "
      id="background-contato"
    >
      <h1 class="display-1 text-white font-weight-bold">CONTATO</h1>
    </div>

    <div
      class="container-fluid w-100 d-flex flex-column align-items-center"
      id="background-forms"
    >
      <span class="display-3 text-white font-weight-bold">FORMULÁRIO</span>
      <span class="display-3 text-white font-weight-bold">PARA CONTATO</span>
    </div>

    <div
      class="container-fluid w-100 d-flex justify-content-center mt-3 mb-3"
      style="background-color: black"
    >
      <h5 class="card-title text-white">
        Entrem em contato conosco para qualquer dúvida
      </h5>
    </div>

    <div
      class="
        container-fluid
        w-75
        d-flex
        align-items-center
        justify-content-center
      "
      style="height: 50vh"
    >
      <div
        class="
          container
          d-flex
          flex-column
          align-items-center
          justify-content-center
          p-4
        "
        style="background-color: #4bd1a0"
      >
        <h1 class="card-title text-white font-weight-bold mt-5">
          JML Musculação
        </h1>
        <h2 class="card-text text-white mt-3 mb-5 font-weight-bold text-center">
          Preencha os dados ao lado conforme se pede
        </h2>
      </div>
      <div
        class="container d-flex flex-column align-items-center"
        style="background-color: white"
        id="border-pixel"
      >
        <form class="container w-100 d-flex flex-column p-3">
          <label for="nome"></label>
          <input type="text" name="nome" id="nome" placeholder="Digite seu nome">

          <label for="email"></label>
          <input type="text" name="email" id="email" placeholder="Digite seu email">

          <label for="telefone"></label>
          <input type="text" name="telefone" id="telefone" placeholder="Digite seu telefone">

          <label for="text_message"></label>
          <textarea
            placeholder="Digite aqui sua mensagem..."
            class="form-control mb-3"
            name="text_message"
            id="text_message"
            rows="3"
            cols="50"
          >
          </textarea>
          <button class="btn btn-primary" type="submit">Enviar</button>
        </form>
      </div>
    </div>

    <div class="container-fluid w-100 d-flex flex-column align-items-center justify-content-center" id="background-about">
      <h1 class="display-2 text-white font-weight-bold">QUEM SOMOS</h1>
      <p class="text-white card-text w-50 text-justify">
        O JML Musculação é um sistema que foi construído para ajudar e incentivar pessoas que querem começar a praticar
        atividades físicas. Essa aplicação web foi feita como trabalho final do Projeto Integrador do Curso Técnico em
        Informática Integrado ao Ensino Médio do Instituto Federal Catarinense - Campus Araquari. <br>
        Desenvolvedores: Josué Hass Pereira, Leonardo Fagundes Rócio, Mateus Alayo Hidalgo Schulz e Luís Henrique Schmitt.
      </p>
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
    };
  },
};
</script>

<style>
@import url("../style.css");
</style>