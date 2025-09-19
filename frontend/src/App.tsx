import { Routes, Route, Link } from "react-router-dom";
import NavBar from "./components/NavBar";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import ProtectedRoute from "./components/ProtectedRoute";
import { useAuth } from "./context/AuthContext";
import AdmStudents from "./pages/admin/AdmStudents";
import TchStudents from "./pages/teacher/TchStudent";

function App() {
  const { user, logout } = useAuth();

  return (
    <div className="container">
      <NavBar user={user} logout={logout} />

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route 
          path="/dashboard" 
          element={
            <ProtectedRoute>
              <Dashboard />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/adm-students" 
          element={
            <ProtectedRoute>
              <AdmStudents />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/tch-students" 
          element={
            <ProtectedRoute>
              <TchStudents />
            </ProtectedRoute>
          } 
        />
      </Routes>
    </div>
  );
}

export default App;
