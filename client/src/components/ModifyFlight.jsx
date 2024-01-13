import { useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";

function ChangeFlight() {
  const [changeflightData, setChangeFlightFata] = useState({
    id: "",
  });

  const changeFlight = (event) => {
    event.preventDefault();
    console.log(changeflightData);
  };

  const handleUpdate = () => {
    console.log("Ažuriraj let");
  };

  const handleDelete = () => {
    const confirmDelete = window.confirm(
      "Jesi li siguran/na da želiš izbrisati let?"
    );

    if (confirmDelete) {
      console.log("Izbriši let");
    } else {
      console.log("Brisanje otkazano");
    }
  };

  function changeEntry(event) {
    const { name, value } = event.target;
    setChangeFlightFata({ ...changeflightData, [name]: value });
  }

  return (
    <form onSubmit={changeFlight}>
      <div className="planeid">
        <label>
          ID:
          <input
            type="number"
            name="id"
            value={changeflightData.id}
            onChange={changeEntry}
            required
          />
        </label>
      </div>
      <div className="buttons">
        <button type="button" onClick={handleUpdate} className="btnupdate">
          Ažuriraj let
        </button>
        <button type="button" onClick={handleDelete} className="btndelete">
          Izbriši let
        </button>
      </div>
    </form>
  );
}

export default ChangeFlight;
