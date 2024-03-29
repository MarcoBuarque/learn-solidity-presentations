// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 public sum;
    uint256 public product;
    string text;

    constructor(uint256 x, uint256 y) {
        (sum, product) = math(x, y);

        console.log("ler texto 1: ", lerTexto());
        console.log(guardarTexto("xpto"));
        console.log(lerTexto());
        // console.log(guardarTextoOnly(a));
        // console.log(lerTexto());
    }

    function math(uint256 x, uint256 y) private pure returns (uint256, uint256) {
        return (x + y, x * y);
    }

    
    function lerTexto()  public view returns(string memory) { // apenas no caso de string precisamos colocar explicitamente que é do tipo memory, para int/uint/bool não precisa 
        return text;
    }

    function guardarTexto(string memory _text) public returns(string memory){
        text = _text;
        _text = "dummy text";
        return _text;
    }

    function guardarTextoOnly(string calldata _text) public returns(string calldata){
        text = _text;
        // uint storage qualquerNum = 10; // storage faz com que armazene no storage
        return _text;
    }
}
