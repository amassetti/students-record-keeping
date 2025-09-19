import { Link } from "react-router-dom";
import React from "react";
import { User, isAdmin, isTeacher } from "../services/userService";

interface Props {
    user: User | null;
    logout: () => void;
}

const NavBar = ({ user, logout } : Props) => {

    return (
        <nav className="my-3">
        <Link to="/" className="btn btn-outline-primary me-2">Home</Link>
        { !user && <Link to="/login" className="btn btn-outline-secondary me-2">Login</Link> }
        <Link to="/dashboard" className="btn btn-outline-success me-2">Dashboard</Link>
        { isAdmin(user) && <Link to="/adm-students" className="btn btn-outline-success me-2">Admin Students</Link> }
        { isTeacher(user) && <Link to="/tch-students" className="btn btn-outline-success me-2">Teacher Students</Link> }
        { user && <button onClick={logout} className="btn btn-danger">Logout</button> }
      </nav>
    );

}


export default NavBar;