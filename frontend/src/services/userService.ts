
import apiClient from "./apiClient";

export interface User {
    id: number | null;
    username: string | null;
    password: string | null;
    role: string | null;
}

class UserService {

    getAllUsers() {
        const controller = new AbortController();

        const request = apiClient.get<User[]>("/users", {
            signal: controller.signal
        });

        return { request, cancel: () => controller.abort() }
    }

    async validateUser(user: User): Promise<User> {
        console.log(`Validating user: ${JSON.stringify(user)}`);

        try {
            const res = await apiClient.post(`/users`, user);
            //const res = await apiClient.get<User>(`/users/${user.id}`);
            const dbUser: User = res.data;
            console.log(dbUser);
            return dbUser;
        } catch (err: any) {
            console.error("Validation failed", err);
            console.log(err)
            // If backend returned a 4xx/5xx, rethrow with a readable message
            if (err.response) {
                const message =
                    err.response.data?.detail || "Invalid username or password";
                throw new Error(message);
            } else if (err.request) {
                throw new Error("Server unreachable. Please try again later.");
            } else {
                throw new Error("Unexpected error during login.");
            }

        }
    }

}

export function isAdmin(user: User | null) {
    console.log(user);
    if (!user) return false;
    return user.role === 'ROLE_ADMIN';
}

export function isTeacher(user: User | null) {
    console.log(user);
    if (!user) return false;
    return user.role === 'ROLE_TEACHER';
}

export default new UserService();