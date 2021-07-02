import { api } from '../../api/api';
import queryString from 'query-string';
const ROUTES = {
    STUDENTS: '/students',
    STUDENT: '/student',
    REQUEST_COURSE: '/request_course',
};

class CourseRepo {
    studentsOnCourse(data) {
        const query = queryString.stringify(data)
        return api.get(`${ROUTES.STUDENTS}?${query}`)
    }

    buyCourse(data) {
        const URL = `${ROUTES.STUDENT}${ROUTES.REQUEST_COURSE}/${data.id}`;
        return api.post(URL, data.data);
    }
}

export const courseRepo = new CourseRepo();
