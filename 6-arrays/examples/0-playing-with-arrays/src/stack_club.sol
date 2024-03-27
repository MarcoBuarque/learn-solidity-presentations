// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
   address[] members;
    error onlyMembers(address); 


    constructor() {
        members.push(msg.sender);
    }
   

    function addMember(address addr) external onlyMember{
        members.push(addr);
    }

    function isMember(address addr) public view returns(bool){
       for (uint i = 0; i < members.length; i++) {
           if (members[i] == addr) {
               return true;
           }
       }

       return false;
    } 

    modifier onlyMember {
        if (isMember(msg.sender) == false) {
            revert onlyMembers(msg.sender);
        }
		_;
    }

   function removeLastMember() external onlyMember{

       members.pop();
   }
   
}