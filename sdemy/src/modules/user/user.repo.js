
import { api } from '../../api/api';
const ROUTES = {
    USERS: '/users',
};

class UserRepo {
    goProfile(id) {
        return api.get(`${ROUTES.USERS}/${id}`);
    }
}

export const userRepo = new UserRepo();
