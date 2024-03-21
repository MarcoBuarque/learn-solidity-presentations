// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {

 /* ************************** Storage Variables **************************** */   
// São variáveis globais que todo o contrato tem acesso para leitura e, se o contrato permitir, de escrita. 
// Quando declaramos essas variaveis com o public, uma função getter será gerada para que EOA ou outros contratos que interajam com o contrato Exemplo, possam ler essa variável
    uint8 public a = 255; // 0 -> 255
    uint256 b = 22; // alias: uint

    int8 c = 127; // -128 -> 127
    int256 d = -55; // alias: int

    uint constant e = 55; // const example
    
    // int f = type(uint32).max; // isso daqui dá erro pois não é possível converter implicitamente os tipos Type uint32 is not implicitly convertible to expected type int256.
    uint f = type(uint32).max;

    bool myCondition = false;


    enum Choice {
        Up,
        Down,
        Left,
        Right
    }

    // Choice choice = Choice.Up;
 /* ************************** Storage Variables **************************** */   

    constructor(Choice choice) {
        // a += 1; // conseguiremos compilar, mas na hora do deploy dará erro, pois 256 não está no range de a

        console.log(a);

        unchecked {
            a += 1; // com o uncheck conseguimos gerar um overflow e a variável volta a 0   1111 1111 -> 1 0000 0000 (como temos apenas 8 bits para armazenar os dados, armazenaremos 0000 0000)
        }

        console.log(a);

        a += 2; 
        console.log(a);

        console.log(f);
        console.logBytes32(bytes32(f));

        uint32 f = type(uint32).max;
        console.logBytes4(bytes4(f));

        if (!myCondition) {
            console.log("yaaay");
        }

        if (choice == Choice.Up) {
            console.log("up");
        } else {
            console.log("wrong choice");
        }


        // uint8 q = 69;
        // uint16 w = type(uint16).max;
        // console.log(w);

        // uint256 sum = uint16(q) + w;
        // console.log(sum);
        
    }

}
