import Vue from 'vue';
import omit from "lodash/omit";
import { courseService } from '../../modules/course/course.service';
const courseStore = {
	namespaced: true,
	state: {
        studentsOnCourseList: null,
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
        parseStudentsOnCourse: (state, studentsOnCourseList) => {
			if(!studentsOnCourseList) {
                return;
            }
			studentsOnCourseList.forEach((student, i) => {
				studentsOnCourseList[i] = omit(student, ['course_id', 'course_name']);
				studentsOnCourseList[i] = {
					id: studentsOnCourseList[i].user_id,
					user: studentsOnCourseList[i].user,
					course_start_date: studentsOnCourseList[i].course_start_date,
					complete: studentsOnCourseList[i].complete
				}
			})
			state.studentsOnCourseList = studentsOnCourseList;
		},
	},
	actions: {
		async studentsOnCourse({commit}, payload) {
			try{
				const res = await courseService.studentsOnCourse(payload);
                commit('parseStudentsOnCourse', res.data);
				return Promise.resolve(res.data);
			} catch(error){
				return Promise.reject(error);
			}
		},
		async buyCourse({}, payload) {
			try {
				const res = await courseService.buyCourse(payload);
				return Promise.resolve(res);	
			} catch (error) {
				return Promise.reject(error);
			}
		}
	}
};

export default courseStore;
