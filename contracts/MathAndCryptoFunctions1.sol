// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

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

// Contract definition
contract MessageSigning {
    // Mapping to store signed messages by address
    mapping(address => mapping(bytes32 => bool)) public signedMessages;

    // Event to log message signed
    event MessageSigned(address indexed signer, bytes32 messageHash);

    // Function to sign a message
    function signMessage(bytes32 _messageHash) public {
        signedMessages[msg.sender][_messageHash] = true;
        emit MessageSigned(msg.sender, _messageHash);
    }

    // Function to verify if a message is signed by an address
    function isMessageSigned(address _signer, bytes32 _messageHash) public view returns (bool) {
        return signedMessages[_signer][_messageHash];
    }

    // Function to verify a message signature
    function verifySignature(bytes32 _messageHash, uint8 _v, bytes32 _r, bytes32 _s) public pure returns (address) {
        bytes32 ethSignedMessageHash = keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", _messageHash));
        return ecrecover(ethSignedMessageHash, _v, _r, _s);
    }
}