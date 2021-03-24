<template>
<body>
    
    <span>{{ article.title}}</span>
    <br>
    <span>{{ article.text}}</span>
    <br>
    <span>{{ article.category}}</span>
    <br>
    <span>{{ article.id}}</span>

</body>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      article: [],
      currentpage: "",
      token: sessionStorage.access,
    };
  },
  mounted() {
    this.getCurrentPage();
    this.getArticle();
  },
  methods: {
    getArticle() {
      axios({
        method: "get",
        url: `http://localhost:8000/articles/${this.currentpage}`,
        headers: {
          Authorization: "Bearer " + this.token,
        },
      })
        .then((response) => {
          this.article = response.data;
        })
        .catch((error) => {
          swal.fire({
            icon: "error",
            title: `Ocorreu um erro ${error}`,
          });
        });
    },
    getCurrentPage() {
      let page = window.location.pathname;
      this.currentpage = page[page.length - 1];
    },
  },
};
</script>

<style>
</style>