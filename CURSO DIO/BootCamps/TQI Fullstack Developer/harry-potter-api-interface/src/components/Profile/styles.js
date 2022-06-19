import styled from "styled-components";


export const Wrapper = styled.div`
    display: flex;
    align-items: center;
   
    margin: 10px;
    padding: 20px;
`;

 export const WrapperColumn = styled(Wrapper)`
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    
 `;
export const Title = styled.h1`
    font-family: 'Harry P', sans-serif;
    font-size: 45px;
    letter-spacing: 0.3px;
    margin-bottom: 10px;
`;

export const Text = styled(Title)`
    font-size: 25px;
`;


