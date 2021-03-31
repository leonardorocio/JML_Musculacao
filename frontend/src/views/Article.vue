<template>
  <body>
    <span>{{ article.title }}</span>
    <br />
    <span id="summernote">
      {{ article.text }}
    </span>
    <br />
    <span>{{ article.category }}</span>
    <br />
    <span>{{ article.id }}</span>
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
          this.writeSummernote();
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
      this.currentpage = parseInt(page.split("/")[2]);
    },
    writeSummernote() {
      document.getElementById("summernote").innerHTML = `${this.article.text}`;
    },
  },
};
</script>

<style>
</style>