import React from "react";
import * as Styled from "./styles";
import gryffindor from '../../assets/img/gryffindor.png'
import hufflepuff from '../../assets/img/hufflepuff.png'
import ravenclaw from '../../assets/img/ravenclaw.png'
import stytherin from '../../assets/img/stytherin.png'
import arebesco from "../../assets/img/arebesco.png";
import brasao from "../../assets/img/brasao.webp";

const Card = ({ name, avatar, top, left, house }) => {
  const [houseImg, setHouseImg] = React.useState(null);

React.useEffect(() => {
  const isImage = avatar === "" ? house : avatar;

  switch(isImage){
    case 'Gryffindor':
       setHouseImg(gryffindor);
        break;
    case 'Hufflepuff':
      setHouseImg(hufflepuff);
      break;
    case 'Ravenclaw':
      setHouseImg(ravenclaw);
      break;
    case 'Stytherin':
      setHouseImg(stytherin);
      break;
      default:
      setHouseImg(avatar);
        break;
  }
}, [avatar, house]);

  return (
    <Styled.Wrapper top={top} left={left}>
      <Styled.Card>
        <Styled.Image src={arebesco} />
        <Styled.Avatar src={houseImg || brasao } name={name} />
        {name && <Styled.Text>{name}</Styled.Text>}
      </Styled.Card>
    </Styled.Wrapper>
  );
};
export default Card;