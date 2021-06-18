import Vue from 'vue';
import omit from "lodash/omit";
import { adminService } from '../../modules/admin/admin.service';
const adminStore = {
	namespaced: true,
	state: {
		singleCours: null,
		myCourses: null,
		allCouresList: null,
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
		parseAllCOurses: (state, allCouresList) => {
			if(!allCouresList) {
                return;
            }
            allCouresList.forEach((course, i) => {
				allCouresList[i] = omit(course, ['date_of_update', 'date_of_creation']);
            	allCouresList[i] = {
                   id: allCouresList[i].id,
                   name: allCouresList[i].name,
                   average_mark: allCouresList[i].average_mark,
                   price: allCouresList[i].price
               }
            });
            state.allCouresList = allCouresList;
		},
		parseMyCourses: (state, myCourses) => {
			if(!myCourses) {
                return;
            }
			myCourses.forEach((course, i) => {
				myCourses[i] = omit(course, ['date_of_update', 'date_of_creation', 'description']);
				myCourses[i] = {
					id: myCourses[i].id,
					name: myCourses[i].name,
					average_mark: myCourses[i].average_mark,
					price: myCourses[i].price
				}
			})
			state.myCourses = myCourses;
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
		async fetchAllCourses({commit}) {
			try{
				const res = await adminService.fetchAllCourses();
				// commit('setState', {
				// 	prop: 'allCouresList',
				// 	value: res.data
				// });
				commit('parseAllCOurses', res.data);
				return Promise.resolve(res);
			} catch(error) {
				return Promise.reject(error);
			}
		},
		async fetchMyCourses({commit}, payload) {
			try{
				const res = await adminService.fetchMyCourses(payload);
				commit('parseMyCourses', res.data);
			} catch(error) {
				return Promise.reject(error);
			}
		}
	}
};

export default adminStore;
