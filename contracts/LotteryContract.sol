// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Lottery {

    address[] participants;
    uint256 tickePrice = 2;
    uint256 ticketPurchaseDeadline; // 24 hours after contract deployment

    function buyTicket() public {
        // should cost ticketprice in eth for ticket purchase
    }

    function generateRandomNumber() public {
        /*
            use current block number, block timestamp, and contract address as inputs for randomness
            use number generated to select a winner from the participants
        */
    }

    function seletWinner() public {
        // choose a winner among the participants
    }

    function getTicketPrice() public view returns(uint256) {
        // retrieves the current ticket price
    }

    function getTicketPurchaseDeadline() public view returns(uint256) {
        // retrieves the ticket purchase deadline timestamp
    }

    function getWinner() public view returns(address) {
        // retrieves the address of the current winner
    }
}