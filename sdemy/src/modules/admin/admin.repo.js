import { api } from '../../api/api';
const ROUTES = {
    COURSES: '/courses',
};

class AdminRepo {
    createCourse(data) {
        return api.post(ROUTES.COURSES, data);
    }

    fetchSingleCours(data) {
        const URL = `${ROUTES.COURSES}/${data}`;
        return api.get(URL);
    }
}

export const adminRepo = new AdminRepo();
