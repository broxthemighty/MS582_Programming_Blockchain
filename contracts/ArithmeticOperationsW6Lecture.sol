// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract ArithmeticOperations {
    // Function to perform checked addition
    function safeAdd(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a && c >= b, "Safe addition overflow");
        return c;
    }

    // Function to perform unchecked addition
    function unsafeAdd(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Function to perform checked subtraction
    function safeSub(uint256 a, uint256 b) public pure returns (uint256) {
        require(a >= b, "Safe subtraction underflow");
        return a - b;
    }

    // Function to perform unchecked subtraction
    function unsafeSub(uint256 a, uint256 b) public pure returns (uint256) {
        return a - b;
    }

    // Function to perform checked multiplication
    function safeMul(uint256 a, uint256 b) public pure returns (uint256) {
        if (a == 0 || b == 0) {
            return 0;
        }
        uint256 c = a * b;
        require(c / a == b, "Safe multiplication overflow");
        return c;
    }

    // Function to perform unchecked multiplication
    function unsafeMul(uint256 a, uint256 b) public pure returns (uint256) {
        return a * b;
    }
}