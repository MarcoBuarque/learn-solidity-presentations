// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Example {
    // fixed size array
    uint256[3] favoriteNumbers;
    uint256[] allNumbers;
    uint[] public evenNumbers;

    constructor() {
      
        allNumbers.push(1); // só podemos usar push para arrays com alocação dinâmica
        allNumbers.push(2);
        allNumbers.push(3);
        allNumbers.push(4);
        allNumbers.push(5);

        for (uint i = 0; i < allNumbers.length; i++) {
            console.log(allNumbers[i]); // 1
        }

        allNumbers.pop();
        allNumbers.pop();
        allNumbers.pop();
         for (uint i = 0; i < allNumbers.length; i++) {
            console.log(allNumbers[i]); // 1
        }

        modifyArrayMemory(favoriteNumbers);
        console.log(favoriteNumbers[0]); // 0
        console.log(favoriteNumbers[1]); // 0


        // passing it to modifyArray
        modifyArray(favoriteNumbers);

        console.log(favoriteNumbers[0]); // 22
        console.log(favoriteNumbers[1]); // 23

        // this.modifyArrayCalldata(favoriteNumbers);
    }

    function modifyArray(uint256[3] storage nums) private {
        nums[0] = 22;
        nums[1] = 23;
    }

    function modifyArrayMemory(uint256[3] memory nums) internal pure {
        nums[0] = 22;
        nums[1] = 23;
    }

    // function modifyArrayCalldata(uint256[3] calldata nums) external pure{
    //     console.log(nums[0]); // 22
    //     console.log(nums[1]); // 23
    // }

    function sum(uint[5] memory nums) external pure returns(uint256){
        uint total = 0;
        for(uint i = 0; i < nums.length; i++) {
            total += nums[i];
        }

        return total;
    }

    function filterEven(uint[] calldata nums) external {
        for(uint i = 0; i < nums.length; i++) {
            if (nums[i] % 2 == 0) {
               evenNumbers.push(nums[i]); 
            }
        }
    }

    uint x = 5;

	function createArray() view external {
		address[] memory addresses = new address[](x);
		console.log( addresses.length ); // 5
	} 

     function createDynamicEvenArr(uint[] calldata numbers) 
        external 
        pure 
        returns(uint[] memory) 
    {
        // find the number of elements over 5
		uint elements;
		for(uint i = 0; i < numbers.length; i++) {
			if(numbers[i] % 2 == 0) {
                elements++;
            }
		}

        // create a new array with this size
		uint[] memory filtered = new uint[](elements);
        // keep an index for the positions we have filled
		uint filledIndex = 0;
		for(uint i = 0; i < numbers.length; i++) {
			if(numbers[i] % 2 == 0) {
				filtered[filledIndex] = numbers[i];
				filledIndex++;
			}
		}
		return filtered;
	}
}
