import axios, { AxiosError, CanceledError } from "axios";

export default axios.create({
    baseURL: "http://localhost:8000"
});