import Vue from 'vue'
import { authService } from '../modules/auth/auth.service'
import { TOKEN_LS_NAME } from "../constants/constants";

const authStore = {
	namespaced: true,
	state: {
		loggedUser: null,
    	loginData: {
    	  email: null,
    	  password: null,
    	},
	},
	getters: {
		getState: (state) => (prop) => {
			return state[prop];
		},
	},
	mutations: {
		setLoggedUser: (state, loggedUser) => (state.loggedUser = loggedUser),
		setState: (state, { prop, value }) => {
			state[prop] = value;
		},
	},
	actions: {
		async login({commit}, payload) {
			try{
				// let formData = { ...payload };
				// formData.password = SHA512(formData.password).toString()
				const account = await authService.login(payload);
				commit("setLoggedUser", account.data);
				localStorage.setItem(TOKEN_LS_NAME, account.data.role);  //session-id ako bude
				return Promise.resolve(account.data);
			}
			catch(error){
				return Promise.reject(error);
			}
		},
		async logout({ commit }) {
			commit("setState", {
				loggedUser: null
			});
			return '/login';
		  },
	}
};

export default authStore;
