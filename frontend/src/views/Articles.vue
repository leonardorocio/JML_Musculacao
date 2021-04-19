<template>
  <body style="background-color: black" class="no-margin">
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
            <router-link class="nav-link text-white" :to="{ name: 'Articles' }"
              >Suplementação</router-link
            >
          </li>
          <li class="nav-item">
            <router-link class="nav-link text-white" :to="{ name: 'About' }"
              >Contato</router-link
            >
          </li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid bg-light">
      <ul class="d-flex justify-content-between mr-5" style="list-style: none">
        <li
          v-for="(art, img) in articles.slice(
            (currentPage - 1) * perPage,
            (currentPage - 1) * perPage + perPage
          )"
          v-bind:key="art.id"
          class="mt-5"
        >
          <div class="container article-item">
            <img
              class="d-block"
              :src="images[art.id.toString()]"
              id="articleImg"
              alt="Imagem do artigo"
              v-if="art.image_post"
            />
            <img
              class="d-block"
              src="../assets/carregando.gif"
              id="articleImg"
              alt="Imagem do artigo"
              v-else
            />
            <router-link
              style="text-decoration: none"
              :to="{
                name: 'Article',
                params: { id: art.id, title: art.title },
              }"
            >
              {{ art.title }}
              <br />
              <span>
                {{ art.text.substring(0, 10) }}
              </span>
              <span class="gallery"
                >{{ art.category }} | Leonardo | 12/12/2021 às 10:30</span
              >
            </router-link>
          </div>
        </li>
      </ul>

      <b-pagination
        class="d-flex justify-content-center align-items-end mt-5"
        v-model="currentPage"
        :total-rows="rows"
        :per-page="perPage"
        aria-controls="articleImg"
      ></b-pagination>
    </div>
  </body>
</template>

<script>
import axios from "axios";

const firebase = require("../components/app.js");

export default {
  data() {
    return {
      articles: [],
      images: {},
      token: sessionStorage.access,
      perPage: 4,
      currentPage: 1,
    };
  },
  mounted() {
    this.getArticles();
  },
  updated() {
    this.getArticles();
  },
  methods: {
    async getArticles() {
      try {
        let response = await axios({
          method: "get",
          url: "https://jml-musculacao-admin.herokuapp.com/articles/",
          headers: {
            Authorization: "Bearer " + this.token,
          },
        });
        this.articles = response.data;
        this.articles.forEach((art) => {
          this.getArticleImageURL(art);
        });
      } catch (e) {
        swal.fire({
          icon: "error",
          title: `Ocorreu um erro ${e}`,
        });
      }
    },

    getArticleFirstParagraph(article) {
      return article.substring(0, article.indexOf("."));
    },

    getArticleImageURL(article) {
      if (article.image_post != null) {
        const fileName = article.image_post.split("images/");
        const firebasePath = `media/images/${fileName[1]}`;
        const downloader = this;
        firebase.storRef
          .child(firebasePath)
          .getDownloadURL()
          .then((url) => {
            downloader.images[article.id] = url;
          })
          .catch((e) => {
            swal.fire({
              icon: "success",
              title: "Não foi possível baixar as imagens de artigo",
            });
          });
      }
    },
  },
  computed: {
    rows() {
      return this.articles.length;
    },
  },
};
</script>

<style>
@import url("../style.css");
</style>