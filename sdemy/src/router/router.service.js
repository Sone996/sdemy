import Vue from 'vue';
import { TOKEN_LS_NAME } from "../constants/constants";
import store from '../store/index'

class Router {
	routerGuards(to, from, next) {
		const token = JSON.parse(localStorage.getItem(TOKEN_LS_NAME));
		if (!token) {
			next("/login")
		}
		if(token && to.meta.allowedRoles.includes(token.role)) {
			next();
		} else {
			if(!token) {
				next("/login");
			} else {
				if (token && token.role === 'professor' && to.path === '/') {
					next({ name: 'professor-home' });
				} else {
					next({ name: "error" });
				}
			}
		}
	}
}
export const routerService = new Router();
