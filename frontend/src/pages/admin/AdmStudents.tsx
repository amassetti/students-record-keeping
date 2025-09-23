import { useEffect, useState } from "react";
import { useAuth } from "../../context/AuthContext";
import studentService, { Student } from "../../services/studentService";
import { CanceledError } from "../../services/apiClient";

const LIMIT = 10;

const AdmStudents = () => {
  const { user } = useAuth();
  const [ students, setStudents ] = useState<Student[]>([]);
  const [ page, setPage ] = useState(1);
  const [ totalPages, setTotalPages ] = useState(0);
  const [ error, setError ] = useState('');
  const [ isLoading, setLoading ] = useState(false);

  useEffect( () => {
    setLoading(true);
    const {request, cancel} = studentService.getStudents("filter", page, LIMIT);

    // TODO: get the new structure for paginated data
    request
      .then( res => {
        setStudents(res.data.data);
        setTotalPages(res.data.totalPages);
        setLoading(false);
      })
      .catch( err => {
        if (err instanceof CanceledError) return;
        setError(err.message);
        setLoading(false);
      });

    // cleanup fn
    return () => cancel();

  }, [page]);

  const handleSubmit = () => {
    console.log("Handling form submission");
  }

  const handleChangePage = (pageNumber: number) => {
    console.log(`Handling change page to ${pageNumber}. Current ${page}. Total pages: ${totalPages}`);
    if (pageNumber < 1) return;
    if (pageNumber > totalPages) return;

    setPage(pageNumber);
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

      <nav aria-label="Page navigation">
        <ul className="pagination">
          <li className="page-item"><a className="page-link" href="#" onClick={() => handleChangePage(page-1)}>Previous</a></li>
          <li className="page-item"><a className={ page === 1 ? "page-link active" : "page-link"} href="#" onClick={() => handleChangePage(1)}>1</a></li>
          <li className="page-item"><a className={ page === 2 ? "page-link active" : "page-link"} href="#" onClick={() => handleChangePage(2)}>2</a></li>
          <li className="page-item"><a className={ page === 3 ? "page-link active" : "page-link"} href="#" onClick={() => handleChangePage(3)}>3</a></li>
          <li className="page-item"><a className="page-link" href="#" onClick={() => handleChangePage(page+1)}>Next</a></li>
        </ul>
    </nav>

    </div>
  );
};

export default AdmStudents;
