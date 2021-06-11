import Vue from 'vue';
import { TOKEN_LS_NAME } from "../constants/constants";
import store from '../store/index'
import omit from 'lodash/omit'

class Router {
  routerGuards(to, from, next) {
    const token = localStorage.getItem(TOKEN_LS_NAME);

    if (!token) {
      next("/login")
    }

    // store.dispatch('authStore/fetchActiveAccount').then((res) => {
    //   const role = res.data.role;
    //   // Vue.prototype.$role = 'accounting';
    //   Vue.prototype.$role = res.data.role;
    //   store.commit('authStore/setState', {
    //     prop: 'loggedUser',
    //     value: omit(res.data, 'gym')
    //   });

    //   store.commit('authStore/setState', {
    //     prop: 'selfLocation',
    //     value: res.data.gym
    //   });

    //   if (!role) {
    //       next("/login")
    //   }
    //   if(token && role && to.meta.allowedRoles.includes(role)) {
    //       next();
    //   } else {
    //     if (!token) {
    //       next("/login");
    //     } else {
    //       if (role && (role === 'admin' || role === 'accounting') && to.path === '/') {
    //         next({ name: 'dashboard-admin' });
    //       } else {
    //         next({ name: "error" });
    //       }
    //     }
    //   }
    // }).catch(() => {
    //   next("/login");
    // })
  }
}
export const routerService = new Router();
