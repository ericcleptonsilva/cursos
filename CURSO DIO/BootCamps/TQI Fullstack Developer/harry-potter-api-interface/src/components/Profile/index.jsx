/* eslint-disable no-unused-vars */
import React from "react";
import  Card  from "../Card";
import * as Styled from "./styles";
import  useRepositoryHarryPotter  from "../../hooks/harry-potter-hook";

const Profile = () => {
 
  const {  singlePerson} = useRepositoryHarryPotter();
 
  const isData = singlePerson !== undefined ? true : false;
    return (
      <Styled.Wrapper>
        {isData === true  && (<>
          <Card  house={singlePerson.house} avatar={singlePerson.image}/>
        <Styled.WrapperColumn>
        <Styled.Title>{singlePerson.name}</Styled.Title>
        <Styled.Text>Species: {singlePerson.species} </Styled.Text>
        <Styled.Text> Gender: {singlePerson.gender}</Styled.Text>
        <Styled.Text> House: {singlePerson.house}</Styled.Text>
        <Styled.Text> Date Of Birth: {singlePerson.dateOfBirth}</Styled.Text>
        <Styled.Text>Ancestry: {singlePerson.ancestry}</Styled.Text>
        </Styled.WrapperColumn> 
        </>)}
      </Styled.Wrapper>
    );
}

export default Profile;