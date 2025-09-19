import { useAuth } from "../../context/AuthContext";

const AdmStudents = () => {
  const { user } = useAuth();

  return (
    <div>
      <h2>AdmStudents</h2>
      <p>Welcome, {user?.username}!</p>
    </div>
  );
};

export default AdmStudents;
