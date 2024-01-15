import { useState } from "react";
import { useNavigate } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import axios from "axios";

const SearchForm = () => {
  const [departureTown, setDepartureTown] = useState("");
  const [destinationTown, setDestinationTown] = useState("");
  const [departureDate, setDepartureDate] = useState("");
  const [townSearchResults, setTownSearchResults] = useState([]);
  const [showDropdown, setShowDropdown] = useState(false);
  const [activeInput, setActiveInput] = useState(null);
  const [formError, setFormError] = useState("");
  const navigate = useNavigate();

  const debounce = (func, delay) => {
    let inDebounce;
    return function () {
      const context = this;
      const args = arguments;
      clearTimeout(inDebounce);
      inDebounce = setTimeout(() => func.apply(context, args), delay);
    };
  };

  const searchTowns = async (townName) => {
    const response = await fetch(
      `http://localhost:8800/api/towns?query=${townName}`
    );
    const data = await response.json();
    if (data.status === "success") {
      setTownSearchResults(data.data.towns);
      setShowDropdown(true);
    }
  };

  const debouncedSearchTowns = debounce(searchTowns, 300);

  const handleTownInputChange = (e, setTown, inputType) => {
    setTown(e.target.value);
    debouncedSearchTowns(e.target.value);
    setActiveInput(inputType);
  };

  const handleInputFocus = (inputType) => {
    setActiveInput(inputType);
  };

  const selectTown = (townName, setTown) => {
    setTown(townName);
    setShowDropdown(false);
    setActiveInput(null);
  };

  const getTownIdByName = async (townName) => {
    try {
      const response = await fetch(
        `http://localhost:8800/api/towns?query=${townName}`
      );
      const data = await response.json();
      if (data.status === "success" && data.results > 0) {
        return data.data.towns[0].town_ID;
      } else {
        return null;
      }
    } catch (error) {
      console.error("Error fetching town ID:", error);
      return null;
    }
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    setFormError("");

    const departureTownId = await getTownIdByName(departureTown);
    const destinationTownId = await getTownIdByName(destinationTown);

    if (!departureTownId) {
      setFormError("Mjesto polijetanja nije pronađeno.");
      return;
    }

    if (!destinationTownId) {
      setFormError("Mjesto slijetanja nije pronađeno.");
      return;
    }

    const departureDateParts = departureDate.split("-");
    const departureDateTime = new Date(
      departureDateParts[0],
      departureDateParts[1] - 1,
      departureDateParts[2]
    );

    const currentDate = new Date();
    currentDate.setHours(0, 0, 0, 0); // Postavljamo sate, minute, sekunde i milisekunde na nulu

    if (departureDateTime < currentDate) {
      setFormError("Datum polijetanja ne može biti u prošlosti.");
      return;
    }

    const response = await axios.get(`http://localhost:8800/api/search`, {
      params: {
        departureTownId: departureTownId,
        destinationTownId: destinationTownId,
        departureDate: departureDate,
      },
    });

    const data = response.data;
    if (data.status === "success") {
      navigate("/search-results", {
        state: { flights: data.data.flights },
      });
    } else {
      console.error("Search failed", data);
    }
  };

  return (
    <div className="container mt-3" style={{ maxWidth: "40%" }}>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <label htmlFor="departureTown" className="form-label">
            Mjesto polijetanja:
          </label>
          <input
            type="text"
            className="form-control"
            id="departureTown"
            placeholder="Mjesto polijetanja"
            value={departureTown}
            onChange={(e) =>
              handleTownInputChange(e, setDepartureTown, "departure")
            }
            onFocus={() => handleInputFocus("departure")}
            required
          />
          {showDropdown && activeInput === "departure" && (
            <div className="dropdown-menu show">
              {townSearchResults.map((town) => (
                <a
                  className="dropdown-item"
                  key={town.town_ID}
                  onClick={() => selectTown(town.name, setDepartureTown)}>
                  {town.name}
                </a>
              ))}
            </div>
          )}
        </div>

        <div className="mb-3">
          <label htmlFor="destinationTown" className="form-label">
            Mjesto slijetanja:
          </label>
          <input
            type="text"
            className="form-control"
            id="destinationTown"
            placeholder="Mjesto slijetanja"
            value={destinationTown}
            onChange={(e) =>
              handleTownInputChange(e, setDestinationTown, "destination")
            }
            onFocus={() => handleInputFocus("destination")}
            required
          />
          {showDropdown && activeInput === "destination" && (
            <div className="dropdown-menu show">
              {townSearchResults.map((town) => (
                <a
                  className="dropdown-item"
                  key={town.town_ID}
                  onClick={() => selectTown(town.name, setDestinationTown)}>
                  {town.name}
                </a>
              ))}
            </div>
          )}
        </div>

        <div className="mb-3">
          <label htmlFor="departureDate" className="form-label">
            Datum polijetanja:
          </label>
          <input
            type="date"
            className="form-control"
            id="departureDate"
            placeholder="Datum polijetanja"
            value={departureDate}
            onChange={(e) => setDepartureDate(e.target.value)}
            required
          />
        </div>
        <p className="text-danger font-weight-bold">{formError}</p>

        <button type="submit" className="btn btn-primary">
          Pretraži letove
        </button>
      </form>
    </div>
  );
};

export default SearchForm;
