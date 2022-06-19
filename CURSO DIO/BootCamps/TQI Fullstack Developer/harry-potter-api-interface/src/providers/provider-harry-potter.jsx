/* eslint-disable react-hooks/exhaustive-deps */
import React from "react";
import api from "../services/api";

const ContextHarryPotter = React.createContext({
  listStudent: [
    {
      name: undefined,
      house: undefined,
      image: undefined,
    },
  ],
  listStaff: [
    {
      name: undefined,
      house: undefined,
      image: undefined,
    },
  ],
  person: [
    {
      name: undefined,
      species: undefined,
      gender: undefined,
      house: undefined,
      dataOfBirth: undefined,
      ancestry: undefined,
      hogwartsStudent: undefined,
      hogwartsStaff: undefined,
      image: undefined,
    },
  ],
  singlePerson: {
    name: undefined,
    species: undefined,
    gender: undefined,
    dataOfBirth: undefined,
    ancestry: undefined,
    image: undefined,
  },
});

const ProviderHarryPotter = ({ children }) => {
  const [repository, setRepository] = React.useState({
    listStudent: [],
    listStaff: [],
    person: [],
    singlePerson: {},
  });
  let { person, listStudent, listStaff, singlePerson } = repository;
  const getPerson = (name) => {
    
    const newPerson = repository.person.filter(
      (newPerson) => newPerson.name === name
    );
    setRepository({
      ...repository,
      singlePerson: newPerson[0],
    });

  };
  React.useEffect(() => {
    api
      .get("/")
      .then(({ data }) => {
        const newListStudent = data.filter(
          (newPerson) => newPerson.hogwartsStudent === true
        );
        const newListStaff = data.filter(
          (newPerson) => newPerson.hogwartsStaff === true
        );
        const newPerson = newListStaff.concat(newListStudent);
        setRepository({
          ...repository,
          person: [...newPerson],
          listStudent: [...newListStudent],
          listStaff: [...newListStaff],
          singlePerson: newListStudent[0],
        });
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

  const contextValue = {
    person,
    listStudent,
    listStaff,
    singlePerson,
    getPerson: (name) => getPerson(name),
  };

  return (
    <ContextHarryPotter.Provider value={contextValue}>
      {children}
    </ContextHarryPotter.Provider>
  );
};

export { ContextHarryPotter, ProviderHarryPotter };
