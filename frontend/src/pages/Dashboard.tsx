import { useAuth } from "../context/AuthContext";

const Dashboard = () => {
  const { user } = useAuth();

  return (
    <div>
      <h2>Dashboard</h2>
      <p>Welcome, {user?.username}!</p>
      <p>You are login in as {user?.role === "ROLE_ADMIN" ? "Administrator" : "Teacher"}</p>
      <div className="container text-center">
        <div className="row">
          <div className="col">
            Register Student
          </div>
          <div className="col">
            Register Teacher
          </div>
          <div className="col">
            Register Course
          </div>
        </div>
        <div className="row">
          <div className="col">
            Register Subject
          </div>
          <div className="col">
            Enroll student
          </div>
          <div className="col">
            Reports
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
