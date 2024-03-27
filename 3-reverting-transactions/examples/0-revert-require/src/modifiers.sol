// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Modifier {

    function logMessage() public view logModifier {
        console.log("during");
    }

    modifier logModifier {
        console.log("before"); // fazer algo antes de chamar o logMessage
        _; //  chamando logMessage  (posso pegar o retorno?)
        console.log("after"); // fazer algo depois do logMessage
    }
}

// Um bom exemplo, realizar a validação de usuário antes de chamar determinadas funções 
// (seria um middleware de autenticação)
contract Contract {
	uint configA;
	uint configB;
	uint configC;
	address owner;

	constructor() {
		owner = msg.sender;
	}

	function setA(uint _configA) public onlyOwner {
		configA = _configA;
	}

	function setB(uint _configB) public onlyOwner {
		configB = _configB;
	}

	function setC(uint _configC) public onlyOwner {
		configC = _configC;
	}

	modifier onlyOwner {
		require(msg.sender == owner, "invalid address");

		_;
	}
}
