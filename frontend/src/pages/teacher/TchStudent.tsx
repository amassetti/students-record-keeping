import { useAuth } from "../../context/AuthContext";

const TchStudents = () => {
  const { user } = useAuth();

  return (
    <div>
      <h2>TchStudents</h2>
      <p>Welcome, {user?.username}!</p>
    </div>
  );
};

export default TchStudents;
