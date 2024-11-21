// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Contract definition
contract Auction {
    // Structure to represent a bid
    struct Bid {
        address bidder;
        uint256 amount;
    }

    // State variables
    address public auctioneer; // Address of the auctioneer
    uint256 public highestBid; // Current highest bid amount
    address public highestBidder; // Address of the highest bidder
    mapping(address => uint256) public bids; // Mapping to store bids of participants
    bool public ended; // Flag indicating if the auction has ended

    // Event to log bidding activity
    event BidPlaced(address indexed bidder, uint256 amount);
    event AuctionEnded(address winner, uint256 amount);

    // Modifier to ensure the auction is still ongoing
    modifier auctionOngoing() {
        require(!ended, "Auction has ended");
        _;
    }

    // Constructor to initialize the auction
    constructor() {
        auctioneer = msg.sender;
        highestBid = 0;
        highestBidder = address(0);
        ended = false;
    }

    // Function to place a bid
    function placeBid(uint256 _amount) public payable auctionOngoing { //function is able to recieve ether with payable
        require(_amount > highestBid, "Bid must be higher than current highest bid");

        // Refund previous bidder
        if (highestBidder != address(0)) {
            payable(highestBidder).transfer(highestBid);
        }

        highestBid = _amount;
        highestBidder = msg.sender;
        bids[msg.sender] = _amount;

        emit BidPlaced(msg.sender, _amount);
    }

    // Function to end the auction and declare the winner
    function endAuction() public {
        require(msg.sender == auctioneer, "Only the auctioneer can end the auction");

        ended = true;

        emit AuctionEnded(highestBidder, highestBid);
    }

    // Function to withdraw a bid
    function withdrawBid() public {
        require(msg.sender != highestBidder, "Cannot withdraw bid as you are the highest bidder");
        require(bids[msg.sender] > 0, "No bid to withdraw");

        uint256 amount = bids[msg.sender];
        bids[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    // Function to get the balance of the contract
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}