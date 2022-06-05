import { createGlobalStyle } from 'styled-components';
 
export const GlobalStyle = createGlobalStyle`
  body {
    margin: 0;
    padding: 0;
    background: teal;
    font-family: Open-Sans, Helvetica, Sans-Serif;
  }
  @font-face {
    font-family: 'OurFont';
    src: url('/resources/fonts/OurFont-Bold.woff2') format('woff2');
    font-weight: bold;
    font-style: normal;
  }
`;
 