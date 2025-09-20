import apiClient from "./apiClient";

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

    getStudents(filter: string) {
        const controller = new AbortController();

        const request = apiClient.get<Student[]>(`/students?filter=${filter}`, {
            signal: controller.signal
        });

        return { request, cancel: () => controller.abort() }
    }

}

export default new StudentService();