import { userRepo } from "./user.repo";
//import { TOKEN_LS_NAME } from "../../constants/constants";

class UserService {
    goProfile(id) {
        return userRepo.goProfile(id);
    }
}

export const userService = new UserService();