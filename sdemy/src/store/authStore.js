import Vue from 'vue'
import { authService } from '../modules/auth/auth.service'
import { TOKEN_LS_NAME } from "../constants/constants";
import SHA512 from "crypto-js/sha512";

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
				let formData = { ...payload };
				formData.password = SHA512(formData.password).toString()
				const account = await authService.login(formData);
				commit("setLoggedUser", account.data);
				localStorage.setItem(TOKEN_LS_NAME, account.data['session-id']);
				return Promise.resolve(account);
			}
			catch(error){
				return Promise.reject(error);
			}
		},
		async fetchActiveAccount({ commit }) {
			try {
				const account = await authService.fetchActiveAccount();
				commit('setState', {
					loggedUser: account.data
				});
				return account
			} catch (error) {
				return Promise.reject(error);
			}
		},
		async logout({ commit }) {
			try {
				const res = await authService.logout();
				commit("setState", {
					loggedUser: null
				});
				return '/login';
			} catch (error) {
				return Promise.reject(error);
			}
		},
		async register({}, payload) {
			try{
				let formData = { ...payload };
				formData.password = SHA512(formData.password).toString()
				const res = await authService.register(formData);
				return Promise.resolve(res);
			} catch(error) {
				return Promise.reject(error);
			}
		},
	}
};

export default authStore;
