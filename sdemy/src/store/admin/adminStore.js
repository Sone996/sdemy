import Vue from 'vue';
import omit from "lodash/omit";
import { adminService } from '../../modules/admin/admin.service';
const adminStore = {
	namespaced: true,
	state: {
		singleCours: null,
		myCourses: null,
		allCouresList: null,
		myStudents: null,
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
		parseMyStudents: (state, myStudents) => {
			if(!myStudents) {
                return;
            }
			myStudents.forEach((student, i) => {
				myStudents[i] = omit(student, ['complete', 'course_id', 'description']);
				myStudents[i] = {
					user_id: myStudents[i].user_id,
					user: myStudents[i].user,
					course_name: myStudents[i].course_name,
					course_start_date: myStudents[i].course_start_date
				}
			})
			state.myStudents = myStudents;
		},
	},
	actions: {
		async createCourse({commit}, payload) {
			try{
				const res = await adminService.createCourse(payload);
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
				commit('parseAllCOurses', res.data);
				return Promise.resolve(res);
			} catch(error) {
				return Promise.reject(error);
			}
		},
		async fetchMyCourses({commit}, payload) {
			try {
				const res = await adminService.fetchMyCourses(payload);
				commit('parseMyCourses', res.data);
				return Promise.resolve(res);
			} catch(error) {
				return Promise.reject(error);
			}
		},
		async fetchMyStudents({commit}) {
			try {
				const res = await adminService.fetchMyStudents();
				commit('parseMyStudents', res.data);
				return Promise.resolve(res);
			} catch (error) {
				return Promise.reject(error);
			}
		}
	}
};

export default adminStore;
