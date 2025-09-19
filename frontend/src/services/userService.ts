
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
        } catch (err) {
            console.error("Validation failed", err);
            const emptyUser: User = {id: null, username: null, password: null, role: null};
            return emptyUser;
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