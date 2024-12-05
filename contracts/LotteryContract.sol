// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 5
 * @title LotteryContract
 * @dev participation and payout for lottery.
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract Lottery {

    // Event Outputs
    event TicketPurchased(address);
    event WinnerSelected(address);
    event PayoutFailed(address, uint256);

    // State Variables
    address[] private _participants;
    address private _winner;
    uint256 private _ticketPrice = 2 wei;
    uint256 private _ticketPurchaseDeadline; // 24 hours after contract deployment

    // Constructor sets 24 hour deadline for participation
    constructor() {
        _ticketPurchaseDeadline = block.timestamp + 24 hours;
    }

    // purchase a ticket
    function buyTicket() public payable {
        require(block.timestamp <= _ticketPurchaseDeadline, "Ticket Purchase Deadline has passed.");
        require(msg.value == _ticketPrice, "Incorrect Ether sent for ticket purchase.");

        _participants.push(msg.sender);
        emit TicketPurchased(msg.sender);
    }

    // using current block number, block timestamp, and contract address as inputs for randomness
    function generateRandomNumber() public view returns(uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.number, address(this))));
    }

    // select the _winner from _ and try to pay them
    function selectWinner() public {
        // choose a _winner among the _
        //require(block.timestamp > _, "Cannot select a _winner before the deadline.");
        require(_participants.length > 0, "No _ in the lottery.");
        require(_winner == address(0), "Winner has already been selected.");

        uint256 randomIndex = generateRandomNumber() % _participants.length;
        _winner = _participants[randomIndex];
        emit WinnerSelected(_winner);

        // transfer the total prize to the _winner
        (bool success, ) = _winner.call{value: address(this).balance}("");
        require(success, "Failed to transfer prize to the _winner.");
        emit PayoutFailed(_winner, address(this).balance);
    }

    // get the current ticket price in wei
    function getTicketPrice() public view returns(uint256) {
        return _ticketPrice;
    }

    // retrieve the ticket purchase deadline timestamp
    function getTicketPurchaseDeadline() public view returns(uint256) {
        return _ticketPurchaseDeadline;
    }
    
    // retrieve the address of the current _winner
    function getWinner() public view returns(address) {
        return _winner;
    }
}