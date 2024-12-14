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

    // state variables
    IERC20 immutable token;
    address immutable owner;

    // events
    event TransferSuccess(address _to, uint256 _amount);
    event TransferFailed(address _to, uint256 _amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    // initialize the state variables
    constructor(IERC20 _token, address _owner) {
        require(address(_token) != address(0), "Token address cannot be zero");
        require(_owner != address(0), "Owner address cannot be zero");

        token = _token;
        owner = _owner;
    }
    
    // transfer tokens from contract to specific address
    function transferTokens(address _to, uint256 _amount) public {
        require(_to != address(0), "Recipient address cannot be zero");
        require(_amount > 0, "Transfer amount must be greater than zero");
        require(token.balanceOf(address(this)) >= _amount, "Insufficient token balance");

        try token.transfer(_to, _amount) {
            emit TransferSuccess(_to, _amount);
        }
        catch {
            emit TransferFailed(_to, _amount);
        }
    }

    // owner can withdraw tokens from the contract
    function withdrawTokens(uint256 _amount) public onlyOwner {
        require(_amount > 0, "Transfer amount must be greater than zero");
        require(token.balanceOf(address(this)) >= _amount, "Insufficient token balance");

        try token.transfer(owner, _amount) {
            emit TransferSuccess(owner, _amount);
        }
        catch {
            emit TransferFailed(owner, _amount);
        }
    }
 }

 /* Adding the dummy token code down here

pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
*/

/**
 * @title DummyToken
 * @dev A simple ERC20 token to test other contracts.
 */
 /*
contract DummyToken is ERC20 {
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
    }
}
*/
