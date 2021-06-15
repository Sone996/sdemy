import Vue from 'vue'
import { appService } from '../modules/app/app.service'

const appStore = {
	namespaced: true,
	state: {
		// for loader
		loader: false,
		// for modals
		activeOverlay: false,
		showModal: false,
		modalData: {
			name: null,
			data: null
		},
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
		setModalData: (state, payload) => {
			state.modalData.name = payload.modalName
			state.modalData.data = payload.modalData;
		},
	},
	actions: {
	}
};

export default appStore;
