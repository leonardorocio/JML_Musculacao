import Vue from 'vue'
import App from './App.vue'
import router from './router'
import 'bootstrap'

// import { BootstrapVue, IconsPlugin} from 'bootstrap-vue'
import { PaginationPlugin, CarouselPlugin} from "bootstrap-vue";

// Vue.use(BootstrapVue)
// Vue.use(IconsPlugin)
Vue.use(PaginationPlugin)
Vue.use(CarouselPlugin)

Vue.config.productionTip = false

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
