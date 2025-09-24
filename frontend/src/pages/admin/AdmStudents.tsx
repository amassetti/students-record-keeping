import { useEffect, useState } from "react";
import { useAuth } from "../../context/AuthContext";
import studentService, { Student } from "../../services/studentService";
import { CanceledError } from "../../services/apiClient";
import TablePagination from "../../components/TablePagination";
import Spinner from "../../components/Spinner";
import SmallButton, { ButtonType } from "../../components/SmallButton";

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

  const handleDelete = (studentId: number) => {
    // TODO: implement
    console.log(`Deleting student ${studentId}`);
  }

  const handleEdit = (studentId: number) => {
    // TODO: implement
    console.log(`Editing student ${studentId}`);
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

      <Spinner isLoading={isLoading} />

      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">PPSN</th>
            <th scope="col">Course</th>
            <th scope="col">Actions</th>
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
            <td>
              <SmallButton btnType={ButtonType.BLUE} text="E" title={`Edit ${student.first_name}`} enabled={true} onClick={() => handleEdit(student.id)}/>
              <SmallButton btnType={ButtonType.RED} text="X" title={`Delete ${student.first_name}`} enabled={(student.course_code) ? false : true} onClick={() => handleDelete(student.id)}/>
            </td>
          </tr>
          ) }
        </tbody>
      </table>

      <TablePagination page={page} totalPages={totalPages} handleChangePage={handleChangePage}/>

    </div>
  );
};

export default AdmStudents;
