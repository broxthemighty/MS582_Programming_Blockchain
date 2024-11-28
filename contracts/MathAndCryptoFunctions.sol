// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

// Contract definition
contract MathAndCryptoFunctions {
    // Function to calculate the hash of a string using keccak256
    function calculateHash(string memory _input) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_input));
    }

    // Function to perform addition of two numbers
    function add(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a + _b;
    }

    // Function to perform subtraction of two numbers
    function subtract(uint256 _a, uint256 _b) public pure returns (uint256) {
        require(_a >= _b, "Subtraction result cannot be negative");
        return _a - _b;
    }

    // Function to perform multiplication of two numbers
    function multiply(uint256 _a, uint256 _b) public pure returns (uint256) {
        return _a * _b;
    }

    // Function to perform division of two numbers
    function divide(uint256 _a, uint256 _b) public pure returns (uint256) {
        require(_b != 0, "Division by zero");
        return _a / _b;
    }

    // Function to calculate the remainder of division of two numbers
    function remainder(uint256 _a, uint256 _b) public pure returns (uint256) {
        require(_b != 0, "Division by zero");
        return _a % _b;
    }
}