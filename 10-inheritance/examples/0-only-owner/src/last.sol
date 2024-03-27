// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Collectible is Ownable, Transferable {
	uint public price;

	function markPrice(uint _price) external onlyOwner {
		price = _price;
	}
}


contract Ownable {
   address owner = msg.sender;

   modifier onlyOwner {
       require(msg.sender == owner, "invalid address");
       _;
   }
}

contract Transferable {
    transfer(address newOwner) onlyOwner {
        owner = newOwner;
    }
}