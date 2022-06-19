import   Header from '../Header'
import * as Styled from "./styles";



const Layout = ({ children }) => {
  return (
    <Styled.Wrapper>
      <Header />
      {children}
    </Styled.Wrapper>
  );
};

export default Layout;