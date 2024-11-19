// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 3
 * @title SimpleStorage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract SimpleStorage {

    uint256 storedData;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner.");
        _; //just keep going symbol
    }

    function set(uint256 _data) public onlyOwner {
        storedData = _data;
    }

    function get() public view returns (uint256) {
        return storedData;
    }
    
}