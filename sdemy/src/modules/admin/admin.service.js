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
}

export const adminService = new AdminService();