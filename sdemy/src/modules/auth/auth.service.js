import { authRepo } from "./auth.repo";
//import { TOKEN_LS_NAME } from "../../constants/constants";

class AuthService {
    login(data) {
        return authRepo.login(data);
    }

    register(data) {
        return authRepo.register(data);
    }

    fetchActiveAccount() {
        return authRepo.fetchActiveAccount();
    }
}

export const authService = new AuthService();