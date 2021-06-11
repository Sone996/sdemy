import Vue from 'vue'
import { userService } from '../modules/auth/auth.service'

const authStore = {
	namespaced: true,
	state: {
	},
	getters: {
		getState: (state) => (prop) => {
			return state[prop];
		},
	},
	mutations: {
		setState: (state, { prop, value }) => {
			state[prop] = value;
		},
	},
	actions: {
	}
};

export default authStore;
