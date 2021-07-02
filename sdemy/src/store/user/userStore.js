import Vue from 'vue'
import omit from "lodash/omit";
import { userService } from '../../modules/user/user.service'

const userStore = {
	namespaced: true,
	state: {
		profileData: null,
		notCompletedCourses: null,
		completedCourses: null,
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
		parsenotCompletedCourses: (state, notCompletedCourses) => {
			if(!notCompletedCourses) {
                return;
            }
			notCompletedCourses.forEach((course, i) => {
				notCompletedCourses[i] = omit(course, ['description', 'teacher_id']);
				notCompletedCourses[i] = {
					course_id: notCompletedCourses[i].course_id,
					course_name: notCompletedCourses[i].course_name,
					teacher_name: notCompletedCourses[i].teacher_name,
					average_mark: notCompletedCourses[i].average_mark,
					price: notCompletedCourses[i].price
				}
			})
			state.notCompletedCourses = notCompletedCourses;
		},
		parseCompletedCourses: (state, completedCourses) => {
			if(!completedCourses) {
                return;
            }
			completedCourses.forEach((course, i) => {
				completedCourses[i] = {
					course_id: completedCourses[i].course.id,
					course_name: completedCourses[i].course.name,
					mark: completedCourses[i].mark,
				}
			})
			state.completedCourses = completedCourses;
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
		},
		async fetchNotCompletedCourses({commit}) {
			try {
				const res = await userService.fetchNotCompletedCourses();
				commit('parsenotCompletedCourses', res.data)
				return Promise.resolve(res);
			} catch (error) {
				return Promise.reject(error);
			}
		},
		async fetchCompletedCourses({commit}, id) {
			try {
				const res = await userService.fetchCompletedCourses(id);
				commit('parseCompletedCourses', res.data)
				return Promise.resolve(res);
			} catch (error) {
				return Promise.reject(error);
			}
		}
	}
};

export default userStore;
