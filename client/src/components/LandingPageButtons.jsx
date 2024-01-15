import { Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";

const LandingPageButtons = () => {
  return (
    <div style={{display: "flex", gap: "1em", margin: "10px"}}>
      <Link to="/login">
        <button className="btn btn-primary mr-2">Prijava</button>
      </Link>
      <Link to="/registration">
        <button className="btn btn-success mr-2">Registracija</button>
      </Link>
      <Link to="/account">
        <button className="btn btn-success mr-2">Račun</button>
      </Link>
    </div>
  );
};

export default LandingPageButtons;
