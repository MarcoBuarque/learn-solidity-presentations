// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract A {
    address b;

    constructor(address _b) payable {
        console.log(msg.value);
        console.log(msg.sender);
        console.logBytes4(msg.sig); // targeted function signature (no caso como é a criação do contrato e estamos no constructor, 
                                    // não estamos invocando nenhuma função do contrato)
        console.log(address(this).balance);

        console.log(_b.balance);
        b = _b;
    }

    function payHalf() external {
        uint256 balance = address(this).balance; // Balance do contrato A

        (bool success,) = b.call{value: balance / 2}("");
        require(success);


    }

    function donate(uint amount) external payable{
        if (amount < 10000) {
            payable(msg.sender).transfer(amount);
            return;
        }

        selfdestruct(payable(b));

    }
}

contract B {
    receive() external payable {}
}
