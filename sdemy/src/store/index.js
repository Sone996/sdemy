import Vue from "vue";
import Vuex from "vuex";
//stores user
import userStore from './user/userStore';
// END :: stores user
// stores admin
import adminStore from './admin/adminStore';
// END :: stores admin

// general
import authStore from './authStore';
import appStore from './appStore';
import courseStore from './course/courseStore';
// END :: general

Vue.use(Vuex);

let storeInstance = new Vuex.Store({
	modules: {
		userStore,
		adminStore,
		authStore,
		appStore,
		courseStore
	},
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

	actions: {},
});

export default storeInstance;
