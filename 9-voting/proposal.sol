// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        mapping(address => bool) votedYes;
        uint noCount;
        mapping(address => bool) votedNo;  
        bool isActive;
    }
    
    Proposal[] public proposals;
    mapping(address => bool) public members;

    error OnlyMembers(address);

    event ProposalCreated(uint indexed proposalID);
    event VoteCast(uint indexed proposalID, address indexed voter);

    constructor(address[] memory _members) {
        for (uint i = 0; i < _members.length; i++) {
            members[_members[i]] = true;
        }
    }

    modifier isMember {
        if (!members[msg.sender]) {
            revert OnlyMembers(msg.sender);
        }
        _;
    }

    function newProposal(address addr, bytes calldata data) external isMember {
        Proposal storage proposal = proposals.push();
        proposal.target = addr;
        proposal.data = data;
        proposal.isActive = true;

        emit ProposalCreated(proposals.length - 1);
    }

    function castVote(uint proposalID, bool voteType) external isMember {
        Proposal storage p = proposals[proposalID];

        if (voteType) {
            require(!p.votedYes[msg.sender], "Voting: Already voted yes");
            
            if (p.votedNo[msg.sender]) {
                p.noCount--;
                p.votedNo[msg.sender] = false;
            }

            p.votedYes[msg.sender] = true;
            p.yesCount++;

            if (p.yesCount >= 10 && p.isActive) {
                p.isActive = false;
                (bool success, ) = p.target.call(p.data);
                require(success, "call target contract failed");
            }
        } else {
            require(!p.votedNo[msg.sender], "Voting: Already voted no");

            if (p.votedYes[msg.sender]) {
                p.yesCount--;
                p.votedYes[msg.sender] = false;
            }

            p.votedNo[msg.sender] = true;
            p.noCount++;
        }

        emit VoteCast(proposalID, msg.sender);
    }
}
