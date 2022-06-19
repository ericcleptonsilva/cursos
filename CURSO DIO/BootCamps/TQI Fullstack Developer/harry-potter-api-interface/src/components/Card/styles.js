import styled from "styled-components";

export const Wrapper = styled.div`
  top: ${(props) => props.top};
  left: ${(props) => props.left};
`;
export const Card = styled.div`
  width: 208px;
  height: 279px;
  background-color: #ffbf49;
  border-radius: 15px;
  border: 7px solid #4c0405;
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px,
    rgba(0, 0, 0, 0.3) 0px 7px 10px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
  z-index: 2;
`;
export const Image = styled.img`
  z-index: 5;
`;
export const Avatar = styled.img`
  width: ${({ name }) => (name === undefined ? "85%" : "75%")};
  height: ${({ name }) => (name === undefined ? "85%" : "75%")};
  position: absolute;
  top: ${({ name }) => (name === undefined ? "20px" : "25px")};
`;
export const Text = styled.h1`
  position: absolute;
  top: 235px;
  font-size: 20px;
`;


