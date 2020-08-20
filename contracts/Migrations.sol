// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract PokeCatcher {
  mapping(string => Owned) public ownership;
  //Variables
  struct Owned {
    address owner;
    bool owned;
  }
   //constructor
  constructor() public {}
 //metodos
 /* function <nombre> (<parametros>) <visibilidad> <tipo de retorno> */

 //capturar
  function capture(string memory pokemonName) public returns (string memory) {
    require(!ownership[pokemonName].owned); 

    ownership[pokemonName].owner = msg.sender;
    ownership[pokemonName].owned = true;

    return pokemonName;
  }
   //Verificar si ya ha sido capturado
  function isOwned(string memory pokemonName) public view returns (bool) {
    return ownership[pokemonName].owned;
  }
  //Obtener Dueño
  function getOwner(string memory pokemonName) public view returns (address) {
    return ownership[pokemonName].owner;
  }
}