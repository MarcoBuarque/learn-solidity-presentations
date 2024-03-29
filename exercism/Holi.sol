// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Holi {
    uint public credits = 100;
    mapping(string => uint256) colorsDeposit;

    constructor() {
        colorsDeposit["red"] = 40;
        colorsDeposit["blue"] = 40;
        colorsDeposit["green"] = 30;
    }

    // this function is used to buy the desired colour
    function buyColour(string memory colour, uint price) public {
        if (price > credits || colorsDeposit[colour] < price) {
            revert();
        }

        colorsDeposit[colour] -= price;
        credits -= price;
    }
}