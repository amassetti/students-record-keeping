import apiClient, { PaginatedResponse } from "./apiClient";

export interface Student {
    id: number;
    first_name: string;
    last_name: string;
    email: string;
    ppsn: string;
    course_code: string;
    course_name: string;
}

class StudentService {

    getStudents(filter: string, page: number, limit: number) {
        const controller = new AbortController();

        const request = apiClient.get<PaginatedResponse<Student>>(`/students?filter=${filter}&page=${page}&limit=${limit}`, {
            signal: controller.signal
        });

        return { request, cancel: () => controller.abort() }
    }

}

export default new StudentService();