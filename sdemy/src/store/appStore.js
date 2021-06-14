import Vue from 'vue'
import { userService } from '../modules/app/app.service'

const appStore = {
	namespaced: true,
	state: {
		loader: false,
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

export default appStore;
