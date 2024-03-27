// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract ConstructorPayable {
    address deployer;
    error NotDeployer(address); 
    uint256 public errorsCount = 0;

    constructor(address b) payable {
        require(msg.value >= 1 ether, "value less than minimun");

        // deployer = msg.sender;
        deployer = b;
    }

    function withdraw(string memory str) external {
            console.log("deployer", deployer);
            console.log("msg.sender", msg.sender);
       
        if (msg.sender == deployer || compareStrings(str)){
            address contractAddress = address(this);
            console.log("contractAddress", contractAddress);
            deployer.call{value: contractAddress.balance}("");
            return;
        }

        errorsCount += 1;
        revert NotDeployer(msg.sender);
    }

    function compareStrings(string memory str1) internal pure returns (bool) {
    return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked("xpto"));
}
}