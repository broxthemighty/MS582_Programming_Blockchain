// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract PanicAndError {
    // Function to demonstrate panic via assert
    function assertPanic(uint256 _a, uint256 _b) public pure returns (uint256) {
        // Assert statement to check for a condition
        assert(_b != 0);
        return _a / _b;
    }

    // Function to demonstrate error via require
    function requireError(uint256 _a, uint256 _b) public pure returns (uint256) {
        // Require statement to check for a condition
        require(_b != 0, "Division by zero");
        return _a / _b;
    }
}