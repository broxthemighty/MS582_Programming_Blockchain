// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 4
 * @title ValueTypeExample
 * @dev examples of value types
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

 // Contract definition
contract ValueTypeExample {
    // State variables
    uint256 public intValue; // Unsigned integer
    int256 public signedIntValue; // Signed integer
    string public stringValue; // String
    bool public boolValue; // Boolean
    address public addressValue; // Ethereum address
    bytes32 public bytes32Value; // Fixed-size byte array
    uint256[3] public fixedSizeArray; // Fixed-size array

    // Constructor
    constructor() {
        intValue = 123;
        signedIntValue = -456;
        stringValue = "Hello, Solidity!";
        boolValue = true;
        addressValue = msg.sender;
        bytes32Value = keccak256(abi.encodePacked("Solidity"));
        fixedSizeArray = [1, 2, 3];
    }

    // Function to update the values
    function updateValues(uint256 _newValue, bool _newBoolValue) public {
        intValue = _newValue;
        boolValue = _newBoolValue;
    }
}
