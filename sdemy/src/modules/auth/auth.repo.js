import { api } from '../../api/api';
const ROUTES = {
    LOGIN: '/login',
    REGISTER: '/register',
};

class AuthRepo {
    login(data) {
        return api.post(ROUTES.LOGIN, data)
    }

    register(data) {
        return api.post(ROUTES.REGISTER, data);
    }
}

export const authRepo = new AuthRepo();
