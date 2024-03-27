// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ContractTest {
    mapping(address => bool) public members;

    function addMember(address addr) external {
        members[addr] = true;
    }

    function removeMember(address addr) external {
        members[addr] = false;
    }


    function isMember(address addr) external view returns(bool) {
        return members[addr];
    }
}
contract Contract {
	struct User {
		uint balance;
		bool isActive;
	}

	mapping(address => User) public users;

	function createUser() external {
		if (users[msg.sender].isActive == true) {
			revert();
		}


		users[msg.sender] = User(100, true);
	}

	function transfer(address recipient, uint _balance) external {
		User storage userRecipient  = users[recipient];
		User storage userSender  = users[msg.sender];

		if (userRecipient.isActive == false) {
			revert();
		}

		if (userSender.isActive == false) {
			revert();
		}

		if (userSender.balance < _balance) {
			revert();
		}

		userRecipient.balance += _balance;
		userSender.balance -= _balance;
	}
}