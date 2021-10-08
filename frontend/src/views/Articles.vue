<template>
  <body class="no-margin color-body">
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
      </div>
    </nav>

    <div class="container-fluid d-flex justify-content-center">
      <p class="display-3 mt-3">Artigos</p>
    </div>

    <div class="container-fluid w-75 articles-block mt-3">
    <form>
      <div
        class="form-group container-fluid d-flex flex-column align-items-start wide"
      >
        <label for="search" class="mt-2 font-weight-bold">Procure por artigos: </label>
        <input
          type="search"
          name="searcher"
          ref="searcher"
          class="form-control w-100"
          id="search"
          placeholder="Digite aqui"
        />
      </div>
    </form>

    <div class="container-fluid">
      <ul
        class="d-flex justify-content-between mr-5 ml-3"
        style="list-style: none"
      >
        <li
          v-for="(art, index) in articles.slice(
            (currentPage - 1) * perPage,
            (currentPage - 1) * perPage + perPage
          )"
          v-bind:key="art.id"
          class="mt-5"
        >
          
          <div class="card" style="max-width: 20vw">
            <img
              class="card-img-top"
              :src="images[index]"
              id="articleImg"
              alt="Imagem do artigo"
              v-if="art.image_post"
            />
            <div class="card-body">
              <div class="card-text article-item">
                <router-link
                  style="text-decoration: none"
                  :to="{
                    name: 'Article',
                    params: { id: art.id, title: art.title },
                  }"
                >
                  {{ art.title }}
                  <p class="gallery">
                    {{ writeSummernote(art.text) }}
                  </p>
                  <span class="gallery"
                    >{{ art.category }} | Leonard | 12/12/2021 às 10:30</span
                  >
                </router-link>
              </div>
            </div>
          </div>
        </li>
      </ul>

      <!-- <h2 class="display-3 text-center" >Não foram encontrados artigos com esse termo.</h2> -->

      <b-pagination
        class="d-flex justify-content-center align-items-end mt-5"
        v-model="currentPage"
        :total-rows="rows"
        :per-page="perPage"
        aria-controls="articleImg"
      ></b-pagination>
    </div>
    </div>

    <div class="container-fluid mt-5 p-0 bg-dark d-flex justify-content-center">
      <span class="text-white">Copyright © 2021 - JML Musculação</span>
    </div>
  </body>
</template>

<script>
import axios from "axios";

const firebase = require("../components/app.js");
const errorLog = require("../components/backend_errors.js");

export default {
  data() {
    return {
      articles: [],
      images: [],
      token: sessionStorage.access,
      perPage: 4,
      currentPage: 1,
      searchKey: ''
    };
  },
  created() {
    this.getSearchedKey();
  },
  mounted() {
    this.getArticles();
  },
  methods: {
    async getArticles() {
      try {
        let response = await axios({
          method: "get",
          url: `http://localhost:8000/articles${this.searchKey}`,
          headers: {
            Authorization: "Bearer " + this.token,
          },
        });
        this.articles = response.data;
        this.articles.forEach((art, index) => {
          this.images.push(this.getArticleImageURL(art));
        });
      } catch (e) {
        swal.fire({
          icon: 'error',
          title: `Erro: ${e}`
        })
        errorLog.errorHandle(e);
      }
    },

    getArticleFirstParagraph(article) {
      return article.substring(0, article.indexOf("."));
    },

    getArticleImageURL(article) {
      if (article.image_post != null) {
        let url = article.image_post.split('media/')[1]
        url = decodeURIComponent(url.replace(/\+/g,  " "))
        url = url.substring(0, 6) + '/' + url.substring(6, url.length)
        return url
      }
    },
    getSearchedKey() {
      const path = document.URL;
      if (path.indexOf('?') > -1) {
        this.searchKey += path.substring(path.indexOf('?'));
        return
      }
      this.searchKey += '/';
    },
    writeSummernote(articleText) {
      var div = document.createElement("div");
      div.innerHTML = articleText;
      var text = div.textContent || div.innerText || "";
      return text.split('.')[0];
    }
  },
  computed: {
    rows() {
      return this.articles.length;
    },
  },
};
</script>

<style scoped>
@import url("../style.css");
</style>
