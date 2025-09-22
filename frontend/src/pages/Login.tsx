import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "../context/AuthContext";
import { User } from "../services/userService";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  //const [user, setUser] = useState<User>();

  const { user, login } = useAuth();
  const navigate = useNavigate();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    const userToLogin: User = {
      id: 0,
      username: email,
      password: password,
      role: null
    }

    // For now, any email/password works
    login(userToLogin);

    if (user) navigate("/dashboard");
    
  };

  return (
    <div className="col-md-6 offset-md-3 mt-5">
      <h2>Login</h2>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <label>Email</label>
          <input 
            type="email"
            className="form-control"
            value={email}
            onChange={e => setEmail(e.target.value)}
            required 
          />
        </div>
        <div className="mb-3">
          <label>Password</label>
          <input 
            type="password"
            className="form-control"
            value={password}
            onChange={e => setPassword(e.target.value)}
            required 
          />
        </div>
        <button type="submit" className="btn btn-primary">Login</button>
      </form>
      {error && <p className="text-danger">{error}</p>}
    </div>
  );
};

export default Login;
