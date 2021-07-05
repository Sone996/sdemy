import { api } from '../../api/api';
const ROUTES = {
    COURSES: '/courses',
    TEACHER: '/teacher',
    STUDENTS: '/students',
};

class AdminRepo {
    createCourse(data) {
        return api.post(ROUTES.COURSES, data);
    }

    fetchSingleCours(data) {
        const URL = `${ROUTES.COURSES}/${data}`;
        return api.get(URL);
    }

    fetchAllCourses() {
        return api.get(ROUTES.COURSES);
    }

    fetchMyCourses(id) {
        const URL = `${ROUTES.TEACHER}/${id}${ROUTES.COURSES}`;
        return api.get(URL);
    }

    fetchMyStudents() {
        return api.get(ROUTES.STUDENTS);
    }
}

export const adminRepo = new AdminRepo();
