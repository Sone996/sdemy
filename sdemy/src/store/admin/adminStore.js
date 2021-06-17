import Vue from 'vue'
import { adminService } from '../../modules/admin/admin.service'

const adminStore = {
	namespaced: true,
	state: {
		singleCours: null,
		courses: null
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
		async createCourse({commit}, payload) {
			try{
				const res = await adminService.createCourse(payload);
				// commit('setState', {
				// 	prop: 'singleCours',
				// 	value: result.data
				// });
				return Promise.resolve(res);

			} catch(error){
				return Promise.reject(error);
			}
		},
		async fetchSingleCours({commit}, payload) {
			try{
				const res = await adminService.fetchSingleCours(payload);
				commit('setState', {
					prop: 'singleCours',
					value: res.data
				});
				return Promise.resolve(res);
			} catch(errorr) {
				return Promise.reject(error);
			}
		},
	}
};

export default adminStore;
