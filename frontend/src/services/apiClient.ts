import axios, { AxiosError, CanceledError } from "axios";

export interface PaginatedResponse<T> {
    data: T[];
    total: number;
    page: number;
    totalPages: number;
}

export default axios.create({
    baseURL: "http://localhost:8000"
});

export { CanceledError };