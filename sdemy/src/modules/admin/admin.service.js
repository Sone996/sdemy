import { omit } from "lodash";
import { adminRepo } from "./admin.repo";
//import { TOKEN_LS_NAME } from "../../constants/constants";

class AdminService {
    createCourse(data) {
        return adminRepo.createCourse(data);
    }
    
    fetchSingleCours(data) {
        return adminRepo.fetchSingleCours(data);
    }

    fetchAllCourses() {
        return adminRepo.fetchAllCourses();
    }

    fetchMyCourses(id) {
        return adminRepo.fetchMyCourses(id);
    }

    fetchMyStudents() {
        return adminRepo.fetchMyStudents();
    }

    fetchAplicationRequests() {
        return adminRepo.fetchAplicationRequests();
    }

    resolveRequest(data) {
        return adminRepo.resolveRequest({
            courseId: data.course_id,
            data: omit(data, ['course_id']) 
        });
    }

    completeCourse(data) {
        return adminRepo.completeCourse({
            courseId: data.courseId,
            teacherId: data.teacherId,
            userId: data.userId,
            data: omit(data, ['courseId', 'teacherId', 'userId'])
        });
    }
}

export const adminService = new AdminService();