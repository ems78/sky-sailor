import { useEffect, useState } from "react";
import axios from "axios";
import { Container } from "react-bootstrap";
import { useNavigate } from "react-router-dom";

const AccountForm = () => {
  const [accountData, setAccountData] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const [phoneNumber, setPhoneNumber] = useState("");
  const [isPhoneNumberValid, setIsPhoneNumberValid] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchAccountData = async () => {
      try {
        const token = localStorage.getItem("token");
        const response = await axios.get("http://localhost:8800/api/account", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        if (response.data.success) {
          setAccountData(response.data.data.account);
          setPhoneNumber(response.data.data.account.phoneNumber || "");
        } else {
          navigate("/login");
        }
      } catch (error) {
        console.error("Error fetching account data:", error);
        navigate("/login");
      } finally {
        setIsLoading(false);
      }
    };

    fetchAccountData();
  }, []);

  const handlePhoneNumberChange = (e) => {
    const value = e.target.value;
    const isValid = validatePhoneNumber(value);
    setIsPhoneNumberValid(isValid);
    setPhoneNumber(value);
  };

  const validatePhoneNumber = (phoneNumber) => {
    const phoneRegex = /^\+[1-9]\d{1,14}$/;
    return phoneRegex.test(phoneNumber);
  };

  const saveChanges = async () => {
    if (!isPhoneNumberValid) {
      return;
    }

    try {
      const token = localStorage.getItem("token");
      const response = await axios.post(
        "http://localhost:8800/api/update-phone-number",
        { phoneNumber },
        {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        }
      );

      if (!response.data.success) {
        console.error("Error saving account data:", response.data.error);
      }
    } catch (error) {
      console.error("Error saving account data:", error);
    }
  };

  const handleBackClick = () => {
    navigate("/");
  };

  return (
    <>
      <Container
        fluid
        style={{
          height: "100vh",
          padding: 0,
          background: `url('/images/background.png') center / cover no-repeat`,
          position: "fixed",
          top: 0,
          left: 0,
          width: "100%",
          zIndex: -1,
          opacity: 0.5,
        }}
      />

      <div
        style={{
          height: "100vh",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          zIndex: 1,
        }}>
        <div
          className="wrapper bg-light p-4"
          style={{ borderRadius: "15px", maxWidth: "600px" }}>
          <h4 className="pb-4 border-bottom">Informacije o računu</h4>
          {isLoading ? (
            <p>Učitavanje podataka o računu...</p>
          ) : accountData ? (
            <div>
              <div className="row py-2">
                <div className="col-md-6">
                  <label htmlFor="firstname">Ime</label>
                  <input
                    type="text"
                    className="bg-light form-control"
                    placeholder={accountData.firstName}
                    readOnly
                  />
                </div>
                <div className="col-md-6 pt-md-0 pt-3">
                  <label htmlFor="lastname">Prezime</label>
                  <input
                    type="text"
                    className="bg-light form-control"
                    placeholder={accountData.lastName}
                    readOnly
                  />
                </div>
              </div>
              <div className="row py-2">
                <div className="col-md-6">
                  <label htmlFor="email">Email</label>
                  <input
                    type="text"
                    className="bg-light form-control"
                    placeholder={accountData.email}
                    readOnly
                  />
                </div>
                <div className="col-md-6 pt-md-0 pt-3">
                  <label htmlFor="phone">Broj mobitela</label>
                  <input
                    type="tel"
                    className={`bg-light form-control ${
                      isPhoneNumberValid ? "" : "is-invalid"
                    }`}
                    placeholder="Enter your phone number"
                    value={phoneNumber}
                    onChange={handlePhoneNumberChange}
                  />
                  {!isPhoneNumberValid && (
                    <div className="invalid-feedback">
                      Unesite ispravan broj mobitela
                    </div>
                  )}
                </div>
              </div>
              <div className="py-3 pb-4">
                <button className="btn btn-primary mx-3" onClick={saveChanges}>
                  Spremi promjene
                </button>
                <button className="btn border button" onClick={handleBackClick}>
                  Povratak
                </button>
              </div>
            </div>
          ) : (
            <p>Error fetching account data</p>
          )}
        </div>
      </div>
    </>
  );
};

export default AccountForm;
