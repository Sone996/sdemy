import { api } from '../../api/api';
const ROUTES = {
    COURSES: '/courses',
    TEACHER: '/teacher',
    STUDENTS: '/students',
    REQUEST_COURSE: '/request_course',
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

    fetchAplicationRequests() {
        const URL = `${ROUTES.TESACHER}${ROUTES.REQUEST_COURSE}`;
        // return api.get(URL);
    }
}

export const adminRepo = new AdminRepo();
