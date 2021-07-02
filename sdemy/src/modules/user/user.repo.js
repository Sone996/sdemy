
import { api } from '../../api/api';
const ROUTES = {
    USERS: '/users',
    STUDENT: '/student',
    STUDENTS: '/students',
    COURSES: '/courses',
    COMPLETE_COURSE: '/complete_course',
};

class UserRepo {
    goProfile(id) {
        return api.get(`${ROUTES.USERS}/${id}`);
    }

    fetchNotCompletedCourses() {
        const URL = `${ROUTES.STUDENT}${ROUTES.COURSES}`;
        return api.get(URL);
    }

    fetchCompletedCourses(id) {
        const URL = `${ROUTES.STUDENTS}/${id}${ROUTES.COMPLETE_COURSE}`;
        return api.get(URL)
    }
}

export const userRepo = new UserRepo();
