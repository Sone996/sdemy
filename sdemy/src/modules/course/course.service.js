import { courseRepo } from "./course.repo";
//import { TOKEN_LS_NAME } from "../../constants/constants";

class CourseService {
    studentsOnCourse(data) {
        return courseRepo.studentsOnCourse(data);
    }
}

export const courseService = new CourseService();