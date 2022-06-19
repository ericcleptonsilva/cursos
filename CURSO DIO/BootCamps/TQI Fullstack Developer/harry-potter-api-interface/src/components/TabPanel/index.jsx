import React from 'react';
import Item  from '../Item';
import  useRepositoryHarryPotter  from "../../hooks/harry-potter-hook";

import * as Styled from './styles';

const TabPanel = () =>{
  const { listStaff, listStudent, getPerson } = useRepositoryHarryPotter();
  
  const ListData = (value) =>{ 
   const handleClick = (name) => {
    getPerson(name);
   }
      if(value === "Staff"){
        return (
          <>
          {listStaff.map((item, i) => {           
            return (             
            <Styled.Button onClick={() => handleClick(item.name)}>
            <Item key={i} house={item.house} avatar={item.image} name={item.name} /> 
            </Styled.Button>            
            )
          })}
        </>
      )    
        }
        return (
          <>
          {listStudent.map((item, i) => {           
            return (
              <Styled.Button onClick={() => handleClick(item.name)}>
              <Item key={i} house={item.house} avatar={item.image} name={item.name}/>
              </Styled.Button>   
            )
          })}
        </>
      )    
  }

  return (
    <Styled.WrapperTabs
        selectedTabClassName='selected'
        selectedTabPanelClassName='selected'
    >
    <Styled.WrapperTabList>
        <Styled.WrapperTab>Student</Styled.WrapperTab>
        <Styled.WrapperTab>Staff</Styled.WrapperTab>
    </Styled.WrapperTabList>
    <Styled.WrapperTabPanel>
   <Styled.WrapperList>
   {ListData("Student")}
   </Styled.WrapperList>
    </Styled.WrapperTabPanel>
    <Styled.WrapperTabPanel> 
   <Styled.WrapperList>
    {ListData("Staff")}
   </Styled.WrapperList>
    </Styled.WrapperTabPanel>
    </Styled.WrapperTabs>
  );
}
export default TabPanel;

