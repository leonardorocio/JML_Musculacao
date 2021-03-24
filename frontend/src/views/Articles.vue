<template>
  <body>
    <div class="home">
    <ul>
      <li v-for="art in articles" v-bind:key="art.id">
        <router-link :to="{name: 'Article', params: {id: art.id, title: art.title}}">
          {{art.title}}
        </router-link>
      </li>
    </ul>
  </div>
  </body>


</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      articles: [],
      token: sessionStorage.access
    };
  },
  mounted() {
    this.getArticles();
  },
  methods: {
    getArticles() {
      axios({
        method: "get",
        url: "http://localhost:8000/articles/",
        headers: {
          Authorization: "Bearer " + this.token,
        },
      })
        .then((response) => {
          this.articles = response.data;
        })
        .catch((error) => {
          swal.fire({
            icon: "error",
            title: `Ocorreu um erro ${error}`,
          });
        });
    },
  },
};
</script>

<style>
</style>