// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract IdentityRegistry {
    // Structure to represent identity information
    struct Identity {
        string name;
        uint256 age;
        string email;
    }

    // Mapping to store identity information by address
    mapping(address => Identity) public identities;

    // Function to register identity
    function registerIdentity(string memory _name, uint256 _age, string memory _email) public {
        require(bytes(_name).length > 0, "Name must not be empty");
        require(_age > 0, "Age must be greater than zero");
        require(bytes(_email).length > 0, "Email must not be empty");

        identities[msg.sender] = Identity(_name, _age, _email);
    }

    // Function to get identity information of an address
    function getIdentity(address _address) public view returns (string memory, uint256, string memory) {
        Identity memory identity = identities[_address];
        require(bytes(identity.name).length > 0, "Identity not found");
        return (identity.name, identity.age, identity.email);
    }

    // Function to update identity information
    function updateIdentity(string memory _name, uint256 _age, string memory _email) public {
        Identity storage identity = identities[msg.sender];
        identity.name = _name;
        identity.age = _age;
        identity.email = _email;
    }
}