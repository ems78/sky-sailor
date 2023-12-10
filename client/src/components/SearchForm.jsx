import React from "react";
import { Form, Button, Row, Col } from "react-bootstrap";

const SearchForm = () => {
  return (
    <Form className="mt-4 border p-4">
      <Form.Group controlId="formDepartureCity">
        <Form.Label>Mjesto polijetanja</Form.Label>
        <Form.Control type="text" placeholder="Unesite mjesto polijetanja" />
      </Form.Group>

      <Form.Group controlId="formDestinationCity">
        <Form.Label>Mjesto slijetanja</Form.Label>
        <Form.Control type="text" placeholder="Unesite mjesto slijetanja" />
      </Form.Group>

      <Form.Group controlId="formDepartureDate">
        <Form.Label>Datum polijetanja</Form.Label>
        <Form.Control type="date" />
      </Form.Group>

      <Row className="justify-content-center">
        <Col xs="auto" className="mt-3">
          <Button variant="primary" type="submit">
            Pretraži letove
          </Button>
        </Col>
      </Row>
    </Form>
  );
};

export default SearchForm;
