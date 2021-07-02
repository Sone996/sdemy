import { api } from '../../api/api';
import queryString from 'query-string';
const ROUTES = {
    STUDENTS: '/students',
};

class CourseRepo {
    studentsOnCourse(data) {
        const query = queryString.stringify(data)
        return api.get(`${ROUTES.STUDENTS}?${query}`)
    }
}

export const courseRepo = new CourseRepo();
