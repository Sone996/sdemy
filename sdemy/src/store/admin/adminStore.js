import Vue from 'vue'
import { adminService } from '../../modules/admin/admin.service'

const adminStore = {
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

export default adminStore;
