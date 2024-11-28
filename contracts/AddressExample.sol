// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract AddressExample {
    // State variables
    address public owner; // Address of the contract owner
    mapping(address => uint256) public balances; // Mapping to store balances of addresses

    // Event to log address added
    event AddressAdded(address indexed account, uint256 balance);

    // Constructor
    constructor() {
        owner = msg.sender;
    }

    // Function to add balance to an address
    function addBalance(address _account, uint256 _amount) public {
        require(msg.sender == owner, "Only the contract owner can add balance");
        balances[_account] += _amount;
        emit AddressAdded(_account, balances[_account]);
    }

    // Function to get the balance of a specific address
    function getBalance(address _account) public view returns (uint256) {
        return balances[_account];
    }

    // Function to get the balance of the contract owner
    function getOwnerBalance() public view returns (uint256) {
        return balances[owner];
    }
}