// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    uint256 public sum;
    address b;

    constructor(address _b) {
        b = _b;

      
        (bool success, bytes memory returnData) = _b.call(hex"771602f70000000000000000000000000000000000000000000000000000000000000009000000000000000000000000000000000000000000000000000000000000000a");
        
        console.log(success);
        require(success);

        // passando 9  0000000000000000000000000000000000000000000000000000000000000009 e 10 
        sum = abi.decode(returnData, (uint)); 
        console.log(sum);

        // sum = iB(b).add(15, 10, 25);
        // console.log(sum);
    }
}

interface iB {
    function add(uint256, uint256, uint256) external pure returns (uint256);
}

contract B {
    fallback() external {
        console.logBytes4(msg.sig);
        console.logBytes(msg.data);
    }

    function add(uint256 x, uint256 y) external pure returns (uint256) {
        return x + y;
    }
}
