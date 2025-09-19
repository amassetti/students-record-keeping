import { useAuth } from "../../context/AuthContext";

const TchReports = () => {
  const { user } = useAuth();

  return (
    <div>
      <h2>TchReports</h2>
      <p>Welcome, {user?.username}!</p>
    </div>
  );
};

export default TchReports;
