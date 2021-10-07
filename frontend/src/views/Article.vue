<template>
  <body>
    <nav
      class="navbar navbar-expand-lg navbar-light"
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

    <div
      class="container w-75 mt-5 d-flex flex-column align-items-center justify-content-center"
    >
      <span class="display-4">{{ article.title }}</span>
      <br />

      <div
        class="card w-75 d-flex flex-column align-items-center justify-content-center"
        id="article-text"
      >
        <span id="summernote">
          {{ article.text }}
        </span>
        <br />
        <span class="gallery"
          >{{ article.category }} | {{ article.autor_post }} |
          {{ article.id }}</span
        >
        <br />
      </div>
    </div>

    <div class="container w-75 mt-5 d-flex flex-column">
      <span class="display-4" v-if="comments.comments.length === 0"
        >Comentários</span
      >

      <span class="display-4" v-else
        >Comentários ({{ comments.comments.length }}):
      </span>
      <div class="card w-100 d-flex flex-column mt-2">
        <div class="card w-75 ml-4 mt-4" style="border: none">
          <h4 class="card-title pl-3">Comente!</h4>
          <form class="container w-100 d-flex flex-column pl-3">
            <label for="text_comment">Digite seu comentário:</label>
            <textarea
              class="form-control"
              name="text_comment"
              id="text_comment"
              rows="5"
              cols="50"
            ></textarea>
          </form>
          <button
            type="button"
            class="btn btn-primary ml-3 mt-2" id="button-comment"
            @click="getCurrentPage()"
          >
            Comentar
          </button>
        </div>
        <hr />
        <div v-for="comment of comments" :key="comment.id">
          <ul v-for="com of comment" :key="com.id">
            <div class="card w-75 mt-3" style="border: none">
              <h5 class="card-title">
                {{ com.autor_comentario_id }} disse em
                {{ com.data_comentario }}: {{ com.titulo_comentario }}
              </h5>
              <p class="card-text">{{ com.texto_comentario }}</p>
              <hr />
            </div>
          </ul>
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
const errorLog = require("../components/backend_errors.js");

export default {
  data() {
    return {
      article: [],
      comments: [],
      currentpage: 0,
      token: sessionStorage.access,
    };
  },
  mounted() {
    this.getCurrentPage();
    this.getArticle();
    this.getComments();
  },
  methods: {
    async getArticle() {
      try {
        let response = await axios({
          method: "get",
          url: `http://localhost:8000/articles/${this.currentpage}`,
          headers: {
            Authorization: "Bearer " + this.token,
          },
        });
        this.article = response.data;
        console.log(this.article);
        this.writeSummernote();
      } catch (e) {
        errorLog.errorHandle(e);
      }
    },
    getCurrentPage() {
      let page = window.location.pathname;
      this.currentpage = parseInt(page.split("/")[2]);
    },
    writeSummernote() {
      document.getElementById("summernote").innerHTML = `${this.article.text}`;
    },
    async getComments() {
      try {
        let comments = await axios({
          method: "GET",
          url: `http://localhost:8000/comments/${this.currentpage}/get_article_comments/`,
          headers: {
            Authorization: `Bearer ${this.token}`,
          },
        });
        this.comments = comments.data;
        console.log(this.comments);
      } catch (e) {
        errorLog.errorHandle(e);
      }
    },
  },
};
</script>

<style>
@import url("../assets/style.css");
</style>
