// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}

	Vote[] public votes;
	
	function createVote(Choices choice) external {
        if (hasVoted(msg.sender) == true) {
            revert();
        }

		votes.push(Vote(choice, msg.sender));
	}

    function changeVote(Choices choice) external {
        for (uint i = 0; i < votes.length; i++) {
            if (msg.sender == votes[i].voter) {
                votes[i].choice = choice;
                return;
            }
        }

        revert();
	}


    function findVote(address addr) internal view returns(Vote memory) {
        for (uint i = 0; i < votes.length; i++) {
            if (addr == votes[i].voter) {
                return votes[i];
            }
        }

        return Vote(Choices(0), address(0));
    }

    function hasVoted(address voterAddress) public view returns(bool) {
        Vote memory vote = findVote(voterAddress);

        if (vote.voter != address(0) && vote.voter == voterAddress) {
            return true;
        }

        return false;
    }

    function findChoice(address voterAddress) public view returns(Choices) {
        return findVote(voterAddress).choice;
    }
}