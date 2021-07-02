import { userRepo } from "./user.repo";
//import { TOKEN_LS_NAME } from "../../constants/constants";

class UserService {
    goProfile(id) {
        return userRepo.goProfile(id);
    }

    fetchNotCompletedCourses() {
        return userRepo.fetchNotCompletedCourses();
    }

    fetchCompletedCourses(id) {
        return userRepo.fetchCompletedCourses(id);
    }
}

export const userService = new UserService();