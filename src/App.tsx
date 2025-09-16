import { Routes, Route, Link } from 'react-router-dom'
import Home from './pages/Home'
import Login from './pages/Login'

function App() {
  return (
    <div className="container">
      <nav className="my-3">
        <Link to="/" className="btn btn-outline-primary me-2">Home</Link>
        <Link to="/login" className="btn btn-outline-secondary">Login</Link>
      </nav>

      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
      </Routes>
    </div>
  )
}

export default App
