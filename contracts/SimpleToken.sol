// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0; //tells the compiler we are using solidity

/**Created by Matt Lindborg
 * UAT MS582 Week 3
 * @title SimpleToken
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

 contract SimpleToken {

    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address => uint256) public balances; //putting a number with every wallet address, to track balances
    //Event - called when a transfer is needed
    event Transfer(address indexed _from, address indexed _to, uint256 _value); //need where from, to, and amount

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply; //the person running this would be the owner, changes based on who is running it.
    }

    // function to transfer tokens to receiver
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid recipient address"); //address that is 000000000
        require(balances[msg.sender] >= _value, "Insufficient balance"); //check whether the account has enough to complete
        balances[msg.sender] -= _value; //subtracts the value from the amount the sender has
        balances[_to] += _value;
        return true;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }

 }