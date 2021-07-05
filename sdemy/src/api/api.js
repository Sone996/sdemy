import { TOKEN_LS_NAME } from '../constants/constants'
import axios from 'axios';
import store from '../store/index'

const axiosInstance = axios.create({
    baseURL: process.env.VUE_APP_API_PATH
})

axiosInstance.interceptors.request.use((config) => {
    const token = localStorage.getItem(TOKEN_LS_NAME);
    store.commit('appStore/setState', {
        prop: 'loader',
        value: true
    });
    if (token) {
        config.headers["session-id"] = token
    }
    return config;
});

axiosInstance.interceptors.response.use(
    (response) => {
        store.commit('appStore/setState', {
            prop: 'loader',
            value: false
        })
        return Promise.resolve(response);
    },
    (error) => {
        store.commit('appStore/setState', {
            prop: 'loader',
            value: false
        })
        return Promise.reject(error);
    }
);

export const api = axiosInstance;