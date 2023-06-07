import { Routes, Route } from "react-router-dom";
import CreateDoctor from "./components/CreateDoctor";

import "./App.css";
import Home from "./pages/Home";
import Connexion from "./pages/Connexion";

function App() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="/patient" element={<Connexion utilisateur="patients" />} />
      <Route path="/doctor" element={<Connexion utilisateur="doctors" />} />
      <Route path="/create-doctor" element={<CreateDoctor />} />
    </Routes>
  );
}

export default App;
