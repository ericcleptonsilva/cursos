import React from "react";
import Card from "../Card";

import * as Styled from "./styles";

const Item = ({ house, avatar, id, name,}) => {
  return (
    <Styled.Wrapper key={id}>   
      <Card house={house} avatar={avatar} name={name} />   
    </Styled.Wrapper>
  );
};

export default Item;
