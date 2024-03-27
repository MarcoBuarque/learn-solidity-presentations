// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract ConstructorPayable {
    address deployer;
    error NotDeployer(address); 
    uint256 public errorsCount = 0;

    constructor() payable {
        require(msg.value >= 1 ether, "value less than minimun");

        deployer = msg.sender;
    }

    function withdraw() external {
        if (msg.sender != deployer) {
            errorsCount += 1;
            revert NotDeployer(msg.sender);
        }

        address contractAddress = address(this);
        contractAddress.call{value: contractAddress.balance}("");
    }
}