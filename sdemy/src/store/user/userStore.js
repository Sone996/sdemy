import Vue from 'vue'
import { userService } from '../../modules/user/user.service'

const userStore = {
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

export default userStore;
