import styled from "styled-components";

import { Tabs, TabList, Tab, TabPanel } from "react-tabs";

export const WrapperTabs = styled(Tabs)` 
    font-family: "Harry P", cursive;
    font-style: normal;
    font-size: 20px;
    font-weight: lighter;
    background-color: #F28705;
    margin-top: 20px;
`; 
export const WrapperTabList = styled(TabList)`   
    list-style-type: none;    
    display: flex;     
    justify-content: flex-start;
    align-self: flex-start; 
   
`; 
WrapperTabList.taRole = "TabList";

export const WrapperTab = styled(Tab)`
    user-select: none;
    cursor: pointer;
    width: 191px;
    height: 54px;
    font-size: 25px;    
    background-color: #FFFCFC;
    color: #8C520B;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 999999;
    box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
    &:focus{
        box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 2px, rgba(0, 0, 0, 0.3) 0px 1px 1px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;
        outline: none;
        background-color: #F28705;
    }
    &.selected{
        background-color: #8C520B;
        color: #FFFCFC;
    }
`; 

WrapperTabList.taRole = "Tab";

export const WrapperTabPanel = styled(TabPanel)`
    display: none;
    margin: 20px;
    min-width: 100vw;
    min-height: 100vh;
    padding: 8px;
    margin-top: 5px;
    &.selected{
        display: block;
    }
`;
WrapperTabList.taRole = "TabPanel"; 

export const WrapperList = styled.div`
    display: flex;
    justify-content: left;
    flex-wrap: wrap;
`;
export const Button = styled.button`
    opacity: 1;
    border: none;
    background-color: transparent;
    font-family: "Harry P", cursive;
    &:active{
        opacity: 0.7;
        transition: opacity 0.2s cubic-bezier(0.075, 0.82, 0.165, 1) ;
    }
`;