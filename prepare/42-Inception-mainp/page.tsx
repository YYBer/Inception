import React from 'react';

const Snorlax: React.FC = () => {
  const centeredContainerStyle = {
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    height: '100vh',
  };

  return (
    <div style={centeredContainerStyle}>
      <img src="/ZAbj.gif" alt="Snorlax" />
    </div>
  );
};

export default Snorlax;
