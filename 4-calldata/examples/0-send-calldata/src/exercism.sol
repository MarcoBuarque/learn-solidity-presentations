// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        IHero(hero).alert();

        bytes4 signature = bytes4(keccak256("alert()"));


        (bool success, ) = hero.call(abi.encodePacked(signature));

        require(success);


        // bytes4 memory payload = abi.encodePacked(bytes4(keccak256("alert()")));
        bytes memory payload = abi.encodeWithSignature("alert()");
        (success, ) = hero.call(payload);

        require(success);
    }
}