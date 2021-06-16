import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './assets/scss/main.scss'
import './assets/scss/tailwind.scss'
import globaComponents from './plugins/GlobalComponents';
import 'vue-select/dist/vue-select.css';

Vue.config.productionTip = false

//   vue select
Object.keys(globaComponents.components).forEach((key) => {
  Vue.component(key, globaComponents.components[key]);
});

new Vue({
  router,
  store,
  render: function (h) { return h(App) }
}).$mount('#app')
