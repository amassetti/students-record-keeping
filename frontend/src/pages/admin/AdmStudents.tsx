import { useEffect, useState } from "react";
import { useAuth } from "../../context/AuthContext";
import studentService, { Student } from "../../services/studentService";
import { CanceledError } from "../../services/apiClient";

const AdmStudents = () => {
  const { user } = useAuth();
  const [ students, setStudents ] = useState<Student[]>([]);
  const [ error, setError ] = useState('');
  const [ isLoading, setLoading ] = useState(false);

  useEffect( () => {
    setLoading(true);
    const {request, cancel} = studentService.getStudents("filter");
    request
      .then( res => {
        setStudents(res.data);
        setLoading(false);
      })
      .catch( err => {
        if (err instanceof CanceledError) return;
        setError(err.message);
        setLoading(false);
      });

    // cleanup fn
    return () => cancel();

  }, []);

  const handleSubmit = () => {
    console.log("Handling form submission");
  }

  return (
    <div>
      <h2>AdmStudents</h2>
      <p>Welcome, {user?.username}!</p>
      {error && <p className="text-danger">{error}</p>}
      <nav className="navbar bg-body-tertiary">
        <div className="container-fluid">
          <form className="d-flex" role="search">
            <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
            <button className="btn btn-outline-success" onClick={handleSubmit}>Search</button>
          </form>
        </div>
      </nav>

      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">PPSN</th>
            <th scope="col">Course</th>
          </tr>
        </thead>
        <tbody>
          { students.map( (student, index) => 
          <tr key={`tr-${index}`}>
            <th scope="row">{student.id}</th>
            <td>{`${student.last_name}, ${student.first_name}`}</td>
            <td>{student.email}</td>
            <td>{student.ppsn}</td>
            <td>{student.course_code}</td>
          </tr>
          ) }
        </tbody>
      </table>
    </div>
  );
};

export default AdmStudents;
