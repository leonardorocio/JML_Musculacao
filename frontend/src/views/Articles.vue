<template>
  <body>
    <div class="home">
      <ul>
        <li v-for="art in articles" v-bind:key="art.id">
          <router-link
            :to="{ name: 'Article', params: { id: art.id, title: art.title } }"
          >
            {{ art.title }}
          </router-link>
        </li>
      </ul>
    </div>
  </body>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      articles: [],
      token: sessionStorage.access,
    };
  },
  mounted() {
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