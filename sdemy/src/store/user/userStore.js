import Vue from 'vue'
import { userService } from '../../modules/user/user.service'

const userStore = {
	namespaced: true,
	state: {
		profileData: null,
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
		async goProfile({commit}, payload) {
			try {
				const res = await userService.goProfile(payload);
				commit('setState', {
					prop: 'profileData',
					value: res.data
				});
				return Promise.resolve(res);
			} catch (error) {
				return Promise.reject(error);
			}
		}
	}
};

export default userStore;
