// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract VotingSystem {
    // Structure to represent a candidate
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    // State variables
    mapping(address => bool) public voters; // Mapping to track eligible voters
    mapping(uint256 => Candidate) public candidates; // Mapping to store candidates
    uint256 public candidatesCount; // Counter to keep track of the number of candidates
    address public owner; // Address of the contract owner

    // Modifier to restrict access to owner-only functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to add a new candidate
    function addCandidate(string memory _name) public onlyOwner {
        candidates[candidatesCount] = Candidate(_name, 0);
        candidatesCount++;
    }

    // Function to allow eligible voters to vote for a candidate
    function vote(uint256 _candidateId) public {
        require(!voters[msg.sender], "You have already voted"); // Check if the sender has not voted already
        require(_candidateId < candidatesCount, "Invalid candidate ID"); // Check if the candidate ID is valid

        voters[msg.sender] = true; // Mark sender as voted
        candidates[_candidateId].voteCount++; // Increment the vote count for the chosen candidate
    }

    // Function to get the total votes received by a candidate
    function totalVotes(uint256 _candidateId) public view returns (uint256) {
        require(_candidateId < candidatesCount, "Invalid candidate ID"); // Check if the candidate ID is valid
        return candidates[_candidateId].voteCount;
    }
}