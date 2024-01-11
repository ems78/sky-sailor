import { useState } from "react";
import axios from "axios";

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
      <div>
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
      <div>
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
      <div>
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
      <div>
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
      <div>
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
      <div>
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
      <div>
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
      <button type="submit">New Flight</button>
    </form>
  );
}

export default InsertFlight;
