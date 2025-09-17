import { Routes, Route, Link } from "react-router-dom";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import ProtectedRoute from "./components/ProtectedRoute";
import { useAuth } from "./context/AuthContext";

function App() {
  const { user, logout } = useAuth();

  return (
    <div className="container">
      <nav className="my-3">
        <Link to="/" className="btn btn-outline-primary me-2">Home</Link>
        {!user && <Link to="/login" className="btn btn-outline-secondary me-2">Login</Link>}
        <Link to="/dashboard" className="btn btn-outline-success me-2">Dashboard</Link>
        {user && <button onClick={logout} className="btn btn-danger">Logout</button>}
      </nav>

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
      </Routes>
    </div>
  );
}

export default App;
