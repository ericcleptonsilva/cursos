import React from "react";
import { ContextHarryPotter  } from "../providers/provider-harry-potter";

const useRepositoryHarryPotter = () => {

    const {person, listStaff, listStudent, singlePerson, getPerson} = React.useContext(ContextHarryPotter);
    return {person, listStaff, listStudent, singlePerson,getPerson};
}

export default useRepositoryHarryPotter;