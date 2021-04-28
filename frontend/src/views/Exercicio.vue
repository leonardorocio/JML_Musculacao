<template></template>

<script>
export default {
    data() {
        return {
            pageName: "",
        }
    },
    mounted() {
      this.getPageName();
      console.log(window.location.href)
    },
    methods: {
      getPageName() {
        let pagename = window.location.pathname.split("%20");
        for (let name of pagename) {
          this.pageName += name;
        }
        console.log(this.pageName)
        console.log(document.title)
      }
    }
}
</script>

<style>
</style>