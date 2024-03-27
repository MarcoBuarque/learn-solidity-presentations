// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract Ownable {
    address owner = msg.sender;

    // virtual é a palavra chave que determina que essa função pode ser sobreescrita (override) no contrato filho
    function transferOwner(address newOwner) public virtual onlyOwner {
        owner = newOwner;
    }

    error NotTheOwner();

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert NotTheOwner();
        }
        _;
    }
}
