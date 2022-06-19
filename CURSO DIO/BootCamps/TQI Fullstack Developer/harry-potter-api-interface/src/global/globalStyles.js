import { createGlobalStyle } from 'styled-components';
import HerryPotterFonts from '../assets/harry_p/HARRYP__.TTF';
const GlobalStyle = createGlobalStyle`
  body {
    background-color: #F2D5A0;
  }
  @font-face {
    font-family: 'Harry P';
    letter-spacing: 20.5px;
    src: url(${HerryPotterFonts}) format('ttf');

  }
`;
 export default GlobalStyle;