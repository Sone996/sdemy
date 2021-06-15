import { api } from '../../api/api';
const ROUTES = {
    LOGIN: '/login',
};

class AuthRepo {
    login(data) {
        return api.post(ROUTES.LOGIN, data)
    }
}

export const authRepo = new AuthRepo();
