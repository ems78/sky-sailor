import { Container } from 'react-bootstrap';
import PropTypes from 'prop-types';

const CompanyLogo = ({ children }) => {
  return (
    <Container fluid style={{
      height: '100vh', 
      padding: 0, 
      background: `url('images/company-logo.png') center / cover no-repeat`, 
      opacity: 0.5, 
      zIndex: -1, 
      position: 'fixed', 
      top: 0,
      left: 0,
      width: '100%', 
    }}>
      <div style={{
        height: '100%',
        backgroundColor: 'rgba(255, 255, 255, 0.5)', 
        zIndex: 1, 
      }}>
        {children} 
      </div>
    </Container>
  );
};

CompanyLogo.propTypes = {
  children: PropTypes.node,
};

export default CompanyLogo;
