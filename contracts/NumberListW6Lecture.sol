// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract NumberList {

    // Dynamic Array
    uint256[] public numbers;

    // Function to add number to the list
    function addNumber(uint256 _number) public {
        numbers.push(_number);
    }

    // Function to get the sum of numbers in the list
    function getSum() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    // Function to find the maximum number in the list
    function getMax() public view returns (uint256) {
        if (numbers.length == 0) {
            return 0; // Return 0 if the list is empty
        }
        uint256 max = numbers[0];
        for (uint256 i = 1; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i];
            }
        }
        return max;
    }

    // Function to remove all occurrences of a number from the list
    function removeNumber(uint256 _number) public {
        for (uint256 i = 0; i < numbers.length; i++) {
            if (numbers[i] == _number) {
                delete numbers[i];
            }
        }
    }

    // Function to clear the entire list
    function clearList() public {
        while (numbers.length > 0) {
            numbers.pop();
        }
    }
}