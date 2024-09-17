'use client';
import Container from "react-bootstrap/Container";
import {Col, Row} from "react-bootstrap";

const Footer = () => {
    return (
        // add footer
        <footer className="bg-body-tertiary">
            <Container className="py-5 text-center">
                <Row>
                    <Col>
                        <p className="text-center text-muted">
                            © 2024 Copyright:
                            <a href="https://facture-app.vercel.app/" className="text-muted m-2">
                                 Facture App Bentouhami Faisal
                            </a>
                        </p>
                    </Col>
                </Row>
            </Container>
        </footer>
    )
}
export default Footer
