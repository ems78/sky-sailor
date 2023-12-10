import React from "react";
import { Container, Row, Col } from "react-bootstrap";
import SearchForm from "./components/SearchForm";
import AuthButtons from "./components/AuthButtons";
import CompanyLogo from "./components/CompanyLogo";
import "bootstrap/dist/css/bootstrap.min.css";

const App = () => {
  return (
    <Container>
      <Row className="mt-2">
        <Col className="text-right">
          <AuthButtons />
        </Col>
      </Row>

      <Row className="mb-4">
        <Col>
          <CompanyLogo />
        </Col>
      </Row>

      <Row className="justify-content-md-center mt-4">
        <Col md={8}>
          <SearchForm />
        </Col>
      </Row>
    </Container>
  );
};

export default App;
