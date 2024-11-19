// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

/**Created by Matt Lindborg
 * UAT MS582 Week 3
 * @title HelloWorld
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */

contract HelloWorld {

    string greeting;

    constructor() {
        greeting = "Hello World!";
    }

    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    function setGreeting(string memory _greeting) public {
        greeting = _greeting;
    }
}