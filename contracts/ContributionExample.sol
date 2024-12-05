// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

// Contract definition
contract Contribution {
    // Mapping to store contributions by address
    mapping(address => uint256) public contributions;

    // Event to log contribution
    event ContributionReceived(address indexed contributor, uint256 amount);

    // Function to contribute Ether in wei
    function contributeInWei() public payable {
        contributions[msg.sender] += msg.value;
        emit ContributionReceived(msg.sender, msg.value);
    }

    // Function to contribute Ether in gwei
    function contributeInGwei(uint256 _amountInGwei) public payable {
        uint256 amountInWei = _amountInGwei * 1e9;
        contributions[msg.sender] += amountInWei;
        emit ContributionReceived(msg.sender, amountInWei);
    }

    // Function to contribute Ether in ether
    function contributeInEther(uint256 _amountInEther) public payable {
        uint256 amountInWei = _amountInEther * 1e18;
        contributions[msg.sender] += amountInWei;
        emit ContributionReceived(msg.sender, amountInWei);
    }

    // Function to get the total contribution of an address
    function getTotalContribution(address _address) public view returns (uint256) {
        return contributions[_address];
    }
}

// Contract definition
contract EventScheduler {
    // Mapping to store scheduled events by address
    mapping(address => uint256) public scheduledEvents;

    // Event to log event scheduled
    event EventScheduled(address indexed sender, uint256 timestamp);

    // Function to schedule an event after a certain duration in seconds
    function scheduleEvent(uint256 _durationInSeconds) public {
        uint256 scheduledTime = block.timestamp + _durationInSeconds;
        scheduledEvents[msg.sender] = scheduledTime;
        emit EventScheduled(msg.sender, scheduledTime);
    }

    // Function to check if the event is scheduled
    function isEventScheduled(address _address) public view returns (bool) {
        return scheduledEvents[_address] > block.timestamp;
    }

    // Function to get the scheduled time of an event
    function getScheduledTime(address _address) public view returns (uint256) {
        return scheduledEvents[_address];
    }
}