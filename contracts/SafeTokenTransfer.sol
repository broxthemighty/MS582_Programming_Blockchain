// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

// Import the IERC20 interface from OpenZeppelin
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**Created by Matt Lindborg
 * UAT MS582 Week 6
 * @title SafeTokenTransfer
 * @dev Safe Token Transfer
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

 contract SafeTokenTransfer {
    // use try catch to handle errors like insufficient balance
    // or failed transfers

    IERC20 token;
    address owner;

    constructor() {
        // initilize the state variables
    }

    function transferTokens(address _to, uint256 _amount) public {
        // transfer tokens from contract to specific address
        // use a try catch to handle any errors
    }

    function withdrawTokens(uint256 _amount) public {
        // owner can withdraw tokens from the contract
        // should use try catch for error handling
    }
 }