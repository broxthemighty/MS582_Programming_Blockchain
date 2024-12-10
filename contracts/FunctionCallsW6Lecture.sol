// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract FunctionCalls {
    // State variable to store a value
    uint256 public storedValue;

    // Internal function to increment the stored value
    function _increment(uint256 _value) internal {
        storedValue += _value;
    }

    // External function to decrement the stored value
    function decrement(uint256 _value) external {
        storedValue -= _value;
    }

    // External function to call the internal increment function
    function callInternalIncrement(uint256 _value) external {
        _increment(_value);
    }

    // External function to retrieve the stored value
    function getStoredValue() external view returns (uint256) {
        return storedValue;
    }
}