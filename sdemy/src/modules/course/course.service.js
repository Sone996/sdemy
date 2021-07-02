import { courseRepo } from "./course.repo";
import omit from "lodash/omit";
//import { TOKEN_LS_NAME } from "../../constants/constants";

class CourseService {
    studentsOnCourse(data) {
        return courseRepo.studentsOnCourse(data);
    }

    buyCourse(data) {
        return courseRepo.buyCourse({
            id: data.id,
            data: omit(data, ['id'])
        });
    }
}

export const courseService = new CourseService();