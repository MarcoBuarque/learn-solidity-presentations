// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    uint256 constant a = 55; // não fica no storage slot, fica salvo no contrato como bytecode
    uint256 b = 10; // storage slot - 0x0
    bool c; // storage slot - 0x1

    constructor() {
        // SSTORE - store to some storage location
        // SLOAD - read from some storage location
        bool x;
        assembly {
            x := sload(0x0) // 10 será convertido implicitamente para true
            // x := sload(0x2)
        }
        console.log("aaaaa", x);
    }
}
