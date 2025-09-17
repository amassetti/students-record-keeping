
import apiClient from "./apiClient";

export interface User {
    id: number,
    username: string,
    password: string
}

class UserService {

    getAllUsers() {
        const controller = new AbortController();

        const request = apiClient.get<User[]>("/users", {
            signal: controller.signal
        });

        return { request, cancel: () => controller.abort() }
    }

    async validateUser(user: User): Promise<boolean> {
        console.log(`Validating user: ${JSON.stringify(user)}`);

        try {
            const res = await apiClient.post(`/users`, user);
            //const res = await apiClient.get<User>(`/users/${user.id}`);
            return res.status === 200;
        } catch (err) {
            console.error("Validation failed", err);
            return false;
        }
    }

}

export default new UserService();