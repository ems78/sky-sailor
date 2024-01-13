import { useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";

function InsertFlight() {
  const [flightData, setflightData] = useState({
    departureTown: "",
    arrivalTown: "",
    departureDate: "",
    arrivalDate: "",
    plane: "",
    extraBaggage: "",
    flightInsurance: "",
  });

  const sendFlight = (event) => {
    event.preventDefault();
    console.log(flightData);
  };

  function changeEntry(event) {
    const { name, value } = event.target;
    setflightData({ ...flightData, [name]: value });
  }

  return (
    <form onSubmit={sendFlight}>
      <div className="planedata">
        <label>
          Mjesto polijetanja:
          <input
            type="text"
            name="departureTown"
            value={flightData.departureTown}
            onChange={changeEntry}
            required
          />
        </label>
      </div>
      <div className="planedata">
        <label>
          Mjesto slijetanja:
          <input
            type="text"
            name="arrivalTown"
            value={flightData.arrivalTown}
            onChange={changeEntry}
            required
          />
        </label>
      </div>
      <div className="planedata">
        <label>
          Vrijeme odlaska:
          <input
            type="date"
            name="departureDate"
            value={flightData.departureDate}
            onChange={changeEntry}
            required
          />
        </label>
      </div>
      <div className="planedata">
        <label>
          Vrijeme dolaska:
          <input
            type="date"
            name="arrivalDate"
            value={flightData.arrivalDate}
            onChange={changeEntry}
            required
          />
        </label>
      </div>
      <div className="planedata">
        <label>
          Avion:
          <input
            type="text"
            name="plane"
            value={flightData.plane}
            onChange={changeEntry}
            required
          />
        </label>
      </div>
      <div className="planedata">
        <label>
          Cijena prtljage:
          <input
            type="number"
            name="extraBaggage"
            value={flightData.extraBaggage}
            onChange={changeEntry}
          />
        </label>
      </div>
      <div className="planedata">
        <label>
          Cijena osiguranja leta:
          <input
            type="number"
            name="flightInsurance"
            value={flightData.flightInsurance}
            onChange={changeEntry}
          />
        </label>
      </div>
      <button className="botun" type="submit">
        Dodaj let
      </button>
    </form>
  );
}

export default InsertFlight;
